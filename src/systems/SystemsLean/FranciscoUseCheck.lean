/-
  Module: SystemsLean.FranciscoUseCheck
  Namespace SystemsLean.UseCheck, a structure, and a theorem.
  No main and no raw string.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.FranciscoTopScan

namespace SystemsLean.FranciscoUseCheck

open SystemsLean.HostTerm
open SystemsLean.FranciscoTopScan

def parseUseCheck (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsHead sc != "SystemsLean.UseCheck" then none
    else if sc.structN == 0 || sc.theoremN == 0 then none
    else if sc.mainN != 0 || sc.rawN != 0 then none
    else if boolSuf sc "FullHost" == some true then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else cmdsOf sc (nsHead sc) true

end SystemsLean.FranciscoUseCheck
