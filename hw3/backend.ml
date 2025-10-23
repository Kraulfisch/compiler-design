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
let compile_operand (ctxt:ctxt) (dest:X86.operand) : Ll.operand -> ins =
  function
  | Null -> (Movq, [Imm (Lit 0L); dest])
  | Const c -> (Movq, [Imm (Lit c); dest])
  | Id uid -> (Movq, [lookup ctxt.layout uid; dest])
  | Gid gid -> (Leaq, [Ind3 (Lbl (Platform.mangle gid), Rip); dest])



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

let arg_regs = [Rdi; Rsi; Rdx; Rcx; R08; R09]

let compile_call (ctxt:ctxt) (uid:uid) (op:Ll.operand) (args:(ty * Ll.operand) list) : ins list =
  let num_args = List.length args in
  let num_stack_args = max 0 (num_args - 6) in
  
  (* Step 1: Push stack arguments in reverse order *)
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
  
  (* Step 2: Move first 6 arguments to registers *)
  let move_to_regs =
    let rec move_n i acc =
      if i >= min 6 num_args then acc
      else
        let (_, arg_op) = List.nth args i in
        let reg = List.nth arg_regs i in
        move_n (i + 1) (acc @ [compile_operand ctxt (Reg reg) arg_op])
    in
    move_n 0 []
  in
  
  (* Step 3: Align stack if necessary (16-byte alignment) *)
  let align_stack =
    if num_stack_args mod 2 <> 0 then
      [(Subq, [Imm (Lit 8L); Reg Rsp])]
    else []
  in
  
  (* Step 4: The call instruction *)
  let call_insn = match op with
    | Gid gid -> [(Callq, [Imm (Lbl (Platform.mangle gid))])]
    | _ -> [compile_operand ctxt (Reg Rax) op; (Callq, [Reg Rax])]
  in
  
  (* Step 5: Clean up stack *)
  let cleanup_stack =
    let total_pushed = num_stack_args * 8 + (if num_stack_args mod 2 <> 0 then 8 else 0) in
    if total_pushed > 0 then
      [(Addq, [Imm (Lit (Int64.of_int total_pushed)); Reg Rsp])]
    else []
  in
  
  (* Step 6: Move return value to destination *)
  let dest_op = lookup ctxt.layout uid in
  let store_result = [(Movq, [Reg Rax; dest_op])] in
  
  push_stack_args @ move_to_regs @ align_stack @ call_insn @ cleanup_stack @ store_result



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
  | I1 | I64 | Ptr _ -> 8
  | Struct ts -> List.fold_left (fun acc t' -> acc + size_ty tdecls t') 0 ts
  | Array (n, t') -> n * size_ty tdecls t'
  | Namedt tid -> size_ty tdecls (lookup tdecls tid)




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
  let dest_op = lookup ctxt.layout uid in
  match i with
  | Binop (bop, _, op1, op2) ->
      let x86_op = match bop with
        | Add -> Addq
        | Sub -> Subq
        | Mul -> Imulq
        | Shl -> Shlq
        | Lshr -> Shrq
        | Ashr -> Sarq
        | And -> Andq
        | Or -> Orq
        | Xor -> Xorq
      in
      [compile_operand ctxt (Reg Rax) op1;
       compile_operand ctxt (Reg Rcx) op2;
       (x86_op, [Reg Rcx; Reg Rax]);
       (Movq, [Reg Rax; dest_op])]
       
  | Icmp (cnd, _, op1, op2) ->
      [compile_operand ctxt (Reg Rax) op1;
       compile_operand ctxt (Reg Rcx) op2;
       (Cmpq, [Reg Rcx; Reg Rax]);
       (Set (compile_cnd cnd), [Reg Rax]);  (* This correctly prints 'set... %al' due to your existing X86.ml printer *)
       (Andq, [Imm (Lit 1L); Reg Rax]);     (* Zero-extend by clearing upper bits *)
       (Movq, [Reg Rax; dest_op])]
       
  | Alloca _ ->
      [(Subq, [Imm (Lit 8L); Reg Rsp]);
       (Movq, [Reg Rsp; dest_op])]
       
  | Load (_, ptr_op) ->
      [compile_operand ctxt (Reg Rax) ptr_op;
       (Movq, [Ind2 Rax; Reg Rax]);
       (Movq, [Reg Rax; dest_op])]
       
  | Store (_, val_op, ptr_op) ->
      [compile_operand ctxt (Reg Rax) val_op;
       compile_operand ctxt (Reg Rcx) ptr_op;
       (Movq, [Reg Rax; Ind2 Rcx])]
       
  | Bitcast (_, op, _) ->
      [compile_operand ctxt (Reg Rax) op;
       (Movq, [Reg Rax; dest_op])]
       
  | Gep (ty, op, path) ->
      let gep_insns = compile_gep ctxt (ty, op) path in
      gep_insns @ [(Movq, [Reg Rax; dest_op])]
      
  | Call (_, op, args) ->
      compile_call ctxt uid op args



(* compiling terminators  --------------------------------------------------- *)

(* prefix the function name [fn] to a label to ensure that the X86 labels are
   globally unique. *)
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
  | Ret (_, Some op) ->
      [compile_operand ctxt (Reg Rax) op;
       (Movq, [Reg Rbp; Reg Rsp]);
       (Popq, [Reg Rbp]);
       (Retq, [])]
       
  | Ret (_, None) ->
      [(Movq, [Reg Rbp; Reg Rsp]);
       (Popq, [Reg Rbp]);
       (Retq, [])]
       
  | Br l ->
      [(Jmp, [Imm (Lbl (mk_lbl fn l))])]
      
  | Cbr (op, l1, l2) ->
      [compile_operand ctxt (Reg Rax) op;
       (Cmpq, [Imm (Lit 0L); Reg Rax]);
       (J Neq, [Imm (Lbl (mk_lbl fn l1))]);
       (Jmp, [Imm (Lbl (mk_lbl fn l2))])]


(* compiling blocks --------------------------------------------------------- *)

(* We have left this helper function here for you to complete.  
   [fn] - the name of the function containing this block
   [ctxt] - the current context
   [blk]  - LLVM IR code for the block
*)
let compile_block (fn:string) (ctxt:ctxt) (blk:Ll.block) : ins list =
  let insns = List.map (compile_insn ctxt) blk.insns |> List.flatten in
  let (_, terminator) = blk.term in
  let terminator_insns = compile_terminator fn ctxt terminator in
  insns @ terminator_insns

let compile_lbl_block fn lbl ctxt blk : elem =
  Asm.text (mk_lbl fn lbl) (compile_block fn ctxt blk)



(* compile_fdecl ------------------------------------------------------------ *)


(* This helper function computes the location of the nth incoming
   function argument: either in a register or relative to %rbp,
   according to the calling conventions.  You might find it useful for
   compile_fdecl.

   [ NOTE: the first six arguments are numbered 0 .. 5 ]
*)
let arg_loc (n : int) : operand =
  if n < 6 then 
    Reg (List.nth arg_regs n)
  else 
    Ind3 (Lit (Int64.of_int (8 * (n - 4))), Rbp)


(* We suggest that you create a helper function that computes the
   stack layout for a given function declaration.

   - each function argument should be copied into a stack slot
   - in this (inefficient) compilation strategy, each local id
     is also stored as a stack slot.
   - see the discussion about locals

*)
let stack_layout (args : uid list) ((block, lbled_blocks):cfg) : layout =
  let all_uids = args @ (List.map fst block.insns) @ 
                 (List.concat_map (fun (_, b) -> List.map fst b.insns) lbled_blocks) in
  let unique_uids = List.sort_uniq compare all_uids in
  List.mapi (fun i uid -> (uid, Ind3 (Lit (Int64.of_int (-8 * (i + 1))), Rbp))) unique_uids

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
let compile_fdecl (tdecls:(tid * ty) list) (name:string) ({ f_ty; f_param; f_cfg }:fdecl) : prog =
  let layout = stack_layout f_param f_cfg in
  let ctxt = { tdecls; layout } in

  (* Prologue *)
  let num_locals = List.length layout in
  let stack_size = if num_locals mod 2 <> 0 then 8 * (num_locals + 1) else 8 * num_locals in
  let prologue = [
    (Pushq, [Reg Rbp]);
    (Movq, [Reg Rsp; Reg Rbp]);
    (Subq, [Imm (Lit (Int64.of_int stack_size)); Reg Rsp])
  ] in

  (* Move arguments to stack slots *)
  let arg_setup =
    List.flatten @@ List.mapi (fun i uid ->
      let src_op = arg_loc i in
      let dest_op = lookup layout uid in
      match src_op with
      | Reg _ -> (* Reg -> Mem is a single valid instruction *)
          [(Movq, [src_op; dest_op])]
      | Ind3 (_, _) -> (* Mem -> Mem is invalid, so use %rax as an intermediate *)
          [(Movq, [src_op; Reg Rax]);
           (Movq, [Reg Rax; dest_op])]
      | _ -> failwith "arg_loc returned an unexpected operand type"
    ) f_param
  in

  (* Compile CFG *)
  let entry_block, labeled_blocks = f_cfg in
  let entry_block_insns = compile_block name ctxt entry_block in
  let labeled_block_elems = List.map (fun (lbl, blk) ->
    compile_lbl_block name lbl ctxt blk
  ) labeled_blocks in

  let main_fn_body = prologue @ arg_setup @ entry_block_insns in
  [Asm.gtext (Platform.mangle name) main_fn_body] @ labeled_block_elems



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