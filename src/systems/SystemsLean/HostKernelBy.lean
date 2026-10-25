/-
  Module: SystemsLean.HostKernelBy
  Checks the stored by-cases term. The front already built that term.
  This module does not parse source.
  A complete split is zero, then succ, three times. The zero arms are
  absurd of Not (2 < k) for k = 0, 1, and 2. The last succ arm is rfl.
  That rfl is accepted only when ofNat? 0, 1, and 2 reduce to some
  and ofNat? 3 reduces to none.
  A missing arm, a false absurd, and a non-rfl arm are rejected.
  The stored unfold-then-rw term is checked here too.
  Unfold uses the imported body. The rewrite uses the stored
  by-cases proof only when that proof still checks.
  A missing body, and a rewrite that does not match, stay rejected.
  `cases` then `rfl` is a separate check. The same rfl runs on
  every Mult constructor. Reduction of the imported isValid body
  is what closes each arm. A missing constructor stays rejected.
  `unfold` then `rw` of one local hypothesis then `rfl` is a
  separate check. The hypothesis is the equality ofNat? of the
  unfolded binder equals some m. A name that already has a
  definition is not that equality. A rewrite that does not match
  the unfolded body stays rejected. isSome of some reduces.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.HostKernelReduce
import SystemsLean.HostKernelMarker
import SystemsLean.HostKernelApply
import SystemsLean.HostKernelFilter
import SystemsLean.HostKernelRfl
import SystemsLean.LessThan

namespace SystemsLean.HostKernelBy

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce
  (DefEnv reduceN reduceFuel multDefEnv lookupDef substN)
open SystemsLean.HostKernelMarker (markerAfterRead)
open SystemsLean.HostKernelApply (applyAfterMarker)
open SystemsLean.HostKernelFilter (filterAfterApply)
open SystemsLean.HostKernelRfl (eqFuel rflEqType termEqN)
open SystemsLean.LessThan (lessTok)

inductive ByJudgment where
  | notBy
  | reject
  | accept (ty : HostType)

def propTy : HostType := HostType.named (n "Prop")

def natLt : Nat -> Nat -> Bool
  | 0, 0 => false
  | 0, Nat.succ _ => true
  | Nat.succ _, 0 => false
  | Nat.succ a, Nat.succ b => natLt a b

/-- `(by decide : Not (2 < k))` with k equal to this arm, and 2 < k false. -/
def decideNotLt (k : Nat) (t : Term) : Bool :=
  match t with
  | Term.app (Term.const dec) (Term.app (Term.const hd)
      (Term.app (Term.app (Term.const op) (Term.litNat a)) (Term.litNat b))) =>
    dec.raw == "decide" && hd.raw == "Not" && op.raw == lessTok
      && a == 2 && b == k && !natLt a b
  | _ => false

/-- `absurd` applied to one variable and that decide term. -/
def absurdOk (k : Nat) (t : Term) : Bool :=
  match t with
  | Term.app (Term.app (Term.var abs) (Term.var _)) pf =>
    abs.raw == "absurd" && decideNotLt k pf
  | _ => false

def ofNatAt (defs : DefEnv) (k : Nat) : Term :=
  reduceN reduceFuel defs
    (Term.app (Term.const (n "ofNat?")) (Term.litNat k))

/-- The imported ofNat? sends 0, 1, and 2 to some, and 3 to none. -/
def catchAllNone (defs : DefEnv) : Bool :=
  match ofNatAt defs 0, ofNatAt defs 1, ofNatAt defs 2, ofNatAt defs 3 with
  | Term.some_ _, Term.some_ _, Term.some_ _, Term.none_ => true
  | _, _, _, _ => false

def rflOk (defs : DefEnv) (t : Term) : Bool :=
  match t with
  | Term.const nm => nm.raw == "rfl" && catchAllNone defs
  | _ => false

/-- depth 0, 1, and 2 are absurd arms. The succ body at depth 2 is rfl.
    A deeper or shorter tree is reject. Fuel bounds the walk. -/
def judgeNest (fuel depth : Nat) (defs : DefEnv) (t : Term) : ByJudgment :=
  match fuel with
  | 0 => ByJudgment.reject
  | Nat.succ f =>
    match t with
    | Term.match_ (Term.var _)
        [(Pat.ctor0 z, bz), (Pat.ctor0 s, bs)] =>
      if z.raw == "zero" && s.raw == "succ" && absurdOk depth bz then
        if depth >= 2 then
          if rflOk defs bs then ByJudgment.accept propTy
          else ByJudgment.reject
        else
          judgeNest f (depth + 1) defs bs
      else
        ByJudgment.reject
    | _ => ByJudgment.reject
termination_by fuel

def startsBy (arms : List (Prod Pat Term)) : Bool :=
  match arms with
  | (Pat.ctor0 c, _) :: _ => c.raw == "zero" || c.raw == "succ"
  | _ => false

/-- The stored filter match, after the plan body misses. -/
def filterJudgment (scrut : Term) (arms : List (Prod Pat Term)) :
    ByJudgment :=
  match filterAfterApply (Term.match_ scrut arms) with
  | some ty => ByJudgment.accept ty
  | none => ByJudgment.notBy

/-- notBy leaves an ordinary Mult match to the existing arm checker.
    A zero or succ scrutinee variable is this proof, accept or reject.
    The stored filterArgs match is List String after that proof misses. -/
def judgeBy (defs : DefEnv) (scrut : Term) (arms : List (Prod Pat Term)) :
    ByJudgment :=
  match scrut with
  | Term.var _ =>
    if startsBy arms then judgeNest 4 0 defs (Term.match_ scrut arms)
    else filterJudgment scrut arms
  | _ => filterJudgment scrut arms

def absurdTerm (k : Nat) : Term :=
  Term.app (Term.app (Term.var (n "absurd")) (Term.var (n "h")))
    (Term.app (Term.const (n "decide"))
      (Term.app (Term.const (n "Not"))
        (Term.app (Term.app (Term.const (n lessTok)) (Term.litNat 2))
          (Term.litNat k))))

def nest (k : Nat) (succBody : Term) : Term :=
  Term.match_ (Term.var (n "n")) [
    (Pat.ctor0 (n "zero"), absurdTerm k),
    (Pat.ctor0 (n "succ"), succBody)
  ]

def storedFailClosed : Term :=
  nest 0 (nest 1 (nest 2 (Term.const (n "rfl"))))

def missingArm : Term :=
  Term.match_ (Term.var (n "n")) [(Pat.ctor0 (n "zero"), absurdTerm 0)]

def falseAbsurd : Term :=
  nest 5 (nest 1 (nest 2 (Term.const (n "rfl"))))

def nonRflArm : Term :=
  nest 0 (nest 1 (nest 2 (Term.const (n "exact"))))

def accepted (j : ByJudgment) : Bool :=
  match j with
  | ByJudgment.accept _ => true
  | _ => false

def judgeStored (t : Term) : ByJudgment :=
  match t with
  | Term.match_ s arms => judgeBy multDefEnv s arms
  | _ => ByJudgment.notBy

def byAcceptsStoredFailClosed : Bool := accepted (judgeStored storedFailClosed)

def byRejectsMissingArm : Bool := !accepted (judgeStored missingArm)

def byRejectsFalseAbsurd : Bool := !accepted (judgeStored falseAbsurd)

def byRejectsNonRflArm : Bool := !accepted (judgeStored nonRflArm)

/-- The stored `unfold` then `rw` then `rfl` term.
    Three bracket arguments, then const rfl. Not `cases` then rfl.
    Not a one-argument rewrite. -/
structure UnfoldRw where
  target : String
  lemmaName : String
  inst : String
  hyp : String

def splitUnfoldRw (t : Term) : Option UnfoldRw :=
  match t with
  | Term.app (Term.app (Term.const unf) (Term.const tgt)) rwTree =>
    match rwTree with
    | Term.app
        (Term.app
          (Term.app
            (Term.app (Term.const rwh) (Term.const lem))
            (Term.const inst))
          (Term.const hyp))
        (Term.const fol) =>
      if unf.raw == "unfold" && rwh.raw == "rw" && fol.raw == "rfl" then
        some {
          target := tgt.raw
          lemmaName := lem.raw
          inst := inst.raw
          hyp := hyp.raw
        }
      else
        none
    | _ => none
  | _ => none

/-- Hypothesis variable on the outer zero arm of the stored proof. -/
def absurdHyp (t : Term) : Option String :=
  match t with
  | Term.match_ _ ((Pat.ctor0 z, bz) :: _) =>
    match bz with
    | Term.app (Term.app (Term.var abs) (Term.var h)) _ =>
      if z.raw == "zero" && abs.raw == "absurd" then some h.raw else none
    | _ => none
  | _ => none

/-- The stored by-cases proof is the equation ofNat? of its scrut
    equals none. judgeBy must accept that stored body again.
    The rewrite's hypothesis must be the absurd variable.
    A missing lemma, a body that is not that proof, and an
    instantiation other than the scrut name are not this equation. -/
def acceptedEq (defs : DefEnv) (lemmaName inst hyp : String) :
    Option (Prod Term Term) :=
  match lookupDef defs lemmaName with
  | none => none
  | some d =>
    match d.body with
    | Term.match_ scrut arms =>
      if d.binder == inst && d.binder != "" && absurdHyp d.body == some hyp then
        match judgeBy defs scrut arms with
        | ByJudgment.accept _ =>
          some (
            Term.app (Term.const (n "ofNat?")) (Term.var (n d.binder)),
            Term.none_)
        | _ => none
      else
        none
    | _ => none

/-- Replace the equation's left side once. No match stays none. -/
def replaceEq (fuel : Nat) (lhs rhs t : Term) : Option Term :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    if termEqN eqFuel t lhs then
      some rhs
    else
      match t with
      | Term.app f a =>
        match replaceEq k lhs rhs f with
        | some f2 => some (Term.app f2 a)
        | none =>
          match replaceEq k lhs rhs a with
          | some a2 => some (Term.app f a2)
          | none => none
      | _ => none
termination_by fuel

/-- Unfold the imported body, rewrite by the accepted equation, then
    rfl. The two sides are the rewritten term and the same body with
    the binder at the catch-all literal 3. Both go through reduceN.
    A name with no body stays none. A rewrite that does not match
    stays none. This does not accept `cases` then rfl. -/
def judgeUnfold (defs : DefEnv) (t : Term) : Option HostType :=
  match splitUnfoldRw t with
  | none => none
  | some u =>
    if u.hyp == "" || u.hyp == u.inst || u.hyp == u.lemmaName then
      none
    else
      match lookupDef defs u.target with
      | none => none
      | some d =>
        if d.binder == "" then
          none
        else
          match acceptedEq defs u.lemmaName u.inst u.hyp with
          | none => none
          | some (lhs, rhs) =>
            match replaceEq eqFuel lhs rhs d.body with
            | none => none
            | some rewritten =>
              let witness := substN eqFuel d.binder (Term.litNat 3) d.body
              rflEqType defs (Term.const (n "rfl"))
                (Term.app
                  (Term.app (Term.const (n "Eq"))
                    (reduceN eqFuel defs rewritten))
                  (reduceN eqFuel defs witness))

def failClosedDefs : DefEnv :=
  ("ofNat?_fail_closed", { binder := "n", body := storedFailClosed })
    :: multDefEnv

def falseLemmaDefs : DefEnv :=
  ("ofNat?_fail_closed", { binder := "n", body := falseAbsurd })
    :: multDefEnv

def unfoldRwTerm (target lemma inst hyp : String) : Term :=
  Term.app
    (Term.app (Term.const (n "unfold")) (Term.const (n target)))
    (Term.app
      (Term.app
        (Term.app
          (Term.app (Term.const (n "rw")) (Term.const (n lemma)))
          (Term.const (n inst)))
        (Term.const (n hyp)))
      (Term.const (n "rfl")))

def storedUnfoldRw : Term :=
  unfoldRwTerm "isValidTag" "ofNat?_fail_closed" "n" "h"

def unfoldChecked (defs : DefEnv) (t : Term) : Bool :=
  match judgeUnfold defs t with
  | some _ => true
  | none => false

def unfoldAcceptsStored : Bool :=
  unfoldChecked failClosedDefs storedUnfoldRw

def unfoldRejectsNoLemma : Bool :=
  !unfoldChecked multDefEnv storedUnfoldRw

def unfoldRejectsNoBody : Bool :=
  !unfoldChecked failClosedDefs
    (unfoldRwTerm "missing" "ofNat?_fail_closed" "n" "h")

def unfoldRejectsMismatch : Bool :=
  !unfoldChecked failClosedDefs
    (unfoldRwTerm "isValidTag" "ofNat?_fail_closed" "m" "h")

def unfoldRejectsNoMatch : Bool :=
  !unfoldChecked failClosedDefs
    (unfoldRwTerm "name" "ofNat?_fail_closed" "n" "h")

def unfoldRejectsFalseLemma : Bool :=
  !unfoldChecked falseLemmaDefs storedUnfoldRw

def casesRflTree : Term :=
  Term.app
    (Term.app (Term.const (n "cases")) (Term.const (n "m")))
    (Term.const (n "rfl"))

def unfoldRejectsCasesRfl : Bool :=
  !unfoldChecked failClosedDefs casesRflTree

/-- `cases` applied to one scrut constant, then const rfl.
    A follower other than rfl is none. Not unfold. -/
def splitCasesRfl (t : Term) : Option String :=
  match t with
  | Term.app (Term.app (Term.const cs) (Term.const scrut)) (Term.const tac) =>
    if cs.raw == "cases" && tac.raw == "rfl" && scrut.raw != "" then
      some scrut.raw
    else
      none
  | _ => none

/-- rfl of isValid on one constructor against true.
    reduceN of the imported body decides the arm.
    A constructor that match skips does not reduce, so this is false. -/
def ctorCloses (defs : DefEnv) (c : String) : Bool :=
  match rflEqType defs (Term.const (n "rfl"))
      (Term.app
        (Term.app (Term.const (n "Eq"))
          (Term.app (Term.const (n "isValid")) (Term.const (n c))))
        (Term.litBool true)) with
  | some _ => true
  | none => false

/-- Tail of the constructor list. An empty tail is the end, not a skip. -/
def closeRest (defs : DefEnv) (cs : List CtorDecl) : Bool :=
  match cs with
  | [] => true
  | c :: rest => ctorCloses defs c.name.raw && closeRest defs rest

/-- Every constructor. An empty list is not a complete split. -/
def allCtorsClose (defs : DefEnv) (cs : List CtorDecl) : Bool :=
  match cs with
  | [] => false
  | c :: rest => ctorCloses defs c.name.raw && closeRest defs rest

/-- The same rfl runs on every Mult constructor.
    The scrut name is not required to be the isValid binder.
    A missing constructor stays rejected.
    This does not accept unfold or a one-argument rewrite. -/
def judgeCases (defs : DefEnv) (t : Term) : Option HostType :=
  match splitCasesRfl t with
  | none => none
  | some scrut =>
    if scrut == "cases" || scrut == "rfl" || scrut == "unfold" then
      none
    else if allCtorsClose defs multCtors then
      some propTy
    else
      none

/-- `unfold <target>` then `rw` of one name then const rfl.
    Three-argument `rw` is not this shape. `cases` is not. -/
structure RwHyp where
  target : String
  hyp : String

def splitRwHyp (t : Term) : Option RwHyp :=
  match t with
  | Term.app (Term.app (Term.const unf) (Term.const tgt)) rwTree =>
    match rwTree with
    | Term.app (Term.app (Term.const rwh) (Term.const hyp)) (Term.const fol) =>
      if unf.raw == "unfold" && rwh.raw == "rw" && fol.raw == "rfl" then
        some { target := tgt.raw, hyp := hyp.raw }
      else
        none
    | _ => none
  | _ => none

/-- The local hypothesis is ofNat? of the unfolded binder equals some m.
    A stored definition under that name is a different equation. -/
def localSomeEq (binder : String) : Prod Term Term :=
  (
    Term.app (Term.const (n "ofNat?")) (Term.var (n binder)),
    Term.some_ (Term.var (n "m"))
  )

def judgeRwHyp (defs : DefEnv) (t : Term) : Option HostType :=
  match splitRwHyp t with
  | none => none
  | some u =>
    if u.hyp == "" || u.hyp == u.target || u.hyp == "m" then
      none
    else
      match lookupDef defs u.hyp with
      | some _ => none
      | none =>
        match lookupDef defs u.target with
        | none => none
        | some d =>
          if d.binder == "" || d.binder == u.hyp then
            none
          else
            match localSomeEq d.binder with
            | (lhs, rhs) =>
              match replaceEq eqFuel lhs rhs d.body with
              | none => none
              | some rewritten =>
                rflEqType defs (Term.const (n "rfl"))
                  (Term.app
                    (Term.app (Term.const (n "Eq")) rewritten)
                    (Term.litBool true))

/-- Unfold first, then cases, then one local equality rewrite.
    `>` of two nat sides is Bool after those miss.
    The stored ssot search is Option String after that miss.
    requireFile is IO Unit only after that search misses.
    The stored spec list is List ComposeSsotSpec after that miss.
    The stored read is IO String after that list misses.
    The stored marker is String after that read misses.
    A stuck comparison is not rewritten to true.
    A missing block is not turned into some.
    A missing path stays the error arm.
    An empty list is not the spec list. -/
def judgeTactic (defs : DefEnv) (t : Term) : Option HostType :=
  match judgeUnfold defs t with
  | some ty => some ty
  | none =>
    match judgeCases defs t with
    | some ty => some ty
    | none =>
      match judgeRwHyp defs t with
      | some ty => some ty
      | none => markerAfterRead t

/-- The ite miss. The marker runs first.
    This plan body is IO Unit only after that marker misses.
    Incomplete inputs stay the error arm. -/
def requireAfterMiss (t : Term) : Option HostType :=
  applyAfterMarker t

def isValidSkipOmega : Term :=
  Term.match_ (Term.var (n "scrut")) [
    (Pat.ctor0 (n "mult0"), Term.litBool true),
    (Pat.ctor0 (n "mult1"), Term.litBool true)
  ]

def skipOmegaDefs : DefEnv :=
  ("isValid", { binder := "scrut", body := isValidSkipOmega }) :: multDefEnv

def casesExactTree : Term :=
  Term.app
    (Term.app (Term.const (n "cases")) (Term.const (n "m")))
    (Term.const (n "exact"))

def casesChecked (defs : DefEnv) (t : Term) : Bool :=
  match judgeCases defs t with
  | some _ => true
  | none => false

def casesAcceptsStored : Bool :=
  casesChecked multDefEnv casesRflTree

def casesRejectsSkipCtor : Bool :=
  !casesChecked skipOmegaDefs casesRflTree

def casesRejectsNoBody : Bool :=
  !casesChecked [] casesRflTree

def casesRejectsNonRfl : Bool :=
  !casesChecked multDefEnv casesExactTree

def casesRejectsUnfoldTree : Bool :=
  !casesChecked failClosedDefs storedUnfoldRw

def casesRejectsEmptyCtors : Bool :=
  !allCtorsClose multDefEnv []

def tacticAcceptsCases : Bool :=
  match judgeTactic multDefEnv casesRflTree with
  | some _ => true
  | none => false

def tacticKeepsUnfold : Bool :=
  match judgeTactic failClosedDefs storedUnfoldRw with
  | some _ => true
  | none => false

def rwHypTerm (target hyp : String) : Term :=
  Term.app
    (Term.app (Term.const (n "unfold")) (Term.const (n target)))
    (Term.app
      (Term.app (Term.const (n "rw")) (Term.const (n hyp)))
      (Term.const (n "rfl")))

def storedRwHyp : Term :=
  rwHypTerm "isValidTag" "h"

def rwHypChecked (defs : DefEnv) (t : Term) : Bool :=
  match judgeRwHyp defs t with
  | some _ => true
  | none => false

def rwHypAcceptsStored : Bool :=
  rwHypChecked multDefEnv storedRwHyp

def rwHypRejectsLemma : Bool :=
  !rwHypChecked failClosedDefs (rwHypTerm "isValidTag" "ofNat?_fail_closed")

def rwHypRejectsNoMatch : Bool :=
  !rwHypChecked multDefEnv (rwHypTerm "name" "h")

def rwHypRejectsNoBody : Bool :=
  !rwHypChecked multDefEnv (rwHypTerm "missing" "h")

def rwHypRejectsBinder : Bool :=
  !rwHypChecked multDefEnv (rwHypTerm "isValidTag" "n")

def rwHypRejectsRhs : Bool :=
  !rwHypChecked multDefEnv (rwHypTerm "isValidTag" "m")

def rwHypRejectsThreeArg : Bool :=
  !rwHypChecked failClosedDefs storedUnfoldRw

def rwHypRejectsCases : Bool :=
  !rwHypChecked multDefEnv casesRflTree

def tacticAcceptsRwHyp : Bool :=
  match judgeTactic multDefEnv storedRwHyp with
  | some _ => true
  | none => false

end SystemsLean.HostKernelBy
