/-
  Module: SystemsLean.TheoremSurface
  A namespace, at least one theorem, no main, no structure,
  and no literal Bool or String def.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.TopScan

namespace SystemsLean.TheoremSurface

open SystemsLean.HostTerm
open SystemsLean.TopScan

def parseTheoremSurface (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsCount sc == 0 then none
    else if sc.theoremN == 0 || sc.mainN != 0 then none
    else if sc.structN != 0 then none
    else if litCount sc != 0 then none
    else if boolSuf sc "FullHost" == some true then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else cmdsOf sc (nsHead sc) true

end SystemsLean.TheoremSurface
