/-
  Module: SystemsLean.EmitUnitForm
  Shape: namespace SystemsLean.Emit with a form or an import.
  SystemsLean.EmitApply is none. Every other shape is none.
  The file name is not stored.
  A false Bool stays false. Bool true is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.Scan
import SystemsLean.HostTerm

namespace SystemsLean.EmitUnitForm

open SystemsLean.HostTerm
open SystemsLean.Scan

def notApply (ns : String) : Bool :=
  ns != "SystemsLean.EmitApply" &&
    !startsWith ns "SystemsLean.EmitApply."

def shape (f : Fact) : Bool :=
  baseOk f && startsWith f.ns "SystemsLean.Emit" &&
    notApply f.ns && hasBody f

def parse (src : String) : Option Module :=
  match scan src with
  | none => none
  | some f =>
    if shape f then witness f else none

def toySrc : String :=
  "import SystemsLean.EmitBannerScaffold\n" ++
  "namespace SystemsLean.EmitBanner\n" ++
  "end SystemsLean.EmitBanner\n"

def toySome : Bool :=
  match parse toySrc with
  | some _ => true
  | none => false

def applySrc : String :=
  "namespace SystemsLean.EmitApply\n" ++
  "def kept : Bool := false\n" ++
  "end SystemsLean.EmitApply\n"

def applyNone : Bool :=
  match parse applySrc with
  | none => true
  | some _ => false

end SystemsLean.EmitUnitForm
