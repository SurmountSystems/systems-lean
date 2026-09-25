/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckMultTheoremsKernel.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckMultTheoremsKernel. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckMultTheoremsKernel
-/

import SystemsLean.HostFrontLiveHostModuleCheckMultTheoremsKernelSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_MULT_THEOREMS_KERNEL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-MULT-THEOREMS-KERNEL"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckMultTheoremsKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckMultTheoremsKernelSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckMultTheoremsKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckMultTheoremsKernelSource.hostFrontLiveHostModuleCheckMultTheoremsKernelSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckMultTheoremsKernelFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckMultTheoremsKernelOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckMultTheoremsKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckMultTheoremsKernelRel}"
  unless (!slakeTypecheckHostModuleCheckMultTheoremsKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckMultTheoremsKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckMultTheoremsKernelSource.main args
