/-
  SYSTEMS_LEAN_HOST partial -- Linear unit compile-path fixture (COMPILE-PATH-LINEAR).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Owns Linear end-to-end compile-path fixture only: MULT-1 linear -> ordered IR ->
  host mint + ConsumeToken exact-once -> unitCompileReady + HOST-EMIT-LINEAR.
  Core compile bars and shared fixture helpers live in SystemsLean.CompilePath.
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full Slake compiler.
  Greppable: SYSTEMS_LEAN_HOST, COMPILE-PATH-LINEAR, LINEAR-FIXTURE, HOST-EMIT-LINEAR,
  linearFixtureCompilePathReady, COMPILE-PATH-LINEAR-SMOKE, COMPILE-PATH-LINEAR-THEOREM.
  UNIT_SURFACE host surface. Module: SystemsLean.CompilePathLinear
  Red/green: just systems-host; lake build SystemsLean.CompilePathLinear.
  Module must stay ASCII. Not freestanding emit residual free. Not PROVABLY.
  RUNTIME-FS path honesty only (not residual free forge).
-/

import SystemsLean.CompilePath
import SystemsLean.EmitLinear

namespace SystemsLean.CompilePath

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.IrGraph (Graph)
open SystemsLean.HostCompose (Host)

/-! ### COMPILE-PATH-LINEAR / LINEAR-FIXTURE (Track 2 Linear unit end-to-end)

  Named Linear fixture: MULT-1 linear grade -> ordered IR program (1-node
  LINEAR) -> host compose mint -> unitCompileReady + ConsumeToken mint/consume
  exact-once + HOST-EMIT-LINEAR product text honesty. Same MULT-1 LINEAR
  pairing as KernelLinear IR fixture; e2e bar lives here (KernelLinear imports
  CompilePath -- no import cycle).
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / elaborator MULT-1 freestanding residual free / full Slake
  compiler.
-/


set_option maxRecDepth 8192

/-- Fixed Linear fixture mint id (nonzero; matches KernelLinear smokeMintId 7). -/
def linearFixtureMintId : Nat := 7

/-- Linear fixture type tag (deterministic; match KernelLinear tagLinear). -/
def linearFixtureTagLinear : Nat := 1

/-- Linear fixture node: MULT-1 linear (LINEAR-EXACT-ONCE resource). -/
def linearFixtureLinearNode : IrNode :=
  { ty := typeTagInit linearFixtureTagLinear, mult := Mult.mult1, kind := NodeKind.linear }

/-- lowerLinearFixtureProgram -- MULT-1 linear as ordered IR (COMPILE-PATH-LINEAR).
    One node: MULT-1 LINEAR. FAIL-CLOSED: none if push fails.
    Greppable: lowerLinearFixtureProgram, LINEAR-FIXTURE, ORDERED-IR-PROGRAM. -/
def lowerLinearFixtureProgram : Option Program :=
  pushFixtureProg IrProgram.empty linearFixtureLinearNode

/-- linearFixtureProgram -- Linear ordered IR when lower succeeds; empty on fail. -/
def linearFixtureProgram : Program :=
  match lowerLinearFixtureProgram with
  | some p => p
  | none => IrProgram.empty

/-- lowerLinearFixtureComposeRaw -- HostCompose with MULT-1 linear, no mint.
    FAIL-CLOSED: none on push fail. Unready for multPreScan (MULT-1 needs mint).
    Greppable: lowerLinearFixtureComposeRaw, LINEAR-FIXTURE, HOST-COMPOSE. -/
def lowerLinearFixtureComposeRaw : Option Host :=
  pushFixtureHost HostCompose.empty linearFixtureLinearNode

/-- lowerLinearFixtureCompose -- Linear fixture host ready for unit compile path.
    mint MULT-1 live token (LINEAR-EXACT-ONCE resource evidence).
    FAIL-CLOSED: none if raw lower or mint fails.
    Greppable: lowerLinearFixtureCompose, LINEAR-FIXTURE, HOST-COMPOSE, MULT-1. -/
def lowerLinearFixtureCompose : Option Host :=
  match lowerLinearFixtureComposeRaw with
  | none => none
  | some hcRaw => mintFixtureHost hcRaw linearFixtureMintId

/-- linearFixtureProgramReady -- ordered IR bar for Linear fixture.
    FAIL-CLOSED: lower succeeds, length 1, programCompileReady, gradeSurfaceOk.
    Greppable: linearFixtureProgramReady, COMPILE-PATH-LINEAR, LINEAR-FIXTURE. -/
def linearFixtureProgramReady : Bool :=
  match lowerLinearFixtureProgram with
  | none => false
  | some p =>
      programCompileReady p
        && IrProgram.length p == 1
        && IrProgram.isWellTyped p
        && gradeSurfaceOk

/-- linearFixtureComposeReady -- unit compile-path bar on Linear fixture host.
    FAIL-CLOSED: lower compose succeeds and unitCompileReady (extractOkFs + grades)
    and linear host is live with fixture mint id.
    Greppable: linearFixtureComposeReady, COMPILE-PATH-LINEAR, unitCompileReady. -/
def linearFixtureComposeReady : Bool :=
  match lowerLinearFixtureCompose with
  | none => false
  | some hc =>
      unitCompileReady hc
        && HostCompose.extractOkFs hc
        && hc.linear.live
        && hc.linear.id == linearFixtureMintId

/-- linearFixtureComposeRawUnready -- unminted Linear compose fails unit bar.
    Greppable: linearFixtureComposeRawUnready, FAIL-CLOSED, LINEAR-FIXTURE. -/
def linearFixtureComposeRawUnready : Bool :=
  match lowerLinearFixtureComposeRaw with
  | none => false
  | some hc => !unitCompileReady hc && !HostCompose.checkFailClosed hc

/-- linearFixtureMintConsumeOk -- ConsumeToken exact-once on Linear fixture host.
    mint live then consume once: payload equals mint id, live cleared, spent
    host fails checkFailClosed (LINEAR-EXACT-ONCE). Live-flag path only; not
    elaborator MULT-1 freestanding residual free.
    Greppable: linearFixtureMintConsumeOk, ConsumeToken, LINEAR-EXACT-ONCE,
    COMPILE-PATH-LINEAR. -/
def linearFixtureMintConsumeOk : Bool :=
  match lowerLinearFixtureCompose with
  | none => false
  | some hcLive =>
      match HostCompose.consume hcLive with
      | HostCompose.ConsumeResult.ok hcSpent payload =>
          (payload == linearFixtureMintId)
            && !hcSpent.linear.live
            && hcSpent.linear.id == 0
            && !HostCompose.checkFailClosed hcSpent
            && !unitCompileReady hcSpent
      | HostCompose.ConsumeResult.notLive => false

/-- linearFixtureEmitPathOk -- host Linear product text path honesty (HOST-EMIT-LINEAR).
    Reuses EmitLinear.emitLinearReady; does not re-emit C; not residual free.
    Greppable: linearFixtureEmitPathOk, HOST-EMIT-LINEAR, COMPILE-PATH-LINEAR. -/
def linearFixtureEmitPathOk : Bool := EmitLinear.emitLinearReady

/-- Local honesty: Linear e2e fixture does NOT claim residual free. -/
def linearFixtureResidualFreeClaimed : Bool := false

/-- Local honesty: Linear e2e fixture does NOT complete product self-host. -/
def linearFixtureProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: Linear e2e fixture does NOT claim proof complete. -/
def linearFixtureProofCompleteClaimed : Bool := false

/-- Local honesty: Linear e2e fixture does NOT unlock llvm. -/
def linearFixtureLlvmUnlocked : Bool := false

/-- linearFixtureCompilePathReady -- end-to-end Linear unit compile path (Track 2).
    MULT-1 linear + ordered IR + ready compose unit bar + mint/consume exact-once
    + HOST-EMIT-LINEAR emit path + free/complete/proof/llvm stay false.
    Greppable: linearFixtureCompilePathReady, COMPILE-PATH-LINEAR, LINEAR-FIXTURE,
    HOST-COMPILE-PATH, HOST-EMIT-LINEAR, ConsumeToken. -/
def linearFixtureCompilePathReady : Bool :=
  gradeSurfaceOk
    && linearFixtureProgramReady
    && linearFixtureComposeReady
    && linearFixtureComposeRawUnready
    && linearFixtureMintConsumeOk
    && linearFixtureEmitPathOk
    && !linearFixtureResidualFreeClaimed
    && !linearFixtureProductSelfHostCompleteClaimed
    && !linearFixtureProofCompleteClaimed
    && !linearFixtureLlvmUnlocked

/-- linearFixtureDoesNotMeanResidualFree -- e2e ready does not claim residual free.
    Greppable: linearFixtureDoesNotMeanResidualFree, COMPILE-PATH-LINEAR. -/
def linearFixtureDoesNotMeanResidualFree : Bool :=
  linearFixtureCompilePathReady && !linearFixtureResidualFreeClaimed

/-! ### COMPILE-PATH-LINEAR-THEOREM (readable Linear e2e statements, then proofs)

  Real Lean theorems for Linear fixture compile path only. Does not flip
  SpecProof.proofCompleteClaimed / residual free / product self-host complete.
-/

/-- Linear fixture ordered IR program is compile-path ready.
    Greppable: linearFixtureProgramReady_true, COMPILE-PATH-LINEAR-THEOREM. -/
theorem linearFixtureProgramReady_true : linearFixtureProgramReady = true := by decide

/-- Linear fixture host compose is unit-compile-ready after mint.
    Greppable: linearFixtureComposeReady_true, COMPILE-PATH-LINEAR-THEOREM. -/
theorem linearFixtureComposeReady_true : linearFixtureComposeReady = true := by decide

/-- Unready Linear compose fails unit bar (FAIL-CLOSED multPreScan).
    Greppable: linearFixtureComposeRaw_unready_true, COMPILE-PATH-LINEAR-THEOREM. -/
theorem linearFixtureComposeRaw_unready_true :
    linearFixtureComposeRawUnready = true := by decide

/-- ConsumeToken mint/consume exact-once holds on Linear fixture host.
    Greppable: linearFixtureMintConsumeOk_true, LINEAR-EXACT-ONCE,
    COMPILE-PATH-LINEAR-THEOREM. -/
theorem linearFixtureMintConsumeOk_true :
    linearFixtureMintConsumeOk = true := by decide

/-- HOST-EMIT-LINEAR product text path honesty holds on Linear fixture path.
    Greppable: linearFixtureEmitPathOk_true, HOST-EMIT-LINEAR,
    COMPILE-PATH-LINEAR-THEOREM. -/
theorem linearFixtureEmitPathOk_true : linearFixtureEmitPathOk = true := by
  native_decide

/-- End-to-end Linear unit compile path ready (Track 2 Linear fixture).
    Greppable: linearFixtureCompilePathReady_true, COMPILE-PATH-LINEAR-THEOREM,
    COMPILE-PATH-LINEAR, LINEAR-FIXTURE, HOST-COMPILE-PATH. -/
theorem linearFixtureCompilePathReady_true :
    linearFixtureCompilePathReady = true := by
  native_decide

/-- Linear e2e ready does not claim residual free.
    Greppable: linearFixtureDoesNotMeanResidualFree_true, COMPILE-PATH-LINEAR-THEOREM. -/
theorem linearFixtureDoesNotMeanResidualFree_true :
    linearFixtureDoesNotMeanResidualFree = true := by
  native_decide

/-- Linear e2e free/complete/proof/llvm honesty stays false.
    Greppable: linearFixture_claims_false, COMPILE-PATH-LINEAR-THEOREM. -/
theorem linearFixture_claims_false :
    (linearFixtureResidualFreeClaimed = false)
      /\ (linearFixtureProductSelfHostCompleteClaimed = false)
      /\ (linearFixtureProofCompleteClaimed = false)
      /\ (linearFixtureLlvmUnlocked = false) :=
  And.intro rfl (And.intro rfl (And.intro rfl rfl))

/-- lowerLinearFixtureProgram succeeds with length 1.
    Greppable: lowerLinearFixtureProgram_length_one, COMPILE-PATH-LINEAR-THEOREM. -/
theorem lowerLinearFixtureProgram_length_one :
    (match lowerLinearFixtureProgram with
     | some p => IrProgram.length p == 1
     | none => false) = true := by decide

/-- lowerLinearFixtureCompose is some (mint path).
    Greppable: lowerLinearFixtureCompose_isSome, COMPILE-PATH-LINEAR-THEOREM. -/
theorem lowerLinearFixtureCompose_isSome :
    lowerLinearFixtureCompose.isSome = true := by decide


/-! ### COMPILE-PATH-LINEAR-SMOKE (Linear fixture end-to-end; lake fails if examples fail)
    Greppable: COMPILE-PATH-LINEAR-SMOKE, LINEAR-FIXTURE, COMPILE-PATH-LINEAR. -/

/-- COMPILE-PATH-LINEAR-SMOKE: MULT-1 linear as ordered IR (length 1, well-typed). -/
example : (lowerLinearFixtureProgram.isSome) = true := by decide
example : linearFixtureProgram.nodes.length = 1 := by decide
example : programCompileReady linearFixtureProgram = true := by decide
example : linearFixtureProgramReady = true := by decide

/-- COMPILE-PATH-LINEAR-SMOKE: raw Linear compose fails; mint unit-ready. -/
example : linearFixtureComposeRawUnready = true := by decide
example : linearFixtureComposeReady = true := by decide
example :
    (match lowerLinearFixtureCompose with
     | some hc => unitCompileReady hc && hc.linear.live
     | none => false) = true := by decide

/-- COMPILE-PATH-LINEAR-SMOKE: ConsumeToken mint/consume exact-once on fixture. -/
example : linearFixtureMintConsumeOk = true := by decide

/-- COMPILE-PATH-LINEAR-SMOKE: HOST-EMIT-LINEAR product text path honesty. -/
example : linearFixtureEmitPathOk = true := by native_decide
example : EmitLinear.hostEmitLinearId = "HOST-EMIT-LINEAR" := rfl
example : EmitLinear.stageId = "SLAKE_SELF_HOST_EMIT_LINEAR_V0" := rfl

/-- COMPILE-PATH-LINEAR-SMOKE: full Linear e2e compile path; free/complete stay false. -/
example : linearFixtureCompilePathReady = true := by native_decide
example : linearFixtureDoesNotMeanResidualFree = true := by native_decide
example : linearFixtureResidualFreeClaimed = false := rfl
example : linearFixtureProductSelfHostCompleteClaimed = false := rfl
example : linearFixtureProofCompleteClaimed = false := rfl
example : linearFixtureLlvmUnlocked = false := rfl



end SystemsLean.CompilePath
