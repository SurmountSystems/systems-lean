/-
  Module: SystemsLean.HostKernelRfl
  rfl on one equality. The front writes const rfl applied to const Eq
  applied to two terms. The sides match when reduction makes them
  the same term.
  That statement's type on this surface is named Prop.
  Unequal sides are not that type. A head other than Eq is not that
  statement. A body that is not rfl is not this rule.
  This does not accept every named Prop.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HostKernelReduce

namespace SystemsLean.HostKernelRfl

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce (DefEnv reduceN)

/-- Fuel for one structural term comparison. -/
def eqFuel : Nat := 64

def patEq (a b : Pat) : Bool :=
  match a, b with
  | Pat.wild, Pat.wild => true
  | Pat.litNat x, Pat.litNat y => x == y
  | Pat.var x, Pat.var y => x.raw == y.raw
  | Pat.ctor0 x, Pat.ctor0 y => x.raw == y.raw
  | Pat.someVar x, Pat.someVar y => x.raw == y.raw
  | _, _ => false

mutual

def termEqN (fuel : Nat) (a b : Term) : Bool :=
  match fuel with
  | 0 => false
  | Nat.succ k =>
    match a, b with
    | Term.var x, Term.var y => x.raw == y.raw
    | Term.litNat x, Term.litNat y => x == y
    | Term.litString x, Term.litString y => x == y
    | Term.litBool x, Term.litBool y => x == y
    | Term.const x, Term.const y => x.raw == y.raw
    | Term.app f1 x1, Term.app f2 x2 =>
      termEqN k f1 f2 && termEqN k x1 x2
    | Term.some_ x, Term.some_ y => termEqN k x y
    | Term.none_, Term.none_ => true
    | Term.match_ s1 a1, Term.match_ s2 a2 =>
      termEqN k s1 s2 && armEqN k a1 a2
    | Term.ite c1 t1 e1, Term.ite c2 t2 e2 =>
      termEqN k c1 c2 && termEqN k t1 t2 && termEqN k e1 e2
    | Term.structLit f1, Term.structLit f2 => fieldEqN k f1 f2
    | Term.decideEq x1 y1, Term.decideEq x2 y2 =>
      termEqN k x1 x2 && termEqN k y1 y2
    | Term.proj o1 f1, Term.proj o2 f2 =>
      termEqN k o1 o2 && f1.raw == f2.raw
    | _, _ => false
termination_by fuel

def armEqN (fuel : Nat) (a b : List (Prod Pat Term)) : Bool :=
  match fuel with
  | 0 => false
  | Nat.succ k =>
    match a, b with
    | [], [] => true
    | (p1, t1) :: r1, (p2, t2) :: r2 =>
      patEq p1 p2 && termEqN k t1 t2 && armEqN k r1 r2
    | _, _ => false
termination_by fuel

def fieldEqN (fuel : Nat) (a b : List (Prod Name Term)) : Bool :=
  match fuel with
  | 0 => false
  | Nat.succ k =>
    match a, b with
    | [], [] => true
    | (n1, t1) :: r1, (n2, t2) :: r2 =>
      n1.raw == n2.raw && termEqN k t1 t2 && fieldEqN k r1 r2
    | _, _ => false
termination_by fuel

end

/-- const Eq applied to two terms. Any other term is not this statement. -/
def eqStatement (t : Term) : Option (Prod Term Term) :=
  match t with
  | Term.app (Term.app (Term.const head) lhs) rhs =>
    if head.raw == "Eq" then some (lhs, rhs) else none
  | _ => none

/-- rfl applied to an equality the front already parsed.
    Reduce both sides with the imported definitions, then compare.
    When the reduced sides are the same term, inference is named Prop.
    Sides that still differ are none. A non-Eq argument is none.
    A function other than rfl is none.
    This is not a rule that every named Prop body succeeds.
    This is not a by or cases tactic. -/
def rflEqType (defs : DefEnv) (fn arg : Term) : Option HostType :=
  match fn with
  | Term.const name =>
    if name.raw != "rfl" then
      none
    else
      match eqStatement arg with
      | none => none
      | some (lhs, rhs) =>
        let l := reduceN eqFuel defs lhs
        let r := reduceN eqFuel defs rhs
        if termEqN eqFuel l r then
          some (HostType.named (n "Prop"))
        else
          none
  | _ => none

end SystemsLean.HostKernelRfl
