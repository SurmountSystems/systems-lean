/-
  Module: SystemsLean.AdastriaEqBinder
  Shape: namespace SystemsLean.EqSomeBinder with a structure.
  Every other shape is none. The file name is not stored.
  A false Bool stays false. Bool true is not emitted.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  A character literal whose body is a double quote is rewritten
  before the scan, because the shared scan treats that quote as a string.
-/

import SystemsLean.AdastriaScan
import SystemsLean.HostTerm

namespace SystemsLean.AdastriaEqBinder

open SystemsLean.HostTerm
open SystemsLean.AdastriaScan

def shape (f : Fact) : Bool :=
  baseOk f && f.ns == "SystemsLean.EqSomeBinder" && f.sawStruct

def rewriteQuoteChar : List Char -> List Char
  | [] => []
  | '\'' :: '"' :: '\'' :: rest =>
    '\'' :: 'q' :: '\'' :: rewriteQuoteChar rest
  | c :: rest => c :: rewriteQuoteChar rest

def parse (src : String) : Option Module :=
  match scan (String.ofList (rewriteQuoteChar src.toList)) with
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

end SystemsLean.AdastriaEqBinder
