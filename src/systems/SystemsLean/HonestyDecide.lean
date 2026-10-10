/-
  Module: SystemsLean.HonestyDecide
  Reduction for `by decide` on the honesty surface.
  A nullary def unfolds. `&&` is `if c then t else false`.
  `==` becomes true only when both sides reduce to the same
  Bool or the same string. A different value is false.
  A decide whose sides differ stays rejected.
  This is not a general Lean tactic. It does not call
  Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostKernelReduce

namespace SystemsLean.HonestyDecide

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce

/-- Fuel for one decide. Same depth family as reduceFuel. -/
def decideFuel : Nat := 64

def valueEq : Term -> Term -> Bool
  | Term.litBool a, Term.litBool b => a == b
  | Term.litString a, Term.litString b => a == b
  | _, _ => false

def isDecided : Term -> Bool
  | Term.litBool _ => true
  | Term.litString _ => true
  | _ => false

/-- Unfold a nullary def, then reduce `if` and `==`.
    A def with a binder stays stuck. Stuck sides are not true. -/
def decideReduce (fuel : Nat) (defs : DefEnv) (t : Term) : Term :=
  match fuel with
  | 0 => t
  | Nat.succ k =>
    match t with
    | Term.var x =>
      match lookupDef defs x.raw with
      | some d =>
        if d.binder == "" then decideReduce k defs d.body else t
      | none => t
    | Term.ite c t1 e =>
      match decideReduce k defs c with
      | Term.litBool true => decideReduce k defs t1
      | Term.litBool false => decideReduce k defs e
      | c' =>
        Term.ite c' (decideReduce k defs t1) (decideReduce k defs e)
    | Term.decideEq a b =>
      let a' := decideReduce k defs a
      let b' := decideReduce k defs b
      if valueEq a' b' then Term.litBool true
      else if isDecided a' && isDecided b' then Term.litBool false
      else Term.decideEq a' b'
    | _ => t
termination_by fuel

/-- True only when both sides reduce to the same Bool or string. -/
def decideHolds (defs : DefEnv) (lhs rhs : Term) : Bool :=
  valueEq (decideReduce decideFuel defs lhs) (decideReduce decideFuel defs rhs)

def toyEnv : DefEnv :=
  [ ("b", { binder := "", body := Term.litBool true })
  , ("a", { binder := "", body := Term.litString "A" })
  , ("ok", { binder := "", body :=
      (Term.ite
        (Term.decideEq (Term.var (n "a")) (Term.litString "A"))
        (Term.var (n "b"))
        (Term.litBool false)) })
  ]

def decideToyTrue : Bool :=
  decideHolds toyEnv (Term.var (n "b")) (Term.litBool true)

def decideToyFalseRejects : Bool :=
  !decideHolds toyEnv (Term.var (n "b")) (Term.litBool false)

def decideToyString : Bool :=
  decideHolds toyEnv (Term.var (n "a")) (Term.litString "A")

def decideToyWrongStringRejects : Bool :=
  !decideHolds toyEnv (Term.var (n "a")) (Term.litString "B")

def decideToyChain : Bool :=
  decideHolds toyEnv (Term.var (n "ok")) (Term.litBool true)

end SystemsLean.HonestyDecide
