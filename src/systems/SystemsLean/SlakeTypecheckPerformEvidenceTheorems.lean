/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.PerformEvidenceTheorems.
  Short role: named driver for
  just slake-typecheck-performevidencetheorems.
  Ready is HostFrontLivePerformEvidenceTheorems parse plus
  HostKernel.kernelCheck of live PerformEvidenceTheorems.lean,
  not a hardcoded true, not lake build
  SystemsLean.PerformEvidenceTheorems.
  liveRel is PerformEvidenceTheorems.lean.
  This wrap is PerformEvidenceTheorems.lean.
  It is not PerformEvidence.lean.
  Not a backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-PERFORM-EVIDENCE-THEOREMS,
  SLAKE_TYPECHECK_PERFORM_EVIDENCE_THEOREMS,
  slake-typecheck-performevidencetheorems,
  slakeTypecheckPerformEvidenceTheoremsReady,
  kernelCheckLivePerformEvidenceTheoremsSource,
  PARSE-LIVE-PERFORM-EVIDENCE-THEOREMS.
  Module: SystemsLean.SlakeTypecheckPerformEvidenceTheorems
  Checkable writer: just slake-typecheck-performevidencetheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLivePerformEvidenceTheorems

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_PERFORM_EVIDENCE_THEOREMS"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-PERFORM-EVIDENCE-THEOREMS"

/-- Named just recipe. Not lake build
    SystemsLean.PerformEvidenceTheorems. -/
def justRecipeSlakeTypecheckPerformEvidenceTheorems : String :=
  "slake-typecheck-performevidencetheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def livePerformEvidenceTheoremsRel : String :=
  SystemsLean.HostFrontLivePerformEvidenceTheorems.livePerformEvidenceTheoremsRel

/-- Ready names HostFrontLivePerformEvidenceTheorems parse plus
    kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckPerformEvidenceTheoremsReady,
    kernelCheckLivePerformEvidenceTheoremsSource. -/
def slakeTypecheckPerformEvidenceTheoremsReady : Bool :=
  SystemsLean.HostFrontLivePerformEvidenceTheorems.hostFrontLivePerformEvidenceTheoremsReady

/-- Honesty: this command is not lake build of
    PerformEvidenceTheorems. -/
def slakeTypecheckPerformEvidenceTheoremsDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckPerformEvidenceTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not a backend. -/
def slakeTypecheckPerformEvidenceTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckPerformEvidenceTheoremsOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    PerformEvidenceTheorems.lean.
    Ready is HostFrontLivePerformEvidenceTheorems.hostFrontLivePerformEvidenceTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLivePerformEvidenceTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckPerformEvidenceTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLivePerformEvidenceTheorems.liveRel}"
  IO.println s!"  host={hostId} file={livePerformEvidenceTheoremsRel}"
  unless (!slakeTypecheckPerformEvidenceTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckPerformEvidenceTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckPerformEvidenceTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLivePerformEvidenceTheorems.main args
