/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.KernelProgram.
  Short role: named driver for just slake-typecheck-kernelprogram.
  Ready is HostFrontLiveKernelProgram parse plus HostKernel.kernelCheck of live
  KernelProgram.lean, not := true, not lake build SystemsLean.KernelProgram.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNELPROGRAM,
  SLAKE_TYPECHECK_KERNELPROGRAM_V0, slake-typecheck-kernelprogram,
  slakeTypecheckKernelProgramReady, kernelCheckLiveKernelProgramSource,
  PARSE-LIVE-KERNELPROGRAM, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelProgram
  Checkable writer: just slake-typecheck-kernelprogram (lean --run; no mill;
  no lake).
-/

import SystemsLean.HostFrontLiveKernelProgram

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNELPROGRAM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNELPROGRAM"

/-- Named just recipe. Not lake build SystemsLean.KernelProgram. -/
def justRecipeSlakeTypecheckKernelProgram : String :=
  "slake-typecheck-kernelprogram"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelProgramRel : String :=
  SystemsLean.HostFrontLiveKernelProgram.liveKernelProgramRel

/-- Ready names HostFrontLiveKernelProgram parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckKernelProgramReady,
    kernelCheckLiveKernelProgramSource. -/
def slakeTypecheckKernelProgramReady : Bool :=
  SystemsLean.HostFrontLiveKernelProgram.hostFrontLiveKernelProgramReady

/-- Honesty: this command is not lake build of KernelProgram. -/
def slakeTypecheckKernelProgramDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelProgramFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelProgramOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live KernelProgram.lean.
    Ready is HostFrontLiveKernelProgram.hostFrontLiveKernelProgramReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelProgram.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelProgram} =="
  IO.println s!"  host={hostId} file={liveKernelProgramRel}"
  unless (!slakeTypecheckKernelProgramFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelProgramOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelProgram.main args
