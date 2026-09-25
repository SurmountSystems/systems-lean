/-
  SYSTEMS_LEAN_HOST partial -- live OccupancyWalk.lean.
  Join of HostFrontLiveOccupancyWalkSource01 and Source02.
  This checker does not import SystemsLean.OccupancyProbe.
  This checker does not import SystemsLean.ElabMeetLive or ElabMeetNamedWalk.
  Those names stay inside the pinned text. Not a compile of the probe.
  liveRel is OccupancyWalk.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveOccupancyWalkSource,
  PARSE-LIVE-OCCUPANCY-WALK.
  Module: SystemsLean.HostFrontLiveOccupancyWalkSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostFrontLiveOccupancyWalkSource01
import SystemsLean.HostFrontLiveOccupancyWalkSource02

namespace SystemsLean.HostFrontLiveOccupancyWalk

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "OccupancyWalk.lean"

/-- Pinned live OccupancyWalk.lean bytes. -/
def liveOccupancyWalkSource : String :=
  liveOccupancyWalkSourcePart01 ++ liveOccupancyWalkSourcePart02

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true.
    Theorems and defs skip-fold. The probe is not compiled. -/
def kernelCheckLiveOccupancyWalkSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveOccupancyWalkSourceReady : Bool :=
  liveRel == "OccupancyWalk.lean"
    && kernelCheckLiveOccupancyWalkSource liveOccupancyWalkSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveOccupancyWalkSource then
    throw (IO.userError "dual-pin mismatch OccupancyWalk.lean")
  let k := kernelCheckLiveOccupancyWalkSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live OccupancyWalk parse false")
  unless hostFrontLiveOccupancyWalkSourceReady do
    throw (IO.userError "ready false")

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveOccupancyWalk
