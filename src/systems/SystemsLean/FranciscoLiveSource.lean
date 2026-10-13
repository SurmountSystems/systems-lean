/-
  Module: SystemsLean.FranciscoLiveSource
  One namespace, no imports, a raw string, no main, no theorem.
  The namespace name contains HostFrontLive.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.FranciscoTopScan

namespace SystemsLean.FranciscoLiveSource

open SystemsLean.HostTerm
open SystemsLean.FranciscoTopScan

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

end SystemsLean.FranciscoLiveSource
