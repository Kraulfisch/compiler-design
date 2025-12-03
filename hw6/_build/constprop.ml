open Ll
open Datastructures

(* The lattice of symbolic constants ---------------------------------------- *)
module SymConst =
  struct
    type t = NonConst           (* Uid may take on multiple values at runtime *)
           | Const of int64     (* Uid will always evaluate to const i64 or i1 *)
           | UndefConst         (* Uid is not defined at the point *)

    let compare s t =
      match (s, t) with
      | (Const i, Const j) -> Int64.compare i j
      | (NonConst, NonConst) | (UndefConst, UndefConst) -> 0
      | (NonConst, _) | (_, UndefConst) -> 1
      | (UndefConst, _) | (_, NonConst) -> -1

    let to_string : t -> string = function
      | NonConst -> "NonConst"
      | Const i -> Printf.sprintf "Const (%LdL)" i
      | UndefConst -> "UndefConst"

    
  end

(* The analysis computes, at each program point, which UIDs in scope will evaluate 
   to integer constants *)
type fact = SymConst.t UidM.t



let op_to_symconst (op:operand) (d:fact) : SymConst.t =
  match op with
  | Const i -> SymConst.Const i
  | Id u -> (try UidM.find u d with Not_found -> SymConst.UndefConst)
  | _ -> SymConst.NonConst

(* flow function across Ll instructions ------------------------------------- *)
(* - Uid of a binop or icmp with const arguments is constant-out
   - Uid of a binop or icmp with an UndefConst argument is UndefConst-out
   - Uid of a binop or icmp with an NonConst argument is NonConst-out
   - Uid of stores and void calls are UndefConst-out
   - Uid of all other instructions are NonConst-out
 *)
let insn_flow (u,i:uid * insn) (d:fact) : fact =
  match i with
  | Icmp (cnd, _, op1, op2) ->
    let sc1 = op_to_symconst op1 d in
    let sc2 = op_to_symconst op2 d in
    let result = (match sc1, sc2 with
                 | SymConst.Const v1, SymConst.Const v2 ->
                    let res = match cnd with
                      | Eq -> Int64.compare v1 v2 = 0
                      | Ne -> Int64.compare v1 v2 <> 0
                      | Slt -> Int64.compare v1 v2 < 0
                      | Sle -> Int64.compare v1 v2 <= 0
                      | Sgt -> Int64.compare v1 v2 > 0
                      | Sge -> Int64.compare v1 v2 >= 0
                    in
                    (SymConst.Const (if res then Int64.one else Int64.zero))
                 | SymConst.UndefConst, _ | _, SymConst.UndefConst -> SymConst.UndefConst
                 | SymConst.NonConst, _ | _, SymConst.NonConst ->  SymConst.NonConst
                 | _ ->  SymConst.UndefConst
                 ) in
    UidM.add u result d
  | Binop (bop, _, op1, op2) ->
  (* Need to look up op1 and op2 to see wether they are Const, Undef or NonConst and 
  return const-out, undefConst-out, or NonConst-out respectively *)
    let sc1 = op_to_symconst op1 d in
    let sc2 = op_to_symconst op2 d in
    let result = (match sc1, sc2 with
                 | SymConst.Const v1, SymConst.Const v2 ->
                    let res = match bop with
                      | Add -> Int64.add v1 v2
                      | Sub -> Int64.sub v1 v2
                      | Mul -> Int64.mul v1 v2
                      | Shl -> Int64.shift_left v1 (Int64.to_int v2)
                      | Lshr -> Int64.shift_right_logical v1 (Int64.to_int v2)
                      | Ashr -> Int64.shift_right v1 (Int64.to_int v2)
                      | And -> Int64.logand v1 v2
                      | Or  -> Int64.logor v1 v2
                      | Xor -> Int64.logxor v1 v2
                    in
                    (SymConst.Const res)
                 | SymConst.UndefConst, _ | _, SymConst.UndefConst -> SymConst.UndefConst
                 | SymConst.NonConst, _ | _, SymConst.NonConst ->  SymConst.NonConst
                 | _ ->  SymConst.UndefConst
                 ) in
    UidM.add u result d

  | Store _ | Call (Void, _, _) -> UidM.add u SymConst.UndefConst d
  | _ -> UidM.add u SymConst.NonConst d

(* The flow function across terminators is trivial: they never change const info *)
let terminator_flow (t:terminator) (d:fact) : fact = d

(* module for instantiating the generic framework --------------------------- *)
module Fact =
  struct
    type t = fact
    let forwards = true

    let insn_flow = insn_flow
    let terminator_flow = terminator_flow
    
    let normalize : fact -> fact = 
      UidM.filter (fun _ v -> v != SymConst.UndefConst)

    let compare (d:fact) (e:fact) : int  = 
      UidM.compare SymConst.compare (normalize d) (normalize e)

    let to_string : fact -> string =
      UidM.to_string (fun _ v -> SymConst.to_string v)

    (* The constprop analysis should take the meet over predecessors to compute the
       flow into a node. You may find the UidM.merge function useful *)
    let combine (ds:fact list) : fact = 
      let empty_fact = UidM.empty in
      List.fold_left (fun acc d ->
        UidM.merge (fun key val1 val2 -> 
          (match (val1, val2) with
          | (None, None) -> None
          | (Some v, None) | (None, Some v) -> Some v
          | Some SymConst.UndefConst, Some v| Some v, Some SymConst.UndefConst -> Some v
          | Some SymConst.NonConst, _ | _, Some SymConst.NonConst -> Some SymConst.NonConst
          | (Some (SymConst.Const i1), Some (SymConst.Const i2)) ->
            Some (if Int64.compare i1 i2 = 0 then SymConst.Const i1
                  else SymConst.NonConst)
          )) acc d
      ) empty_fact ds
  end

(* instantiate the general framework ---------------------------------------- *)
module Graph = Cfg.AsGraph (Fact)
module Solver = Solver.Make (Fact) (Graph)

(* expose a top-level analysis operation ------------------------------------ *)
let analyze (g:Cfg.t) : Graph.t =
  (* the analysis starts with every node set to bottom (the map of every uid 
     in the function to UndefConst *)
  let init l = UidM.empty in

  (* the flow into the entry node should indicate that any parameter to the
     function is not a constant *)
  let cp_in = List.fold_right 
    (fun (u,_) -> UidM.add u SymConst.NonConst)
    g.Cfg.args UidM.empty 
  in
  let fg = Graph.of_cfg init cp_in g in
  Solver.solve fg


(* run constant propagation on a cfg given analysis results ----------------- *)
(* HINT: your cp_block implementation will probably rely on several helper 
   functions.                                                                 *)
let run (cg:Graph.t) (cfg:Cfg.t) : Cfg.t =
  let open SymConst in
  

  let cp_block (l:Ll.lbl) (cfg:Cfg.t) : Cfg.t =
    let b: block = Cfg.block cfg l in
    let cb: uid -> fact = Graph.uid_out cg l in
    (* Iterate over the cfg and applying the knowledge of each node
       to simplify instructions in the block and produce a new cfg with constants propagated
       from node to node and put in their respective places.
    *)
    let simplify_op (op: Ll.operand) (d: fact): Ll.operand = 
      (match op with
      | Id u -> (match UidM.find_opt u d with
                | Some (Const i) -> Const i
                | _ -> op)
      | _ -> op
      ) in
    let simplify_insn (insns: Ll.insn) (d: fact): Ll.insn =
      match insns with
      | Binop (bop, ty, op1, op2) -> Binop (bop, ty, simplify_op op1 d, simplify_op op2 d)
      | Alloca ty -> Alloca ty
      | Load (ty, op) -> Load (ty, simplify_op op d)
      | Store (ty, op1, op2) -> Store (ty, simplify_op op1 d, simplify_op op2 d)
      | Icmp (cnd, ty, op1, op2) -> Icmp (cnd, ty, simplify_op op1 d, simplify_op op2 d)
      | Call (ret_ty, fn_op, args) -> 
          Call (ret_ty, simplify_op fn_op d, List.map (fun (ty, operand) -> (ty, simplify_op operand d)) args)
      | Bitcast (ty1, op, ty2) -> Bitcast (ty1, simplify_op op d, ty2)
      | Gep (ty, op, ops) -> Gep (ty, simplify_op op d, List.map (fun o -> simplify_op o d) ops)
    in
    let rec process_insns (insns: (uid * insn) list) (prev_d: fact) : (uid * insn) list * fact = 
      (match insns with
      | [] -> ([], prev_d)
      | (uid, insn)::rest -> 
          let simplified_insn = simplify_insn insn prev_d in
          (* let new_d = Fact.insn_flow (uid, simplified_insn) prev_d in *)
          let new_d = cb uid in
          (* (uid, simplified_insn) :: process_insns rest new_d, new_d *)
          let rest_insns, final_d = process_insns rest new_d in
          ( (uid, simplified_insn) :: rest_insns, final_d )
      ) in
    let simplify_term (term: Ll.terminator) (d: fact) : Ll.terminator = 
      (match term with
      | Ret (ty, None) -> Ret (ty, None)
      | Ret (ty, Some op) -> Ret (ty, Some (simplify_op op d))
      | Br lbl -> Br lbl
      | Cbr (op, lbl1, lbl2) -> Cbr (simplify_op op d, lbl1, lbl2)
      )
    in
    let entry_facts = Graph.block_in cg l in
    let new_insns, facts_after_block = process_insns b.insns entry_facts in
    let term_uid, term_term = b.term in
    let new_block = { insns = new_insns; term = (term_uid, simplify_term term_term facts_after_block) } in
    Cfg.add_block l new_block cfg
  in

  LblS.fold cp_block (Cfg.nodes cfg) cfg
