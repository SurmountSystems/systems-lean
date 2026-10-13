/-
  Module: SystemsLean.FranciscoEmbeddedMain
  HostFrontLive namespace, HostTerm and HostKernel imports,
  a raw string, and a main. No theorem.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.FranciscoTopScan

namespace SystemsLean.FranciscoEmbeddedMain

open SystemsLean.HostTerm
open SystemsLean.FranciscoTopScan

def parseEmbeddedMain (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsCount sc == 0 then none
    else if !hasPart (nsHead sc) "HostFrontLive" then none
    else if !hasImp sc "HostFrontLiveHostTerm" then none
    else if !hasImp sc "HostKernel" then none
    else if sc.rawN == 0 || sc.mainN == 0 then none
    else if sc.theoremN != 0 then none
    else if boolSuf sc "FullHost" == some true then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else cmdsOf sc (nsHead sc) true

end SystemsLean.FranciscoEmbeddedMain
