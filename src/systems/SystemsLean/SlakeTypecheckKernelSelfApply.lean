/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.KernelSelfApply.
  Short role: named driver for lean --run of live KernelSelfApply.lean parse.
  Ready is HostFrontLiveKernelSelfApply parse plus HostKernel.kernelCheck of live
  KernelSelfApply.lean, not := true, not lake build SystemsLean.KernelSelfApply.
  Not mill. Not occupancy name 50. Not FullHost. Not mill remill of mill 69.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69. Occupancy stays 49.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNEL-SELF-APPLY,
  SLAKE_TYPECHECK_KERNEL_SELF_APPLY_V0, slake-typecheck-kernelselfapply,
  slakeTypecheckKernelSelfApplyReady, kernelCheckLiveKernelSelfApplySource,
  PARSE-LIVE-KERNEL-SELF-APPLY, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelSelfApply
  Checkable writer: lean --run this file (no mill; no lake on the step).
-/

import SystemsLean.HostFrontLiveKernelSelfApply

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNEL_SELF_APPLY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNEL-SELF-APPLY"

/-- Named just recipe string. Dest just module is not imported from the root justfile. -/
def justRecipeSlakeTypecheckKernelSelfApply : String :=
  "slake-typecheck-kernelselfapply"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelSelfApplyRel : String :=
  SystemsLean.HostFrontLiveKernelSelfApply.liveKernelSelfApplyRel

/-- Ready names HostFrontLiveKernelSelfApply parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckKernelSelfApplyReady,
    kernelCheckLiveKernelSelfApplySource. -/
def slakeTypecheckKernelSelfApplyReady : Bool :=
  SystemsLean.HostFrontLiveKernelSelfApply.hostFrontLiveKernelSelfApplyReady

/-- Honesty: this command is not lake build of KernelSelfApply. -/
def slakeTypecheckKernelSelfApplyDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelSelfApplyFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelSelfApplyOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live KernelSelfApply.lean.
    Ready is HostFrontLiveKernelSelfApply.hostFrontLiveKernelSelfApplyReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelSelfApply.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelSelfApply} =="
  IO.println s!"  host={hostId} liveRel={SystemsLean.HostFrontLiveKernelSelfApply.liveRel} file={liveKernelSelfApplyRel}"
  unless (!slakeTypecheckKernelSelfApplyFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelSelfApplyOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelSelfApply.main args
