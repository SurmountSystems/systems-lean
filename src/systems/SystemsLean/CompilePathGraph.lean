/-
  SYSTEMS_LEAN_HOST partial -- Graph unit compile-path fixture (COMPILE-PATH-GRAPH).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Owns Graph end-to-end compile-path fixture only: multi-node ordered IR,
  chain edges 0->1, 1->2, IrGraph well-typed, then host mark+mint
  (unitCompileReady on that live host). HOST-EMIT-GRAPH is product-text
  honesty beside that path, not a result of mark and mint.
  Core compile bars and shared fixture helpers live in SystemsLean.CompilePath.
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full Slake compiler.
  Greppable: SYSTEMS_LEAN_HOST, COMPILE-PATH-GRAPH, GRAPH-FIXTURE, HOST-EMIT-GRAPH,
  graphFixtureCompilePathReady, COMPILE-PATH-GRAPH-SMOKE, COMPILE-PATH-GRAPH-THEOREM.
  UNIT_SURFACE host surface. Module: SystemsLean.CompilePathGraph
  Red/green: just systems-host; lake build SystemsLean.CompilePathGraph.
  Module must stay ASCII. Not freestanding emit residual free. Not PROVABLY.
  RUNTIME-FS graph path honesty only (not residual free forge).
-/

import SystemsLean.CompilePath
import SystemsLean.EmitGraph

namespace SystemsLean.CompilePath

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.IrGraph (Graph)
open SystemsLean.HostCompose (Host)

/-! ### COMPILE-PATH-GRAPH / GRAPH-FIXTURE (Track 2 Graph unit end-to-end)

  Named Graph fixture: multi-node ordered IR (3-node ERASED/LINEAR/VALUE),
  chain edges 0->1, 1->2 (IR-GRAPH-EDGES), IrGraph well-typed, then host compose
  (mark MULT-0 + mint MULT-1) with edges. That live host meets unitCompileReady.
  HOST-EMIT-GRAPH product text honesty is beside that path, not a result of
  mark and mint. Same kind/mult pairing as KernelProgram graph path; e2e
  bar lives here (KernelProgram imports CompilePath -- no import cycle).
  Differs from PROGRAM-FIXTURE by requiring live edges + graph well-typed bar
  (Program fixture is ordered-IR + fold only; Graph adds edges).
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / CFG/SSA completeness / full Slake compiler.
-/

/-- Fixed Graph fixture mint id (nonzero; Mult 4, Types 5, Program 6, Linear 7). -/
def graphFixtureMintId : Nat := 8

/-- Mint-id honesty: Graph fixture uses 8 (non-colliding with Mult/Types/Program/Linear).
    Greppable: graphFixtureMintId_eq, COMPILE-PATH-GRAPH-THEOREM. -/
theorem graphFixtureMintId_eq : graphFixtureMintId = 8 := rfl

/-- Graph fixture type tags (deterministic; match KernelProgram / Mult tags). -/
def graphFixtureTagErased : Nat := 0
def graphFixtureTagLinear : Nat := 1
def graphFixtureTagValue : Nat := 2

/-- Graph fixture nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value. -/
def graphFixtureErasedNode : IrNode :=
  { ty := typeTagInit graphFixtureTagErased, mult := Mult.mult0, kind := NodeKind.erased }

def graphFixtureLinearNode : IrNode :=
  { ty := typeTagInit graphFixtureTagLinear, mult := Mult.mult1, kind := NodeKind.linear }

def graphFixtureValueNode : IrNode :=
  { ty := typeTagInit graphFixtureTagValue, mult := Mult.multOmega, kind := NodeKind.value }

/-- lowerGraphFixtureProgram -- multi-node ordered IR (COMPILE-PATH-GRAPH).
    Three nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value.
    FAIL-CLOSED: none if any push fails.
    Greppable: lowerGraphFixtureProgram, GRAPH-FIXTURE, ORDERED-IR-PROGRAM. -/
def lowerGraphFixtureProgram : Option Program :=
  match pushFixtureProg IrProgram.empty graphFixtureErasedNode with
  | none => none
  | some p0 =>
    match pushFixtureProg p0 graphFixtureLinearNode with
    | none => none
    | some p1 => pushFixtureProg p1 graphFixtureValueNode

/-- graphFixtureProgram -- Graph ordered IR when lower succeeds; empty on fail. -/
def graphFixtureProgram : Program :=
  match lowerGraphFixtureProgram with
  | some p => p
  | none => IrProgram.empty

/-- lowerGraphFixtureGraph -- multi-node program + chain edges 0->1, 1->2.
    FAIL-CLOSED: none if program lower or addEdge fails.
    Greppable: lowerGraphFixtureGraph, GRAPH-FIXTURE, IR-GRAPH-EDGES. -/
def lowerGraphFixtureGraph : Option Graph :=
  match lowerGraphFixtureProgram with
  | none => none
  | some p =>
      let g0 : Graph := { prog := p, edges := [] }
      match IrGraph.addEdge g0 0 1 with
      | IrGraph.AddEdgeResult.ok g1 =>
        match IrGraph.addEdge g1 1 2 with
        | IrGraph.AddEdgeResult.ok g2 => some g2
        | _ => none
      | _ => none

/-- graphFixtureGraph -- Graph when lower succeeds; empty graph on fail. -/
def graphFixtureGraph : Graph :=
  match lowerGraphFixtureGraph with
  | some g => g
  | none => IrGraph.empty

/-- lowerGraphFixtureComposeRaw -- HostCompose with three nodes + chain edges,
    no mint/mark. FAIL-CLOSED: none on push or edge fail. Unready for multPreScan.
    Greppable: lowerGraphFixtureComposeRaw, GRAPH-FIXTURE, HOST-COMPOSE. -/
def lowerGraphFixtureComposeRaw : Option Host :=
  match pushFixtureHost HostCompose.empty graphFixtureErasedNode with
  | none => none
  | some hc0 =>
    match pushFixtureHost hc0 graphFixtureLinearNode with
    | none => none
    | some hc1 =>
      match pushFixtureHost hc1 graphFixtureValueNode with
      | none => none
      | some hc2 =>
        match addFixtureHostEdge hc2 0 1 with
        | none => none
        | some hc3 => addFixtureHostEdge hc3 1 2

/-- lowerGraphFixtureCompose -- Graph fixture host ready for unit compile path.
    markErased (MULT-0) + mint (MULT-1); MULT-OMEGA needs neither. Edges retained.
    FAIL-CLOSED: none if raw lower or mint fails.
    Greppable: lowerGraphFixtureCompose, GRAPH-FIXTURE, HOST-COMPOSE. -/
def lowerGraphFixtureCompose : Option Host :=
  match lowerGraphFixtureComposeRaw with
  | none => none
  | some hcRaw =>
    let hcMarked := HostCompose.markErased hcRaw
    mintFixtureHost hcMarked graphFixtureMintId

/-- graphFixtureChainEdgesOk edges -- live edges are exactly chain 0->1, 1->2.
    Greppable: graphFixtureChainEdgesOk, IR-GRAPH-EDGES, COMPILE-PATH-GRAPH. -/
def graphFixtureChainEdgesOk (edges : List IrGraph.Edge) : Bool :=
  match edges with
  | [e0, e1] =>
      e0.fromIdx == 0 && e0.toIdx == 1
        && e1.fromIdx == 1 && e1.toIdx == 2
  | _ => false

/-- graphFixtureEdgesOk -- edge + node + chain-endpoint honesty on Graph fixture.
    Empty graph well-typed (EMPTY-GRAPH-OK); empty program alone not well-typed;
    lowered graph has 2 edges (exactly 0->1 then 1->2), 3 nodes, well-typed;
    out-of-range edge fails closed.
    Greppable: graphFixtureEdgesOk, IR-GRAPH-EDGES, EMPTY-GRAPH-OK, COMPILE-PATH-GRAPH. -/
def graphFixtureEdgesOk : Bool :=
  let emptyGraphOk := IrGraph.isWellTyped IrGraph.empty
  let emptyProgFails := !IrProgram.isWellTyped IrProgram.empty
  match lowerGraphFixtureGraph with
  | none => false
  | some g =>
      let graphOk :=
        IrGraph.isWellTyped g
          && IrGraph.edgeCount g == 2
          && IrGraph.nodeCount g == 3
          && IrProgram.isWellTyped g.prog
          && graphFixtureChainEdgesOk g.edges
      let badEdgeOk :=
        match IrGraph.addEdge g 0 9 with
        | IrGraph.AddEdgeResult.badEndpoints => true
        | _ => false
      emptyGraphOk && emptyProgFails && graphOk && badEdgeOk

/-- graphFixtureProgramReady -- ordered IR bar for Graph fixture.
    FAIL-CLOSED: lower succeeds, length 3, programCompileReady, gradeSurfaceOk.
    Greppable: graphFixtureProgramReady, COMPILE-PATH-GRAPH, GRAPH-FIXTURE. -/
def graphFixtureProgramReady : Bool :=
  match lowerGraphFixtureProgram with
  | none => false
  | some p =>
      programCompileReady p
        && IrProgram.length p == 3
        && IrProgram.isWellTyped p
        && gradeSurfaceOk

/-- graphFixtureGraphReady -- IR graph well-typed bar for Graph fixture.
    FAIL-CLOSED: lower graph succeeds, isWellTyped, edges + program bars.
    Greppable: graphFixtureGraphReady, COMPILE-PATH-GRAPH, IR-GRAPH-EDGES. -/
def graphFixtureGraphReady : Bool :=
  match lowerGraphFixtureGraph with
  | none => false
  | some g =>
      IrGraph.isWellTyped g
        && IrGraph.edgeCount g == 2
        && IrGraph.nodeCount g == 3
        && IrProgram.isWellTyped g.prog
        && graphFixtureEdgesOk
        && graphFixtureProgramReady

/-- graphFixtureComposeReady -- unit compile-path bar on Graph fixture host.
    FAIL-CLOSED: lower compose succeeds, unitCompileReady, chain edges 0->1/1->2
    present, live mint with graphFixtureMintId.
    Greppable: graphFixtureComposeReady, COMPILE-PATH-GRAPH, unitCompileReady. -/
def graphFixtureComposeReady : Bool :=
  match lowerGraphFixtureCompose with
  | none => false
  | some hc =>
      unitCompileReady hc
        && HostCompose.extractOkFs hc
        && hc.linear.live
        && hc.linear.id == graphFixtureMintId
        && IrGraph.edgeCount hc.graph == 2
        && IrGraph.nodeCount hc.graph == 3
        && IrGraph.isWellTyped hc.graph
        && graphFixtureChainEdgesOk hc.graph.edges

/-- graphFixtureComposeRawUnready -- unminted/unmarked Graph compose fails unit bar.
    Greppable: graphFixtureComposeRawUnready, FAIL-CLOSED, GRAPH-FIXTURE. -/
def graphFixtureComposeRawUnready : Bool :=
  match lowerGraphFixtureComposeRaw with
  | none => false
  | some hc =>
      !unitCompileReady hc
        && !HostCompose.checkFailClosed hc
        && IrGraph.edgeCount hc.graph == 2

/-- graphFixtureEmitPathOk -- host Graph product text path honesty (HOST-EMIT-GRAPH).
    Reuses EmitGraph.emitGraphReady; does not re-emit C; not residual free.
    Greppable: graphFixtureEmitPathOk, HOST-EMIT-GRAPH, COMPILE-PATH-GRAPH. -/
def graphFixtureEmitPathOk : Bool := EmitGraph.emitGraphReady

/-- Local honesty: Graph e2e fixture does NOT claim residual free. -/
def graphFixtureResidualFreeClaimed : Bool := false

/-- Local honesty: Graph e2e fixture does NOT complete product self-host. -/
def graphFixtureProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: Graph e2e fixture does NOT claim proof complete. -/
def graphFixtureProofCompleteClaimed : Bool := false

/-- Local honesty: Graph e2e fixture does NOT unlock llvm. -/
def graphFixtureLlvmUnlocked : Bool := false

/-- graphFixtureCompilePathReady -- end-to-end Graph unit compile path (Track 2).
    Multi-node ordered IR + edges + graph well-typed + ready compose unit bar +
    raw compose not unit-ready + HOST-EMIT-GRAPH emit path +
    free/complete/proof/llvm stay false.
    graphFixtureGraphReady already folds graphFixtureEdgesOk and
    graphFixtureProgramReady (those are not re-listed here).
    The top-level gradeSurfaceOk conjunct repeats the gradeSurfaceOk check
    inside graphFixtureProgramReady. graphFixtureComposeRawUnready is a
    separate conjunct (raw host unready).
    Greppable: graphFixtureCompilePathReady, COMPILE-PATH-GRAPH, GRAPH-FIXTURE,
    HOST-COMPILE-PATH, HOST-EMIT-GRAPH. -/
def graphFixtureCompilePathReady : Bool :=
  gradeSurfaceOk
    && graphFixtureGraphReady
    && graphFixtureComposeReady
    && graphFixtureComposeRawUnready
    && graphFixtureEmitPathOk
    && !graphFixtureResidualFreeClaimed
    && !graphFixtureProductSelfHostCompleteClaimed
    && !graphFixtureProofCompleteClaimed
    && !graphFixtureLlvmUnlocked

/-- graphFixtureDoesNotMeanResidualFree -- e2e ready does not claim residual free.
    Greppable: graphFixtureDoesNotMeanResidualFree, COMPILE-PATH-GRAPH. -/
def graphFixtureDoesNotMeanResidualFree : Bool :=
  graphFixtureCompilePathReady && !graphFixtureResidualFreeClaimed

/-! ### COMPILE-PATH-GRAPH-THEOREM (readable Graph e2e statements, then proofs)

  Real Lean theorems for Graph fixture compile path only. Does not flip
  SpecProof.proofCompleteClaimed / residual free / product self-host complete.
-/

set_option maxRecDepth 8192

/-- Graph fixture edge + EMPTY-GRAPH-OK honesty holds.
    Greppable: graphFixtureEdgesOk_true, COMPILE-PATH-GRAPH-THEOREM. -/
theorem graphFixtureEdgesOk_true : graphFixtureEdgesOk = true := by decide

/-- Graph fixture ordered IR program is compile-path ready.
    Greppable: graphFixtureProgramReady_true, COMPILE-PATH-GRAPH-THEOREM. -/
theorem graphFixtureProgramReady_true : graphFixtureProgramReady = true := by decide

/-- Graph fixture IR graph is well-typed with chain edges.
    Greppable: graphFixtureGraphReady_true, COMPILE-PATH-GRAPH-THEOREM. -/
theorem graphFixtureGraphReady_true : graphFixtureGraphReady = true := by decide

/-- Graph fixture host compose is unit-compile-ready after mark+mint.
    Greppable: graphFixtureComposeReady_true, COMPILE-PATH-GRAPH-THEOREM. -/
theorem graphFixtureComposeReady_true : graphFixtureComposeReady = true := by decide

/-- Unready Graph compose fails unit bar (FAIL-CLOSED multPreScan).
    Greppable: graphFixtureComposeRaw_unready_true, COMPILE-PATH-GRAPH-THEOREM. -/
theorem graphFixtureComposeRaw_unready_true :
    graphFixtureComposeRawUnready = true := by decide

/-- HOST-EMIT-GRAPH product text path honesty holds on Graph fixture path.
    Greppable: graphFixtureEmitPathOk_true, HOST-EMIT-GRAPH, COMPILE-PATH-GRAPH-THEOREM. -/
theorem graphFixtureEmitPathOk_true : graphFixtureEmitPathOk = true := by
  native_decide

/-- End-to-end Graph unit compile path ready (Track 2 Graph fixture).
    Greppable: graphFixtureCompilePathReady_true, COMPILE-PATH-GRAPH-THEOREM,
    COMPILE-PATH-GRAPH, GRAPH-FIXTURE, HOST-COMPILE-PATH. -/
theorem graphFixtureCompilePathReady_true :
    graphFixtureCompilePathReady = true := by
  native_decide

/-- Graph e2e ready does not claim residual free.
    Greppable: graphFixtureDoesNotMeanResidualFree_true, COMPILE-PATH-GRAPH-THEOREM. -/
theorem graphFixtureDoesNotMeanResidualFree_true :
    graphFixtureDoesNotMeanResidualFree = true := by
  native_decide

/-- Graph e2e free/complete/proof/llvm honesty stays false.
    Greppable: graphFixture_claims_false, COMPILE-PATH-GRAPH-THEOREM. -/
theorem graphFixture_claims_false :
    (graphFixtureResidualFreeClaimed = false)
      /\ (graphFixtureProductSelfHostCompleteClaimed = false)
      /\ (graphFixtureProofCompleteClaimed = false)
      /\ (graphFixtureLlvmUnlocked = false) :=
  And.intro rfl (And.intro rfl (And.intro rfl rfl))

/-- lowerGraphFixtureProgram succeeds with length 3.
    Greppable: lowerGraphFixtureProgram_length_three, COMPILE-PATH-GRAPH-THEOREM. -/
theorem lowerGraphFixtureProgram_length_three :
    (match lowerGraphFixtureProgram with
     | some p => IrProgram.length p == 3
     | none => false) = true := by decide

/-- lowerGraphFixtureGraph is some with chain edges 0->1, 1->2.
    Greppable: lowerGraphFixtureGraph_edges_two, COMPILE-PATH-GRAPH-THEOREM. -/
theorem lowerGraphFixtureGraph_edges_two :
    (match lowerGraphFixtureGraph with
     | some g =>
         IrGraph.edgeCount g == 2
           && IrGraph.isWellTyped g
           && graphFixtureChainEdgesOk g.edges
     | none => false) = true := by decide

/-- lowerGraphFixtureCompose is some (mark+mint path with edges).
    Greppable: lowerGraphFixtureCompose_isSome, COMPILE-PATH-GRAPH-THEOREM. -/
theorem lowerGraphFixtureCompose_isSome :
    lowerGraphFixtureCompose.isSome = true := by decide


/-! ### COMPILE-PATH-GRAPH-SMOKE (Graph fixture end-to-end; lake fails if examples fail)
    Greppable: COMPILE-PATH-GRAPH-SMOKE, GRAPH-FIXTURE, COMPILE-PATH-GRAPH. -/

/-! COMPILE-PATH-GRAPH-SMOKE: ordered IR lower is some, length 3, and program-ready.
    Chain edges 0->1, 1->2 are checked on the graph lower, not on the program lower.
    Mint id is 8. -/
example : (lowerGraphFixtureProgram.isSome) = true := by decide
example : graphFixtureProgram.nodes.length = 3 := by decide
example : programCompileReady graphFixtureProgram = true := by decide
example : graphFixtureProgramReady = true := by decide
example : (lowerGraphFixtureGraph.isSome) = true := by decide
example : graphFixtureEdgesOk = true := by decide
example : graphFixtureGraphReady = true := by decide
example : graphFixtureMintId = 8 := rfl
example :
    (match lowerGraphFixtureGraph with
     | some g =>
         IrGraph.edgeCount g == 2
           && IrGraph.nodeCount g == 3
           && graphFixtureChainEdgesOk g.edges
     | none => false) = true := by decide

/-! COMPILE-PATH-GRAPH-SMOKE: raw Graph compose fails the unit bar.
    Later examples in this block check mark+mint unit-ready with chain edges. -/
example : graphFixtureComposeRawUnready = true := by decide
example : graphFixtureComposeReady = true := by decide
example :
    (match lowerGraphFixtureCompose with
     | some hc =>
         unitCompileReady hc
           && hc.linear.live
           && hc.linear.id == graphFixtureMintId
           && IrGraph.edgeCount hc.graph == 2
           && IrGraph.isWellTyped hc.graph
           && graphFixtureChainEdgesOk hc.graph.edges
     | none => false) = true := by decide

/-- COMPILE-PATH-GRAPH-SMOKE: HOST-EMIT-GRAPH product text path honesty. -/
example : graphFixtureEmitPathOk = true := by native_decide
example : EmitGraph.hostEmitGraphId = "HOST-EMIT-GRAPH" := rfl
example : EmitGraph.stageId = "SLAKE_SELF_HOST_EMIT_GRAPH_V0" := rfl

/-- COMPILE-PATH-GRAPH-SMOKE: full Graph e2e compile path; free/complete stay false. -/
example : graphFixtureCompilePathReady = true := by native_decide
example : graphFixtureDoesNotMeanResidualFree = true := by native_decide
example : graphFixtureResidualFreeClaimed = false := rfl
example : graphFixtureProductSelfHostCompleteClaimed = false := rfl
example : graphFixtureProofCompleteClaimed = false := rfl
example : graphFixtureLlvmUnlocked = false := rfl

end SystemsLean.CompilePath
