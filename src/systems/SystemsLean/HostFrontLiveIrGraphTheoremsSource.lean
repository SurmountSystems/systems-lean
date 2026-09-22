/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live IrGraphTheorems.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveIrGraphTheoremsSource. Not occupancy name 50. Not mill 70.
  This wrap is IrGraphTheorems.lean. It is not IrGraph.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveIrGraphTheoremsSource, liveRel,
  HOST-FRONT-LIVE-IR-GRAPH-THEOREMS, PARSE-LIVE-IR-GRAPH-THEOREMS.
  Module: SystemsLean.HostFrontLiveIrGraphTheoremsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveIrGraphTheorems

/-- Dual-pinned live IrGraphTheorems.lean bytes (must match on-disk file).
    Greppable: liveIrGraphTheoremsSource, liveRel. -/
def liveIrGraphTheoremsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- IrGraph IR-GRAPH-THEOREM + IR-GRAPH-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file peel from SystemsLean.IrGraph: theorems and behavioral smoke live
  here; Edge / Graph dialect, edgeMax, pushNode / addEdge, isWellTyped, and
  checkFailClosed stay in IrGraph. Same namespace SystemsLean.IrGraph so theorem
  names stay unqualified under that namespace.

  Spec (readable):
  - IR-GRAPH-THEOREM / HOST-IR-GRAPH-THEOREM: isWellTyped_empty_true /
    empty_well_typed / checkFailClosed_eq_isWellTyped / empty_isEmpty /
    edgeMax_eq_sixteen / addEdge_empty_badEndpoints / edgesSound_empty /
    isWellTyped_one_node_empty_edges / pushNode_value_one_ok /
    addEdge_one_node_self_ok / addEdge_one_node_badEndpoints /
    edgesSound_one_edge / isWellTyped_two_nodes_one_edge / addEdge_two_nodes_ok /
    edgesSound_two_edges / isWellTyped_two_nodes_two_edges /
    addEdge_two_nodes_second_ok / addEdge_two_nodes_badEndpoints /
    edgesSound_oversize_false / edgesSound_at_edgeMax /
    isWellTyped_at_edgeMax / addEdge_full_at_edgeMax /
    isWellTyped_oversize_false.
  - IR-GRAPH-SMOKE: empty graph / edgeMax / badEndpoints / multi-node edge /
    capacity full / oversize edgesSound behavioral examples (lake build fails
    if example fails).

  These IrGraph theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial theorems on IrGraph != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete. Nested IrProgram.empty stays EMPTY-PROGRAM-FAIL-CLOSED.
  - Not full IR_GRAPH_EDGES_V0 C reimplementation. Not residual free.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, IR_GRAPH_EDGES_V0, IR-GRAPH-EDGES,
  SLAKE_IR_EDGE_MAX, EMPTY-GRAPH-OK, FAIL-CLOSED, IR-GRAPH-THEOREM,
  HOST-IR-GRAPH-THEOREM, IR-GRAPH-SMOKE, isWellTyped_empty_true,
  empty_well_typed, checkFailClosed_eq_isWellTyped, empty_isEmpty,
  edgeMax_eq_sixteen, addEdge_empty_badEndpoints, edgesSound_empty,
  isWellTyped_one_node_empty_edges, pushNode_value_one_ok,
  addEdge_one_node_self_ok, addEdge_one_node_badEndpoints,
  edgesSound_one_edge, isWellTyped_two_nodes_one_edge, addEdge_two_nodes_ok,
  edgesSound_two_edges, isWellTyped_two_nodes_two_edges,
  addEdge_two_nodes_second_ok, addEdge_two_nodes_badEndpoints,
  edgesSound_oversize_false, edgesSound_at_edgeMax, isWellTyped_at_edgeMax,
  addEdge_full_at_edgeMax, isWellTyped_oversize_false, IrGraphTheorems,
  UNIT_SURFACE host surface, RUNTIME-FS.
  Module: SystemsLean.IrGraphTheorems
  Red/green: just systems-host; lake build SystemsLean.IrGraphTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrProgram
import SystemsLean.IrGraph

namespace SystemsLean.IrGraph

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind)
open SystemsLean.IrProgram (Program)

/-! ### IR-GRAPH-THEOREM / HOST-IR-GRAPH-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is EMPTY-GRAPH-OK
  and cheap edge/capacity contracts only. Does not complete SpecProof; does not
  claim residual free / freestanding product self-host complete / PROVABLY.
  Nested IrProgram.empty remains EMPTY-PROGRAM-FAIL-CLOSED (not re-proved here).
-/

/-- EMPTY-GRAPH-OK core: empty graph is well-typed at graph surface.
    Greppable: isWellTyped_empty_true, EMPTY-GRAPH-OK, IR-GRAPH-THEOREM,
    HOST-IR-GRAPH-THEOREM. -/
theorem isWellTyped_empty_true : isWellTyped empty = true := rfl

/-- Alias of isWellTyped_empty_true (readable EMPTY-GRAPH-OK name).
    Greppable: empty_well_typed, EMPTY-GRAPH-OK, IR-GRAPH-THEOREM. -/
theorem empty_well_typed : isWellTyped empty = true := isWellTyped_empty_true

/-- checkFailClosed is definitionally isWellTyped.
    Greppable: checkFailClosed_eq_isWellTyped, IR-GRAPH-THEOREM. -/
theorem checkFailClosed_eq_isWellTyped (g : Graph) :
    checkFailClosed g = isWellTyped g := rfl

/-- Empty graph has no nodes and no edges.
    Greppable: empty_isEmpty, IR-GRAPH-THEOREM. -/
theorem empty_isEmpty : isEmpty empty = true := rfl

/-- Capacity honesty: edgeMax matches emit SLAKE_IR_EDGE_MAX.
    Greppable: edgeMax_eq_sixteen, SLAKE_IR_EDGE_MAX, IR-GRAPH-THEOREM. -/
theorem edgeMax_eq_sixteen : edgeMax = 16 := rfl

/-- addEdge on empty program fails closed (no valid endpoints).
    Greppable: addEdge_empty_badEndpoints, FAIL-CLOSED, IR-GRAPH-THEOREM,
    HOST-IR-GRAPH-THEOREM. -/
theorem addEdge_empty_badEndpoints (fromIdx toIdx : Nat) :
    addEdge empty fromIdx toIdx = AddEdgeResult.badEndpoints := by
  -- empty: not at edgeMax (Prop if); program length 0 so endpoints fail (Bool if).
  unfold addEdge
  rw [if_neg (by decide : Not (empty.edges.length >= edgeMax))]
  have hends :
      edgeEndpointsOk { fromIdx := fromIdx, toIdx := toIdx }
        (IrProgram.length empty.prog) = false := by
    simp [edgeEndpointsOk, empty, IrProgram.empty, IrProgram.length]
  simp [hends]

/-! ### edgesSound / single-node program-only graph (beyond EMPTY-GRAPH-OK) -/

private def thmValueNode : IrNode :=
  { ty := { tag := 1 }, mult := Mult.multOmega, kind := Types.NodeKind.value }

/-- Empty edge list is sound for any node count (vacuous endpoints + under cap).
    Greppable: edgesSound_empty, IR-GRAPH-THEOREM, HOST-IR-GRAPH-THEOREM. -/
theorem edgesSound_empty (nCount : Nat) : edgesSound [] nCount = true := rfl

/-- One well-typed VALUE node with empty edges is a well-typed graph
    (program-only; EMPTY-GRAPH-OK is the zero-node case).
    Greppable: isWellTyped_one_node_empty_edges, IR-GRAPH-THEOREM,
    HOST-IR-GRAPH-THEOREM. -/
theorem isWellTyped_one_node_empty_edges :
    isWellTyped {
      prog := { nodes := [thmValueNode] }
      edges := []
    } = true := rfl

/-! ### pushNode / addEdge success + fail-closed (beyond EMPTY-GRAPH-OK) -/

/-- One-node graph fixture (hand-built; no push match escape). -/
private def thmOneNode : Graph := {
  prog := { nodes := [thmValueNode] }
  edges := []
}

/-- pushNode empty with a well-typed VALUE node yields a one-node empty-edge graph.
    Greppable: pushNode_value_one_ok, IR-GRAPH-THEOREM, HOST-IR-GRAPH-THEOREM. -/
theorem pushNode_value_one_ok :
    pushNode empty thmValueNode = PushNodeResult.ok thmOneNode := rfl

/-- addEdge self-loop 0->0 on one-node graph succeeds.
    Greppable: addEdge_one_node_self_ok, IR-GRAPH-THEOREM, HOST-IR-GRAPH-THEOREM. -/
theorem addEdge_one_node_self_ok :
    addEdge thmOneNode 0 0 =
      AddEdgeResult.ok {
        prog := thmOneNode.prog
        edges := [{ fromIdx := 0, toIdx := 0 }]
      } := rfl

/-- addEdge out-of-range endpoint on one-node graph fails closed.
    Greppable: addEdge_one_node_badEndpoints, FAIL-CLOSED, IR-GRAPH-THEOREM,
    HOST-IR-GRAPH-THEOREM. -/
theorem addEdge_one_node_badEndpoints :
    addEdge thmOneNode 0 1 = AddEdgeResult.badEndpoints := by
  unfold addEdge
  rw [if_neg (by decide : Not (thmOneNode.edges.length >= edgeMax))]
  have hends :
      edgeEndpointsOk { fromIdx := 0, toIdx := 1 }
        (IrProgram.length thmOneNode.prog) = false := by
    simp [edgeEndpointsOk, thmOneNode, IrProgram.length]
  simp [hends]

/-! ### Multi-node edge contracts (one-edge then two-edge; beyond one-node self-edge) -/

private def thmValueNodeB : IrNode :=
  { ty := { tag := 2 }, mult := Mult.multOmega, kind := Types.NodeKind.value }

private def thmTwoNodes : Graph := {
  prog := { nodes := [thmValueNode, thmValueNodeB] }
  edges := []
}

private def thmTwoNodesOneEdge : Graph := {
  prog := { nodes := [thmValueNode, thmValueNodeB] }
  edges := [{ fromIdx := 0, toIdx := 1 }]
}

private def thmTwoNodesTwoEdges : Graph := {
  prog := { nodes := [thmValueNode, thmValueNodeB] }
  edges := [{ fromIdx := 0, toIdx := 1 }, { fromIdx := 1, toIdx := 0 }]
}

/-- One directed edge 0->1 is sound for a two-node program.
    Greppable: edgesSound_one_edge, IR-GRAPH-THEOREM, HOST-IR-GRAPH-THEOREM. -/
theorem edgesSound_one_edge :
    edgesSound [{ fromIdx := 0, toIdx := 1 }] 2 = true := rfl

/-- Two well-typed nodes with one in-range edge is a well-typed graph.
    Greppable: isWellTyped_two_nodes_one_edge, IR-GRAPH-THEOREM,
    HOST-IR-GRAPH-THEOREM. -/
theorem isWellTyped_two_nodes_one_edge :
    isWellTyped thmTwoNodesOneEdge = true := rfl

/-- addEdge 0->1 on a two-node empty-edge graph succeeds.
    Greppable: addEdge_two_nodes_ok, IR-GRAPH-THEOREM, HOST-IR-GRAPH-THEOREM. -/
theorem addEdge_two_nodes_ok :
    addEdge thmTwoNodes 0 1 = AddEdgeResult.ok thmTwoNodesOneEdge := rfl

/-- Two directed edges 0->1 and 1->0 are sound for a two-node program.
    Greppable: edgesSound_two_edges, IR-GRAPH-THEOREM, HOST-IR-GRAPH-THEOREM. -/
theorem edgesSound_two_edges :
    edgesSound
      [{ fromIdx := 0, toIdx := 1 }, { fromIdx := 1, toIdx := 0 }] 2 = true := rfl

/-- Two well-typed nodes with two in-range edges is a well-typed graph.
    Greppable: isWellTyped_two_nodes_two_edges, IR-GRAPH-THEOREM,
    HOST-IR-GRAPH-THEOREM. -/
theorem isWellTyped_two_nodes_two_edges :
    isWellTyped thmTwoNodesTwoEdges = true := rfl

/-- addEdge second edge 1->0 on a one-edge two-node graph succeeds.
    Greppable: addEdge_two_nodes_second_ok, IR-GRAPH-THEOREM, HOST-IR-GRAPH-THEOREM. -/
theorem addEdge_two_nodes_second_ok :
    addEdge thmTwoNodesOneEdge 1 0 = AddEdgeResult.ok thmTwoNodesTwoEdges := rfl

/-- addEdge out-of-range on two-node graph fails closed.
    Greppable: addEdge_two_nodes_badEndpoints, FAIL-CLOSED, IR-GRAPH-THEOREM,
    HOST-IR-GRAPH-THEOREM. -/
theorem addEdge_two_nodes_badEndpoints :
    addEdge thmTwoNodes 0 2 = AddEdgeResult.badEndpoints := by
  unfold addEdge
  rw [if_neg (by decide : Not (thmTwoNodes.edges.length >= edgeMax))]
  have hends :
      edgeEndpointsOk { fromIdx := 0, toIdx := 2 }
        (IrProgram.length thmTwoNodes.prog) = false := by
    simp [edgeEndpointsOk, thmTwoNodes, IrProgram.length]
  simp [hends]

/-- Edge list longer than edgeMax fails edgesSound (capacity upper bound).
    Greppable: edgesSound_oversize_false, SLAKE_IR_EDGE_MAX, IR-GRAPH-THEOREM,
    HOST-IR-GRAPH-THEOREM. -/
theorem edgesSound_oversize_false :
    edgesSound
      (List.replicate (edgeMax + 1) { fromIdx := 0, toIdx := 0 }) 2 = false := by
  decide

/-! ### Edge capacity full reject (promote IR-GRAPH-SMOKE capacity-full path)

  Net-new vs edgesSound_oversize_false alone and empty badEndpoints: at exactly
  edgeMax, edgesSound / isWellTyped hold; addEdge returns full; oversize graph
  isWellTyped fails closed (structure-literal bypass of addEdge).
-/

/-- Two-node graph fixture with exactly edgeMax in-range edges (0->1). -/
private def thmTwoNodesEdgeMax : Graph := {
  prog := { nodes := [thmValueNode, thmValueNodeB] }
  edges := List.replicate edgeMax { fromIdx := 0, toIdx := 1 }
}

/-- Exactly edgeMax in-range edges are sound (capacity upper bound inclusive).
    Greppable: edgesSound_at_edgeMax, SLAKE_IR_EDGE_MAX, IR-GRAPH-THEOREM,
    HOST-IR-GRAPH-THEOREM. -/
theorem edgesSound_at_edgeMax :
    edgesSound (List.replicate edgeMax { fromIdx := 0, toIdx := 1 }) 2 = true := by
  decide

/-- Two-node graph with exactly edgeMax valid edges is well-typed.
    Greppable: isWellTyped_at_edgeMax, SLAKE_IR_EDGE_MAX, IR-GRAPH-THEOREM,
    HOST-IR-GRAPH-THEOREM. -/
theorem isWellTyped_at_edgeMax :
    isWellTyped thmTwoNodesEdgeMax = true := by
  decide

/-- addEdge at edgeMax edges returns full (FAIL-CLOSED capacity; 17th edge).
    Greppable: addEdge_full_at_edgeMax, SLAKE_IR_EDGE_MAX, FAIL-CLOSED,
    IR-GRAPH-THEOREM, HOST-IR-GRAPH-THEOREM. -/
theorem addEdge_full_at_edgeMax :
    addEdge thmTwoNodesEdgeMax 0 1 = AddEdgeResult.full := by
  unfold addEdge
  rw [if_pos (by decide : thmTwoNodesEdgeMax.edges.length >= edgeMax)]

/-- Graph with edgeMax+1 edges fails isWellTyped (capacity upper bound on graph;
    structure literal may bypass addEdge). Net-new vs edgesSound_oversize_false
    alone: closes the isWellTyped path used by IR-GRAPH-SMOKE oversize.
    Greppable: isWellTyped_oversize_false, SLAKE_IR_EDGE_MAX, IR-GRAPH-THEOREM,
    HOST-IR-GRAPH-THEOREM. -/
theorem isWellTyped_oversize_false :
    isWellTyped {
      prog := { nodes := [thmValueNode, thmValueNodeB] }
      edges := List.replicate (edgeMax + 1) { fromIdx := 0, toIdx := 0 }
    } = false := by
  decide

/-! ### Graph smoke (behavioral; lake build fails if an example does not hold)
    Greppable: IR-GRAPH-SMOKE. EMPTY-GRAPH-OK, edgeMax, full, badEndpoints, edgesSound. -/

private def smokeValueNode : IrNode :=
  { ty := { tag := 9 }, mult := Mult.multOmega, kind := Types.NodeKind.value }

private def smokePush (g : Graph) (n : IrNode) : Graph :=
  match pushNode g n with
  | PushNodeResult.ok g' => g'
  | _ => g

private def smokeTwoNodes : Graph :=
  smokePush (smokePush empty smokeValueNode) smokeValueNode

/-- Fill g with n edges 0->1 (requires at least two nodes). -/
private def smokeFillEdges (g : Graph) : Nat -> Graph
  | 0 => g
  | n + 1 =>
    match addEdge (smokeFillEdges g n) 0 1 with
    | AddEdgeResult.ok g' => g'
    | _ => g

/-- IR-GRAPH-SMOKE: empty graph well-typed (EMPTY-GRAPH-OK). -/
example : isWellTyped empty = true := by decide
example : checkFailClosed empty = true := by decide

/-- IR-GRAPH-SMOKE: edgeMax is 16 (SLAKE_IR_EDGE_MAX honesty). -/
example : edgeMax = 16 := by decide

/-- IR-GRAPH-SMOKE: addEdge on empty program is badEndpoints. -/
example :
    (match addEdge empty 0 0 with
     | AddEdgeResult.badEndpoints => true
     | _ => false) = true := by decide

/-- IR-GRAPH-SMOKE: two nodes, edge 0->1 ok; edge out of range badEndpoints. -/
example :
    (match addEdge smokeTwoNodes 0 1 with
     | AddEdgeResult.ok _ => true
     | _ => false) = true := by decide
example :
    (match addEdge smokeTwoNodes 0 2 with
     | AddEdgeResult.badEndpoints => true
     | _ => false) = true := by decide

/-- IR-GRAPH-SMOKE: 16 edges ok; 17th is full. -/
example : edgeCount (smokeFillEdges smokeTwoNodes 16) = 16 := by decide
example :
    (match addEdge (smokeFillEdges smokeTwoNodes 16) 0 1 with
     | AddEdgeResult.full => true
     | _ => false) = true := by decide

/-- IR-GRAPH-SMOKE: oversize edge list (edgeMax+1) fails isWellTyped via edgesSound
    even when a structure literal bypasses addEdge (capacity upper bound not only
    at push). Greppable: edgesSound. -/
example :
    (let over : Graph := {
        prog := smokeTwoNodes.prog
        edges := List.replicate (edgeMax + 1) { fromIdx := 0, toIdx := 0 }
      }
     !isWellTyped over && !edgesSound over.edges (IrProgram.length over.prog)) = true := by
  decide


end SystemsLean.IrGraph
"#

/-- Live basename. The driver prints this. Not a path. -/
def liveRel : String := "IrGraphTheorems.lean"

end SystemsLean.HostFrontLiveIrGraphTheorems
