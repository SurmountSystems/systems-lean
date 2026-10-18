/-
  Module: SystemsLean.ProductSurface
  A namespace other than SystemsLean.LlvmCfgFixture,
  literal defs, no theorem, no main, no structure, no raw string.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.TopScan

namespace SystemsLean.ProductSurface

open SystemsLean.HostTerm
open SystemsLean.TopScan

def parseProductSurface (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsCount sc == 0 then none
    else if nsHead sc == "SystemsLean.LlvmCfgFixture" then none
    else if sc.theoremN != 0 || sc.mainN != 0 then none
    else if sc.structN != 0 || sc.rawN != 0 then none
    else if litCount sc == 0 then none
    else if boolSuf sc "FullHost" == some true then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else cmdsOf sc (nsHead sc) true

end SystemsLean.ProductSurface
