open Ast
open Astlib
open Tctxt

(* Error Reporting ---------------------------------------------------------- *)
(* NOTE: Use type_error to report error messages for ill-typed programs. *)

exception TypeError of string

let type_error (l : 'a node) err = 
  let (_, (s, e), _) = l.loc in
  raise (TypeError (Printf.sprintf "[%d, %d] %s" s e err))


(* initial context: G0 ------------------------------------------------------ *)
(* The Oat types of the Oat built-in functions *)
let builtins =
  [ "array_of_string",  ([TRef RString],  RetVal (TRef(RArray TInt)))
  ; "string_of_array",  ([TRef(RArray TInt)], RetVal (TRef RString))
  ; "length_of_string", ([TRef RString],  RetVal TInt)
  ; "string_of_int",    ([TInt], RetVal (TRef RString))
  ; "string_cat",       ([TRef RString; TRef RString], RetVal (TRef RString))
  ; "print_string",     ([TRef RString],  RetVoid)
  ; "print_int",        ([TInt], RetVoid)
  ; "print_bool",       ([TBool], RetVoid)
  ]

(* binary operation types --------------------------------------------------- *)
let typ_of_binop : Ast.binop -> Ast.ty * Ast.ty * Ast.ty = function
  | Add | Mul | Sub | Shl | Shr | Sar | IAnd | IOr -> (TInt, TInt, TInt)
  | Lt | Lte | Gt | Gte -> (TInt, TInt, TBool)
  | And | Or -> (TBool, TBool, TBool)
  | Eq | Neq -> failwith "typ_of_binop called on polymorphic == or !="

(* unary operation types ---------------------------------------------------- *)
let typ_of_unop : Ast.unop -> Ast.ty * Ast.ty = function
  | Neg | Bitnot -> (TInt, TInt)
  | Lognot       -> (TBool, TBool)

(* subtyping ---------------------------------------------------------------- *)
(* Decides whether H |- t1 <: t2 
    - assumes that H contains the declarations of all the possible struct types

    - you will want to introduce addition (possibly mutually recursive) 
      helper functions to implement the different judgments of the subtyping
      relation. We have included a template for subtype_ref to get you started.
      (Don't forget about OCaml's 'and' keyword.)
*)
let rec subtype (c : Tctxt.t) (t1 : Ast.ty) (t2 : Ast.ty) : bool =
  match t1, t2 with
  | TBool, TBool | TInt, TInt -> true
  | TRef r1, TRef r2 -> subtype_ref c r1 r2
  | TNullRef r1, TNullRef r2 -> subtype_ref c r1 r2
  | TRef r1, TNullRef r2 -> subtype_ref c r1 r2  (* non-null <: nullable *)
  | _ -> false

(* Decides whether H |-r ref1 <: ref2 *)
and subtype_ref (c : Tctxt.t) (t1 : Ast.rty) (t2 : Ast.rty) : bool =
  match t1, t2 with
  | RString, RString -> true
  | RArray u1, RArray u2 -> u1 = u2
  | RStruct id1, RStruct id2 -> id1 = id2
  | RFun (args1, ret1), RFun (args2, ret2) ->
      List.length args1 = List.length args2 &&
      List.for_all2 (subtype c) args2 args1 && (* contravariant in arguments *)
      subtype_ret c ret1 ret2 (* covariant in return *)
  | _ -> false

and subtype_ret (c : Tctxt.t) (r1 : Ast.ret_ty) (r2 : Ast.ret_ty) : bool =
  match r1, r2 with
  | RetVoid, RetVoid -> true
  | RetVal t1, RetVal t2 -> subtype c t1 t2
  | _ -> false


(* well-formed types -------------------------------------------------------- *)
(* Implement a (set of) functions that check that types are well formed according
   to the H |- t and related inference rules

    - the function should succeed by returning () if the type is well-formed
      according to the rules

    - the function should fail using the "type_error" helper function if the 
      type is not well-formed

    - l is just an ast node that provides source location information for
      generating error messages (it's only needed for the type_error generation)

    - tc contains the structure definition context
 *)
let rec typecheck_ty (l : 'a Ast.node) (tc : Tctxt.t) (t : Ast.ty) : unit =
  match t with
  | TBool | TInt -> ()
  | TRef r | TNullRef r -> typecheck_rty l tc r

and typecheck_rty (l : 'a Ast.node) (tc : Tctxt.t) (r : Ast.rty) : unit =
  match r with
  | RString -> ()
  | RArray t -> typecheck_ty l tc t
  | RStruct id -> 
      if lookup_struct_option id tc = None then
        type_error l ("Undefined struct: " ^ id)
  | RFun (args, ret) ->
      List.iter (typecheck_ty l tc) args;
      typecheck_ret_ty l tc ret

and typecheck_ret_ty (l : 'a Ast.node) (tc : Tctxt.t) (r : Ast.ret_ty) : unit =
  match r with
  | RetVoid -> ()
  | RetVal t -> typecheck_ty l tc t

(* typechecking expressions ------------------------------------------------- *)
(* Typechecks an expression in the typing context c, returns the type of the
   expression.  This function should implement the inference rules given in the
   oad.pdf specification.  There, they are written:

       H; G; L |- exp : t

   See tctxt.ml for the implementation of the context c, which represents the
   four typing contexts: H - for structure definitions G - for global
   identifiers L - for local identifiers

   Returns the (most precise) type for the expression, if it is type correct
   according to the inference rules.

   Uses the type_error function to indicate a (useful!) error message if the
   expression is not type correct.  The exact wording of the error message is
   not important, but the fact that the error is raised, is important.  (Our
   tests also do not check the location information associated with the error.)

   Notes: - Structure values permit the programmer to write the fields in any
   order (compared with the structure definition).  This means that, given the
   declaration struct T { a:int; b:int; c:int } The expression new T {b=3; c=4;
   a=1} is well typed.  (You should sort the fields to compare them.)

*)
let rec typecheck_exp (c : Tctxt.t) (e : Ast.exp node) : Ast.ty =
  match e.elt with
  | CNull r -> 
      typecheck_rty e c r;
      TNullRef r
  | CBool _ -> TBool
  | CInt _ -> TInt
  | CStr _ -> TRef RString
  
  | CArr (ty, es) ->
      typecheck_ty e c ty;
      List.iter (fun exp -> 
        let t = typecheck_exp c exp in
        if not (subtype c t ty) then
          type_error exp ("Array element type mismatch")
      ) es;
      TRef (RArray ty)
  
  | NewArr (ty, e1, id, e2) ->
      typecheck_ty e c ty;
      let t1 = typecheck_exp c e1 in
      if not (subtype c t1 TInt) then
        type_error e1 ("Array size must be int");
      let c' = add_local c id TInt in
      let t2 = typecheck_exp c' e2 in
      if not (subtype c t2 ty) then
        type_error e2 ("Array initializer type mismatch");
      TRef (RArray ty)
  
  | CStruct (id, fields) ->
      begin match lookup_struct_option id c with
      | None -> type_error e ("Undefined struct: " ^ id)
      | Some struct_fields ->
          let sorted_fields = List.sort (fun f1 f2 -> 
            String.compare f1.fieldName f2.fieldName) struct_fields in
          let sorted_init = List.sort (fun (n1, _) (n2, _) -> 
            String.compare n1 n2) fields in
          
          if List.length sorted_fields <> List.length sorted_init then
            type_error e "Struct field count mismatch";
          
          List.iter2 (fun field (name, init_exp) ->
            if field.fieldName <> name then
              type_error e ("Field name mismatch: expected " ^ field.fieldName);
            let init_ty = typecheck_exp c init_exp in
            if not (subtype c init_ty field.ftyp) then
              type_error init_exp ("Field type mismatch for " ^ name)
          ) sorted_fields sorted_init;
          TRef (RStruct id)
      end
  
  | Proj (e1, field) ->
      let t = typecheck_exp c e1 in
      begin match t with
      | TRef (RStruct id) ->
          begin match lookup_field_option id field c with
          | None -> type_error e ("Field not found: " ^ field)
          | Some fty -> fty
          end
      | TNullRef (RStruct id) -> 
          type_error e1 "Cannot project field from nullable struct reference"
      | _ -> type_error e1 "Projection requires struct type"
      end
  
  | Id id ->
      begin match lookup_option id c with
      | None -> type_error e ("Undefined identifier: " ^ id)
      | Some t -> t
      end
  
  | Index (e1, e2) ->
      let t1 = typecheck_exp c e1 in
      let t2 = typecheck_exp c e2 in
      if not (subtype c t2 TInt) then
        type_error e2 "Array index must be int";
      begin match t1 with
      | TRef (RArray elt_ty) -> elt_ty
      | TNullRef (RArray elt_ty) -> 
          type_error e1 "Cannot index into nullable array reference"
      | _ -> type_error e1 "Index requires array type"
      end
  
  | Length e1 ->
      let t = typecheck_exp c e1 in
      begin match t with
      | TRef (RArray _) -> TInt
      | TNullRef (RArray _) -> 
          type_error e1 "Cannot get length of nullable array reference"
      | _ -> type_error e1 "Length requires array type"
      end
  
  | Call (e1, args) ->
      let t = typecheck_exp c e1 in
      begin match t with
      | TRef (RFun (param_tys, ret_ty)) ->
          if List.length args <> List.length param_tys then
            type_error e "Function argument count mismatch";
          List.iter2 (fun arg param_ty ->
            let arg_ty = typecheck_exp c arg in
            if not (subtype c arg_ty param_ty) then
              type_error arg "Function argument type mismatch"
          ) args param_tys;
          begin match ret_ty with
          | RetVal t -> t
          | RetVoid -> type_error e "Void function used in expression"
          end
      | _ -> type_error e1 "Call requires function type"
      end
  
  | Bop (bop, e1, e2) ->
      begin match bop with
      | Eq | Neq ->
          let t1 = typecheck_exp c e1 in
          let t2 = typecheck_exp c e2 in
          if not (subtype c t1 t2 || subtype c t2 t1) then
            type_error e "Incompatible types for equality";
          TBool
      | _ ->
          let (t1_expected, t2_expected, ret_ty) = typ_of_binop bop in
          let t1 = typecheck_exp c e1 in
          let t2 = typecheck_exp c e2 in
          if not (subtype c t1 t1_expected) then
            type_error e1 "Binary operator left operand type mismatch";
          if not (subtype c t2 t2_expected) then
            type_error e2 "Binary operator right operand type mismatch";
          ret_ty
      end
  
  | Uop (uop, e1) ->
      let (t_expected, ret_ty) = typ_of_unop uop in
      let t = typecheck_exp c e1 in
      if not (subtype c t t_expected) then
        type_error e1 "Unary operator operand type mismatch";
      ret_ty

(* statements --------------------------------------------------------------- *)

(* Typecheck a statement 
   This function should implement the statement typechecking rules from oat.pdf.  

   Inputs:
    - tc: the type context
    - s: the statement node
    - to_ret: the desired return type (from the function declaration)

   Returns:
     - the new type context (which includes newly declared variables in scope
       after this statement
     - A boolean indicating the return behavior of a statement:
        false:  might not return
        true: definitely returns 

        in the branching statements, both branches must definitely return

        Intuitively: if one of the two branches of a conditional does not 
        contain a return statement, then the entier conditional statement might 
        not return.
  
        looping constructs never definitely return 

   Uses the type_error function to indicate a (useful!) error message if the
   statement is not type correct.  The exact wording of the error message is
   not important, but the fact that the error is raised, is important.  (Our
   tests also do not check the location information associated with the error.)

   - You will probably find it convenient to add a helper function that implements the 
     block typecheck rules.
*)
let rec typecheck_stmt (tc : Tctxt.t) (s:Ast.stmt node) (to_ret:ret_ty) : Tctxt.t * bool =
  match s.elt with
  | Assn (lhs, rhs) ->
      (* Check that lhs is not a function identifier *)
      begin match lhs.elt with
      | Id id ->
          begin match lookup_option id tc with
          | Some (TRef (RFun _)) -> type_error lhs "Cannot assign to function identifier"
          | _ -> ()
          end
      | _ -> ()
      end;
      let lhs_ty = typecheck_exp tc lhs in
      let rhs_ty = typecheck_exp tc rhs in
      if not (subtype tc rhs_ty lhs_ty) then
        type_error s "Assignment type mismatch";
      (tc, false)
  
  | Decl (id, init) ->
      let init_ty = typecheck_exp tc init in
      let tc' = add_local tc id init_ty in
      (tc', false)
  
  | Ret None ->
      if to_ret <> RetVoid then
        type_error s "Return type mismatch: expected value";
      (tc, true)
  
  | Ret (Some e) ->
      let e_ty = typecheck_exp tc e in
      begin match to_ret with
      | RetVoid -> type_error s "Return type mismatch: expected void"
      | RetVal expected_ty ->
          if not (subtype tc e_ty expected_ty) then
            type_error s "Return type mismatch";
          (tc, true)
      end
  
  | SCall (f, args) ->
      let f_ty = typecheck_exp tc f in
      begin match f_ty with
      | TRef (RFun (param_tys, ret_ty)) ->
          (* SCall should only be used with void functions *)
          if ret_ty <> RetVoid then
            type_error s "Statement call of non-void function";
          if List.length args <> List.length param_tys then
            type_error s "Function argument count mismatch";
          List.iter2 (fun arg param_ty ->
            let arg_ty = typecheck_exp tc arg in
            if not (subtype tc arg_ty param_ty) then
              type_error arg "Function argument type mismatch"
          ) args param_tys;
          (tc, false)
      | _ -> type_error s "Call requires function type"
      end
  
  | If (guard, then_block, else_block) ->
      let guard_ty = typecheck_exp tc guard in
      if not (subtype tc guard_ty TBool) then
        type_error guard "If guard must be bool";
      let then_returns = typecheck_block tc then_block to_ret in
      let else_returns = typecheck_block tc else_block to_ret in
      (tc, then_returns && else_returns)
  
  | Cast (rty, id, e, notnull_block, null_block) ->
      let e_ty = typecheck_exp tc e in
      begin match e_ty with
      | TNullRef r ->
          if not (subtype_ref tc r rty) then
            type_error e "Cast type mismatch";
          let tc_notnull = add_local tc id (TRef rty) in
          let notnull_returns = typecheck_block tc_notnull notnull_block to_ret in
          let null_returns = typecheck_block tc null_block to_ret in
          (tc, notnull_returns && null_returns)
      | _ -> type_error e "Cast requires nullable reference"
      end
  
  | While (guard, body) ->
      let guard_ty = typecheck_exp tc guard in
      if not (subtype tc guard_ty TBool) then
        type_error guard "While guard must be bool";
      let _ = typecheck_block tc body to_ret in
      (tc, false)
  
  | For (inits, guard, update, body) ->
      let tc' = List.fold_left (fun acc_tc (id, init) ->
        let init_ty = typecheck_exp acc_tc init in
        add_local acc_tc id init_ty
      ) tc inits in
      begin match guard with
      | Some g ->
          let guard_ty = typecheck_exp tc' g in
          if not (subtype tc' guard_ty TBool) then
            type_error g "For guard must be bool"
      | None -> ()
      end;
      begin match update with
      | Some upd -> ignore (typecheck_stmt tc' upd to_ret)
      | None -> ()
      end;
      let _ = typecheck_block tc' body to_ret in
      (tc, false)

and typecheck_block (tc : Tctxt.t) (stmts : Ast.block) (to_ret : ret_ty) : bool =
  let _, returns = List.fold_left (fun (acc_tc, acc_returns) stmt ->
    if acc_returns then
      (* Already returned - this is unreachable code, which is an error *)
      type_error stmt "Unreachable code after return"
    else
      let tc', stmt_returns = typecheck_stmt acc_tc stmt to_ret in
      (tc', stmt_returns)
  ) (tc, false) stmts in
  returns


(* struct type declarations ------------------------------------------------- *)
(* Here is an example of how to implement the TYP_TDECLOK rule, which is 
   is needed elswhere in the type system.
 *)

(* Helper function to look for duplicate field names *)
let rec check_dups fs =
  match fs with
  | [] -> false
  | h :: t -> (List.exists (fun x -> x.fieldName = h.fieldName) t) || check_dups t

let typecheck_tdecl (tc : Tctxt.t) id fs  (l : 'a Ast.node) : unit =
  if check_dups fs
  then type_error l ("Repeated fields in " ^ id) 
  else List.iter (fun f -> typecheck_ty l tc f.ftyp) fs

(* function declarations ---------------------------------------------------- *)
(* typecheck a function declaration 
    - extends the local context with the types of the formal parameters to the 
      function
    - typechecks the body of the function (passing in the expected return type
    - checks that the function actually returns
*)
let typecheck_fdecl (tc : Tctxt.t) (f : Ast.fdecl) (l : 'a Ast.node) : unit =
  let {frtyp; args; body} = f in
  (* Add parameters to local context *)
  let tc_body = List.fold_left (fun acc_tc (ty, id) ->
    typecheck_ty l acc_tc ty;
    add_local acc_tc id ty
  ) tc args in
  (* Check function body *)
  let returns = typecheck_block tc_body body frtyp in
  (* Ensure non-void functions return *)
  match frtyp with
  | RetVoid -> ()
  | RetVal _ -> 
      if not returns then
        type_error l ("Function must return a value")

(* creating the typchecking context ----------------------------------------- *)

(* The following functions correspond to the
   judgments that create the global typechecking context.

   create_struct_ctxt: - adds all the struct types to the struct 'H'
   context (checking to see that there are no duplicate fields

     H |-s prog ==> H'


   create_function_ctxt: - adds the the function identifiers and their
   types to the 'G' context (ensuring that there are no redeclared
   function identifiers)

     H ; G1 |-f prog ==> G2


   create_global_ctxt: - typechecks the global initializers and adds
   their identifiers to the 'G' global context

     H ; G1 |-g prog ==> G2    


   NOTE: global initializers may mention function identifiers as
   constants, but can't mention other global values *)

let create_struct_ctxt (p:Ast.prog) : Tctxt.t =
  List.fold_left (fun acc decl ->
    match decl with
    | Gtdecl {elt=(id, fields); loc} ->
        if lookup_struct_option id acc <> None then
          type_error {elt=(); loc} ("Duplicate struct definition: " ^ id);
        if check_dups fields then
          type_error {elt=(); loc} ("Duplicate fields in struct: " ^ id);
        add_struct acc id fields
    | _ -> acc
  ) empty p

let create_function_ctxt (tc:Tctxt.t) (p:Ast.prog) : Tctxt.t =
  (* First pass: add built-in functions *)
  let tc_with_builtins = List.fold_left (fun acc (name, (args, ret)) ->
    add_global acc name (TRef (RFun (args, ret)))
  ) tc builtins in
  (* Second pass: add user-defined functions *)
  List.fold_left (fun acc decl ->
    match decl with
    | Gfdecl {elt={frtyp; fname; args}; loc} ->
        if lookup_global_option fname acc <> None then
          type_error {elt=(); loc} ("Duplicate function definition: " ^ fname);
        let arg_tys = List.map fst args in
        add_global acc fname (TRef (RFun (arg_tys, frtyp)))
    | _ -> acc
  ) tc_with_builtins p

let create_global_ctxt (tc:Tctxt.t) (p:Ast.prog) : Tctxt.t =
  (* First pass: collect all global variable declarations and check for duplicates *)
  let globals = List.fold_left (fun acc decl ->
    match decl with
    | Gvdecl {elt={name; init}; loc} ->
        if lookup_global_option name tc <> None then
          type_error {elt=(); loc} ("Duplicate global variable: " ^ name);
        (name, init, loc) :: acc
    | _ -> acc
  ) [] p in
  
  (* Second pass: typecheck all global initializers (they can only see functions, not other globals) *)
  List.iter (fun (name, init, loc) ->
    let init_ty = typecheck_exp tc init in
    (* Check that initializer doesn't reference other global variables *)
    let rec check_no_global_refs (e : Ast.exp node) =
      match e.elt with
      | Id id ->
          begin match lookup_global_option id tc with
          | Some (TRef (RFun _)) -> () (* Functions are OK *)
          | Some _ -> 
              if List.exists (fun (gname, _, _) -> gname = id) globals then
                type_error e ("Global initializer cannot reference global variable: " ^ id)
          | None -> ()
          end
      | CInt _ | CBool _ | CStr _ | CNull _ -> ()
      | CArr (_, es) -> List.iter check_no_global_refs es
      | NewArr (_, e1, _, e2) -> check_no_global_refs e1; check_no_global_refs e2
      | CStruct (_, fields) -> List.iter (fun (_, e) -> check_no_global_refs e) fields
      | Bop (_, e1, e2) -> check_no_global_refs e1; check_no_global_refs e2
      | Uop (_, e1) -> check_no_global_refs e1
      | Index (e1, e2) -> check_no_global_refs e1; check_no_global_refs e2
      | Proj (e1, _) -> check_no_global_refs e1
      | Length e1 -> check_no_global_refs e1
      | Call (e1, es) -> check_no_global_refs e1; List.iter check_no_global_refs es
    in
    check_no_global_refs init
  ) globals;
  
  (* Third pass: add all globals to context *)
  List.fold_left (fun acc (name, init, loc) ->
    let init_ty = typecheck_exp tc init in
    add_global acc name init_ty
  ) tc globals


(* This function implements the |- prog and the H ; G |- prog 
   rules of the oat.pdf specification.   
*)
let typecheck_program (p:Ast.prog) : unit =
  let sc = create_struct_ctxt p in
  let fc = create_function_ctxt sc p in
  let tc = create_global_ctxt fc p in
  List.iter (fun p ->
    match p with
    | Gfdecl ({elt=f} as l) -> typecheck_fdecl tc f l
    | Gtdecl ({elt=(id, fs)} as l) -> typecheck_tdecl tc id fs l 
    | _ -> ()) p