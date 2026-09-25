/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckRequiredDeclsKernel.
  Short role: named driver for lean --run of the
  HostModuleCheckRequiredDeclsKernel.lean wrap.
  Ready is HostFrontLiveHostModuleCheckRequiredDeclsKernel parse plus
  HostKernel.kernelCheck of live HostModuleCheckRequiredDeclsKernel.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckRequiredDeclsKernel.
  liveRel is HostModuleCheckRequiredDeclsKernel.lean.
  This wrap is HostModuleCheckRequiredDeclsKernel.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKREQUIREDDECLSKERNEL,
  SLAKE_TYPECHECK_HOSTMODULECHECKREQUIREDDECLSKERNEL,
  slake-typecheck-hostmodulecheckrequireddeclskernel,
  slakeTypecheckHostModuleCheckRequiredDeclsKernelReady,
  kernelCheckLiveHostModuleCheckRequiredDeclsKernelSource,
  PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckRequiredDeclsKernel
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckRequiredDeclsKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKREQUIREDDECLSKERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKREQUIREDDECLSKERNEL"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckRequiredDeclsKernel :
    String :=
  "slake-typecheck-hostmodulecheckrequireddeclskernel"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckRequiredDeclsKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsKernel.liveHostModuleCheckRequiredDeclsKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckRequiredDeclsKernelReady,
    kernelCheckLiveHostModuleCheckRequiredDeclsKernelSource. -/
def slakeTypecheckHostModuleCheckRequiredDeclsKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsKernel.hostFrontLiveHostModuleCheckRequiredDeclsKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckRequiredDeclsKernelDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckRequiredDeclsKernelFullHost :
    Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckRequiredDeclsKernelFullBackend :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckRequiredDeclsKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckRequiredDeclsKernel.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckRequiredDeclsKernelReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckRequiredDeclsKernel.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckRequiredDeclsKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsKernel.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckRequiredDeclsKernelRel}"
  unless (!slakeTypecheckHostModuleCheckRequiredDeclsKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckRequiredDeclsKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckRequiredDeclsKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckRequiredDeclsKernelDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsKernel.main args
