/-
  Module: SystemsLean.PinnedChecker
  HostFrontLive namespace, imports, a raw string, and a main.
  No HostFrontLiveHostTerm import. No theorem and no structure.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.TopScan

namespace SystemsLean.PinnedChecker

open SystemsLean.HostTerm
open SystemsLean.TopScan

def parsePinnedChecker (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsCount sc == 0 then none
    else if !hasPart (nsHead sc) "HostFrontLive" then none
    else if sc.imports.isEmpty then none
    else if hasImp sc "HostFrontLiveHostTerm" then none
    else if sc.rawN == 0 || sc.mainN == 0 then none
    else if sc.theoremN != 0 || sc.structN != 0 then none
    else if boolSuf sc "FullHost" == some true then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else cmdsOf sc (nsHead sc) true

end SystemsLean.PinnedChecker
