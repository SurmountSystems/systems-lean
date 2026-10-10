/-
  Module: SystemsLean.HostKernelMarker
  The stored buildComposeMarker body types as String.
  It is seven string literals joined by `++`, in that order.
  An arbitrary string is not this marker. Bool true is not it.
  The read, the spec list, requireFile, the ssot search,
  and `>` run first and are not rewritten.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HostKernelRead

namespace SystemsLean.HostKernelMarker

open SystemsLean.HostTerm
open SystemsLean.HostKernelRead (readAfterSpecs)

def s0 : String := "{" ++ "writerPathStepCompose}\\n"

def sPlan : String := "ROLE-plan:\\n{" ++ "plan" ++ "}\\n"

def sApply : String := "ROLE-apply:\\n{" ++ "apply" ++ "}\\n"

def sBody : String := "ROLE-body:\\n{" ++ "body" ++ "}\\n"

def sStage : String := "STAGE:{stageId}\\n"

def sContract : String := "CONTRACT:{contractStepCompose}\\n"

def sGap : String := "GAP:{gapCompose}\\n"

def want : List String :=
  [sPlan, sApply, sBody, sStage, sContract, sGap]

/-- Peel one `++` of a string literal. Other apps are none. -/
def peel (n : Nat) (t : Term) (acc : List String) :
    Option (Prod Term (List String)) :=
  match n with
  | 0 => some (t, acc)
  | Nat.succ k =>
    match t with
    | Term.app (Term.app (Term.const c) a) (Term.litString s) =>
      if c.raw == "++" then peel k a (s :: acc) else none
    | _ => none

/-- String only for those seven literals. A shorter chain is none. -/
def markerType (t : Term) : Option HostType :=
  match peel 6 t [] with
  | some (Term.litString s, ss) =>
    if s == s0 && ss == want then some HostType.string else none
  | _ => none

/-- The read first. This marker only after that misses. -/
def markerAfterRead (t : Term) : Option HostType :=
  match readAfterSpecs t with
  | some ty => some ty
  | none => markerType t

def lit (s : String) : Term :=
  Term.litString s

def appPlus (a b : Term) : Term :=
  Term.app (Term.app (Term.const (n "++")) a) b

def stored : Term :=
  appPlus
    (appPlus
      (appPlus
        (appPlus
          (appPlus
            (appPlus (lit s0) (lit sPlan))
            (lit sApply))
          (lit sBody))
        (lit sStage))
      (lit sContract))
    (lit sGap)

def acceptsStored : Bool :=
  match markerType stored with
  | some HostType.string => true
  | _ => false

def rejectsPlain : Bool :=
  match markerType (lit s0) with
  | none => true
  | _ => false

def rejectsBool : Bool :=
  match markerType (Term.litBool true) with
  | none => true
  | _ => false

def rejectsShort : Bool :=
  match markerType (appPlus (lit "a") (lit "b")) with
  | none => true
  | _ => false

def readStill : Bool :=
  match markerAfterRead SystemsLean.HostKernelRead.stored with
  | some (HostType.named nm) => nm.raw == "IO.String"
  | _ => false

end SystemsLean.HostKernelMarker
