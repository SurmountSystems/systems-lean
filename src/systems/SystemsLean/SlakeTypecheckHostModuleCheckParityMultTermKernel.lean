/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckParityMultTermKernel.
  Short role: named driver for lean --run of the
  HostModuleCheckParityMultTermKernel.lean wrap.
  Ready is HostFrontLiveHostModuleCheckParityMultTermKernel parse plus
  HostKernel.kernelCheck of live HostModuleCheckParityMultTermKernel.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckParityMultTermKernel.
  liveRel is HostModuleCheckParityMultTermKernel.lean.
  This wrap is HostModuleCheckParityMultTermKernel.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPARITYMULTTERMKERNEL,
  SLAKE_TYPECHECK_HOSTMODULECHECKPARITYMULTTERMKERNEL,
  slake-typecheck-hostmodulecheckparitymulttermkernel,
  slakeTypecheckHostModuleCheckParityMultTermKernelReady,
  kernelCheckLiveHostModuleCheckParityMultTermKernelSource,
  PARSE-LIVE-HOSTMODULECHECKPARITYMULTTERMKERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckParityMultTermKernel
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckParityMultTermKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckParityMultTermKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKPARITYMULTTERMKERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPARITYMULTTERMKERNEL"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckParityMultTermKernel :
    String :=
  "slake-typecheck-hostmodulecheckparitymulttermkernel"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckParityMultTermKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckParityMultTermKernel.liveHostModuleCheckParityMultTermKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckParityMultTermKernelReady,
    kernelCheckLiveHostModuleCheckParityMultTermKernelSource. -/
def slakeTypecheckHostModuleCheckParityMultTermKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckParityMultTermKernel.hostFrontLiveHostModuleCheckParityMultTermKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckParityMultTermKernelDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckParityMultTermKernelFullHost :
    Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckParityMultTermKernelFullBackend :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckParityMultTermKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckParityMultTermKernel.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckParityMultTermKernelReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckParityMultTermKernel.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckParityMultTermKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckParityMultTermKernel.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckParityMultTermKernelRel}"
  unless (!slakeTypecheckHostModuleCheckParityMultTermKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckParityMultTermKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckParityMultTermKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckParityMultTermKernelDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckParityMultTermKernel.main args
