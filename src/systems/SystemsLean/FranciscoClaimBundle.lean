/-
  Module: SystemsLean.FranciscoClaimBundle
  A namespace, at least one theorem, no main, no structure,
  and at least one literal Bool or String def.
  None when the source has a mutual block, a theorem or example proved
  with by, decide, or native_decide, or a def that is not literal Bool or String.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.FranciscoTopScan

namespace SystemsLean.FranciscoClaimBundle

open SystemsLean.HostTerm
open SystemsLean.FranciscoTopScan

def parseClaimBundle (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsCount sc == 0 then none
    else if sc.theoremN == 0 || sc.mainN != 0 then none
    else if sc.structN != 0 then none
    else if litCount sc == 0 then none
    else if boolSuf sc "FullHost" == some true then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else if sc.hasDrop then none
    else cmdsOf sc (nsHead sc) true

end SystemsLean.FranciscoClaimBundle
