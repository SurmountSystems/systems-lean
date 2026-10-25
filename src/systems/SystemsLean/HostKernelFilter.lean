/-
  Module: SystemsLean.HostKernelFilter
  The stored filterArgs body types as List String.
  Nil is List.nil. The first cons drops the cell.
  The second cons keeps the head.
  An arbitrary list is not this function. Bool true is not it.
  The plan body, the marker, the read, the spec list,
  requireFile, the ssot search, and `>` run first
  and are not rewritten.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.HostKernelApply

namespace SystemsLean.HostKernelFilter

open SystemsLean.HostTerm
open SystemsLean.HostKernelApply (applyAfterMarker)

def listStr : HostType :=
  HostType.named (n "List String")

def isNilArm (p : Pat) (t : Term) : Bool :=
  match p, t with
  | Pat.ctor0 c, Term.const k =>
    c.raw == "nil" && k.raw == "List.nil"
  | _, _ => false

/-- Drop arm: filterArgs rest. A kept head is false. -/
def isDropArm (p : Pat) (t : Term) : Bool :=
  match p, t with
  | Pat.ctor0 c, Term.app (Term.const f) (Term.var r) =>
    c.raw == "cons" && f.raw == "filterArgs" && r.raw == "rest"
  | _, _ => false

/-- Keep arm: a :: filterArgs rest. A bare recurse is false. -/
def isKeepArm (p : Pat) (t : Term) : Bool :=
  match p, t with
  | Pat.ctor0 c,
    Term.app
      (Term.app (Term.const cons) (Term.var a))
      (Term.app (Term.const f) (Term.var r)) =>
    c.raw == "cons" && cons.raw == "::"
      && a.raw == "a" && f.raw == "filterArgs" && r.raw == "rest"
  | _, _ => false

/-- List String only for those three arms, in that order. -/
def filterType (t : Term) : Option HostType :=
  match t with
  | Term.match_ (Term.var s) [a1, a2, a3] =>
    if s.raw == "args"
        && isNilArm a1.fst a1.snd
        && isDropArm a2.fst a2.snd
        && isKeepArm a3.fst a3.snd then
      some listStr
    else
      none
  | _ => none

/-- The plan body first. This match only after that misses. -/
def filterAfterApply (t : Term) : Option HostType :=
  match applyAfterMarker t with
  | some ty => some ty
  | none => filterType t

def dropArm : Term :=
  Term.app (Term.const (n "filterArgs")) (Term.var (n "rest"))

def keepArm : Term :=
  Term.app
    (Term.app (Term.const (n "::")) (Term.var (n "a")))
    dropArm

def stored : Term :=
  Term.match_ (Term.var (n "args"))
    [ (Pat.ctor0 (n "nil"), Term.const (n "List.nil"))
    , (Pat.ctor0 (n "cons"), dropArm)
    , (Pat.ctor0 (n "cons"), keepArm) ]

def acceptsStored : Bool :=
  match filterType stored with
  | some (HostType.named nm) => nm.raw == "List String"
  | _ => false

def rejectsBool : Bool :=
  match filterType (Term.litBool true) with
  | none => true
  | _ => false

def rejectsShort : Bool :=
  match filterType
      (Term.match_ (Term.var (n "args"))
        [(Pat.ctor0 (n "nil"), Term.const (n "List.nil"))]) with
  | none => true
  | _ => false

def applyStill : Bool :=
  match filterAfterApply SystemsLean.HostKernelApply.stored with
  | some (HostType.named nm) => nm.raw == "IO.Unit"
  | _ => false

end SystemsLean.HostKernelFilter
