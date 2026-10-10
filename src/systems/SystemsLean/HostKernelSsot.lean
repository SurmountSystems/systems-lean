/-
  Module: SystemsLean.HostKernelSsot
  The stored ssotBlock search types as Option String.
  The shape is the same term HonestyLetRec.ssotBody stores.
  The search is stored. It is not run.
  A missing block stays none. A closed block is the joined lines.
  some of a bare newline is not that closed block.
  `>` stays the rule in HostKernelReduce. This module does not
  reduce a comparison and does not rewrite a stuck `>` to true.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostTerm
import SystemsLean.HostKernelReduce

namespace SystemsLean.HostKernelSsot

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce (gtType)

def termCall (fn : String) (args : List Term) : Term :=
  args.foldl (fun acc arg => Term.app acc arg) (Term.const (n fn))

def beginMark (name : String) : Term :=
  termCall "++"
    [ termCall "++" [Term.litString "# ", Term.var (n name)]
    , Term.litString "_BEGIN" ]

def endMark (name : String) : Term :=
  termCall "++"
    [ termCall "++" [Term.litString "# ", Term.var (n name)]
    , Term.litString "_END" ]

/-- Grabbed lines joined by a newline. Not the newline literal alone. -/
def joinedAcc : Term :=
  termCall "++"
    [ termCall "intercalate"
        [Term.litString "\n", termCall "reverse" [Term.var (n "acc")]]
    , Term.litString "\n" ]

def someJoined : Term :=
  Term.some_ joinedAcc

/-- No begin mark, or a begin mark with no end mark. The then branch
    is none. It is not some. -/
def emptyStep : Term :=
  Term.ite
    (termCall "||"
      [Term.var (n "grab"), termCall "isEmpty" [Term.var (n "acc")]])
    Term.none_
    someJoined

def goCall (grab acc rest : Term) : Term :=
  termCall "go" [grab, acc, rest]

def lineStep (name : String) : Term :=
  Term.ite
    (termCall "&&"
      [ termCall "!" [Term.var (n "grab")]
      , termCall "==" [Term.var (n "line"), beginMark name] ])
    (goCall (Term.const (n "true")) (Term.var (n "acc"))
      (Term.var (n "rest")))
    (Term.ite
      (termCall "&&"
        [ Term.var (n "grab")
        , termCall "==" [Term.var (n "line"), endMark name] ])
      someJoined
      (Term.ite (Term.var (n "grab"))
        (goCall (Term.const (n "true"))
          (termCall "::" [Term.var (n "line"), Term.var (n "acc")])
          (Term.var (n "rest")))
        (goCall (Term.const (n "false"))
          (Term.var (n "acc")) (Term.var (n "rest")))))

def goStep (name : String) : Term :=
  Term.match_ (Term.var (n "lines"))
    [ (Pat.ctor0 (n "nil"), emptyStep)
    , (Pat.ctor0 (n "cons"), lineStep name) ]

/-- `go false [] (content.splitOn "\n")`. This stores the search. -/
def ssotBody (content name : String) : Term :=
  Term.app
    (Term.app
      (Term.app (goStep name) (Term.const (n "false")))
      (Term.const (n "nil")))
    (termCall "splitOn" [Term.var (n content), Term.litString "\n"])

def patEq : Pat -> Pat -> Bool
  | Pat.wild, Pat.wild => true
  | Pat.litNat a, Pat.litNat b => a == b
  | Pat.var a, Pat.var b => a == b
  | Pat.ctor0 a, Pat.ctor0 b => a == b
  | Pat.someVar a, Pat.someVar b => a == b
  | _, _ => false

mutual

def fieldsEq : List (Prod Name Term) -> List (Prod Name Term) -> Bool
  | [], [] => true
  | (a, x) :: xs, (b, y) :: ys =>
    a == b && termEq x y && fieldsEq xs ys
  | _, _ => false

def armsEq : List (Prod Pat Term) -> List (Prod Pat Term) -> Bool
  | [], [] => true
  | (p, x) :: xs, (q, y) :: ys =>
    patEq p q && termEq x y && armsEq xs ys
  | _, _ => false

def termEq : Term -> Term -> Bool
  | Term.var a, Term.var b => a == b
  | Term.litNat a, Term.litNat b => a == b
  | Term.litString a, Term.litString b => a == b
  | Term.litBool a, Term.litBool b => a == b
  | Term.const a, Term.const b => a == b
  | Term.app f a, Term.app g b => termEq f g && termEq a b
  | Term.some_ a, Term.some_ b => termEq a b
  | Term.none_, Term.none_ => true
  | Term.match_ s xs, Term.match_ t ys =>
    termEq s t && armsEq xs ys
  | Term.ite a b c, Term.ite d e f =>
    termEq a d && termEq b e && termEq c f
  | Term.structLit xs, Term.structLit ys => fieldsEq xs ys
  | Term.decideEq a b, Term.decideEq c d =>
    termEq a c && termEq b d
  | Term.proj a f, Term.proj b g => termEq a b && f == g
  | _, _ => false

end

/-- Binder passed to splitOn. Empty is none. -/
def contentOf (t : Term) : Option String :=
  match t with
  | Term.app (Term.app (Term.app _ (Term.const f)) (Term.const nil))
      (Term.app (Term.app (Term.const sp) (Term.var c))
        (Term.litString nl)) =>
    if f.raw == "false" && nil.raw == "nil" && sp.raw == "splitOn"
        && nl == "\n" && c.raw != "" then
      some c.raw
    else
      none
  | _ => none

/-- Name inside the begin mark on the cons arm. -/
def markName (t : Term) : Option String :=
  match t with
  | Term.app (Term.app (Term.const p1)
      (Term.app (Term.app (Term.const p2) (Term.litString h))
        (Term.var nm)))
      (Term.litString suf) =>
    if p1.raw == "++" && p2.raw == "++" && h == "# " && suf == "_BEGIN"
        && nm.raw != "" then
      some nm.raw
    else
      none
  | _ => none

def nameOf (t : Term) : Option String :=
  match t with
  | Term.app (Term.app (Term.app (Term.match_ _ arms) _) _) _ =>
    match arms with
    | _ :: (_, Term.ite cond _ _) :: [] =>
      match cond with
      | Term.app (Term.app (Term.const a) _)
          (Term.app (Term.app (Term.const e) _) mk) =>
        if a.raw == "&&" && e.raw == "==" then markName mk else none
      | _ => none
    | _ => none
  | _ => none

/-- Option String only when the term is the stored search.
    This does not reduce the search to some, and it does not
    reduce a closed block to a bare newline. -/
def ssotType (t : Term) : Option HostType :=
  match contentOf t, nameOf t with
  | some c, some nm =>
    if termEq t (ssotBody c nm) then
      some (HostType.option HostType.string)
    else
      none
  | _, _ => none

/-- `>` first. The stored search only after that misses. -/
def ssotAfterGt (t : Term) : Option HostType :=
  match gtType t with
  | some ty => some ty
  | none => ssotType t

def acceptsStored : Bool :=
  match ssotType (ssotBody "content" "name") with
  | some (HostType.option HostType.string) => true
  | _ => false

/-- some of only a newline is not the joined lines. -/
def rejectsBareNewline : Bool :=
  match ssotType (Term.some_ (Term.litString "\n")) with
  | none => true
  | _ => false

/-- Then-branch some would invent a block that is missing. -/
def emptyAsSome : Term :=
  Term.ite
    (termCall "||"
      [Term.var (n "grab"), termCall "isEmpty" [Term.var (n "acc")]])
    someJoined
    someJoined

def missingBody (content name : String) : Term :=
  Term.app
    (Term.app
      (Term.app
        (Term.match_ (Term.var (n "lines"))
          [ (Pat.ctor0 (n "nil"), emptyAsSome)
          , (Pat.ctor0 (n "cons"), lineStep name) ])
        (Term.const (n "false")))
      (Term.const (n "nil")))
    (termCall "splitOn" [Term.var (n content), Term.litString "\n"])

def rejectsMissingAsSome : Bool :=
  match ssotType (missingBody "content" "name") with
  | none => true
  | _ => false

def bareJoined : Term :=
  Term.some_ (Term.litString "\n")

def lineBare (name : String) : Term :=
  Term.ite
    (termCall "&&"
      [ termCall "!" [Term.var (n "grab")]
      , termCall "==" [Term.var (n "line"), beginMark name] ])
    (goCall (Term.const (n "true")) (Term.var (n "acc"))
      (Term.var (n "rest")))
    (Term.ite
      (termCall "&&"
        [ Term.var (n "grab")
        , termCall "==" [Term.var (n "line"), endMark name] ])
      bareJoined
      (Term.ite (Term.var (n "grab"))
        (goCall (Term.const (n "true"))
          (termCall "::" [Term.var (n "line"), Term.var (n "acc")])
          (Term.var (n "rest")))
        (goCall (Term.const (n "false"))
          (Term.var (n "acc")) (Term.var (n "rest")))))

def bareBody (content name : String) : Term :=
  Term.app
    (Term.app
      (Term.app
        (Term.match_ (Term.var (n "lines"))
          [ (Pat.ctor0 (n "nil"), emptyStep)
          , (Pat.ctor0 (n "cons"), lineBare name) ])
        (Term.const (n "false")))
      (Term.const (n "nil")))
    (termCall "splitOn" [Term.var (n content), Term.litString "\n"])

def rejectsBareBlock : Bool :=
  match ssotType (bareBody "content" "name") with
  | none => true
  | _ => false

/-- `.length > 1` is still Bool. This file does not own that rule. -/
def lenGt : Term :=
  Term.app
    (Term.app (Term.const (n ">"))
      (Term.proj (Term.var (n "s")) (n "length")))
    (Term.litNat 1)

def gtStillBool : Bool :=
  match ssotAfterGt lenGt with
  | some HostType.bool => true
  | _ => false

end SystemsLean.HostKernelSsot
