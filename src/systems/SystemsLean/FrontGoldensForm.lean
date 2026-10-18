/-
  Module: SystemsLean.FrontGoldensForm
  Shape: namespace SystemsLean.HostFront and def goodG1Text.
  The same namespace without that def is none.
  Every other shape is none. The file name is not stored.
  A false Bool stays false. Bool true is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
-/

import SystemsLean.Scan
import SystemsLean.HostTerm

namespace SystemsLean.FrontGoldensForm

open SystemsLean.HostTerm
open SystemsLean.Scan

def shape (f : Fact) : Bool :=
  baseOk f && f.ns == "SystemsLean.HostFront" && f.sawGoodG1

def parse (src : String) : Option Module :=
  match scan src with
  | none => none
  | some f =>
    if shape f then witness f else none

def toySrc : String :=
  "namespace SystemsLean.HostFront\n" ++
  "def goodG1Text : String := \"g1\"\n" ++
  "end SystemsLean.HostFront\n"

def toySome : Bool :=
  match parse toySrc with
  | some _ => true
  | none => false

def otherSrc : String :=
  "namespace SystemsLean.HostFront\n" ++
  "def hostFrontResidualFreeClaimed : Bool := false\n" ++
  "end SystemsLean.HostFront\n"

def otherNone : Bool :=
  match parse otherSrc with
  | none => true
  | some _ => false

end SystemsLean.FrontGoldensForm
