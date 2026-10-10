/-
  Module: SystemsLean.HostKernelRequire
  The stored requireFile body types as IO Unit.
  pathExists true is none. The other arm is IO.userError "missing".
  A missing path stays that error arm. It is not stored as present.
  The action is not Bool true.
  The ssot search and the `>` rule run first and are not rewritten.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HostKernelSsot

namespace SystemsLean.HostKernelRequire

open SystemsLean.HostTerm
open SystemsLean.HostKernelSsot (ssotAfterGt)

def ioUnit : HostType :=
  HostType.named (n "IO.Unit")

/-- `path.pathExists`. Any other projection is false. -/
def isPathExists (t : Term) : Bool :=
  match t with
  | Term.proj (Term.var p) f =>
    p.raw != "" && f.raw == "pathExists"
  | _ => false

/-- `IO.userError "missing"`. A present-file term is not this. -/
def isMissingError (t : Term) : Bool :=
  match t with
  | Term.app (Term.const nm) (Term.litString s) =>
    nm.raw == "IO.userError" && s == "missing"
  | _ => false

/-- IO Unit only for the stored unless.
    The then branch is none. The else branch is the missing error.
    Bool true is none. A swapped arm is none. -/
def requireType (t : Term) : Option HostType :=
  match t with
  | Term.ite cond Term.none_ (Term.some_ err) =>
    if isPathExists cond && isMissingError err then
      some ioUnit
    else
      none
  | _ => none

/-- Ssot and `>` first. requireFile only after those miss. -/
def requireAfterSsot (t : Term) : Option HostType :=
  match ssotAfterGt t with
  | some ty => some ty
  | none => requireType t

def stored (path : String) : Term :=
  Term.ite
    (Term.proj (Term.var (n path)) (n "pathExists"))
    Term.none_
    (Term.some_
      (Term.app (Term.const (n "IO.userError")) (Term.litString "missing")))

def acceptsStored : Bool :=
  match requireType (stored "path") with
  | some (HostType.named nm) => nm.raw == "IO.Unit"
  | _ => false

/-- The error arm on the true branch would store a missing path as present. -/
def swapped (path : String) : Term :=
  Term.ite
    (Term.proj (Term.var (n path)) (n "pathExists"))
    (Term.some_
      (Term.app (Term.const (n "IO.userError")) (Term.litString "missing")))
    Term.none_

def rejectsSwapped : Bool :=
  match requireType (swapped "path") with
  | none => true
  | _ => false

def rejectsBoolTrue : Bool :=
  match requireType (Term.litBool true) with
  | none => true
  | _ => false

def ssotStillOption : Bool :=
  match requireAfterSsot
      (SystemsLean.HostKernelSsot.ssotBody "content" "name") with
  | some (HostType.option HostType.string) => true
  | _ => false

def lenGt : Term :=
  Term.app
    (Term.app (Term.const (n ">"))
      (Term.proj (Term.var (n "s")) (n "length")))
    (Term.litNat 1)

def gtStillBool : Bool :=
  match requireAfterSsot lenGt with
  | some HostType.bool => true
  | _ => false

end SystemsLean.HostKernelRequire
