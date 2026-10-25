/-
  Module: SystemsLean.LiveParser
  HostFrontLive namespace, HostTerm and HostKernel imports,
  one further HostFrontLive import, no raw string, a main.
  FullHost is false. No theorem and no structure.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.TopScan

namespace SystemsLean.LiveParser

open SystemsLean.HostTerm
open SystemsLean.TopScan

def otherLive (sc : Scan) : Bool :=
  sc.imports.any (fun m =>
    hasPart m "HostFrontLive" &&
      !hasPart m "HostFrontLiveHostTerm")

def parseLiveParser (src : String) : Option Module :=
  match scanSource src with
  | none => none
  | some sc =>
    if nsCount sc == 0 then none
    else if !hasPart (nsHead sc) "HostFrontLive" then none
    else if !hasImp sc "HostFrontLiveHostTerm" then none
    else if !hasImp sc "HostKernel" then none
    else if !otherLive sc then none
    else if sc.rawN != 0 || sc.mainN == 0 then none
    else if sc.theoremN != 0 || sc.structN != 0 then none
    else if boolSuf sc "FullHost" != some false then none
    else if boolSuf sc "OwnsPackageTypecheck" == some true then none
    else cmdsOf sc (nsHead sc) true

end SystemsLean.LiveParser
