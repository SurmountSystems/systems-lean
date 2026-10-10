/-
  Module: SystemsLean.HostKernelApply
  The stored freestandingCapableComposePlanApplyBody body
  types as IO Unit. Incomplete inputs are the error arm.
  Seven containsStr checks end at the buildComposeMarker call.
  An arbitrary string is not this body. Bool true is not it.
  The marker, the read, the spec list, requireFile, the ssot
  search, and `>` run first and are not rewritten.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HostKernelMarker

namespace SystemsLean.HostKernelApply

open SystemsLean.HostTerm
open SystemsLean.HostKernelMarker (markerAfterRead)

def ioUnit : HostType :=
  HostType.named (n "IO.Unit")

structure Need where
  lit : Bool
  needle : String
  err : String

def wants : List Need :=
  [ { lit := false, needle := "writerPathStepCompose"
    , err := "missing compose step id" }
  , { lit := false, needle := "contractStepCompose"
    , err := "missing compose contract id" }
  , { lit := true, needle := "HOST-EMIT-PLAN"
    , err := "missing HOST-EMIT-PLAN in composed" }
  , { lit := true, needle := "HOST-EMIT-APPLY"
    , err := "missing HOST-EMIT-APPLY in composed" }
  , { lit := true, needle := "HOST-EMIT-BODY"
    , err := "missing HOST-EMIT-BODY in composed" }
  , { lit := false, needle := "gapCompose"
    , err := "missing compose gap id" }
  , { lit := false, needle := "stageId"
    , err := "missing compose stage id" } ]

def isErr (msg : String) : Term -> Bool
  | Term.app (Term.const c) (Term.litString s) =>
    c.raw == "IO.userError" && s == msg
  | _ => false

def isEmptyProj (v : String) : Term -> Bool
  | Term.proj (Term.var x) f =>
    x.raw == v && f.raw == "isEmpty"
  | _ => false

def isOr (t : Term) : Option (Prod Term Term) :=
  match t with
  | Term.app (Term.app (Term.const c) a) b =>
    if c.raw == "||" then some (a, b) else none
  | _ => none

/-- planText, applyText, and bodyText empty. Other ors are false. -/
def isOrEmpty (t : Term) : Bool :=
  match isOr t with
  | some (inner, right) =>
    match isOr inner with
    | some (p, a) =>
      isEmptyProj "planText" p
        && isEmptyProj "applyText" a
        && isEmptyProj "bodyText" right
    | none => false
  | none => false

def isContains (lit : Bool) (needle : String) (c : Term) : Bool :=
  match c with
  | Term.app (Term.app (Term.const f) (Term.var obj)) arg =>
    if f.raw == "containsStr" && obj.raw == "composed" then
      match arg with
      | Term.var v => !lit && v.raw == needle
      | Term.litString s => lit && s == needle
      | _ => false
    else
      false
  | _ => false

def peelOne (t : Term) (step : Need) : Option Term :=
  match t with
  | Term.ite c rest bad =>
    if isContains step.lit step.needle c && isErr step.err bad then
      some rest
    else
      none
  | _ => none

def peelAll : Term -> List Need -> Option Term
  | t, [] => some t
  | t, s :: rest =>
    match peelOne t s with
    | none => none
    | some next => peelAll next rest

/-- The leaf call. A bool, or a shorter call, is false. -/
def isMarkerLeaf : Term -> Bool
  | Term.app
      (Term.app
        (Term.app (Term.const f) (Term.var a))
        (Term.var b))
      (Term.var c) =>
    f.raw == "buildComposeMarker"
      && a.raw == "planText"
      && b.raw == "applyText"
      && c.raw == "bodyText"
  | _ => false

/-- IO Unit only for that stored ite. Incomplete is not success. -/
def applyType (t : Term) : Option HostType :=
  match t with
  | Term.ite c bad rest =>
    if isOrEmpty c && isErr "incomplete compose inputs" bad then
      match peelAll rest wants with
      | some leaf =>
        if isMarkerLeaf leaf then some ioUnit else none
      | none => none
    else
      none
  | _ => none

/-- The marker first. This body only after that misses. -/
def applyAfterMarker (t : Term) : Option HostType :=
  match markerAfterRead t with
  | some ty => some ty
  | none => applyType t

def app2 (fn : String) (a b : Term) : Term :=
  Term.app (Term.app (Term.const (n fn)) a) b

def emptyProj (v : String) : Term :=
  Term.proj (Term.var (n v)) (n "isEmpty")

def orEmpty : Term :=
  app2 "||"
    (app2 "||" (emptyProj "planText") (emptyProj "applyText"))
    (emptyProj "bodyText")

def err (msg : String) : Term :=
  Term.app (Term.const (n "IO.userError")) (Term.litString msg)

def contains (lit : Bool) (needle : String) : Term :=
  let arg :=
    if lit then Term.litString needle else Term.var (n needle)
  app2 "containsStr" (Term.var (n "composed")) arg

def markerLeaf : Term :=
  Term.app
    (Term.app
      (Term.app (Term.const (n "buildComposeMarker"))
        (Term.var (n "planText")))
      (Term.var (n "applyText")))
    (Term.var (n "bodyText"))

def nest : List Need -> Term -> Term
  | [], leaf => leaf
  | s :: rest, leaf =>
    Term.ite (contains s.lit s.needle) (nest rest leaf) (err s.err)

def stored : Term :=
  Term.ite orEmpty (err "incomplete compose inputs") (nest wants markerLeaf)

def acceptsStored : Bool :=
  match applyType stored with
  | some (HostType.named nm) => nm.raw == "IO.Unit"
  | _ => false

def rejectsBool : Bool :=
  match applyType (Term.litBool true) with
  | none => true
  | _ => false

def rejectsSwap : Bool :=
  match applyType
      (Term.ite orEmpty markerLeaf (err "incomplete compose inputs")) with
  | none => true
  | _ => false

def markerStill : Bool :=
  match applyAfterMarker SystemsLean.HostKernelMarker.stored with
  | some HostType.string => true
  | _ => false

def readStill : Bool :=
  match applyAfterMarker SystemsLean.HostKernelRead.stored with
  | some (HostType.named nm) => nm.raw == "IO.String"
  | _ => false

end SystemsLean.HostKernelApply
