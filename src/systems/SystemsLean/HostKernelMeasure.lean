/-
  Module: SystemsLean.HostKernelMeasure
  One stored IO Unit measure. The condition is measureIf applied
  to the Bool name. The then-arm is a non-empty nested IO.println.
  The else-arm is IO.eprintln and IO.userError, both strings.
  Bool true is not this measure. A false Bool stays false.
  This runs only after the apply body misses.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm

namespace SystemsLean.HostKernelMeasure

open SystemsLean.HostTerm

def ioUnit : HostType :=
  HostType.named (n "IO.Unit")

def printOne (s : String) : Term :=
  Term.app (Term.const (n "IO.println")) (Term.litString s)

/-- Right-nested prints. Empty is not a println. -/
def printLines : List String -> Term
  | [] => Term.const (n "measureEmpty")
  | s :: [] => printOne s
  | s :: r :: rest =>
    Term.app (printOne s) (printLines (r :: rest))

def elseArm (errS throwS : String) : Term :=
  Term.app
    (Term.app (Term.const (n "IO.eprintln")) (Term.litString errS))
    (Term.app (Term.const (n "IO.userError")) (Term.litString throwS))

/-- The stored measure body. The condition is not a Bool literal. -/
def measureBody (cond : String) (lines : List String)
    (errS throwS : String) : Term :=
  Term.ite
    (Term.app (Term.const (n "measureIf")) (Term.var (n cond)))
    (printLines lines)
    (elseArm errS throwS)

def isMeasureIf (t : Term) : Bool :=
  match t with
  | Term.app (Term.const f) (Term.var _) => f.raw == "measureIf"
  | _ => false

def isElse (t : Term) : Bool :=
  match t with
  | Term.app
      (Term.app (Term.const e) (Term.litString _))
      (Term.app (Term.const u) (Term.litString _)) =>
    e.raw == "IO.eprintln" && u.raw == "IO.userError"
  | _ => false

/-- At least one IO.println. A bare Bool is false. -/
def printsOk (fuel : Nat) (t : Term) : Bool :=
  match fuel with
  | 0 => false
  | Nat.succ k =>
    match t with
    | Term.app (Term.app (Term.const f) (Term.litString _)) next =>
      f.raw == "IO.println" && printsOk k next
    | Term.app (Term.const f) (Term.litString _) =>
      f.raw == "IO.println"
    | _ => false
termination_by fuel

/-- IO Unit only for that ite. Bool true is none. -/
def measureType (t : Term) : Option HostType :=
  match t with
  | Term.ite c th el =>
    if isMeasureIf c && printsOk 64 th && isElse el then
      some ioUnit
    else
      none
  | _ => none

def rejectsBool : Bool :=
  match measureType (Term.litBool true) with
  | none => true
  | _ => false

def rejectsTrueCond : Bool :=
  match measureType
      (Term.ite (Term.litBool true) (printOne "x") (elseArm "e" "t")) with
  | none => true
  | _ => false

def acceptsOne : Bool :=
  match measureType (measureBody "ok" ["hi"] "e" "t") with
  | some (HostType.named nm) => nm.raw == "IO.Unit"
  | _ => false

end SystemsLean.HostKernelMeasure
