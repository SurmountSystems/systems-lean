/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.KernelSelfApplyTheorems.
  Short role: named driver for just slake-typecheck-kernelselfapplytheorems.
  Ready is HostFrontLiveKernelSelfApplyTheorems parse plus HostKernel.kernelCheck
  of live KernelSelfApplyTheorems.lean, not := true, not lake build
  SystemsLean.KernelSelfApplyTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Not SlakeTypecheckKernelSelfApply (that wrap typechecks KernelSelfApply.lean).
  Unique needles (trailing newline so SlakeTypecheckKernelSelfApplyTheorems is not a
  prefix hit on KernelSelfApply wrap SlakeTypecheckKernelSelfApply):
  SlakeTypecheckKernelSelfApplyTheorems
  HOST-SLAKE-TYPECHECK-KERNEL-SELF-APPLY-THEOREMS
  SLAKE_TYPECHECK_KERNEL_SELF_APPLY_THEOREMS_V0
  PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS
  slake-typecheck-kernelselfapplytheorems
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNEL-SELF-APPLY-THEOREMS,
  SLAKE_TYPECHECK_KERNEL_SELF_APPLY_THEOREMS_V0, slake-typecheck-kernelselfapplytheorems,
  slakeTypecheckKernelSelfApplyTheoremsReady,
  kernelCheckLiveKernelSelfApplyTheoremsSource,
  PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS, liveRel, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelSelfApplyTheorems
  Checkable writer: just slake-typecheck-kernelselfapplytheorems
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveKernelSelfApplyTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNEL_SELF_APPLY_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNEL-SELF-APPLY-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.KernelSelfApplyTheorems. -/
def justRecipeSlakeTypecheckKernelSelfApplyTheorems : String :=
  "slake-typecheck-kernelselfapplytheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelSelfApplyTheoremsRel : String :=
  SystemsLean.HostFrontLiveKernelSelfApplyTheorems.liveKernelSelfApplyTheoremsRel

/-- Live basename. Greppable: liveRel. Must be KernelSelfApplyTheorems.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveKernelSelfApplyTheorems.liveRel

/-- Ready names HostFrontLiveKernelSelfApplyTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckKernelSelfApplyTheoremsReady,
    kernelCheckLiveKernelSelfApplyTheoremsSource. -/
def slakeTypecheckKernelSelfApplyTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveKernelSelfApplyTheorems.hostFrontLiveKernelSelfApplyTheoremsReady

/-- Honesty: this command is not lake build of KernelSelfApplyTheorems. -/
def slakeTypecheckKernelSelfApplyTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelSelfApplyTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelSelfApplyTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live KernelSelfApplyTheorems.lean.
    Ready is HostFrontLiveKernelSelfApplyTheorems.hostFrontLiveKernelSelfApplyTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelSelfApplyTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelSelfApplyTheorems} =="
  IO.println s!"  host={hostId} file={liveKernelSelfApplyTheoremsRel} liveRel={liveRel}"
  unless (!slakeTypecheckKernelSelfApplyTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelSelfApplyTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelSelfApplyTheorems.main args
