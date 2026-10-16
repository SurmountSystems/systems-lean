/-
  Module: SystemsLean.DiaphenesTacticForm
  Accept: one or more `import Dotted.Name`, then one
  `namespace Dotted.Name`, then one or more items, then
  `end` of that same namespace and no trailing tokens.
  An item is `theorem <ident> : <side> = <side> := by <tacticIdent>`
  or `example : <side> = <side> := by <tacticIdent>`.
  A side is an ident, true, false, or one quoted string.
  A tacticIdent is one ident. Theorems are recognized and not emitted.
  Commands are only imports, namespace, and endNamespace.
  A tactic proof is not a reduced Bool.
  The module file name is not stored. Module.name is the namespace.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HonestyFront

namespace SystemsLean.DiaphenesTacticForm

open SystemsLean.HostTerm
open SystemsLean.HonestyFront (
  strip SMode isIdent isIdentChar isLetter isWs unquote
  parseDotted parseFuel)

def fuelOf (n : Nat) : Nat :=
  n + n + 32

inductive TMode where
  | norm
  | id (cur : List Char)
  | str (cur : List Char)

def emitId (acc : List String) (cur : List Char) : List String :=
  String.mk cur.reverse :: acc

def emitStr (acc : List String) (cur : List Char) : List String :=
  String.mk ('"' :: cur.reverse ++ ['"']) :: acc

/-- HonestyFront.strip drops line comments and block comments.
    A raw opener r-quote or r-hash-quote is none. Fuel 0 is none. -/
def tok (fuel : Nat) (cs : List Char) (mode : TMode)
    (acc : List String) : Option (List String) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match cs, mode with
    | [], TMode.norm => some acc.reverse
    | [], TMode.id cur => some (emitId acc cur).reverse
    | [], TMode.str _ => none
    | c :: rest, TMode.str cur =>
      if c == '"' then
        tok k rest TMode.norm (emitStr acc cur)
      else if c == '\\' then
        match rest with
        | [] => none
        | d :: more =>
          tok k more (TMode.str (d :: '\\' :: cur)) acc
      else
        tok k rest (TMode.str (c :: cur)) acc
    | c :: rest, TMode.id cur =>
      if isIdentChar c then
        tok k rest (TMode.id (c :: cur)) acc
      else if isWs c then
        tok k rest TMode.norm (emitId acc cur)
      else if c == '.' then
        tok k rest TMode.norm ("." :: emitId acc cur)
      else if c == '=' then
        tok k rest TMode.norm ("=" :: emitId acc cur)
      else if c == ':' then
        match rest with
        | '=' :: more =>
          tok k more TMode.norm (":=" :: emitId acc cur)
        | _ =>
          tok k rest TMode.norm (":" :: emitId acc cur)
      else if c == '"' then
        tok k rest (TMode.str []) (emitId acc cur)
      else
        none
    | c :: rest, TMode.norm =>
      if isWs c then
        tok k rest TMode.norm acc
      else if c == 'r' then
        match rest with
        | '"' :: _ => none
        | '#' :: _ => none
        | _ => tok k rest (TMode.id ['r']) acc
      else if isLetter c || c == '_' then
        tok k rest (TMode.id [c]) acc
      else if c == '"' then
        tok k rest (TMode.str []) acc
      else if c == '.' then
        tok k rest TMode.norm ("." :: acc)
      else if c == '=' then
        tok k rest TMode.norm ("=" :: acc)
      else if c == ':' then
        match rest with
        | '=' :: more =>
          tok k more TMode.norm (":=" :: acc)
        | _ =>
          tok k rest TMode.norm (":" :: acc)
      else
        none

def parseSide (ts : List String) : Option (List String) :=
  match ts with
  | t :: rest =>
    match unquote t with
    | some _ => some rest
    | none =>
      if isIdent t then some rest else none
  | [] => none

/-- `:= by <one ident>`. A term, a bare `by`, or two idents is none. -/
def parseTail (ts : List String) : Option (List String) :=
  match parseSide ts with
  | none => none
  | some rest =>
    match rest with
    | "=" :: rest2 =>
      match parseSide rest2 with
      | none => none
      | some rest3 =>
        match rest3 with
        | ":=" :: "by" :: tac :: rest4 =>
          if isIdent tac then some rest4 else none
        | _ => none
    | _ => none

def parseThm (ts : List String) : Option (List String) :=
  match ts with
  | name :: ":" :: rest =>
    if isIdent name then parseTail rest else none
  | _ => none

def parseEx (ts : List String) : Option (List String) :=
  match ts with
  | ":" :: rest => parseTail rest
  | _ => none

def parseImports (fuel : Nat) (acc : List String)
    (ts : List String) : Option (Prod (List String) (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "import" :: rest =>
      match parseDotted parseFuel rest with
      | none => none
      | some (nm, rest2) =>
        parseImports k (nm :: acc) rest2
    | _ =>
      if acc.isEmpty then none
      else some (acc.reverse, ts)

def parseItems (fuel : Nat) (nItems : Nat) (ts : List String) :
    Option (List String) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "theorem" :: rest =>
      match parseThm rest with
      | some rest2 => parseItems k (nItems + 1) rest2
      | none => none
    | "example" :: rest =>
      match parseEx rest with
      | some rest2 => parseItems k (nItems + 1) rest2
      | none => none
    | "end" :: _ =>
      if nItems == 0 then none else some ts
    | _ => none

def impCmds : List String -> List Cmd
  | [] => []
  | m :: rest => Cmd.importModule (n m) :: impCmds rest

def shell (imps : List String) (ns : String) : Module :=
  {
    name := n ns
    commands :=
      impCmds imps ++
        [Cmd.namespace (n ns), Cmd.endNamespace (n ns)]
  }

def accept (imps : List String) (ns : String) : Option Module :=
  let m := shell imps ns
  if isWellFormed m then some m else none

def parseMod (fuel : Nat) (ts : List String) : Option Module :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match parseImports k [] ts with
    | none => none
    | some (imps, rest) =>
      match rest with
      | "namespace" :: rest2 =>
        match parseDotted parseFuel rest2 with
        | none => none
        | some (ns, rest3) =>
          match parseItems k 0 rest3 with
          | none => none
          | some rest4 =>
            match rest4 with
            | "end" :: rest5 =>
              match parseDotted parseFuel rest5 with
              | some (en, rest6) =>
                if en == ns && rest6.isEmpty then
                  accept imps ns
                else
                  none
              | none => none
            | _ => none
      | _ => none

/-- Tactic form only. The file name is not the module name. -/
def parseTacticForm (src : String) :
    Option SystemsLean.HostTerm.Module :=
  match strip src.toList SMode.code [] with
  | none => none
  | some kept =>
    match tok (fuelOf kept.length) kept TMode.norm [] with
    | none => none
    | some ts =>
      parseMod (fuelOf ts.length) ts

def toyNs : String := "SystemsLean.Toy"

def decideToy : String :=
  "import SystemsLean.HostTerm\n"
    ++ "namespace SystemsLean.Toy\n"
    ++ "theorem t : true = true := by decide\n"
    ++ "example : \"a\" = \"a\" := by simp\n"
    ++ "end SystemsLean.Toy\n"

def nativeToy : String :=
  "import SystemsLean.Toy\n"
    ++ "namespace SystemsLean.Toy\n"
    ++ "theorem t : false = false := by native_decide\n"
    ++ "end SystemsLean.Toy\n"

def termRflToy : String :=
  "import SystemsLean.Toy\n"
    ++ "namespace SystemsLean.Toy\n"
    ++ "theorem t : true = true := rfl\n"
    ++ "end SystemsLean.Toy\n"

def nsNoImportToy : String :=
  "namespace SystemsLean.Toy\n"
    ++ "theorem t : true = true := by decide\n"
    ++ "end SystemsLean.Toy\n"

def importNoNsToy : String :=
  "import SystemsLean.Toy\n"

def noItemToy : String :=
  "import SystemsLean.Toy\n"
    ++ "namespace SystemsLean.Toy\n"
    ++ "end SystemsLean.Toy\n"

def defToy : String :=
  "import SystemsLean.Toy\n"
    ++ "namespace SystemsLean.Toy\n"
    ++ "def main : Bool := true\n"
    ++ "end SystemsLean.Toy\n"

def badEndToy : String :=
  "import SystemsLean.Toy\n"
    ++ "namespace SystemsLean.Toy\n"
    ++ "theorem t : true = true := by decide\n"
    ++ "end SystemsLean.Other\n"

def onlyShell : Cmd -> Bool
  | Cmd.importModule x => nameOk x
  | Cmd.namespace _ => true
  | Cmd.endNamespace _ => true
  | _ => false

def tacticDecideSome : Bool :=
  match parseTacticForm decideToy with
  | some m =>
    m.name.raw == toyNs && m.commands.length == 3
      && m.commands.all onlyShell && isWellFormed m
  | none => false

def tacticNativeSome : Bool :=
  match parseTacticForm nativeToy with
  | some m => m.name.raw == toyNs && isWellFormed m
  | none => false

def tacticTermRflNone : Bool :=
  match parseTacticForm termRflToy with
  | none => true
  | some _ => false

def tacticNoImportNone : Bool :=
  match parseTacticForm nsNoImportToy with
  | none => true
  | some _ => false

def tacticNoNamespaceNone : Bool :=
  match parseTacticForm importNoNsToy with
  | none => true
  | some _ => false

def tacticNoItemNone : Bool :=
  match parseTacticForm noItemToy with
  | none => true
  | some _ => false

def tacticDefNone : Bool :=
  match parseTacticForm defToy with
  | none => true
  | some _ => false

def tacticBadEndNone : Bool :=
  match parseTacticForm badEndToy with
  | none => true
  | some _ => false

def tacticNameIsNamespace : Bool :=
  match parseTacticForm decideToy with
  | some m =>
    m.name.raw == toyNs
      && m.name.raw != "DiaphenesTacticForm.lean"
  | none => false

end SystemsLean.DiaphenesTacticForm
