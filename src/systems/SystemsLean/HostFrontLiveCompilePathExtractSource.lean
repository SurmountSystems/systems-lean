/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live CompilePathExtract.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCompilePathExtractSource. Not occupancy name 50. Not mill 70.
  This wrap parses CompilePathExtract.lean only.
  Unique needles use trailing newline so HostFrontLiveCompilePathExtract is not a
  prefix hit on HostFrontLiveCompilePathExtractSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveCompilePathExtract is not a prefix):
  HostFrontLiveCompilePathExtractSource
  PARSE-LIVE-COMPILE-PATH-EXTRACT
  HOST-FRONT-LIVE-COMPILE-PATH-EXTRACT
  COMPILE-PATH-EXTRACT
  Greppable: SYSTEMS_LEAN_HOST, liveCompilePathExtractSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveCompilePathExtractSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveCompilePathExtract

/-- Dual-pinned live CompilePathExtract.lean bytes (must match on-disk file).
    Greppable: liveCompilePathExtractSource, PARSE-LIVE-COMPILE-PATH-EXTRACT. -/
def liveCompilePathExtractSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Extract RUNTIME-FS gate on Mult + Program fixtures
  (COMPILE-PATH-EXTRACT).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Owns extract gate on real Mult + Program compile-path fixtures only:
  RUNTIME-FS accept, classic/edge reject, raw unready reject.
  Depends on CompilePathMult + CompilePathProgram fixtures (same namespace).
  Core compile bars and shared fixture helpers live in SystemsLean.CompilePath.
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full Slake compiler.
  Greppable: SYSTEMS_LEAN_HOST, COMPILE-PATH-EXTRACT, EXTRACT-RUNTIME-FS,
  fixtureExtractGateOk, extractRuntimeFsGateReady, COMPILE-PATH-EXTRACT-SMOKE,
  COMPILE-PATH-EXTRACT-THEOREM.
  UNIT_SURFACE host surface. Module: SystemsLean.CompilePathExtract
  Red/green: just systems-host; lake build SystemsLean.CompilePathExtract.
  Module must stay ASCII. Not freestanding emit residual free. Not PROVABLY.
  RUNTIME-FS extract path honesty only (not residual free forge).
-/

import SystemsLean.CompilePath
import SystemsLean.CompilePathMult
import SystemsLean.CompilePathProgram

namespace SystemsLean.CompilePath

open SystemsLean.Mult (Mult)
open SystemsLean.Types (IrNode NodeKind typeTagInit)
open SystemsLean.IrProgram (Program)
open SystemsLean.IrGraph (Graph)
open SystemsLean.HostCompose (Host)
open SystemsLean.Extract (RuntimeClaim)

/-! ### COMPILE-PATH-EXTRACT / EXTRACT-RUNTIME-FS (Track 2 extract gate on path)

  Named extract gate on real Mult + Program compile-path fixtures:
  - Ready hosts accept RUNTIME-FS via extractClaimOk / extractOkFs
  - Ready hosts reject RUNTIME-CLASSIC / EDGE-RUNTIME (EMIT-BOUNDARY fail-closed)
  - Raw unready Mult/Program compose fails extract under RUNTIME-FS (multPreScan)
  Definitional honesty: extractOkFs and extractClaimOk runtimeFs are the same
  HostCompose extract path under RUNTIME-FS (see extractClaimOk_fs_eq_extractOkFs;
  HostCompose.extractOkFs_eq). Classic/edge limbs are EMIT-BOUNDARY claim-side
  reject (Extract.isFreestandingGoal false), not a second multPreScan proof.
  Does NOT claim residual free / product self-host complete / proof complete /
  llvm unlock / full Slake compiler / residual free forge.
-/


set_option maxRecDepth 8192

/-- fixtureExtractGateOk hc -- extract gate on a host compose.
    RUNTIME-FS accept and classic/edge reject. Honesty: extractOkFs and
    extractClaimOk runtimeFs are definitionally the same HostCompose path under
    RUNTIME-FS (conjoined for greppable dual naming, not two independent bars;
    extractClaimOk_fs_eq_extractOkFs). Classic/edge limbs are EMIT-BOUNDARY
    claim-side reject (isFreestandingGoal), not a second multPreScan proof.
    Greppable: fixtureExtractGateOk, RUNTIME-FS, EMIT-BOUNDARY,
    RUNTIME-CLASSIC, EDGE-RUNTIME, COMPILE-PATH-EXTRACT. -/
def fixtureExtractGateOk (hc : Host) : Bool :=
  HostCompose.extractOkFs hc
    && extractClaimOk hc RuntimeClaim.runtimeFs
    && !extractClaimOk hc RuntimeClaim.runtimeClassic
    && !extractClaimOk hc RuntimeClaim.edgeRuntime

/-- multFixtureExtractGateOk -- extract gate on Mult ready fixture compose.
    Greppable: multFixtureExtractGateOk, COMPILE-PATH-EXTRACT, MULT-FIXTURE,
    EXTRACT-RUNTIME-FS. -/
def multFixtureExtractGateOk : Bool :=
  match lowerMultFixtureCompose with
  | none => false
  | some hc => fixtureExtractGateOk hc

/-- programFixtureExtractGateOk -- extract gate on Program ready fixture compose.
    Greppable: programFixtureExtractGateOk, COMPILE-PATH-EXTRACT, PROGRAM-FIXTURE,
    EXTRACT-RUNTIME-FS. -/
def programFixtureExtractGateOk : Bool :=
  match lowerProgramFixtureCompose with
  | none => false
  | some hc => fixtureExtractGateOk hc

/-- multFixtureExtractRawReject -- unready Mult raw compose fails extract under
    RUNTIME-FS and also rejects classic/edge (fail-closed; not product path).
    Greppable: multFixtureExtractRawReject, FAIL-CLOSED, COMPILE-PATH-EXTRACT. -/
def multFixtureExtractRawReject : Bool :=
  match lowerMultFixtureComposeRaw with
  | none => false
  | some hc =>
      !HostCompose.extractOkFs hc
        && !extractClaimOk hc RuntimeClaim.runtimeFs
        && !extractClaimOk hc RuntimeClaim.runtimeClassic
        && !extractClaimOk hc RuntimeClaim.edgeRuntime

/-- programFixtureExtractRawReject -- unready Program raw compose fails extract
    under RUNTIME-FS and rejects classic/edge.
    Greppable: programFixtureExtractRawReject, FAIL-CLOSED, COMPILE-PATH-EXTRACT. -/
def programFixtureExtractRawReject : Bool :=
  match lowerProgramFixtureComposeRaw with
  | none => false
  | some hc =>
      !HostCompose.extractOkFs hc
        && !extractClaimOk hc RuntimeClaim.runtimeFs
        && !extractClaimOk hc RuntimeClaim.runtimeClassic
        && !extractClaimOk hc RuntimeClaim.edgeRuntime

/-- Local honesty: extract gate does NOT claim residual free. -/
def extractRuntimeFsResidualFreeClaimed : Bool := false

/-- Local honesty: extract gate does NOT complete product self-host. -/
def extractRuntimeFsProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: extract gate does NOT claim proof complete. -/
def extractRuntimeFsProofCompleteClaimed : Bool := false

/-- Local honesty: extract gate does NOT unlock llvm. -/
def extractRuntimeFsLlvmUnlocked : Bool := false

/-- extractRuntimeFsGateReady -- joint Track 2 extract RUNTIME-FS gate on path.
    Mult + Program ready fixtures pass fixtureExtractGateOk; raw Mult/Program
    reject extract under RUNTIME-FS; free/complete/proof/llvm stay false.
    Greppable: extractRuntimeFsGateReady, COMPILE-PATH-EXTRACT, EXTRACT-RUNTIME-FS,
    HOST-COMPILE-PATH, RUNTIME-FS, EMIT-BOUNDARY. -/
def extractRuntimeFsGateReady : Bool :=
  multFixtureExtractGateOk
    && programFixtureExtractGateOk
    && multFixtureExtractRawReject
    && programFixtureExtractRawReject
    && !extractRuntimeFsResidualFreeClaimed
    && !extractRuntimeFsProductSelfHostCompleteClaimed
    && !extractRuntimeFsProofCompleteClaimed
    && !extractRuntimeFsLlvmUnlocked

/-- extractRuntimeFsDoesNotMeanResidualFree -- gate ready does not claim residual free.
    Greppable: extractRuntimeFsDoesNotMeanResidualFree, COMPILE-PATH-EXTRACT. -/
def extractRuntimeFsDoesNotMeanResidualFree : Bool :=
  extractRuntimeFsGateReady && !extractRuntimeFsResidualFreeClaimed

/-! ### COMPILE-PATH-EXTRACT-THEOREM (readable extract gate statements, then proofs)

  Real Lean theorems for extract gate on Mult + Program fixtures only. Does not
  flip SpecProof.proofCompleteClaimed / residual free / product self-host complete.
-/

/-- extractClaimOk under RUNTIME-FS is definitionally HostCompose.extractOkFs.
    Same path under two greppable names (extractClaimOk / extractOkFs); not two
    independent extract bars. Classic/edge reject remains claim-side EMIT-BOUNDARY.
    Greppable: extractClaimOk_fs_eq_extractOkFs, RUNTIME-FS, COMPILE-PATH-EXTRACT-THEOREM. -/
theorem extractClaimOk_fs_eq_extractOkFs (hc : Host) :
    extractClaimOk hc RuntimeClaim.runtimeFs = HostCompose.extractOkFs hc := rfl

/-- Mult ready fixture passes extract gate (FS accept + classic/edge reject).
    Greppable: multFixtureExtractGateOk_true, COMPILE-PATH-EXTRACT-THEOREM. -/
theorem multFixtureExtractGateOk_true : multFixtureExtractGateOk = true := by decide

/-- Program ready fixture passes extract gate (FS accept + classic/edge reject).
    Greppable: programFixtureExtractGateOk_true, COMPILE-PATH-EXTRACT-THEOREM. -/
theorem programFixtureExtractGateOk_true : programFixtureExtractGateOk = true := by decide

/-- Unready Mult raw compose fails extract under RUNTIME-FS (and classic/edge).
    Greppable: multFixtureExtractRawReject_true, COMPILE-PATH-EXTRACT-THEOREM. -/
theorem multFixtureExtractRawReject_true :
    multFixtureExtractRawReject = true := by decide

/-- Unready Program raw compose fails extract under RUNTIME-FS (and classic/edge).
    Greppable: programFixtureExtractRawReject_true, COMPILE-PATH-EXTRACT-THEOREM. -/
theorem programFixtureExtractRawReject_true :
    programFixtureExtractRawReject = true := by decide

/-- Joint extract RUNTIME-FS gate ready on Mult + Program fixtures (Track 2).
    Greppable: extractRuntimeFsGateReady_true, COMPILE-PATH-EXTRACT-THEOREM,
    COMPILE-PATH-EXTRACT, EXTRACT-RUNTIME-FS, HOST-COMPILE-PATH. -/
theorem extractRuntimeFsGateReady_true :
    extractRuntimeFsGateReady = true := by decide

/-- Extract gate ready does not claim residual free.
    Greppable: extractRuntimeFsDoesNotMeanResidualFree_true, COMPILE-PATH-EXTRACT-THEOREM. -/
theorem extractRuntimeFsDoesNotMeanResidualFree_true :
    extractRuntimeFsDoesNotMeanResidualFree = true := by decide

/-- Extract gate free/complete/proof/llvm honesty stays false.
    Greppable: extractRuntimeFs_claims_false, COMPILE-PATH-EXTRACT-THEOREM. -/
theorem extractRuntimeFs_claims_false :
    (extractRuntimeFsResidualFreeClaimed = false)
      /\ (extractRuntimeFsProductSelfHostCompleteClaimed = false)
      /\ (extractRuntimeFsProofCompleteClaimed = false)
      /\ (extractRuntimeFsLlvmUnlocked = false) :=
  And.intro rfl (And.intro rfl (And.intro rfl rfl))

/-- Mult ready fixture: extractClaimOk classic false, edge false, fs true (explicit).
    Greppable: multFixture_extractClaimOk_classic_edge_fs, COMPILE-PATH-EXTRACT-THEOREM. -/
theorem multFixture_extractClaimOk_classic_edge_fs :
    (match lowerMultFixtureCompose with
     | some hc =>
         (extractClaimOk hc RuntimeClaim.runtimeClassic = false)
           && (extractClaimOk hc RuntimeClaim.edgeRuntime = false)
           && (extractClaimOk hc RuntimeClaim.runtimeFs = true)
           && (HostCompose.extractOkFs hc = true)
     | none => false) = true := by decide

/-- Program ready fixture: extractClaimOk classic false, edge false, fs true (explicit).
    Greppable: programFixture_extractClaimOk_classic_edge_fs, COMPILE-PATH-EXTRACT-THEOREM. -/
theorem programFixture_extractClaimOk_classic_edge_fs :
    (match lowerProgramFixtureCompose with
     | some hc =>
         (extractClaimOk hc RuntimeClaim.runtimeClassic = false)
           && (extractClaimOk hc RuntimeClaim.edgeRuntime = false)
           && (extractClaimOk hc RuntimeClaim.runtimeFs = true)
           && (HostCompose.extractOkFs hc = true)
     | none => false) = true := by decide


/-! ### COMPILE-PATH-EXTRACT-SMOKE (extract RUNTIME-FS gate; lake fails if examples fail)
    Greppable: COMPILE-PATH-EXTRACT-SMOKE, EXTRACT-RUNTIME-FS, COMPILE-PATH-EXTRACT. -/

/-- COMPILE-PATH-EXTRACT-SMOKE: Mult ready fixture FS accept + classic/edge reject. -/
example : multFixtureExtractGateOk = true := by decide
example :
    (match lowerMultFixtureCompose with
     | some hc =>
         extractClaimOk hc RuntimeClaim.runtimeFs
           && HostCompose.extractOkFs hc
           && !extractClaimOk hc RuntimeClaim.runtimeClassic
           && !extractClaimOk hc RuntimeClaim.edgeRuntime
     | none => false) = true := by decide

/-- COMPILE-PATH-EXTRACT-SMOKE: Program ready fixture FS accept + classic/edge reject. -/
example : programFixtureExtractGateOk = true := by decide
example :
    (match lowerProgramFixtureCompose with
     | some hc =>
         extractClaimOk hc RuntimeClaim.runtimeFs
           && HostCompose.extractOkFs hc
           && !extractClaimOk hc RuntimeClaim.runtimeClassic
           && !extractClaimOk hc RuntimeClaim.edgeRuntime
     | none => false) = true := by decide

/-- COMPILE-PATH-EXTRACT-SMOKE: raw Mult/Program unready fail extract under RUNTIME-FS. -/
example : multFixtureExtractRawReject = true := by decide
example : programFixtureExtractRawReject = true := by decide

/-- COMPILE-PATH-EXTRACT-SMOKE: joint gate ready; free/complete/proof/llvm stay false. -/
example : extractRuntimeFsGateReady = true := by decide
example : extractRuntimeFsDoesNotMeanResidualFree = true := by decide
example : extractRuntimeFsResidualFreeClaimed = false := rfl
example : extractRuntimeFsProductSelfHostCompleteClaimed = false := rfl
example : extractRuntimeFsProofCompleteClaimed = false := rfl
example : extractRuntimeFsLlvmUnlocked = false := rfl



end SystemsLean.CompilePath
"#

end SystemsLean.HostFrontLiveCompilePathExtract
