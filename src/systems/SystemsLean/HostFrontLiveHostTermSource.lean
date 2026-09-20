/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostTermSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTTERM, liveHostTermSource,
  HOST-FRONT-LIVE-HOSTTERM, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostTerm

/-- Dual-pinned live HostTerm.lean bytes (must match on-disk file).
    Greppable: liveHostTermSource, PARSE-LIVE-HOSTTERM. -/
def liveHostTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- closed host term / command IR for Mult-first
  peer elaborator (plan-peer-elaborator step 2 Name: Host term representation).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).

  Spec (readable, separate from parser step 3):
  - HostTerm is a closed inductive IR for Mult-first fragment *commands* and
    *terms* (beyond Mult IR node lines in SubsetFront).
  - Enough later for a Mult-first elaborator front-end to target this IR.
  - Not full Lean 4 AST. Not mathlib. Not macros / tactics / mutual inductives.
  - In scope (v0 Mult-first fragment): import ModuleName; namespace / end / open;
    inductive with nullary ctors + deriving list; def with optional type +
    match/app/const/lit/Option body; simple HostType (Mult, Nat, String, Bool,
    Option, arrow, named); structural well-formedness (fail closed).
  - Multi-file import *resolution* (missing import / cycle) is HostGraph (step 6);
    this IR only stores importModule commands.
  - Out of scope: source parser (step 3); without-Lake driver; Mult package
    write; full SystemsLean import graph; PROVABLY / llvm; product free /
    complete tip flips; hostElaboratorResidualRemains false.

  Good fixture: multFixtureModule mirrors Mult.lean core (Mult inductive +
  name / isValid / ofNat? / isValidTag / multIsValid defs).
  Bad fixtures: empty module, empty name, inductive with zero ctors, match
  with zero arms, def with empty name.

  Greppable: SYSTEMS_LEAN_HOST, HOST-TERM-IR, SLAKE_HOST_TERM, SLAKE_HOST_TERM_V0,
  HOST-TERM, hostTermReady, hostTermGoodMult, hostTermBadEmpty,
  hostTermBadEmptyName, hostTermBadIndZeroCtor, hostTermBadMatchEmpty,
  hostTermHostElaboratorResidualRemains, hostTermDoesNotClaimPeerGreen,
  HOST-TERM-SMOKE, HOST-TERM-THEOREM, hostTermReady_true, multFixtureModule,
  isWellFormed, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.HostTerm
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins + theorems / examples (lake build).
  Red/green: lake build SystemsLean.HostTerm; just systems-host when dual-pinned.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY.
  Not llvm unlock.
  Module must stay ASCII.
-/

import SystemsLean.Mult

namespace SystemsLean.HostTerm

open SystemsLean.Mult (Mult)

/-! ### HOST-TERM-IR / SLAKE_HOST_TERM (peer elaborator host term representation)

  Closed Mult-first command/term IR. Parser and check drivers are later steps.
-/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_TERM_V0"

/-- Greppable host map id. HOST-TERM-IR durable product token. -/
def hostId : String := "HOST-TERM-IR"

/-- Short surface name. -/
def surfaceId : String := "HOST-TERM"

/-- Surface alias greppable token. -/
def surfaceAlias : String := "HOST-TERM-IR"

/-- Host elaborator residual still remains (peer not green yet).
    Greppable: hostTermHostElaboratorResidualRemains.
    Does not flip DualResidual.hostElaboratorResidualRemains. -/
def hostTermHostElaboratorResidualRemains : Bool := true

/-- Local honesty: this module is not peer elaborator green. -/
def hostTermDoesNotClaimPeerGreen : Bool := true

/-- Local honesty: does not claim product residual free flip. -/
def hostTermResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def hostTermProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: does not claim proof complete. -/
def hostTermProofCompleteClaimed : Bool := false

/-- Local honesty: does not unlock llvm. -/
def hostTermLlvmUnlocked : Bool := false

/-- Local honesty: does not unlock PROVABLY. -/
def hostTermProvablyUnlocked : Bool := false

/-! ### Names -/

/-- Host identifier (ASCII name string). Empty fails well-formedness. -/
structure Name where
  raw : String
  deriving DecidableEq, Repr

/-- Build a Name. -/
def n (s : String) : Name := { raw := s }

/-- Name is well-formed when non-empty. -/
def nameOk (x : Name) : Bool := !x.raw.isEmpty

/-! ### Host types (Mult-first fragment) -/

/-- Closed type annotations for Mult-first defs.
    Greppable: HostType. -/
inductive HostType where
  | mult
  | nat
  | string
  | bool
  | option (elem : HostType)
  | named (name : Name)
  | arrow (dom : HostType) (cod : HostType)
  deriving Repr

/-- HostType well-formed (named leaves need non-empty names). -/
def hostTypeOk : HostType -> Bool
  | HostType.mult => true
  | HostType.nat => true
  | HostType.string => true
  | HostType.bool => true
  | HostType.option t => hostTypeOk t
  | HostType.named x => nameOk x
  | HostType.arrow d c => hostTypeOk d && hostTypeOk c

/-! ### Patterns and terms -/

/-- Pattern IR for match arms (Mult-first).
    Mult-first v0: nullary ctor patterns only (no nested pat args). -/
inductive Pat where
  | wild
  | litNat (k : Nat)
  | var (name : Name)
  | ctor0 (name : Name)
  | someVar (name : Name)
  deriving Repr

/-- Pattern well-formed. -/
def patOk : Pat -> Bool
  | Pat.wild => true
  | Pat.litNat _ => true
  | Pat.var x => nameOk x
  | Pat.ctor0 x => nameOk x
  | Pat.someVar x => nameOk x

/-- Closed term IR for Mult-first fragment bodies.
    Match arms are (pat, body) pairs.
    Greppable: Term, HOST-TERM-IR. -/
inductive Term where
  | var (name : Name)
  | litNat (k : Nat)
  | litString (s : String)
  | litBool (b : Bool)
  | const (name : Name)
  | app (fn : Term) (arg : Term)
  | some_ (t : Term)
  | none_
  | match_ (scrut : Term) (arms : List (Prod Pat Term))
  | ite (c : Term) (t : Term) (e : Term)
  | structLit (fields : List (Prod Name Term))
  | decideEq (lhs : Term) (rhs : Term)
  | proj (obj : Term) (field : Name)
  deriving Repr

/-- Fuel bound for structural term check (native_decide friendly). -/
def termFuel : Nat := 64

/-- Term well-formed with fuel (fail closed on empty names / empty match / fuel out). -/
def termOkN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var x => nameOk x
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.const x => nameOk x
  | Nat.succ n, Term.app f a => termOkN n f && termOkN n a
  | Nat.succ n, Term.some_ t => termOkN n t
  | Nat.succ _, Term.none_ => true
  | Nat.succ n, Term.match_ scrut arms =>
      termOkN n scrut
        && !arms.isEmpty
        && armsOk n arms
  | Nat.succ n, Term.ite c t e =>
      termOkN n c && termOkN n t && termOkN n e
  | Nat.succ n, Term.structLit fs =>
      !fs.isEmpty && structLitOk n fs
  | Nat.succ n, Term.decideEq a b =>
      termOkN n a && termOkN n b
  | Nat.succ n, Term.proj obj f =>
      termOkN n obj && nameOk f
where
  armsOk : Nat -> List (Prod Pat Term) -> Bool
    | _, [] => true
    | 0, _ => false
    | Nat.succ n, (p, body) :: rest =>
        patOk p && termOkN n body && armsOk n rest
  structLitOk : Nat -> List (Prod Name Term) -> Bool
    | _, [] => true
    | 0, _ => false
    | Nat.succ n, (x, body) :: rest =>
        nameOk x && termOkN n body && structLitOk n rest

/-- Term well-formed (fail closed on empty names / empty match). -/
def termOk (t : Term) : Bool := termOkN termFuel t

/-! ### Commands and modules -/

/-- Nullary inductive constructor declaration (Mult grades style). -/
structure CtorDecl where
  name : Name
  deriving Repr

/-- Ctor well-formed. -/
def ctorOk (c : CtorDecl) : Bool := nameOk c.name

/-- Structure field (Types TypeTag / IrNode). -/
structure FieldDecl where
  name : Name
  ty : HostType
  deriving Repr

/-- Field well-formed. -/
def fieldOk (f : FieldDecl) : Bool := nameOk f.name && hostTypeOk f.ty

/-- Field list non-empty and each ok. -/
def fieldListOk : List FieldDecl -> Bool
  | [] => false
  | xs => xs.all fieldOk

/-- Named binder list (Types defBind). -/
def namedBinderOk (p : Prod Name HostType) : Bool :=
  nameOk p.fst && hostTypeOk p.snd

/-- Named binders non-empty and each ok. -/
def namedBinderListOk (bs : List (Prod Name HostType)) : Bool :=
  !bs.isEmpty && bs.all namedBinderOk

/-- Closed command IR for Mult-first modules plus Types structure / defBind.
    Greppable: Cmd. importModule is dialect import (graph resolve in HostGraph). -/
inductive Cmd where
  | importModule (name : Name)
  | namespace (name : Name)
  | endNamespace (name : Name)
  | openNs (names : List Name)
  | inductive_ (name : Name) (ctors : List CtorDecl) (derivingClasses : List Name)
  | def_ (name : Name) (ty : Option HostType) (body : Term)
  | check (tm : Term) (ty : HostType)
  | structure_ (name : Name) (fields : List FieldDecl) (derivingClasses : List Name)
  | defBind (name : Name) (binders : List (Prod Name HostType)) (ret : HostType)
      (body : Term)
  deriving Repr

/-- Option HostType well-formed. -/
def optHostTypeOk : Option HostType -> Bool
  | none => true
  | some t => hostTypeOk t

/-- Name list non-empty and each ok. -/
def nameListOk : List Name -> Bool
  | [] => false
  | xs => xs.all nameOk

/-- Ctor list non-empty and each ok. -/
def ctorListOk : List CtorDecl -> Bool
  | [] => false
  | xs => xs.all ctorOk

/-- Command well-formed. -/
def cmdOk : Cmd -> Bool
  | Cmd.importModule x => nameOk x
  | Cmd.namespace x => nameOk x
  | Cmd.endNamespace x => nameOk x
  | Cmd.openNs xs => nameListOk xs
  | Cmd.inductive_ x ctors der =>
      nameOk x && ctorListOk ctors && der.all nameOk
  | Cmd.def_ x ty body => nameOk x && optHostTypeOk ty && termOk body
  | Cmd.check tm ty => termOk tm && hostTypeOk ty
  | Cmd.structure_ x fields der =>
      nameOk x && fieldListOk fields && der.all nameOk
  | Cmd.defBind x bs ret body =>
      nameOk x && namedBinderListOk bs && hostTypeOk ret && termOk body

/-- Ordered Mult-first module (commands under a module name).
    Greppable: Module. -/
structure Module where
  name : Name
  commands : List Cmd
  deriving Repr

/-- Module well-formed: non-empty name, at least one command, each ok.
    Greppable: isWellFormed. -/
def isWellFormed (m : Module) : Bool :=
  nameOk m.name
    && !m.commands.isEmpty
    && m.commands.all cmdOk

/-! ### Mult-first good fixture (mirrors Mult.lean core surface)

  Greppable: multFixtureModule, hostTermGoodMult.
-/

/-- Mult grade constructors (mult0 / mult1 / multOmega). -/
def multCtors : List CtorDecl :=
  [{ name := n "mult0" }, { name := n "mult1" }, { name := n "multOmega" }]

/-- Mult.lean-shaped module: namespace, Mult inductive, core defs, end.
    Not a parse of Mult.lean -- closed IR fixture for later front-end. -/
def multFixtureModule : Module :=
  {
    name := n "SystemsLean.Mult"
    commands := [
      Cmd.namespace (n "SystemsLean.Mult"),
      Cmd.inductive_ (n "Mult") multCtors
        [n "DecidableEq", n "Repr"],
      -- name : Mult -> String
      Cmd.def_ (n "name")
        (some (HostType.arrow HostType.mult HostType.string))
        (Term.match_ (Term.var (n "m")) [
          (Pat.ctor0 (n "mult0"), Term.litString "MULT-0"),
          (Pat.ctor0 (n "mult1"), Term.litString "MULT-1"),
          (Pat.ctor0 (n "multOmega"), Term.litString "MULT-OMEGA")
        ]),
      -- isValid : Mult -> Bool
      Cmd.def_ (n "isValid")
        (some (HostType.arrow HostType.mult HostType.bool))
        (Term.match_ (Term.var (n "m")) [
          (Pat.ctor0 (n "mult0"), Term.litBool true),
          (Pat.ctor0 (n "mult1"), Term.litBool true),
          (Pat.ctor0 (n "multOmega"), Term.litBool true)
        ]),
      -- ofNat? : Nat -> Option Mult
      Cmd.def_ (n "ofNat?")
        (some (HostType.arrow HostType.nat (HostType.option HostType.mult)))
        (Term.match_ (Term.var (n "k")) [
          (Pat.litNat 0, Term.some_ (Term.const (n "mult0"))),
          (Pat.litNat 1, Term.some_ (Term.const (n "mult1"))),
          (Pat.litNat 2, Term.some_ (Term.const (n "multOmega"))),
          (Pat.wild, Term.none_)
        ]),
      -- isValidTag : Nat -> Bool (ofNat? isSome spirit)
      Cmd.def_ (n "isValidTag")
        (some (HostType.arrow HostType.nat HostType.bool))
        (Term.app (Term.const (n "isSome"))
          (Term.app (Term.const (n "ofNat?")) (Term.var (n "k")))),
      -- multIsValid alias
      Cmd.def_ (n "multIsValid")
        (some (HostType.arrow HostType.mult HostType.bool))
        (Term.app (Term.const (n "isValid")) (Term.var (n "m"))),
      -- check-style node: Mult.mult0 inhabits Mult
      Cmd.check (Term.const (n "mult0")) HostType.mult,
      Cmd.endNamespace (n "SystemsLean.Mult")
    ]
  }

/-- Good Mult fixture is well-formed.
    Greppable: hostTermGoodMult. -/
def hostTermGoodMult : Bool := isWellFormed multFixtureModule

/-- Mult fixture has Mult inductive with three grade ctors. -/
def multFixtureHasMultInductive : Bool :=
  multFixtureModule.commands.any fun c =>
    match c with
    | Cmd.inductive_ name ctors _ =>
        name.raw == "Mult" && ctors.length == 3
          && ctors.any (fun d => d.name.raw == "mult0")
          && ctors.any (fun d => d.name.raw == "mult1")
          && ctors.any (fun d => d.name.raw == "multOmega")
    | _ => false

/-- Mult fixture has ofNat? def. -/
def multFixtureHasOfNat : Bool :=
  multFixtureModule.commands.any fun c =>
    match c with
    | Cmd.def_ name _ _ => name.raw == "ofNat?"
    | _ => false

/-! ### Bad fixtures (fail closed)

  Greppable: hostTermBadEmpty, hostTermBadEmptyName, hostTermBadIndZeroCtor,
  hostTermBadMatchEmpty.
-/

/-- B1 empty command list -- not well-formed. -/
def badEmptyModule : Module :=
  { name := n "Bad.Empty", commands := [] }

/-- B2 empty module name. -/
def badEmptyNameModule : Module :=
  {
    name := n ""
    commands := [Cmd.def_ (n "x") none (Term.litNat 0)]
  }

/-- B3 inductive with zero constructors. -/
def badIndZeroCtorModule : Module :=
  {
    name := n "Bad.Ind"
    commands := [
      Cmd.inductive_ (n "EmptyLike") [] [n "DecidableEq"]
    ]
  }

/-- B4 match with zero arms. -/
def badMatchEmptyModule : Module :=
  {
    name := n "Bad.Match"
    commands := [
      Cmd.def_ (n "f")
        (some (HostType.arrow HostType.nat HostType.nat))
        (Term.match_ (Term.var (n "k")) [])
    ]
  }

/-- B5 def with empty name. -/
def badDefEmptyNameModule : Module :=
  {
    name := n "Bad.Def"
    commands := [Cmd.def_ (n "") none (Term.litNat 1)]
  }

/-- Empty module rejects.
    Greppable: hostTermBadEmpty. -/
def hostTermBadEmpty : Bool := !(isWellFormed badEmptyModule)

/-- Empty name rejects.
    Greppable: hostTermBadEmptyName. -/
def hostTermBadEmptyName : Bool := !(isWellFormed badEmptyNameModule)

/-- Zero-ctor inductive rejects.
    Greppable: hostTermBadIndZeroCtor. -/
def hostTermBadIndZeroCtor : Bool := !(isWellFormed badIndZeroCtorModule)

/-- Empty match rejects.
    Greppable: hostTermBadMatchEmpty. -/
def hostTermBadMatchEmpty : Bool := !(isWellFormed badMatchEmptyModule)

/-- Empty def name rejects.
    Greppable: hostTermBadDefEmptyName. -/
def hostTermBadDefEmptyName : Bool := !(isWellFormed badDefEmptyNameModule)

/-- All bad fixtures reject.
    Greppable: hostTermBadFixturesOk. -/
def hostTermBadFixturesOk : Bool :=
  hostTermBadEmpty
    && hostTermBadEmptyName
    && hostTermBadIndZeroCtor
    && hostTermBadMatchEmpty
    && hostTermBadDefEmptyName

/-! ### Readiness pins -/

/-- Stage / surface identity pin. -/
def hostTermIdsOk : Bool :=
  (stageId == "SLAKE_HOST_TERM_V0")
    && (hostId == "HOST-TERM-IR")
    && (surfaceId == "HOST-TERM")
    && (surfaceAlias == "HOST-TERM-IR")

/-- Mult living Mult grade names still exist (host Mult import honesty). -/
def hostTermMultGradesOk : Bool :=
  (Mult.name Mult.mult0 == "MULT-0")
    && (Mult.name Mult.mult1 == "MULT-1")
    && (Mult.name Mult.multOmega == "MULT-OMEGA")

/-- End-to-end host term IR ready (structural; not peer green).
    Greppable: hostTermReady, HOST-TERM-IR, SLAKE_HOST_TERM_V0. -/
def hostTermReady : Bool :=
  hostTermIdsOk
    && hostTermGoodMult
    && multFixtureHasMultInductive
    && multFixtureHasOfNat
    && hostTermBadFixturesOk
    && hostTermMultGradesOk
    && hostTermHostElaboratorResidualRemains
    && hostTermDoesNotClaimPeerGreen
    && !hostTermResidualFreeClaimed
    && !hostTermProductSelfHostCompleteClaimed
    && !hostTermProofCompleteClaimed
    && !hostTermLlvmUnlocked
    && !hostTermProvablyUnlocked

/-- Ready does not claim peer elaborator green.
    Greppable: hostTermDoesNotClaimPeer. -/
def hostTermDoesNotClaimPeer : Bool :=
  hostTermReady && hostTermDoesNotClaimPeerGreen

/-- Ready keeps host elaborator residual honesty.
    Greppable: hostTermKeepsHostResidual. -/
def hostTermKeepsHostResidual : Bool :=
  hostTermReady && hostTermHostElaboratorResidualRemains

/-- Ready is not product residual free claim.
    Greppable: hostTermDoesNotMeanResidualFree. -/
def hostTermDoesNotMeanResidualFree : Bool :=
  hostTermReady && !hostTermResidualFreeClaimed

/-! ### HOST-TERM-THEOREM (readable statements, then proofs) -/

set_option maxRecDepth 8192

/-- Mult good fixture well-formed.
    Greppable: hostTermGoodMult_true, HOST-TERM-THEOREM. -/
theorem hostTermGoodMult_true : hostTermGoodMult = true := by
  native_decide

/-- Mult fixture has Mult inductive with three grades.
    Greppable: multFixtureHasMultInductive_true, HOST-TERM-THEOREM. -/
theorem multFixtureHasMultInductive_true :
    multFixtureHasMultInductive = true := by
  native_decide

/-- Mult fixture has ofNat? def.
    Greppable: multFixtureHasOfNat_true, HOST-TERM-THEOREM. -/
theorem multFixtureHasOfNat_true : multFixtureHasOfNat = true := by
  native_decide

/-- Empty module rejects.
    Greppable: hostTermBadEmpty_true, HOST-TERM-THEOREM. -/
theorem hostTermBadEmpty_true : hostTermBadEmpty = true := by
  native_decide

/-- Empty name rejects.
    Greppable: hostTermBadEmptyName_true, HOST-TERM-THEOREM. -/
theorem hostTermBadEmptyName_true : hostTermBadEmptyName = true := by
  native_decide

/-- Zero-ctor inductive rejects.
    Greppable: hostTermBadIndZeroCtor_true, HOST-TERM-THEOREM. -/
theorem hostTermBadIndZeroCtor_true : hostTermBadIndZeroCtor = true := by
  native_decide

/-- Empty match rejects.
    Greppable: hostTermBadMatchEmpty_true, HOST-TERM-THEOREM. -/
theorem hostTermBadMatchEmpty_true : hostTermBadMatchEmpty = true := by
  native_decide

/-- Empty def name rejects.
    Greppable: hostTermBadDefEmptyName_true, HOST-TERM-THEOREM. -/
theorem hostTermBadDefEmptyName_true : hostTermBadDefEmptyName = true := by
  native_decide

/-- All bad fixtures ok.
    Greppable: hostTermBadFixturesOk_true, HOST-TERM-THEOREM. -/
theorem hostTermBadFixturesOk_true : hostTermBadFixturesOk = true := by
  native_decide

/-- End-to-end host term IR ready.
    Greppable: hostTermReady_true, HOST-TERM-THEOREM, HOST-TERM-IR. -/
theorem hostTermReady_true : hostTermReady = true := by
  native_decide

/-- Ready does not claim peer green.
    Greppable: hostTermDoesNotClaimPeer_true, HOST-TERM-THEOREM. -/
theorem hostTermDoesNotClaimPeer_true :
    hostTermDoesNotClaimPeer = true := by
  native_decide

/-- Ready keeps host elaborator residual remains.
    Greppable: hostTermKeepsHostResidual_true, HOST-TERM-THEOREM. -/
theorem hostTermKeepsHostResidual_true :
    hostTermKeepsHostResidual = true := by
  native_decide

/-- Ready does not claim residual free.
    Greppable: hostTermDoesNotMeanResidualFree_true, HOST-TERM-THEOREM. -/
theorem hostTermDoesNotMeanResidualFree_true :
    hostTermDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY honesty; host residual remains.
    Greppable: hostTerm_claims_false, HOST-TERM-THEOREM. -/
theorem hostTerm_claims_false :
    (hostTermResidualFreeClaimed = false)
      /\ (hostTermProductSelfHostCompleteClaimed = false)
      /\ (hostTermProofCompleteClaimed = false)
      /\ (hostTermLlvmUnlocked = false)
      /\ (hostTermProvablyUnlocked = false)
      /\ (hostTermHostElaboratorResidualRemains = true)
      /\ (hostTermDoesNotClaimPeerGreen = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl (And.intro rfl rfl)))))

/-- Stage / surface name pins.
    Greppable: hostTerm_ids_eq, HOST-TERM-THEOREM. -/
theorem hostTerm_ids_eq :
    (stageId = "SLAKE_HOST_TERM_V0")
      /\ (hostId = "HOST-TERM-IR")
      /\ (surfaceId = "HOST-TERM")
      /\ (surfaceAlias = "HOST-TERM-IR") :=
  And.intro rfl
    (And.intro rfl (And.intro rfl rfl))

/-! ### HOST-TERM-SMOKE (lake fails if examples fail)
    Greppable: HOST-TERM-SMOKE, HOST-TERM-IR, SLAKE_HOST_TERM_V0. -/

example : hostTermGoodMult = true := by native_decide
example : multFixtureHasMultInductive = true := by native_decide
example : multFixtureHasOfNat = true := by native_decide
example : hostTermBadEmpty = true := by native_decide
example : hostTermBadEmptyName = true := by native_decide
example : hostTermBadIndZeroCtor = true := by native_decide
example : hostTermBadMatchEmpty = true := by native_decide
example : hostTermBadDefEmptyName = true := by native_decide
example : hostTermReady = true := by native_decide
example : hostTermDoesNotClaimPeer = true := by native_decide
example : hostTermKeepsHostResidual = true := by native_decide
example : hostTermHostElaboratorResidualRemains = true := rfl
example : hostTermDoesNotClaimPeerGreen = true := rfl
example : hostTermResidualFreeClaimed = false := rfl
example : hostTermLlvmUnlocked = false := rfl
example : hostTermProvablyUnlocked = false := rfl
example : hostId = "HOST-TERM-IR" := rfl
example : stageId = "SLAKE_HOST_TERM_V0" := rfl

end SystemsLean.HostTerm
"#

end SystemsLean.HostFrontLiveHostTerm
