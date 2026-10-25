/-
  Module: SystemsLean.RejectNotPrefix
  Prefix not is a Bool ascription, not a Prop theorem.
  Prelude writes `not x` as `!x`. Token `!` is not identifier
  `not` / `Bool.not`. KeptHitKernel.hasEqSign maps `=` inside
  `!(1 = 1)` to HostType.bool, so the prefix-not toy still
  makes typedPass return true. RejectNot.hasNot only matches
  whole-identifier `not`, so prefix `!` keeps. This helper
  fail-closes that ascription. Consecutive `!` then `=` is
  token `!=` and stays on RejectBne: the walk skips that
  pair and recurses on rest. True and propositional `=` stay
  allowed. Boolean `==` stays on RejectBeqThm. Identifier
  `not` / `Bool.not` stays on RejectNot. Tactic `decide!`
  stays on RejectDecideBang. HostTerm.Cmd is not extended.
  Does not hook KeptHitKernel. slakeOwnsPackageTypecheck
  stays false. ASCII only. Scanner is structurally recursive
  on the remaining character list. Consecutive `!` then `=`
  recurses on rest. skipIdent is a where helper after an
  identStart cons. Not skipIdent of the current cons cell.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.KeptWalk
import SystemsLean.MutualForm

namespace SystemsLean.RejectNotPrefix

open SystemsLean.MutualForm (
  startsWord trim stripCR isIdentChar)
open SystemsLean.KeptWalk (dropWord identStart skipMods)

/-- Honesty: this walk does not own package typecheck. -/
def slakeOwnsPackageTypecheck : Bool := false

/-- Flag stays false. -/
def flag : Bool := false

/-- Prefix token `!` that is not consecutive `!` then `=`.
    Recurses on rest. `!=` stays on RejectBne. After
    identStart, skipIdent rest. Not skipIdent of the
    current cons. -/
def hasNotPrefix : List Char -> Bool
  | [] => false
  | '!' :: '=' :: rest => hasNotPrefix rest
  | '!' :: _ => true
  | c :: rest =>
    if identStart c then skipIdent rest
    else hasNotPrefix rest
where
  -- Skip remaining ident chars on structural tails, then resume.
  skipIdent : List Char -> Bool
    | [] => false
    | c :: rest =>
      if isIdentChar c then skipIdent rest
      else hasNotPrefix rest

/-- Theorem ascription is ok when it is not prefix `!`. -/
def thmAscriptionOk (s : String) : Bool :=
  !(hasNotPrefix s.toList)

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
    prefix not `!(1 = 1)`. Inner `=` is required. -/
def notPrefixToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : !(1 = 1) := by decide\n" ++
  "end N\n"

/-- Boolean `!=` theorem. Must not be this helper.
    Living RejectBne owns consecutive `!` then `=`. -/
def bneToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : 1 != 1 := by decide\n" ++
  "end N\n"

/-- Identifier `not` / `Bool.not`. Must not be this helper.
    Living RejectNot owns whole-identifier `not`. -/
def notToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : Bool.not (1 = 1) := by decide\n" ++
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

/-- True when the theorem ascription is prefix `!` that is
    not `!=`. -/
def rejects (src : String) : Bool :=
  match thmTypeSrc src with
  | some t => !thmAscriptionOk t
  | none => false

/-- Prefix-not theorem ascription fails closed. -/
def rejectNotPrefix : Bool := rejects notPrefixToy

/-- Boolean `!=` is not this helper. -/
def acceptBneNotNotPrefix : Bool :=
  match thmTypeSrc bneToy with
  | some t => thmAscriptionOk t && !rejects bneToy
  | none => false

/-- Identifier `not` is not this helper. -/
def acceptNotNotNotPrefix : Bool :=
  match thmTypeSrc notToy with
  | some t => thmAscriptionOk t && !rejects notToy
  | none => false

/-- Boolean `==` is not this helper. -/
def acceptBeqNotNotPrefix : Bool :=
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
  rejectNotPrefix && acceptBneNotNotPrefix && acceptNotNotNotPrefix
    && acceptBeqNotNotPrefix && acceptTrueThm && acceptPropEq
    && !slakeOwnsPackageTypecheck && !flag

end SystemsLean.RejectNotPrefix
