/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckParityTypesTermKernel.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckParityTypesTermKernel. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckParityTypesTermKernel
-/

import SystemsLean.HostFrontLiveHostModuleCheckParityTypesTermKernelSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_PARITY_TYPES_TERM_KERNEL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-PARITY-TYPES-TERM-KERNEL"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckParityTypesTermKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckParityTypesTermKernelSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckParityTypesTermKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckParityTypesTermKernelSource.hostFrontLiveHostModuleCheckParityTypesTermKernelSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckParityTypesTermKernelFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckParityTypesTermKernelOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckParityTypesTermKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckParityTypesTermKernelRel}"
  unless (!slakeTypecheckHostModuleCheckParityTypesTermKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckParityTypesTermKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckParityTypesTermKernelSource.main args
