/-
  Module: SystemsLean.PathProject
  Namespace SystemsLean.ProductPath, imports, no literal def,
  no theorem, no main, no structure, no raw string.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.TopScan

namespace SystemsLean.PathProject

open SystemsLean.HostTerm
open SystemsLean.TopScan

def parsePathProject (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsHead sc != "SystemsLean.ProductPath" then none
    else if sc.imports.isEmpty then none
    else if litCount sc != 0 then none
    else if sc.theoremN != 0 || sc.mainN != 0 then none
    else if sc.rawN != 0 || sc.structN != 0 then none
    else if boolSuf sc "FullHost" == some true then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else cmdsOf sc (nsHead sc) true

end SystemsLean.PathProject
