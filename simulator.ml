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
             | Negq -> let r = mul a (-1L) in
                        {value = r.value; overflow = (a = Int64.min_int)}
             | Notq -> ok (Int64.lognot a)) in
  write_res m res.value res_addr;
  if opcode <> Notq then set_flags m res.value res.overflow;
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
  let effective_address = 
    (match ind with
    | Ind3 (Lit n, r) -> Int64.add (m.regs.(rind r)) n
    | Ind2 r -> m.regs.(rind r)
    | Ind1 (Lit n) -> n
    | _ -> failwith "leaq: unsupported addressing mode (reg or imm)"
    ) in
    (match dst with
    | Reg r -> m.regs.(rind r) <- effective_address
    | _ -> write_res m effective_address (op_to_mem m dst)
    (* | _ -> failwith "leaq: destination must be register? IS that true? TODO!!!" *)
    );
    m.regs.(rind Rip) <- Int64.add m.regs.(rind Rip) ins_size


let set_flags_sarq (m:mach) (res:quad) (amt: int) =
  if amt <> 0 then begin
    m.flags.fs <- res < 0L;
    m.flags.fz <- res = 0L;
    (* Leave overflow unchanged *)
    if amt = 1 then m.flags.fo <- false
  end

let set_flags_shlq (m:mach) (res:quad) (orig_val:quad) (amt: int) =
  if amt <> 0 then begin
    m.flags.fs <- res < 0L;
    m.flags.fz <- res = 0L;
    (* Leave overflow unchanged unless amt = 1*)
    if amt = 1 then begin
      let msb = Int64.to_int (Int64.logand (Int64.shift_right_logical orig_val 63) 1L) in
      let msb2 = Int64.to_int (Int64.logand (Int64.shift_right_logical orig_val 62) 1L) in
      m.flags.fo <- msb <> msb2
    end
  end

let set_flags_shrq (m:mach) (res:quad) (orig_val) (amt: int) =
  if amt <> 0 then begin
    m.flags.fs <- (Int64.logand (Int64.shift_right res 63) 1L) = 1L;
    m.flags.fz <- res = 0L;
    (* Leave overflow unchanged unless amt = 1*)
    if amt = 1 then m.flags.fo <- (Int64.logand (Int64.shift_right orig_val 63) 1L) = 1L
  end



let shift_ins (m:mach) (inst:ins) : unit =
  let opcode, [amt; dst] = inst in
  let amount = Int64.to_int(op_to_val m amt)in
  let dst_addr = op_to_mem m dst in
  let dst_val = op_to_val m dst in
  let ov = if amount = 0 then false else m.flags.fo in
  let res = (match opcode with
             | Sarq -> let res' = Int64.shift_right dst_val amount in (set_flags_sarq m res' amount); res'
             | Shlq -> let res' = Int64.shift_left dst_val amount in (set_flags_shlq m res' dst_val amount);res'
             | Shrq -> let res' = Int64.shift_right_logical dst_val amount in (set_flags_shrq m res' dst_val amount);res'
             ) in
  write_res m res dst_addr;
  m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (ins_size)

let jmp_ins (m:mach) (inst:ins) (cond:cnd option): unit =
  let _, [src] = inst in
  let src_addr: quad = op_to_val m src in
  (match cond with
  | None     -> (* basic jump instruction*)
                m.regs.(rind Rip) <- src_addr
  | Some cnd -> (* conditional jump*)
                if interp_cnd m.flags cnd then
                  m.regs.(rind Rip) <- src_addr
                else
                  (* Increment Rip i.e fallthrough *)
                  m.regs.(rind Rip) <- Int64.add m.regs.(rind Rip) ins_size
  )
 let cmp_ins (m:mach) (inst:ins) : unit =
 let opcode, [src1; src2] = inst in
  let a = op_to_val m src1 in
  let b = op_to_val m src2 in
  let res = sub b a in
  set_flags m res.value res.overflow;
  m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (ins_size)
             
let setb_ins (m:mach) (inst:ins) (n:cnd) : unit =
 let opcode, [dst] = inst in
  let dst_addr = op_to_mem m dst in
  let cnd = interp_cnd m.flags n in
  let value: int64 = if cnd then 1L else 0L in
  (match dst_addr with
  | RegAddr r   -> let reg_to_change = m.regs.(rind r) in
                   (* Set lowest byte:  *)
                   let masked: int64 = Int64.logand reg_to_change 0xFFFFFFFFFFFFFF00L in
                   m.regs.(rind r) <- Int64.logor masked value

  | MemAddr mem -> let idx = get_addr mem in
                   m.mem.(idx) <- Byte (Char.chr (Int64.to_int value))
  );
  m.regs.(rind Rip) <- Int64.add m.regs.(rind Rip) ins_size
  
let fun_ins (m:mach) (inst:ins) : unit = 
  let opcode, operands = inst in
  (match opcode with 
  | Retq ->  let rsp = m.regs.(rind Rsp) in
             let start_idx = get_addr rsp in
             let dst_addr = RegAddr Rip in
             if start_idx + 7 >= Int64.to_int mem_top then raise X86lite_segfault;
             let bytes_to_read = List.init 8 (fun i -> m.mem.(start_idx + i)) in
             let value = int64_of_sbytes bytes_to_read in
             (* write_res m value dst_addr; *)
             m.regs.(rind Rip) <- value;
             m.regs.(rind Rsp) <- Int64.add rsp ins_size
  | Callq ->  let [src] = operands in
              let rip_val = mem_to_val m (RegAddr Rip) in 
              let rsp_old = m.regs.(rind Rsp) in
              let rsp_new = Int64.sub rsp_old ins_size in
              let src_val = op_to_val m src in
              let rip_next = Int64.add m.regs.(rind Rip) ins_size in
              m.regs.(rind Rsp) <- rsp_new;
              write_res m rip_next (MemAddr rsp_new);
              (* Push next addres i.e curr Rip + 8 *)
              (* write_res m src_val (RegAddr Rip) *)
              m.regs.(rind Rip) <- src_val
  )  

let step (m:mach) : unit = 
  let rip_ins = m.mem.(get_addr m.regs.(rind Rip)) in
    (begin match rip_ins with
    | InsB0 (opcode, operands) -> (match opcode with
                                   | Addq | Subq | Imulq | Orq | Xorq | Andq ->  (arith_ins m (opcode, operands))
                                   | Incq | Decq | Negq | Notq -> arith_one_ins m (opcode, operands)
                                   | Movq | Pushq | Popq -> data_ins m (opcode, operands) 
                                   | Leaq -> leaq_ins m (opcode, operands)
                                   | Shlq | Sarq | Shrq -> shift_ins m (opcode, operands)
                                   | Jmp -> jmp_ins m (opcode, operands) None
                                   | J n -> jmp_ins m (opcode, operands) (Some n)
                                   | Cmpq -> cmp_ins m (opcode, operands)
                                   | Set n -> setb_ins m (opcode, operands) n
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

(* Mapping Strings to values *)
module StringMap = Map.Make(String) 


let size_of_data = function 
  | Quad _ -> 8L (* Assuming every quad (even of Lbl is 8 bytes max)*)
  | Asciz str -> Int64.of_int (String.length str + 1)
 
let length_of_asm (e:asm): quad =
  match e with
  | Text ls -> Int64.of_int (List.length ls)
  (* This is trickier  due to asciz and quad sizes*)
  | Data ls -> List.fold_left (fun acc d -> Int64.add acc (size_of_data d)) 0L ls

(* alternatively: (str * quad ) list instead of map. But I like map *)
let build_symbol_table (p:prog): quad StringMap.t = 
  (* iterate over all data segments and find label declarations -> map (count correctly) absolute address*)
  let map: quad StringMap.t = StringMap.empty in
  let rec recursive_builder (p: elem list) (acc: quad StringMap.t) (addr:quad): quad StringMap.t = 
    match p with
    | [] -> acc
    | e::xs -> (match (StringMap.find_opt e.lbl acc) with
               | Some _  -> raise (Redefined_sym e.lbl)
               | None -> (* New label found *)
                          let numOfInstrInElem = length_of_asm e.asm in
                          let new_acc = acc |> StringMap.add e.lbl addr in
                          recursive_builder xs new_acc (Int64.add addr (Int64.mul 8L numOfInstrInElem))
               )
  in recursive_builder p map mem_bot
  

let is_elem_text (e:elem): bool =
  match e.asm with
  | Text _ -> true
  | _ -> false

let is_elem_data (e:elem): bool = not (is_elem_text e)

(* Text is the actual code and ... *)
  (* elem list -> ((sbyte list) * quad) *)
let concat_and_flatten_texts (p:prog): (elem list) * quad = 
  let text_elems: elem list = List.filter (is_elem_text) p in
  (* count the number of instructions for each text element *)
  let instr_lists: (ins list) list = 
                      List.map (fun e -> 
                        match e.asm with 
                        | Text ins_list -> ins_list
                        | _ -> []) text_elems in

  let all_ins: ins list = List.concat instr_lists in
  let length = Int64.mul 8L (Int64.of_int (List.length all_ins)) in
    (text_elems, length)



(* ... data are words or Labels/immediate*)
let concat_and_flatten_datas (p:prog): (elem list) * quad = 
  let data_elems: elem list = List.filter (is_elem_data) p in
  let data_lists: (data list) list = List.map (fun e -> match e.asm with | Data d -> d | _ -> []) data_elems in
  let all_data: data list = List.concat data_lists in
  let data_length = List.fold_left (fun acc d ->
    
    match d with
    | Asciz s -> String.length s + 1 + acc
    | Quad (Lit n) -> acc + 8
    | Quad i -> acc + 8 (* Quad labels will be resolved to addresses: 
                            Length will be 8 bytes max
                        *)
    ) 0 all_data in
    (data_elems, Int64.of_int data_length)

let find_main_entry (symtab: quad StringMap.t): quad =
  try 
    (StringMap.find "main" symtab) 
  with
    Not_found -> raise (Undefined_sym "main")
  

let patch_lbl (l:lbl) (symtab:quad StringMap.t): imm =
    try Lit (StringMap.find l symtab)
    with Not_found -> raise (Undefined_sym l)
let patch_operand (symtab: quad StringMap.t) (op: operand) =
  match op with
  | Imm (Lbl l) -> Imm (patch_lbl l symtab)
  | Ind1 (Lbl l) -> Ind1 (patch_lbl l symtab)
  | Ind3 (Lbl l, r) -> Ind3 (patch_lbl l symtab, r)
  | id -> id
let patch_ins (symtab: quad StringMap.t) (opcode, operands)=
  (opcode, List.map (patch_operand symtab) operands)
let patch_data (symtab: quad StringMap.t) (d:data): data = 
  match d with
  | Quad (Lbl l) -> Quad (patch_lbl l symtab)
  | id -> id

(* use symtab to replace labels present in data segments with absolute addresses *)
let resolve_labels_data (symtab: quad StringMap.t) (data_segments: elem list): elem list =
  List.map (fun d -> 
            let data_asm: data list = match d.asm with | Data dd -> dd | _ -> [] in
            let patched_data: data list = List.map (patch_data symtab) data_asm in
            let patched_DATA: asm = Data patched_data in
            {lbl = d.lbl; global = d.global; asm = patched_DATA}
           ) data_segments

let resolve_labels_text (symtab: quad StringMap.t) (text_elems: elem list): elem list =
  List.map (fun t -> 
            let text_asm: ins list = match t.asm with | Text tt -> tt | _ -> [] in
            let patched_instr: ins list = List.map (patch_ins symtab) text_asm in
            let patched_TEXT: asm = Text patched_instr in
            {lbl = t.lbl; global = t.global; asm = patched_TEXT}
           ) text_elems

  (* let addr = (match (map.find_opt e.lbl) with
            | Some x -> x 
            | None -> failwith "Invalid label found... should not happen"
            ) in*) 
             (* failwith "Continue resolving the label" *)

(* Note: labels have already been resolved. You do not care about them *)
let serialize (es: elem list): sbyte list = 
  let elem_to_sbyte_list e =
    (match e with
    | {asm = Text instr; _} -> List.concat_map sbytes_of_ins instr
    | {asm = Data d; _}     -> List.concat_map sbytes_of_data d
    ) in
List.concat_map (elem_to_sbyte_list) es


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
  (* step 1:
        - Find all text labels and concatenate them
            -> Count length of text segment
            -> 
        - --""---- data -----------""-------------
    step 2:
        - Build symbol table: map lbl to absolute address
    step3:
        - Do not forget to resolve main
        - 
    step 4:
        - we ball
   *)

  (* Two pass approach: *)

   (* start first pass*)
   (* Flatten and concat text and data *)
   let text_elems, length_txt = concat_and_flatten_texts p in
   let data_elems, length_data = concat_and_flatten_datas p in
   
   (* Compute memory layout *)
   let text_pos : quad = mem_bot in
   let data_pos : quad = Int64.add text_pos length_txt in
   let programme: prog = text_elems @ data_elems in 
   
   (* Generate symbtab *) (* second pass*)
   (* Symtab maps labels of string to absolute addresses *)
   let symbol_table : quad StringMap.t = build_symbol_table (programme) in

   (* Resolve main *) 
   let main_entry = find_main_entry symbol_table in 
   (* Resolve the labels in the newly generated exec. As text/data will be reordered the absolute values
   of addresses change -> make it dependent on the text and data_segments *)
   (* Resolver replaces labels in instructions with actual addresses*)
   let resolved_labels_data: elem list  = resolve_labels_data symbol_table data_elems in
   let resolve_labels_text: elem list = resolve_labels_text symbol_table text_elems in
   let serialized_txt: sbyte list = serialize resolve_labels_text in
   let serialized_data: sbyte list = serialize resolved_labels_data in
   {
    entry = main_entry;
    text_pos = text_pos;
    data_pos = data_pos;
    text_seg = serialized_txt;
    data_seg = serialized_data
   }

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

  (* Create empty memory *)
  let mem: sbyte array = Array.make mem_size (Byte '0') in

  (* Set register *)
  let regs: quad array = Array.make nregs 0L in
  regs.(rind Rip) <- entry;
  regs.(rind Rsp) <- Int64.sub mem_top 8L;
  
  (* Push sentinel exit_addr onto stack *)
  let addres_of_exit_sentinel = get_addr (Int64.sub mem_top 8L) in
  List.iteri (fun i byte -> mem.(addres_of_exit_sentinel + i) <- byte) (sbytes_of_int64 exit_addr);


  (* Populate memory with text and data segments : sbyte list*)
  let data_addr = get_addr data_pos in
  let inst_addr = get_addr text_pos in

  List.iteri (fun i byte -> mem.(inst_addr + i) <- byte) text_seg;
  List.iteri (fun i byte -> mem.(data_addr + i) <- byte) data_seg;

  (* Initial flags are zero *)
  let flags = {fo = false; fs = false; fz = false} in
    {flags; regs; mem}