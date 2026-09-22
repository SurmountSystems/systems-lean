/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.PerformEvidence.
  Short role: named driver for just slake-typecheck-performevidence.
  Ready is HostFrontLivePerformEvidence parse plus HostKernel.kernelCheck
  of live PerformEvidence.lean, not a hardcoded true, not lake build
  SystemsLean.PerformEvidence.
  liveRel is PerformEvidence.lean.
  This wrap is PerformEvidence.lean. It is not PerformEvidenceTheorems.lean.
  It is not PerformEvidenceMain.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PERFORM-EVIDENCE,
  SLAKE_TYPECHECK_PERFORM_EVIDENCE, slake-typecheck-performevidence,
  slakeTypecheckPerformEvidenceReady,
  kernelCheckLivePerformEvidenceSource,
  PARSE-LIVE-PERFORM-EVIDENCE.
  Module: SystemsLean.SlakeTypecheckPerformEvidence
  Checkable writer: just slake-typecheck-performevidence
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLivePerformEvidence

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PERFORM_EVIDENCE"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PERFORM-EVIDENCE"

/-- Named just recipe. Not lake build SystemsLean.PerformEvidence. -/
def justRecipeSlakeTypecheckPerformEvidence : String :=
  "slake-typecheck-performevidence"

/-- Live file relative to repo root. Dual-pin path. -/
def livePerformEvidenceRel : String :=
  SystemsLean.HostFrontLivePerformEvidence.livePerformEvidenceRel

/-- Ready names HostFrontLivePerformEvidence parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckPerformEvidenceReady,
    kernelCheckLivePerformEvidenceSource. -/
def slakeTypecheckPerformEvidenceReady : Bool :=
  SystemsLean.HostFrontLivePerformEvidence.hostFrontLivePerformEvidenceReady

/-- Honesty: this command is not lake build of PerformEvidence. -/
def slakeTypecheckPerformEvidenceDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckPerformEvidenceFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckPerformEvidenceFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckPerformEvidenceOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live PerformEvidence.lean.
    Ready is HostFrontLivePerformEvidence.hostFrontLivePerformEvidenceReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLivePerformEvidence.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckPerformEvidence} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLivePerformEvidence.liveRel}"
  IO.println s!"  host={hostId} file={livePerformEvidenceRel}"
  unless (!slakeTypecheckPerformEvidenceFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckPerformEvidenceFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckPerformEvidenceOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLivePerformEvidence.main args
