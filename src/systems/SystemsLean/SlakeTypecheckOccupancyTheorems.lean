/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.OccupancyTheorems.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.OccupancyTheorems. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckOccupancyTheorems
-/

import SystemsLean.HostFrontLiveOccupancyTheoremsSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_OCCUPANCY_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-OCCUPANCY-THEOREMS"

/-- Live file basename. Not a path. -/
def liveOccupancyTheoremsRel : String :=
  SystemsLean.HostFrontLiveOccupancyTheoremsSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckOccupancyTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveOccupancyTheoremsSource.hostFrontLiveOccupancyTheoremsSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckOccupancyTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckOccupancyTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveOccupancyTheoremsSource.liveRel}"
  IO.println s!"  host={hostId} file={liveOccupancyTheoremsRel}"
  unless (!slakeTypecheckOccupancyTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckOccupancyTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveOccupancyTheoremsSource.main args
