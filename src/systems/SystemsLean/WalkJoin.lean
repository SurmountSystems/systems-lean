/-
  Module: SystemsLean.WalkJoin
  HostFrontLive namespace containing OccupancyWalk, an append,
  a main, no raw string, no HostFrontLiveHostTerm import.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.TopScan

namespace SystemsLean.WalkJoin

open SystemsLean.HostTerm
open SystemsLean.TopScan

def parseWalkJoin (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if !hasPart (nsHead sc) "OccupancyWalk" then none
    else if !hasPart (nsHead sc) "HostFrontLive" then none
    else if !sc.hasAppend then none
    else if sc.rawN != 0 || sc.mainN == 0 then none
    else if sc.theoremN != 0 then none
    else if hasImp sc "HostFrontLiveHostTerm" then none
    else if boolSuf sc "FullHost" == some true then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else cmdsOf sc (nsHead sc) true

end SystemsLean.WalkJoin
