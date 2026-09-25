/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckKernelSelfApplyTerm.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckKernelSelfApplyTerm. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckKernelSelfApplyTerm
-/

import SystemsLean.HostFrontLiveHostModuleCheckKernelSelfApplyTermSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_KERNEL_SELF_APPLY_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-KERNEL-SELF-APPLY-TERM"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckKernelSelfApplyTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelSelfApplyTermSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckKernelSelfApplyTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelSelfApplyTermSource.hostFrontLiveHostModuleCheckKernelSelfApplyTermSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckKernelSelfApplyTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckKernelSelfApplyTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckKernelSelfApplyTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckKernelSelfApplyTermRel}"
  unless (!slakeTypecheckHostModuleCheckKernelSelfApplyTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelSelfApplyTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckKernelSelfApplyTermSource.main args
