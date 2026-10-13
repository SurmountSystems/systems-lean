/-
  Module: SystemsLean.AdastriaFsEmitLoad
  Shape: namespace SystemsLean.FreestandingEmit and def
  dualSsotEqualityGateId. A use of that name is none.
  Every other shape is none. The file name is not stored.
  A false Bool stays false. Bool true is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
-/

import SystemsLean.AdastriaScan
import SystemsLean.HostTerm

namespace SystemsLean.AdastriaFsEmitLoad

open SystemsLean.HostTerm
open SystemsLean.AdastriaScan

def shape (f : Fact) : Bool :=
  baseOk f && f.ns == "SystemsLean.FreestandingEmit" &&
    f.sawLoadGate

def parse (src : String) : Option Module :=
  match scan src with
  | none => none
  | some f =>
    if shape f then witness f else none

def toySrc : String :=
  "namespace SystemsLean.FreestandingEmit\n" ++
  "def dualSsotEqualityGateId : String := \"DUAL\"\n" ++
  "end SystemsLean.FreestandingEmit\n"

def toySome : Bool :=
  match parse toySrc with
  | some _ => true
  | none => false

def otherSrc : String :=
  "namespace SystemsLean.FreestandingEmit\n" ++
  "def stageId : String := \"X\"\n" ++
  "end SystemsLean.FreestandingEmit\n"

def otherNone : Bool :=
  match parse otherSrc with
  | none => true
  | some _ => false

end SystemsLean.AdastriaFsEmitLoad
