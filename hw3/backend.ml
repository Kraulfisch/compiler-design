(* USAGE OF AI:
  We used AI to help with syntax of Ocaml,
  explain and clarify methods and tasks and brainstorming for ideas
*)

(* ll ir compilation -------------------------------------------------------- *)

open Ll
open X86

(* Overview ----------------------------------------------------------------- *)

(* We suggest that you spend some time understanding this entire file and
   how it fits with the compiler pipeline before making changes.  The suggested
   plan for implementing the compiler is provided on the project web page.
*)


(* helpers ------------------------------------------------------------------ *)

(* Map LL comparison operations to X86 condition codes *)
let compile_cnd = function
  | Ll.Eq  -> X86.Eq
  | Ll.Ne  -> X86.Neq
  | Ll.Slt -> X86.Lt
  | Ll.Sle -> X86.Le
  | Ll.Sgt -> X86.Gt
  | Ll.Sge -> X86.Ge



(* locals and layout -------------------------------------------------------- *)

(* One key problem in compiling the LLVM IR is how to map its local
   identifiers to X86 abstractions.  For the best performance, one
   would want to use an X86 register for each LLVM %uid.  However,
   since there are an unlimited number of %uids and only 16 registers,
   doing so effectively is quite difficult.  We will see later in the
   course how _register allocation_ algorithms can do a good job at
   this.

   A simpler, but less performant, implementation is to map each %uid
   in the LLVM source to a _stack slot_ (i.e. a region of memory in
   the stack).  Since LLVMlite, unlike real LLVM, permits %uid locals
   to store only 64-bit data, each stack slot is an 8-byte value.

   [ NOTE: For compiling LLVMlite, even i1 data values should be represented
   in 64 bit. This greatly simplifies code generation. ]

   We call the datastructure that maps each %uid to its stack slot a
   'stack layout'.  A stack layout maps a uid to an X86 operand for
   accessing its contents.  For this compilation strategy, the operand
   is always an offset from %rbp (in bytes) that represents a storage slot in
   the stack.
*)

type layout = (uid * X86.operand) list

(* A context contains the global type declarations (needed for getelementptr
   calculations) and a stack layout. *)
type ctxt = { tdecls : (tid * ty) list
            ; layout : layout
            }

(* useful for looking up items in tdecls or layouts *)
let lookup m x = List.assoc x m


(* compiling operands  ------------------------------------------------------ *)

(* LLVM IR instructions support several kinds of operands.

   LL local %uids live in stack slots, whereas global ids live at
   global addresses that must be computed from a label.  Constants are
   immediately available, and the operand Null is the 64-bit 0 value.

     NOTE: two important facts about global identifiers:

     (1) You should use (Platform.mangle gid) to obtain a string
     suitable for naming a global label on your platform (OS X expects
     "_main" while linux expects "main").

     (2) 64-bit assembly labels are not allowed as immediate operands.
     That is, the X86 code: movq _gid %rax which looks like it should
     put the address denoted by _gid into %rax is not allowed.
     Instead, you need to compute an %rip-relative address using the
     leaq instruction:   leaq _gid(%rip).

   One strategy for compiling instruction operands is to use a
   designated register (or registers) for holding the values being
   manipulated by the LLVM IR instruction. You might find it useful to
   implement the following helper function, whose job is to generate
   the X86 instruction that moves an LLVM operand into a designated
   destination (usually a register).
*)
let compile_operand (ctxt:ctxt) (dest:X86.operand) : Ll.operand -> ins = function
| Null    -> (Movq, [Imm (Lit 0L); dest])
| Const c -> (Movq, [Imm (Lit c); dest])
| Gid g   -> (Leaq, [Ind3 (Lbl (Platform.mangle g), Rip); dest])
| Id u    -> (Movq, [lookup ctxt.layout u; dest])



(* compiling call  ---------------------------------------------------------- *)

(* You will probably find it helpful to implement a helper function that
   generates code for the LLVM IR call instruction.

   The code you generate should follow the x64 System V AMD64 ABI
   calling conventions, which places the first six 64-bit (or smaller)
   values in registers and pushes the rest onto the stack.  Note that,
   since all LLVM IR operands are 64-bit values, the first six
   operands will always be placed in registers.  (See the notes about
   compiling fdecl below.)

   [ NOTE: It is the caller's responsibility to clean up arguments
   pushed onto the stack, so you must free the stack space after the
   call returns. ]

   [ NOTE: Don't forget to preserve caller-save registers (only if
   needed). ]
*)

let compile_call (ctxt:ctxt) (dst_operand: X86.operand) (op: Ll.operand) (args: (Ll.ty * Ll.operand) list) (fun_ret_type:ty) =
  (* Step by step idea:  
    push_stack_args @ -> first 6 args into registers, then 7+ into stack locations via step 2
    (move_to_regs @    -> use ctxt.layout) --- just no
    align_stack @     -> don't screw up
    call_insn @       -> perform call
    cleanup_stack @   -> move rsp back to where it was
    store_result      -> write back to dst_operand whatever is in rax (returned from the call)
  *)

  let arg_regs = [Rdi; Rsi; Rdx; Rcx; R08; R09] in
  let num_args = List.length args in
  let num_stack_args = max ((List.length args) - 6) 0 in

  let push_stack_args =
    if num_stack_args > 0 then
      let rec push_from i acc =
        if i < 6 then acc
        else
          let (_, arg_op) = List.nth args i in
            push_from (i - 1) (acc @ [compile_operand ctxt (Reg Rax) arg_op; (Pushq, [Reg Rax])])      in
      push_from (num_args - 1) []
    else []
  in


  (* let push_stack_args =
    if num_stack_args = 0 then []
    else
      let rec loop i acc =
        if i < 6 then acc
        else
          let (_, arg_op) = List.nth args i in
          (* compile_operand -> produces an instruction that sets Rax to arg value
             (adapt if your compile_operand returns multiple ins) *)
          let instr_for_arg = compile_operand ctxt (Reg Rax) arg_op in
          let acc' = instr_for_arg :: (Pushq, [Reg Rax]) :: acc in
          loop (i - 1) acc'
      in
      List.rev (loop (num_args - 1) [])
  in *)

  let move_to_regs =
    let rec loop i acc =
      if i >= (min 6 num_args) then List.rev acc
      else
        let (_, arg_op) = List.nth args i in
        let reg = List.nth arg_regs i in
        let ins = compile_operand ctxt (Reg reg) arg_op in
        loop (i + 1) (ins :: acc)
    in
    loop 0 []
  in

  let setup_args = push_stack_args @ move_to_regs in

  (* let setup_args: ins list =
    List.concat @@ List.mapi (fun i (ty, arg_op) -> 
      if i < 6 then [compile_operand ctxt (Reg (List.nth arg_regs i)) arg_op]
      else 
        (* Push onto stack (TODO?: in reversed order?)  *)
        [
          (compile_operand ctxt (Reg Rax) arg_op);
          (Pushq, [Reg Rax])
        ]
    ) args in *)

    (* let setup_args = List.mapi (fun i (arg_ty, arg_op) ->
      match i with
        | 0 -> compile_operand ctxt (Reg Rdi) arg_op
        | 1 -> compile_operand ctxt (Reg Rsi) arg_op
        | 2 -> compile_operand ctxt (Reg Rdx) arg_op
        | 3 -> compile_operand ctxt (Reg Rcx) arg_op
        | 4 -> compile_operand ctxt (Reg R08) arg_op
        | 5 -> compile_operand ctxt (Reg R09) arg_op
        | _ -> begin match arg_op with
          | Null -> (Pushq, [Imm (Lit 0L)])
          | Const v -> (Pushq, [Imm (Lit v)])
          | Gid _ -> failwith "No label as operand allowed"
          | Id uid -> (Pushq, [lookup ctxt.layout uid])
        end)
      args
    in *)


    let align_stack, padding = 
      if num_args mod 2 = 0 then [], 0 
      (* On odd number of arguments grow stack once more to align it back to 16 bytes 
        REMEMBER: The stack grows downwards
      *)
      else [(Subq, [Imm (Lit 8L); Reg Rsp])], 8
    in
    (* perform the actual call: resolve the label and call the address *)
    (* I will assume that calls to 0x000 etc are compiled correctly but not valid (protected region) *)
    let call_ins = 
      match op with
      | Gid gid -> [(Callq, [Imm (Lbl (Platform.mangle gid))])]
      | _ -> [
      (compile_operand ctxt (Reg Rax) op);
      (Callq, [Reg Rax])
    ] in
    (* Direct gid call without leaq intermediate step done in compile_operand: *)
    (* let call_ins = match op with
      | Gid gid -> [(Callq, [Imm (Lbl (Platform.mangle gid))])]
      | _ -> [compile_operand ctxt (Reg Rax) op; (Callq, [Reg Rax])]
    in *)

    (* Remember stack alignment *)
    let total_pushed = 8 * num_stack_args + padding in
    let cleanup_stack = 
      if total_pushed = 0 then []
      else [Addq, [Imm (Lit (Int64.of_int (total_pushed))); Reg Rsp]] in
    
    let store_result = [
      (Movq, [Reg Rax; dst_operand])
    ] in

    (*push_stack_args_and_compile_to_register *) 
    setup_args
    @ align_stack @ call_ins @ cleanup_stack @ store_result





(* compiling getelementptr (gep)  ------------------------------------------- *)

(* The getelementptr instruction computes an address by indexing into
   a datastructure, following a path of offsets.  It computes the
   address based on the size of the data, which is dictated by the
   data's type.

   To compile getelementptr, you must generate x86 code that performs
   the appropriate arithmetic calculations.
*)

(* [size_ty] maps an LLVMlite type to a size in bytes.
    (needed for getelementptr)

   - the size of a struct is the sum of the sizes of each component
   - the size of an array of t's with n elements is n * the size of t
   - all pointers, I1, and I64 are 8 bytes
   - the size of a named type is the size of its definition

   - Void, i8, and functions have undefined sizes according to LLVMlite.
     Your function should simply return 0 in those cases
*)
let rec size_ty (tdecls:(tid * ty) list) (t:Ll.ty) : int =
  match t with
  | Void | I8 | Fun _ -> 0
  | Ptr _ | I1 | I64 -> 8
  | Struct (tys) -> List.fold_left (fun acc a -> acc + (size_ty tdecls a)) 0 tys
  | Array (n, ty) -> n * (size_ty tdecls ty)
  | Namedt tid -> (* tid is a named type... look up the type in the type declarations and give its size*)
                  size_ty tdecls (lookup tdecls tid)





(* Generates code that computes a pointer value.

   1. op must be of pointer type: t*

   2. the value of op is the base address of the calculation

   3. the first index in the path is treated as the index into an array
     of elements of type t located at the base address

   4. subsequent indices are interpreted according to the type t:

     - if t is a struct, the index must be a constant n and it
       picks out the n'th element of the struct. [ NOTE: the offset
       within the struct of the n'th element is determined by the
       sizes of the types of the previous elements ]

     - if t is an array, the index can be any operand, and its
       value determines the offset within the array.

     - if t is any other type, the path is invalid

   5. if the index is valid, the remainder of the path is computed as
      in (4), but relative to the type f the sub-element picked out
      by the path so far
*)
let compile_gep (ctxt:ctxt) (op : Ll.ty * Ll.operand) (path: Ll.operand list) : ins list =
  (* Helper to resolve a named type to its underlying definition *)
  let rec resolve_type t =
    match t with
    | Namedt tid -> resolve_type (lookup ctxt.tdecls tid)
    | _ -> t
  in

  (* Processes the path after the first index *)
  let rec gep_helper current_ty path_remaining acc_insns =
    match path_remaining with
    | [] -> acc_insns
    | idx_op :: rest_path ->
        let (offset_insns, next_ty) =
          match resolve_type current_ty with (* Resolve type before processing *)
          | Struct ts ->
              let idx = match idx_op with
                | Const i -> Int64.to_int i
                | _ -> failwith "GEP struct index must be a constant"
              in
              let rec sum_sizes i acc =
                if i >= idx then acc
                else sum_sizes (i + 1) (acc + size_ty ctxt.tdecls (List.nth ts i))
              in
              let offset = sum_sizes 0 0 in
              let insns = if offset <> 0 then
                [(Addq, [Imm (Lit (Int64.of_int offset)); Reg Rax])]
              else []
              in
              (insns, List.nth ts idx)

          | Array (_, elem_ty) ->
              let size = size_ty ctxt.tdecls elem_ty in
              let insns = [
                compile_operand ctxt (Reg Rcx) idx_op;
                (Imulq, [Imm (Lit (Int64.of_int size)); Reg Rcx]);
                (Addq, [Reg Rcx; Reg Rax])
              ] in
              (insns, elem_ty)

          | _ -> failwith "GEP path invalid for this type"
        in
        gep_helper next_ty rest_path (acc_insns @ offset_insns)
  in

  let base_ty, base_op = op in
  let deref_ty = match base_ty with
    | Ptr t -> t
    | _ -> failwith "GEP base must be a pointer"
  in

  let initial_insns = [compile_operand ctxt (Reg Rax) base_op] in

  match path with
  | [] -> initial_insns
  | first_idx :: rest_path ->
      (* Handle first index as array indexing *)
      let elem_size = size_ty ctxt.tdecls deref_ty in
      let first_offset = [
        compile_operand ctxt (Reg Rcx) first_idx;
        (Imulq, [Imm (Lit (Int64.of_int elem_size)); Reg Rcx]);
        (Addq, [Reg Rcx; Reg Rax])
      ] in
      initial_insns @ first_offset @ (gep_helper deref_ty rest_path [])



(* compiling instructions  -------------------------------------------------- *)

(* The result of compiling a single LLVM instruction might be many x86
   instructions.  We have not determined the structure of this code
   for you. Some of the instructions require only a couple of assembly
   instructions, while others require more.  We have suggested that
   you need at least compile_operand, compile_call, and compile_gep
   helpers; you may introduce more as you see fit.

   Here are a few notes:

   - Icmp:  the Setb instruction may be of use.  Depending on how you
     compile Cbr, you may want to ensure that the value produced by
     Icmp is exactly 0 or 1.

   - Load & Store: these need to dereference the pointers. Const and
     Null operands aren't valid pointers.  Don't forget to
     Platform.mangle the global identifier.

   - Alloca: needs to return a pointer into the stack

   - Bitcast: does nothing interesting at the assembly level
*)
let compile_insn (ctxt:ctxt) ((uid:uid), (i:Ll.insn)) : X86.ins list =
  let dst_operand: X86.operand = lookup ctxt.layout uid in
    match i with
    | Binop (bop, ty, op1, op2) -> 
      let x86opcode = (match bop with
                          | Add -> Addq 
                          | Sub -> Subq
                          | Mul -> Imulq
                          | Shl -> Shlq
                          | Lshr  -> Shrq
                          | Ashr  -> Sarq
                          | And -> Andq
                          | Or  -> Orq
                          | Xor -> Xorq
                        ) in
      (* Get the src and destination from the layout and compile them into ins *)
      [
        (compile_operand ctxt (Reg Rax) op1);
        (compile_operand ctxt (Reg Rcx) op2);
        (x86opcode, [Reg Rcx; Reg Rax]);
        (Movq, [Reg Rax; dst_operand])
      ]
    | Icmp (cnd, ty, op1, op2) -> 
      let x86_cond: X86.cnd = (match cnd with
      | Eq  -> X86.Eq
      | Ne  -> X86.Neq
      | Slt -> X86.Lt
      | Sle -> X86.Le
      | Sgt -> X86.Gt
      | Sge -> X86.Ge
      ) in
      [
        (compile_operand ctxt (Reg Rax) op1);
        (compile_operand ctxt (Reg Rcx) op2);
        (Cmpq, [Reg Rcx; Reg Rax]); (* Perform comparison*)

        (* Ensure that Icmp-result is exactly 0 or 1: *)
        (Set (x86_cond), [Reg Rax]); (* set the lowest byte accordingly then ...*)
        (Andq, [Imm (Lit 1L); Reg Rax]); (* ... set all other bits to 0 => result is exactly 0 or 1*)

        (Movq, [Reg Rax; dst_operand]) (* Write back result of comparison*)
      ]
    | Alloca (ty) -> 
      (* Allocate stack on space for the size of ty and return a pointer to this stack position *)
      (* WATCH OUT FOR STACK ALIGNMENT!!!! *)
      let size = size_ty ctxt.tdecls ty in
      let aligned_size = if size mod 16 = 0 then size else size + (16 - (size mod 16)) in
      [
        (Subq, [Imm (Lit (Int64.of_int(aligned_size))); Reg Rsp]);
        (Movq, [Reg Rsp; dst_operand])
      ]

     | Load (ty, op) -> 
      (match op with
       | Const _| Null -> failwith "Invalid pointer: Load - compile_insn"
       | _ -> [
          (compile_operand ctxt (Reg Rax) op);
          (* Now dereference the pointer *)
          (Movq, [Ind2 (Rax); Reg Rax]);
          (Movq, [Reg Rax; dst_operand])
       ]
      )

    | Store (ty, op1, op2) -> 
      (match op2 with
      | Const _ | Null -> failwith "Invalid pointer: Store - compile_insn"
      | _ -> [
        (compile_operand ctxt (Reg Rax) op1);
        (compile_operand ctxt (Reg Rcx) op2);
        (* Setting the target of OP2 to the value of OP1 *) 
        (Movq, [Reg Rax; Ind2 (Rcx)]);

      ]
      )
    | Call (ty, op, args) -> compile_call ctxt dst_operand op args ty
    | Bitcast (ty1, op, ty2) -> 
      [
        (compile_operand ctxt (Reg Rax) op);
        (Movq, [Reg Rax; dst_operand])
      ]
    | Gep (ty, op, ops) -> let gep_insns = compile_gep ctxt (ty, op) ops in
      gep_insns @ [(Movq, [Reg Rax; dst_operand])]



(* compiling terminators  --------------------------------------------------- *)

(* prefix the function name [fn] to a label to ensure that the X86 labels are
   globally unique . *)
let mk_lbl (fn:string) (l:string) = fn ^ "." ^ l

(* Compile block terminators is not too difficult:

   - Ret should properly exit the function: freeing stack space,
     restoring the value of %rbp, and putting the return value (if
     any) in %rax.

   - Br should jump

   - Cbr branch should treat its operand as a boolean conditional

   [fn] - the name of the function containing this terminator
*)
let compile_terminator (fn:string) (ctxt:ctxt) (t:Ll.terminator) : ins list =
  match t with
  | Ret (lltype, Some op) -> 
    [
     (compile_operand ctxt (Reg Rax) op);
      (* tear down stackframe *)
     (Movq, [Reg Rbp; Reg Rsp]); (* Moves the value of rbp into rsp to bring down the stack *)
     (Popq, [Reg Rbp]); (* Get the return address *)
     (Retq, [])
    ]
  | Ret (lltype, None) -> 
    (* No operand given: simply tear down stack frame *)
      [
        (Movq, [Reg Rbp; Reg Rsp]); (* Moves the value of rbp into rsp to bring down the stack *)
        (Popq, [Reg Rbp]); (* Get the return address *)
        (Retq, [])
      ]
  | Br (l) -> [(Jmp, [Imm (Lbl (mk_lbl fn l))])]
  | Cbr (op, l1, l2) -> 
    (* High level idea: if op is true then jump to l1 else to l2 *)
    [
      (compile_operand ctxt (Reg Rax) op);
      (Cmpq, [Imm (Lit 1L); Reg Rax]); (* Set flags OF, ZF, SF according to operation*)
      (J Eq, [Imm (Lbl (mk_lbl fn l1))]); (* Jump to l1 if op is true *)
      (Jmp, [Imm (Lbl (mk_lbl fn l2))]) (* Else jump to l2*)
    ]

(* compiling blocks --------------------------------------------------------- *)

(* We have left this helper function here for you to complete. 
   [fn] - the name of the function containing this block
   [ctxt] - the current context
   [blk]  - LLVM IR code for the block
*)
let compile_block (fn:string) (ctxt:ctxt) (blk:Ll.block) : ins list =
  (* idea: go through instructions of the block and compile them *)
  let inslist: ins list = List.concat_map (compile_insn ctxt) blk.insns in
  let term: Ll.terminator = blk.term |> snd in
  let compiled: ins list = compile_terminator fn ctxt term in
  inslist @ compiled



let compile_lbl_block fn lbl ctxt blk : elem =
  Asm.text (mk_lbl fn lbl) (compile_block fn ctxt blk)



(* compile_fdecl ------------------------------------------------------------ *)


(* This helper function computes the location of the nth incoming
   function argument: either in a register or relative to %rbp,
   according to the calling conventions.  You might find it useful for
   compile_fdecl.

   [ NOTE: the first six arguments are numbered 0 .. 5 ]
*)
let arg_regs = [Rdi; Rsi; Rdx; Rcx; R08; R09]
let arg_loc (n : int) : operand = 
  if n < 6 then
    Reg (List.nth arg_regs n)
  else Ind3 (Lit (Int64.of_int (8 * (n-4))), Rbp)

  (* | n -> Ind3 (Lit (Int64.of_int n), Rbp) *)


(* We suggest that you create a helper function that computes the
   stack layout for a given function declaration.

   - each function argument should be copied into a stack slot
   - in this (inefficient) compilation strategy, each local id
     is also stored as a stack slot.
   - see the discussion about locals

*)
let stack_layout (args : uid list) ((block, lbled_blocks):cfg) : layout =
  (* Map LLVM uids to offsets of rbp and call that a stack layout *)

  (* 
     Do this by first looking at all args uids
     and then considering all defined uids in each instruction list 
     for all the blocks and labeled blocks in the function
  *)
  let all_args = args @                     (* uids arguments *)
                 List.map fst block.insns @ (* All uids from blocks*)
                 List.concat_map (fun (lbl, bl) -> (List.map fst bl.insns)) lbled_blocks in
  let unique_args = List.sort_uniq compare all_args in

  (* Define the offset for each variable: *)
  (* mapi counts from 0 to n-1 *)
  (* goal layout: (which is not quite happening due to sorting - too lazy to implement custom duplicate removal)
    arg1 -> -8(rbp)
    arg2 -> -16(rbp)
    arg3 -> -24(rbp)
    ...
    block values:
    var1 -> -xx(rbp)
    var2 -> -xy(rbp)
    ...
  *)
  List.mapi (fun i arg -> (arg, Ind3 (Lit (Int64.of_int (-8*(i+1))), Rbp))) unique_args



(* The code for the entry-point of a function must do several things:

   - since our simple compiler maps local %uids to stack slots,
     compiling the control-flow-graph body of an fdecl requires us to
     compute the layout (see the discussion of locals and layout)

   - the function code should also comply with the calling
     conventions, typically by moving arguments out of the parameter
     registers (or stack slots) into local storage space.  For our
     simple compilation strategy, that local storage space should be
     in the stack. (So the function parameters can also be accounted
     for in the layout.)

   - the function entry code should allocate the stack storage needed
     to hold all of the local stack slots.
*)

let print_layout (layout: layout) =
  List.mapi (fun i (k, v) -> Printf.printf "(%s, %s)\n" (k) (string_of_operand v)) layout

let compile_fdecl (tdecls:(tid * ty) list) (name:string) ({ f_ty; f_param; f_cfg }:fdecl) : prog =
  let layout = stack_layout f_param f_cfg in
  let function_name = Platform.mangle name in
  (* Require 16 byte alignment *)
  let num_args = List.length layout in
  (* print_layout layout; *)
  let alignment = if num_args mod 2 = 0 then 0 else 8 in
  let stack_offset = (num_args * 8) + alignment in

  (* Stack frame support *)
  let prologue: ins list =  [
      (Pushq, [Reg Rbp]);
      (Movq,  [Reg Rsp; Reg Rbp]); 
      (Subq, [Imm (Lit (Int64.of_int stack_offset)); Reg Rsp]); (* Handle stack offset *)
    ] in
  (* Epilogue given by compile_terminator and other helpers. See below *)

  
  (* 
    Handle arguments:
    First 6 are passed via registers: move them from registers into stack slots
    args 7+ are passed via stack: move them to stack slot from layout
    => this is the non optimizing but making it work part of the compiler
  *)
  let handle_args = List.concat @@ List.mapi (fun i arg ->
    if i < 6 then
      [(Movq, [arg_loc i; lookup layout arg])]
    else 
      (* Move args into precomputed stack layout via rax *)
      [ (Movq, [arg_loc i; Reg Rax]);
        (Movq, [Reg Rax; lookup layout arg])]
    ) f_param in

  (* Compile all blocks within the function using just defined helper methods and close function *)
  let ctxt = {tdecls; layout} in
  let entry, labeled_blocks = f_cfg in
  let entry_ins : ins list = compile_block function_name ctxt entry in
  let blocks: elem list = List.map (fun (lbl, blk) -> compile_lbl_block function_name lbl ctxt blk) labeled_blocks in


  (* Create function Body *)
  let function_body: ins list = prologue @ handle_args @ entry_ins in

  (* Assemble the function: *)
  [Asm.gtext function_name function_body] @ blocks



(* compile_gdecl ------------------------------------------------------------ *)
(* Compile a global value into an X86 global data declaration and map
   a global uid to its associated X86 label.
*)
let rec compile_ginit : ginit -> X86.data list = function
  | GNull     -> [Quad (Lit 0L)]
  | GGid gid  -> [Quad (Lbl (Platform.mangle gid))]
  | GInt c    -> [Quad (Lit c)]
  | GString s -> [Asciz s]
  | GArray gs | GStruct gs -> List.map compile_gdecl gs |> List.flatten
  | GBitcast (t1,g,t2) -> compile_ginit g

and compile_gdecl (_, g) = compile_ginit g


(* compile_prog ------------------------------------------------------------- *)
let compile_prog {tdecls; gdecls; fdecls} : X86.prog =
  let g = fun (lbl, gdecl) -> Asm.data (Platform.mangle lbl) (compile_gdecl gdecl) in
  let f = fun (name, fdecl) -> compile_fdecl tdecls name fdecl in
  (List.map g gdecls) @ (List.map f fdecls |> List.flatten)

