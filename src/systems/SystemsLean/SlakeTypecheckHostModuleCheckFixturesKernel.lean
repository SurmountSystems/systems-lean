/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckFixturesKernel.
  Short role: named driver for the HostModuleCheckFixturesKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckFixturesKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckFixturesKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckFixturesKernel.
  liveRel is HostModuleCheckFixturesKernel.lean.
  This wrap is HostModuleCheckFixturesKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-FIXTURES-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_FIXTURES_KERNEL,
  slake-typecheck-hostmodulecheckfixtureskernel,
  slakeTypecheckHostModuleCheckFixturesKernelReady,
  kernelCheckLiveHostModuleCheckFixturesKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-FIXTURES-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckFixturesKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckFixturesKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckFixturesKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_FIXTURES_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-FIXTURES-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckFixturesKernel : String :=
  "slake-typecheck-hostmodulecheckfixtureskernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckFixturesKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckFixturesKernelSource.liveHostModuleCheckFixturesKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckFixturesKernelReady. -/
def slakeTypecheckHostModuleCheckFixturesKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckFixturesKernelSource.hostFrontLiveHostModuleCheckFixturesKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckFixturesKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckFixturesKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckFixturesKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckFixturesKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckFixturesKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckFixturesKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckFixturesKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckFixturesKernelRel}"
  unless (!slakeTypecheckHostModuleCheckFixturesKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFixturesKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFixturesKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckFixturesKernelSource.main args
