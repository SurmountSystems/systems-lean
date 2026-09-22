/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live CompilePathBody.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCompilePathBodySource. Not occupancy name 50. Not mill 70.
  This wrap parses CompilePathBody.lean only.
  Unique needles use trailing newline so HostFrontLiveCompilePathBody is not a
  prefix hit on HostFrontLiveCompilePathBodySource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveCompilePathBody is not a prefix):
  HostFrontLiveCompilePathBodySource
  PARSE-LIVE-COMPILE-PATH-BODY
  HOST-FRONT-LIVE-COMPILE-PATH-BODY
  COMPILE-PATH-BODY
  Greppable: SYSTEMS_LEAN_HOST, liveCompilePathBodySource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveCompilePathBodySource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveCompilePathBody

/-- Dual-pinned live CompilePathBody.lean bytes (must match on-disk file).
    Greppable: liveCompilePathBodySource, PARSE-LIVE-COMPILE-PATH-BODY. -/
def liveCompilePathBodySource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Body unit compile-path fixture (COMPILE-PATH-BODY).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Owns Body end-to-end compile-path fixture only: multi-node ordered IR ->
  host mark+mint -> bodyFromCompose / bodyOk -> unitCompileReady + HOST-EMIT-BODY.
  Core compile bars and shared fixture helpers live in SystemsLean.CompilePath.
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full Slake compiler.
  Greppable: SYSTEMS_LEAN_HOST, COMPILE-PATH-BODY, BODY-FIXTURE, HOST-EMIT-BODY,
  bodyFixtureCompilePathReady, COMPILE-PATH-BODY-SMOKE, COMPILE-PATH-BODY-THEOREM.
  UNIT_SURFACE host surface. Module: SystemsLean.CompilePathBody
  Red/green: just systems-host; lake build SystemsLean.CompilePathBody.
  Module must stay ASCII. Not freestanding emit residual free. Not PROVABLY.
  RUNTIME-FS body path honesty only (not residual free forge).
-/

import SystemsLean.CompilePath
import SystemsLean.EmitBody
import SystemsLean.EmitBodyScaffold

namespace SystemsLean.CompilePath

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.IrGraph (Graph)
open SystemsLean.HostCompose (Host)

/-! ### COMPILE-PATH-BODY / BODY-FIXTURE (Track 2 Body unit end-to-end)

  Named Body fixture: multi-node ordered IR (ERASED/LINEAR/VALUE so plan ready
  and apply valid) -> host compose mark MULT-0 + mint MULT-1 (mint id 12) ->
  bodyFromCompose / bodyOk buffer readiness (markers / r/e / tagCount /
  HOST-EMIT-SSOT fragment) -> unitCompileReady + HOST-EMIT-BODY product text
  honesty. Mint-id honesty: Body uses 12 so Mult=4 Types=5 Program=6 Linear=7
  Graph=8 Compose=9 Plan=10 Apply=11 stay other fixtures. Same bodyFromCompose
  FAIL-CLOSED plan+apply path as EmitBody.lean host API; e2e bar lives here.
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full product module emit / full Slake compiler.
-/

/-- Fixed Body fixture mint id (unused by Mult..Apply fixtures). -/
def bodyFixtureMintId : Nat := 12

/-- Body fixture mint id is 12 (Mult=4 Types=5 Program=6 Linear=7 Graph=8
    Compose=9 Plan=10 Apply=11). Greppable: bodyFixtureMintId_eq,
    COMPILE-PATH-BODY-THEOREM. -/
theorem bodyFixtureMintId_eq : bodyFixtureMintId = 12 := rfl

/-- Body fixture type tags (deterministic; match Mult/Plan/Apply tag order). -/
def bodyFixtureTagErased : Nat := 0
def bodyFixtureTagLinear : Nat := 1
def bodyFixtureTagValue : Nat := 2

/-- Body fixture nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value. -/
def bodyFixtureErasedNode : IrNode :=
  { ty := typeTagInit bodyFixtureTagErased, mult := Mult.mult0, kind := NodeKind.erased }

def bodyFixtureLinearNode : IrNode :=
  { ty := typeTagInit bodyFixtureTagLinear, mult := Mult.mult1, kind := NodeKind.linear }

def bodyFixtureValueNode : IrNode :=
  { ty := typeTagInit bodyFixtureTagValue, mult := Mult.multOmega, kind := NodeKind.value }

/-- Expected HOST-EMIT-SSOT body fragment for ready Body fixture host
    (r=2 e=1; tags ERASED mult0 / LINEAR mult1 / VALUE omega in program order). -/
def bodyFixtureExpectedBuf : String :=
  "/* EMIT_BODY_V0 RUNTIME-FS r=2 e=1 */\n"
    ++ "/* t0 mult=0 kind=2 */\n"
    ++ "/* t1 mult=1 kind=1 */\n"
    ++ "/* t2 mult=2 kind=0 */\n"

/-- lowerBodyFixtureProgram -- multi-node ordered IR (COMPILE-PATH-BODY).
    Three nodes: MULT-0 ERASED, MULT-1 LINEAR, MULT-OMEGA VALUE.
    FAIL-CLOSED: none if any push fails.
    Greppable: lowerBodyFixtureProgram, BODY-FIXTURE, ORDERED-IR-PROGRAM. -/
def lowerBodyFixtureProgram : Option Program :=
  match pushFixtureProg IrProgram.empty bodyFixtureErasedNode with
  | none => none
  | some p0 =>
    match pushFixtureProg p0 bodyFixtureLinearNode with
    | none => none
    | some p1 => pushFixtureProg p1 bodyFixtureValueNode

/-- bodyFixtureProgram -- Body ordered IR when lower succeeds; empty on fail. -/
def bodyFixtureProgram : Program :=
  match lowerBodyFixtureProgram with
  | some p => p
  | none => IrProgram.empty

/-- lowerBodyFixtureComposeRaw -- HostCompose with three Mult nodes, no mint/mark.
    FAIL-CLOSED: none on push fail. Unready for multPreScan (MULT-0/1 need handles).
    Greppable: lowerBodyFixtureComposeRaw, BODY-FIXTURE, HOST-COMPOSE. -/
def lowerBodyFixtureComposeRaw : Option Host :=
  match pushFixtureHost HostCompose.empty bodyFixtureErasedNode with
  | none => none
  | some hc0 =>
    match pushFixtureHost hc0 bodyFixtureLinearNode with
    | none => none
    | some hc1 => pushFixtureHost hc1 bodyFixtureValueNode

/-- lowerBodyFixtureCompose -- Body fixture host ready for unit compile path.
    markErased (MULT-0) + mint (MULT-1); MULT-OMEGA needs neither.
    FAIL-CLOSED: none if raw lower or mint fails.
    Greppable: lowerBodyFixtureCompose, BODY-FIXTURE, HOST-COMPOSE. -/
def lowerBodyFixtureCompose : Option Host :=
  match lowerBodyFixtureComposeRaw with
  | none => none
  | some hcRaw =>
    let hcMarked := HostCompose.markErased hcRaw
    mintFixtureHost hcMarked bodyFixtureMintId

/-- bodyFixtureProgramReady -- ordered IR bar for Body fixture.
    FAIL-CLOSED: lower succeeds, length 3, programCompileReady, gradeSurfaceOk.
    Greppable: bodyFixtureProgramReady, COMPILE-PATH-BODY, BODY-FIXTURE. -/
def bodyFixtureProgramReady : Bool :=
  match lowerBodyFixtureProgram with
  | none => false
  | some p =>
      programCompileReady p
        && IrProgram.length p == 3
        && IrProgram.isWellTyped p
        && gradeSurfaceOk

/-- bodyFixtureBodyOk -- bodyFromCompose / bodyOk buffer readiness on ready host.
    Expected: runtimeNodes 2, erasedNodes 1, tagCount 3, EMIT_BODY_V0 / RUNTIME-FS
    markers in buf, exact HOST-EMIT-SSOT fragment, len < bodyCap.
    Primary check: bodyOk (definitionally bodyIsValid (bodyFromCompose hc));
    structural fields from bodyFromCompose (not a bare true canary; no redundant
    bodyIsValid / valid / ready triple).
    Greppable: bodyFixtureBodyOk, bodyFromCompose, bodyOk, COMPILE-PATH-BODY. -/
def bodyFixtureBodyOk : Bool :=
  match lowerBodyFixtureCompose with
  | none => false
  | some hc =>
      let b := EmitBody.bodyFromCompose hc
      EmitBody.bodyOk hc
        && b.runtimeNodes == 2
        && b.erasedNodes == 1
        && b.tagCount == 3
        && EmitBody.bufHasEmitBodyMarker b.buf
        && EmitBody.bufHasRuntimeFsMarker b.buf
        && b.buf == bodyFixtureExpectedBuf
        && decide (b.len < EmitBody.bodyCap)

/-- bodyFixtureComposeReady -- unit compile-path bar on Body fixture host.
    FAIL-CLOSED: lower compose succeeds, unitCompileReady, live mint with
    bodyFixtureMintId, erased marked after markErased, extractOkFs.
    Greppable: bodyFixtureComposeReady, COMPILE-PATH-BODY, unitCompileReady. -/
def bodyFixtureComposeReady : Bool :=
  match lowerBodyFixtureCompose with
  | none => false
  | some hc =>
      unitCompileReady hc
        && HostCompose.extractOkFs hc
        && hc.linear.live
        && hc.linear.id == bodyFixtureMintId
        && hc.erased.marked
        && IrProgram.length hc.graph.prog == 3
        && IrGraph.isWellTyped hc.graph

/-- bodyFixtureComposeRawUnready -- unminted/unmarked Body compose fails unit bar
    and body path (FAIL-CLOSED bodyFromCompose requires plan ready + apply valid).
    Greppable: bodyFixtureComposeRawUnready, FAIL-CLOSED, BODY-FIXTURE. -/
def bodyFixtureComposeRawUnready : Bool :=
  match lowerBodyFixtureComposeRaw with
  | none => false
  | some hc =>
      !unitCompileReady hc
        && !HostCompose.checkFailClosed hc
        && !EmitBody.bodyOk hc
        && !hc.linear.live
        && !hc.erased.marked

/-- bodyFixtureEmitPathOk -- host Body product text path honesty (HOST-EMIT-BODY).
    Reuses EmitBody.emitBodyReady; does not re-emit C; not residual free.
    Greppable: bodyFixtureEmitPathOk, HOST-EMIT-BODY, COMPILE-PATH-BODY. -/
def bodyFixtureEmitPathOk : Bool := EmitBody.emitBodyReady

/-- Local honesty: Body e2e fixture does NOT claim residual free. -/
def bodyFixtureResidualFreeClaimed : Bool := false

/-- Local honesty: Body e2e fixture does NOT complete product self-host. -/
def bodyFixtureProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: Body e2e fixture does NOT claim proof complete. -/
def bodyFixtureProofCompleteClaimed : Bool := false

/-- Local honesty: Body e2e fixture does NOT unlock llvm. -/
def bodyFixtureLlvmUnlocked : Bool := false

/-- bodyFixtureCompilePathReady -- end-to-end Body unit compile path (Track 2).
    Multi-node IR + mark+mint unit bar + bodyFromCompose buffer + HOST-EMIT-BODY
    emit path + free/complete/proof/llvm stay false.
    Greppable: bodyFixtureCompilePathReady, COMPILE-PATH-BODY, BODY-FIXTURE,
    HOST-COMPILE-PATH, HOST-EMIT-BODY, bodyFromCompose. -/
def bodyFixtureCompilePathReady : Bool :=
  gradeSurfaceOk
    && bodyFixtureProgramReady
    && bodyFixtureComposeReady
    && bodyFixtureComposeRawUnready
    && bodyFixtureBodyOk
    && bodyFixtureEmitPathOk
    && !bodyFixtureResidualFreeClaimed
    && !bodyFixtureProductSelfHostCompleteClaimed
    && !bodyFixtureProofCompleteClaimed
    && !bodyFixtureLlvmUnlocked

/-- bodyFixtureDoesNotMeanResidualFree -- e2e ready does not claim residual free.
    Greppable: bodyFixtureDoesNotMeanResidualFree, COMPILE-PATH-BODY. -/
def bodyFixtureDoesNotMeanResidualFree : Bool :=
  bodyFixtureCompilePathReady && !bodyFixtureResidualFreeClaimed

/-! ### COMPILE-PATH-BODY-THEOREM (readable Body e2e statements, then proofs)

  Real Lean theorems for Body fixture compile path only. Does not flip
  SpecProof.proofCompleteClaimed / residual free / product self-host complete.
  maxRecDepth raised for bodyFromCompose / bodyOk / emitBodyReady unfolds
  (same budget as Mult fixture theorems in CompilePath.lean).
-/

set_option maxRecDepth 8192

/-- Body fixture ordered IR program is compile-path ready.
    Greppable: bodyFixtureProgramReady_true, COMPILE-PATH-BODY-THEOREM. -/
theorem bodyFixtureProgramReady_true : bodyFixtureProgramReady = true := by decide

/-- Body fixture host compose is unit-compile-ready after mark+mint.
    Greppable: bodyFixtureComposeReady_true, COMPILE-PATH-BODY-THEOREM. -/
theorem bodyFixtureComposeReady_true : bodyFixtureComposeReady = true := by decide

/-- Unready Body compose fails unit bar and body path (FAIL-CLOSED).
    Greppable: bodyFixtureComposeRaw_unready_true, COMPILE-PATH-BODY-THEOREM. -/
theorem bodyFixtureComposeRaw_unready_true :
    bodyFixtureComposeRawUnready = true := by decide

/-- bodyFromCompose buffer readiness holds on Body fixture ready host.
    Greppable: bodyFixtureBodyOk_true, bodyFromCompose, bodyOk,
    COMPILE-PATH-BODY-THEOREM. -/
theorem bodyFixtureBodyOk_true : bodyFixtureBodyOk = true := by native_decide

/-- HOST-EMIT-BODY product text path honesty holds on Body fixture path.
    Greppable: bodyFixtureEmitPathOk_true, HOST-EMIT-BODY,
    COMPILE-PATH-BODY-THEOREM. -/
theorem bodyFixtureEmitPathOk_true : bodyFixtureEmitPathOk = true := by
  native_decide

/-- End-to-end Body unit compile path ready (Track 2 Body fixture).
    Greppable: bodyFixtureCompilePathReady_true, COMPILE-PATH-BODY-THEOREM,
    COMPILE-PATH-BODY, BODY-FIXTURE, HOST-COMPILE-PATH. -/
theorem bodyFixtureCompilePathReady_true :
    bodyFixtureCompilePathReady = true := by
  native_decide

/-- Body e2e ready does not claim residual free.
    Greppable: bodyFixtureDoesNotMeanResidualFree_true, COMPILE-PATH-BODY-THEOREM. -/
theorem bodyFixtureDoesNotMeanResidualFree_true :
    bodyFixtureDoesNotMeanResidualFree = true := by
  native_decide

/-- Body e2e free/complete/proof/llvm honesty stays false.
    Greppable: bodyFixture_claims_false, COMPILE-PATH-BODY-THEOREM. -/
theorem bodyFixture_claims_false :
    (bodyFixtureResidualFreeClaimed = false)
      /\ (bodyFixtureProductSelfHostCompleteClaimed = false)
      /\ (bodyFixtureProofCompleteClaimed = false)
      /\ (bodyFixtureLlvmUnlocked = false) :=
  And.intro rfl (And.intro rfl (And.intro rfl rfl))

/-- lowerBodyFixtureProgram succeeds with length 3.
    Greppable: lowerBodyFixtureProgram_length_three, COMPILE-PATH-BODY-THEOREM. -/
theorem lowerBodyFixtureProgram_length_three :
    (match lowerBodyFixtureProgram with
     | some p => IrProgram.length p == 3
     | none => false) = true := by decide

/-- lowerBodyFixtureCompose is some (mark+mint path).
    Greppable: lowerBodyFixtureCompose_isSome, COMPILE-PATH-BODY-THEOREM. -/
theorem lowerBodyFixtureCompose_isSome :
    lowerBodyFixtureCompose.isSome = true := by decide

/-! ### COMPILE-PATH-BODY-SMOKE (Body fixture end-to-end; lake fails if examples fail)
    Greppable: COMPILE-PATH-BODY-SMOKE, BODY-FIXTURE, COMPILE-PATH-BODY. -/

/-- COMPILE-PATH-BODY-SMOKE: multi-node ordered IR (length 3, well-typed). -/
example : (lowerBodyFixtureProgram.isSome) = true := by decide
example : bodyFixtureProgram.nodes.length = 3 := by decide
example : programCompileReady bodyFixtureProgram = true := by decide
example : bodyFixtureProgramReady = true := by decide
example : bodyFixtureMintId = 12 := rfl

/-- COMPILE-PATH-BODY-SMOKE: raw Body fails; mark+mint unit-ready. -/
example : bodyFixtureComposeRawUnready = true := by decide
example : bodyFixtureComposeReady = true := by decide
example :
    (match lowerBodyFixtureCompose with
     | some hc =>
         unitCompileReady hc
           && hc.linear.live
           && hc.linear.id == bodyFixtureMintId
           && hc.erased.marked
           && IrProgram.length hc.graph.prog == 3
           && IrGraph.isWellTyped hc.graph
     | none => false) = true := by decide

/-- COMPILE-PATH-BODY-SMOKE: bodyFromCompose buffer readiness (markers/r/e/tags). -/
example : bodyFixtureBodyOk = true := by native_decide
example :
    (match lowerBodyFixtureCompose with
     | some hc =>
         let b := EmitBody.bodyFromCompose hc
         EmitBody.bodyOk hc
           && b.runtimeNodes == 2
           && b.erasedNodes == 1
           && b.tagCount == 3
           && EmitBody.bufHasEmitBodyMarker b.buf
           && EmitBody.bufHasRuntimeFsMarker b.buf
           && b.buf == bodyFixtureExpectedBuf
     | none => false) = true := by native_decide

/-- COMPILE-PATH-BODY-SMOKE: HOST-EMIT-BODY product text path honesty. -/
example : bodyFixtureEmitPathOk = true := by native_decide
example : EmitBody.hostEmitBodyId = "HOST-EMIT-BODY" := rfl
example : EmitBody.productStageId = "SLAKE_SELF_HOST_EMIT_BODY_V0" := rfl

/-- COMPILE-PATH-BODY-SMOKE: full Body e2e compile path; free/complete stay false. -/
example : bodyFixtureCompilePathReady = true := by native_decide
example : bodyFixtureDoesNotMeanResidualFree = true := by native_decide
example : bodyFixtureResidualFreeClaimed = false := rfl
example : bodyFixtureProductSelfHostCompleteClaimed = false := rfl
example : bodyFixtureProofCompleteClaimed = false := rfl
example : bodyFixtureLlvmUnlocked = false := rfl

end SystemsLean.CompilePath
"#

end SystemsLean.HostFrontLiveCompilePathBody
