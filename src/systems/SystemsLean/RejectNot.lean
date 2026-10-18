/-
  Module: SystemsLean.RejectNot
  A theorem whose conclusion is a Bool-valued `Bool.not` is a
  Bool ascription, not a Prop theorem. The tactic is still
  `by decide`. KeptHitKernel.hasEqSign maps `=` inside
  `Bool.not (1 = 1)` to HostType.bool, so the not toy still
  makes typedPass true. This helper fail-closes that
  ascription. Whole-identifier `not` via wordHere "not" hits
  token `not` and `Bool.not` after the dot. It does not match
  a longer ident that merely contains `not`. Ident `note`
  is not `not`: after a failed whole-word match, skipIdent
  rest skips remaining ident chars, so the suffix of `note`
  is not re-scanned as `not`. Ident `nothing` starts with
  `not` as a prefix and is not a hit. Prefix `!` is the
  same Prelude operator; this leftover is identifier `not`
  / `Bool.not`, not a second helper for `!`. Do not write
  a fun-underscore match-arrow lambda in the ascription;
  hooked RejectMatch already fail-closes match-arrow.
  Inner `=` is required so hasEqSign stays true. Do not
  use `Bool.not true`. True, propositional `=` without
  not, boolean `==`, boolean `!=`, Bool `ite`, Bool `dite`,
  Bool `bif`, Bool `cond`, Bool `dcond`, Bool `or`,
  Bool `and`, `if then else`, ident `note`, ident
  `nothing`, prefix `!`, and `decide` ascription stay
  allowed here.
  Bool `and` stays on RejectAnd. Bool `or` stays on
  RejectOr. Bool `ite` stays on RejectIte. Bool `dite`
  stays on RejectDite. Bool `bif` stays on RejectBif.
  Bool `cond` stays on RejectCond. Bool `dcond` stays
  on RejectDcond. `if then else` stays on RejectIf.
  `decide` ascription stays on RejectDecideAscription.
  Boolean `==` stays on RejectBeqThm. Boolean `!=`
  stays on RejectBne. Match-arrow stays on RejectMatch.
  Does not hook KeptHitKernel. HostTerm.Cmd is not
  extended. HostTerm is not edited.
  slakeOwnsPackageTypecheck stays false. ASCII only.
  Scanner is structurally recursive on the remaining
  character list. findWord recurses on `rest` only after
  a failed whole-word match. skipIdent is a where helper.
  Not skipIdent of the current cons cell. The not matcher
  is whole-identifier `not`, not a substring of `note`
  or `nothing`.
-/

import SystemsLean.KeptWalk
import SystemsLean.MutualForm

namespace SystemsLean.RejectNot

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

/-- Whole-identifier `not` via wordHere "not". Recurses on
    the remaining character list. Not a substring of `note`.
    Not a substring of `nothing`. Not `and`. Not `or`. Not
    `dcond`. Not `cond`. Not `dite`. Not `bif`. Not `ite`.
    Not `if` / `then` / `else`. Not match-arrow. Not `==`.
    Not `!=`. Not `decide`. Not prefix `!`. -/
def hasNot (cs : List Char) : Bool :=
  match findWord "not" cs with
  | none => false
  | some _ => true

/-- Theorem ascription is ok when it is not whole-identifier
    `not`. -/
def thmAscriptionOk (s : String) : Bool :=
  !(hasNot s.toList)

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

/-- Walk-root toy: optionHostToy shape plus Bool not.
    Ascription is `Bool.not (1 = 1)`, not a
    fun-underscore match-arrow lambda. Inner `=` is required. -/
def notToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : Bool.not (1 = 1) := by decide\n" ++
  "end N\n"

/-- Ident `note` is not whole-identifier `not`. Must not be
    this helper. -/
def noteToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : note (1 = 1) := by decide\n" ++
  "end N\n"

/-- Ident `nothing` starts with `not` as a prefix. Must not
    be this helper. -/
def nothingToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : nothing (1 = 1) := by decide\n" ++
  "end N\n"

/-- Prefix `!` is not identifier `not`. Must not be this
    helper. -/
def bangToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : !(1 = 1) := by decide\n" ++
  "end N\n"

/-- Bool and theorem. Must not be this helper. -/
def andToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : Bool.and (1 = 1) true := by decide\n" ++
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

/-- True when the theorem ascription is whole-identifier `not`. -/
def rejects (src : String) : Bool :=
  match thmTypeSrc src with
  | some t => !thmAscriptionOk t
  | none => false

/-- Bool-valued not theorem ascription fails closed. -/
def rejectNot : Bool := rejects notToy

/-- Ident `note` is not this helper. -/
def acceptNoteNotNot : Bool :=
  match thmTypeSrc noteToy with
  | some t => thmAscriptionOk t && !rejects noteToy
  | none => false

/-- Ident `nothing` is not this helper. -/
def acceptNothingNotNot : Bool :=
  match thmTypeSrc nothingToy with
  | some t => thmAscriptionOk t && !rejects nothingToy
  | none => false

/-- Prefix `!` is not this helper. -/
def acceptBangNotNot : Bool :=
  match thmTypeSrc bangToy with
  | some t => thmAscriptionOk t && !rejects bangToy
  | none => false

/-- Bool and is not this helper. -/
def acceptAndNotNot : Bool :=
  match thmTypeSrc andToy with
  | some t => thmAscriptionOk t && !rejects andToy
  | none => false

/-- Bool or is not this helper. -/
def acceptOrNotNot : Bool :=
  match thmTypeSrc orToy with
  | some t => thmAscriptionOk t && !rejects orToy
  | none => false

/-- Bool dcond is not this helper. -/
def acceptDcondNotNot : Bool :=
  match thmTypeSrc dcondToy with
  | some t => thmAscriptionOk t && !rejects dcondToy
  | none => false

/-- Bool bif is not this helper. -/
def acceptBifNotNot : Bool :=
  match thmTypeSrc bifToy with
  | some t => thmAscriptionOk t && !rejects bifToy
  | none => false

/-- Bool dite is not this helper. -/
def acceptDiteNotNot : Bool :=
  match thmTypeSrc diteToy with
  | some t => thmAscriptionOk t && !rejects diteToy
  | none => false

/-- Bool cond is not this helper. -/
def acceptCondNotNot : Bool :=
  match thmTypeSrc condToy with
  | some t => thmAscriptionOk t && !rejects condToy
  | none => false

/-- Bool ite is not this helper. -/
def acceptIteNotNot : Bool :=
  match thmTypeSrc iteToy with
  | some t => thmAscriptionOk t && !rejects iteToy
  | none => false

/-- `if then else` is not this helper. -/
def acceptIfNotNot : Bool :=
  match thmTypeSrc ifToy with
  | some t => thmAscriptionOk t && !rejects ifToy
  | none => false

/-- Boolean `==` is not this helper. -/
def acceptBeqNotNot : Bool :=
  match thmTypeSrc beqThmToy with
  | some t => thmAscriptionOk t && !rejects beqThmToy
  | none => false

/-- Boolean `!=` is not this helper. -/
def acceptBneNotNot : Bool :=
  match thmTypeSrc bneToy with
  | some t => thmAscriptionOk t && !rejects bneToy
  | none => false

/-- Decide ascription is not this helper. -/
def acceptDecideNotNot : Bool :=
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
  rejectNot && acceptNoteNotNot && acceptNothingNotNot
    && acceptBangNotNot && acceptAndNotNot && acceptOrNotNot
    && acceptDcondNotNot && acceptBifNotNot && acceptDiteNotNot
    && acceptCondNotNot && acceptIteNotNot && acceptIfNotNot
    && acceptBeqNotNot && acceptBneNotNot && acceptDecideNotNot
    && acceptTrueThm && acceptPropEq
    && !slakeOwnsPackageTypecheck && !flag

end SystemsLean.RejectNot
