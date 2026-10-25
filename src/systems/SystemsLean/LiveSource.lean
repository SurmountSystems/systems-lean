/-
  Module: SystemsLean.LiveSource
  One namespace, no imports, a raw string, no main, no theorem.
  The namespace name contains HostFrontLive.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.TopScan

namespace SystemsLean.LiveSource

open SystemsLean.HostTerm
open SystemsLean.TopScan

def parseLiveSource (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsCount sc != 1 then none
    else if !sc.imports.isEmpty then none
    else if sc.rawN == 0 then none
    else if sc.mainN != 0 || sc.theoremN != 0 then none
    else if sc.structN != 0 then none
    else if !hasPart (nsHead sc) "HostFrontLive" then none
    else cmdsOf sc (nsHead sc) true

end SystemsLean.LiveSource
