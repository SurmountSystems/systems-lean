/-
  Module: SystemsLean.HonestyStrCatFront
  Same Nat-claim shape as HonestyNatClaimFront, plus a `++` token.
  Imports, then a namespace, at least one Nat literal def, at least one
  Bool def whose body is the literal false, and one Bool def whose body
  is not a lone literal. A String def may join string pieces with `++`.
  That String def is skipped. It is not emitted.
  Theorems may be rfl of a Nat pin, rfl that does not reduce, by decide,
  or by native_decide. set_option is skipped.
  The namespace is the one written. The file name is not hardcoded.
  A false Bool stays false. Bool true is not a stand-in.
  A lone Bool true def is none. The false Bool is emitted as false.
  A namespace file with no import is none.
  A miss of this shape tries the tactic form.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront
import SystemsLean.HonestyNatClaimFront
import SystemsLean.TacticForm

namespace SystemsLean.HonestyStrCatFront

open SystemsLean.HonestyFront (strip SMode isIdentChar isLetter isDigit isWs)
open SystemsLean.HonestyNatClaimFront (parseToks)

def tokFuel : Nat := 200000

def emitId (acc : List String) (cur : List Char) : List String :=
  String.mk cur.reverse :: acc

def emitStr (acc : List String) (cur : List Char) : List String :=
  String.mk ('"' :: cur.reverse ++ ['"']) :: acc

inductive TMode where
  | norm
  | id (cur : List Char)
  | num (cur : List Char)
  | str (cur : List Char)

def tok (fuel : Nat) (cs : List Char) (mode : TMode) (acc : List String) :
    Option (List String) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match cs, mode with
    | [], TMode.norm => some acc.reverse
    | [], TMode.id cur => some (emitId acc cur).reverse
    | [], TMode.num cur => some (emitId acc cur).reverse
    | [], TMode.str _ => none
    | '"' :: rest, TMode.str cur =>
      tok k rest TMode.norm (emitStr acc cur)
    | c :: rest, TMode.str cur =>
      tok k rest (TMode.str (c :: cur)) acc
    | ':' :: '=' :: rest, TMode.norm =>
      tok k rest TMode.norm (":=" :: acc)
    | ':' :: ':' :: rest, TMode.norm =>
      tok k rest TMode.norm ("::" :: acc)
    | '=' :: '>' :: rest, TMode.norm =>
      tok k rest TMode.norm ("=>" :: acc)
    | '=' :: '=' :: rest, TMode.norm =>
      tok k rest TMode.norm ("==" :: acc)
    | '=' :: rest, TMode.norm =>
      tok k rest TMode.norm ("=" :: acc)
    | '&' :: '&' :: rest, TMode.norm =>
      tok k rest TMode.norm ("&&" :: acc)
    | '|' :: '|' :: rest, TMode.norm =>
      tok k rest TMode.norm ("||" :: acc)
    | '|' :: rest, TMode.norm =>
      tok k rest TMode.norm ("|" :: acc)
    | '<' :: '=' :: rest, TMode.norm =>
      tok k rest TMode.norm ("<=" :: acc)
    | '<' :: '-' :: rest, TMode.norm =>
      tok k rest TMode.norm ("<-" :: acc)
    | '<' :: rest, TMode.norm =>
      tok k rest TMode.norm ("<" :: acc)
    | '>' :: '=' :: rest, TMode.norm =>
      tok k rest TMode.norm (">=" :: acc)
    | '-' :: '>' :: rest, TMode.norm =>
      tok k rest TMode.norm ("->" :: acc)
    | '-' :: rest, TMode.norm =>
      tok k rest TMode.norm ("-" :: acc)
    | '!' :: rest, TMode.norm =>
      tok k rest TMode.norm ("!" :: acc)
    | '>' :: rest, TMode.norm =>
      tok k rest TMode.norm (">" :: acc)
    | '/' :: rest, TMode.norm =>
      tok k rest TMode.norm ("/" :: acc)
    | '+' :: '+' :: rest, TMode.norm =>
      tok k rest TMode.norm ("++" :: acc)
    | '+' :: rest, TMode.norm =>
      tok k rest TMode.norm ("+" :: acc)
    | '\\' :: rest, TMode.norm =>
      tok k rest TMode.norm ("\\" :: acc)
    | '[' :: rest, TMode.norm =>
      tok k rest TMode.norm ("[" :: acc)
    | ']' :: rest, TMode.norm =>
      tok k rest TMode.norm ("]" :: acc)
    | '{' :: rest, TMode.norm =>
      tok k rest TMode.norm ("{" :: acc)
    | '}' :: rest, TMode.norm =>
      tok k rest TMode.norm ("}" :: acc)
    | ',' :: rest, TMode.norm =>
      tok k rest TMode.norm ("," :: acc)
    | ':' :: rest, TMode.norm =>
      tok k rest TMode.norm (":" :: acc)
    | '(' :: rest, TMode.norm =>
      tok k rest TMode.norm ("(" :: acc)
    | ')' :: rest, TMode.norm =>
      tok k rest TMode.norm (")" :: acc)
    | '.' :: rest, TMode.norm =>
      tok k rest TMode.norm ("." :: acc)
    | '"' :: rest, TMode.norm =>
      tok k rest (TMode.str []) acc
    | c :: rest, TMode.norm =>
      if isWs c then tok k rest TMode.norm acc
      else if isLetter c || c == '_' then
        tok k rest (TMode.id [c]) acc
      else if isDigit c then
        tok k rest (TMode.num [c]) acc
      else
        none
    | c :: rest, TMode.id cur =>
      if isIdentChar c then tok k rest (TMode.id (c :: cur)) acc
      else tok k (c :: rest) TMode.norm (emitId acc cur)
    | c :: rest, TMode.num cur =>
      if isDigit c then tok k rest (TMode.num (c :: cur)) acc
      else tok k (c :: rest) TMode.norm (emitId acc cur)
termination_by fuel

def ownParse (src : String) :
    Option SystemsLean.HostTerm.Module :=
  match strip src.toList SMode.code [] with
  | none => none
  | some kept =>
    match tok tokFuel kept TMode.norm [] with
    | none => none
    | some ts => parseToks ts

def parseHonestyStrCatText (src : String) :
    Option SystemsLean.HostTerm.Module :=
  match ownParse src with
  | some m => some m
  | none =>
    SystemsLean.TacticForm.parseTacticForm src

def tacticFallbackSome : Bool :=
  match parseHonestyStrCatText (
      "import SystemsLean.HostTerm\n"
        ++ "namespace SystemsLean.Toy\n"
        ++ "theorem t : true = true := by decide\n"
        ++ "end SystemsLean.Toy\n") with
  | some m => m.name.raw == "SystemsLean.Toy"
  | none => false

def namespaceMisses : Bool :=
  match parseHonestyStrCatText "namespace SystemsLean.Toy\n" with
  | none => true
  | some _ => false

end SystemsLean.HonestyStrCatFront
