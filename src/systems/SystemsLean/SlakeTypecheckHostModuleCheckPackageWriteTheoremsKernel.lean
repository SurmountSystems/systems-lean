/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckPackageWriteTheoremsKernel.
  Short role: named driver for lean --run of the
  HostModuleCheckPackageWriteTheoremsKernel.lean wrap.
  Ready is HostFrontLiveHostModuleCheckPackageWriteTheoremsKernel parse plus
  HostKernel.kernelCheck of live HostModuleCheckPackageWriteTheoremsKernel.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckPackageWriteTheoremsKernel.
  liveRel is HostModuleCheckPackageWriteTheoremsKernel.lean.
  This wrap is HostModuleCheckPackageWriteTheoremsKernel.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEWRITETHEOREMSKERNEL,
  SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEWRITETHEOREMSKERNEL,
  slake-typecheck-hostmodulecheckpackagewritetheoremskernel,
  slakeTypecheckHostModuleCheckPackageWriteTheoremsKernelReady,
  kernelCheckLiveHostModuleCheckPackageWriteTheoremsKernelSource,
  PARSE-LIVE-HOSTMODULECHECKPACKAGEWRITETHEOREMSKERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageWriteTheoremsKernel
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckPackageWriteTheoremsKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageWriteTheoremsKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEWRITETHEOREMSKERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEWRITETHEOREMSKERNEL"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckPackageWriteTheoremsKernel :
    String :=
  "slake-typecheck-hostmodulecheckpackagewritetheoremskernel"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckPackageWriteTheoremsKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageWriteTheoremsKernel.liveHostModuleCheckPackageWriteTheoremsKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckPackageWriteTheoremsKernelReady,
    kernelCheckLiveHostModuleCheckPackageWriteTheoremsKernelSource. -/
def slakeTypecheckHostModuleCheckPackageWriteTheoremsKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageWriteTheoremsKernel.hostFrontLiveHostModuleCheckPackageWriteTheoremsKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckPackageWriteTheoremsKernelDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageWriteTheoremsKernelFullHost :
    Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckPackageWriteTheoremsKernelFullBackend :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageWriteTheoremsKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckPackageWriteTheoremsKernel.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckPackageWriteTheoremsKernelReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckPackageWriteTheoremsKernel.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckPackageWriteTheoremsKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageWriteTheoremsKernel.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageWriteTheoremsKernelRel}"
  unless (!slakeTypecheckHostModuleCheckPackageWriteTheoremsKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageWriteTheoremsKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageWriteTheoremsKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckPackageWriteTheoremsKernelDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageWriteTheoremsKernel.main args
