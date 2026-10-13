/-
  Module: SystemsLean.FranciscoStringAlias
  Two or more namespaces, no imports, a raw string, no main.
  The first namespace name contains HostFrontLive.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.FranciscoTopScan

namespace SystemsLean.FranciscoStringAlias

open SystemsLean.HostTerm
open SystemsLean.FranciscoTopScan

def parseStringAlias (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsCount sc < 2 then none
    else if !sc.imports.isEmpty then none
    else if sc.rawN == 0 || sc.mainN != 0 then none
    else if sc.theoremN != 0 || sc.structN != 0 then none
    else if !hasPart (nsHead sc) "HostFrontLive" then none
    else if boolSuf sc "FullHost" == some true then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else cmdsOf sc (nsHead sc) true

end SystemsLean.FranciscoStringAlias
