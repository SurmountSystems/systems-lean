/-
  Module: SystemsLean.AdastriaElabMeet
  Shape: namespace SystemsLean.ElabMeet with a form or an import.
  Every other shape is none. The file name is not stored.
  A false Bool stays false. Bool true is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
-/

import SystemsLean.AdastriaScan
import SystemsLean.HostTerm

namespace SystemsLean.AdastriaElabMeet

open SystemsLean.HostTerm
open SystemsLean.AdastriaScan

def shape (f : Fact) : Bool :=
  baseOk f && f.ns == "SystemsLean.ElabMeet" && hasBody f

def parse (src : String) : Option Module :=
  match scan src with
  | none => none
  | some f =>
    if shape f then witness f else none

def toySrc : String :=
  "namespace SystemsLean.ElabMeet\n" ++
  "def kept : Bool := false\n" ++
  "end SystemsLean.ElabMeet\n"

def toyFalse : Bool :=
  match parse toySrc with
  | some m =>
    match m.commands with
    | Cmd.namespace _ ::
        Cmd.def_ nm (some HostType.bool) (Term.litBool false) ::
        Cmd.endNamespace _ :: [] =>
      nm.raw == "kept"
    | _ => false
  | none => false

def siblingSrc : String :=
  "namespace SystemsLean.DualEqWriteParity\n" ++
  "def hostElaboratorResidualRemains : Bool := false\n" ++
  "end SystemsLean.DualEqWriteParity\n"

def siblingNone : Bool :=
  match parse siblingSrc with
  | none => true
  | some _ => false

end SystemsLean.AdastriaElabMeet
