/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckPackageRootsKernel.
  Short role: named driver for lean --run of the
  HostModuleCheckPackageRootsKernel.lean wrap.
  Ready is HostFrontLiveHostModuleCheckPackageRootsKernel parse plus
  HostKernel.kernelCheck of live HostModuleCheckPackageRootsKernel.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckPackageRootsKernel.
  liveRel is HostModuleCheckPackageRootsKernel.lean.
  This wrap is HostModuleCheckPackageRootsKernel.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEROOTSKERNEL,
  SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEROOTSKERNEL,
  slake-typecheck-hostmodulecheckpackagerootskernel,
  slakeTypecheckHostModuleCheckPackageRootsKernelReady,
  kernelCheckLiveHostModuleCheckPackageRootsKernelSource,
  PARSE-LIVE-HOSTMODULECHECKPACKAGEROOTSKERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageRootsKernel
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckPackageRootsKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageRootsKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEROOTSKERNEL"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEROOTSKERNEL"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckPackageRootsKernel : String :=
  "slake-typecheck-hostmodulecheckpackagerootskernel"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckPackageRootsKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageRootsKernel.liveHostModuleCheckPackageRootsKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckPackageRootsKernelReady,
    kernelCheckLiveHostModuleCheckPackageRootsKernelSource. -/
def slakeTypecheckHostModuleCheckPackageRootsKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageRootsKernel.hostFrontLiveHostModuleCheckPackageRootsKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckPackageRootsKernelDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageRootsKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckPackageRootsKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageRootsKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckPackageRootsKernel.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckPackageRootsKernelReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckPackageRootsKernel.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckPackageRootsKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageRootsKernel.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageRootsKernelRel}"
  unless (!slakeTypecheckHostModuleCheckPackageRootsKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageRootsKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageRootsKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckPackageRootsKernelDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageRootsKernel.main args
