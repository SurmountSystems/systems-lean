/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckLinearProof.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckLinearProof. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckLinearProof
-/

import SystemsLean.HostFrontLiveHostModuleCheckLinearProofSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_LINEAR_PROOF_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-LINEAR-PROOF"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckLinearProofRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckLinearProofSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckLinearProofReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckLinearProofSource.hostFrontLiveHostModuleCheckLinearProofSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckLinearProofFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckLinearProofOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckLinearProofSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckLinearProofRel}"
  unless (!slakeTypecheckHostModuleCheckLinearProofFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLinearProofOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckLinearProofSource.main args
