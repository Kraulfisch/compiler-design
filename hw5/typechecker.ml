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
  match t1,t2 with
  | Ast.TInt, Ast.TInt -> true
  | Ast.TBool, Ast.TBool -> true
  | Ast.TNullRef r1, Ast.TNullRef r2 -> subtype_ref c r1 r2
  | Ast.TRef r1, Ast.TRef r2 -> subtype_ref c r1 r2
  | Ast.TRef r1, Ast.TNullRef r2 -> subtype_ref c r1 r2
  | _ -> false

(* Decides whether H |-r ref1 <: ref2 *)
and subtype_ref (c : Tctxt.t) (t1 : Ast.rty) (t2 : Ast.rty) : bool =
  match (t1, t2) with
  | Ast.RString, Ast.RString -> true                            (* SUB_SUBSTRING *)
  | Ast.RArray arr_t1 , Ast. RArray arr_t2 -> arr_t1 = arr_t2   (* SUB_SUBARRAY *)
  | RStruct id1, RStruct id2 -> 
    if id1 = id2 then true
      (* The bigger struct is a subtype of the smaller one:
         makes sense when comparing to inheritance: when a smaller struct is
         expected, the larger one will also suffice *)
    else  
      (* If the structs are not the same, follow the subtyping rule: SUB_SUBSTRUCT *)
      (* I.e. S1 <: S2 if S2 has fields t1 x1, ... ,tn xn and
                          S1 has fields t1 x1, ... , tn xn, plus possibly more *)
      (match (Tctxt.lookup_struct_option id1 c, Tctxt.lookup_struct_option id2 c) with
      | (Some fields1, Some fields2) ->
          (* fields here are lists of Ast.id * Ast.field list *)
          (* idea: for each field with name and type x_i t_i in S2,
                   check wether that type also exists in S1 *)
          List.for_all (fun f2 -> 
              List.exists ( fun f1 ->
                  f1.fieldName = f2.fieldName && 
                  subtype c f1.ftyp f2.ftyp
              ) fields1
            ) fields2

      | _ -> false)
  | RFun (arg_types1, ret_type1), RFun (arg_types2, ret_type2) ->
    let rec check_args args1 args2 =
      match (args1, args2) with
      | ([], []) -> true
      | (a1::t1, a2::t2) ->
        if subtype c a2 a1 then 
          check_args t1 t2
        else
          false
      | _ -> false
    in
    check_args arg_types1 arg_types2 && subtype_ret c ret_type1 ret_type2
      
  | _ -> false


and subtype_ret (c: Tctxt.t) (t1: Ast.ret_ty) (t2: Ast.ret_ty) : bool =
  match (t1, t2) with
  | Ast.RetVoid, Ast.RetVoid -> true
  | Ast.RetVal tt1, Ast.RetVal tt2 -> subtype c tt1 tt2
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
  | Ast.TInt -> ()
  | Ast.TBool -> ()
  | Ast.TRef r -> typecheck_rty l tc r
  | Ast.TNullRef r -> typecheck_rty l tc r
and typecheck_rty (l : 'a Ast.node) (tc : Tctxt.t) (r : Ast.rty) : unit =
  match r with
  | Ast.RString -> ()
  | Ast.RArray t -> typecheck_ty l tc t
  | Ast.RStruct id ->
    (* following the rule: stuct S {fields} \in H *)
    (* I guess this translates to all fields must be typechecked
       i.e. all (fun f -> typecheck_ty tc f.ftyp) fields_of_S *)
    (match Tctxt.lookup_struct_option id tc with
    | None -> type_error l ("Undefined struct type: " ^ id)
    | Some fields -> List.iter (fun f -> typecheck_ty l tc f.ftyp) fields)
  | Ast.RFun (arg_types, ret_type) ->
    (* simply typecheck all arguments and then the return type in unit fashion *)
    List.iter (fun arg -> typecheck_ty l tc arg) arg_types;
    typecheck_ret_ty l tc ret_type
and typecheck_ret_ty (l : 'a Ast.node) (tc : Tctxt.t) (r : Ast.ret_ty) : unit =
  match r with 
  | Ast.RetVoid -> ()
  | Ast.RetVal t -> typecheck_ty l tc t

(* typechecking expressions ------------------------------------------------- *)
(* Typechecks an expression in the typing context c, returns the type of the
   expression.  This function should implement the inference rules given in the
   oat.pdf specification.  There, they are written:

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
  (* Firstly the TYP_X rules: *)
  | CNull r -> Ast.TNullRef r
  | CBool b -> Ast.TBool
  | CInt i -> Ast.TInt
  | CStr s -> Ast.TRef Ast.RString
  (* TYP Local and global: *)
   | Id id ->
    (match (Tctxt.lookup_local_option id c) with
    | Some ty -> ty
    | None -> (* Continue looking in the Global context*)
         (match (Tctxt.lookup_global_option id c) with
        | Some ty -> ty
        | None -> type_error e ("Undefined identifier: " ^ id)
        )
    )
  | CArr (ty, expressions) -> 
    (* new t[]{expr1, ..., exprn} has type t[] if:
          t is well typed
          exp1, ..., expn of type t1,..,tn are in the context (global local or struct) and
          each t_i is a subtype of t
      *)

    (* if Tctxt.lookup_struct_option *)
    typecheck_ty e c ty;  (* check that ty is well formed *)
    List.iter (fun exp ->
      let exp_type = typecheck_exp c exp in
      if not (subtype c exp_type ty) then
        type_error exp ("Array element type " ^ (Astlib.string_of_ty exp_type) ^
                        " is not a subtype of array type " ^ (Astlib.string_of_ty ty))
    ) expressions;
    Ast.TRef (Ast.RArray ty)
  | NewArr (ty, size_exp, id, init_exp) ->
    (* new t[size] (x => exp2) has type t[] if:
          t is well typed
          size is of type int
          x \not \in local context
          type of exp2 is t2 and t2 is a subtype of t *)
    typecheck_ty e c ty;  (* check that ty is well formed *)
    let size_type = typecheck_exp c size_exp in
    if not (subtype c size_type Ast.TInt) then
      type_error size_exp ("Array size expression must be of type int, found " ^ (Astlib.string_of_ty size_type));
    let c_with_id = Tctxt.add_local c id ty in
    let init_type = typecheck_exp c_with_id init_exp in
    if not (subtype c init_type ty) then
      type_error init_exp ("Array initializer expression type " ^ (Astlib.string_of_ty init_type) ^
                           " is not a subtype of array type " ^ (Astlib.string_of_ty ty));
    Ast.TRef (Ast.RArray ty)

  | Index (arr_exp, index_exp) ->
    (* exp1[exp2] has type t if:
          exp1 is of type t[]
          exp2 is of type int *)
    let arr_type = typecheck_exp c arr_exp in
    let index_type = typecheck_exp c index_exp in
    if not (subtype c index_type Ast.TInt) then
      type_error index_exp ("Array index expression must be of type int, found " ^ (Astlib.string_of_ty index_type));
    (match arr_type with
    | Ast.TRef (Ast.RArray t) -> t
    (* | Ast.TNullRef (Ast.RArray t) -> t *)
    | _ -> type_error arr_exp ("Array indexing requires a non-null array type, found " ^ (Astlib.string_of_ty arr_type))
    )

  | Length arr_exp ->
    (* length(exp) has type int if:
          exp is of type t[] *)
    let arr_type = typecheck_exp c arr_exp in
    (match arr_type with
    | Ast.TRef (Ast.RArray t) -> Ast.TInt
    (* | Ast.TNullRef (Ast.RArray t) -> Ast.TInt *)
    | _ -> type_error arr_exp ("Length operator requires a non-null array type, found " ^ (Astlib.string_of_ty arr_type))
    )
  
  | CStruct (id, field_inits) ->
    (* new S {f1=exp1, ..., fn=expn} has type S if:
          struct S {f1:t1; ... fn:tn} \in H
          for each exp_i of type t_i' in the context, t_i' <: t_i
          all fields of S are initialized in the expression
          also the order of the fields does not matter 
          \-> (hence presort the fields to check)
          \-> or better: for each field in S, check that it is initialized in the expression
      *)
    (match Tctxt.lookup_struct_option id c with
    | None -> type_error e ("Undefined struct type: " ^ id)
    | Some fields ->
      (* check that all fields are initialized and types match - order does not matter *)
      let field_types = List.fold_left (fun acc f -> (f.fieldName, f.ftyp)::acc) [] fields in
      List.iter (fun (fname, fexp) ->
        (match List.assoc_opt fname field_types with
        | None -> type_error fexp ("Field " ^ fname ^ " is not a member of struct " ^ id)
        | Some ftype ->
          let fexp_type = typecheck_exp c fexp in
          if not (subtype c fexp_type ftype) then
            type_error fexp ("Field " ^ fname ^ " initializer type " ^ (Astlib.string_of_ty fexp_type) ^
                             " is not a subtype of field type " ^ (Astlib.string_of_ty ftype))
        )
      ) field_inits;
      (* check that all fields are initialized *)
      List.iter (fun (fname, ftype) ->
        if not (List.exists (fun (init_fname, _) -> init_fname = fname) field_inits) then
          type_error e ("Field " ^ fname ^ " of struct " ^ id ^ " is not initialized")
      ) field_types;
      Ast.TRef (Ast.RStruct id)
    )
  (* This is TYP_FIELD rule. Projections appear to be struct field accessess *)
  | Proj (struct_exp, field_name) ->
    (* exp.f has type t if:
          exp is of type S
          struct S { ... f:t ... } \in H 
          t f \in fields of S
          *)
    let struct_type = typecheck_exp c struct_exp in
    (match struct_type with
    | TRef (RStruct id) ->
      (match Tctxt.lookup_struct_option id c with
      | None -> type_error struct_exp ("Undefined struct type: " ^ id)
      | Some fields ->
        (match List.find_opt (fun f -> f.fieldName = field_name) fields with
        | None -> type_error struct_exp ("Field " ^ field_name ^ " not found in struct " ^ id)
        | Some field -> field.ftyp
        )
      )
    | _ -> type_error struct_exp ("Projection requires a non-null struct type, found " ^ (Astlib.string_of_ty struct_type))
    )

  | Call (fn_exp, arg_exps) ->
    (* exp1(exp2, ..., expn) has type t_ret if:
          exp1 is of type (t1, ..., tn) -> t_ret
          for each exp_i of type t_i' in the context, t_i' <: t_i
      *)
    let fn_type = typecheck_exp c fn_exp in
    (match fn_type with
    | TRef (RFun (param_types, ret_type)) ->
      if List.length param_types <> List.length arg_exps then
        type_error fn_exp ("Function call argument count mismatch: expected " ^
                           string_of_int (List.length param_types) ^
                           ", found " ^ string_of_int (List.length arg_exps));
      List.iter2 (fun param_type arg_exp ->
        let arg_type = typecheck_exp c arg_exp in
        if not (subtype c arg_type param_type) then
          type_error arg_exp ("Function call argument type " ^ (Astlib.string_of_ty arg_type) ^
                             " is not a subtype of parameter type " ^ (Astlib.string_of_ty param_type))
      ) param_types arg_exps;
      (match ret_type with
      (* An expression must have a type *)
      | RetVoid -> type_error fn_exp "Function call of void function used in expression context"
      | RetVal t -> t
      )
    | _ -> type_error fn_exp ("Function call requires a non-null function type, found " ^ (Astlib.string_of_ty fn_type))
    )
  | Bop (bop, e1, e2) ->
    (* exp1 bop exp1 has type t if:
        bop has type (t1, t2) -> t
        exp1 has type t1 
        exp2 has type t2
      *)
    (match bop with
    | Eq | Neq ->
      (* TYP_EQ rule:     (Neq is the same as Eq here)
          exp1 == exp2 has type bool if:
            exp1 has type t1
            exp2 has type t2
            t1 <: t2 and t2 <: t1
      *)
      let e1_type = typecheck_exp c e1 in
      let e2_type = typecheck_exp c e2 in
      if not (subtype c e1_type e2_type) then
        type_error e1 ("Left operand of == has type " ^ (Astlib.string_of_ty e1_type) ^
                      ", which is not a subtype of right operand type " ^ (Astlib.string_of_ty e2_type));
      if not (subtype c e2_type e1_type) then
        type_error e2 ("Right operand of == has type " ^ (Astlib.string_of_ty e2_type) ^
                      ", which is not a subtype of left operand type " ^ (Astlib.string_of_ty e1_type));
      Ast.TBool
    | _ -> 
      let (expected_t1, expected_t2, result_t) = typ_of_binop bop in
      let e1_type = typecheck_exp c e1 in
      let e2_type = typecheck_exp c e2 in
      if not (subtype c e1_type expected_t1) then
        type_error e1 ("Left operand of binary operator has type " ^ (Astlib.string_of_ty e1_type) ^
                      ", expected " ^ (Astlib.string_of_ty expected_t1));
      if not (subtype c e2_type expected_t2) then
        type_error e2 ("Right operand of binary operator has type " ^ (Astlib.string_of_ty e2_type) ^
                      ", expected " ^ (Astlib.string_of_ty expected_t2));
      result_t
    )
  
  | Uop (unop, exp) ->
    (* uop exp has type t if:
        uop has type t -> t
        exp has type t
      *)
    let (expected_t, result_t) = typ_of_unop unop in
    let exp_type = typecheck_exp c exp in
    if not (subtype c exp_type expected_t) then
      type_error exp ("Operand of unary operator has type " ^ (Astlib.string_of_ty exp_type) ^
                    ", expected " ^ (Astlib.string_of_ty expected_t));
    result_t
  

  


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
        contain a return statement, then the entire conditional statement might 
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
  (* returns the new context after the statement s including newly declared variables in scope *)
  failwith "TODO: stmt"
  (* match s.elt with
  | Ast.Assn (lhs, rhs) ->
    (* idea: lookup lhs in the local context 
                    update it's value to rhs if present
                or: add rhs' value to local context if not present
    *)
    let lhs_type = typecheck_exp tc lhs in
    let rhs_type = typecheck_exp tc rhs in
    if subtype tc rhs_type lhs_type then
      (* add lhs to the context and return (new context, false)*)
      (match lhs.elt with
      | Id id -> (Tctxt.add_local tc id lhs_type, false)
      | CStruct (id, _) -> (Tctxt.add_global tc id lhs_type, false)
      | _ -> (tc, false)
      )
    else
      type_error s ("Type mismatch in assignment: cannot assign " ^
                    (Astlib.string_of_ty rhs_type) ^ " to " ^
                    (Astlib.string_of_ty lhs_type))


  | Decl (vdecl) -> failwith "todo decl"
  | Ret (exp_opt) -> failwith "todo ret"
  | _ -> failwith "todo others" *)
  


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
  (* 1. Add function args to the context
     2. typecheck the entire body of the function using ___
     3. ?? check for function return ?? *)
  failwith "TODO: typecheck_fdecl"
  (* let tc_with_args = List.fold_left (fun acc_tc (arg_ty, arg_id) ->
      Tctxt.add_local acc_tc arg_id arg_ty
    ) tc f.args in
  List.iter (fun s ->
    let (tc_after_body, does_return) = typecheck_stmt tc_with_args s f.frtyp in
    if not does_return then
      type_error l ("Function " ^ f.fname ^ " might not return")
    else
      ()

  ) f.body *)

(* creating the typechecking context ----------------------------------------- *)

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
  (* failwith "todo: create_struct_ctxt" *)
  (* Add all the struct types to the struct 'H' (checking to see that there are not duplicate fields)
       H |-s prog ==> H'
    Note that a global initializers may mention function identifiers as constants,
    but can't mention other global values *)
  
  (* Follow the H1 |-s prog ==> H2 rule from oat specifications *)

  let rec add_structs tc prog =
    match prog with
    (* TYP_SEMPTY *)
    | [] -> tc
    | h :: t ->
      (match h with
      (* TYP_STDECL *)
      | Gtdecl ({elt=(id, fields)} as l) ->
        (* struct S{fields} prog ==> H2 if
            S \not \in H1
            H1, struct S{fields} |-s prog ==> H2 
            ---->> which means: add struct S{fields} to H1 to get H1'
                              then continue with prog and H1' to get H2 recursively
          *)
        (match Tctxt.lookup_struct_option id tc with
        | Some _ -> type_error l ("Duplicate struct identifier: " ^ id)
        | None ->
          (* First check that all fields are distinct by iterating 
             over all field names and checking if it has already been seen *)
          if check_dups fields then
            type_error l ("Repeated fields in struct " ^ id)
          else
            typecheck_tdecl tc id fields l;
            let tc_with_struct = Tctxt.add_struct tc id fields in
            add_structs tc_with_struct t
        )
      | _ ->
        (* TYP_SGDECL and TYP_SFDECL rule: *)
        (* H1 |-s g\f decl prog ==> H2 if:
            H1 |-s prog ==> H2
            ---->> just continue with prog and H1 to get H2 recursively ignore g/f decls
        *)
        add_structs tc t
      )
  in
  add_structs Tctxt.empty p


let check_duplicate_function_identifiers (c:Tctxt.t) (l:Ast.fdecl) : bool =
  (match Tctxt.lookup_global_option l.fname c with
  | None -> false
  | Some x -> true
  )

let fdecl_to_type (tc:Tctxt.t) (f:Ast.fdecl) : Ast.ty =
  (* H |- fdecl ==> id : t
    rt f(t1 x1, ..., tn xn) { ... }  ==>  f : (t1, ..., tn) -> rt if
      each t_i is well formed
      rt is well formed (ret_ty)
  *)
  let arg_types = List.map (fun (ty, _) -> ty) f.args in
  let func_type = TRef (RFun (arg_types, f.frtyp)) in
  typecheck_ret_ty (no_loc 0) tc f.frtyp;
  List.iter (fun (ty, _) -> typecheck_ty (no_loc 0) tc ty) f.args;
  func_type


let create_function_ctxt (tc:Tctxt.t) (p:Ast.prog) : Tctxt.t =
  (* adds the the function identifiers and their types to 
     the 'G' context (ensuring that there are no redeclared function identifiers)
       H ; G1 |-f prog ==> G2 *)

  let rec add_function tc prog =
    (match prog with
    | [] -> tc (* TYP_FEMPTY *)
    | h :: t ->
      (match h with
      | Gfdecl ({elt=f} as l) -> (* TYP_FFDECL *)
        (* duplicate check *)
        if check_duplicate_function_identifiers tc f then
          type_error l ("Duplicate function identifier: " ^ f.fname)
        else
          (* let arg_types = List.map (fun (ty, _) -> ty) f.args in *)
          (* also check that all function argument names are distinct *)
          if check_duplicate_function_identifiers tc f then
            type_error l ("Duplicate function identifier: " ^ f.fname)
          else
            List.iter (fun (_, arg_id) ->
              if List.length (List.filter (fun (_, id) -> id = arg_id) f.args) > 1 then
                type_error l ("Duplicate argument name: " ^ arg_id)
            ) f.args;
            let func_type = fdecl_to_type tc f in
            let tc' = Tctxt.add_global tc f.fname func_type in
            add_function tc' t
      | _ -> (* TYP_FGDECL and TYP_FTDECL rule ignore the other declarations and continue recursively *)
        add_function tc t
      )
    )
  in
  add_function tc p

let contains_global_identifiers (e:Ast.exp Ast.node) (tc:Tctxt.t) : bool =
  let rec aux exp =
    match exp.elt with
    | Id id ->
      (match Tctxt.lookup_global_option id tc with
      | Some _ -> true
      | None -> false)
    | CArr (_, exprs) ->
      List.exists aux exprs
    | NewArr (_, size_exp, _, init_exp) ->
      aux size_exp || aux init_exp
    | Index (arr_exp, index_exp) ->
      aux arr_exp || aux index_exp
    | Length arr_exp ->
      aux arr_exp
    | CStruct (_, field_inits) ->
      List.exists (fun (_, fexp) -> aux fexp) field_inits
    | Proj (struct_exp, _) ->
      aux struct_exp
    | Call (fn_exp, arg_exps) ->
      aux fn_exp || List.exists aux arg_exps
    | Bop (_, e1, e2) ->
      aux e1 || aux e2
    | Uop (_, exp) ->
      aux exp
    | _ -> false
  in
  aux e

let create_global_ctxt (tc:Tctxt.t) (p:Ast.prog) : Tctxt.t =
  (* create_global_ctxt: - typechecks the global initializers and adds
   their identifiers to the 'G' global context

     H ; G1 |-g prog ==> G2     *)

  (* NOTE: global initializers may mention function identifiers as
   constants, but can't mention other global values *)

  let rec add_globals tc prog =
    match prog with
    | [] -> tc
    | h::t ->
      (match h with
      | Gvdecl ({elt=g} as l) -> (* TYP_GGDECL*)
        (* H;G1 |-g global x = gexp; prog => G2 if 
           gexp contains no global variables/identifiers
            type of gexp is t
            x \not \in G1
            H; G1, x:t |-g prog => G2
          *)
        if Tctxt.lookup_global_option g.name tc <> None then
          type_error l ("Duplicate global identifier: " ^ g.name)
        else
          let init_type = typecheck_exp tc g.init in
          typecheck_ty l tc init_type;
          (* check that gexp contains no global variables *)
          (match contains_global_identifiers g.init tc with
          | true -> type_error l ("Global initializer for " ^ g.name ^ " contains global identifiers")
          | false -> let tc' = Tctxt.add_global tc g.name init_type in
                      add_globals tc' t
          )

      | _ -> add_globals tc t) (* again, ignore f and t decls*)
  in
  add_globals tc p

   
  (* let rec global_helper tc prog =
    match prog with
    | [] -> tc
    | h::t ->
      (match h with
      | Gvdecl ({elt=g} as l) ->
        let init_type = typecheck_exp tc g.init in
        typecheck_ty l tc init_type;
        let tc' = Tctxt.add_global tc g.name init_type in
        global_helper tc' t
      | _ -> global_helper tc t)
  in
  global_helper tc p *)


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
