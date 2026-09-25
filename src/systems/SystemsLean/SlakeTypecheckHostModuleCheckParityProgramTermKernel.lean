/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckParityProgramTermKernel.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckParityProgramTermKernel. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckParityProgramTermKernel
-/

import SystemsLean.HostFrontLiveHostModuleCheckParityProgramTermKernelSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_PARITY_PROGRAM_TERM_KERNEL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-PARITY-PROGRAM-TERM-KERNEL"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckParityProgramTermKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckParityProgramTermKernelSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckParityProgramTermKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckParityProgramTermKernelSource.hostFrontLiveHostModuleCheckParityProgramTermKernelSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckParityProgramTermKernelFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckParityProgramTermKernelOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckParityProgramTermKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckParityProgramTermKernelRel}"
  unless (!slakeTypecheckHostModuleCheckParityProgramTermKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckParityProgramTermKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckParityProgramTermKernelSource.main args
