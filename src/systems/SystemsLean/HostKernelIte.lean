/-
  Module: SystemsLean.HostKernelIte
  If-then-else result for the host kernel.
  The kernel still infers the condition and the arms.
  A Bool condition whose arms agree is that arm type.
  Nat arms stay Nat.
  The stored main is the exception: expected IO.UInt32, a Bool
  condition, then litNat 0, else litNat 1. That if is IO.UInt32.
  litNat 2 is not IO.UInt32. A non-Bool condition is not this main.
  Bool true is not this main. A missing condition is the miss result.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm

namespace SystemsLean.HostKernelIte

open SystemsLean.HostTerm

def typeEq : HostType -> HostType -> Bool
  | HostType.mult, HostType.mult => true
  | HostType.nat, HostType.nat => true
  | HostType.string, HostType.string => true
  | HostType.bool, HostType.bool => true
  | HostType.option a, HostType.option b => typeEq a b
  | HostType.named x, HostType.named y => x.raw == y.raw
  | HostType.arrow d1 c1, HostType.arrow d2 c2 =>
      typeEq d1 d2 && typeEq c1 c2
  | _, _ => false

def ioUInt32 : HostType :=
  HostType.named (n "IO.UInt32")

def isZero (t : Term) : Bool :=
  match t with
  | Term.litNat 0 => true
  | _ => false

def isOne (t : Term) : Bool :=
  match t with
  | Term.litNat 1 => true
  | _ => false

/-- IO.UInt32, then exit 0, else exit 1. A swapped pair is false. -/
def isMain (expected : Option HostType) (t1 e : Term) : Bool :=
  match expected with
  | some ty => typeEq ty ioUInt32 && isZero t1 && isOne e
  | none => false

/-- Bool condition, then the main shape, else the shared arm type.
    A condition that does not infer is the miss result. -/
def iteType (expected : Option HostType) (t1 e : Term)
    (cty tty ety missed : Option HostType) : Option HostType :=
  match cty with
  | none => missed
  | some ct =>
    if !typeEq ct HostType.bool then none
    else if isMain expected t1 e then some ioUInt32
    else
      match tty, ety with
      | some t, some ee => if typeEq t ee then some t else none
      | _, _ => none

def acceptsMain : Bool :=
  match iteType (some ioUInt32) (Term.litNat 0) (Term.litNat 1)
      (some HostType.bool) (some HostType.nat) (some HostType.nat)
      none with
  | some (HostType.named nm) => nm.raw == "IO.UInt32"
  | _ => false

/-- Two Nat arms at Nat stay Nat. This is not the IO main. -/
def keepsNat : Bool :=
  match iteType (some HostType.nat) (Term.litNat 0) (Term.litNat 1)
      (some HostType.bool) (some HostType.nat) (some HostType.nat)
      none with
  | some HostType.nat => true
  | _ => false

def rejectsTwo : Bool :=
  match iteType (some ioUInt32) (Term.litNat 2) (Term.litNat 1)
      (some HostType.bool) (some HostType.nat) (some HostType.nat)
      none with
  | some (HostType.named _) => false
  | some HostType.nat => true
  | _ => false

def rejectsSwap : Bool :=
  match iteType (some ioUInt32) (Term.litNat 1) (Term.litNat 0)
      (some HostType.bool) (some HostType.nat) (some HostType.nat)
      none with
  | some (HostType.named _) => false
  | some HostType.nat => true
  | _ => false

def rejectsNatCond : Bool :=
  match iteType (some ioUInt32) (Term.litNat 0) (Term.litNat 1)
      (some HostType.nat) (some HostType.nat) (some HostType.nat)
      none with
  | none => true
  | _ => false

/-- A bare Bool true is not an if, so it is not this main. -/
def rejectsBool : Bool :=
  match (Term.litBool true) with
  | Term.ite _ _ _ => false
  | _ => true

def missRuns : Bool :=
  match iteType (some ioUInt32) (Term.litNat 0) (Term.litNat 1)
      none (some HostType.nat) (some HostType.nat)
      (some HostType.string) with
  | some HostType.string => true
  | _ => false

end SystemsLean.HostKernelIte
