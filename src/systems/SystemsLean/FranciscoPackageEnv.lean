/-
  Module: SystemsLean.FranciscoPackageEnv
  Namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvParse.
  No main, no theorem, no raw string, no literal def.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.FranciscoTopScan

namespace SystemsLean.FranciscoPackageEnv

open SystemsLean.HostTerm
open SystemsLean.FranciscoTopScan

def parsePackageEnv (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsHead sc !=
        "SystemsLean.HostFrontLiveHostModuleCheckPackageEnvParse"
      then none
    else if sc.mainN != 0 || sc.theoremN != 0 then none
    else if sc.rawN != 0 || sc.structN != 0 then none
    else if litCount sc != 0 then none
    else if boolSuf sc "FullHost" == some true then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else cmdsOf sc (nsHead sc) true

end SystemsLean.FranciscoPackageEnv
