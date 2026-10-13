/-
  Module: SystemsLean.FranciscoWalkJoin
  HostFrontLive namespace containing OccupancyWalk, an append,
  a main, no raw string, no HostFrontLiveHostTerm import.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.FranciscoTopScan

namespace SystemsLean.FranciscoWalkJoin

open SystemsLean.HostTerm
open SystemsLean.FranciscoTopScan

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

end SystemsLean.FranciscoWalkJoin
