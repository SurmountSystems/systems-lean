/-
  SYSTEMS_LEAN_HOST partial -- Plan unit compile-path fixture (COMPILE-PATH-PLAN).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Owns Plan end-to-end compile-path fixture only: multi-node ordered IR ->
  host mark+mint (unitCompileReady) -> planFromCompose / planOk ->
  HOST-EMIT-PLAN.
  Core compile bars and shared fixture helpers live in SystemsLean.CompilePath.
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full Slake compiler.
  Greppable: SYSTEMS_LEAN_HOST, COMPILE-PATH-PLAN, PLAN-FIXTURE, HOST-EMIT-PLAN,
  planFixtureCompilePathReady, COMPILE-PATH-PLAN-SMOKE, COMPILE-PATH-PLAN-THEOREM.
  UNIT_SURFACE host surface. Module: SystemsLean.CompilePathPlan
  Red/green: just systems-host; lake build SystemsLean.CompilePathPlan.
  Module must stay ASCII. Not freestanding emit residual free. Not PROVABLY.
  RUNTIME-FS plan path honesty only (not residual free forge).
-/

import SystemsLean.CompilePath
import SystemsLean.EmitPlan
import SystemsLean.EmitPlanScaffold

namespace SystemsLean.CompilePath

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.IrGraph (Graph)
open SystemsLean.HostCompose (Host)

/-! ### COMPILE-PATH-PLAN / PLAN-FIXTURE (Track 2 Plan unit end-to-end)

  Named Plan fixture: multi-node ordered IR (ERASED/LINEAR/VALUE) -> host compose
  mark MULT-0 + mint MULT-1 (mint id 10) -> unitCompileReady, then
  planFromCompose / planOk readiness inventory (nodeCount / runtimeNodes /
  erasedNodes) and HOST-EMIT-PLAN product text honesty.
  Mint-id honesty: Plan uses 10 so Mult=4
  Types=5 Program=6 Linear=7 Graph=8 Compose=9 stay other fixtures. Same
  planFromCompose FAIL-CLOSED inventory as EmitPlan.lean host API; e2e bar lives
  here. Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full IR body emit / full Slake compiler.
-/

/-- Fixed Plan fixture mint id (unused by Mult..Compose fixtures). -/
def planFixtureMintId : Nat := 10

/-- Plan fixture mint id is 10 (Mult=4 Types=5 Program=6 Linear=7 Graph=8 Compose=9).
    Greppable: planFixtureMintId_eq, COMPILE-PATH-PLAN-THEOREM. -/
theorem planFixtureMintId_eq : planFixtureMintId = 10 := rfl

/-- Plan fixture type tags (deterministic; match Mult/Compose tagErased/Linear/Value). -/
def planFixtureTagErased : Nat := 0
def planFixtureTagLinear : Nat := 1
def planFixtureTagValue : Nat := 2

/-- Plan fixture nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value. -/
def planFixtureErasedNode : IrNode :=
  { ty := typeTagInit planFixtureTagErased, mult := Mult.mult0, kind := NodeKind.erased }

def planFixtureLinearNode : IrNode :=
  { ty := typeTagInit planFixtureTagLinear, mult := Mult.mult1, kind := NodeKind.linear }

def planFixtureValueNode : IrNode :=
  { ty := typeTagInit planFixtureTagValue, mult := Mult.multOmega, kind := NodeKind.value }

/-- lowerPlanFixtureProgram -- multi-node ordered IR (COMPILE-PATH-PLAN).
    Three nodes: MULT-0 ERASED, MULT-1 LINEAR, MULT-OMEGA VALUE.
    FAIL-CLOSED: none if any push fails.
    Greppable: lowerPlanFixtureProgram, PLAN-FIXTURE, ORDERED-IR-PROGRAM. -/
def lowerPlanFixtureProgram : Option Program :=
  match pushFixtureProg IrProgram.empty planFixtureErasedNode with
  | none => none
  | some p0 =>
    match pushFixtureProg p0 planFixtureLinearNode with
    | none => none
    | some p1 => pushFixtureProg p1 planFixtureValueNode

/-- planFixtureProgram -- Plan ordered IR when lower succeeds; empty on fail. -/
def planFixtureProgram : Program :=
  match lowerPlanFixtureProgram with
  | some p => p
  | none => IrProgram.empty

/-- lowerPlanFixtureComposeRaw -- HostCompose with three Mult nodes, no mint/mark.
    FAIL-CLOSED: none on push fail. Unready for multPreScan (MULT-0/1 need handles).
    Greppable: lowerPlanFixtureComposeRaw, PLAN-FIXTURE, HOST-COMPOSE. -/
def lowerPlanFixtureComposeRaw : Option Host :=
  match pushFixtureHost HostCompose.empty planFixtureErasedNode with
  | none => none
  | some hc0 =>
    match pushFixtureHost hc0 planFixtureLinearNode with
    | none => none
    | some hc1 => pushFixtureHost hc1 planFixtureValueNode

/-- lowerPlanFixtureCompose -- Plan fixture host ready for unit compile path.
    markErased (MULT-0) + mint (MULT-1); MULT-OMEGA needs neither.
    FAIL-CLOSED: none if raw lower or mint fails.
    Greppable: lowerPlanFixtureCompose, PLAN-FIXTURE, HOST-COMPOSE. -/
def lowerPlanFixtureCompose : Option Host :=
  match lowerPlanFixtureComposeRaw with
  | none => none
  | some hcRaw =>
    let hcMarked := HostCompose.markErased hcRaw
    mintFixtureHost hcMarked planFixtureMintId

/-- planFixtureProgramReady -- ordered IR bar for Plan fixture.
    FAIL-CLOSED: lower succeeds, length 3, programCompileReady, isWellTyped,
    and gradeSurfaceOk.
    Greppable: planFixtureProgramReady, COMPILE-PATH-PLAN, PLAN-FIXTURE. -/
def planFixtureProgramReady : Bool :=
  match lowerPlanFixtureProgram with
  | none => false
  | some p =>
      programCompileReady p
        && IrProgram.length p == 3
        && IrProgram.isWellTyped p
        && gradeSurfaceOk

/-- planFixturePlanOk -- planFromCompose / planOk inventory readiness on ready host.
    Expected inventory: nodeCount 3, edgeCount 0, runtimeNodes 2 (MULT-1+OMEGA),
    erasedNodes 1 (MULT-0). FAIL-CLOSED: planOk (primary; definitionally isReady
    (planFromCompose hc)) + structural counts from planFromCompose.
    Greppable: planFixturePlanOk, planFromCompose, planOk, COMPILE-PATH-PLAN. -/
def planFixturePlanOk : Bool :=
  match lowerPlanFixtureCompose with
  | none => false
  | some hc =>
      let p := EmitPlan.planFromCompose hc
      EmitPlan.planOk hc
        && p.nodeCount == 3
        && p.edgeCount == 0
        && p.runtimeNodes == 2
        && p.erasedNodes == 1

/-- planFixtureComposeReady -- unit compile-path bar on Plan fixture host.
    FAIL-CLOSED: lower compose succeeds, unitCompileReady, extractOkFs,
    live mint with planFixtureMintId, erased marked after markErased,
    program length 3, and graph well-typed.
    Greppable: planFixtureComposeReady, COMPILE-PATH-PLAN, unitCompileReady. -/
def planFixtureComposeReady : Bool :=
  match lowerPlanFixtureCompose with
  | none => false
  | some hc =>
      unitCompileReady hc
        && HostCompose.extractOkFs hc
        && hc.linear.live
        && hc.linear.id == planFixtureMintId
        && hc.erased.marked
        && IrProgram.length hc.graph.prog == 3
        && IrGraph.isWellTyped hc.graph

/-- planFixtureComposeRawUnready -- unminted/unmarked Plan compose fails unit bar
    and plan inventory (FAIL-CLOSED planFromCompose).
    Greppable: planFixtureComposeRawUnready, FAIL-CLOSED, PLAN-FIXTURE. -/
def planFixtureComposeRawUnready : Bool :=
  match lowerPlanFixtureComposeRaw with
  | none => false
  | some hc =>
      !unitCompileReady hc
        && !HostCompose.checkFailClosed hc
        && !EmitPlan.planOk hc
        && !hc.linear.live
        && !hc.erased.marked

/-- planFixtureEmitPathOk -- host Plan product text path honesty (HOST-EMIT-PLAN).
    Reuses EmitPlan.emitPlanReady; does not re-emit C; not residual free.
    Greppable: planFixtureEmitPathOk, HOST-EMIT-PLAN, COMPILE-PATH-PLAN. -/
def planFixtureEmitPathOk : Bool := EmitPlan.emitPlanReady

/-- Local honesty: Plan e2e fixture does NOT claim residual free. -/
def planFixtureResidualFreeClaimed : Bool := false

/-- Local honesty: Plan e2e fixture does NOT complete product self-host. -/
def planFixtureProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: Plan e2e fixture does NOT claim proof complete. -/
def planFixtureProofCompleteClaimed : Bool := false

/-- Local honesty: Plan e2e fixture does NOT unlock llvm. -/
def planFixtureLlvmUnlocked : Bool := false

/-- planFixtureCompilePathReady -- end-to-end Plan unit compile path (Track 2).
    Multi-node IR + mark+mint unit bar + planFromCompose inventory + HOST-EMIT-PLAN
    emit path + free/complete/proof/llvm stay false.
    Greppable: planFixtureCompilePathReady, COMPILE-PATH-PLAN, PLAN-FIXTURE,
    HOST-COMPILE-PATH, HOST-EMIT-PLAN, planFromCompose. -/
def planFixtureCompilePathReady : Bool :=
  gradeSurfaceOk
    && planFixtureProgramReady
    && planFixtureComposeReady
    && planFixtureComposeRawUnready
    && planFixturePlanOk
    && planFixtureEmitPathOk
    && !planFixtureResidualFreeClaimed
    && !planFixtureProductSelfHostCompleteClaimed
    && !planFixtureProofCompleteClaimed
    && !planFixtureLlvmUnlocked

/-- planFixtureDoesNotMeanResidualFree -- e2e ready does not claim residual free.
    Greppable: planFixtureDoesNotMeanResidualFree, COMPILE-PATH-PLAN. -/
def planFixtureDoesNotMeanResidualFree : Bool :=
  planFixtureCompilePathReady && !planFixtureResidualFreeClaimed

/-! ### COMPILE-PATH-PLAN-THEOREM (readable Plan e2e statements, then proofs)

  Real Lean theorems for Plan fixture compile path only. Does not flip
  SpecProof.proofCompleteClaimed / residual free / product self-host complete.
-/

set_option maxRecDepth 8192

/-- Plan fixture ordered IR program is compile-path ready.
    Greppable: planFixtureProgramReady_true, COMPILE-PATH-PLAN-THEOREM. -/
theorem planFixtureProgramReady_true : planFixtureProgramReady = true := by decide

/-- Plan fixture host compose is unit-compile-ready after mark+mint.
    Greppable: planFixtureComposeReady_true, COMPILE-PATH-PLAN-THEOREM. -/
theorem planFixtureComposeReady_true : planFixtureComposeReady = true := by decide

/-- Unready Plan compose fails unit bar and plan inventory (FAIL-CLOSED).
    Greppable: planFixtureComposeRaw_unready_true, COMPILE-PATH-PLAN-THEOREM. -/
theorem planFixtureComposeRaw_unready_true :
    planFixtureComposeRawUnready = true := by decide

/-- planFromCompose inventory readiness holds on Plan fixture ready host.
    Greppable: planFixturePlanOk_true, planFromCompose, planOk,
    COMPILE-PATH-PLAN-THEOREM. -/
theorem planFixturePlanOk_true : planFixturePlanOk = true := by decide

/-- HOST-EMIT-PLAN product text path honesty holds on Plan fixture path.
    Greppable: planFixtureEmitPathOk_true, HOST-EMIT-PLAN,
    COMPILE-PATH-PLAN-THEOREM. -/
theorem planFixtureEmitPathOk_true : planFixtureEmitPathOk = true := by
  native_decide

/-- End-to-end Plan unit compile path ready (Track 2 Plan fixture).
    Greppable: planFixtureCompilePathReady_true, COMPILE-PATH-PLAN-THEOREM,
    COMPILE-PATH-PLAN, PLAN-FIXTURE, HOST-COMPILE-PATH. -/
theorem planFixtureCompilePathReady_true :
    planFixtureCompilePathReady = true := by
  native_decide

/-- Plan e2e ready does not claim residual free.
    Greppable: planFixtureDoesNotMeanResidualFree_true, COMPILE-PATH-PLAN-THEOREM. -/
theorem planFixtureDoesNotMeanResidualFree_true :
    planFixtureDoesNotMeanResidualFree = true := by
  native_decide

/-- Plan e2e free/complete/proof/llvm honesty stays false.
    Greppable: planFixture_claims_false, COMPILE-PATH-PLAN-THEOREM. -/
theorem planFixture_claims_false :
    (planFixtureResidualFreeClaimed = false)
      /\ (planFixtureProductSelfHostCompleteClaimed = false)
      /\ (planFixtureProofCompleteClaimed = false)
      /\ (planFixtureLlvmUnlocked = false) :=
  And.intro rfl (And.intro rfl (And.intro rfl rfl))

/-- lowerPlanFixtureProgram succeeds with length 3.
    Greppable: lowerPlanFixtureProgram_length_three, COMPILE-PATH-PLAN-THEOREM. -/
theorem lowerPlanFixtureProgram_length_three :
    (match lowerPlanFixtureProgram with
     | some p => IrProgram.length p == 3
     | none => false) = true := by decide

/-- lowerPlanFixtureCompose is some (mark+mint path).
    Greppable: lowerPlanFixtureCompose_isSome, COMPILE-PATH-PLAN-THEOREM. -/
theorem lowerPlanFixtureCompose_isSome :
    lowerPlanFixtureCompose.isSome = true := by decide


/-! ### COMPILE-PATH-PLAN-SMOKE (Plan fixture end-to-end; lake fails if examples fail)
    Greppable: COMPILE-PATH-PLAN-SMOKE, PLAN-FIXTURE, COMPILE-PATH-PLAN. -/

/-- COMPILE-PATH-PLAN-SMOKE: multi-node ordered IR (length 3, well-typed). -/
example : (lowerPlanFixtureProgram.isSome) = true := by decide
example : planFixtureProgram.nodes.length = 3 := by decide
example : programCompileReady planFixtureProgram = true := by decide
example : planFixtureProgramReady = true := by decide
example : planFixtureMintId = 10 := rfl

/-- COMPILE-PATH-PLAN-SMOKE: raw Plan fails; mark+mint unit-ready. -/
example : planFixtureComposeRawUnready = true := by decide
example : planFixtureComposeReady = true := by decide
example :
    (match lowerPlanFixtureCompose with
     | some hc =>
         unitCompileReady hc
           && hc.linear.live
           && hc.linear.id == planFixtureMintId
           && hc.erased.marked
           && IrProgram.length hc.graph.prog == 3
           && IrGraph.isWellTyped hc.graph
     | none => false) = true := by decide

/-- COMPILE-PATH-PLAN-SMOKE: planFromCompose inventory readiness (counts). -/
example : planFixturePlanOk = true := by decide
example :
    (match lowerPlanFixtureCompose with
     | some hc =>
         let p := EmitPlan.planFromCompose hc
         EmitPlan.planOk hc
           && p.nodeCount == 3
           && p.edgeCount == 0
           && p.runtimeNodes == 2
           && p.erasedNodes == 1
     | none => false) = true := by decide

/-- COMPILE-PATH-PLAN-SMOKE: HOST-EMIT-PLAN product text path honesty. -/
example : planFixtureEmitPathOk = true := by native_decide
example : EmitPlan.hostEmitPlanId = "HOST-EMIT-PLAN" := rfl
example : EmitPlan.productStageId = "SLAKE_SELF_HOST_EMIT_PLAN_V0" := rfl

/-- COMPILE-PATH-PLAN-SMOKE: full Plan e2e compile path; free/complete stay false. -/
example : planFixtureCompilePathReady = true := by native_decide
example : planFixtureDoesNotMeanResidualFree = true := by native_decide
example : planFixtureResidualFreeClaimed = false := rfl
example : planFixtureProductSelfHostCompleteClaimed = false := rfl
example : planFixtureProofCompleteClaimed = false := rfl
example : planFixtureLlvmUnlocked = false := rfl


end SystemsLean.CompilePath
