/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.KernelLinearTheorems.
  Short role: named driver for just slake-typecheck-kernellineartheorems.
  Ready is HostFrontLiveKernelLinearTheorems parse plus HostKernel.kernelCheck
  of live KernelLinearTheorems.lean, not := true, not lake build
  SystemsLean.KernelLinearTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Not SlakeTypecheckKernelLinear (that wrap typechecks KernelLinear.lean).
  Unique needles (trailing newline so SlakeTypecheckKernelLinearTheorems is not a
  prefix hit on KernelLinear wrap SlakeTypecheckKernelLinear):
  SlakeTypecheckKernelLinearTheorems
  HOST-SLAKE-TYPECHECK-KERNEL-LINEAR-THEOREMS
  SLAKE_TYPECHECK_KERNEL_LINEAR_THEOREMS_V0
  PARSE-LIVE-KERNEL-LINEAR-THEOREMS
  slake-typecheck-kernellineartheorems
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNEL-LINEAR-THEOREMS,
  SLAKE_TYPECHECK_KERNEL_LINEAR_THEOREMS_V0, slake-typecheck-kernellineartheorems,
  slakeTypecheckKernelLinearTheoremsReady,
  kernelCheckLiveKernelLinearTheoremsSource,
  PARSE-LIVE-KERNEL-LINEAR-THEOREMS, liveRel, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelLinearTheorems
  Checkable writer: just slake-typecheck-kernellineartheorems
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveKernelLinearTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNEL_LINEAR_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNEL-LINEAR-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.KernelLinearTheorems. -/
def justRecipeSlakeTypecheckKernelLinearTheorems : String :=
  "slake-typecheck-kernellineartheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelLinearTheoremsRel : String :=
  SystemsLean.HostFrontLiveKernelLinearTheorems.liveKernelLinearTheoremsRel

/-- Live basename. Greppable: liveRel. Must be KernelLinearTheorems.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveKernelLinearTheorems.liveRel

/-- Ready names HostFrontLiveKernelLinearTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckKernelLinearTheoremsReady,
    kernelCheckLiveKernelLinearTheoremsSource. -/
def slakeTypecheckKernelLinearTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveKernelLinearTheorems.hostFrontLiveKernelLinearTheoremsReady

/-- Honesty: this command is not lake build of KernelLinearTheorems. -/
def slakeTypecheckKernelLinearTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelLinearTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelLinearTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live KernelLinearTheorems.lean.
    Ready is HostFrontLiveKernelLinearTheorems.hostFrontLiveKernelLinearTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelLinearTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelLinearTheorems} =="
  IO.println s!"  host={hostId} file={liveKernelLinearTheoremsRel} liveRel={liveRel}"
  unless (!slakeTypecheckKernelLinearTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelLinearTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelLinearTheorems.main args
