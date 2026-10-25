/-
  Module: SystemsLean.HostKernelSpecs
  The stored planApplyBodySpecs list types as List ComposeSsotSpec.
  Each cell is List.cons of a structLit. The tail ends at List.nil.
  Fields are base, token, headerBlock, bodyBlock, role.
  Each field value is a string literal.
  An empty list is not this list. A non-string field is a miss.
  requireFile, the ssot search, and `>` run first and are not rewritten.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.HostKernelRequire
import SystemsLean.HostKernelDual

namespace SystemsLean.HostKernelSpecs

open SystemsLean.HostTerm
open SystemsLean.HostKernelRequire (requireAfterSsot)
open SystemsLean.HostKernelDual (dualListType)

def listTy : HostType :=
  HostType.named (n "List ComposeSsotSpec")

def want : List String :=
  ["base", "token", "headerBlock", "bodyBlock", "role"]

def fieldNames : List (Prod Name Term) -> List String
  | [] => []
  | (nm, _) :: rest => nm.raw :: fieldNames rest

def fieldsAreStrings : List (Prod Name Term) -> Bool
  | [] => true
  | (_, Term.litString _) :: rest => fieldsAreStrings rest
  | _ => false

/-- Five string fields, in that order. A bool field is false. -/
def specOk : Term -> Bool
  | Term.structLit fs =>
    fieldNames fs == want && fieldsAreStrings fs
  | _ => false

def tailOk : Term -> Bool
  | Term.const c => c.raw == "List.nil"
  | Term.app (Term.app (Term.const c) h) t =>
    c.raw == "List.cons" && specOk h && tailOk t
  | _ => false

/-- At least one cons. A bare nil is not this list. -/
def listOk : Term -> Bool
  | Term.app (Term.app (Term.const c) h) t =>
    c.raw == "List.cons" && specOk h && tailOk t
  | _ => false

def specsType (t : Term) : Option HostType :=
  if listOk t then some listTy else none

/-- requireFile first. The five-field list only after that misses.
    A four-field DualSsotSpec list only after the five-field list misses. -/
def specsAfterRequire (t : Term) : Option HostType :=
  match requireAfterSsot t with
  | some ty => some ty
  | none =>
    match specsType t with
    | some ty => some ty
    | none => dualListType t

def oneSpec : Term :=
  Term.structLit
    [ (n "base", Term.litString "host_emit_plan.ssot.txt")
    , (n "token", Term.litString "HOST-EMIT-PLAN")
    , (n "headerBlock", Term.litString "PLAN_C_HEADER")
    , (n "bodyBlock", Term.litString "PLAN_C_BODY")
    , (n "role", Term.litString "plan") ]

def oneList : Term :=
  Term.app (Term.app (Term.const (n "List.cons")) oneSpec)
    (Term.const (n "List.nil"))

def acceptsOne : Bool :=
  match specsType oneList with
  | some (HostType.named nm) => nm.raw == "List ComposeSsotSpec"
  | _ => false

def rejectsNil : Bool :=
  match specsType (Term.const (n "List.nil")) with
  | none => true
  | _ => false

def badSpec : Term :=
  Term.structLit
    [ (n "base", Term.litBool true)
    , (n "token", Term.litString "T")
    , (n "headerBlock", Term.litString "H")
    , (n "bodyBlock", Term.litString "B")
    , (n "role", Term.litString "plan") ]

def badList : Term :=
  Term.app (Term.app (Term.const (n "List.cons")) badSpec)
    (Term.const (n "List.nil"))

def rejectsNonString : Bool :=
  match specsType badList with
  | none => true
  | _ => false

def requireTerm : Term :=
  Term.ite
    (Term.proj (Term.var (n "path")) (n "pathExists"))
    Term.none_
    (Term.some_
      (Term.app (Term.const (n "IO.userError"))
        (Term.litString "missing")))

def requireStillUnit : Bool :=
  match specsAfterRequire requireTerm with
  | some (HostType.named nm) => nm.raw == "IO.Unit"
  | _ => false

def lenGt : Term :=
  Term.app
    (Term.app (Term.const (n ">"))
      (Term.proj (Term.var (n "s")) (n "length")))
    (Term.litNat 1)

def gtStillBool : Bool :=
  match specsAfterRequire lenGt with
  | some HostType.bool => true
  | _ => false

end SystemsLean.HostKernelSpecs
