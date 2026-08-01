/-
  SYSTEMS_LEAN_HOST partial -- Apply unit compile-path fixture (COMPILE-PATH-APPLY).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Owns Apply end-to-end compile-path fixture only: multi-node ordered IR ->
  host mark+mint -> applyFromCompose / applyOk -> unitCompileReady + HOST-EMIT-APPLY.
  Core compile bars and shared fixture helpers live in SystemsLean.CompilePath.
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full Slake compiler.
  Greppable: SYSTEMS_LEAN_HOST, COMPILE-PATH-APPLY, APPLY-FIXTURE, HOST-EMIT-APPLY,
  applyFixtureCompilePathReady, COMPILE-PATH-APPLY-SMOKE, COMPILE-PATH-APPLY-THEOREM.
  UNIT_SURFACE host surface. Module: SystemsLean.CompilePathApply
  Red/green: just systems-host; lake build SystemsLean.CompilePathApply.
  Module must stay ASCII. Not freestanding emit residual free. Not PROVABLY.
  RUNTIME-FS apply path honesty only (not residual free forge).
-/

import SystemsLean.CompilePath
import SystemsLean.EmitApply
import SystemsLean.EmitApplyScaffold

namespace SystemsLean.CompilePath

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.IrGraph (Graph)
open SystemsLean.HostCompose (Host)

/-! ### COMPILE-PATH-APPLY / APPLY-FIXTURE (Track 2 Apply unit end-to-end)

  Named Apply fixture: multi-node ordered IR (ERASED/LINEAR/VALUE so tags differ)
  -> host compose mark MULT-0 + mint MULT-1 (mint id 11) -> applyFromCompose /
  applyOk tag-buffer readiness (count / tags / cap) -> unitCompileReady +
  HOST-EMIT-APPLY product text honesty. Mint-id honesty: Apply uses 11 so Mult=4
  Types=5 Program=6 Linear=7 Graph=8 Compose=9 Plan=10 stay other fixtures. Same
  applyFromCompose FAIL-CLOSED tag path as EmitApply.lean host API; e2e bar lives
  here. Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full IR body emit / full Slake compiler.
-/

/-- Fixed Apply fixture mint id (unused by Mult..Plan fixtures). -/
def applyFixtureMintId : Nat := 11

/-- Apply fixture mint id is 11 (Mult=4 Types=5 Program=6 Linear=7 Graph=8
    Compose=9 Plan=10). Greppable: applyFixtureMintId_eq, COMPILE-PATH-APPLY-THEOREM. -/
theorem applyFixtureMintId_eq : applyFixtureMintId = 11 := rfl

/-- Apply fixture type tags (deterministic; match Mult/Plan tagErased/Linear/Value). -/
def applyFixtureTagErased : Nat := 0
def applyFixtureTagLinear : Nat := 1
def applyFixtureTagValue : Nat := 2

/-- Apply fixture nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value. -/
def applyFixtureErasedNode : IrNode :=
  { ty := typeTagInit applyFixtureTagErased, mult := Mult.mult0, kind := NodeKind.erased }

def applyFixtureLinearNode : IrNode :=
  { ty := typeTagInit applyFixtureTagLinear, mult := Mult.mult1, kind := NodeKind.linear }

def applyFixtureValueNode : IrNode :=
  { ty := typeTagInit applyFixtureTagValue, mult := Mult.multOmega, kind := NodeKind.value }

/-- Expected packed tags in program order (EMIT-APPLY packTag honesty):
    MULT-0 ERASED=2, MULT-1 LINEAR=17, MULT-OMEGA VALUE=32. -/
def applyFixtureExpectedTags : List Nat := [2, 17, 32]

/-- lowerApplyFixtureProgram -- multi-node ordered IR (COMPILE-PATH-APPLY).
    Three nodes: MULT-0 ERASED, MULT-1 LINEAR, MULT-OMEGA VALUE.
    FAIL-CLOSED: none if any push fails.
    Greppable: lowerApplyFixtureProgram, APPLY-FIXTURE, ORDERED-IR-PROGRAM. -/
def lowerApplyFixtureProgram : Option Program :=
  match pushFixtureProg IrProgram.empty applyFixtureErasedNode with
  | none => none
  | some p0 =>
    match pushFixtureProg p0 applyFixtureLinearNode with
    | none => none
    | some p1 => pushFixtureProg p1 applyFixtureValueNode

/-- applyFixtureProgram -- Apply ordered IR when lower succeeds; empty on fail. -/
def applyFixtureProgram : Program :=
  match lowerApplyFixtureProgram with
  | some p => p
  | none => IrProgram.empty

/-- lowerApplyFixtureComposeRaw -- HostCompose with three Mult nodes, no mint/mark.
    FAIL-CLOSED: none on push fail. Unready for multPreScan (MULT-0/1 need handles).
    Greppable: lowerApplyFixtureComposeRaw, APPLY-FIXTURE, HOST-COMPOSE. -/
def lowerApplyFixtureComposeRaw : Option Host :=
  match pushFixtureHost HostCompose.empty applyFixtureErasedNode with
  | none => none
  | some hc0 =>
    match pushFixtureHost hc0 applyFixtureLinearNode with
    | none => none
    | some hc1 => pushFixtureHost hc1 applyFixtureValueNode

/-- lowerApplyFixtureCompose -- Apply fixture host ready for unit compile path.
    markErased (MULT-0) + mint (MULT-1); MULT-OMEGA needs neither.
    FAIL-CLOSED: none if raw lower or mint fails.
    Greppable: lowerApplyFixtureCompose, APPLY-FIXTURE, HOST-COMPOSE. -/
def lowerApplyFixtureCompose : Option Host :=
  match lowerApplyFixtureComposeRaw with
  | none => none
  | some hcRaw =>
    let hcMarked := HostCompose.markErased hcRaw
    mintFixtureHost hcMarked applyFixtureMintId

/-- applyFixtureProgramReady -- ordered IR bar for Apply fixture.
    FAIL-CLOSED: lower succeeds, length 3, programCompileReady, gradeSurfaceOk.
    Greppable: applyFixtureProgramReady, COMPILE-PATH-APPLY, APPLY-FIXTURE. -/
def applyFixtureProgramReady : Bool :=
  match lowerApplyFixtureProgram with
  | none => false
  | some p =>
      programCompileReady p
        && IrProgram.length p == 3
        && IrProgram.isWellTyped p
        && gradeSurfaceOk

/-- applyFixtureApplyOk -- applyFromCompose / applyOk tag-buffer readiness on ready host.
    Expected: count 3, tags [2, 17, 32] (erased/linear/value pack order), count <= applyCap.
    Primary check: applyOk (definitionally applyIsValid (applyFromCompose hc));
    structural fields from applyFromCompose (not a bare true canary; no redundant
    applyIsValid / valid / ready triple).
    Greppable: applyFixtureApplyOk, applyFromCompose, applyOk, COMPILE-PATH-APPLY. -/
def applyFixtureApplyOk : Bool :=
  match lowerApplyFixtureCompose with
  | none => false
  | some hc =>
      let a := EmitApply.applyFromCompose hc
      EmitApply.applyOk hc
        && a.count == 3
        && a.tags == applyFixtureExpectedTags
        && decide (a.count <= EmitApply.applyCap)

/-- applyFixtureComposeReady -- unit compile-path bar on Apply fixture host.
    FAIL-CLOSED: lower compose succeeds, unitCompileReady, live mint with
    applyFixtureMintId, erased marked after markErased, extractOkFs.
    Greppable: applyFixtureComposeReady, COMPILE-PATH-APPLY, unitCompileReady. -/
def applyFixtureComposeReady : Bool :=
  match lowerApplyFixtureCompose with
  | none => false
  | some hc =>
      unitCompileReady hc
        && HostCompose.extractOkFs hc
        && hc.linear.live
        && hc.linear.id == applyFixtureMintId
        && hc.erased.marked
        && IrProgram.length hc.graph.prog == 3
        && IrGraph.isWellTyped hc.graph

/-- applyFixtureComposeRawUnready -- unminted/unmarked Apply compose fails unit bar
    and apply tag path (FAIL-CLOSED applyFromCompose).
    Greppable: applyFixtureComposeRawUnready, FAIL-CLOSED, APPLY-FIXTURE. -/
def applyFixtureComposeRawUnready : Bool :=
  match lowerApplyFixtureComposeRaw with
  | none => false
  | some hc =>
      !unitCompileReady hc
        && !HostCompose.checkFailClosed hc
        && !EmitApply.applyOk hc
        && !hc.linear.live
        && !hc.erased.marked

/-- applyFixtureEmitPathOk -- host Apply product text path honesty (HOST-EMIT-APPLY).
    Reuses EmitApply.emitApplyReady; does not re-emit C; not residual free.
    Greppable: applyFixtureEmitPathOk, HOST-EMIT-APPLY, COMPILE-PATH-APPLY. -/
def applyFixtureEmitPathOk : Bool := EmitApply.emitApplyReady

/-- Local honesty: Apply e2e fixture does NOT claim residual free. -/
def applyFixtureResidualFreeClaimed : Bool := false

/-- Local honesty: Apply e2e fixture does NOT complete product self-host. -/
def applyFixtureProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: Apply e2e fixture does NOT claim proof complete. -/
def applyFixtureProofCompleteClaimed : Bool := false

/-- Local honesty: Apply e2e fixture does NOT unlock llvm. -/
def applyFixtureLlvmUnlocked : Bool := false

/-- applyFixtureCompilePathReady -- end-to-end Apply unit compile path (Track 2).
    Multi-node IR + mark+mint unit bar + applyFromCompose tag buffer + HOST-EMIT-APPLY
    emit path + free/complete/proof/llvm stay false.
    Greppable: applyFixtureCompilePathReady, COMPILE-PATH-APPLY, APPLY-FIXTURE,
    HOST-COMPILE-PATH, HOST-EMIT-APPLY, applyFromCompose. -/
def applyFixtureCompilePathReady : Bool :=
  gradeSurfaceOk
    && applyFixtureProgramReady
    && applyFixtureComposeReady
    && applyFixtureComposeRawUnready
    && applyFixtureApplyOk
    && applyFixtureEmitPathOk
    && !applyFixtureResidualFreeClaimed
    && !applyFixtureProductSelfHostCompleteClaimed
    && !applyFixtureProofCompleteClaimed
    && !applyFixtureLlvmUnlocked

/-- applyFixtureDoesNotMeanResidualFree -- e2e ready does not claim residual free.
    Greppable: applyFixtureDoesNotMeanResidualFree, COMPILE-PATH-APPLY. -/
def applyFixtureDoesNotMeanResidualFree : Bool :=
  applyFixtureCompilePathReady && !applyFixtureResidualFreeClaimed

/-! ### COMPILE-PATH-APPLY-THEOREM (readable Apply e2e statements, then proofs)

  Real Lean theorems for Apply fixture compile path only. Does not flip
  SpecProof.proofCompleteClaimed / residual free / product self-host complete.
-/

set_option maxRecDepth 8192

/-- Apply fixture ordered IR program is compile-path ready.
    Greppable: applyFixtureProgramReady_true, COMPILE-PATH-APPLY-THEOREM. -/
theorem applyFixtureProgramReady_true : applyFixtureProgramReady = true := by decide

/-- Apply fixture host compose is unit-compile-ready after mark+mint.
    Greppable: applyFixtureComposeReady_true, COMPILE-PATH-APPLY-THEOREM. -/
theorem applyFixtureComposeReady_true : applyFixtureComposeReady = true := by decide

/-- Unready Apply compose fails unit bar and apply path (FAIL-CLOSED).
    Greppable: applyFixtureComposeRaw_unready_true, COMPILE-PATH-APPLY-THEOREM. -/
theorem applyFixtureComposeRaw_unready_true :
    applyFixtureComposeRawUnready = true := by decide

/-- applyFromCompose tag-buffer readiness holds on Apply fixture ready host.
    Greppable: applyFixtureApplyOk_true, applyFromCompose, applyOk,
    COMPILE-PATH-APPLY-THEOREM. -/
theorem applyFixtureApplyOk_true : applyFixtureApplyOk = true := by decide

/-- HOST-EMIT-APPLY product text path honesty holds on Apply fixture path.
    Greppable: applyFixtureEmitPathOk_true, HOST-EMIT-APPLY,
    COMPILE-PATH-APPLY-THEOREM. -/
theorem applyFixtureEmitPathOk_true : applyFixtureEmitPathOk = true := by
  native_decide

/-- End-to-end Apply unit compile path ready (Track 2 Apply fixture).
    Greppable: applyFixtureCompilePathReady_true, COMPILE-PATH-APPLY-THEOREM,
    COMPILE-PATH-APPLY, APPLY-FIXTURE, HOST-COMPILE-PATH. -/
theorem applyFixtureCompilePathReady_true :
    applyFixtureCompilePathReady = true := by
  native_decide

/-- Apply e2e ready does not claim residual free.
    Greppable: applyFixtureDoesNotMeanResidualFree_true, COMPILE-PATH-APPLY-THEOREM. -/
theorem applyFixtureDoesNotMeanResidualFree_true :
    applyFixtureDoesNotMeanResidualFree = true := by
  native_decide

/-- Apply e2e free/complete/proof/llvm honesty stays false.
    Greppable: applyFixture_claims_false, COMPILE-PATH-APPLY-THEOREM. -/
theorem applyFixture_claims_false :
    (applyFixtureResidualFreeClaimed = false)
      /\ (applyFixtureProductSelfHostCompleteClaimed = false)
      /\ (applyFixtureProofCompleteClaimed = false)
      /\ (applyFixtureLlvmUnlocked = false) :=
  And.intro rfl (And.intro rfl (And.intro rfl rfl))

/-- lowerApplyFixtureProgram succeeds with length 3.
    Greppable: lowerApplyFixtureProgram_length_three, COMPILE-PATH-APPLY-THEOREM. -/
theorem lowerApplyFixtureProgram_length_three :
    (match lowerApplyFixtureProgram with
     | some p => IrProgram.length p == 3
     | none => false) = true := by decide

/-- lowerApplyFixtureCompose is some (mark+mint path).
    Greppable: lowerApplyFixtureCompose_isSome, COMPILE-PATH-APPLY-THEOREM. -/
theorem lowerApplyFixtureCompose_isSome :
    lowerApplyFixtureCompose.isSome = true := by decide


/-! ### COMPILE-PATH-APPLY-SMOKE (Apply fixture end-to-end; lake fails if examples fail)
    Greppable: COMPILE-PATH-APPLY-SMOKE, APPLY-FIXTURE, COMPILE-PATH-APPLY. -/

/-- COMPILE-PATH-APPLY-SMOKE: multi-node ordered IR (length 3, well-typed). -/
example : (lowerApplyFixtureProgram.isSome) = true := by decide
example : applyFixtureProgram.nodes.length = 3 := by decide
example : programCompileReady applyFixtureProgram = true := by decide
example : applyFixtureProgramReady = true := by decide
example : applyFixtureMintId = 11 := rfl

/-- COMPILE-PATH-APPLY-SMOKE: raw Apply fails; mark+mint unit-ready. -/
example : applyFixtureComposeRawUnready = true := by decide
example : applyFixtureComposeReady = true := by decide
example :
    (match lowerApplyFixtureCompose with
     | some hc =>
         unitCompileReady hc
           && hc.linear.live
           && hc.linear.id == applyFixtureMintId
           && hc.erased.marked
           && IrProgram.length hc.graph.prog == 3
           && IrGraph.isWellTyped hc.graph
     | none => false) = true := by decide

/-- COMPILE-PATH-APPLY-SMOKE: applyFromCompose tag-buffer readiness (tags/count/cap). -/
example : applyFixtureApplyOk = true := by decide
example :
    (match lowerApplyFixtureCompose with
     | some hc =>
         let a := EmitApply.applyFromCompose hc
         EmitApply.applyOk hc
           && a.count == 3
           && a.tags == [2, 17, 32]
           && decide (a.count <= EmitApply.applyCap)
     | none => false) = true := by decide

/-- COMPILE-PATH-APPLY-SMOKE: HOST-EMIT-APPLY product text path honesty. -/
example : applyFixtureEmitPathOk = true := by native_decide
example : EmitApply.hostEmitApplyId = "HOST-EMIT-APPLY" := rfl
example : EmitApply.productStageId = "SLAKE_SELF_HOST_EMIT_APPLY_V0" := rfl

/-- COMPILE-PATH-APPLY-SMOKE: full Apply e2e compile path; free/complete stay false. -/
example : applyFixtureCompilePathReady = true := by native_decide
example : applyFixtureDoesNotMeanResidualFree = true := by native_decide
example : applyFixtureResidualFreeClaimed = false := rfl
example : applyFixtureProductSelfHostCompleteClaimed = false := rfl
example : applyFixtureProofCompleteClaimed = false := rfl
example : applyFixtureLlvmUnlocked = false := rfl


end SystemsLean.CompilePath
