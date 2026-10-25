/-
  Module: SystemsLean.RejectBoolBeq
  A theorem whose conclusion is a Bool-valued `Bool.beq`
  is a Bool ascription, not a Prop theorem. The tactic is
  still `by decide`. KeptHitKernel.hasEqSign maps `=` inside
  `Bool.beq (1 = 1) true` to HostType.bool, so the Bool.beq
  toy still makes typedPass true. This helper fail-closes
  that ascription. Whole-identifier `beq` via wordHere "beq"
  hits token `beq` and `Bool.beq` after the dot. It does not
  match a longer ident that merely contains `beq`. Ident
  `beqb` starts with `beq` as a prefix and is not a hit:
  after a failed whole-word match, skipIdent rest skips
  remaining ident chars, so the suffix of `beqb` is not
  re-scanned as `beq`. Identifier `bne` is not `beq`:
  wordHere "beq" fails on last char versus `bne`. Token
  `==` is not identifier `beq`. Living RejectBeqThm fail-closes
  consecutive `=` then `=`. This helper must not match bare
  `==`. Infix `==` is not identifier `beq`. Do not write a
  fun-underscore match-arrow lambda in the ascription;
  hooked RejectMatch already fail-closes match-arrow. Inner
  `=` is required so hasEqSign stays true. Do not use
  `Bool.beq true true`. True, propositional `=` without beq,
  boolean `==`, boolean `!=`, Bool `ite`, Bool `dite`, Bool
  `bif`, Bool `cond`, Bool `dcond`, Bool `or`, Bool `xor`,
  Bool `and`, Bool `not`, Bool `strictOr`, Bool `strictAnd`,
  `if then else`, ident `beqb`, ident `bne`, and `decide`
  ascription stay allowed here.
  Bool `or` stays on RejectOr. Bool `xor` stays on
  RejectXor. Bool `and` stays on RejectAnd. Bool `not`
  stays on RejectNot. Bool `ite` stays on RejectIte. Bool
  `dite` stays on RejectDite. Bool `bif` stays on RejectBif.
  Bool `cond` stays on RejectCond. Bool `dcond` stays on
  RejectDcond. `if then else` stays on RejectIf. `decide`
  ascription stays on RejectDecideAscription. Boolean `==`
  stays on RejectBeqThm. Boolean `!=` stays on RejectBne.
  Identifier `bne` stays on RejectBoolBne. Bool `strictAnd`
  stays on RejectStrictAnd. Bool `strictOr` stays on
  RejectStrictOr. Match-arrow stays on RejectMatch.
  Does not hook KeptHitKernel. HostTerm.Cmd is not extended.
  HostTerm is not edited. slakeOwnsPackageTypecheck stays
  false. ASCII only. Scanner is structurally recursive on
  the remaining character list. findWord recurses on `rest`
  only after a failed whole-word match. skipIdent is a where
  helper. Not skipIdent of the current cons cell. The beq
  matcher is whole-identifier `beq`, not token `==`, not
  identifier `bne`, and not a substring of `beqb`. dropWord
  and skipMods copy String.Slice before String ops on Lean
  4.35.0.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.KeptWalk
import SystemsLean.MutualForm

namespace SystemsLean.RejectBoolBeq

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

/-- Whole-identifier `beq` via wordHere "beq". Recurses on
    the remaining character list. Not token `==`. Not
    identifier `bne`. Not a substring of `beqb`. Not `xor`.
    Not `and`. Not `or`. Not `not`. Not `strictAnd`. Not
    `strictOr`. Not `dcond`. Not `cond`. Not `dite`. Not
    `bif`. Not `ite`. Not `if` / `then` / `else`. Not
    match-arrow. Not `!=`. Not `decide`. -/
def hasBoolBeq (cs : List Char) : Bool :=
  match findWord "beq" cs with
  | none => false
  | some _ => true

/-- Theorem ascription is ok when it is not whole-identifier
    `beq`. -/
def thmAscriptionOk (s : String) : Bool :=
  !(hasBoolBeq s.toList)

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

/-- Walk-root toy: optionHostToy shape plus Bool.beq.
    Ascription is `Bool.beq (1 = 1) true`, not a
    fun-underscore match-arrow lambda. Inner `=` is required. -/
def boolBeqToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : Bool.beq (1 = 1) true := by decide\n" ++
  "end N\n"

/-- Ident `beqb` starts with `beq` as a prefix. Must not
    be this helper. -/
def beqbToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : beqb (1 = 1) true := by decide\n" ++
  "end N\n"

/-- Identifier `bne` is not whole-identifier `beq`. Must not
    be this helper. Living RejectBoolBne owns identifier
    `Bool.bne`. -/
def boolBneToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : Bool.bne (1 = 1) true := by decide\n" ++
  "end N\n"

/-- Token `==` is not identifier `beq`. Must not be this
    helper. Living RejectBeqThm owns consecutive `=` then `=`. -/
def beqTokenToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : 1 == 1 := by decide\n" ++
  "end N\n"

/-- Token `!=` is not identifier `beq`. Must not be this
    helper. Living RejectBne owns consecutive `!` then `=`. -/
def bneTokenToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : 1 != 1 := by decide\n" ++
  "end N\n"

/-- Bool xor theorem. Must not be this helper. -/
def xorToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : Bool.xor (1 = 1) true := by decide\n" ++
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

/-- Bool not theorem. Must not be this helper. -/
def notToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : Bool.not (1 = 1) := by decide\n" ++
  "end N\n"

/-- Bool strictAnd theorem. Must not be this helper. -/
def strictAndToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : Bool.strictAnd (1 = 1) true := by decide\n" ++
  "end N\n"

/-- Bool strictOr theorem. Must not be this helper. -/
def strictOrToy : String :=
  "namespace N\n" ++
  "def linearN : Nat := 2\n" ++
  "mutual\n" ++
  "def leftN : Option Host := none\n" ++
  "def rightN : Option Host := none\n" ++
  "end\n" ++
  "theorem th : Bool.strictOr (1 = 1) true := by decide\n" ++
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

/-- True when the theorem ascription is whole-identifier
    `beq`. -/
def rejects (src : String) : Bool :=
  match thmTypeSrc src with
  | some t => !thmAscriptionOk t
  | none => false

/-- Bool-valued Bool.beq theorem ascription fails closed. -/
def rejectBoolBeq : Bool := rejects boolBeqToy

/-- Ident `beqb` is not this helper. -/
def acceptBeqbNotBoolBeq : Bool :=
  match thmTypeSrc beqbToy with
  | some t => thmAscriptionOk t && !rejects beqbToy
  | none => false

/-- Identifier `bne` is not this helper. -/
def acceptBoolBneNotBoolBeq : Bool :=
  match thmTypeSrc boolBneToy with
  | some t => thmAscriptionOk t && !rejects boolBneToy
  | none => false

/-- Token `==` is not this helper. -/
def acceptBeqTokenNotBoolBeq : Bool :=
  match thmTypeSrc beqTokenToy with
  | some t => thmAscriptionOk t && !rejects beqTokenToy
  | none => false

/-- Token `!=` is not this helper. -/
def acceptBneTokenNotBoolBeq : Bool :=
  match thmTypeSrc bneTokenToy with
  | some t => thmAscriptionOk t && !rejects bneTokenToy
  | none => false

/-- Bool xor is not this helper. -/
def acceptXorNotBoolBeq : Bool :=
  match thmTypeSrc xorToy with
  | some t => thmAscriptionOk t && !rejects xorToy
  | none => false

/-- Bool and is not this helper. -/
def acceptAndNotBoolBeq : Bool :=
  match thmTypeSrc andToy with
  | some t => thmAscriptionOk t && !rejects andToy
  | none => false

/-- Bool or is not this helper. -/
def acceptOrNotBoolBeq : Bool :=
  match thmTypeSrc orToy with
  | some t => thmAscriptionOk t && !rejects orToy
  | none => false

/-- Bool not is not this helper. -/
def acceptNotNotBoolBeq : Bool :=
  match thmTypeSrc notToy with
  | some t => thmAscriptionOk t && !rejects notToy
  | none => false

/-- Bool strictAnd is not this helper. -/
def acceptStrictAndNotBoolBeq : Bool :=
  match thmTypeSrc strictAndToy with
  | some t => thmAscriptionOk t && !rejects strictAndToy
  | none => false

/-- Bool strictOr is not this helper. -/
def acceptStrictOrNotBoolBeq : Bool :=
  match thmTypeSrc strictOrToy with
  | some t => thmAscriptionOk t && !rejects strictOrToy
  | none => false

/-- Bool dcond is not this helper. -/
def acceptDcondNotBoolBeq : Bool :=
  match thmTypeSrc dcondToy with
  | some t => thmAscriptionOk t && !rejects dcondToy
  | none => false

/-- Bool bif is not this helper. -/
def acceptBifNotBoolBeq : Bool :=
  match thmTypeSrc bifToy with
  | some t => thmAscriptionOk t && !rejects bifToy
  | none => false

/-- Bool dite is not this helper. -/
def acceptDiteNotBoolBeq : Bool :=
  match thmTypeSrc diteToy with
  | some t => thmAscriptionOk t && !rejects diteToy
  | none => false

/-- Bool cond is not this helper. -/
def acceptCondNotBoolBeq : Bool :=
  match thmTypeSrc condToy with
  | some t => thmAscriptionOk t && !rejects condToy
  | none => false

/-- Bool ite is not this helper. -/
def acceptIteNotBoolBeq : Bool :=
  match thmTypeSrc iteToy with
  | some t => thmAscriptionOk t && !rejects iteToy
  | none => false

/-- `if then else` is not this helper. -/
def acceptIfNotBoolBeq : Bool :=
  match thmTypeSrc ifToy with
  | some t => thmAscriptionOk t && !rejects ifToy
  | none => false

/-- Decide ascription is not this helper. -/
def acceptDecideNotBoolBeq : Bool :=
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
  rejectBoolBeq && acceptBeqbNotBoolBeq
    && acceptBoolBneNotBoolBeq && acceptBeqTokenNotBoolBeq
    && acceptBneTokenNotBoolBeq && acceptXorNotBoolBeq
    && acceptAndNotBoolBeq && acceptOrNotBoolBeq
    && acceptNotNotBoolBeq && acceptStrictAndNotBoolBeq
    && acceptStrictOrNotBoolBeq && acceptDcondNotBoolBeq
    && acceptBifNotBoolBeq && acceptDiteNotBoolBeq
    && acceptCondNotBoolBeq && acceptIteNotBoolBeq
    && acceptIfNotBoolBeq && acceptDecideNotBoolBeq
    && acceptTrueThm && acceptPropEq
    && !slakeOwnsPackageTypecheck && !flag

end SystemsLean.RejectBoolBeq
