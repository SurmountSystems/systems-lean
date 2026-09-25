/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckPackageEnvEvidence.
  Short role: named driver for the HostModuleCheckPackageEnvEvidence
  closed subset.
  Ready is HostFrontLiveHostModuleCheckPackageEnvEvidence parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckPackageEnvEvidence.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckPackageEnvEvidence.
  liveRel is HostModuleCheckPackageEnvEvidence.lean.
  This checker is HostModuleCheckPackageEnvEvidence.lean.
  Not HostModuleCheckPackageEnvEvidenceLater.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEENVEVIDENCE,
  SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEENVEVIDENCE,
  slake-typecheck-hostmodulecheckpackageenvevidence,
  slakeTypecheckHostModuleCheckPackageEnvEvidenceReady,
  kernelCheckLiveHostModuleCheckPackageEnvEvidenceSource,
  PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCE.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageEnvEvidence
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckPackageEnvEvidence.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceSource
import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidence

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEENVEVIDENCE"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEENVEVIDENCE"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckPackageEnvEvidence : String :=
  "slake-typecheck-hostmodulecheckpackageenvevidence"

/-- Live file relative to repo root. -/
def liveHostModuleCheckPackageEnvEvidenceRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidence.liveHostModuleCheckPackageEnvEvidenceRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckPackageEnvEvidenceReady. -/
def slakeTypecheckHostModuleCheckPackageEnvEvidenceReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidence.hostFrontLiveHostModuleCheckPackageEnvEvidenceReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckPackageEnvEvidenceDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvEvidenceFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckPackageEnvEvidenceFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvEvidenceOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckPackageEnvEvidence.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckPackageEnvEvidence} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidence.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageEnvEvidenceRel}"
  unless (!slakeTypecheckHostModuleCheckPackageEnvEvidenceFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvEvidenceFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvEvidenceOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckPackageEnvEvidenceDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidence.main args
