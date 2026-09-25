/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckPackageWriteKernel.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckPackageWriteKernel. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageWriteKernel
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageWriteKernelSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_PACKAGE_WRITE_KERNEL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-PACKAGE-WRITE-KERNEL"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckPackageWriteKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageWriteKernelSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckPackageWriteKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageWriteKernelSource.hostFrontLiveHostModuleCheckPackageWriteKernelSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageWriteKernelFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageWriteKernelOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageWriteKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageWriteKernelRel}"
  unless (!slakeTypecheckHostModuleCheckPackageWriteKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageWriteKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageWriteKernelSource.main args
