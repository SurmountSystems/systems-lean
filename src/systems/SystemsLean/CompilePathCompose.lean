/-
  SYSTEMS_LEAN_HOST partial -- Compose unit compile-path fixture (COMPILE-PATH-COMPOSE).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Owns Compose end-to-end compile-path fixture only: multi-node ordered IR +
  chain edges -> host mark+mint + ConsumeToken exact-once ->
  unitCompileReady + HOST-EMIT-COMPOSE.
  Core compile bars and shared fixture helpers live in SystemsLean.CompilePath.
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full Slake compiler.
  Greppable: SYSTEMS_LEAN_HOST, COMPILE-PATH-COMPOSE, COMPOSE-FIXTURE, HOST-EMIT-COMPOSE,
  composeFixtureCompilePathReady, COMPILE-PATH-COMPOSE-SMOKE, COMPILE-PATH-COMPOSE-THEOREM.
  UNIT_SURFACE host surface. Module: SystemsLean.CompilePathCompose
  Red/green: just systems-host; lake build SystemsLean.CompilePathCompose.
  Module must stay ASCII. Not freestanding emit residual free. Not PROVABLY.
  RUNTIME-FS compose path honesty only (not residual free forge).
-/

import SystemsLean.CompilePath
import SystemsLean.EmitCompose

namespace SystemsLean.CompilePath

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.IrGraph (Graph)
open SystemsLean.HostCompose (Host)

/-! ### COMPILE-PATH-COMPOSE / COMPOSE-FIXTURE (Track 2 Compose unit end-to-end)

  Named Compose fixture: multi-node ordered IR (3-node ERASED/LINEAR/VALUE) +
  chain edges 0->1, 1->2 -> host compose mark MULT-0 + mint MULT-1 +
  ConsumeToken mint/consume exact-once -> unitCompileReady + HOST-EMIT-COMPOSE
  product text honesty. Same kind/mult + edge pairing as GRAPH-FIXTURE; e2e bar
  targets host compose product text (EmitCompose) and mint/consume/mark path
  (Graph e2e stops at HOST-EMIT-GRAPH without consume conjunct).
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / elaborator MULT-1 freestanding residual free / CFG/SSA / full
  Slake compiler.
-/

/-- Fixed Compose fixture mint id (nonzero; Mult 4, Types 5, Program 6, Linear 7,
    Graph 8). -/
def composeFixtureMintId : Nat := 9

/-- Mint-id honesty: Compose fixture uses 9 (non-colliding with Mult..Graph).
    Greppable: composeFixtureMintId_eq, COMPILE-PATH-COMPOSE-THEOREM. -/
theorem composeFixtureMintId_eq : composeFixtureMintId = 9 := rfl

/-- Compose fixture type tags (deterministic; match Graph / Mult tags). -/
def composeFixtureTagErased : Nat := 0
def composeFixtureTagLinear : Nat := 1
def composeFixtureTagValue : Nat := 2

/-- Compose fixture nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value. -/
def composeFixtureErasedNode : IrNode :=
  { ty := typeTagInit composeFixtureTagErased, mult := Mult.mult0, kind := NodeKind.erased }

def composeFixtureLinearNode : IrNode :=
  { ty := typeTagInit composeFixtureTagLinear, mult := Mult.mult1, kind := NodeKind.linear }

def composeFixtureValueNode : IrNode :=
  { ty := typeTagInit composeFixtureTagValue, mult := Mult.multOmega, kind := NodeKind.value }

/-- lowerComposeFixtureProgram -- multi-node ordered IR (COMPILE-PATH-COMPOSE).
    Three nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value.
    FAIL-CLOSED: none if any push fails.
    Greppable: lowerComposeFixtureProgram, COMPOSE-FIXTURE, ORDERED-IR-PROGRAM. -/
def lowerComposeFixtureProgram : Option Program :=
  match pushFixtureProg IrProgram.empty composeFixtureErasedNode with
  | none => none
  | some p0 =>
    match pushFixtureProg p0 composeFixtureLinearNode with
    | none => none
    | some p1 => pushFixtureProg p1 composeFixtureValueNode

/-- composeFixtureProgram -- Compose ordered IR when lower succeeds; empty on fail. -/
def composeFixtureProgram : Program :=
  match lowerComposeFixtureProgram with
  | some p => p
  | none => IrProgram.empty

/-- lowerComposeFixtureComposeRaw -- HostCompose with three nodes + chain edges,
    no mint/mark. FAIL-CLOSED: none on push or edge fail. Unready for multPreScan.
    Greppable: lowerComposeFixtureComposeRaw, COMPOSE-FIXTURE, HOST-COMPOSE. -/
def lowerComposeFixtureComposeRaw : Option Host :=
  match pushFixtureHost HostCompose.empty composeFixtureErasedNode with
  | none => none
  | some hc0 =>
    match pushFixtureHost hc0 composeFixtureLinearNode with
    | none => none
    | some hc1 =>
      match pushFixtureHost hc1 composeFixtureValueNode with
      | none => none
      | some hc2 =>
        match addFixtureHostEdge hc2 0 1 with
        | none => none
        | some hc3 => addFixtureHostEdge hc3 1 2

/-- lowerComposeFixtureCompose -- Compose fixture host ready for unit compile path.
    markErased (MULT-0) + mint (MULT-1); MULT-OMEGA needs neither. Edges retained.
    FAIL-CLOSED: none if raw lower or mint fails.
    Greppable: lowerComposeFixtureCompose, COMPOSE-FIXTURE, HOST-COMPOSE. -/
def lowerComposeFixtureCompose : Option Host :=
  match lowerComposeFixtureComposeRaw with
  | none => none
  | some hcRaw =>
    let hcMarked := HostCompose.markErased hcRaw
    mintFixtureHost hcMarked composeFixtureMintId

/-- composeFixtureChainEdgesOk edges -- live edges are exactly chain 0->1, 1->2.
    Greppable: composeFixtureChainEdgesOk, IR-GRAPH-EDGES, COMPILE-PATH-COMPOSE. -/
def composeFixtureChainEdgesOk (edges : List IrGraph.Edge) : Bool :=
  match edges with
  | [e0, e1] =>
      e0.fromIdx == 0 && e0.toIdx == 1
        && e1.fromIdx == 1 && e1.toIdx == 2
  | _ => false

/-- composeFixtureEdgesOk -- edge + node + chain-endpoint honesty on Compose fixture.
    Lowered raw compose has 2 edges (exactly 0->1 then 1->2), 3 nodes, well-typed.
    Greppable: composeFixtureEdgesOk, IR-GRAPH-EDGES, COMPILE-PATH-COMPOSE. -/
def composeFixtureEdgesOk : Bool :=
  match lowerComposeFixtureComposeRaw with
  | none => false
  | some hc =>
      IrGraph.isWellTyped hc.graph
        && IrGraph.edgeCount hc.graph == 2
        && IrGraph.nodeCount hc.graph == 3
        && IrProgram.isWellTyped hc.graph.prog
        && composeFixtureChainEdgesOk hc.graph.edges

/-- composeFixtureProgramReady -- ordered IR bar for Compose fixture.
    FAIL-CLOSED: lower succeeds, length 3, programCompileReady, gradeSurfaceOk.
    Greppable: composeFixtureProgramReady, COMPILE-PATH-COMPOSE, COMPOSE-FIXTURE. -/
def composeFixtureProgramReady : Bool :=
  match lowerComposeFixtureProgram with
  | none => false
  | some p =>
      programCompileReady p
        && IrProgram.length p == 3
        && IrProgram.isWellTyped p
        && gradeSurfaceOk

/-- composeFixtureComposeReady -- unit compile-path bar on Compose fixture host.
    FAIL-CLOSED: lower compose succeeds, unitCompileReady, chain edges present,
    live mint with composeFixtureMintId, erased marked after markErased.
    Greppable: composeFixtureComposeReady, COMPILE-PATH-COMPOSE, unitCompileReady. -/
def composeFixtureComposeReady : Bool :=
  match lowerComposeFixtureCompose with
  | none => false
  | some hc =>
      unitCompileReady hc
        && HostCompose.extractOkFs hc
        && hc.linear.live
        && hc.linear.id == composeFixtureMintId
        && hc.erased.marked
        && IrGraph.edgeCount hc.graph == 2
        && IrGraph.nodeCount hc.graph == 3
        && IrGraph.isWellTyped hc.graph
        && composeFixtureChainEdgesOk hc.graph.edges

/-- composeFixtureComposeRawUnready -- unminted/unmarked Compose compose fails unit bar.
    Greppable: composeFixtureComposeRawUnready, FAIL-CLOSED, COMPOSE-FIXTURE. -/
def composeFixtureComposeRawUnready : Bool :=
  match lowerComposeFixtureComposeRaw with
  | none => false
  | some hc =>
      !unitCompileReady hc
        && !HostCompose.checkFailClosed hc
        && IrGraph.edgeCount hc.graph == 2
        && !hc.erased.marked
        && !hc.linear.live

/-- composeFixtureMintConsumeOk -- ConsumeToken exact-once on Compose fixture host.
    mint live then consume once: payload equals mint id, live cleared, spent
    host fails checkFailClosed (LINEAR-EXACT-ONCE). Live-flag path only; not
    elaborator MULT-1 freestanding residual free.
    Greppable: composeFixtureMintConsumeOk, ConsumeToken, LINEAR-EXACT-ONCE,
    COMPILE-PATH-COMPOSE. -/
def composeFixtureMintConsumeOk : Bool :=
  match lowerComposeFixtureCompose with
  | none => false
  | some hcLive =>
      match HostCompose.consume hcLive with
      | HostCompose.ConsumeResult.ok hcSpent payload =>
          (payload == composeFixtureMintId)
            && !hcSpent.linear.live
            && hcSpent.linear.id == 0
            && !HostCompose.checkFailClosed hcSpent
            && !unitCompileReady hcSpent
      | HostCompose.ConsumeResult.notLive => false

/-- composeFixtureEmitPathOk -- host Compose product text path honesty (HOST-EMIT-COMPOSE).
    Reuses EmitCompose.emitComposeReady; does not re-emit C; not residual free.
    Greppable: composeFixtureEmitPathOk, HOST-EMIT-COMPOSE, COMPILE-PATH-COMPOSE. -/
def composeFixtureEmitPathOk : Bool := EmitCompose.emitComposeReady

/-- Local honesty: Compose e2e fixture does NOT claim residual free. -/
def composeFixtureResidualFreeClaimed : Bool := false

/-- Local honesty: Compose e2e fixture does NOT complete product self-host. -/
def composeFixtureProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: Compose e2e fixture does NOT claim proof complete. -/
def composeFixtureProofCompleteClaimed : Bool := false

/-- Local honesty: Compose e2e fixture does NOT unlock llvm. -/
def composeFixtureLlvmUnlocked : Bool := false

/-- composeFixtureCompilePathReady -- end-to-end Compose unit compile path (Track 2).
    Multi-node ordered IR + edges + mark+mint unit bar + mint/consume exact-once +
    HOST-EMIT-COMPOSE emit path + free/complete/proof/llvm stay false.
    Minimal independent conjuncts: composeFixtureComposeReady already folds
    edges + mint id + mark; composeFixtureEdgesOk and programReady are explicit
    lower-path bars (not dual folds of ready).
    Greppable: composeFixtureCompilePathReady, COMPILE-PATH-COMPOSE, COMPOSE-FIXTURE,
    HOST-COMPILE-PATH, HOST-EMIT-COMPOSE. -/
def composeFixtureCompilePathReady : Bool :=
  gradeSurfaceOk
    && composeFixtureProgramReady
    && composeFixtureEdgesOk
    && composeFixtureComposeReady
    && composeFixtureComposeRawUnready
    && composeFixtureMintConsumeOk
    && composeFixtureEmitPathOk
    && !composeFixtureResidualFreeClaimed
    && !composeFixtureProductSelfHostCompleteClaimed
    && !composeFixtureProofCompleteClaimed
    && !composeFixtureLlvmUnlocked

/-- composeFixtureDoesNotMeanResidualFree -- e2e ready does not claim residual free.
    Greppable: composeFixtureDoesNotMeanResidualFree, COMPILE-PATH-COMPOSE. -/
def composeFixtureDoesNotMeanResidualFree : Bool :=
  composeFixtureCompilePathReady && !composeFixtureResidualFreeClaimed

/-! ### COMPILE-PATH-COMPOSE-THEOREM (readable Compose e2e statements, then proofs)

  Real Lean theorems for Compose fixture compile path only. Does not flip
  SpecProof.proofCompleteClaimed / residual free / product self-host complete.
-/

set_option maxRecDepth 8192

/-- Compose fixture edge + chain-endpoint honesty holds.
    Greppable: composeFixtureEdgesOk_true, COMPILE-PATH-COMPOSE-THEOREM. -/
theorem composeFixtureEdgesOk_true : composeFixtureEdgesOk = true := by decide

/-- Compose fixture ordered IR program is compile-path ready.
    Greppable: composeFixtureProgramReady_true, COMPILE-PATH-COMPOSE-THEOREM. -/
theorem composeFixtureProgramReady_true : composeFixtureProgramReady = true := by decide

/-- Compose fixture host compose is unit-compile-ready after mark+mint.
    Greppable: composeFixtureComposeReady_true, COMPILE-PATH-COMPOSE-THEOREM. -/
theorem composeFixtureComposeReady_true : composeFixtureComposeReady = true := by decide

/-- Unready Compose compose fails unit bar (FAIL-CLOSED multPreScan).
    Greppable: composeFixtureComposeRaw_unready_true, COMPILE-PATH-COMPOSE-THEOREM. -/
theorem composeFixtureComposeRaw_unready_true :
    composeFixtureComposeRawUnready = true := by decide

/-- ConsumeToken mint/consume exact-once holds on Compose fixture host.
    Greppable: composeFixtureMintConsumeOk_true, LINEAR-EXACT-ONCE,
    COMPILE-PATH-COMPOSE-THEOREM. -/
theorem composeFixtureMintConsumeOk_true :
    composeFixtureMintConsumeOk = true := by decide

/-- HOST-EMIT-COMPOSE product text path honesty holds on Compose fixture path.
    Greppable: composeFixtureEmitPathOk_true, HOST-EMIT-COMPOSE,
    COMPILE-PATH-COMPOSE-THEOREM. -/
theorem composeFixtureEmitPathOk_true : composeFixtureEmitPathOk = true := by
  native_decide

/-- End-to-end Compose unit compile path ready (Track 2 Compose fixture).
    Greppable: composeFixtureCompilePathReady_true, COMPILE-PATH-COMPOSE-THEOREM,
    COMPILE-PATH-COMPOSE, COMPOSE-FIXTURE, HOST-COMPILE-PATH. -/
theorem composeFixtureCompilePathReady_true :
    composeFixtureCompilePathReady = true := by
  native_decide

/-- Compose e2e ready does not claim residual free.
    Greppable: composeFixtureDoesNotMeanResidualFree_true, COMPILE-PATH-COMPOSE-THEOREM. -/
theorem composeFixtureDoesNotMeanResidualFree_true :
    composeFixtureDoesNotMeanResidualFree = true := by
  native_decide

/-- Compose e2e free/complete/proof/llvm honesty stays false.
    Greppable: composeFixture_claims_false, COMPILE-PATH-COMPOSE-THEOREM. -/
theorem composeFixture_claims_false :
    (composeFixtureResidualFreeClaimed = false)
      /\ (composeFixtureProductSelfHostCompleteClaimed = false)
      /\ (composeFixtureProofCompleteClaimed = false)
      /\ (composeFixtureLlvmUnlocked = false) :=
  And.intro rfl (And.intro rfl (And.intro rfl rfl))

/-- lowerComposeFixtureProgram succeeds with length 3.
    Greppable: lowerComposeFixtureProgram_length_three, COMPILE-PATH-COMPOSE-THEOREM. -/
theorem lowerComposeFixtureProgram_length_three :
    (match lowerComposeFixtureProgram with
     | some p => IrProgram.length p == 3
     | none => false) = true := by decide

/-- lowerComposeFixtureCompose is some (mark+mint path with edges).
    Greppable: lowerComposeFixtureCompose_isSome, COMPILE-PATH-COMPOSE-THEOREM. -/
theorem lowerComposeFixtureCompose_isSome :
    lowerComposeFixtureCompose.isSome = true := by decide



/-! ### COMPILE-PATH-COMPOSE-SMOKE (Compose fixture end-to-end; lake fails if examples fail)
    Greppable: COMPILE-PATH-COMPOSE-SMOKE, COMPOSE-FIXTURE, COMPILE-PATH-COMPOSE. -/

/-- COMPILE-PATH-COMPOSE-SMOKE: multi-node ordered IR + chain edges 0->1, 1->2. -/
example : (lowerComposeFixtureProgram.isSome) = true := by decide
example : composeFixtureProgram.nodes.length = 3 := by decide
example : programCompileReady composeFixtureProgram = true := by decide
example : composeFixtureProgramReady = true := by decide
example : composeFixtureEdgesOk = true := by decide
example : composeFixtureMintId = 9 := rfl
example :
    (match lowerComposeFixtureComposeRaw with
     | some hc =>
         IrGraph.edgeCount hc.graph == 2
           && IrGraph.nodeCount hc.graph == 3
           && composeFixtureChainEdgesOk hc.graph.edges
     | none => false) = true := by decide

/-- COMPILE-PATH-COMPOSE-SMOKE: raw Compose fails; mark+mint unit-ready with edges. -/
example : composeFixtureComposeRawUnready = true := by decide
example : composeFixtureComposeReady = true := by decide
example :
    (match lowerComposeFixtureCompose with
     | some hc =>
         unitCompileReady hc
           && hc.linear.live
           && hc.linear.id == composeFixtureMintId
           && hc.erased.marked
           && IrGraph.edgeCount hc.graph == 2
           && IrGraph.isWellTyped hc.graph
           && composeFixtureChainEdgesOk hc.graph.edges
     | none => false) = true := by decide

/-- COMPILE-PATH-COMPOSE-SMOKE: ConsumeToken mint/consume exact-once. -/
example : composeFixtureMintConsumeOk = true := by decide

/-- COMPILE-PATH-COMPOSE-SMOKE: HOST-EMIT-COMPOSE product text path honesty. -/
example : composeFixtureEmitPathOk = true := by native_decide
example : EmitCompose.hostEmitComposeId = "HOST-EMIT-COMPOSE" := rfl
example : EmitCompose.stageId = "SLAKE_SELF_HOST_EMIT_COMPOSE_V0" := rfl

/-- COMPILE-PATH-COMPOSE-SMOKE: full Compose e2e compile path; free/complete stay false. -/
example : composeFixtureCompilePathReady = true := by native_decide
example : composeFixtureDoesNotMeanResidualFree = true := by native_decide
example : composeFixtureResidualFreeClaimed = false := rfl
example : composeFixtureProductSelfHostCompleteClaimed = false := rfl
example : composeFixtureProofCompleteClaimed = false := rfl
example : composeFixtureLlvmUnlocked = false := rfl


end SystemsLean.CompilePath
