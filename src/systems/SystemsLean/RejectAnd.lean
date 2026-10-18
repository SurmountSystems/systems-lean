/-
  Module: SystemsLean.RejectAnd
  A theorem whose conclusion is a Bool-valued `Bool.and` is a
  Bool ascription, not a Prop theorem. The tactic is still
  `by decide`. KeptHitKernel.hasEqSign maps `=` inside
  `Bool.and (1 = 1) true` to HostType.bool, so the and toy
  still makes typedPass true. This helper fail-closes that
  ascription. Whole-identifier `and` via wordHere "and" hits
  token `and` and `Bool.and` after the dot. It does not match
  a longer ident that merely contains `and`. Ident `land`
  is not `and`: after a failed whole-word match, skipIdent
  rest skips remaining ident chars, so the suffix of `land`
  is not re-scanned as `and`. Ident `standard` contains
  `and` as a substring and is not a hit. Infix `&&` is the
  same Prelude operator; this leftover is identifier `and`
  / `Bool.and`, not a second helper for `&&`. Do not write
  a fun-underscore match-arrow lambda in the ascription;
  hooked RejectMatch already fail-closes match-arrow.
  Inner `=` is required so hasEqSign stays true. Do not
  use `Bool.and true true`. True, propositional `=` without
  and, boolean `==`, boolean `!=`, Bool `ite`, Bool `dite`,
  Bool `bif`, Bool `cond`, Bool `dcond`, Bool `or`,
  `if then else`, ident `land`, ident `standard`, and
  `decide` ascription stay allowed here.
  Bool `or` stays on RejectOr. Bool `ite` stays on
  RejectIte. Bool `dite` stays on RejectDite. Bool `bif`
  stays on RejectBif. Bool `cond` stays on RejectCond.
  Bool `dcond` stays on RejectDcond. `if then else` stays
  on RejectIf. `decide` ascription stays on
  RejectDecideAscription. Boolean `==` stays on
  RejectBeqThm. Boolean `!=` stays on RejectBne.
  Match-arrow stays on RejectMatch. Does not hook
  KeptHitKernel. HostTerm.Cmd is not extended. HostTerm
  is not edited. slakeOwnsPackageTypecheck stays false.
  ASCII only. Scanner is structurally recursive on the
  remaining character list. findWord recurses on `rest`
  only after a failed whole-word match. skipIdent is a
  where helper. Not skipIdent of the current cons cell.
  The and matcher is whole-identifier `and`, not a
  substring of `land` or `standard`.
-/

import SystemsLean.KeptWalk
import SystemsLean.MutualForm

namespace SystemsLean.RejectAnd

open SystemsLean.MutualForm (
  startsWord trim stripCR isIdentChar)
open SystemsLean.KeptWalk (dropWord identStart skipMods)

/-- Honesty: this walk does not own package typecheck. -/
def slakeOwnsPackageTypecheck : Bool := false

/-- Flag stays false. -/
def flag : Bool := false

/-- `w` as a whole identifier at the front of `cs`. -/
def wordHere (w : List Char) (cs : List Char) : Option (List Char) :=
  match w, cs with
  | [], [] => some []
  | [], c :: rest =>
    if isIdentChar c then none else some (c :: rest)
  | _ :: _, [] => none
  | wc :: wrest, cc :: crest =>
    if wc == cc then wordHere wrest crest else none

/-- Next whole-identifier occurrence of `w`. Recurses on
    `rest` only after a failed whole-word match. skipIdent
    is a where helper. Not skipIdent of the current cons. -/
def findWord (w : String) : List Char -> Option (List Char)
  | [] => none
  | c :: rest =>
    if identStart c then
      match wordHere w.toList (c :: rest) with
      | some more => some more
      | none => skipIdent rest
    else
      findWord w rest
where
  -- Skip remaining ident chars on structural tails, then resume.
  skipIdent : List Char -> Option (List Char)
    | [] => none
    | c :: rest =>
      if isIdentChar c then skipIdent rest
      else findWord w rest

/-- Whole-identifier `and` via wordHere "and". Recurses on
    the remaining character list. Not a substring of `land`.
    Not a substring of `standard`. Not `or`. Not `dcond`.
    Not `cond`. Not `dite`. Not `bif`. Not `ite`. Not
    `if` / `then` / `else`. Not match-arrow. Not `==`.
    Not `!=`. Not `decide`. -/
def hasAnd (cs : List Char) : Bool :=
  match findWord "and" cs with
  | none => false
  | some _ => true

/-- Theorem ascription is ok when it is not whole-identifier
    `and`. -/
def thmAscriptionOk (s : String) : Bool :=
  !(hasAnd s.toList)

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

/-- Walk-root toy: optionHostToy shape plus Bool and.
    Ascription is `Bool.and (1 = 1) true`, not a
    fun-underscore match-arrow lambda. Inner `=` is required. -/
def andToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : Bool.and (1 = 1) true := by decide\n" ++
  "end N\n"

/-- Ident `land` is not whole-identifier `and`. Must not be
    this helper. -/
def landToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : land (1 = 1) true := by decide\n" ++
  "end N\n"

/-- Ident `standard` contains `and` as a substring. Must not
    be this helper. -/
def standardToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : standard (1 = 1) true := by decide\n" ++
  "end N\n"

/-- Bool or theorem. Must not be this helper. -/
def orToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : Bool.or (1 = 1) true := by decide\n" ++
  "end N\n"

/-- Bool dcond theorem. Must not be this helper. -/
def dcondToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : Bool.dcond (1 = 1) true false := by decide\n" ++
  "end N\n"

/-- Bool bif theorem. Must not be this helper. -/
def bifToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : bif (1 = 1) then true else false := by decide\n" ++
  "end N\n"

/-- Bool dite theorem. Must not be this helper. -/
def diteToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : dite (1 = 1) true false := by decide\n" ++
  "end N\n"

/-- Bool cond theorem. Must not be this helper. -/
def condToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : cond (1 = 1) true false := by decide\n" ++
  "end N\n"

/-- Bool ite theorem. Must not be this helper. -/
def iteToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : ite (1 = 1) true false := by decide\n" ++
  "end N\n"

/-- `if then else` theorem. Must not be this helper. -/
def ifToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : if 1 = 1 then true else false := by decide\n" ++
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

/-- Decide ascription. Must not be this helper. -/
def decideAscriptionToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : decide (1 = 1) := by decide\n" ++
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

/-- True when the theorem ascription is whole-identifier `and`. -/
def rejects (src : String) : Bool :=
  match thmTypeSrc src with
  | some t => !thmAscriptionOk t
  | none => false

/-- Bool-valued and theorem ascription fails closed. -/
def rejectAnd : Bool := rejects andToy

/-- Ident `land` is not this helper. -/
def acceptLandNotAnd : Bool :=
  match thmTypeSrc landToy with
  | some t => thmAscriptionOk t && !rejects landToy
  | none => false

/-- Ident `standard` is not this helper. -/
def acceptStandardNotAnd : Bool :=
  match thmTypeSrc standardToy with
  | some t => thmAscriptionOk t && !rejects standardToy
  | none => false

/-- Bool or is not this helper. -/
def acceptOrNotAnd : Bool :=
  match thmTypeSrc orToy with
  | some t => thmAscriptionOk t && !rejects orToy
  | none => false

/-- Bool dcond is not this helper. -/
def acceptDcondNotAnd : Bool :=
  match thmTypeSrc dcondToy with
  | some t => thmAscriptionOk t && !rejects dcondToy
  | none => false

/-- Bool bif is not this helper. -/
def acceptBifNotAnd : Bool :=
  match thmTypeSrc bifToy with
  | some t => thmAscriptionOk t && !rejects bifToy
  | none => false

/-- Bool dite is not this helper. -/
def acceptDiteNotAnd : Bool :=
  match thmTypeSrc diteToy with
  | some t => thmAscriptionOk t && !rejects diteToy
  | none => false

/-- Bool cond is not this helper. -/
def acceptCondNotAnd : Bool :=
  match thmTypeSrc condToy with
  | some t => thmAscriptionOk t && !rejects condToy
  | none => false

/-- Bool ite is not this helper. -/
def acceptIteNotAnd : Bool :=
  match thmTypeSrc iteToy with
  | some t => thmAscriptionOk t && !rejects iteToy
  | none => false

/-- `if then else` is not this helper. -/
def acceptIfNotAnd : Bool :=
  match thmTypeSrc ifToy with
  | some t => thmAscriptionOk t && !rejects ifToy
  | none => false

/-- Boolean `==` is not this helper. -/
def acceptBeqNotAnd : Bool :=
  match thmTypeSrc beqThmToy with
  | some t => thmAscriptionOk t && !rejects beqThmToy
  | none => false

/-- Boolean `!=` is not this helper. -/
def acceptBneNotAnd : Bool :=
  match thmTypeSrc bneToy with
  | some t => thmAscriptionOk t && !rejects bneToy
  | none => false

/-- Decide ascription is not this helper. -/
def acceptDecideNotAnd : Bool :=
  match thmTypeSrc decideAscriptionToy with
  | some t => thmAscriptionOk t && !rejects decideAscriptionToy
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
  rejectAnd && acceptLandNotAnd && acceptStandardNotAnd
    && acceptOrNotAnd && acceptDcondNotAnd && acceptBifNotAnd
    && acceptDiteNotAnd && acceptCondNotAnd && acceptIteNotAnd
    && acceptIfNotAnd && acceptBeqNotAnd && acceptBneNotAnd
    && acceptDecideNotAnd && acceptTrueThm && acceptPropEq
    && !slakeOwnsPackageTypecheck && !flag

end SystemsLean.RejectAnd
