/-
  Module: SystemsLean.HostImportForm
  Shape: namespace SystemsLean.HostImportGraph with a form or an import.
  Every other shape is none. The file name is not stored.
  A false Bool stays false. Bool true is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.Scan
import SystemsLean.HostTerm

namespace SystemsLean.HostImportForm

open SystemsLean.HostTerm
open SystemsLean.Scan

def shape (f : Fact) : Bool :=
  baseOk f && f.ns == "SystemsLean.HostImportGraph" && hasBody f

def parse (src : String) : Option Module :=
  match scan src with
  | none => none
  | some f =>
    if shape f then witness f else none

def toySrc : String :=
  "import SystemsLean.HostImportGraphSeeds\n" ++
  "namespace SystemsLean.HostImportGraph\n" ++
  "end SystemsLean.HostImportGraph\n"

def toySome : Bool :=
  match parse toySrc with
  | some _ => true
  | none => false

def siblingSrc : String :=
  "namespace SystemsLean.HostModuleCheck\n" ++
  "def kept : Bool := false\n" ++
  "end SystemsLean.HostModuleCheck\n"

def siblingNone : Bool :=
  match parse siblingSrc with
  | none => true
  | some _ => false

end SystemsLean.HostImportForm
