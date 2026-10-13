/-
  Module: SystemsLean.FranciscoIrWriter
  A namespace, at least one theorem, and a main.
  Literal defs are emitted. Theorems are not.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.FranciscoTopScan

namespace SystemsLean.FranciscoIrWriter

open SystemsLean.HostTerm
open SystemsLean.FranciscoTopScan

def parseIrWriter (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsCount sc == 0 then none
    else if sc.theoremN == 0 || sc.mainN == 0 then none
    else if boolSuf sc "FullHost" == some true then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else cmdsOf sc (nsHead sc) true

end SystemsLean.FranciscoIrWriter
