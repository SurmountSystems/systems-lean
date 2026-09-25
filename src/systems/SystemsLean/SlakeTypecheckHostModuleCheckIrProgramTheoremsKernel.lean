/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckIrProgramTheoremsKernel.
  Short role: named driver for the HostModuleCheckIrProgramTheoremsKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckIrProgramTheoremsKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckIrProgramTheoremsKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckIrProgramTheoremsKernel.
  liveRel is HostModuleCheckIrProgramTheoremsKernel.lean.
  This wrap is HostModuleCheckIrProgramTheoremsKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IR-PROGRAM-THEOREMS-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_IR_PROGRAM_THEOREMS_KERNEL,
  slake-typecheck-hostmodulecheckirprogramtheoremskernel,
  slakeTypecheckHostModuleCheckIrProgramTheoremsKernelReady,
  kernelCheckLiveHostModuleCheckIrProgramTheoremsKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-IR-PROGRAM-THEOREMS-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckIrProgramTheoremsKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckIrProgramTheoremsKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckIrProgramTheoremsKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_IR_PROGRAM_THEOREMS_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IR-PROGRAM-THEOREMS-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckIrProgramTheoremsKernel : String :=
  "slake-typecheck-hostmodulecheckirprogramtheoremskernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckIrProgramTheoremsKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckIrProgramTheoremsKernelSource.liveHostModuleCheckIrProgramTheoremsKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckIrProgramTheoremsKernelReady. -/
def slakeTypecheckHostModuleCheckIrProgramTheoremsKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckIrProgramTheoremsKernelSource.hostFrontLiveHostModuleCheckIrProgramTheoremsKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckIrProgramTheoremsKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckIrProgramTheoremsKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckIrProgramTheoremsKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckIrProgramTheoremsKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckIrProgramTheoremsKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckIrProgramTheoremsKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckIrProgramTheoremsKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckIrProgramTheoremsKernelRel}"
  unless (!slakeTypecheckHostModuleCheckIrProgramTheoremsKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckIrProgramTheoremsKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckIrProgramTheoremsKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckIrProgramTheoremsKernelSource.main args
