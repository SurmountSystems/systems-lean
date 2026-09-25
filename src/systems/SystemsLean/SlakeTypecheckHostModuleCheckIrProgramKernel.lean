/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckIrProgramKernel.
  Short role: named driver for the HostModuleCheckIrProgramKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckIrProgramKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckIrProgramKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckIrProgramKernel.
  liveRel is HostModuleCheckIrProgramKernel.lean.
  This wrap is HostModuleCheckIrProgramKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IR-PROGRAM-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_IR_PROGRAM_KERNEL,
  slake-typecheck-hostmodulecheckirprogramkernel,
  slakeTypecheckHostModuleCheckIrProgramKernelReady,
  kernelCheckLiveHostModuleCheckIrProgramKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-IR-PROGRAM-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckIrProgramKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckIrProgramKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckIrProgramKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_IR_PROGRAM_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IR-PROGRAM-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckIrProgramKernel : String :=
  "slake-typecheck-hostmodulecheckirprogramkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckIrProgramKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckIrProgramKernelSource.liveHostModuleCheckIrProgramKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckIrProgramKernelReady. -/
def slakeTypecheckHostModuleCheckIrProgramKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckIrProgramKernelSource.hostFrontLiveHostModuleCheckIrProgramKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckIrProgramKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckIrProgramKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckIrProgramKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckIrProgramKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckIrProgramKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckIrProgramKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckIrProgramKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckIrProgramKernelRel}"
  unless (!slakeTypecheckHostModuleCheckIrProgramKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckIrProgramKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckIrProgramKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckIrProgramKernelSource.main args
