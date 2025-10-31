open Ll
open Llutil
open Ast

(* instruction streams ------------------------------------------------------ *)

(* As in the last project, we'll be working with a flattened representation
   of LLVMlite programs to make emitting code easier. This version
   additionally makes it possible to emit elements will be gathered up and
   "hoisted" to specific parts of the constructed CFG
   - G of gid * Ll.gdecl: allows you to output global definitions in the middle
     of the instruction stream. You will find this useful for compiling string
     literals
   - E of uid * insn: allows you to emit an instruction that will be moved up
     to the entry block of the current function. This will be useful for 
     compiling local variable declarations
*)

type elt = 
  | L of Ll.lbl             (* block labels *)
  | I of uid * Ll.insn      (* instruction *)
  | T of Ll.terminator      (* block terminators *)
  | G of gid * Ll.gdecl     (* hoisted globals (usually strings) *)
  | E of uid * Ll.insn      (* hoisted entry block instructions *)

type stream = elt list
let ( >@ ) x y = y @ x
let ( >:: ) x y = y :: x
let lift : (uid * insn) list -> stream = List.rev_map (fun (x,i) -> I (x,i))

(* Build a CFG and collection of global variable definitions from a stream *)
let cfg_of_stream (code:stream) : Ll.cfg * (Ll.gid * Ll.gdecl) list  =
    let gs, einsns, insns, term_opt, blks = List.fold_left
      (fun (gs, einsns, insns, term_opt, blks) e ->
        match e with
        | L l ->
           begin match term_opt with
           | None -> 
              if (List.length insns) = 0 then (gs, einsns, [], None, blks)
              else failwith @@ Printf.sprintf "build_cfg: block labeled %s has\
                                               no terminator" l
           | Some term ->
              (gs, einsns, [], None, (l, {insns; term})::blks)
           end
        | T t  -> (gs, einsns, [], Some (Llutil.Parsing.gensym "tmn", t), blks)
        | I (uid,insn)  -> (gs, einsns, (uid,insn)::insns, term_opt, blks)
        | G (gid,gdecl) ->  ((gid,gdecl)::gs, einsns, insns, term_opt, blks)
        | E (uid,i) -> (gs, (uid, i)::einsns, insns, term_opt, blks)
      ) ([], [], [], None, []) code
    in
    match term_opt with
    | None -> failwith "build_cfg: entry block has no terminator" 
    | Some term -> 
       let insns = einsns @ insns in
       ({insns; term}, blks), gs


(* compilation contexts ----------------------------------------------------- *)

(* To compile OAT variables, we maintain a mapping of source identifiers to the
   corresponding LLVMlite operands. Bindings are added for global OAT variables
   and local variables that are in scope. *)

module Ctxt = struct

  type t = (Ast.id * (Ll.ty * Ll.operand)) list
  let empty = []

  (* Add a binding to the context *)
  let add (c:t) (id:id) (bnd:Ll.ty * Ll.operand) : t = (id,bnd)::c

  (* Lookup a binding in the context *)
  let lookup (id:Ast.id) (c:t) : Ll.ty * Ll.operand =
    List.assoc id c

  (* Lookup a function, fail otherwise *)
  let lookup_function (id:Ast.id) (c:t) : Ll.ty * Ll.operand =
    match List.assoc id c with
    | Ptr (Fun (args, ret)), g -> Ptr (Fun (args, ret)), g
    | _ -> failwith @@ id ^ " not bound to a function"

  let lookup_function_option (id:Ast.id) (c:t) : (Ll.ty * Ll.operand) option =
    try Some (lookup_function id c) with _ -> None
  
end

(* compiling OAT types ------------------------------------------------------ *)

(* The mapping of source types onto LLVMlite is straightforward. Booleans and ints
   are represented as the corresponding integer types. OAT strings are
   pointers to bytes (I8). Arrays are the most interesting type: they are
   represented as pointers to structs where the first component is the number
   of elements in the following array.

   The trickiest part of this project will be satisfying LLVM's rudimentary type
   system. Recall that global arrays in LLVMlite need to be declared with their
   length in the type to statically allocate the right amount of memory. The 
   global strings and arrays you emit will therefore have a more specific type
   annotation than the output of cmp_rty. You will have to carefully bitcast
   gids to satisfy the LLVM type checker.
*)

let rec cmp_ty : Ast.ty -> Ll.ty = function
  | Ast.TBool  -> I1
  | Ast.TInt   -> I64
  | Ast.TRef r -> Ptr (cmp_rty r)

and cmp_rty : Ast.rty -> Ll.ty = function
  | Ast.RString  -> I8
  | Ast.RArray u -> Struct [I64; Array(0, cmp_ty u)]
  | Ast.RFun (ts, t) -> 
      let args, ret = cmp_fty (ts, t) in
      Fun (args, ret)

and cmp_ret_ty : Ast.ret_ty -> Ll.ty = function
  | Ast.RetVoid  -> Void
  | Ast.RetVal t -> cmp_ty t

and cmp_fty (ts, r) : Ll.fty =
  List.map cmp_ty ts, cmp_ret_ty r


let typ_of_binop : Ast.binop -> Ast.ty * Ast.ty * Ast.ty = function
  | Add | Mul | Sub | Shl | Shr | Sar | IAnd | IOr -> (TInt, TInt, TInt)
  | Eq | Neq | Lt | Lte | Gt | Gte -> (TInt, TInt, TBool)
  | And | Or -> (TBool, TBool, TBool)

let typ_of_unop : Ast.unop -> Ast.ty * Ast.ty = function
  | Neg | Bitnot -> (TInt, TInt)
  | Lognot       -> (TBool, TBool)

(* Compiler Invariants

   The LLVM IR type of a variable (whether global or local) that stores an Oat
   array value (or any other reference type, like "string") will always be a
   double pointer.  In general, any Oat variable of Oat-type t will be
   represented by an LLVM IR value of type Ptr (cmp_ty t).  So the Oat variable
   x : int will be represented by an LLVM IR value of type i64*, y : string will
   be represented by a value of type i8**, and arr : int[] will be represented
   by a value of type {i64, [0 x i64]}**.  Whether the LLVM IR type is a
   "single" or "double" pointer depends on whether t is a reference type.

   We can think of the compiler as paying careful attention to whether a piece
   of Oat syntax denotes the "value" of an expression or a pointer to the
   "storage space associated with it".  This is the distinction between an
   "expression" and the "left-hand-side" of an assignment statement.  Compiling
   an Oat variable identifier as an expression ("value") does the load, so
   cmp_exp called on an Oat variable of type t returns (code that) generates a
   LLVM IR value of type cmp_ty t.  Compiling an identifier as a left-hand-side
   does not do the load, so cmp_lhs called on an Oat variable of type t returns
   and operand of type (cmp_ty t)*.  Extending these invariants to account for
   array accesses: the assignment e1[e2] = e3; treats e1[e2] as a
   left-hand-side, so we compile it as follows: compile e1 as an expression to
   obtain an array value (which is of pointer of type {i64, [0 x s]}* ).
   compile e2 as an expression to obtain an operand of type i64, generate code
   that uses getelementptr to compute the offset from the array value, which is
   a pointer to the "storage space associated with e1[e2]".

   On the other hand, compiling e1[e2] as an expression (to obtain the value of
   the array), we can simply compile e1[e2] as a left-hand-side and then do the
   load.  So cmp_exp and cmp_lhs are mutually recursive.  [[Actually, as I am
   writing this, I think it could make sense to factor the Oat grammar in this
   way, which would make things clearer, I may do that for next time around.]]

 
   Consider globals7.oat

   /--------------- globals7.oat ------------------ 
   global arr = int[] null;

   int foo() { 
     var x = new int[3]; 
     arr = x; 
     x[2] = 3; 
     return arr[2]; 
   }
   /------------------------------------------------

   The translation (given by cmp_ty) of the type int[] is {i64, [0 x i64}* so
   the corresponding LLVM IR declaration will look like:

   @arr = global { i64, [0 x i64] }* null

   This means that the type of the LLVM IR identifier @arr is {i64, [0 x i64]}**
   which is consistent with the type of a locally-declared array variable.

   The local variable x would be allocated and initialized by (something like)
   the following code snippet.  Here %_x7 is the LLVM IR uid containing the
   pointer to the "storage space" for the Oat variable x.

   %_x7 = alloca { i64, [0 x i64] }*                              ;; (1)
   %_raw_array5 = call i64*  @oat_alloc_array(i64 3)              ;; (2)
   %_array6 = bitcast i64* %_raw_array5 to { i64, [0 x i64] }*    ;; (3)
   store { i64, [0 x i64]}* %_array6, { i64, [0 x i64] }** %_x7   ;; (4)

   (1) note that alloca uses cmp_ty (int[]) to find the type, so %_x7 has 
       the same type as @arr 

   (2) @oat_alloc_array allocates len+1 i64's 

   (3) we have to bitcast the result of @oat_alloc_array so we can store it
        in %_x7 

   (4) stores the resulting array value (itself a pointer) into %_x7 

  The assignment arr = x; gets compiled to (something like):

  %_x8 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x7     ;; (5)
  store {i64, [0 x i64] }* %_x8, { i64, [0 x i64] }** @arr       ;; (6)

  (5) load the array value (a pointer) that is stored in the address pointed 
      to by %_x7 

  (6) store the array value (a pointer) into @arr 

  The assignment x[2] = 3; gets compiled to (something like):

  %_x9 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x7      ;; (7)
  %_index_ptr11 = getelementptr { i64, [0 x  i64] }, 
                  { i64, [0 x i64] }* %_x9, i32 0, i32 1, i32 2   ;; (8)
  store i64 3, i64* %_index_ptr11                                 ;; (9)

  (7) as above, load the array value that is stored %_x7 

  (8) calculate the offset from the array using GEP

  (9) store 3 into the array

  Finally, return arr[2]; gets compiled to (something like) the following.
  Note that the way arr is treated is identical to x.  (Once we set up the
  translation, there is no difference between Oat globals and locals, except
  how their storage space is initially allocated.)

  %_arr12 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** @arr    ;; (10)
  %_index_ptr14 = getelementptr { i64, [0 x i64] },                
                 { i64, [0 x i64] }* %_arr12, i32 0, i32 1, i32 2  ;; (11)
  %_index15 = load i64, i64* %_index_ptr14                         ;; (12)
  ret i64 %_index15

  (10) just like for %_x9, load the array value that is stored in @arr 

  (11)  calculate the array index offset

  (12) load the array value at the index 

*)

(* Global initialized arrays:

  There is another wrinkle: To compile global initialized arrays like in the
  globals4.oat, it is helpful to do a bitcast once at the global scope to
  convert the "precise type" required by the LLVM initializer to the actual
  translation type (which sets the array length to 0).  So for globals4.oat,
  the arr global would compile to (something like):

  @arr = global { i64, [0 x i64] }* bitcast 
           ({ i64, [4 x i64] }* @_global_arr5 to { i64, [0 x i64] }* ) 
  @_global_arr5 = global { i64, [4 x i64] } 
                  { i64 4, [4 x i64] [ i64 1, i64 2, i64 3, i64 4 ] }

*) 



(* Some useful helper functions *)

(* Generate a fresh temporary identifier. Since OAT identifiers cannot begin
   with an underscore, these should not clash with any source variables *)
let gensym : string -> string =
  let c = ref 0 in
  fun (s:string) -> incr c; Printf.sprintf "_%s%d" s (!c)

(* Amount of space an Oat type takes when stored in the satck, in bytes.  
   Note that since structured values are manipulated by reference, all
   Oat values take 8 bytes on the stack.
*)
let size_oat_ty (t : Ast.ty) = 8L

(* Generate code to allocate a zero-initialized array of source type TRef (RArray t) of the
   given size. Note "size" is an operand whose value can be computed at
   runtime *)
let oat_alloc_array (t:Ast.ty) (size:Ll.operand) : Ll.ty * operand * stream =
  let ans_id, arr_id = gensym "array", gensym "raw_array" in
  let ans_ty = cmp_ty @@ TRef (RArray t) in
  let arr_ty = Ptr I64 in
  ans_ty, Id ans_id, lift
    [ arr_id, Call(arr_ty, Gid "oat_alloc_array", [I64, size])
    ; ans_id, Bitcast(arr_ty, Id arr_id, ans_ty) ]

(* Compile a left-hand-side expression.  Returns the pointer to the storage location
   and the stream of code. *)
let rec cmp_lhs (c:Ctxt.t) (lhs:Ast.exp node) : Ll.ty * Ll.operand * stream =
  match lhs.elt with
  | Id id ->
     let ty, op = Ctxt.lookup id c in
     (* ty is already a pointer type (Ptr ...) *)
     ty, op, []
     
  | Index (e, idx) ->
     (* Compile the array expression *)
     let arr_ty, arr_op, arr_code = cmp_exp c e in
     (* arr_ty should be Ptr (Struct [I64; Array (0, elt_ty)]) *)
     let idx_ty, idx_op, idx_code = cmp_exp c idx in
     let ptr_id = gensym "index_ptr" in
     
     let elt_ty = begin match arr_ty with
       | Ptr (Struct [_; Array (_, t)]) -> t
       | _ -> failwith ("Index lhs: expected array type, got " ^ Llutil.string_of_ty arr_ty)
     end in
     
     let struct_ty = begin match arr_ty with
       | Ptr t -> t
       | _ -> failwith "Index lhs: array should be pointer to struct"
     end in
     
     Ptr elt_ty, Id ptr_id,
     arr_code >@ idx_code >@ lift [
       ptr_id, Gep (struct_ty, arr_op, [Const 0L; Const 1L; idx_op])
     ]
     
  | _ -> failwith "Invalid lhs"

(* Compiles an expression exp in context c, outputting the Ll operand that will
   recieve the value of the expression, and the stream of instructions
   implementing the expression. 

   Tips:
   - use the provided cmp_ty function!

   - string literals (CStr s) should be hoisted. You'll need to make sure
     either that the resulting gid has type (Ptr I8), or, if the gid has type
     [n x i8] (where n is the length of the string), convert the gid to a 
     (Ptr I8), e.g., by using getelementptr.

   - use the provided "oat_alloc_array" function to implement literal arrays
     (CArr) and the (NewArr) expressions

*)

and cmp_exp (c:Ctxt.t) (exp:Ast.exp node) : Ll.ty * Ll.operand * stream =
  match exp.elt with
  | CNull rty ->
     cmp_ty (TRef rty), Null, []
     
  | CBool b ->
     I1, Const (if b then 1L else 0L), []
     
  | CInt i ->
     I64, Const i, []
     
  | CStr s ->
     let gid = gensym "str" in
     let len = String.length s + 1 in (* +1 for null terminator *)
     let str_ty = Array (len, I8) in
     let str_ptr_id = gensym "str_ptr" in
     Ptr I8, Id str_ptr_id, [
       G (gid, (str_ty, GString s));
       I (str_ptr_id, Gep (str_ty, Gid gid, [Const 0L; Const 0L]))
     ]
     
  | CArr (ty, exps) ->
     let len = List.length exps in
     let arr_ty, arr_op, alloc_code = oat_alloc_array ty (Const (Int64.of_int len)) in
     let elt_ty = cmp_ty ty in
     
     (* arr_ty is Ptr (Struct [I64; Array (0, elt_ty)]) *)
     let struct_ty = begin match arr_ty with
       | Ptr t -> t
       | _ -> failwith "CArr: expected pointer to struct"
     end in
     
     (* arr_op is the pointer to the array struct *)
     let init_code = List.mapi (fun i exp ->
       let exp_ty, exp_op, exp_code = cmp_exp c exp in
       let ptr_id = gensym "arr_init_ptr" in
       exp_code >@ lift [
         ptr_id, Gep (struct_ty, arr_op, [Const 0L; Const 1L; Const (Int64.of_int i)]);
         gensym "store", Store (elt_ty, exp_op, Id ptr_id)
       ]
     ) exps |> List.concat in
     
     arr_ty, arr_op, alloc_code >@ init_code
     
  | NewArr (ty, size) ->
     let size_ty, size_op, size_code = cmp_exp c size in
     let arr_ty, arr_op, alloc_code = oat_alloc_array ty size_op in
     arr_ty, arr_op, size_code >@ alloc_code
     
  | Id id ->
     let ty, op = Ctxt.lookup id c in
     let result_id = gensym "load" in
     let result_ty = begin match ty with
       | Ptr t -> t
       | _ -> failwith "Id: expected pointer type"
     end in
     result_ty, Id result_id, lift [result_id, Load (ty, op)]
     
  | Index (arr, idx) ->
     (* Compile the array expression - this gives us the array pointer *)
     let arr_ty, arr_op, arr_code = cmp_exp c arr in
     let idx_ty, idx_op, idx_code = cmp_exp c idx in
     
     let elt_ty = begin match arr_ty with
       | Ptr (Struct [_; Array (_, t)]) -> t
       | _ -> failwith ("Index exp: expected array type, got " ^ Llutil.string_of_ty arr_ty)
     end in
     
     let ptr_id = gensym "index_ptr" in
     let result_id = gensym "index" in
     
     (* Gep into the array structure: the array pointer type *)
     let struct_ty = begin match arr_ty with
       | Ptr t -> t
       | _ -> failwith "Index: array should be pointer to struct"
     end in
     
     elt_ty, Id result_id,
     arr_code >@ idx_code >@ lift [
       ptr_id, Gep (struct_ty, arr_op, [Const 0L; Const 1L; idx_op]);
       result_id, Load (Ptr elt_ty, Id ptr_id)
     ]
     
  | Call (fn_exp, args) ->
     (* Check if this is a call through an identifier (function pointer) *)
     let fn_ty, fn_op, fn_code = begin match fn_exp.elt with
       | Id id ->
          (* Look up the function in the context *)
          begin try
            let ty, op = Ctxt.lookup id c in
            match ty with
            | Ptr (Fun (arg_tys, ret_ty)) -> 
               (* Direct function pointer *)
               ty, op, []
            | _ -> 
               (* Regular variable, load it *)
               let result_id = gensym "load" in
               let result_ty = match ty with
                 | Ptr t -> t
                 | _ -> failwith ("Call: Id '" ^ id ^ "' has unexpected type")
               in
               result_ty, Id result_id, lift [result_id, Load (ty, op)]
          with Not_found ->
            failwith ("Call: function '" ^ id ^ "' not found")
          end
       | _ -> cmp_exp c fn_exp
     end in
     
     let ret_ty, arg_tys = begin match fn_ty with
       | Ptr (Fun (args, ret)) -> ret, args
       | Fun (args, ret) -> ret, args
       | _ -> failwith ("Call: not a function type, got: " ^ (Llutil.string_of_ty fn_ty))
     end in
     
     let args_code, args_ops = List.fold_right (fun arg (code, ops) ->
       let arg_ty, arg_op, arg_code = cmp_exp c arg in
       (arg_code >@ code, (arg_ty, arg_op) :: ops)
     ) args ([], []) in
     
     if ret_ty = Void then
       ret_ty, fn_op, fn_code >@ args_code >@ lift [gensym "call", Call (ret_ty, fn_op, args_ops)]
     else
       let result_id = gensym "call" in
       ret_ty, Id result_id, fn_code >@ args_code >@ lift [result_id, Call (ret_ty, fn_op, args_ops)]
     
  | Bop (bop, e1, e2) ->
     let ty1, op1, code1 = cmp_exp c e1 in
     let ty2, op2, code2 = cmp_exp c e2 in
     let _, _, result_ty = typ_of_binop bop in
     let result_ll_ty = cmp_ty result_ty in
     let result_id = gensym "bop" in
     
     let insn = match bop with
       | Add  -> Binop (Add, I64, op1, op2)
       | Sub  -> Binop (Sub, I64, op1, op2)
       | Mul  -> Binop (Mul, I64, op1, op2)
       | Shl  -> Binop (Shl, I64, op1, op2)
       | Shr  -> Binop (Lshr, I64, op1, op2)
       | Sar  -> Binop (Ashr, I64, op1, op2)
       | IAnd -> Binop (And, I64, op1, op2)
       | IOr  -> Binop (Or, I64, op1, op2)
       | And  -> Binop (And, I1, op1, op2)
       | Or   -> Binop (Or, I1, op1, op2)
       | Eq   -> Icmp (Eq, I64, op1, op2)
       | Neq  -> Icmp (Ne, I64, op1, op2)
       | Lt   -> Icmp (Slt, I64, op1, op2)
       | Lte  -> Icmp (Sle, I64, op1, op2)
       | Gt   -> Icmp (Sgt, I64, op1, op2)
       | Gte  -> Icmp (Sge, I64, op1, op2)
     in
     result_ll_ty, Id result_id, code1 >@ code2 >@ lift [result_id, insn]
     
  | Uop (uop, e) ->
     let ty, op, code = cmp_exp c e in
     let _, result_ty = typ_of_unop uop in
     let result_ll_ty = cmp_ty result_ty in
     let result_id = gensym "uop" in
     
     let insn = match uop with
       | Neg    -> Binop (Sub, I64, Const 0L, op)
       | Lognot -> Icmp (Eq, I1, op, Const 0L)
       | Bitnot -> Binop (Xor, I64, op, Const (-1L))
     in
     result_ll_ty, Id result_id, code >@ lift [result_id, insn]

(* Compile a statement in context c with return typ rt. Return a new context, 
   possibly extended with new local bindings, and the instruction stream
   implementing the statement.

   Left-hand-sides of assignment statements must either be OAT identifiers,
   or an index into some arbitrary expression of array type. Otherwise, the
   program is not well-formed and your compiler may throw an error.

   Tips:
   - for local variable declarations, you will need to emit Allocas in the
     entry block of the current function using the E() constructor.

   - don't forget to add a bindings to the context for local variable 
     declarations
   
   - you can avoid some work by translating For loops to the corresponding
     While loop, building the AST and recursively calling cmp_stmt

   - you might find it helpful to reuse the code you wrote for the Call
     expression to implement the SCall statement

   - compiling the left-hand-side of an assignment is almost exactly like
     compiling the Id or Index expression. Instead of loading the resulting
     pointer, you just need to store to it!

 *)

let rec cmp_stmt (c:Ctxt.t) (rt:Ll.ty) (stmt:Ast.stmt node) : Ctxt.t * stream =
  match stmt.elt with
  | Assn (lhs, rhs) ->
     let ptr_ty, ptr_op, lhs_code = cmp_lhs c lhs in
     let rhs_ty, rhs_op, rhs_code = cmp_exp c rhs in
     let store_ty = begin match ptr_ty with
       | Ptr t -> t
       | _ -> failwith "Assn: expected pointer type"
     end in
     c, lhs_code >@ rhs_code >@ lift [gensym "store", Store (store_ty, rhs_op, ptr_op)]
     
  | Decl (id, init) ->
     let init_ty, init_op, init_code = cmp_exp c init in
     let ptr_id = gensym id in
     let ptr_ty = Ptr init_ty in
     let new_c = Ctxt.add c id (ptr_ty, Id ptr_id) in
     new_c, init_code >@ [
       E (ptr_id, Alloca init_ty);
       I (gensym "store", Store (init_ty, init_op, Id ptr_id))
     ]
     
  | Ret exp_opt ->
     begin match exp_opt with
     | None -> c, [T (Ret (Void, None))]
     | Some exp ->
        let exp_ty, exp_op, exp_code = cmp_exp c exp in
        c, exp_code >@ [T (Ret (exp_ty, Some exp_op))]
     end
     
  | SCall (fn, args) ->
     let _, _, call_code = cmp_exp c (no_loc (Call (fn, args))) in
     c, call_code
     
  | If (cond, then_block, else_block) ->
     let cond_ty, cond_op, cond_code = cmp_exp c cond in
     let then_lbl = gensym "then" in
     let else_lbl = gensym "else" in
     let merge_lbl = gensym "merge" in
     
     let _, then_code = cmp_block c rt then_block in
     let _, else_code = cmp_block c rt else_block in
     
     c, cond_code >@ [
       T (Cbr (cond_op, then_lbl, else_lbl));
       L then_lbl
     ] >@ then_code >@ [
       T (Br merge_lbl);
       L else_lbl
     ] >@ else_code >@ [
       T (Br merge_lbl);
       L merge_lbl
     ]
     
  | While (cond, body) ->
     let cond_lbl = gensym "while_cond" in
     let body_lbl = gensym "while_body" in
     let merge_lbl = gensym "while_merge" in
     
     let cond_ty, cond_op, cond_code = cmp_exp c cond in
     let _, body_code = cmp_block c rt body in
     
     c, [
       T (Br cond_lbl);
       L cond_lbl
     ] >@ cond_code >@ [
       T (Cbr (cond_op, body_lbl, merge_lbl));
       L body_lbl
     ] >@ body_code >@ [
       T (Br cond_lbl);
       L merge_lbl
     ]
     
  | For (vdecls, cond_opt, incr_opt, body) ->
     (* Translate for loop to while loop *)
     (* First, compile all the variable declarations *)
     let c', decl_code = List.fold_left (fun (ctxt, code) vdecl ->
       let id, init = vdecl in
       let init_ty, init_op, init_code = cmp_exp ctxt init in
       let ptr_id = gensym id in
       let ptr_ty = Ptr init_ty in
       let new_ctxt = Ctxt.add ctxt id (ptr_ty, Id ptr_id) in
       let new_code = code >@ init_code >@ [
         E (ptr_id, Alloca init_ty);
         I (gensym "store", Store (init_ty, init_op, Id ptr_id))
       ] in
       (new_ctxt, new_code)
     ) (c, []) vdecls in
     
     (* Set up the while loop *)
     let cond_lbl = gensym "for_cond" in
     let body_lbl = gensym "for_body" in
     let merge_lbl = gensym "for_merge" in
     
     let cond_exp = begin match cond_opt with
       | Some e -> e
       | None -> { elt = CBool true; loc = Range.norange }
     end in
     
     let cond_ty, cond_op, cond_code = cmp_exp c' cond_exp in
     
     (* Compile body *)
     let _, body_code = cmp_block c' rt body in
     
     (* Compile increment if present *)
     let incr_code = begin match incr_opt with
       | Some s -> 
          let _, s_code = cmp_stmt c' rt s in
          s_code
       | None -> []
     end in
     
     (* Assemble the while loop *)
     c, decl_code >@ [
       T (Br cond_lbl);
       L cond_lbl
     ] >@ cond_code >@ [
       T (Cbr (cond_op, body_lbl, merge_lbl));
       L body_lbl
     ] >@ body_code >@ incr_code >@ [
       T (Br cond_lbl);
       L merge_lbl
     ]

(* Compile a series of statements *)
and cmp_block (c:Ctxt.t) (rt:Ll.ty) (stmts:Ast.block) : Ctxt.t * stream =
  List.fold_left (fun (c, code) s -> 
      let c, stmt_code = cmp_stmt c rt s in
      c, code >@ stmt_code
    ) (c,[]) stmts


(* Adds each function identifer to the context at an
   appropriately translated type.  

   NOTE: The Gid of a function is just its source name
*)
let cmp_function_ctxt (c:Ctxt.t) (p:Ast.prog) : Ctxt.t =
    List.fold_left (fun c -> function
      | Ast.Gfdecl { elt={ frtyp; fname; args } } ->
         let ft = TRef (RFun (List.map fst args, frtyp)) in
         Ctxt.add c fname (cmp_ty ft, Gid fname)
      | _ -> c
    ) c p 

(* Populate a context with bindings for global variables 
   mapping OAT identifiers to LLVMlite gids and their types.

   Only a small subset of OAT expressions can be used as global initializers
   in well-formed programs. (The constructors starting with C). 
*)
let cmp_global_ctxt (c:Ctxt.t) (p:Ast.prog) : Ctxt.t =
  List.fold_left (fun c -> function
    | Ast.Gvdecl { elt={ name; init } } ->
       let ty = begin match init.elt with
         | CNull rty -> TRef rty
         | CBool _ -> TBool
         | CInt _ -> TInt
         | CStr _ -> TRef RString
         | CArr (ty, _) -> TRef (RArray ty)
         | _ -> failwith "cmp_global_ctxt: invalid global initializer"
       end in
       Ctxt.add c name (Ptr (cmp_ty ty), Gid name)
    | _ -> c
  ) c p

(* Compile a function declaration in global context c. Return the LLVMlite cfg
   and a list of global declarations containing the string literals appearing
   in the function.

   You will need to
   1. Allocate stack space for the function parameters using Alloca
   2. Store the function arguments in their corresponding alloca'd stack slot
   3. Extend the context with bindings for function variables
   4. Compile the body of the function using cmp_block
   5. Use cfg_of_stream to produce a LLVMlite cfg from 
 *)

let cmp_fdecl (c:Ctxt.t) (f:Ast.fdecl node) : Ll.fdecl * (Ll.gid * Ll.gdecl) list =
  let { frtyp; fname; args; body } = f.elt in
  let ret_ty = cmp_ret_ty frtyp in
  let param_tys = List.map (fun (ty, _) -> cmp_ty ty) args in
  
  (* Create parameter UIDs first *)
  let param_list = List.map (fun (ty, id) -> (ty, id, gensym id)) args in
  
  (* Allocate space for parameters and set up context *)
  let param_setup, param_ctxt = List.fold_left (fun (setup, ctxt) (ty, id, param_uid) ->
    let alloca_uid = gensym id in
    let ll_ty = cmp_ty ty in
    let new_ctxt = Ctxt.add ctxt id (Ptr ll_ty, Id alloca_uid) in
    let new_setup = setup @ [
      E (alloca_uid, Alloca ll_ty);
      I (gensym "store", Store (ll_ty, Id param_uid, Id alloca_uid))
    ] in
    (new_setup, new_ctxt)
  ) ([], c) param_list in
  
  let param_uids = List.map (fun (_, _, uid) -> uid) param_list in
  
  (* Compile function body *)
  let _, body_code = cmp_block param_ctxt ret_ty body in
  
  (* Ensure the function ends with a terminator *)
  let needs_terminator = match List.rev body_code with
    | T _ :: _ -> false
    | _ -> true
  in
  
  let final_code = param_setup >@ body_code >@
    (if needs_terminator && ret_ty = Void then [T (Ret (Void, None))] else
     if needs_terminator then failwith "Non-void function missing return"
     else []) in
  
  let cfg, gdecls = cfg_of_stream final_code in
  
  { f_ty = (param_tys, ret_ty)
  ; f_param = param_uids
  ; f_cfg = cfg
  }, gdecls

(* Compile a global initializer, returning the resulting LLVMlite global
   declaration, and a list of additional global declarations.

   Tips:
   - Only CNull, CBool, CInt, CStr, and CArr can appear as global initializers
     in well-formed OAT programs. Your compiler may throw an error for the other
     cases

   - OAT arrays are always handled via pointers. A global array of arrays will
     be an array of pointers to arrays emitted as additional global declarations.
*)

let rec cmp_gexp c (e:Ast.exp node) : Ll.gdecl * (Ll.gid * Ll.gdecl) list =
  match e.elt with
  | CNull rty ->
     (cmp_ty (TRef rty), GNull), []
     
  | CBool b ->
     (I1, GInt (if b then 1L else 0L)), []
     
  | CInt i ->
     (I64, GInt i), []
     
  | CStr s ->
     let str_gid = gensym "gstr" in
     let len = String.length s + 1 in
     let str_ty = Array (len, I8) in
     let str_ptr_ty = Ptr I8 in
     let ginit = (str_ptr_ty, 
                  GBitcast (Ptr str_ty, GGid str_gid, str_ptr_ty)) in
     ginit, [(str_gid, (str_ty, GString s))]
     
  | CArr (ty, exps) ->
     let len = List.length exps in
     let elt_ty = cmp_ty ty in
     let arr_ty = Struct [I64; Array (len, elt_ty)] in
     let arr_gid = gensym "garr" in
     
     (* Compile each element *)
     let elts, extra_gdecls = List.fold_right (fun exp (elts, gdecls) ->
       let (elt_ty, elt_ginit), elt_gdecls = cmp_gexp c exp in
       (elt_ty, elt_ginit) :: elts, elt_gdecls @ gdecls
     ) exps ([], []) in
     
     let arr_init = GStruct [
       (I64, GInt (Int64.of_int len));
       (Array (len, elt_ty), GArray elts)
     ] in
     
     let result_ty = Ptr (Struct [I64; Array (0, elt_ty)]) in
     let ginit = (result_ty,
                  GBitcast (Ptr arr_ty, GGid arr_gid, result_ty)) in
     ginit, (arr_gid, (arr_ty, arr_init)) :: extra_gdecls
     
  | _ -> failwith "cmp_gexp: invalid global expression"

(* Oat internals function context ------------------------------------------- *)
let internals = [
    "oat_alloc_array",         Ll.Fun ([I64], Ptr I64)
  ]

(* Oat builtin function context --------------------------------------------- *)
let builtins =
  [ "array_of_string",  cmp_rty @@ RFun ([TRef RString], RetVal (TRef(RArray TInt)))
  ; "string_of_array",  cmp_rty @@ RFun ([TRef(RArray TInt)], RetVal (TRef RString))
  ; "length_of_string", cmp_rty @@ RFun ([TRef RString],  RetVal TInt)
  ; "string_of_int",    cmp_rty @@ RFun ([TInt],  RetVal (TRef RString))
  ; "string_cat",       cmp_rty @@ RFun ([TRef RString; TRef RString], RetVal (TRef RString))
  ; "print_string",     cmp_rty @@ RFun ([TRef RString],  RetVoid)
  ; "print_int",        cmp_rty @@ RFun ([TInt],  RetVoid)
  ; "print_bool",       cmp_rty @@ RFun ([TBool], RetVoid)
  ]

(* Compile a OAT program to LLVMlite *)
let cmp_prog (p:Ast.prog) : Ll.prog =
  (* add built-in functions to context *)
  let init_ctxt = 
    List.fold_left (fun c (i, t) -> Ctxt.add c i (Ll.Ptr t, Gid i))
      Ctxt.empty builtins
  in
  let fc = cmp_function_ctxt init_ctxt p in

  (* build global variable context *)
  let c = cmp_global_ctxt fc p in

  (* compile functions and global variables *)
  let fdecls, gdecls = 
    List.fold_right (fun d (fs, gs) ->
        match d with
        | Ast.Gvdecl { elt=gd } -> 
           let ll_gd, gs' = cmp_gexp c gd.init in
           (fs, (gd.name, ll_gd)::gs' @ gs)
        | Ast.Gfdecl fd ->
           let fdecl, gs' = cmp_fdecl c fd in
           (fd.elt.fname,fdecl)::fs, gs' @ gs
      ) p ([], [])
  in

  (* gather external declarations *)
  let edecls = internals @ builtins in
  { tdecls = []; gdecls; fdecls; edecls }