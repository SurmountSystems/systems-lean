/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckHostCheckKernel.
  Short role: named driver for the HostModuleCheckHostCheckKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckHostCheckKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckHostCheckKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckHostCheckKernel.
  liveRel is HostModuleCheckHostCheckKernel.lean.
  This wrap is HostModuleCheckHostCheckKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-HOST-CHECK-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_HOST_CHECK_KERNEL,
  slake-typecheck-hostmodulecheckhostcheckkernel,
  slakeTypecheckHostModuleCheckHostCheckKernelReady,
  kernelCheckLiveHostModuleCheckHostCheckKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-HOST-CHECK-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckHostCheckKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckHostCheckKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckHostCheckKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_HOST_CHECK_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-HOST-CHECK-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckHostCheckKernel : String :=
  "slake-typecheck-hostmodulecheckhostcheckkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckHostCheckKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckHostCheckKernelSource.liveHostModuleCheckHostCheckKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckHostCheckKernelReady. -/
def slakeTypecheckHostModuleCheckHostCheckKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckHostCheckKernelSource.hostFrontLiveHostModuleCheckHostCheckKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckHostCheckKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckHostCheckKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckHostCheckKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckHostCheckKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckHostCheckKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckHostCheckKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckHostCheckKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckHostCheckKernelRel}"
  unless (!slakeTypecheckHostModuleCheckHostCheckKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostCheckKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostCheckKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckHostCheckKernelSource.main args
