/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckKernelLinearTerm.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckKernelLinearTerm. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckKernelLinearTerm
-/

import SystemsLean.HostFrontLiveHostModuleCheckKernelLinearTermSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_KERNEL_LINEAR_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-KERNEL-LINEAR-TERM"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckKernelLinearTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelLinearTermSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckKernelLinearTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelLinearTermSource.hostFrontLiveHostModuleCheckKernelLinearTermSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckKernelLinearTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckKernelLinearTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckKernelLinearTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckKernelLinearTermRel}"
  unless (!slakeTypecheckHostModuleCheckKernelLinearTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelLinearTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckKernelLinearTermSource.main args
