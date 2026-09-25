/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.OccupancyWalk.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Does not import SystemsLean.ElabMeetLive or ElabMeetNamedWalk.
  Not lake build SystemsLean.OccupancyWalk. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckOccupancyWalk
-/

import SystemsLean.HostFrontLiveOccupancyWalkSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_OCCUPANCY_WALK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-OCCUPANCY-WALK"

/-- Live file basename. Not a path. -/
def liveOccupancyWalkRel : String :=
  SystemsLean.HostFrontLiveOccupancyWalk.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckOccupancyWalkReady : Bool :=
  SystemsLean.HostFrontLiveOccupancyWalk.hostFrontLiveOccupancyWalkSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckOccupancyWalkFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckOccupancyWalkOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveOccupancyWalk.liveRel}"
  IO.println s!"  host={hostId} file={liveOccupancyWalkRel}"
  unless (!slakeTypecheckOccupancyWalkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckOccupancyWalkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveOccupancyWalk.main args
