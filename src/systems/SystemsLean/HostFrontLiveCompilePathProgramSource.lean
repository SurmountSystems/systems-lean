/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live CompilePathProgram.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCompilePathProgramSource. Not occupancy name 50. Not mill 70.
  This wrap parses CompilePathProgram.lean only.
  Unique needles use trailing newline so HostFrontLiveCompilePathProgram is not a
  prefix hit on HostFrontLiveCompilePathProgramSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveCompilePathProgram is not a prefix):
  HostFrontLiveCompilePathProgramSource
  PARSE-LIVE-COMPILE-PATH-PROGRAM
  HOST-FRONT-LIVE-COMPILE-PATH-PROGRAM
  COMPILE-PATH-PROGRAM
  Greppable: SYSTEMS_LEAN_HOST, liveCompilePathProgramSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveCompilePathProgramSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveCompilePathProgram

/-- Dual-pinned live CompilePathProgram.lean bytes (must match on-disk file).
    Greppable: liveCompilePathProgramSource, PARSE-LIVE-COMPILE-PATH-PROGRAM. -/
def liveCompilePathProgramSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Program unit compile-path fixture (COMPILE-PATH-PROGRAM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Owns Program end-to-end compile-path fixture only: multi-node ordered IR +
  foldWellTyped -> host mark+mint -> unitCompileReady + HOST-EMIT-PROGRAM.
  Core compile bars and shared fixture helpers live in SystemsLean.CompilePath.
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full Slake compiler.
  Greppable: SYSTEMS_LEAN_HOST, COMPILE-PATH-PROGRAM, PROGRAM-FIXTURE, HOST-EMIT-PROGRAM,
  programFixtureCompilePathReady, COMPILE-PATH-PROGRAM-SMOKE, COMPILE-PATH-PROGRAM-THEOREM.
  UNIT_SURFACE host surface. Module: SystemsLean.CompilePathProgram
  Red/green: just systems-host; lake build SystemsLean.CompilePathProgram.
  Module must stay ASCII. Not freestanding emit residual free. Not PROVABLY.
  RUNTIME-FS path honesty only (not residual free forge).
-/

import SystemsLean.CompilePath
import SystemsLean.EmitProgram

namespace SystemsLean.CompilePath

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.IrGraph (Graph)
open SystemsLean.HostCompose (Host)

/-! ### COMPILE-PATH-PROGRAM / PROGRAM-FIXTURE (Track 2 Program unit end-to-end)

  Named Program fixture: multi-node well-typed ordered IR (3-node
  ERASED/LINEAR/VALUE) -> programCompileReady + foldWellTyped count -> host
  compose (mark MULT-0 + mint MULT-1) -> unitCompileReady + HOST-EMIT-PROGRAM
  product text honesty. Same kind/mult pairing as KernelProgram IR fixture; e2e
  bar lives here (KernelProgram imports CompilePath -- no import cycle).
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / CFG/SSA completeness / full Slake compiler.
-/


set_option maxRecDepth 8192

/-- Fixed Program fixture mint id (nonzero; distinct from Mult 4, Types 5, Linear 7). -/
def programFixtureMintId : Nat := 6

/-- Program fixture type tags (deterministic; match KernelProgram / Mult tags). -/
def programFixtureTagErased : Nat := 0
def programFixtureTagLinear : Nat := 1
def programFixtureTagValue : Nat := 2

/-- Program fixture nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value. -/
def programFixtureErasedNode : IrNode :=
  { ty := typeTagInit programFixtureTagErased, mult := Mult.mult0, kind := NodeKind.erased }

def programFixtureLinearNode : IrNode :=
  { ty := typeTagInit programFixtureTagLinear, mult := Mult.mult1, kind := NodeKind.linear }

def programFixtureValueNode : IrNode :=
  { ty := typeTagInit programFixtureTagValue, mult := Mult.multOmega, kind := NodeKind.value }

/-- lowerProgramFixtureProgram -- multi-node ordered IR (COMPILE-PATH-PROGRAM).
    Three nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value.
    FAIL-CLOSED: none if any push fails.
    Greppable: lowerProgramFixtureProgram, PROGRAM-FIXTURE, ORDERED-IR-PROGRAM. -/
def lowerProgramFixtureProgram : Option Program :=
  match pushFixtureProg IrProgram.empty programFixtureErasedNode with
  | none => none
  | some p0 =>
    match pushFixtureProg p0 programFixtureLinearNode with
    | none => none
    | some p1 => pushFixtureProg p1 programFixtureValueNode

/-- programFixtureProgram -- Program ordered IR when lower succeeds; empty on fail. -/
def programFixtureProgram : Program :=
  match lowerProgramFixtureProgram with
  | some p => p
  | none => IrProgram.empty

/-- lowerProgramFixtureComposeRaw -- HostCompose with three Program nodes, no mint/mark.
    FAIL-CLOSED: none on push fail. Unready for multPreScan (MULT-0/1 need handles).
    Greppable: lowerProgramFixtureComposeRaw, PROGRAM-FIXTURE, HOST-COMPOSE. -/
def lowerProgramFixtureComposeRaw : Option Host :=
  match pushFixtureHost HostCompose.empty programFixtureErasedNode with
  | none => none
  | some hc0 =>
    match pushFixtureHost hc0 programFixtureLinearNode with
    | none => none
    | some hc1 => pushFixtureHost hc1 programFixtureValueNode

/-- lowerProgramFixtureCompose -- Program fixture host ready for unit compile path.
    markErased (MULT-0) + mint (MULT-1); MULT-OMEGA needs neither.
    FAIL-CLOSED: none if raw lower or mint fails.
    Greppable: lowerProgramFixtureCompose, PROGRAM-FIXTURE, HOST-COMPOSE. -/
def lowerProgramFixtureCompose : Option Host :=
  match lowerProgramFixtureComposeRaw with
  | none => none
  | some hcRaw =>
    let hcMarked := HostCompose.markErased hcRaw
    mintFixtureHost hcMarked programFixtureMintId

/-- programFixtureFoldOk -- foldWellTyped multi-node honesty on Program fixture.
    Empty fold fails closed; lowered 3-node program folds to count 3.
    Greppable: programFixtureFoldOk, foldWellTyped, COMPILE-PATH-PROGRAM. -/
def programFixtureFoldOk : Bool :=
  (match IrProgram.foldWellTyped IrProgram.empty (0 : Nat) (fun acc _ => acc + 1) with
   | none => true
   | some _ => false)
    &&
  (match lowerProgramFixtureProgram with
   | none => false
   | some p =>
       match IrProgram.foldWellTyped p (0 : Nat) (fun acc _ => acc + 1) with
       | some n => decide (n = 3)
       | none => false)

/-- programFixtureProgramReady -- ordered IR bar for Program fixture.
    FAIL-CLOSED: lower succeeds, length 3, programCompileReady, gradeSurfaceOk,
    foldWellTyped honesty.
    Greppable: programFixtureProgramReady, COMPILE-PATH-PROGRAM, PROGRAM-FIXTURE. -/
def programFixtureProgramReady : Bool :=
  match lowerProgramFixtureProgram with
  | none => false
  | some p =>
      programCompileReady p
        && IrProgram.length p == 3
        && IrProgram.isWellTyped p
        && gradeSurfaceOk
        && programFixtureFoldOk

/-- programFixtureComposeReady -- unit compile-path bar on Program fixture host.
    FAIL-CLOSED: lower compose succeeds and unitCompileReady (extractOkFs + grades).
    Greppable: programFixtureComposeReady, COMPILE-PATH-PROGRAM, unitCompileReady. -/
def programFixtureComposeReady : Bool :=
  match lowerProgramFixtureCompose with
  | none => false
  | some hc => unitCompileReady hc && HostCompose.extractOkFs hc && hc.linear.live

/-- programFixtureComposeRawUnready -- unminted/unmarked Program compose fails unit bar.
    Greppable: programFixtureComposeRawUnready, FAIL-CLOSED, PROGRAM-FIXTURE. -/
def programFixtureComposeRawUnready : Bool :=
  match lowerProgramFixtureComposeRaw with
  | none => false
  | some hc => !unitCompileReady hc && !HostCompose.checkFailClosed hc

/-- programFixtureEmitPathOk -- host Program product text path honesty (HOST-EMIT-PROGRAM).
    Reuses EmitProgram.emitProgramReady; does not re-emit C; not residual free.
    Greppable: programFixtureEmitPathOk, HOST-EMIT-PROGRAM, COMPILE-PATH-PROGRAM. -/
def programFixtureEmitPathOk : Bool := EmitProgram.emitProgramReady

/-- Local honesty: Program e2e fixture does NOT claim residual free. -/
def programFixtureResidualFreeClaimed : Bool := false

/-- Local honesty: Program e2e fixture does NOT complete product self-host. -/
def programFixtureProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: Program e2e fixture does NOT claim proof complete. -/
def programFixtureProofCompleteClaimed : Bool := false

/-- Local honesty: Program e2e fixture does NOT unlock llvm. -/
def programFixtureLlvmUnlocked : Bool := false

/-- programFixtureCompilePathReady -- end-to-end Program unit compile path (Track 2).
    Multi-node ordered IR + programCompileReady + ready compose unit bar +
    HOST-EMIT-PROGRAM emit path + free/complete/proof/llvm stay false.
    Greppable: programFixtureCompilePathReady, COMPILE-PATH-PROGRAM, PROGRAM-FIXTURE,
    HOST-COMPILE-PATH, HOST-EMIT-PROGRAM. -/
def programFixtureCompilePathReady : Bool :=
  gradeSurfaceOk
    && programFixtureFoldOk
    && programFixtureProgramReady
    && programFixtureComposeReady
    && programFixtureComposeRawUnready
    && programFixtureEmitPathOk
    && !programFixtureResidualFreeClaimed
    && !programFixtureProductSelfHostCompleteClaimed
    && !programFixtureProofCompleteClaimed
    && !programFixtureLlvmUnlocked

/-- programFixtureDoesNotMeanResidualFree -- e2e ready does not claim residual free.
    Greppable: programFixtureDoesNotMeanResidualFree, COMPILE-PATH-PROGRAM. -/
def programFixtureDoesNotMeanResidualFree : Bool :=
  programFixtureCompilePathReady && !programFixtureResidualFreeClaimed

/-! ### COMPILE-PATH-PROGRAM-THEOREM (readable Program e2e statements, then proofs)

  Real Lean theorems for Program fixture compile path only. Does not flip
  SpecProof.proofCompleteClaimed / residual free / product self-host complete.
-/

/-- Program fixture foldWellTyped multi-node honesty holds.
    Greppable: programFixtureFoldOk_true, COMPILE-PATH-PROGRAM-THEOREM. -/
theorem programFixtureFoldOk_true : programFixtureFoldOk = true := by decide

/-- Program fixture ordered IR program is compile-path ready.
    Greppable: programFixtureProgramReady_true, COMPILE-PATH-PROGRAM-THEOREM. -/
theorem programFixtureProgramReady_true : programFixtureProgramReady = true := by decide

/-- Program fixture host compose is unit-compile-ready after mark+mint.
    Greppable: programFixtureComposeReady_true, COMPILE-PATH-PROGRAM-THEOREM. -/
theorem programFixtureComposeReady_true : programFixtureComposeReady = true := by decide

/-- Unready Program compose fails unit bar (FAIL-CLOSED multPreScan).
    Greppable: programFixtureComposeRaw_unready_true, COMPILE-PATH-PROGRAM-THEOREM. -/
theorem programFixtureComposeRaw_unready_true :
    programFixtureComposeRawUnready = true := by decide

/-- HOST-EMIT-PROGRAM product text path honesty holds on Program fixture path.
    Greppable: programFixtureEmitPathOk_true, HOST-EMIT-PROGRAM, COMPILE-PATH-PROGRAM-THEOREM. -/
theorem programFixtureEmitPathOk_true : programFixtureEmitPathOk = true := by
  native_decide

/-- End-to-end Program unit compile path ready (Track 2 Program fixture).
    Greppable: programFixtureCompilePathReady_true, COMPILE-PATH-PROGRAM-THEOREM,
    COMPILE-PATH-PROGRAM, PROGRAM-FIXTURE, HOST-COMPILE-PATH. -/
theorem programFixtureCompilePathReady_true :
    programFixtureCompilePathReady = true := by
  native_decide

/-- Program e2e ready does not claim residual free.
    Greppable: programFixtureDoesNotMeanResidualFree_true, COMPILE-PATH-PROGRAM-THEOREM. -/
theorem programFixtureDoesNotMeanResidualFree_true :
    programFixtureDoesNotMeanResidualFree = true := by
  native_decide

/-- Program e2e free/complete/proof/llvm honesty stays false.
    Greppable: programFixture_claims_false, COMPILE-PATH-PROGRAM-THEOREM. -/
theorem programFixture_claims_false :
    (programFixtureResidualFreeClaimed = false)
      /\ (programFixtureProductSelfHostCompleteClaimed = false)
      /\ (programFixtureProofCompleteClaimed = false)
      /\ (programFixtureLlvmUnlocked = false) :=
  And.intro rfl (And.intro rfl (And.intro rfl rfl))

/-- lowerProgramFixtureProgram succeeds with length 3.
    Greppable: lowerProgramFixtureProgram_length_three, COMPILE-PATH-PROGRAM-THEOREM. -/
theorem lowerProgramFixtureProgram_length_three :
    (match lowerProgramFixtureProgram with
     | some p => IrProgram.length p == 3
     | none => false) = true := by decide

/-- lowerProgramFixtureCompose is some (mark+mint path).
    Greppable: lowerProgramFixtureCompose_isSome, COMPILE-PATH-PROGRAM-THEOREM. -/
theorem lowerProgramFixtureCompose_isSome :
    lowerProgramFixtureCompose.isSome = true := by decide


/-! ### COMPILE-PATH-PROGRAM-SMOKE (Program fixture end-to-end; lake fails if examples fail)
    Greppable: COMPILE-PATH-PROGRAM-SMOKE, PROGRAM-FIXTURE, COMPILE-PATH-PROGRAM. -/

/-- COMPILE-PATH-PROGRAM-SMOKE: multi-node ordered IR (length 3, well-typed). -/
example : (lowerProgramFixtureProgram.isSome) = true := by decide
example : programFixtureProgram.nodes.length = 3 := by decide
example : programCompileReady programFixtureProgram = true := by decide
example : programFixtureFoldOk = true := by decide
example : programFixtureProgramReady = true := by decide

/-- COMPILE-PATH-PROGRAM-SMOKE: raw Program compose fails; mark+mint unit-ready. -/
example : programFixtureComposeRawUnready = true := by decide
example : programFixtureComposeReady = true := by decide
example :
    (match lowerProgramFixtureCompose with
     | some hc => unitCompileReady hc
     | none => false) = true := by decide

/-- COMPILE-PATH-PROGRAM-SMOKE: HOST-EMIT-PROGRAM product text path honesty. -/
example : programFixtureEmitPathOk = true := by native_decide
example : EmitProgram.hostEmitProgramId = "HOST-EMIT-PROGRAM" := rfl
example : EmitProgram.stageId = "SLAKE_SELF_HOST_EMIT_PROGRAM_V0" := rfl

/-- COMPILE-PATH-PROGRAM-SMOKE: full Program e2e compile path; free/complete stay false. -/
example : programFixtureCompilePathReady = true := by native_decide
example : programFixtureDoesNotMeanResidualFree = true := by native_decide
example : programFixtureResidualFreeClaimed = false := rfl
example : programFixtureProductSelfHostCompleteClaimed = false := rfl
example : programFixtureProofCompleteClaimed = false := rfl
example : programFixtureLlvmUnlocked = false := rfl



end SystemsLean.CompilePath
"#

end SystemsLean.HostFrontLiveCompilePathProgram
