/-
  Module: SystemsLean.HostKernelForward
  The stored thin main is one application.
  The function is SystemsLean.<one segment>.main.
  The argument is a variable whose type is List String.
  Expected IO.UInt32. The const is not already bound.
  A false Bool stays false. Bool true is not this main.
  litNat 2 is not IO.UInt32. Expected Nat is not this main.
  A named Prop is not this main.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm

namespace SystemsLean.HostKernelForward

open SystemsLean.HostTerm

def ioUInt32 : HostType :=
  HostType.named (n "IO.UInt32")

def listString : HostType :=
  HostType.named (n "List String")

/-- SystemsLean.<one segment>.main. An extra dot is false. -/
def isThinCallee (raw : String) : Bool :=
  match raw.splitOn "." with
  | ["SystemsLean", mid, "main"] => mid != ""
  | _ => false

/-- IO.UInt32 only for that unbound const applied to List String. -/
def forwardMain
    (expected : Option HostType)
    (fnTy : Option HostType)
    (fn : Name)
    (arg : Term)
    (argTy : Option HostType) : Option HostType :=
  match fnTy, expected, arg, argTy with
  | none, some (HostType.named exp), Term.var _,
      some (HostType.named got) =>
    if exp.raw == "IO.UInt32" && got.raw == "List String"
        && isThinCallee fn.raw then
      some ioUInt32
    else
      none
  | _, _, _, _ => none

def stored : Term :=
  Term.app
    (Term.const (n "SystemsLean.CapableCompose.main"))
    (Term.var (n "args"))

def acceptsStored : Bool :=
  match stored with
  | Term.app (Term.const f) a =>
    match forwardMain (some ioUInt32) none f a (some listString) with
    | some (HostType.named nm) => nm.raw == "IO.UInt32"
    | _ => false
  | _ => false

def acceptsSibling : Bool :=
  match forwardMain (some ioUInt32) none
      (n "SystemsLean.Capable.main")
      (Term.var (n "args")) (some listString) with
  | some (HostType.named nm) => nm.raw == "IO.UInt32"
  | _ => false

def acceptsRead : Bool :=
  match forwardMain (some ioUInt32) none
      (n "SystemsLean.CapableRead.main")
      (Term.var (n "argv")) (some listString) with
  | some (HostType.named nm) => nm.raw == "IO.UInt32"
  | _ => false

def rejectsBool : Bool :=
  match forwardMain (some ioUInt32) none
      (n "SystemsLean.CapableCompose.main")
      (Term.litBool true) (some HostType.bool) with
  | none => true
  | _ => false

def rejectsFalse : Bool :=
  match forwardMain (some ioUInt32) none
      (n "SystemsLean.CapableCompose.main")
      (Term.litBool false) (some HostType.bool) with
  | none => true
  | _ => false

def rejectsLitNat : Bool :=
  match forwardMain (some ioUInt32) none
      (n "SystemsLean.CapableCompose.main")
      (Term.litNat 2) (some HostType.nat) with
  | none => true
  | _ => false

def rejectsNatExpected : Bool :=
  match forwardMain (some HostType.nat) none
      (n "SystemsLean.CapableCompose.main")
      (Term.var (n "args")) (some listString) with
  | none => true
  | _ => false

def rejectsProp : Bool :=
  match forwardMain (some (HostType.named (n "Prop"))) none
      (n "SystemsLean.CapableCompose.main")
      (Term.var (n "args")) (some listString) with
  | none => true
  | _ => false

def rejectsExtraDot : Bool :=
  match forwardMain (some ioUInt32) none
      (n "SystemsLean.Foo.Bar.main")
      (Term.var (n "args")) (some listString) with
  | none => true
  | _ => false

def rejectsBound : Bool :=
  match forwardMain (some ioUInt32) (some HostType.nat)
      (n "SystemsLean.CapableCompose.main")
      (Term.var (n "args")) (some listString) with
  | none => true
  | _ => false

end SystemsLean.HostKernelForward
