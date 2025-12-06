(** Alias Analysis *)

open Ll
open Datastructures

(* The lattice of abstract pointers ----------------------------------------- *)
module SymPtr =
  struct
    type t = MayAlias           (* uid names a pointer that may be aliased *)
           | Unique             (* uid is the unique name for a pointer *)
           | UndefAlias         (* uid is not in scope or not a pointer *)

    let compare : t -> t -> int = Pervasives.compare

    let to_string = function
      | MayAlias -> "MayAlias"
      | Unique -> "Unique"
      | UndefAlias -> "UndefAlias"

  end

(* The analysis computes, at each program point, which UIDs in scope are a unique name
   for a stack slot and which may have aliases *)
type fact = SymPtr.t UidM.t

let join_symptr (a:SymPtr.t) (b:SymPtr.t) : SymPtr.t =
  match a, b with
  | SymPtr.UndefAlias, x | x, SymPtr.UndefAlias -> x
  | SymPtr.Unique, SymPtr.Unique -> SymPtr.Unique
  | _ , _ -> SymPtr.MayAlias
  
let merge_two (d1:fact) (d2:fact) : fact =
    UidM.merge (fun _ v1 v2 ->
      match v1, v2 with
      | None, None -> None
      | Some v, None | None, Some v -> Some v
      | Some v1', Some v2' -> Some (join_symptr v1' v2')
    ) d1 d2

(* flow function across Ll instructions ------------------------------------- *)
(* TASK: complete the flow function for alias analysis. 

   - After an alloca, the defined UID is the unique name for a stack slot
   - A pointer returned by a load, call, bitcast, or GEP may be aliased
   - A pointer passed as an argument to a call, bitcast, GEP, or store
     may be aliased
   - Other instructions do not define pointers

 *)
let insn_flow ((u,i):uid * insn) (d:fact) : fact =
  match i with
  | Alloca _ -> UidM.add u SymPtr.Unique d
  | Load (Ptr (Ptr _), _) -> UidM.add u SymPtr.MayAlias d
  | Call (ret_t, _, args) ->
      let d' =
        List.fold_left (fun acc (t, op) ->
          (match t, op with
           | Ptr _, Id arg_uid -> UidM.add arg_uid SymPtr.MayAlias acc
           | _ -> acc)
        ) d args
      in
      (match ret_t with
       | Ptr _ -> UidM.add u SymPtr.MayAlias d'
       | _ -> d')
  | Gep (_, Id v, _)
  | Bitcast (_,Id v,_) -> d |> UidM.add v SymPtr.MayAlias
                            |> UidM.add u SymPtr.MayAlias
  | Bitcast _
  | Gep (_,_,_) -> d |> UidM.add u SymPtr.MayAlias
  | _ -> d

  (* | Bitcast (t1, op, t2) ->

      let d1 = (match t1 with
       | Ptr _ -> (match op with
           | Id op_uid -> UidM.add op_uid SymPtr.MayAlias d
           | _ -> d)
       | _ -> d) in

       let d2 = (match t2 with
        | Ptr _ -> UidM.add u SymPtr.MayAlias d
        | _ -> d) in
        merge_two d1 d2
      
  | Gep (t, op, oprnds) ->
      let d1 = (match t with
       | Ptr _ -> UidM.add u SymPtr.MayAlias d
       | _ -> d) in
      List.fold_left (fun acc oprnd ->
        match oprnd with
        | Id oprnd_uid -> UidM.add oprnd_uid SymPtr.MayAlias acc
        | _ -> acc
      ) d1 oprnds
  | Store (Ptr _, Id uid , _) -> UidM.add uid SymPtr.MayAlias d *)
  (* | _ -> d  *)
  (* | _ -> failwith "Other cases unimplemented in Alias.insn_flow" *)

(* The flow function across terminators is trivial: they never change alias info *)
let terminator_flow t (d:fact) : fact = d

(* module for instantiating the generic framework --------------------------- *)
module Fact =
  struct
    type t = fact
    let forwards = true

    let insn_flow = insn_flow
    let terminator_flow = terminator_flow
    
    (* UndefAlias is logically the same as not having a mapping in the fact. To
       compare dataflow facts, we first remove all of these *)
    let normalize : fact -> fact = 
      UidM.filter (fun _ v -> v != SymPtr.UndefAlias)

    let compare (d:fact) (e:fact) : int = 
      UidM.compare SymPtr.compare (normalize d) (normalize e)

    let to_string : fact -> string =
      UidM.to_string (fun _ v -> SymPtr.to_string v)

    (* TASK: complete the "combine" operation for alias analysis.

       The alias analysis should take the join over predecessors to compute the
       flow into a node. You may find the UidM.merge function useful.

       It may be useful to define a helper function that knows how to take the
       join of two SymPtr.t facts.
    *)

    let combine (ds:fact list) : fact =
      List.fold_left merge_two UidM.empty ds
  end

(* instantiate the general framework ---------------------------------------- *)
module Graph = Cfg.AsGraph (Fact)
module Solver = Solver.Make (Fact) (Graph)

(* expose a top-level analysis operation ------------------------------------ *)
let analyze (g:Cfg.t) : Graph.t =
  (* the analysis starts with every node set to bottom (the map of every uid 
     in the function to UndefAlias *)
  let init l = UidM.empty in

  (* the flow into the entry node should indicate that any pointer parameter 
     to the function may be aliased *)
  let alias_in = 
    List.fold_right 
      (fun (u,t) -> match t with
                    | Ptr _ -> UidM.add u SymPtr.MayAlias
                    | _ -> fun m -> m) 
      g.Cfg.args UidM.empty 
  in
  let fg = Graph.of_cfg init alias_in g in
  Solver.solve fg
