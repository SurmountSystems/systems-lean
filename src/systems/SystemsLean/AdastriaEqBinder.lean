/-
  Module: SystemsLean.AdastriaEqBinder
  Shape: namespace SystemsLean.EqSomeBinder with a structure.
  Every other shape is none. The file name is not stored.
  A false Bool stays false. Bool true is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  The scan treats a character literal, a nested block comment, and a
  raw string as themselves, so this binder does not rewrite the source.
-/

import SystemsLean.AdastriaScan
import SystemsLean.HostTerm

namespace SystemsLean.AdastriaEqBinder

open SystemsLean.HostTerm
open SystemsLean.AdastriaScan

def shape (f : Fact) : Bool :=
  baseOk f && f.ns == "SystemsLean.EqSomeBinder" && f.sawStruct

def parse (src : String) : Option Module :=
  match scan src with
  | none => none
  | some f =>
    if shape f then witness f else none

def toySrc : String :=
  "namespace SystemsLean.EqSomeBinder\n" ++
  "structure AppliedName where\n" ++
  "end SystemsLean.EqSomeBinder\n"

def toySome : Bool :=
  match parse toySrc with
  | some _ => true
  | none => false

def siblingSrc : String :=
  "namespace SystemsLean.ElabMeet\n" ++
  "structure AppliedName where\n" ++
  "end SystemsLean.ElabMeet\n"

def siblingNone : Bool :=
  match parse siblingSrc with
  | none => true
  | some _ => false

def quoteCharSrc : String :=
  "namespace SystemsLean.EqSomeBinder\n" ++
  "structure AppliedName where\n" ++
  "def mark : Char := '\"'\n" ++
  "end SystemsLean.EqSomeBinder\n"

def quoteCharSome : Bool :=
  match parse quoteCharSrc with
  | some _ => true
  | none => false

def nestBlkSrc : String :=
  "namespace SystemsLean.EqSomeBinder\n" ++
  "structure AppliedName where\n" ++
  "def mark : Bool := /- outer /- \" -/ still \" -/\n" ++
  "end SystemsLean.EqSomeBinder\n"

def nestBlkSome : Bool :=
  match parse nestBlkSrc with
  | some _ => true
  | none => false

def rawZeroSrc : String :=
  "namespace SystemsLean.EqSomeBinder\n" ++
  "structure AppliedName where\n" ++
  "def mark : String := r\"foo\\\"\n" ++
  "end SystemsLean.EqSomeBinder\n"

def rawZeroSome : Bool :=
  match parse rawZeroSrc with
  | some _ => true
  | none => false

end SystemsLean.AdastriaEqBinder
