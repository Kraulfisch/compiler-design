(* X86lite Simulator *)

(* See the documentation in the X86lite specification, available on the 
   course web pages, for a detailed explanation of the instruction
   semantics.
*)
open X86

(* simulator machine state -------------------------------------------------- *)

let mem_bot = 0x400000L          (* lowest valid address *)
let mem_top = 0x410000L          (* one past the last byte in memory *)
let mem_size = Int64.to_int (Int64.sub mem_top mem_bot)
let nregs = 17                   (* including Rip *)
let ins_size = 8L                (* assume we have a 8-byte encoding *)
let exit_addr = 0xfdeadL         (* halt when m.regs(%rip) = exit_addr *)

(* Your simulator should raise this exception if it tries to read from or
   store to an address not within the valid address space. *)
exception X86lite_segfault

(* The simulator memory maps addresses to symbolic bytes.  Symbolic
   bytes are either actual data indicated by the Byte constructor or
   'symbolic instructions' that take up eight bytes for the purposes of
   layout.

   The symbolic bytes abstract away from the details of how
   instructions are represented in memory.  Each instruction takes
   exactly eight consecutive bytes, where the first byte InsB0 stores
   the actual instruction, and the next seven bytes are InsFrag
   elements, which aren't valid data.

   For example, the two-instruction sequence:
        at&t syntax             ocaml syntax
      movq %rdi, (%rsp)       Movq,  [~%Rdi; Ind2 Rsp]
      decq %rdi               Decq,  [~%Rdi]

   is represented by the following elements of the mem array (starting
   at address 0x400000):

       0x400000 :  InsB0 (Movq,  [~%Rdi; Ind2 Rsp])
       0x400001 :  InsFrag
       0x400002 :  InsFrag
       0x400003 :  InsFrag
       0x400004 :  InsFrag
       0x400005 :  InsFrag
       0x400006 :  InsFrag
       0x400007 :  InsFrag
       0x400008 :  InsB0 (Decq,  [~%Rdi])
       0x40000A :  InsFrag
       0x40000B :  InsFrag
       0x40000C :  InsFrag
       0x40000D :  InsFrag
       0x40000E :  InsFrag
       0x40000F :  InsFrag
       0x400010 :  InsFrag
*)
type sbyte = InsB0 of ins       (* 1st byte of an instruction *)
           | InsFrag            (* 2nd - 8th bytes of an instruction *)
           | Byte of char       (* non-instruction byte *)

(* memory maps addresses to symbolic bytes *)
type mem = sbyte array

(* Flags for condition codes *)
type flags = { mutable fo : bool
             ; mutable fs : bool
             ; mutable fz : bool
             }

(* Register files *)
type regs = int64 array

(* Complete machine state *)
type mach = { flags : flags
            ; regs : regs
            ; mem : mem
            }

(* simulator helper functions ----------------------------------------------- *)

(* The index of a register in the regs array *)
let rind : reg -> int = function
  | Rip -> 16
  | Rax -> 0  | Rbx -> 1  | Rcx -> 2  | Rdx -> 3
  | Rsi -> 4  | Rdi -> 5  | Rbp -> 6  | Rsp -> 7
  | R08 -> 8  | R09 -> 9  | R10 -> 10 | R11 -> 11
  | R12 -> 12 | R13 -> 13 | R14 -> 14 | R15 -> 15

(* Helper functions for reading/writing sbytes *)

(* Convert an int64 to its sbyte representation *)
let sbytes_of_int64 (i:int64) : sbyte list =
  let open Char in 
  let open Int64 in
  List.map (fun n -> Byte (shift_right i n |> logand 0xffL |> to_int |> chr))
           [0; 8; 16; 24; 32; 40; 48; 56]

(* Convert an sbyte representation to an int64 *)
let int64_of_sbytes (bs:sbyte list) : int64 =
  let open Char in
  let open Int64 in
  let f b i = match b with
    | Byte c -> logor (shift_left i 8) (c |> code |> of_int)
    | _ -> 0L
  in
  List.fold_right f bs 0L

(* Convert a string to its sbyte representation *)
let sbytes_of_string (s:string) : sbyte list =
  let rec loop acc = function
    | i when i < 0 -> acc
    | i -> loop (Byte s.[i]::acc) (pred i)
  in
  loop [Byte '\x00'] @@ String.length s - 1

(* Serialize an instruction to sbytes *)
let sbytes_of_ins (op, args:ins) : sbyte list =
  let check = function
    | Imm (Lbl _) | Ind1 (Lbl _) | Ind3 (Lbl _, _) -> 
      invalid_arg "sbytes_of_ins: tried to serialize a label!"
    | o -> ()
  in
  List.iter check args;
  [InsB0 (op, args); InsFrag; InsFrag; InsFrag;
   InsFrag; InsFrag; InsFrag; InsFrag]

(* Serialize a data element to sbytes *)
let sbytes_of_data : data -> sbyte list = function
  | Quad (Lit i) -> sbytes_of_int64 i
  | Asciz s -> sbytes_of_string s
  | Quad (Lbl _) -> invalid_arg "sbytes_of_data: tried to serialize a label!"


(* It might be useful to toggle printing of intermediate states of your 
   simulator. Our implementation uses this mutable flag to turn on/off
   printing.  For instance, you might write something like:

     [if !debug_simulator then print_endline @@ string_of_ins u; ...]

*)
let debug_simulator = ref false

(* Interpret a condition code with respect to the given flags. *)
let interp_cnd {fo; fs; fz} : cnd -> bool = fun e ->
  match e with
  | Eq -> fz
  | Neq -> not fz
  | Lt -> fo <> fs
  | Le -> fz || (fo <> fs) 
  | Gt -> (not fz) && (fo = fs)
  | Ge -> fs = fo

(* Maps an X86lite address into Some OCaml array index,
   or None if the address is not within the legal address space. *)
let map_addr (addr:quad) : int option =
  if Int64.(addr < mem_top) && Int64.(addr >= mem_bot) then
    Some (Int64.to_int (Int64.sub addr mem_bot))
  else 
    None

let get_addr (addr:quad) : int =
  match map_addr addr with
  | Some i -> i
  | None -> raise X86lite_segfault

(* Simulates one step of the machine:
    - fetch the instruction at %rip
    - compute the source and/or destination information from the operands
    - simulate the instruction semantics
    - update the registers and/or memory appropriately
    - set the condition flags
*)
open Int64_overflow

type addr = RegAddr of reg | MemAddr of quad

let write_res (m:mach) (res:int64) (res_addr:addr) : unit =
  let res_sbyte = sbytes_of_int64 res in 
  match res_addr with
  | RegAddr r -> m.regs.(rind r) <- res
  | MemAddr add -> 
      let start_idx = get_addr add in
      List.iteri (fun i sbyte -> m.mem.(start_idx + i) <- sbyte) res_sbyte
let op_to_mem (m:mach) (op:operand) : addr =
  match op with
  | Imm (Lit n) -> MemAddr n
  | Reg r -> RegAddr r
  | Ind1 (Lit n) -> MemAddr n
  | Ind2 r -> MemAddr (m.regs.(rind r))
  | Ind3 (Lit n, r) -> MemAddr (Int64.add (m.regs.(rind r)) n)
  | _ -> failwith "Cannot dereference address"

let mem_to_val (m:mach) (a:addr) : quad = 
  match a with
  | RegAddr r -> m.regs.(rind r)
  | MemAddr n -> let start_idx = get_addr n in
                  if start_idx + 7 >= mem_size then raise X86lite_segfault;
                  let sbytes_to_read = List.init 8 (fun i -> m.mem.(start_idx + i)) in
                  int64_of_sbytes sbytes_to_read

let op_to_val (m:mach) (op:operand) : quad =
  match op with
  | Imm (Lit n) -> n
  | _ -> let addr = op_to_mem m op in mem_to_val m addr


let set_flags (m:mach) (res:quad) (overflow:bool) : unit = 
  (m.flags.fz <- res = 0L;
  m.flags.fs <- res < 0L;
  m.flags.fo <- overflow;)

let arith_ins (m:mach) (inst:ins) : unit =
  let opcode, [src; dst] = inst  in (* src, dst are Operands*)
  let res_addr = op_to_mem m dst in  (* Store result in DESTINATION *)
  let a = op_to_val m src in
  let b = op_to_val m dst in
  let res = (match opcode with 
             | Addq -> add a b
             | Subq -> sub b a
             | Imulq -> mul a b
             | Orq -> ok (Int64.logor a b)
             | Xorq -> ok (Int64.logxor a b)
             | Andq -> ok (Int64.logand a b)) in 
  write_res m res.value res_addr;
  set_flags m res.value res.overflow;
  m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (ins_size)
let arith_one_ins (m:mach) (inst:ins) : unit = 
  let opcode, [dst] = inst in
  let res_addr = op_to_mem m dst in
  let a = op_to_val m dst in
  let res = (match opcode with
             | Incq -> add a 1L
             | Decq -> sub a 1L
             | Negq -> mul a (-1L)
             | Notq -> ok (Int64.lognot a)) in
  write_res m res.value res_addr;
  set_flags m res.value res.overflow;
  m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (ins_size)
let data_ins (m:mach) (inst:ins) : unit = 
  let opcode, operands = inst in
   (match opcode with
   | Movq -> let [src; dst] = operands in 
             let dst_addr = op_to_mem m dst in
             let src_val = op_to_val m src in
             write_res m src_val dst_addr
   | Pushq -> let [src] = operands in 
              let src_val = op_to_val m src in 
              let rsp_old = m.regs.(rind Rsp) in
              let rsp_new = Int64.sub rsp_old ins_size in
              m.regs.(rind Rsp) <- rsp_new;
              write_res m src_val (MemAddr rsp_new)
   | Popq -> let [dst] = operands in
             let rsp = m.regs.(rind Rsp) in
             let start_idx = get_addr rsp in
             let dst_addr = op_to_mem m dst in
             if start_idx + 7 >= Int64.to_int mem_top then raise X86lite_segfault;
             let bytes_to_read = List.init 8 (fun i -> m.mem.(start_idx + i)) in
             let value = int64_of_sbytes bytes_to_read in
             write_res m value dst_addr;
             m.regs.(rind Rsp) <- Int64.add rsp ins_size);

  m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (ins_size)
let leaq_ins (m:mach) (inst:ins) : unit =
  let opcode, [ind; dst] = inst in 
  let lea_addr = op_to_mem m ind in 
  let dst_addr = op_to_mem m dst in
  (match lea_addr with
  | MemAddr mem -> write_res m mem dst_addr
  | RegAddr r -> failwith "Lea without ind operator")
let shift_ins (m:mach) (inst:ins) : unit =failwith ("TODO shift ")
let jmp_ins (m:mach) (inst:ins) : unit =failwith ("TODO jmp ")
let cmp_ins (m:mach) (inst:ins) : unit =failwith ("TODO cmp ")
let fun_ins (m:mach) (inst:ins) : unit =failwith ("TODO fun ")

  
let string_of_cnd = function
  | Eq -> "Eq" | Neq -> "Neq" | Lt -> "Lt" | Le -> "Le" | Gt -> "Gt" | Ge -> "Ge"

let string_of_opcode = function
  | Movq -> "Movq"
  | Pushq -> "Pushq"
  | Popq -> "Popq"
  | Leaq -> "Leaq"
  | Incq -> "Incq"
  | Decq -> "Decq"
  | Negq -> "Negq"
  | Notq -> "Notq"
  | Addq -> "Addq"
  | Subq -> "Subq"
  | Imulq -> "Imulq"
  | Xorq -> "Xorq"
  | Orq -> "Orq"
  | Andq -> "Andq"
  | Shlq -> "Shlq"
  | Sarq -> "Sarq"
  | Shrq -> "Shrq"
  | Jmp -> "Jmp"
  | J c -> "J(" ^ string_of_cnd c ^ ")"
  | Cmpq -> "Cmpq"
  | Set c -> "Set(" ^ string_of_cnd c ^ ")"
  | Callq -> "Callq"
  | Retq -> "Retq"



let step (m:mach) : unit = 
  let rip_ins = m.mem.(get_addr m.regs.(rind Rip)) in
    (begin match rip_ins with
    | InsB0 (opcode, operands) -> (match opcode with
                                   | Addq | Subq | Imulq | Orq | Xorq | Andq ->  (arith_ins m (opcode, operands))
                                   | Incq | Decq | Negq | Notq -> arith_one_ins m (opcode, operands)
                                   | Movq | Pushq | Popq -> data_ins m (opcode, operands) 
                                   | Leaq -> leaq_ins m (opcode, operands)
                                   | Shlq | Sarq | Shrq -> shift_ins m (opcode, operands)
                                   | Jmp -> jmp_ins m (opcode, operands)
                                   | J n -> jmp_ins m (opcode, operands)
                                   | Cmpq -> cmp_ins m (opcode, operands)
                                   | Set n -> cmp_ins m (opcode, operands)
                                   | Callq | Retq -> fun_ins m (opcode, operands) )
    | InsFrag -> failwith "Unexpected instruction fragment"
    | Byte c -> failwith "RIP points to Byte" end)

    

(* Runs the machine until the rip register reaches a designated
   memory address. Returns the contents of %rax when the 
   machine halts. *)
let run (m:mach) : int64 = 
  while m.regs.(rind Rip) <> exit_addr do step m done;
  m.regs.(rind Rax)

(* assembling and linking --------------------------------------------------- *)

(* A representation of the executable *)
type exec = { entry    : quad              (* address of the entry point *)
            ; text_pos : quad              (* starting address of the code *)
            ; data_pos : quad              (* starting address of the data *)
            ; text_seg : sbyte list        (* contents of the text segment *)
            ; data_seg : sbyte list        (* contents of the data segment *)
            }

(* Assemble should raise this when a label is used but not defined *)
exception Undefined_sym of lbl

(* Assemble should raise this when a label is defined more than once *)
exception Redefined_sym of lbl

(* Convert an X86 program into an object file:
   - separate the text and data segments
   - compute the size of each segment
      Note: the size of an Asciz string section is (1 + the string length)
            due to the null terminator

   - resolve the labels to concrete addresses and 'patch' the instructions to 
     replace Lbl values with the corresponding Imm values.

   - the text segment starts at the lowest address
   - the data segment starts after the text segment

  HINT: List.fold_left and List.fold_right are your friends.
 *)
let assemble (p:prog) : exec =
failwith "assemble unimplemented"

(* Convert an object file into an executable machine state. 
    - allocate the mem array
    - set up the memory state by writing the symbolic bytes to the 
      appropriate locations 
    - create the inital register state
      - initialize rip to the entry point address
      - initializes rsp to the last word in memory 
      - the other registers are initialized to 0
    - the condition code flags start as 'false'

  Hint: The Array.make, Array.blit, and Array.of_list library functions 
  may be of use.
*)
let load {entry; text_pos; data_pos; text_seg; data_seg} : mach = 
failwith "load unimplemented"
