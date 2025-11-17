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
  failwith "todo: implement typecheck_exp"

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
  failwith "todo: implement typecheck_stmt"


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
  let tc_with_args = List.fold_left (fun acc_tc (arg_ty, arg_id) ->
      Tctxt.add_local acc_tc arg_id arg_ty
    ) tc f.args in
  (* let (tc_after_body, does_return) = List.iter (fun s -> typecheck_stmt tc_with_args s f.frtyp) f.body  in
  if not does_return then
    type_error l ("Function " ^ f.fname ^ " might not return")
  else
    () *)
  List.iter (fun s ->
    let (tc_after_body, does_return) = typecheck_stmt tc_with_args s f.frtyp in
    if not does_return then
      type_error l ("Function " ^ f.fname ^ " might not return")
    else
      ()

  ) f.body

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
  (* failwith "todo: create_struct_ctxt" *)
  (* Add all the struct types to the struct 'H' (checking to see that there are not duplicate fields)
       H |-s prog ==> H'
  *)
  let rec add_structs tc prog =
    match prog with
    | [] -> tc
    | h :: t ->
      (match h with
      | Gtdecl ({elt=(id, fs)} as l) ->
        typecheck_tdecl tc id fs l;
        (match check_dups fs with
        | true -> failwith "Duplicate fieldnames in create_struct_ctxt"
        | _ -> let tc' = Tctxt.add_struct tc id fs in
          add_structs tc' t )
      | _ -> add_structs tc t)
  in
  add_structs Tctxt.empty p


let check_duplicate_function_identifiers (c:Tctxt.t) (l:Ast.fdecl) : bool =
  (match Tctxt.lookup_global_option l.fname c with
  | None -> false
  | Some x -> true
  )

let create_function_ctxt (tc:Tctxt.t) (p:Ast.prog) : Tctxt.t =
  (* adds the the function identifiers and their types to 
     the 'G' context (ensuring that there are no redeclared function identifiers)
       H ; G1 |-f prog ==> G2 *)
  let rec func_helper tc prog =
    (match prog with
    | [] -> tc
    | h::t ->
      (match h with
      | Gfdecl ({elt=f} as l) ->
        typecheck_fdecl tc f l;
        (match check_duplicate_function_identifiers tc f with
        | true -> failwith "Duplicate funciton identifiers in create_function_ctxt!"
        | _ -> (* function identifier does not yet exist, add it to the context*)
          let arg_types = List.map (fun (ty, _) -> ty) f.args in
          let func_type = TRef (RFun (arg_types, f.frtyp)) in
          let tc' = Tctxt.add_global tc f.fname func_type in
          func_helper tc' t
        )

      | _ -> func_helper tc t
      )) in
  func_helper tc p

let create_global_ctxt (tc:Tctxt.t) (p:Ast.prog) : Tctxt.t =
  failwith "todo: create_function_ctxt"


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
