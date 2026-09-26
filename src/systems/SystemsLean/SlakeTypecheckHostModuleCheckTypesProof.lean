/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckTypesProof.
  Short role: named driver for the HostModuleCheckTypesProof
  closed subset.
  Ready is HostFrontLiveHostModuleCheckTypesProofSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckTypesProof.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckTypesProof.
  liveRel is HostModuleCheckTypesProof.lean.
  This wrap is HostModuleCheckTypesProof.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-TYPES-PROOF,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_TYPES_PROOF,
  slake-typecheck-hostmodulechecktypesproof,
  slakeTypecheckHostModuleCheckTypesProofReady,
  kernelCheckLiveHostModuleCheckTypesProofSource,
  PARSE-LIVE-HOST-MODULE-CHECK-TYPES-PROOF.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckTypesProof
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckTypesProof.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckTypesProofSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_TYPES_PROOF"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-TYPES-PROOF"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckTypesProof : String :=
  "slake-typecheck-hostmodulechecktypesproof"

/-- Live file relative to repo root. -/
def liveHostModuleCheckTypesProofRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckTypesProofSource.liveHostModuleCheckTypesProofRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckTypesProofReady. -/
def slakeTypecheckHostModuleCheckTypesProofReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckTypesProofSource.hostFrontLiveHostModuleCheckTypesProofReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckTypesProofDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckTypesProofFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckTypesProofFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckTypesProofOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckTypesProof.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckTypesProof} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckTypesProofSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckTypesProofRel}"
  unless (!slakeTypecheckHostModuleCheckTypesProofFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckTypesProofFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckTypesProofOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckTypesProofSource.main args
