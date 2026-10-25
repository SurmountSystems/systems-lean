/-
  Module: SystemsLean.HostKernelDual
  The stored dualSsotSpecs list types as List DualSsotSpec.
  Each cell is List.cons of a structLit. The tail ends at List.nil.
  Fields are base, token, headerBlock, bodyBlock.
  Each field value is a string literal.
  A fifth role field is not this list. An empty list is not this list.
  A non-string field is a miss. Bool true is not this list.
  The one-file read is IO Unit when the leaf is ok.
  A content leaf stays IO String on the other read.
  Bool true is not this read.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm

namespace SystemsLean.HostKernelDual

open SystemsLean.HostTerm

def listTy : HostType :=
  HostType.named (n "List DualSsotSpec")

def ioUnit : HostType :=
  HostType.named (n "IO.Unit")

def want : List String :=
  ["base", "token", "headerBlock", "bodyBlock"]

def fieldNames : List (Prod Name Term) -> List String
  | [] => []
  | (nm, _) :: rest => nm.raw :: fieldNames rest

def fieldsAreStrings : List (Prod Name Term) -> Bool
  | [] => true
  | (_, Term.litString _) :: rest => fieldsAreStrings rest
  | _ => false

/-- Four string fields, in that order. A role field is false. -/
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

def dualListType (t : Term) : Option HostType :=
  if listOk t then some listTy else none

def isUserErr : Term -> Bool
  | Term.app (Term.const c) (Term.litString s) =>
    c.raw == "IO.userError" && s != ""
  | _ => false

def isEmptyProj (v : String) : Term -> Bool
  | Term.proj (Term.var x) f =>
    x.raw == v && f.raw == "isEmpty"
  | _ => false

def binApp (fn field spec : String) : Term -> Bool
  | Term.app (Term.app (Term.const c) (Term.var cv))
      (Term.proj (Term.var sv) f) =>
    c.raw == fn && cv.raw == "content" && sv.raw == spec
      && spec != "" && f.raw == field
  | _ => false

def isOk : Term -> Bool
  | Term.const c => c.raw == "ok"
  | _ => false

/-- Header block, then body block. The leaf is ok, not content. -/
def blocks (spec : String) : Term -> Bool
  | Term.match_ scrut
      [ (Pat.ctor0 noneP, eMiss)
      , (Pat.someVar h,
          Term.ite cEmpty eEmpty
            (Term.match_ scrutB
              [ (Pat.ctor0 noneB, eMissB)
              , (Pat.someVar b,
                  Term.ite cEmptyB eEmptyB leaf) ])) ] =>
    noneP.raw == "none" && noneB.raw == "none"
      && h.raw == "h" && b.raw == "b"
      && isUserErr eMiss && isUserErr eEmpty
      && isUserErr eMissB && isUserErr eEmptyB
      && binApp "ssotBlock" "headerBlock" spec scrut
      && binApp "ssotBlock" "bodyBlock" spec scrutB
      && isEmptyProj "h" cEmpty
      && isEmptyProj "b" cEmptyB
      && isOk leaf
  | _ => false

/-- IO Unit only for the stored read body with an ok leaf.
    The empty-content arm is an error. Bool true is none. -/
def dualUnitRead (t : Term) : Option HostType :=
  match t with
  | Term.ite cond emptyArm
      (Term.ite hasTok blockArm missTok) =>
    match cond with
    | Term.proj (Term.var cv) f =>
      if cv.raw == "content" && f.raw == "isEmpty"
          && isUserErr emptyArm && isUserErr missTok then
        match hasTok with
        | Term.app (Term.app (Term.const c) (Term.var cv2))
            (Term.proj (Term.var sv) tf) =>
          if c.raw == "containsStr" && cv2.raw == "content"
              && sv.raw != "" && tf.raw == "token"
              && blocks sv.raw blockArm then
            some ioUnit
          else
            none
        | _ => none
      else
        none
    | _ => none
  | _ => none

def rejectsBool : Bool :=
  match dualListType (Term.litBool true) with
  | none =>
    match dualUnitRead (Term.litBool true) with
    | none => true
    | _ => false
  | _ => false

end SystemsLean.HostKernelDual
