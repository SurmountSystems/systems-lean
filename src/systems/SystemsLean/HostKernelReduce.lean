/-
  Module: SystemsLean.HostKernelReduce
  Definitional reduction for the rfl rule.
  SystemsLean.Mult import carries the bodies of ofNat?, name, isValid,
  isValidTag, and multIsValid. rfl accepts only when the reduced sides
  are the same term.
  Sides that still differ stay rejected.
  Option.map of some applies the mapped function and reduces it.
  The front stores that function as a variable. The variable
  unfolds when the import has its body. name on mult0, mult1,
  and multOmega is the string the match returns. A different
  string stays different. map of none is none.
  `>` of two nat literals reduces. Greater is true. Not greater
  is false. A side that is not a literal stays the application.
  That stuck application is not true.
  This is not a by or cases tactic kernel.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm

namespace SystemsLean.HostKernelReduce

open SystemsLean.HostTerm

/-- One imported or local definition body. binder is the scrut or the
    parameter the front left free. -/
structure DefBody where
  binder : String
  body : Term
  deriving Repr

/-- Head-first definition environment. Parallel to the type environment. -/
abbrev DefEnv := List (Prod String DefBody)

/-- Fuel for one reduction. Same depth family as the kernel. -/
def reduceFuel : Nat := 64

def lookupDef (defs : DefEnv) (name : String) : Option DefBody :=
  match defs with
  | [] => none
  | (nm, d) :: rest =>
    if nm == name then some d else lookupDef rest name

/-- Binder recorded for a match on a variable. Other bodies record none. -/
def defBinder (body : Term) : String :=
  match body with
  | Term.match_ (Term.var x) _ => x.raw
  | _ => ""

mutual

def substN (fuel : Nat) (name : String) (value : Term) (t : Term) : Term :=
  match fuel with
  | 0 => t
  | Nat.succ k =>
    match t with
    | Term.var x =>
      if x.raw == name then value else t
    | Term.app f a =>
      Term.app (substN k name value f) (substN k name value a)
    | Term.some_ u => Term.some_ (substN k name value u)
    | Term.match_ s arms =>
      Term.match_ (substN k name value s) (substArms k name value arms)
    | Term.ite c t1 e =>
      Term.ite (substN k name value c) (substN k name value t1)
        (substN k name value e)
    | Term.decideEq a b =>
      Term.decideEq (substN k name value a) (substN k name value b)
    | Term.proj o f => Term.proj (substN k name value o) f
    | Term.structLit fs => Term.structLit (substFields k name value fs)
    | _ => t
termination_by fuel

def substArms (fuel : Nat) (name : String) (value : Term)
    (arms : List (Prod Pat Term)) : List (Prod Pat Term) :=
  match fuel with
  | 0 => arms
  | Nat.succ k =>
    match arms with
    | [] => []
    | (p, body) :: rest =>
      (p, substN k name value body) :: substArms k name value rest
termination_by fuel

def substFields (fuel : Nat) (name : String) (value : Term)
    (fs : List (Prod Name Term)) : List (Prod Name Term) :=
  match fuel with
  | 0 => fs
  | Nat.succ k =>
    match fs with
    | [] => []
    | (fn, tm) :: rest =>
      (fn, substN k name value tm) :: substFields k name value rest
termination_by fuel

end

/-- A value can take a wildcard. A variable or a stuck application cannot.
    A nat literal other than 0, 1, or 2 is a value, so ofNat? of it is none.
    ofNat? of a variable stays stuck. -/
def isValue : Term -> Bool
  | Term.litNat _ => true
  | Term.litString _ => true
  | Term.litBool _ => true
  | Term.const _ => true
  | Term.none_ => true
  | Term.some_ t => isValue t
  | _ => false

/-- Pattern match for reduction. First success wins.
    litNat matches a nat literal. ctor0 matches const of the same raw name.
    wild matches only a value that no earlier arm took. -/
def applyPat (fuel : Nat) (p : Pat) (scrut body : Term) : Option Term :=
  match p with
  | Pat.wild => if isValue scrut then some body else none
  | Pat.litNat j =>
    match scrut with
    | Term.litNat i => if i == j then some body else none
    | _ => none
  | Pat.ctor0 c =>
    match scrut with
    | Term.const x => if x.raw == c.raw then some body else none
    | _ => none
  | Pat.var x => some (substN fuel x.raw scrut body)
  | Pat.someVar x =>
    match scrut with
    | Term.some_ u => some (substN fuel x.raw u body)
    | _ => none

/-- Both literals compare. Anything else is the same application.
    A stuck `>` is not Bool true. A false comparison is not true. -/
def reduceGt (lhs rhs : Term) : Term :=
  match lhs, rhs with
  | Term.litNat a, Term.litNat b => Term.litBool (decide (a > b))
  | _, _ =>
    Term.app (Term.app (Term.const (n ">")) lhs) rhs

def reduceMatch (fuel : Nat) (scrut : Term) (arms : List (Prod Pat Term)) :
    Option Term :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match arms with
    | [] => none
    | (p, body) :: rest =>
      match applyPat k p scrut body with
      | some b => some b
      | none => reduceMatch k scrut rest
termination_by fuel

mutual

def reduceN (fuel : Nat) (defs : DefEnv) (t : Term) : Term :=
  match fuel with
  | 0 => t
  | Nat.succ k =>
    match t with
    | Term.some_ u => Term.some_ (reduceN k defs u)
    | Term.app f a =>
      reduceApp k defs (reduceN k defs f) (reduceN k defs a)
    | Term.match_ s arms =>
      let s' := reduceN k defs s
      match reduceMatch k s' arms with
      | some body => reduceN k defs body
      | none => Term.match_ s' arms
    | _ => t
termination_by fuel

/-- Unfold one application. isSome and map are the surface meanings of
    constants the front already emits. A variable in function position
    unfolds when defs has that name. A definition unfolds only when
    its body is in defs. -/
def reduceApp (fuel : Nat) (defs : DefEnv) (f a : Term) : Term :=
  match fuel with
  | 0 => Term.app f a
  | Nat.succ k =>
    match f with
    | Term.const nm =>
      if nm.raw == "isSome" then
        match a with
        | Term.some_ _ => Term.litBool true
        | Term.none_ => Term.litBool false
        | _ => Term.app f a
      else
        match lookupDef defs nm.raw with
        | some d => reduceN k defs (substN k d.binder a d.body)
        | none => Term.app f a
    | Term.var nm =>
      match lookupDef defs nm.raw with
      | some d => reduceN k defs (substN k d.binder a d.body)
      | none => Term.app f a
    | Term.app (Term.const nm) g =>
      if nm.raw == "map" then
        match a with
        | Term.some_ x => reduceN k defs (Term.some_ (Term.app g x))
        | Term.none_ => Term.none_
        | _ => Term.app f a
      else if nm.raw == ">" then
        reduceGt g a
      else
        Term.app f a
    | _ => Term.app f a
termination_by fuel

end

def ofNatBody : Term :=
  Term.match_ (Term.var (n "scrut")) [
    (Pat.litNat 0, Term.some_ (Term.const (n "mult0"))),
    (Pat.litNat 1, Term.some_ (Term.const (n "mult1"))),
    (Pat.litNat 2, Term.some_ (Term.const (n "multOmega"))),
    (Pat.wild, Term.none_)
  ]

def nameBody : Term :=
  Term.match_ (Term.var (n "scrut")) [
    (Pat.ctor0 (n "mult0"), Term.litString "MULT-0"),
    (Pat.ctor0 (n "mult1"), Term.litString "MULT-1"),
    (Pat.ctor0 (n "multOmega"), Term.litString "MULT-OMEGA")
  ]

def isValidBody : Term :=
  Term.match_ (Term.var (n "scrut")) [
    (Pat.ctor0 (n "mult0"), Term.litBool true),
    (Pat.ctor0 (n "mult1"), Term.litBool true),
    (Pat.ctor0 (n "multOmega"), Term.litBool true)
  ]

def isValidTagBody : Term :=
  Term.app (Term.const (n "isSome"))
    (Term.app (Term.const (n "ofNat?")) (Term.var (n "n")))

def multIsValidBody : Term :=
  Term.app (Term.const (n "isValid")) (Term.var (n "m"))

/-- Bodies the SystemsLean.Mult import provides.
    The type seed does not carry these. -/
def multDefEnv : DefEnv :=
  ("ofNat?", { binder := "scrut", body := ofNatBody })
    :: ("name", { binder := "scrut", body := nameBody })
    :: ("isValid", { binder := "scrut", body := isValidBody })
    :: ("isValidTag", { binder := "n", body := isValidTagBody })
    :: ("multIsValid", { binder := "m", body := multIsValidBody })
    :: []

/-- `Option.map name (ofNat? k)`, with name stored as a variable. -/
def mapName (k : Nat) : Term :=
  Term.app
    (Term.app (Term.const (n "map")) (Term.var (n "name")))
    (Term.app (Term.const (n "ofNat?")) (Term.litNat k))

def reducedMap (k : Nat) : Term :=
  reduceN reduceFuel multDefEnv (mapName k)

def mapString (k : Nat) (s : String) : Bool :=
  match reducedMap k with
  | Term.some_ (Term.litString got) => got == s
  | _ => false

def mapNameZero : Bool :=
  mapString 0 "MULT-0"

def mapNameOne : Bool :=
  mapString 1 "MULT-1"

def mapNameOmega : Bool :=
  mapString 2 "MULT-OMEGA"

def mapNameFailClosed : Bool :=
  match reducedMap 3 with
  | Term.none_ => true
  | _ => false

/-- The reduced name of tag 0 is not the tag 1 string. -/
def mapNameRejectsWrongString : Bool :=
  match reducedMap 0 with
  | Term.some_ (Term.litString got) => !(got == "MULT-1")
  | _ => false

/-- A nat literal, or `.length`, which this kernel already reads as Nat. -/
def natSide (t : Term) : Bool :=
  match t with
  | Term.litNat _ => true
  | Term.proj _ f => f.raw == "length"
  | _ => false

/-- `>` of two nat sides is Bool. Another head is none.
    This does not rewrite the term to true. -/
def gtType (t : Term) : Option HostType :=
  match t with
  | Term.app (Term.app (Term.const nm) lhs) rhs =>
    if nm.raw == ">" && natSide lhs && natSide rhs then
      some HostType.bool
    else
      none
  | _ => none

def gtApp (a b : Nat) : Term :=
  Term.app (Term.app (Term.const (n ">")) (Term.litNat a)) (Term.litNat b)

/-- 2 > 1 reduces to true. -/
def gtGreaterIsTrue : Bool :=
  match reduceN reduceFuel [] (gtApp 2 1) with
  | Term.litBool b => b == true
  | _ => false

/-- 0 > 1 reduces to false, not true. -/
def gtFalseStaysFalse : Bool :=
  match reduceN reduceFuel [] (gtApp 0 1) with
  | Term.litBool b => b == false
  | _ => false

/-- A variable on the left stays the application. It is not true. -/
def gtStuckNotTrue : Bool :=
  match reduceN reduceFuel []
      (Term.app
        (Term.app (Term.const (n ">")) (Term.var (n "n")))
        (Term.litNat 0)) with
  | Term.litBool _ => false
  | Term.app (Term.app (Term.const nm) _) _ => nm.raw == ">"
  | _ => false

end SystemsLean.HostKernelReduce
