/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckKernelProgramProof.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckKernelProgramProof. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckKernelProgramProof
-/

import SystemsLean.HostFrontLiveHostModuleCheckKernelProgramProofSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_KERNEL_PROGRAM_PROOF_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-KERNEL-PROGRAM-PROOF"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckKernelProgramProofRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelProgramProofSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckKernelProgramProofReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelProgramProofSource.hostFrontLiveHostModuleCheckKernelProgramProofSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckKernelProgramProofFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckKernelProgramProofOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckKernelProgramProofSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckKernelProgramProofRel}"
  unless (!slakeTypecheckHostModuleCheckKernelProgramProofFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelProgramProofOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckKernelProgramProofSource.main args
