/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckErasureTheoremsKernel.
  Short role: named driver for the HostModuleCheckErasureTheoremsKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckErasureTheoremsKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckErasureTheoremsKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckErasureTheoremsKernel.
  liveRel is HostModuleCheckErasureTheoremsKernel.lean.
  This wrap is HostModuleCheckErasureTheoremsKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-ERASURE-THEOREMS-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_ERASURE_THEOREMS_KERNEL,
  slake-typecheck-hostmodulecheckerasuretheoremskernel,
  slakeTypecheckHostModuleCheckErasureTheoremsKernelReady,
  kernelCheckLiveHostModuleCheckErasureTheoremsKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-ERASURE-THEOREMS-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckErasureTheoremsKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckErasureTheoremsKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckErasureTheoremsKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_ERASURE_THEOREMS_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-ERASURE-THEOREMS-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckErasureTheoremsKernel : String :=
  "slake-typecheck-hostmodulecheckerasuretheoremskernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckErasureTheoremsKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckErasureTheoremsKernelSource.liveHostModuleCheckErasureTheoremsKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckErasureTheoremsKernelReady. -/
def slakeTypecheckHostModuleCheckErasureTheoremsKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckErasureTheoremsKernelSource.hostFrontLiveHostModuleCheckErasureTheoremsKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckErasureTheoremsKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckErasureTheoremsKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckErasureTheoremsKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckErasureTheoremsKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckErasureTheoremsKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckErasureTheoremsKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckErasureTheoremsKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckErasureTheoremsKernelRel}"
  unless (!slakeTypecheckHostModuleCheckErasureTheoremsKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckErasureTheoremsKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckErasureTheoremsKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckErasureTheoremsKernelSource.main args
