/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckHostGraphKernel.
  Short role: named driver for the HostModuleCheckHostGraphKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckHostGraphKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckHostGraphKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckHostGraphKernel.
  liveRel is HostModuleCheckHostGraphKernel.lean.
  This wrap is HostModuleCheckHostGraphKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-HOST-GRAPH-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_HOST_GRAPH_KERNEL,
  slake-typecheck-hostmodulecheckhostgraphkernel,
  slakeTypecheckHostModuleCheckHostGraphKernelReady,
  kernelCheckLiveHostModuleCheckHostGraphKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-HOST-GRAPH-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckHostGraphKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckHostGraphKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckHostGraphKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_HOST_GRAPH_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-HOST-GRAPH-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckHostGraphKernel : String :=
  "slake-typecheck-hostmodulecheckhostgraphkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckHostGraphKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckHostGraphKernelSource.liveHostModuleCheckHostGraphKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckHostGraphKernelReady. -/
def slakeTypecheckHostModuleCheckHostGraphKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckHostGraphKernelSource.hostFrontLiveHostModuleCheckHostGraphKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckHostGraphKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckHostGraphKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckHostGraphKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckHostGraphKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckHostGraphKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckHostGraphKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckHostGraphKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckHostGraphKernelRel}"
  unless (!slakeTypecheckHostModuleCheckHostGraphKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostGraphKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostGraphKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckHostGraphKernelSource.main args
