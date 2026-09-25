/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckMultFsDeepenTerm.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckMultFsDeepenTerm. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckMultFsDeepenTerm
-/

import SystemsLean.HostFrontLiveHostModuleCheckMultFsDeepenTermSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_MULT_FS_DEEPEN_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-MULT-FS-DEEPEN-TERM"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckMultFsDeepenTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckMultFsDeepenTermSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckMultFsDeepenTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckMultFsDeepenTermSource.hostFrontLiveHostModuleCheckMultFsDeepenTermSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckMultFsDeepenTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckMultFsDeepenTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckMultFsDeepenTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckMultFsDeepenTermRel}"
  unless (!slakeTypecheckHostModuleCheckMultFsDeepenTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckMultFsDeepenTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckMultFsDeepenTermSource.main args
