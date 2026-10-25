/-
  Module: SystemsLean.StructSurface
  A namespace, a structure, no theorem, no main, no raw string,
  and at least one literal Bool or String def.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.TopScan

namespace SystemsLean.StructSurface

open SystemsLean.HostTerm
open SystemsLean.TopScan

def parseStructSurface (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsCount sc == 0 then none
    else if sc.structN == 0 || sc.theoremN != 0 then none
    else if sc.mainN != 0 || sc.rawN != 0 then none
    else if litCount sc == 0 then none
    else if boolSuf sc "FullHost" == some true then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else cmdsOf sc (nsHead sc) true

end SystemsLean.StructSurface
