/-
  SYSTEMS_LEAN_HOST partial -- Mult unit compile-path fixture (COMPILE-PATH-MULT).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Owns Mult end-to-end compile-path fixture only: Mult grades -> ordered IR ->
  host mark+mint -> unitCompileReady + HOST-EMIT-MULT.
  Core compile bars and shared fixture helpers live in SystemsLean.CompilePath.
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full Slake compiler.
  Greppable: SYSTEMS_LEAN_HOST, COMPILE-PATH-MULT, MULT-FIXTURE, HOST-EMIT-MULT,
  multFixtureCompilePathReady, COMPILE-PATH-MULT-SMOKE, COMPILE-PATH-MULT-THEOREM.
  UNIT_SURFACE host surface. Module: SystemsLean.CompilePathMult
  Red/green: just systems-host; lake build SystemsLean.CompilePathMult.
  Module must stay ASCII. Not freestanding emit residual free. Not PROVABLY.
  RUNTIME-FS path honesty only (not residual free forge).
-/

import SystemsLean.CompilePath
import SystemsLean.EmitMult

namespace SystemsLean.CompilePath

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.IrGraph (Graph)
open SystemsLean.HostCompose (Host)

/-! ### COMPILE-PATH-MULT / MULT-FIXTURE (Track 2 Mult unit end-to-end)

  Named Mult fixture: Mult grades -> ordered IR program -> host compose
  (mark MULT-0 + mint MULT-1) -> unitCompileReady + HOST-EMIT-MULT product
  text honesty. Same kind/mult pairing as KernelMult IR fixture; e2e bar lives
  here (KernelMult imports CompilePath -- no import cycle).
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full Slake compiler.
-/

/-- Fixed Mult fixture mint id (nonzero; matches COMPILE-PATH-SMOKE mint 4). -/
def multFixtureMintId : Nat := 4

/-- Mult fixture type tags (deterministic; match KernelMult tagErased/Linear/Value). -/
def multFixtureTagErased : Nat := 0
def multFixtureTagLinear : Nat := 1
def multFixtureTagValue : Nat := 2

/-- Mult fixture nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value. -/
def multFixtureErasedNode : IrNode :=
  { ty := typeTagInit multFixtureTagErased, mult := Mult.mult0, kind := NodeKind.erased }

def multFixtureLinearNode : IrNode :=
  { ty := typeTagInit multFixtureTagLinear, mult := Mult.mult1, kind := NodeKind.linear }

def multFixtureValueNode : IrNode :=
  { ty := typeTagInit multFixtureTagValue, mult := Mult.multOmega, kind := NodeKind.value }

/-- lowerMultFixtureProgram -- Mult grades as ordered IR (COMPILE-PATH-MULT).
    Three nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value.
    FAIL-CLOSED: none if any push fails.
    Greppable: lowerMultFixtureProgram, MULT-FIXTURE, ORDERED-IR-PROGRAM. -/
def lowerMultFixtureProgram : Option Program :=
  match pushFixtureProg IrProgram.empty multFixtureErasedNode with
  | none => none
  | some p0 =>
    match pushFixtureProg p0 multFixtureLinearNode with
    | none => none
    | some p1 => pushFixtureProg p1 multFixtureValueNode

/-- multFixtureProgram -- Mult ordered IR when lower succeeds; empty on fail. -/
def multFixtureProgram : Program :=
  match lowerMultFixtureProgram with
  | some p => p
  | none => IrProgram.empty

/-- lowerMultFixtureComposeRaw -- HostCompose with three Mult nodes, no mint/mark.
    FAIL-CLOSED: none on push fail. Unready for multPreScan (MULT-0/1 need handles).
    Greppable: lowerMultFixtureComposeRaw, MULT-FIXTURE, HOST-COMPOSE. -/
def lowerMultFixtureComposeRaw : Option Host :=
  match pushFixtureHost HostCompose.empty multFixtureErasedNode with
  | none => none
  | some hc0 =>
    match pushFixtureHost hc0 multFixtureLinearNode with
    | none => none
    | some hc1 => pushFixtureHost hc1 multFixtureValueNode

/-- lowerMultFixtureCompose -- Mult fixture host ready for unit compile path.
    markErased (MULT-0) + mint (MULT-1); MULT-OMEGA needs neither.
    FAIL-CLOSED: none if raw lower or mint fails.
    Greppable: lowerMultFixtureCompose, MULT-FIXTURE, HOST-COMPOSE. -/
def lowerMultFixtureCompose : Option Host :=
  match lowerMultFixtureComposeRaw with
  | none => none
  | some hcRaw =>
    let hcMarked := HostCompose.markErased hcRaw
    mintFixtureHost hcMarked multFixtureMintId

/-- multFixtureProgramReady -- ordered IR bar for Mult fixture.
    FAIL-CLOSED: lower succeeds, length 3, programCompileReady, gradeSurfaceOk.
    Greppable: multFixtureProgramReady, COMPILE-PATH-MULT, MULT-FIXTURE. -/
def multFixtureProgramReady : Bool :=
  match lowerMultFixtureProgram with
  | none => false
  | some p =>
      programCompileReady p
        && IrProgram.length p == 3
        && IrProgram.isWellTyped p
        && gradeSurfaceOk

/-- multFixtureComposeReady -- unit compile-path bar on Mult fixture host.
    FAIL-CLOSED: lower compose succeeds and unitCompileReady (extractOkFs + grades).
    Greppable: multFixtureComposeReady, COMPILE-PATH-MULT, unitCompileReady. -/
def multFixtureComposeReady : Bool :=
  match lowerMultFixtureCompose with
  | none => false
  | some hc => unitCompileReady hc && HostCompose.extractOkFs hc && hc.linear.live

/-- multFixtureComposeRawUnready -- unminted/unmarked Mult compose fails unit bar.
    Greppable: multFixtureComposeRawUnready, FAIL-CLOSED, MULT-FIXTURE. -/
def multFixtureComposeRawUnready : Bool :=
  match lowerMultFixtureComposeRaw with
  | none => false
  | some hc => !unitCompileReady hc && !HostCompose.checkFailClosed hc

/-- multFixtureEmitPathOk -- host Mult product text path honesty (HOST-EMIT-MULT).
    Reuses EmitMult.emitMultReady; does not re-emit C; not residual free.
    Greppable: multFixtureEmitPathOk, HOST-EMIT-MULT, COMPILE-PATH-MULT. -/
def multFixtureEmitPathOk : Bool := EmitMult.emitMultReady

/-- Local honesty: Mult e2e fixture does NOT claim residual free. -/
def multFixtureResidualFreeClaimed : Bool := false

/-- Local honesty: Mult e2e fixture does NOT complete product self-host. -/
def multFixtureProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: Mult e2e fixture does NOT claim proof complete. -/
def multFixtureProofCompleteClaimed : Bool := false

/-- Local honesty: Mult e2e fixture does NOT unlock llvm. -/
def multFixtureLlvmUnlocked : Bool := false

/-- multFixtureCompilePathReady -- end-to-end Mult unit compile path (Track 2).
    Mult grades + ordered IR + ready compose unit bar + HOST-EMIT-MULT emit path
    + free/complete/proof/llvm stay false.
    Greppable: multFixtureCompilePathReady, COMPILE-PATH-MULT, MULT-FIXTURE,
    HOST-COMPILE-PATH, HOST-EMIT-MULT. -/
def multFixtureCompilePathReady : Bool :=
  gradeSurfaceOk
    && multFixtureProgramReady
    && multFixtureComposeReady
    && multFixtureComposeRawUnready
    && multFixtureEmitPathOk
    && !multFixtureResidualFreeClaimed
    && !multFixtureProductSelfHostCompleteClaimed
    && !multFixtureProofCompleteClaimed
    && !multFixtureLlvmUnlocked

/-- multFixtureDoesNotMeanResidualFree -- e2e ready does not claim residual free.
    Greppable: multFixtureDoesNotMeanResidualFree, COMPILE-PATH-MULT. -/
def multFixtureDoesNotMeanResidualFree : Bool :=
  multFixtureCompilePathReady && !multFixtureResidualFreeClaimed

/-! ### COMPILE-PATH-MULT-THEOREM (readable Mult e2e statements, then proofs)

  Real Lean theorems for Mult fixture compile path only. Does not flip
  SpecProof.proofCompleteClaimed / residual free / product self-host complete.
-/

set_option maxRecDepth 8192

/-- Mult fixture ordered IR program is compile-path ready.
    Greppable: multFixtureProgramReady_true, COMPILE-PATH-MULT-THEOREM. -/
theorem multFixtureProgramReady_true : multFixtureProgramReady = true := by decide

/-- Mult fixture host compose is unit-compile-ready after mark+mint.
    Greppable: multFixtureComposeReady_true, COMPILE-PATH-MULT-THEOREM. -/
theorem multFixtureComposeReady_true : multFixtureComposeReady = true := by decide

/-- Unready Mult compose fails unit bar (FAIL-CLOSED multPreScan).
    Greppable: multFixtureComposeRaw_unready_true, COMPILE-PATH-MULT-THEOREM. -/
theorem multFixtureComposeRaw_unready_true :
    multFixtureComposeRawUnready = true := by decide

/-- HOST-EMIT-MULT product text path honesty holds on Mult fixture path.
    Greppable: multFixtureEmitPathOk_true, HOST-EMIT-MULT, COMPILE-PATH-MULT-THEOREM. -/
theorem multFixtureEmitPathOk_true : multFixtureEmitPathOk = true := by
  native_decide

/-- End-to-end Mult unit compile path ready (Track 2 Mult fixture).
    Greppable: multFixtureCompilePathReady_true, COMPILE-PATH-MULT-THEOREM,
    COMPILE-PATH-MULT, MULT-FIXTURE, HOST-COMPILE-PATH. -/
theorem multFixtureCompilePathReady_true :
    multFixtureCompilePathReady = true := by
  native_decide

/-- Mult e2e ready does not claim residual free.
    Greppable: multFixtureDoesNotMeanResidualFree_true, COMPILE-PATH-MULT-THEOREM. -/
theorem multFixtureDoesNotMeanResidualFree_true :
    multFixtureDoesNotMeanResidualFree = true := by
  native_decide

/-- Mult e2e free/complete/proof/llvm honesty stays false.
    Greppable: multFixture_claims_false, COMPILE-PATH-MULT-THEOREM. -/
theorem multFixture_claims_false :
    (multFixtureResidualFreeClaimed = false)
      /\ (multFixtureProductSelfHostCompleteClaimed = false)
      /\ (multFixtureProofCompleteClaimed = false)
      /\ (multFixtureLlvmUnlocked = false) :=
  And.intro rfl (And.intro rfl (And.intro rfl rfl))

/-- lowerMultFixtureProgram succeeds with length 3.
    Greppable: lowerMultFixtureProgram_length_three, COMPILE-PATH-MULT-THEOREM. -/
theorem lowerMultFixtureProgram_length_three :
    (match lowerMultFixtureProgram with
     | some p => IrProgram.length p == 3
     | none => false) = true := by decide

/-- lowerMultFixtureCompose is some (mark+mint path).
    Greppable: lowerMultFixtureCompose_isSome, COMPILE-PATH-MULT-THEOREM. -/
theorem lowerMultFixtureCompose_isSome :
    lowerMultFixtureCompose.isSome = true := by decide


/-! ### COMPILE-PATH-MULT-SMOKE (Mult fixture end-to-end; lake fails if examples fail)
    Greppable: COMPILE-PATH-MULT-SMOKE, MULT-FIXTURE, COMPILE-PATH-MULT. -/

/-- COMPILE-PATH-MULT-SMOKE: Mult grades as ordered IR (length 3, well-typed). -/
example : (lowerMultFixtureProgram.isSome) = true := by decide
example : multFixtureProgram.nodes.length = 3 := by decide
example : programCompileReady multFixtureProgram = true := by decide
example : multFixtureProgramReady = true := by decide

/-- COMPILE-PATH-MULT-SMOKE: raw Mult compose fails; mark+mint unit-ready. -/
example : multFixtureComposeRawUnready = true := by decide
example : multFixtureComposeReady = true := by decide
example :
    (match lowerMultFixtureCompose with
     | some hc => unitCompileReady hc
     | none => false) = true := by decide

/-- COMPILE-PATH-MULT-SMOKE: HOST-EMIT-MULT product text path honesty. -/
example : multFixtureEmitPathOk = true := by native_decide
example : EmitMult.hostEmitMultId = "HOST-EMIT-MULT" := rfl
example : EmitMult.stageId = "SLAKE_SELF_HOST_EMIT_MULT_V0" := rfl

/-- COMPILE-PATH-MULT-SMOKE: full Mult e2e compile path; free/complete stay false. -/
example : multFixtureCompilePathReady = true := by native_decide
example : multFixtureDoesNotMeanResidualFree = true := by native_decide
example : multFixtureResidualFreeClaimed = false := rfl
example : multFixtureProductSelfHostCompleteClaimed = false := rfl
example : multFixtureProofCompleteClaimed = false := rfl
example : multFixtureLlvmUnlocked = false := rfl



end SystemsLean.CompilePath
