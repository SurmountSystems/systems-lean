/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckKernelTypesProof.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckKernelTypesProof. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckKernelTypesProof
-/

import SystemsLean.HostFrontLiveHostModuleCheckKernelTypesProofSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_KERNEL_TYPES_PROOF_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-KERNEL-TYPES-PROOF"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckKernelTypesProofRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelTypesProofSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckKernelTypesProofReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelTypesProofSource.hostFrontLiveHostModuleCheckKernelTypesProofSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckKernelTypesProofFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckKernelTypesProofOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckKernelTypesProofSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckKernelTypesProofRel}"
  unless (!slakeTypecheckHostModuleCheckKernelTypesProofFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelTypesProofOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckKernelTypesProofSource.main args
