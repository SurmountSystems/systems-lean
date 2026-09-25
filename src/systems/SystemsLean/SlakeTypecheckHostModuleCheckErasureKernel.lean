/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckErasureKernel.
  Short role: named driver for the HostModuleCheckErasureKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckErasureKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckErasureKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckErasureKernel.
  liveRel is HostModuleCheckErasureKernel.lean.
  This wrap is HostModuleCheckErasureKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-ERASURE-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_ERASURE_KERNEL,
  slake-typecheck-hostmodulecheckerasurekernel,
  slakeTypecheckHostModuleCheckErasureKernelReady,
  kernelCheckLiveHostModuleCheckErasureKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-ERASURE-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckErasureKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckErasureKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckErasureKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_ERASURE_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-ERASURE-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckErasureKernel : String :=
  "slake-typecheck-hostmodulecheckerasurekernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckErasureKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckErasureKernelSource.liveHostModuleCheckErasureKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckErasureKernelReady. -/
def slakeTypecheckHostModuleCheckErasureKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckErasureKernelSource.hostFrontLiveHostModuleCheckErasureKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckErasureKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckErasureKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckErasureKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckErasureKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckErasureKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckErasureKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckErasureKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckErasureKernelRel}"
  unless (!slakeTypecheckHostModuleCheckErasureKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckErasureKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckErasureKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckErasureKernelSource.main args
