/-
  Module: SystemsLean.RejectAndInfix
  Infix and (`&&`) is a Bool ascription, not a Prop theorem.
  Token `&&` is consecutive `'&'` then `'&'`. It is not
  identifier `and` / `Bool.and` and not identifier `strictAnd`.
  KeptHitKernel.hasEqSign maps `=` inside `(1 = 1) && true`
  to HostType.bool, so the and-infix toy still makes
  typedPass return true. RejectAnd.hasAnd only matches
  whole-identifier `and`. RejectStrictAnd.hasStrictAnd only
  matches whole-identifier `strictAnd`. This helper
  fail-closes the infix token. Inner `=` is required so
  hasEqSign stays true. Do not use `true && true`. True
  and propositional `=` stay allowed. Identifier `and` /
  `Bool.and` stays on RejectAnd. Identifier `strictAnd`
  stays on RejectStrictAnd. Infix `||` stays on
  RejectOrInfix. Boolean `==` stays on RejectBeqThm.
  Boolean `!=` stays on RejectBne. Prefix `!` stays on
  RejectNotPrefix. HostTerm.Cmd is not extended. Does
  not hook KeptHitKernel.
  slakeOwnsPackageTypecheck stays false. ASCII only.
  Scanner is structurally recursive on the remaining
  character list. Consecutive `'&'` then `'&'`. Recurse
  on rest after a non-match.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.KeptWalk
import SystemsLean.MutualForm

namespace SystemsLean.RejectAndInfix

open SystemsLean.MutualForm (
  startsWord trim stripCR isIdentChar)
open SystemsLean.KeptWalk (dropWord identStart skipMods)

/-- Honesty: this walk does not own package typecheck. -/
def slakeOwnsPackageTypecheck : Bool := false

/-- Flag stays false. -/
def flag : Bool := false

/-- Infix and token `&&`: consecutive `'&'` then `'&'`.
    Recurses on rest. Not identifier `and`. Not identifier
    `strictAnd`. Not a lone `'&'`. -/
def hasAndInfix : List Char -> Bool
  | [] => false
  | '&' :: '&' :: _ => true
  | _ :: rest => hasAndInfix rest

/-- Theorem ascription is ok when it is not infix `&&`. -/
def thmAscriptionOk (s : String) : Bool :=
  !(hasAndInfix s.toList)

def isWs (c : Char) : Bool :=
  c == ' ' || c == '\t' || c == '\r'

def skipWs : List Char -> List Char
  | [] => []
  | c :: rest => if isWs c then skipWs rest else c :: rest

def takeIdent (cs : List Char) : Prod String (List Char) :=
  go cs []
where
  go (cs : List Char) (acc : List Char) : Prod String (List Char) :=
    match cs with
    | [] => (String.mk acc.reverse, [])
    | c :: rest =>
      if identStart c || (acc != [] && isIdentChar c) then
        go rest (c :: acc)
      else (String.mk acc.reverse, cs)

def takeUntilAssign (cs : List Char) : List Char :=
  go cs []
where
  go (cs : List Char) (acc : List Char) : List Char :=
    match cs with
    | [] => acc.reverse
    | ':' :: '=' :: _ => acc.reverse
    | c :: rest => go rest (c :: acc)

/-- Type ascription after `:` and before `:=`. none if `:=` is next. -/
def colonType (cs : List Char) : Option String :=
  match skipWs cs with
  | ':' :: '=' :: _ => none
  | ':' :: more =>
    let body := trim (String.mk (takeUntilAssign (skipWs more)))
    if body == "" then none else some body
  | _ => none

def thmTypeOnLine (line : String) : Option String :=
  let t := skipMods 8 (trim (stripCR line))
  if startsWord t "theorem" then
    let rest := dropWord t "theorem"
    let (nm, more) := takeIdent rest.toList
    if nm == "" then none else colonType more
  else none

def thmTypeOf : List String -> Option String
  | [] => none
  | line :: rest =>
    match thmTypeOnLine line with
    | some t => some t
    | none => thmTypeOf rest

def thmTypeSrc (src : String) : Option String :=
  thmTypeOf (src.splitOn "\n")

/-- Same four forms as optionHostToy, theorem conclusion is
    infix and `(1 = 1) && true`. Inner `=` is required. -/
def andInfixToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : (1 = 1) && true := by decide\n" ++
  "end N\n"

/-- Identifier `and` / `Bool.and`. Must not be this helper.
    Living RejectAnd owns whole-identifier `and`. -/
def andToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : Bool.and (1 = 1) true := by decide\n" ++
  "end N\n"

/-- Identifier `strictAnd`. Must not be this helper.
    Living RejectStrictAnd owns whole-identifier `strictAnd`. -/
def strictAndToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : Bool.strictAnd (1 = 1) true := by decide\n" ++
  "end N\n"

/-- Boolean `!=` theorem. Must not be this helper. -/
def bneToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : 1 != 1 := by decide\n" ++
  "end N\n"

/-- Boolean `==` theorem. Must not be this helper. -/
def beqThmToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : 1 == 1 := by decide\n" ++
  "end N\n"

/-- True theorem, same four forms. Must stay allowed. -/
def trueThmToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : True := by decide\n" ++
  "end N\n"

/-- Propositional `=` theorem. Must stay allowed. -/
def propEqToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : linearFixtureProgramReady = true := by decide\n" ++
  "end N\n"

/-- True when the theorem ascription is infix and (`&&`). -/
def rejects (src : String) : Bool :=
  match thmTypeSrc src with
  | some t => !thmAscriptionOk t
  | none => false

/-- Infix-and theorem ascription fails closed. -/
def rejectAndInfix : Bool := rejects andInfixToy

/-- Identifier `and` is not this helper. -/
def acceptAndNotAndInfix : Bool :=
  match thmTypeSrc andToy with
  | some t => thmAscriptionOk t && !rejects andToy
  | none => false

/-- Identifier `strictAnd` is not this helper. -/
def acceptStrictAndNotAndInfix : Bool :=
  match thmTypeSrc strictAndToy with
  | some t => thmAscriptionOk t && !rejects strictAndToy
  | none => false

/-- Boolean `!=` is not this helper. -/
def acceptBneNotAndInfix : Bool :=
  match thmTypeSrc bneToy with
  | some t => thmAscriptionOk t && !rejects bneToy
  | none => false

/-- Boolean `==` is not this helper. -/
def acceptBeqNotAndInfix : Bool :=
  match thmTypeSrc beqThmToy with
  | some t => thmAscriptionOk t && !rejects beqThmToy
  | none => false

/-- True ascription is still allowed. -/
def acceptTrueThm : Bool :=
  match thmTypeSrc trueThmToy with
  | some t => thmAscriptionOk t && !rejects trueThmToy
  | none => false

/-- Propositional `=` is still allowed. -/
def acceptPropEq : Bool :=
  match thmTypeSrc propEqToy with
  | some t => thmAscriptionOk t && !rejects propEqToy
  | none => false

def pinsOk : Bool :=
  rejectAndInfix && acceptAndNotAndInfix && acceptStrictAndNotAndInfix
    && acceptBneNotAndInfix && acceptBeqNotAndInfix && acceptTrueThm
    && acceptPropEq && !slakeOwnsPackageTypecheck && !flag

end SystemsLean.RejectAndInfix
