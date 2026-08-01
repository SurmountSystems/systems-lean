/-
  SYSTEMS_LEAN_HOST partial -- Erasure unit compile-path fixture (COMPILE-PATH-ERASURE).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Owns Erasure end-to-end compile-path fixture only: MULT-0 erased node ->
  host markErased -> unitCompileReady + HOST-EMIT-ERASURE.
  Core compile bars and shared fixture helpers live in SystemsLean.CompilePath.
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full Slake compiler.
  Greppable: SYSTEMS_LEAN_HOST, COMPILE-PATH-ERASURE, ERASURE-FIXTURE, HOST-EMIT-ERASURE,
  erasureFixtureCompilePathReady, COMPILE-PATH-ERASURE-SMOKE, COMPILE-PATH-ERASURE-THEOREM.
  UNIT_SURFACE host surface. Module: SystemsLean.CompilePathErasure
  Red/green: just systems-host; lake build SystemsLean.CompilePathErasure.
  Module must stay ASCII. Not freestanding emit residual free. Not PROVABLY.
  RUNTIME-FS erasure path honesty only (not residual free forge).
-/

import SystemsLean.CompilePath
import SystemsLean.EmitErasure
import SystemsLean.Erasure

namespace SystemsLean.CompilePath

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.IrGraph (Graph)
open SystemsLean.HostCompose (Host)

/-! ### COMPILE-PATH-ERASURE / ERASURE-FIXTURE (Track 2 Erasure unit end-to-end)

  Named Erasure fixture: MULT-0 erased grade -> ordered IR program (1-node
  ERASED) -> host compose markErased (mark-only; no MULT-1 mint) ->
  unitCompileReady + erased.marked + HOST-EMIT-ERASURE product text honesty.
  Mint-id honesty: Erasure does not mint. Mult=4 Types=5 Program=6 Linear=7
  Graph=8 Compose=9 remain other fixtures (no collision / unused mint slot).
  Same MULT-0 ERASE-RULE / ERASE-NO-RUNTIME pairing as Erasure.lean host API;
  e2e bar lives here. Does NOT claim residual free / product self-host complete /
  proof complete / llvm unlock / types-in-C / full Slake compiler.
-/

/-- Erasure fixture type tag (deterministic; match Mult/Compose tagErased 0). -/
def erasureFixtureTagErased : Nat := 0

/-- Erasure fixture node: MULT-0 erased (ERASE-RULE-MULT-0 / ERASE-NO-RUNTIME). -/
def erasureFixtureErasedNode : IrNode :=
  { ty := typeTagInit erasureFixtureTagErased, mult := Mult.mult0, kind := NodeKind.erased }

/-- lowerErasureFixtureProgram -- MULT-0 erased as ordered IR (COMPILE-PATH-ERASURE).
    One node: MULT-0 ERASED. FAIL-CLOSED: none if push fails.
    Greppable: lowerErasureFixtureProgram, ERASURE-FIXTURE, ORDERED-IR-PROGRAM. -/
def lowerErasureFixtureProgram : Option Program :=
  pushFixtureProg IrProgram.empty erasureFixtureErasedNode

/-- erasureFixtureProgram -- Erasure ordered IR when lower succeeds; empty on fail. -/
def erasureFixtureProgram : Program :=
  match lowerErasureFixtureProgram with
  | some p => p
  | none => IrProgram.empty

/-- lowerErasureFixtureComposeRaw -- HostCompose with MULT-0 erased, no mark.
    FAIL-CLOSED: none on push fail. Unready for multPreScan (MULT-0 needs mark).
    Greppable: lowerErasureFixtureComposeRaw, ERASURE-FIXTURE, HOST-COMPOSE. -/
def lowerErasureFixtureComposeRaw : Option Host :=
  pushFixtureHost HostCompose.empty erasureFixtureErasedNode

/-- lowerErasureFixtureCompose -- Erasure fixture host ready for unit compile path.
    markErased only (MULT-0). Mark-only honesty: no mint (no MULT-1 node).
    FAIL-CLOSED: none if raw lower fails.
    Greppable: lowerErasureFixtureCompose, ERASURE-FIXTURE, HOST-COMPOSE,
    ERASE-NO-RUNTIME, markErased. -/
def lowerErasureFixtureCompose : Option Host :=
  match lowerErasureFixtureComposeRaw with
  | none => none
  | some hcRaw => some (HostCompose.markErased hcRaw)

/-- erasureFixtureProgramReady -- ordered IR bar for Erasure fixture.
    FAIL-CLOSED: lower succeeds, length 1, programCompileReady, gradeSurfaceOk.
    Greppable: erasureFixtureProgramReady, COMPILE-PATH-ERASURE, ERASURE-FIXTURE. -/
def erasureFixtureProgramReady : Bool :=
  match lowerErasureFixtureProgram with
  | none => false
  | some p =>
      programCompileReady p
        && IrProgram.length p == 1
        && IrProgram.isWellTyped p
        && gradeSurfaceOk

/-- erasureFixtureMarkedOk -- erased.marked + ERASE-NO-RUNTIME on ready host.
    Greppable: erasureFixtureMarkedOk, ERASE-NO-RUNTIME, COMPILE-PATH-ERASURE. -/
def erasureFixtureMarkedOk : Bool :=
  match lowerErasureFixtureCompose with
  | none => false
  | some hc =>
      hc.erased.marked
        && Erasure.isRuntimeAbsent hc.erased
        && Erasure.checkFailClosed Mult.mult0 hc.erased
        && !hc.linear.live

/-- erasureFixtureComposeReady -- unit compile-path bar on Erasure fixture host.
    FAIL-CLOSED: lower compose succeeds, unitCompileReady, erased.marked after
    markErased, linear not live (mark-only path).
    Greppable: erasureFixtureComposeReady, COMPILE-PATH-ERASURE, unitCompileReady. -/
def erasureFixtureComposeReady : Bool :=
  match lowerErasureFixtureCompose with
  | none => false
  | some hc =>
      unitCompileReady hc
        && HostCompose.extractOkFs hc
        && hc.erased.marked
        && Erasure.isRuntimeAbsent hc.erased
        && !hc.linear.live
        && IrProgram.length hc.graph.prog == 1
        && IrGraph.isWellTyped hc.graph

/-- erasureFixtureComposeRawUnready -- unmarked Erasure compose fails unit bar.
    Greppable: erasureFixtureComposeRawUnready, FAIL-CLOSED, ERASURE-FIXTURE. -/
def erasureFixtureComposeRawUnready : Bool :=
  match lowerErasureFixtureComposeRaw with
  | none => false
  | some hc =>
      !unitCompileReady hc
        && !HostCompose.checkFailClosed hc
        && !hc.erased.marked
        && !Erasure.isRuntimeAbsent hc.erased

/-- erasureFixtureEmitPathOk -- host Erasure product text path honesty (HOST-EMIT-ERASURE).
    Reuses EmitErasure.emitErasureReady; does not re-emit C; not residual free.
    Greppable: erasureFixtureEmitPathOk, HOST-EMIT-ERASURE, COMPILE-PATH-ERASURE. -/
def erasureFixtureEmitPathOk : Bool := EmitErasure.emitErasureReady

/-- Local honesty: Erasure e2e fixture does NOT claim residual free. -/
def erasureFixtureResidualFreeClaimed : Bool := false

/-- Local honesty: Erasure e2e fixture does NOT complete product self-host. -/
def erasureFixtureProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: Erasure e2e fixture does NOT claim proof complete. -/
def erasureFixtureProofCompleteClaimed : Bool := false

/-- Local honesty: Erasure e2e fixture does NOT unlock llvm. -/
def erasureFixtureLlvmUnlocked : Bool := false

/-- erasureFixtureCompilePathReady -- end-to-end Erasure unit compile path (Track 2).
    MULT-0 erased + ordered IR + markErased unit bar + marked honesty +
    HOST-EMIT-ERASURE emit path + free/complete/proof/llvm stay false.
    Mark-only: no mint conjunct (MULT-0 path; mint ids reserved for Mult..Compose).
    Greppable: erasureFixtureCompilePathReady, COMPILE-PATH-ERASURE, ERASURE-FIXTURE,
    HOST-COMPILE-PATH, HOST-EMIT-ERASURE, ERASE-RULE-MULT-0. -/
def erasureFixtureCompilePathReady : Bool :=
  gradeSurfaceOk
    && erasureFixtureProgramReady
    && erasureFixtureComposeReady
    && erasureFixtureComposeRawUnready
    && erasureFixtureMarkedOk
    && erasureFixtureEmitPathOk
    && !erasureFixtureResidualFreeClaimed
    && !erasureFixtureProductSelfHostCompleteClaimed
    && !erasureFixtureProofCompleteClaimed
    && !erasureFixtureLlvmUnlocked

/-- erasureFixtureDoesNotMeanResidualFree -- e2e ready does not claim residual free.
    Greppable: erasureFixtureDoesNotMeanResidualFree, COMPILE-PATH-ERASURE. -/
def erasureFixtureDoesNotMeanResidualFree : Bool :=
  erasureFixtureCompilePathReady && !erasureFixtureResidualFreeClaimed

/-! ### COMPILE-PATH-ERASURE-THEOREM (readable Erasure e2e statements, then proofs)

  Real Lean theorems for Erasure fixture compile path only. Does not flip
  SpecProof.proofCompleteClaimed / residual free / product self-host complete.
-/

set_option maxRecDepth 8192

/-- Erasure fixture ordered IR program is compile-path ready.
    Greppable: erasureFixtureProgramReady_true, COMPILE-PATH-ERASURE-THEOREM. -/
theorem erasureFixtureProgramReady_true : erasureFixtureProgramReady = true := by decide

/-- Erasure fixture host compose is unit-compile-ready after markErased.
    Greppable: erasureFixtureComposeReady_true, COMPILE-PATH-ERASURE-THEOREM. -/
theorem erasureFixtureComposeReady_true : erasureFixtureComposeReady = true := by decide

/-- Unready Erasure compose fails unit bar (FAIL-CLOSED multPreScan).
    Greppable: erasureFixtureComposeRaw_unready_true, COMPILE-PATH-ERASURE-THEOREM. -/
theorem erasureFixtureComposeRaw_unready_true :
    erasureFixtureComposeRawUnready = true := by decide

/-- Marked erased honesty holds on Erasure fixture ready host.
    Greppable: erasureFixtureMarkedOk_true, ERASE-NO-RUNTIME,
    COMPILE-PATH-ERASURE-THEOREM. -/
theorem erasureFixtureMarkedOk_true : erasureFixtureMarkedOk = true := by decide

/-- HOST-EMIT-ERASURE product text path honesty holds on Erasure fixture path.
    Greppable: erasureFixtureEmitPathOk_true, HOST-EMIT-ERASURE,
    COMPILE-PATH-ERASURE-THEOREM. -/
theorem erasureFixtureEmitPathOk_true : erasureFixtureEmitPathOk = true := by
  native_decide

/-- End-to-end Erasure unit compile path ready (Track 2 Erasure fixture).
    Greppable: erasureFixtureCompilePathReady_true, COMPILE-PATH-ERASURE-THEOREM,
    COMPILE-PATH-ERASURE, ERASURE-FIXTURE, HOST-COMPILE-PATH. -/
theorem erasureFixtureCompilePathReady_true :
    erasureFixtureCompilePathReady = true := by
  native_decide

/-- Erasure e2e ready does not claim residual free.
    Greppable: erasureFixtureDoesNotMeanResidualFree_true, COMPILE-PATH-ERASURE-THEOREM. -/
theorem erasureFixtureDoesNotMeanResidualFree_true :
    erasureFixtureDoesNotMeanResidualFree = true := by
  native_decide

/-- Erasure e2e free/complete/proof/llvm honesty stays false.
    Greppable: erasureFixture_claims_false, COMPILE-PATH-ERASURE-THEOREM. -/
theorem erasureFixture_claims_false :
    (erasureFixtureResidualFreeClaimed = false)
      /\ (erasureFixtureProductSelfHostCompleteClaimed = false)
      /\ (erasureFixtureProofCompleteClaimed = false)
      /\ (erasureFixtureLlvmUnlocked = false) :=
  And.intro rfl (And.intro rfl (And.intro rfl rfl))

/-- lowerErasureFixtureProgram succeeds with length 1.
    Greppable: lowerErasureFixtureProgram_length_one, COMPILE-PATH-ERASURE-THEOREM. -/
theorem lowerErasureFixtureProgram_length_one :
    (match lowerErasureFixtureProgram with
     | some p => IrProgram.length p == 1
     | none => false) = true := by decide

/-- lowerErasureFixtureCompose is some (mark-only path).
    Greppable: lowerErasureFixtureCompose_isSome, COMPILE-PATH-ERASURE-THEOREM. -/
theorem lowerErasureFixtureCompose_isSome :
    lowerErasureFixtureCompose.isSome = true := by decide


/-! ### COMPILE-PATH-ERASURE-SMOKE (Erasure fixture end-to-end; lake fails if examples fail)
    Greppable: COMPILE-PATH-ERASURE-SMOKE, ERASURE-FIXTURE, COMPILE-PATH-ERASURE. -/

/-- COMPILE-PATH-ERASURE-SMOKE: MULT-0 erased as ordered IR (length 1, well-typed). -/
example : (lowerErasureFixtureProgram.isSome) = true := by decide
example : erasureFixtureProgram.nodes.length = 1 := by decide
example : programCompileReady erasureFixtureProgram = true := by decide
example : erasureFixtureProgramReady = true := by decide

/-- COMPILE-PATH-ERASURE-SMOKE: raw Erasure fails; markErased unit-ready + marked. -/
example : erasureFixtureComposeRawUnready = true := by decide
example : erasureFixtureComposeReady = true := by decide
example : erasureFixtureMarkedOk = true := by decide
example :
    (match lowerErasureFixtureCompose with
     | some hc =>
         unitCompileReady hc
           && hc.erased.marked
           && Erasure.isRuntimeAbsent hc.erased
           && !hc.linear.live
     | none => false) = true := by decide

/-- COMPILE-PATH-ERASURE-SMOKE: HOST-EMIT-ERASURE product text path honesty. -/
example : erasureFixtureEmitPathOk = true := by native_decide
example : EmitErasure.hostEmitErasureId = "HOST-EMIT-ERASURE" := rfl
example : EmitErasure.stageId = "SLAKE_SELF_HOST_EMIT_ERASURE_V0" := rfl

/-- COMPILE-PATH-ERASURE-SMOKE: full Erasure e2e compile path; free/complete stay false. -/
example : erasureFixtureCompilePathReady = true := by native_decide
example : erasureFixtureDoesNotMeanResidualFree = true := by native_decide
example : erasureFixtureResidualFreeClaimed = false := rfl
example : erasureFixtureProductSelfHostCompleteClaimed = false := rfl
example : erasureFixtureProofCompleteClaimed = false := rfl
example : erasureFixtureLlvmUnlocked = false := rfl


end SystemsLean.CompilePath
