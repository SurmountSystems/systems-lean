/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckParityLinearTermKernel.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckParityLinearTermKernel. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckParityLinearTermKernel
-/

import SystemsLean.HostFrontLiveHostModuleCheckParityLinearTermKernelSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_PARITY_LINEAR_TERM_KERNEL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-PARITY-LINEAR-TERM-KERNEL"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckParityLinearTermKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckParityLinearTermKernelSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckParityLinearTermKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckParityLinearTermKernelSource.hostFrontLiveHostModuleCheckParityLinearTermKernelSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckParityLinearTermKernelFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckParityLinearTermKernelOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckParityLinearTermKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckParityLinearTermKernelRel}"
  unless (!slakeTypecheckHostModuleCheckParityLinearTermKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckParityLinearTermKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckParityLinearTermKernelSource.main args
