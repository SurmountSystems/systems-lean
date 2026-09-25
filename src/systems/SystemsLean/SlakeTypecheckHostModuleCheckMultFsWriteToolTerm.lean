/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckMultFsWriteToolTerm.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckMultFsWriteToolTerm. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckMultFsWriteToolTerm
-/

import SystemsLean.HostFrontLiveHostModuleCheckMultFsWriteToolTermSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_MULT_FS_WRITE_TOOL_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-MULT-FS-WRITE-TOOL-TERM"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckMultFsWriteToolTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckMultFsWriteToolTermSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckMultFsWriteToolTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckMultFsWriteToolTermSource.hostFrontLiveHostModuleCheckMultFsWriteToolTermSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckMultFsWriteToolTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckMultFsWriteToolTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckMultFsWriteToolTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckMultFsWriteToolTermRel}"
  unless (!slakeTypecheckHostModuleCheckMultFsWriteToolTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckMultFsWriteToolTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckMultFsWriteToolTermSource.main args
