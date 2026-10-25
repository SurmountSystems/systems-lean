/-
  Module: SystemsLean.HostKernelRead
  The stored read body types as IO String.
  Empty content, a missing token, and a missing or empty block
  are IO.userError arms. The leaf is the content variable.
  An empty file is not success. Bool true is not this action.
  A missing path stays on requireFile, which runs first.
  The spec list, the ssot search, and `>` are not rewritten.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.HostKernelSpecs
import SystemsLean.HostKernelDual

namespace SystemsLean.HostKernelRead

open SystemsLean.HostTerm
open SystemsLean.HostKernelSpecs (specsAfterRequire)
open SystemsLean.HostKernelDual (dualUnitRead)

def ioStr : HostType :=
  HostType.named (n "IO.String")

/-- `IO.userError` of a non-empty string. Bool is false. -/
def isUserErr : Term -> Bool
  | Term.app (Term.const c) (Term.litString s) =>
    c.raw == "IO.userError" && s != ""
  | _ => false

def isContent : Term -> Bool
  | Term.var v => v.raw == "content"
  | _ => false

def isEmptyProj (v : String) : Term -> Bool
  | Term.proj (Term.var x) f =>
    x.raw == v && f.raw == "isEmpty"
  | _ => false

/-- `fn content spec.field`. A swapped argument is false. -/
def binApp (fn field spec : String) : Term -> Bool
  | Term.app (Term.app (Term.const c) (Term.var cv))
      (Term.proj (Term.var sv) f) =>
    c.raw == fn && cv.raw == "content" && sv.raw == spec
      && spec != "" && f.raw == field
  | _ => false

/-- Header block, then body block. The leaf is content. -/
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
      && isContent leaf
  | _ => false

/-- IO String only for the stored read body.
    The empty-content arm is an error. The leaf is content. -/
def readType (t : Term) : Option HostType :=
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
            some ioStr
          else
            none
        | _ => none
      else
        none
    | _ => none
  | _ => none

/-- The spec list first. IO String only after that misses.
    IO Unit for an ok leaf only after that IO String misses. -/
def readAfterSpecs (t : Term) : Option HostType :=
  match specsAfterRequire t with
  | some ty => some ty
  | none =>
    match readType t with
    | some ty => some ty
    | none => dualUnitRead t

def err (msg : String) : Term :=
  Term.app (Term.const (n "IO.userError")) (Term.litString msg)

def content : Term :=
  Term.var (n "content")

def specProj (field : String) : Term :=
  Term.proj (Term.var (n "spec")) (n field)

def app2 (fn : String) (a b : Term) : Term :=
  Term.app (Term.app (Term.const (n fn)) a) b

def oneBlock (bind field rest : String) (inner : Term) : Term :=
  Term.match_ (app2 "ssotBlock" content (specProj field))
    [ (Pat.ctor0 (n "none"), err ("missing " ++ rest))
    , (Pat.someVar (n bind),
        Term.ite
          (Term.proj (Term.var (n bind)) (n "isEmpty"))
          (err ("empty " ++ rest))
          inner) ]

def stored : Term :=
  Term.ite (Term.proj content (n "isEmpty"))
    (err "empty path")
    (Term.ite
      (app2 "containsStr" content (specProj "token"))
      (oneBlock "h" "headerBlock" "HEADER"
        (oneBlock "b" "bodyBlock" "BODY" content))
      (err "missing token spec"))

def acceptsStored : Bool :=
  match readType stored with
  | some (HostType.named nm) => nm.raw == "IO.String"
  | _ => false

def rejectsBool : Bool :=
  match readType (Term.litBool true) with
  | none => true
  | _ => false

/-- Empty content in the success arm is not IO String. -/
def emptyAsSuccess : Term :=
  Term.ite (Term.proj content (n "isEmpty"))
    content
    (err "missing token spec")

def rejectsEmpty : Bool :=
  match readType emptyAsSuccess with
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
  match readAfterSpecs requireTerm with
  | some (HostType.named nm) => nm.raw == "IO.Unit"
  | _ => false

def listStill : Bool :=
  match readAfterSpecs SystemsLean.HostKernelSpecs.oneList with
  | some (HostType.named nm) =>
    nm.raw == "List ComposeSsotSpec"
  | _ => false

def lenGt : Term :=
  Term.app
    (Term.app (Term.const (n ">"))
      (Term.proj (Term.var (n "s")) (n "length")))
    (Term.litNat 1)

def gtStillBool : Bool :=
  match readAfterSpecs lenGt with
  | some HostType.bool => true
  | _ => false

end SystemsLean.HostKernelRead
