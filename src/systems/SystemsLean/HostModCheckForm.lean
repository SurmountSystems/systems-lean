/-
  Module: SystemsLean.HostModCheckForm
  Shape: namespace SystemsLean.HostModuleCheck with a top-level form.
  Every other shape is none. The file name is not stored.
  A false Bool stays false. Bool true is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
-/

import SystemsLean.Scan
import SystemsLean.HostTerm

namespace SystemsLean.HostModCheckForm

open SystemsLean.HostTerm
open SystemsLean.Scan

def shape (f : Fact) : Bool :=
  baseOk f && f.ns == "SystemsLean.HostModuleCheck" && hasForm f

def parse (src : String) : Option Module :=
  match scan src with
  | none => none
  | some f =>
    if shape f then witness f else none

def toySrc : String :=
  "namespace SystemsLean.HostModuleCheck\n" ++
  "def kept : Bool := false\n" ++
  "end SystemsLean.HostModuleCheck\n"

def toySome : Bool :=
  match parse toySrc with
  | some _ => true
  | none => false

def siblingSrc : String :=
  "namespace SystemsLean.HostImportGraph\n" ++
  "def kept : Bool := false\n" ++
  "end SystemsLean.HostImportGraph\n"

def siblingNone : Bool :=
  match parse siblingSrc with
  | none => true
  | some _ => false

end SystemsLean.HostModCheckForm
