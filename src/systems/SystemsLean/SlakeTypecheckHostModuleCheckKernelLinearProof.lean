/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckKernelLinearProof.
  Short role: named driver for lean --run of the
  HostModuleCheckKernelLinearProof.lean wrap.
  Ready is HostFrontLiveHostModuleCheckKernelLinearProof parse plus
  HostKernel.kernelCheck of live HostModuleCheckKernelLinearProof.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckKernelLinearProof.
  liveRel is HostModuleCheckKernelLinearProof.lean.
  This wrap is HostModuleCheckKernelLinearProof.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKKERNELLINEARPROOF,
  SLAKE_TYPECHECK_HOSTMODULECHECKKERNELLINEARPROOF,
  slake-typecheck-hostmodulecheckkernellinearproof,
  slakeTypecheckHostModuleCheckKernelLinearProofReady,
  kernelCheckLiveHostModuleCheckKernelLinearProofSource,
  PARSE-LIVE-HOSTMODULECHECKKERNELLINEARPROOF.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckKernelLinearProof
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckKernelLinearProof.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckKernelLinearProof

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKKERNELLINEARPROOF"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKKERNELLINEARPROOF"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckKernelLinearProof : String :=
  "slake-typecheck-hostmodulecheckkernellinearproof"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckKernelLinearProofRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelLinearProof.liveHostModuleCheckKernelLinearProofRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckKernelLinearProofReady,
    kernelCheckLiveHostModuleCheckKernelLinearProofSource. -/
def slakeTypecheckHostModuleCheckKernelLinearProofReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelLinearProof.hostFrontLiveHostModuleCheckKernelLinearProofReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckKernelLinearProofDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckKernelLinearProofFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckKernelLinearProofFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckKernelLinearProofOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckKernelLinearProof.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckKernelLinearProofReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckKernelLinearProof.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckKernelLinearProof} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckKernelLinearProof.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckKernelLinearProofRel}"
  unless (!slakeTypecheckHostModuleCheckKernelLinearProofFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelLinearProofFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelLinearProofOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckKernelLinearProofDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckKernelLinearProof.main args
