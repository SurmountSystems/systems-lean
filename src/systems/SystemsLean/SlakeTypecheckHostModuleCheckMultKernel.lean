/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckMultKernel.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckMultKernel. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckMultKernel
-/

import SystemsLean.HostFrontLiveHostModuleCheckMultKernelSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_MULT_KERNEL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-MULT-KERNEL"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckMultKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckMultKernelSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckMultKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckMultKernelSource.hostFrontLiveHostModuleCheckMultKernelSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckMultKernelFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckMultKernelOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckMultKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckMultKernelRel}"
  unless (!slakeTypecheckHostModuleCheckMultKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckMultKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckMultKernelSource.main args
