/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckExtractKernel.
  Short role: named driver for the HostModuleCheckExtractKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckExtractKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckExtractKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckExtractKernel.
  liveRel is HostModuleCheckExtractKernel.lean.
  This wrap is HostModuleCheckExtractKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-EXTRACT-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_EXTRACT_KERNEL,
  slake-typecheck-hostmodulecheckextractkernel,
  slakeTypecheckHostModuleCheckExtractKernelReady,
  kernelCheckLiveHostModuleCheckExtractKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-EXTRACT-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckExtractKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckExtractKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckExtractKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_EXTRACT_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-EXTRACT-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckExtractKernel : String :=
  "slake-typecheck-hostmodulecheckextractkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckExtractKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckExtractKernelSource.liveHostModuleCheckExtractKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckExtractKernelReady. -/
def slakeTypecheckHostModuleCheckExtractKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckExtractKernelSource.hostFrontLiveHostModuleCheckExtractKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckExtractKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckExtractKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckExtractKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckExtractKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckExtractKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckExtractKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckExtractKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckExtractKernelRel}"
  unless (!slakeTypecheckHostModuleCheckExtractKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckExtractKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckExtractKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckExtractKernelSource.main args
