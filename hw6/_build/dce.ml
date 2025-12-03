(** Dead Code Elimination  *)
open Ll
open Datastructures
open Alias


(* expose a top-level analysis operation ------------------------------------ *)
(* TASK: This function should optimize a block by removing dead instructions
   - lb: a function from uids to the live-OUT set at the 
     corresponding program point
   - ab: the alias map flowing IN to each program point in the block
   - b: the current ll block

   Note: 
     Call instructions are never considered to be dead (they might produce
     side effects)

     Store instructions are not dead if the pointer written to is live _or_
     the pointer written to may be aliased.

     Other instructions are dead if the value they compute is not live.

   Hint: Consider using List.filter
 *)
let dce_block (lb:uid -> Liveness.Fact.t) 
              (ab:uid -> Alias.fact)
              (b:Ll.block) : Ll.block =
  let live_out u = lb u in
  let alias_in u = ab u in
  let keep_insn uid insn = 
    let is_uid_in_live_set x = try UidS.mem x (live_out uid) with Not_found -> false in
    let alias_map = alias_in uid in
    (match insn with
      | Call _ -> true
      | Store (_, _, Id ptr_uid) -> 
          let ptr_live = is_uid_in_live_set ptr_uid in
          let may_alias =
            match UidM.find_opt ptr_uid alias_map with
            | Some SymPtr.MayAlias -> true
            | _ -> false
          in
          may_alias || ptr_live
      | Store _ -> true
      | _ -> is_uid_in_live_set uid 
    ) in
  let keep_insns = List.filter (fun (uid, insn) -> keep_insn uid insn) b.insns in
  { insns = keep_insns; term = b.term }
  

let run (lg:Liveness.Graph.t) (ag:Alias.Graph.t) (cfg:Cfg.t) : Cfg.t =

  LblS.fold (fun l cfg ->
    let b = Cfg.block cfg l in

    (* compute liveness at each program point for the block *)
    let lb = Liveness.Graph.uid_out lg l in

    (* compute aliases at each program point for the block *)
    let ab = Alias.Graph.uid_in ag l in 

    (* compute optimized block *)
    let b' = dce_block lb ab b in
    Cfg.add_block l b' cfg
  ) (Cfg.nodes cfg) cfg

