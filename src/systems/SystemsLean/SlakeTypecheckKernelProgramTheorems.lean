/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.KernelProgramTheorems.
  Short role: named driver for just slake-typecheck-kernelprogramtheorems.
  Ready is HostFrontLiveKernelProgramTheorems parse plus HostKernel.kernelCheck
  of live KernelProgramTheorems.lean, not := true, not lake build
  SystemsLean.KernelProgramTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNEL-PROGRAM-THEOREMS,
  SLAKE_TYPECHECK_KERNEL_PROGRAM_THEOREMS_V0, slake-typecheck-kernelprogramtheorems,
  slakeTypecheckKernelProgramTheoremsReady,
  kernelCheckLiveKernelProgramTheoremsSource,
  PARSE-LIVE-KERNEL-PROGRAM-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelProgramTheorems
  Checkable writer: just slake-typecheck-kernelprogramtheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveKernelProgramTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNEL_PROGRAM_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNEL-PROGRAM-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.KernelProgramTheorems. -/
def justRecipeSlakeTypecheckKernelProgramTheorems : String :=
  "slake-typecheck-kernelprogramtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelProgramTheoremsRel : String :=
  SystemsLean.HostFrontLiveKernelProgramTheorems.liveKernelProgramTheoremsRel

/-- Ready names HostFrontLiveKernelProgramTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckKernelProgramTheoremsReady,
    kernelCheckLiveKernelProgramTheoremsSource. -/
def slakeTypecheckKernelProgramTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveKernelProgramTheorems.hostFrontLiveKernelProgramTheoremsReady

/-- Honesty: this command is not lake build of KernelProgramTheorems. -/
def slakeTypecheckKernelProgramTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelProgramTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelProgramTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live KernelProgramTheorems.lean.
    Ready is HostFrontLiveKernelProgramTheorems.hostFrontLiveKernelProgramTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelProgramTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelProgramTheorems} =="
  IO.println s!"  host={hostId} file={liveKernelProgramTheoremsRel}"
  unless (!slakeTypecheckKernelProgramTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelProgramTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelProgramTheorems.main args
