/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckGraphTheoremsKernel.
  Short role: named driver for the HostModuleCheckGraphTheoremsKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckGraphTheoremsKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckGraphTheoremsKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckGraphTheoremsKernel.
  liveRel is HostModuleCheckGraphTheoremsKernel.lean.
  This wrap is HostModuleCheckGraphTheoremsKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-GRAPH-THEOREMS-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_GRAPH_THEOREMS_KERNEL,
  slake-typecheck-hostmodulecheckgraphtheoremskernel,
  slakeTypecheckHostModuleCheckGraphTheoremsKernelReady,
  kernelCheckLiveHostModuleCheckGraphTheoremsKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-GRAPH-THEOREMS-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckGraphTheoremsKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckGraphTheoremsKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckGraphTheoremsKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_GRAPH_THEOREMS_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-GRAPH-THEOREMS-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckGraphTheoremsKernel : String :=
  "slake-typecheck-hostmodulecheckgraphtheoremskernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckGraphTheoremsKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckGraphTheoremsKernelSource.liveHostModuleCheckGraphTheoremsKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckGraphTheoremsKernelReady. -/
def slakeTypecheckHostModuleCheckGraphTheoremsKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckGraphTheoremsKernelSource.hostFrontLiveHostModuleCheckGraphTheoremsKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckGraphTheoremsKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckGraphTheoremsKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckGraphTheoremsKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckGraphTheoremsKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckGraphTheoremsKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckGraphTheoremsKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckGraphTheoremsKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckGraphTheoremsKernelRel}"
  unless (!slakeTypecheckHostModuleCheckGraphTheoremsKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckGraphTheoremsKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckGraphTheoremsKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckGraphTheoremsKernelSource.main args
