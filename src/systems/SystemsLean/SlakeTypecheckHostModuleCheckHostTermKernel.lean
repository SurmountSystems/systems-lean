/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckHostTermKernel.
  Short role: named driver for the HostModuleCheckHostTermKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckHostTermKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckHostTermKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckHostTermKernel.
  liveRel is HostModuleCheckHostTermKernel.lean.
  This wrap is HostModuleCheckHostTermKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-HOST-TERM-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_HOST_TERM_KERNEL,
  slake-typecheck-hostmodulecheckhosttermkernel,
  slakeTypecheckHostModuleCheckHostTermKernelReady,
  kernelCheckLiveHostModuleCheckHostTermKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-HOST-TERM-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckHostTermKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckHostTermKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckHostTermKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_HOST_TERM_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-HOST-TERM-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckHostTermKernel : String :=
  "slake-typecheck-hostmodulecheckhosttermkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckHostTermKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckHostTermKernelSource.liveHostModuleCheckHostTermKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckHostTermKernelReady. -/
def slakeTypecheckHostModuleCheckHostTermKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckHostTermKernelSource.hostFrontLiveHostModuleCheckHostTermKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckHostTermKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckHostTermKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckHostTermKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckHostTermKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckHostTermKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckHostTermKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckHostTermKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckHostTermKernelRel}"
  unless (!slakeTypecheckHostModuleCheckHostTermKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostTermKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostTermKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckHostTermKernelSource.main args
