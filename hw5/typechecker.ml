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
  match (t1, t2) with
  | (TBool, TBool) -> true
  | (TInt, TInt) -> true
  | (TRef ref1, TRef ref2) -> subtype_ref c ref1 ref2
  | (TNullRef nref1, TNullRef nref2) -> subtype_ref c nref1 nref2
  | (TRef ref1, TNullRef nref2) -> subtype_ref c ref1 nref2
  | _ -> false
(* Decides whether H |-r ref1 <: ref2 *)
and subtype_ref (c : Tctxt.t) (t1 : Ast.rty) (t2 : Ast.rty) : bool =
  match (t1, t2) with
  | (RString, RString) -> true
  | (RStruct id1, RStruct id2) -> id1 = id2
  | (RArray arr1, RArray arr2) -> subtype c arr1 arr2
  | (RFun (arg1, ret1), RFun (arg2, ret2)) -> subtype_args c arg1 arg2 && subtype_ret c ret1 ret2
  | _ -> false
and subtype_ret (c : Tctxt.t) (t1: Ast.ret_ty) (t2: Ast.ret_ty) : bool =
  match (t1, t2) with
  | (RetVoid, RetVoid) -> true
  | (RetVal ret1, RetVal ret2) -> subtype c ret1 ret2
  | _ -> false

and subtype_args (c : Tctxt.t) (arg1: Ast.ty list) (arg2: Ast.ty list) : bool =
  try
    List.for_all2 (fun ty1 ty2 -> subtype c ty2 ty1) arg1 arg2
  with
    Invalid_argument _ -> false
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
  | TBool -> ()
  | TInt -> ()
  | TRef r -> typecheck_rty l tc r
  | TNullRef r -> typecheck_rty l tc r

and typecheck_rty (l : 'a Ast.node) (tc : Tctxt.t) (t : Ast.rty) : unit =
  match t with
  | RString -> ()
  | RArray arr -> typecheck_ty l tc arr
  | RStruct id -> begin match lookup_struct_option id tc with 
                  | Some _ -> ()
                  | None -> type_error l ("Undefined struct type: " ^ id)
                  end
  | RFun (args, ret) ->
      List.iter (typecheck_ty l tc) args;
      typecheck_ret_ty l tc ret

and typecheck_ret_ty (l : 'a Ast.node) (tc : Tctxt.t) (t : Ast.ret_ty) : unit =
  match t with
  | RetVoid -> ()
  | RetVal v -> typecheck_ty l tc v


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
  | CNull r -> TNullRef r
  | CBool b -> TBool    
  | CInt i -> TInt
  | CStr s -> TRef RString
  | Id id -> lookup id c
  | CArr (ty, ndelst) ->
      typecheck_ty e c ty;
      List.iter (fun arg ->
        let t = typecheck_exp c arg in
        let flag = subtype c t ty in 
        if not flag then type_error arg "Typecheck_exp_CArr"
      ) ndelst;
      
      TRef (RArray ty)
  | Index (arr, idx) -> 
      let t_arr = typecheck_exp c arr in
      let t_idx = typecheck_exp c idx in
      begin match (t_arr, t_idx) with
      | (TRef (RArray t), TInt) -> t
      | _ -> type_error e "Typecheck_exp_Index" 
      end
  | Length arr ->
      begin match typecheck_exp c arr with
      | TRef (RArray _) -> TInt
      | _ -> type_error e "Typecheck_exp_Length" 
      end
  | CStruct (id, fields) ->
      begin match lookup_struct_option id c with
      | None -> type_error e "typecheck_exp Struct not found"
      | Some def_fields ->
          let sorted_defs = List.sort (fun f1 f2 -> String.compare f1.fieldName f2.fieldName) def_fields in 
          let sorted_fields = List.sort (fun (id1, _) (id2, _) -> String.compare id1 id2) fields in
          (try List.iter2 (fun f_def (f_id, f_exp) ->
            if f_def.fieldName = f_id then
            let t = typecheck_exp c f_exp in 
            if subtype c t f_def.ftyp then () else type_error e "typecheck_exp_CStruct"
            else type_error e "typecheck_exp_CStruct"
          ) sorted_defs sorted_fields
          with Invalid_argument _ -> type_error e "typecheck_exp_CStruct");
          
          TRef (RStruct id)
      end
  | Proj (e, id) ->
      let t_struct = typecheck_exp c e in
      begin match t_struct with
      | TRef (RStruct struct_id) | TNullRef (RStruct struct_id) ->
          begin match lookup_field_option struct_id id c with
          | Some t -> t 
          | None -> type_error e "typecheck_exp_Proj Field doesnt exist"
          end
      | _ -> type_error e "typecheck_exp_Proj Not A Struct"
      end
  | Bop (binop, exp1, exp2) -> 
      let exp_t1 = typecheck_exp c exp1 in 
      let exp_t2 = typecheck_exp c exp2 in 
      begin match binop with
      | Eq | Neq -> if subtype c exp_t1 exp_t2 || subtype c exp_t2 exp_t1 then TBool else type_error e "typecheck_ext_Bop_bool"
      | _ -> let (t1, t2, ret_ty) = typ_of_binop binop in
             if subtype c exp_t1 t1 && subtype c exp_t2 t2 then ret_ty else type_error e "typecheck_ext_Bop"
      end
  | Uop (uop, exp1) -> let exp_t1 = typecheck_exp c exp1 in
                       let (t1, ret_ty) = typ_of_unop uop in 
                       if subtype c exp_t1 t1 then ret_ty else type_error e "typecheck_ext_Unop"
  | Call (f, args) ->
      let t_f = typecheck_exp c f in
      begin match t_f with
      | TRef (RFun (param_types, ret_ty)) ->
          let args_ty = List.map (fun (arg : Ast.exp node) -> typecheck_exp c arg) args in 
          if subtype_args c param_types args_ty then 
          begin match ret_ty with
          | RetVal t -> t 
          | RetVoid -> type_error e "typecheck_ext_Call_void"
          end
          else type_error e "typecheck_ext_Call"          
      | _ -> type_error e "typecheck_ext_Call Not a function"
      end
  | NewArr (elem_ty, len, id, init) ->
      typecheck_ty e c elem_ty;
      let new_ctxt = Tctxt.add_local c id TInt in
      if typecheck_exp c len = TInt && subtype new_ctxt (typecheck_exp new_ctxt init) elem_ty then 
         TRef (RArray elem_ty)
      else 
         type_error e "typecheck_ext_NewArr"


      
          




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
  | Decl (id, init) -> let t = typecheck_exp tc init in
                       let new_ctxt = Tctxt.add_local tc id t in 
                       (new_ctxt, false)
  | Assn (lhs, rhs) -> let t_lhs = typecheck_exp tc lhs in  
                       let t_rhs = typecheck_exp tc rhs in 
                       begin match lhs.elt with
                       | Id _ | Index _ | Proj _ -> if subtype tc t_rhs t_lhs then (tc, false) else type_error s "Typecheck_stmt_assn_elt"
                       | _ -> type_error s "Typecheck_stmt_Assn"
                       end
  | If (grd, blk1, blk2) -> let t1 = typecheck_block tc blk1 to_ret in 
                            let t2 = typecheck_block tc blk2 to_ret in
                            begin match typecheck_exp tc grd with
                            | TBool -> if t1 && t2 then (tc, true) else (tc, false)
                            | _ -> type_error s "Typecheck_stmt_If"
                            end
  | While (grd, blk) -> if typecheck_exp tc grd = TBool then 
                        (ignore (typecheck_block tc blk to_ret); 
                        (tc, false))
                        else type_error s "Typecheck_stmt_While"
  | Ret ret_option -> begin match (ret_option, to_ret) with
                        | (None, RetVoid) -> (tc, true)
                        | (Some e, RetVal r) -> if subtype tc (typecheck_exp tc e) r then (tc, true) else type_error s "Typecheck_stmt_Ret"
                        | _ -> type_error s "Typecheck_stmt_Ret"
                      end
  | SCall (f, args) -> ignore (typecheck_exp tc, f); (tc, false)
  | Cast (ref_ty, id, e, blk1, blk2) ->
      let t_e = typecheck_exp tc e in
      if subtype tc t_e (TNullRef ref_ty) then
        let new_ctxt = Tctxt.add_local tc id (TRef ref_ty) in 
        let t1 = typecheck_block new_ctxt blk1 to_ret in 
        let t2 = typecheck_block tc blk2 to_ret in
        if t1 && t2 then (tc, true) else (tc, false)
      else
         type_error s "typecheck_stmt_cast"
  | For (vdecls, guard_opt, after_opt, body) ->
      let loop_ctxt = List.fold_left (fun acc_tc (id, init) ->
          let t = typecheck_exp acc_tc init in
          Tctxt.add_local acc_tc id t
      ) tc vdecls in
      (match guard_opt with
       | Some e -> 
           if typecheck_exp loop_ctxt e = TBool then () 
           else type_error s "typecheck_stmt_for"
       | None -> ());
      (match after_opt with
       | Some s_after -> ignore (typecheck_stmt loop_ctxt s_after to_ret)
       | None -> ());
      ignore (typecheck_block loop_ctxt body to_ret);
      (tc, false)



and typecheck_block (tc : Tctxt.t) (stmts : Ast.stmt node list) (to_ret : Ast.ret_ty) : bool =
    let (_, returns) = List.fold_left (fun (acc_tc, acc_ret) s ->
      let (new_ctxt, b) = typecheck_stmt acc_tc s to_ret in
      (new_ctxt, (b || acc_ret))
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
  let local_ctxt = List.fold_left (fun c (t, id) -> 
    Tctxt.add_local c id t
  ) tc f.args in
  let returns = typecheck_block local_ctxt f.body f.frtyp in
  begin match f.frtyp with
  | RetVoid -> () 
  | RetVal _ -> 
      if returns then () 
      else type_error l "typecheck_fdecl"
  end

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
  List.fold_left (fun c d ->
    match d with
    | Ast.Gtdecl ({ elt=(id, fs) } as l) -> 
        begin match lookup_struct_option id c with
        | Some _ -> type_error l "create_struct_ctxt"
        | None -> 
            if check_dups fs 
            then type_error l "create_struct_ctxt_dubs" 
            else Tctxt.add_struct c id fs
        end
    | _ -> c 
  ) Tctxt.empty p

let create_function_ctxt (tc:Tctxt.t) (p:Ast.prog) : Tctxt.t =
    List.fold_left (fun c d ->
    match d with
    | Ast.Gfdecl ({ elt={frtyp; fname; args; body} } as l) -> 
        begin match lookup_global_option fname c with
        | Some _ -> type_error l "create_function_ctxt"
        | None -> 
            let arg_ty = List.map (fun (a, b) -> {fieldName = b; ftyp = a}) args in
            if check_dups arg_ty
            then type_error l "create_function_ctxt_dubs" 
            else Tctxt.add_global c fname (TRef (RFun (List.map (fun (a, b) -> a) args, frtyp)))
        end
    | _ -> c 
  ) Tctxt.empty p

let create_global_ctxt (tc:Tctxt.t) (p:Ast.prog) : Tctxt.t =
  failwith "todo: create_global_ctxt"


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
