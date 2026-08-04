/-
  SYSTEMS_LEAN_HOST partial -- IR graph edges over ordered IR program on Systems Lean host.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Pair map (read-only): Types.slake / types.md IR_GRAPH_EDGES_V0 notes,
    emit slake_ir_graph_* (frozen wire honesty only; SLAKE_IR_EDGE_MAX = 16).
  Shared core map: doc/shared-ir-sketch.md.

  Spec (readable, separate from any future proof):
  - Directed edge slots honesty over an ordered IR program (index pairs into nodes).
  - Capacity honesty: edgeMax = 16 matching emit SLAKE_IR_EDGE_MAX.
  - Graph embeds ordered program + edge list under edgeMax.
  - EMPTY-GRAPH-OK: empty graph (no nodes, no edges) is well-typed at graph surface
    (matches emit slake_ir_graph_is_well_typed; nested empty program alone stays
    EMPTY-PROGRAM-FAIL-CLOSED under IrProgram).
  - addEdge fail closed: full edges, endpoints out of range (not < node count).
  - pushNode call-through to IrProgram.push (same badNode / full codes).
  - isWellTyped: empty OK; else program well-typed, edge count <= edgeMax, and every
    live edge endpoint in range (capacity upper bound checked, not only at push).
  - Not a full control-flow graph. Not dominance / SSA.

  Theorems (IR-GRAPH-THEOREM / HOST-IR-GRAPH-THEOREM -- partial IrGraph only):
  - Live in SystemsLean.IrGraphTheorems (same namespace; long-file peel).
  - isWellTyped_empty_true / empty_well_typed: EMPTY-GRAPH-OK core.
  - checkFailClosed_eq_isWellTyped: checkFailClosed is isWellTyped.
  - empty_isEmpty / edgeMax_eq_sixteen: empty facts + capacity honesty.
  - addEdge_empty_badEndpoints: no valid endpoints on empty program.
  - edgesSound_empty: empty edge list is sound for any node count.
  - isWellTyped_one_node_empty_edges: one well-typed node, no edges is OK.
  - pushNode_value_one_ok: push well-typed VALUE on empty yields one-node graph.
  - addEdge_one_node_self_ok: self-edge 0->0 on one-node graph succeeds.
  - addEdge_one_node_badEndpoints: endpoint out of range fails closed.
  - edgesSound_one_edge / isWellTyped_two_nodes_one_edge / addEdge_two_nodes_ok:
    multi-node single-edge (0->1) soundness + success.
  - edgesSound_two_edges / isWellTyped_two_nodes_two_edges / addEdge_two_nodes_second_ok:
    multi-node two-edge (0->1, 1->0) soundness + second addEdge success.
  - addEdge_two_nodes_badEndpoints: out-of-range after multi-node fails closed.
  - edgesSound_oversize_false: edge list past edgeMax fails closed.
  - edgesSound_at_edgeMax / isWellTyped_at_edgeMax / addEdge_full_at_edgeMax /
    isWellTyped_oversize_false: capacity-full reject (16 edges ok; 17th full;
    oversize isWellTyped fail-closed).
  - IR-GRAPH-SMOKE behavioral examples live with theorems.
  Nested IrProgram.empty stays EMPTY-PROGRAM-FAIL-CLOSED (do not claim empty
  program is well-typed as a program).
  These IrGraph theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial theorems on IrGraph != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Classic Lean elaborator still has managed runtime residual (host != product wire).
  - Not full IR_GRAPH_EDGES_V0 C reimplementation. Not residual free.
  - Nested empty ordered program alone is still EMPTY-PROGRAM-FAIL-CLOSED.

  Greppable: SYSTEMS_LEAN_HOST, IR_GRAPH_EDGES_V0, IR-GRAPH-EDGES, SLAKE_IR_EDGE_MAX,
  EMPTY-GRAPH-OK, FAIL-CLOSED, ORDERED-IR-PROGRAM, MULT-0, MULT-1, MULT-OMEGA,
  slake_ir_graph, IR-GRAPH-THEOREM, HOST-IR-GRAPH-THEOREM, IrGraphTheorems,
  UNIT_SURFACE host surface. Module: SystemsLean.IrGraph
  Long-file peel: IR-GRAPH-THEOREM + IR-GRAPH-SMOKE in SystemsLean.IrGraphTheorems
  (same namespace). Core dialect stays here.
  Red/green: just systems-host (nix/systems-host-presence/; flake checks.systems-host-presence); lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrProgram

namespace SystemsLean.IrGraph

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind)
open SystemsLean.IrProgram (Program)

/-- Fixed edge capacity matching emit SLAKE_IR_EDGE_MAX (honesty map). -/
def edgeMax : Nat := 16

/-- Directed edge: index pair into ordered IR program nodes.
    Emit map: slake_ir_edge (from, to). -/
structure Edge where
  fromIdx : Nat
  toIdx : Nat
  deriving DecidableEq, Repr

/-- IR graph: ordered program plus edge list under edgeMax.
    IR-GRAPH-EDGES host surface. Emit map: slake_ir_graph. -/
structure Graph where
  prog : Program
  edges : List Edge
  deriving DecidableEq, Repr

/-- Empty graph (EMPTY-GRAPH-OK: well-typed at graph surface). -/
def empty : Graph := { prog := IrProgram.empty, edges := [] }

/-- Live edge count. -/
def edgeCount (g : Graph) : Nat := g.edges.length

/-- Live node count (call-through program length). -/
def nodeCount (g : Graph) : Nat := IrProgram.length g.prog

/-- True when no nodes and no edges. -/
def isEmpty (g : Graph) : Bool :=
  IrProgram.isEmpty g.prog && g.edges.isEmpty

/-- Result of pushNode: ok with new graph, bad node, or full program capacity.
    Emit map: 0 ok; -1 null/bad; -2 full (via program push). -/
inductive PushNodeResult where
  | ok (g : Graph)
  | badNode
  | full
  deriving DecidableEq, Repr

/-- Result of addEdge: ok, full capacity, or bad endpoints (out of range).
    Emit map: 0 ok; -1 full / out of range / invalid. -/
inductive AddEdgeResult where
  | ok (g : Graph)
  | full
  | badEndpoints
  deriving DecidableEq, Repr

/-- edgeEndpointsOk e nCount -- true when both endpoints are in range.
    Fail closed: fromIdx / toIdx must be < nCount (emit add_edge contract). -/
def edgeEndpointsOk (e : Edge) (nCount : Nat) : Bool :=
  decide (e.fromIdx < nCount) && decide (e.toIdx < nCount)

/-- edgesSound edges nCount -- every edge in range and list under edgeMax.
    Capacity upper bound is part of soundness (not only enforced at addEdge). -/
def edgesSound (edges : List Edge) (nCount : Nat) : Bool :=
  decide (edges.length <= edgeMax)
    && edges.all (fun e => edgeEndpointsOk e nCount)

/-- addEdge g fromIdx toIdx -- append a directed edge under edgeMax.
    FAIL-CLOSED: full when at SLAKE_IR_EDGE_MAX; badEndpoints when index out of
    range (including empty program -- no valid endpoint). Failed add leaves g
    unchanged (caller keeps g). -/
def addEdge (g : Graph) (fromIdx toIdx : Nat) : AddEdgeResult :=
  if g.edges.length >= edgeMax then
    AddEdgeResult.full
  else if !(edgeEndpointsOk { fromIdx := fromIdx, toIdx := toIdx }
      (IrProgram.length g.prog)) then
    AddEdgeResult.badEndpoints
  else
    AddEdgeResult.ok {
      prog := g.prog
      edges := g.edges ++ [{ fromIdx := fromIdx, toIdx := toIdx }]
    }

/-- pushNode g n -- append a well-typed node via IrProgram.push.
    FAIL-CLOSED: same badNode / full as ordered IR program push.
    Edges are left unchanged (new node index is old length on success). -/
def pushNode (g : Graph) (n : IrNode) : PushNodeResult :=
  match IrProgram.push g.prog n with
  | IrProgram.PushResult.ok p => PushNodeResult.ok { g with prog := p }
  | IrProgram.PushResult.badNode => PushNodeResult.badNode
  | IrProgram.PushResult.full => PushNodeResult.full

/-- isWellTyped g -- EMPTY-GRAPH-OK when empty; else program well-typed and edges
    sound (count <= SLAKE_IR_EDGE_MAX and endpoints in range).
    Non-empty edges with empty program fail closed.
    Oversize edge lists fail closed even if addEdge already caps. -/
def isWellTyped (g : Graph) : Bool :=
  if isEmpty g then
    true
  else if IrProgram.isEmpty g.prog then
    false
  else
    IrProgram.isWellTyped g.prog
      && edgesSound g.edges (IrProgram.length g.prog)

/-- Fail-closed graph check (host V0): same bar as isWellTyped.
    Empty valid graph OK (EMPTY-GRAPH-OK). Emit path adds mult/token pre-scan at
    program or host-compose layers; this module is graph surface only. -/
def checkFailClosed (g : Graph) : Bool := isWellTyped g


/- Theorems and IR-GRAPH-SMOKE live in SystemsLean.IrGraphTheorems
   (same namespace SystemsLean.IrGraph; long-file peel). Parent keeps
   dialect only -- do not import IrGraphTheorems here (import cycle). -/

end SystemsLean.IrGraph
