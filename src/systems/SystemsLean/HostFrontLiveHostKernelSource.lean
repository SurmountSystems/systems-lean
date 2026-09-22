/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostKernel.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostKernelSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTKERNEL, liveHostKernelSource,
  HOST-FRONT-LIVE-HOSTKERNEL, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostKernelSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostKernel

/-- Dual-pinned live HostKernel.lean bytes (must match on-disk file).
    Greppable: liveHostKernelSource, PARSE-LIVE-HOSTKERNEL. -/
def liveHostKernelSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Mult-first kernel typecheck of HostTerm modules.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: kernelCheck of HostTerm.Module (environment + infer). Not greps.
  Not leftover isolation-test files. Not full Lean 4 kernel.

  Spec (readable):
  - Bind nullary inductive ctors into an environment (Mult -> HostType.mult).
  - Check each typed def body against its HostType (arrow binders from free vars).
  - Infer app / match / literals / Option some/none; builtin isSome : Option t -> Bool.
  - Fail closed on ill-typed Mult (name arms Nat at String; isValid String arm;
    extra app).
  - kernelCheck HostTerm.multFixtureModule is the SystemsLean.Mult IR kernel path.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not live Mult.lean source parse (HostFront dialect).
  - Not FullHostElaborateRemains. Not package typecheck. Not OccupancyProbe.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-KERNEL, SLAKE_HOST_KERNEL,
  SLAKE_HOST_KERNEL_V0, KERNEL-CHECK, kernelCheck, kernelCheckMultFixture,
  kernelRejectIllTypedName, kernelRejectIllTypedIsValid, kernelRejectIllTypedApp,
  hostKernelReady, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.HostKernel
  Red/green: just systems-host; lake build SystemsLean.HostKernel when on
  surmount-1. Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostTerm

namespace SystemsLean.HostKernel

open SystemsLean.HostTerm

/-! ### HOST-KERNEL / SLAKE_HOST_KERNEL (Mult-first kernel typecheck) -/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_KERNEL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-KERNEL"

/-- Named kernel depth bar. Greppable: KERNEL-CHECK. -/
def checkDepthKernelBar : String := "KERNEL-CHECK"

/-- Host elaborator residual still remains. -/
def hostKernelHostElaboratorResidualRemains : Bool := true

/-- Local honesty: not peer elaborator green. -/
def hostKernelDoesNotClaimPeerGreen : Bool := true

/-- Does not claim product residual free. -/
def hostKernelResidualFreeClaimed : Bool := false

/-- Does not claim proof complete. -/
def hostKernelProofCompleteClaimed : Bool := false

/-- Does not unlock llvm. -/
def hostKernelLlvmUnlocked : Bool := false

/-- Does not unlock PROVABLY. -/
def hostKernelProvablyUnlocked : Bool := false

/-- Fuel for kernel infer (native_decide friendly). -/
def kernelFuel : Nat := 64

/-- Environment: name to HostType. -/
abbrev Env := List (Prod String HostType)

/-- Structure field tables (Types TypeTag / IrNode). -/
abbrev Structs := List (Prod String (List (Prod String HostType)))

/-- Seed SystemsLean.Mult import (ctors + ofNat? + name / isValid).
    name / isValid let kernelCheck of a live HostTerm parse resolve Mult.name. -/
def seedMult (env : Env) : Env :=
  ("mult0", HostType.mult)
    :: ("mult1", HostType.mult)
    :: ("multOmega", HostType.mult)
    :: ("ofNat?", HostType.arrow HostType.nat (HostType.option HostType.mult))
    :: ("name", HostType.arrow HostType.mult HostType.string)
    :: ("isValid", HostType.arrow HostType.mult HostType.bool)
    :: env

/-- Seed SystemsLean.Erasure import (Erased struct + unmarked/mark/isRuntimeAbsent/checkFailClosed).
    Lets kernelCheck of a live Extract parse resolve SystemsLean.Erasure.checkFailClosed. -/
def seedErasure (env : Env) (ss : Structs) : Prod Env Structs :=
  let erased : HostType := HostType.named (n "Erased")
  let env2 : Env :=
    ("unmarked", erased)
      :: ("mark", HostType.arrow erased erased)
      :: ("isRuntimeAbsent", HostType.arrow erased HostType.bool)
      :: ("erasureIsRuntimeAbsent", HostType.arrow erased HostType.bool)
      :: ("checkFailClosed",
          HostType.arrow HostType.mult (HostType.arrow erased HostType.bool))
      :: env
  (env2, ("Erased", [("marked", HostType.bool)]) :: ss)

/-- Seed SystemsLean.Types import (IrNode + List ops). Lets kernelCheck of a
    live IrProgram parse resolve n.isWellTyped, nil/append, and foldl. -/
def seedTypes (env : Env) (ss : Structs) : Prod Env Structs :=
  let irNode : HostType := HostType.named (n "IrNode")
  let listTy : HostType := HostType.named (n "List")
  let alpha : HostType := HostType.named (n "alpha")
  let env2 : Env :=
    ("isWellTyped", HostType.arrow irNode HostType.bool)
      :: ("nil", listTy)
      :: ("singleton", HostType.arrow irNode listTy)
      :: ("append", HostType.arrow listTy (HostType.arrow listTy listTy))
      :: ("foldl",
          HostType.arrow
            (HostType.arrow alpha (HostType.arrow irNode alpha))
            (HostType.arrow alpha (HostType.arrow listTy alpha)))
      :: env
  let ss2 : Structs :=
    ("IrNode",
      [("ty", HostType.named (n "TypeTag")),
       ("mult", HostType.mult),
       ("kind", HostType.named (n "NodeKind"))]) :: ss
  (env2, ss2)

/-- Lookup a structure field type. -/
def lookupStruct (ss : Structs) (tyName field : String) : Option HostType :=
  let rec goS : Structs -> Option HostType
    | [] => none
    | (n, fs) :: rest =>
      if n == tyName then
        let rec goF : List (Prod String HostType) -> Option HostType
          | [] => none
          | (fn, ty) :: rest2 =>
            if fn == field then some ty else goF rest2
        goF fs
      else goS rest
  goS ss

/-- Lookup a structure field list. -/
def lookupStructDecl (ss : Structs) (tyName : String) :
    Option (List (Prod String HostType)) :=
  let rec go : Structs -> Option (List (Prod String HostType))
    | [] => none
    | (n, fs) :: rest => if n == tyName then some fs else go rest
  go ss

/-- Field type in a structure decl. -/
def lookupField (fs : List (Prod String HostType)) (name : String) :
    Option HostType :=
  let rec go : List (Prod String HostType) -> Option HostType
    | [] => none
    | (n, ty) :: rest => if n == name then some ty else go rest
  go fs

/-- Arrow type from named binders. -/
def addNamedBinderArrows : List (Prod Name HostType) -> HostType -> HostType
  | [], ty => ty
  | (_, d) :: rest, ty => HostType.arrow d (addNamedBinderArrows rest ty)

/-- HostType equality (fail closed). Greppable helper. -/
def hostTypeEq : HostType -> HostType -> Bool
  | HostType.mult, HostType.mult => true
  | HostType.nat, HostType.nat => true
  | HostType.string, HostType.string => true
  | HostType.bool, HostType.bool => true
  | HostType.option a, HostType.option b => hostTypeEq a b
  | HostType.named x, HostType.named y => x.raw == y.raw
  | HostType.arrow d1 c1, HostType.arrow d2 c2 =>
      hostTypeEq d1 d2 && hostTypeEq c1 c2
  | _, _ => false

/-- Lookup a binding. -/
def lookupEnv (env : Env) (name : String) : Option HostType :=
  let rec go : Env -> Option HostType
    | [] => none
    | (n, ty) :: rest =>
      if n == name then some ty else go rest
  go env

/-- True when name is bound. -/
def inEnv (env : Env) (name : String) : Bool :=
  match lookupEnv env name with
  | some _ => true
  | none => false

/-- First free Term.var not bound in env (function-param convention). -/
def firstFreeVarN : Nat -> Env -> Term -> Option String
  | 0, _, _ => none
  | Nat.succ n, env, t =>
    match t with
    | Term.var x =>
      if inEnv env x.raw then none else some x.raw
    | Term.app f a =>
      match firstFreeVarN n env f with
      | some s => some s
      | none => firstFreeVarN n env a
    | Term.some_ u => firstFreeVarN n env u
    | Term.match_ scrut arms =>
      match firstFreeVarN n env scrut with
      | some s => some s
      | none =>
        let rec goArms : Nat -> List (Prod Pat Term) -> Option String
          | 0, _ => none
          | _, [] => none
          | Nat.succ m, (_, body) :: rest =>
            match firstFreeVarN m env body with
            | some s => some s
            | none => goArms m rest
        goArms n arms
    | Term.ite c t e =>
      match firstFreeVarN n env c with
      | some s => some s
      | none =>
        match firstFreeVarN n env t with
        | some s => some s
        | none => firstFreeVarN n env e
    | Term.decideEq a b =>
      match firstFreeVarN n env a with
      | some s => some s
      | none => firstFreeVarN n env b
    | Term.proj obj _ => firstFreeVarN n env obj
    | Term.structLit fs =>
      let rec goFs : Nat -> List (Prod Name Term) -> Option String
        | 0, _ => none
        | _, [] => none
        | Nat.succ m, (_, tm) :: rest =>
          match firstFreeVarN m env tm with
          | some s => some s
          | none => goFs m rest
      goFs n fs
    | _ => none

/-- Bind a pattern against scrutinee type. -/
def bindPat (env : Env) (sty : HostType) : Pat -> Option Env
  | Pat.wild => some env
  | Pat.litNat _ =>
    if hostTypeEq sty HostType.nat then some env else none
  | Pat.var x => some ((x.raw, sty) :: env)
  | Pat.ctor0 x =>
    match lookupEnv env x.raw with
    | some cty =>
      if hostTypeEq cty sty then some env else none
    | none => none
  | Pat.someVar x =>
    match sty with
    | HostType.option e => some ((x.raw, e) :: env)
    | _ => none

/-- Infer a term. expected guides none_/Option. Greppable: inferTerm. -/
def inferTermN : Nat -> Env -> Structs -> Option HostType -> Term -> Option HostType
  | 0, _, _, _, _ => none
  | Nat.succ fuel, env, ss, expected, t =>
    match t with
    | Term.litNat _ => some HostType.nat
    | Term.litString _ => some HostType.string
    | Term.litBool _ => some HostType.bool
    | Term.none_ =>
      match expected with
      | some (HostType.option e) => some (HostType.option e)
      | _ => none
    | Term.some_ u =>
      let innerExp : Option HostType :=
        match expected with
        | some (HostType.option e) => some e
        | _ => none
      match inferTermN fuel env ss innerExp u with
      | some ty => some (HostType.option ty)
      | none => none
    | Term.var x => lookupEnv env x.raw
    | Term.const x => lookupEnv env x.raw
    | Term.app f a =>
      match f with
      | Term.const fn =>
        if fn.raw == "isSome" then
          match inferTermN fuel env ss none a with
          | some (HostType.option _) => some HostType.bool
          | _ => none
        else if fn.raw == "isEmpty" then
          match inferTermN fuel env ss none a with
          | some HostType.string => some HostType.bool
          | some (HostType.named x) =>
            if x.raw == "List" then some HostType.bool else none
          | _ => none
        else
          match inferTermN fuel env ss none f with
          | some (HostType.arrow d c) =>
            match inferTermN fuel env ss (some d) a with
            | some aty =>
              if hostTypeEq aty d then some c else none
            | none => none
          | some (HostType.named _) =>
            match inferTermN fuel env ss none a with
            | some _ => inferTermN fuel env ss none f
            | none => none
          | _ => none
      | _ =>
        match inferTermN fuel env ss none f with
        | some (HostType.arrow d c) =>
          match inferTermN fuel env ss (some d) a with
          | some aty =>
            if hostTypeEq aty d then some c else none
          | none => none
        | some (HostType.named _) =>
          match inferTermN fuel env ss none a with
          | some _ => inferTermN fuel env ss none f
          | none => none
        | _ => none
    | Term.match_ scrut arms =>
      match inferTermN fuel env ss none scrut with
      | none => none
      | some sty =>
        let rec inferArms : Nat -> List (Prod Pat Term) -> Option HostType
          | 0, _ => none
          | _, [] => none
          | Nat.succ m, (p, body) :: rest =>
            match bindPat env sty p with
            | none => none
            | some env2 =>
              match inferTermN m env2 ss expected body with
              | none => none
              | some bty =>
                match rest with
                | [] => some bty
                | _ =>
                  match inferArms m rest with
                  | some rty =>
                    if hostTypeEq bty rty then some bty else none
                  | none => none
        inferArms fuel arms
    | Term.ite c t1 e =>
      match inferTermN fuel env ss (some HostType.bool) c with
      | some cty =>
        if !hostTypeEq cty HostType.bool then none
        else
          match inferTermN fuel env ss expected t1 with
          | none => none
          | some tty =>
            match inferTermN fuel env ss expected e with
            | some ety =>
              if hostTypeEq tty ety then some tty else none
            | none => none
      | none => none
    | Term.decideEq a b =>
      match inferTermN fuel env ss none a with
      | none => none
      | some aty =>
        match inferTermN fuel env ss (some aty) b with
        | some bty =>
          if hostTypeEq aty bty then some HostType.bool else none
        | none => none
    | Term.proj obj field =>
      match inferTermN fuel env ss none obj with
      | none => none
      | some (HostType.named x) =>
        if x.raw == "List" then
          if field.raw == "length" then some HostType.nat
          else if field.raw == "isEmpty" then some HostType.bool
          else if field.raw == "all" then
            some (HostType.arrow
              (HostType.arrow (HostType.named (n "IrNode")) HostType.bool)
              HostType.bool)
          else
            match lookupStruct ss x.raw field.raw with
            | some fty => some fty
            | none => none
        else
          match lookupStruct ss x.raw field.raw with
          | some fty => some fty
          | none =>
            match lookupEnv env field.raw with
            | some (HostType.arrow d c) =>
              if hostTypeEq d (HostType.named x) then some c else none
            | _ => none
      | some HostType.string =>
        if field.raw == "isEmpty" then some HostType.bool
        else
          match lookupEnv env field.raw with
          | some (HostType.arrow d c) =>
            if hostTypeEq d HostType.string then some c else none
          | _ => none
      | some oty =>
        match lookupEnv env field.raw with
        | some (HostType.arrow d c) =>
          if hostTypeEq d oty then some c else none
        | _ => none
    | Term.structLit fs =>
      match expected with
      | some (HostType.named x) =>
        match lookupStructDecl ss x.raw with
        | none => none
        | some decl =>
          let rec checkFs : Nat -> List (Prod Name Term) -> Bool
            | 0, _ => false
            | _, [] => true
            | Nat.succ m, (fn, tm) :: rest =>
              match lookupField decl fn.raw with
              | none => false
              | some fty =>
                match inferTermN m env ss (some fty) tm with
                | some got =>
                  hostTypeEq got fty && checkFs m rest
                | none => false
          if fs.length == decl.length && checkFs fuel fs then
            some (HostType.named x)
          else
            none
      | none =>
        let rec trySs : Nat -> Structs -> Option HostType
          | 0, _ => none
          | _, [] => none
          | Nat.succ m, (sn, decl) :: rest =>
            let rec checkFs : Nat -> List (Prod Name Term) -> Bool
              | 0, _ => false
              | _, [] => true
              | Nat.succ k, (fn, tm) :: restF =>
                match lookupField decl fn.raw with
                | none => false
                | some fty =>
                  match inferTermN k env ss (some fty) tm with
                  | some got =>
                    hostTypeEq got fty && checkFs k restF
                  | none => false
            if fs.length == decl.length && checkFs m fs then
              some (HostType.named (n sn))
            else
              trySs m rest
        trySs fuel ss
      | _ => none

/-- Infer with default fuel. -/
def inferTerm (env : Env) (expected : Option HostType) (t : Term) :
    Option HostType :=
  inferTermN kernelFuel env [] expected t

/-- Check term has type ty. -/
def checkTermN (fuel : Nat) (env : Env) (ss : Structs) (ty : HostType) (t : Term) :
    Bool :=
  match inferTermN fuel env ss (some ty) t with
  | some got => hostTypeEq got ty
  | none => false

/-- Check a function body against an arrow (bind first free var per arrow). -/
def checkFunBodyN : Nat -> Env -> Structs -> HostType -> Term -> Bool
  | 0, _, _, _, _ => false
  | Nat.succ n, env, ss, HostType.arrow d c, body =>
    match firstFreeVarN n env body with
    | some x => checkFunBodyN n ((x, d) :: env) ss c body
    | none => checkTermN n env ss (HostType.arrow d c) body
  | Nat.succ n, env, ss, ty, body => checkTermN n env ss ty body

/-- Inductive name Mult uses HostType.mult; others are named. -/
def inductiveHostType (name : Name) : HostType :=
  if name.raw == "Mult" then HostType.mult else HostType.named name

/-- Extend env with nullary ctors. -/
def addCtors (env : Env) (ty : HostType) : List CtorDecl -> Env
  | [] => env
  | c :: rest => addCtors ((c.name.raw, ty) :: env) ty rest

/-- Check one command; return new env+structs or none. -/
def checkCmdN (fuel : Nat) (env : Env) (ss : Structs) : Cmd -> Option (Prod Env Structs)
  | Cmd.importModule x =>
    if x.raw == "SystemsLean.Mult" then some (seedMult env, ss)
    else if x.raw == "SystemsLean.Erasure" then
      match seedErasure env ss with
      | (e2, s2) => some (e2, s2)
    else if x.raw == "SystemsLean.Types" then
      match seedTypes env ss with
      | (e2, s2) => some (e2, s2)
    else some (env, ss)
  | Cmd.namespace _ => some (env, ss)
  | Cmd.endNamespace _ => some (env, ss)
  | Cmd.openNs _ => some (env, ss)
  | Cmd.inductive_ name ctors _ =>
    if ctors.isEmpty then none
    else some (addCtors env (inductiveHostType name) ctors, ss)
  | Cmd.def_ name (some ty) body =>
    if checkFunBodyN fuel env ss ty body then
      some ((name.raw, ty) :: env, ss)
    else
      none
  | Cmd.def_ _ none _ => none
  | Cmd.check tm ty =>
    if checkTermN fuel env ss ty tm then some (env, ss) else none
  | Cmd.structure_ name fields _ =>
    if fields.isEmpty then none
    else
      let fs := fields.map (fun f => (f.name.raw, f.ty))
      some (env, (name.raw, fs) :: ss)
  | Cmd.defBind name bs ret body =>
    let envB := bs.foldr (fun p e => (p.fst.raw, p.snd) :: e) env
    if checkTermN fuel envB ss ret body then
      some ((name.raw, addNamedBinderArrows bs ret) :: env, ss)
    else
      none

/-- Fold commands. Greppable: kernelCheck. -/
def kernelCheckN (fuel : Nat) (env : Env) (ss : Structs) : List Cmd -> Bool
  | [] => true
  | c :: rest =>
    match checkCmdN fuel env ss c with
    | none => false
    | some (env2, ss2) =>
      match fuel with
      | 0 => false
      | Nat.succ n => kernelCheckN n env2 ss2 rest

/-- Kernel-check a HostTerm module. Greppable: kernelCheck, KERNEL-CHECK. -/
def kernelCheck (m : Module) : Bool :=
  isWellFormed m && kernelCheckN kernelFuel [] [] m.commands

/-- SystemsLean.Mult IR fixture kernel-checks.
    Greppable: kernelCheckMultFixture, KERNEL-CHECK. -/
def kernelCheckMultFixture : Bool :=
  kernelCheck HostTerm.multFixtureModule

/-- Ill-typed: name claimed String, arms Nat. Kernel must reject.
    Greppable: badMultNameNatModule. -/
def badMultNameNatModule : Module :=
  {
    name := n "SystemsLean.Mult"
    commands := [
      Cmd.inductive_ (n "Mult") HostTerm.multCtors [],
      Cmd.def_ (n "name")
        (some (HostType.arrow HostType.mult HostType.string))
        (Term.match_ (Term.var (n "m")) [
          (Pat.ctor0 (n "mult0"), Term.litNat 0),
          (Pat.ctor0 (n "mult1"), Term.litNat 1),
          (Pat.ctor0 (n "multOmega"), Term.litNat 2)
        ])
    ]
  }

/-- Ill-typed: isValid claimed Bool, arm String. -/
def badMultIsValidStringModule : Module :=
  {
    name := n "SystemsLean.Mult"
    commands := [
      Cmd.inductive_ (n "Mult") HostTerm.multCtors [],
      Cmd.def_ (n "isValid")
        (some (HostType.arrow HostType.mult HostType.bool))
        (Term.match_ (Term.var (n "m")) [
          (Pat.ctor0 (n "mult0"), Term.litString "bad"),
          (Pat.ctor0 (n "mult1"), Term.litBool true),
          (Pat.ctor0 (n "multOmega"), Term.litBool true)
        ])
    ]
  }

/-- Ill-typed: extra app on isValid (Bool applied). -/
def badMultExtraAppModule : Module :=
  {
    name := n "SystemsLean.Mult"
    commands := [
      Cmd.inductive_ (n "Mult") HostTerm.multCtors [],
      Cmd.def_ (n "isValid")
        (some (HostType.arrow HostType.mult HostType.bool))
        (Term.match_ (Term.var (n "m")) [
          (Pat.ctor0 (n "mult0"), Term.litBool true),
          (Pat.ctor0 (n "mult1"), Term.litBool true),
          (Pat.ctor0 (n "multOmega"), Term.litBool true)
        ]),
      Cmd.def_ (n "multIsValid")
        (some (HostType.arrow HostType.mult HostType.bool))
        (Term.app
          (Term.app (Term.const (n "isValid")) (Term.const (n "mult0")))
          (Term.var (n "m")))
    ]
  }

/-- Kernel rejects Nat arms at String.
    Greppable: kernelRejectIllTypedName, KERNEL-CHECK. -/
def kernelRejectIllTypedName : Bool :=
  !(kernelCheck badMultNameNatModule)

/-- Kernel rejects String arm at Bool.
    Greppable: kernelRejectIllTypedIsValid, KERNEL-CHECK. -/
def kernelRejectIllTypedIsValid : Bool :=
  !(kernelCheck badMultIsValidStringModule)

/-- Kernel rejects extra app.
    Greppable: kernelRejectIllTypedApp, KERNEL-CHECK. -/
def kernelRejectIllTypedApp : Bool :=
  !(kernelCheck badMultExtraAppModule)

/-- Kernel dual-pin ready (Mult fixture + three rejects + honesty).
    Greppable: hostKernelReady, KERNEL-CHECK. -/
def hostKernelReady : Bool :=
  (stageId == "SLAKE_HOST_KERNEL_V0")
    && (hostId == "HOST-KERNEL")
    && (checkDepthKernelBar == "KERNEL-CHECK")
    && kernelCheckMultFixture
    && kernelRejectIllTypedName
    && kernelRejectIllTypedIsValid
    && kernelRejectIllTypedApp
    && hostKernelHostElaboratorResidualRemains
    && hostKernelDoesNotClaimPeerGreen
    && !hostKernelResidualFreeClaimed
    && !hostKernelProofCompleteClaimed
    && !hostKernelLlvmUnlocked
    && !hostKernelProvablyUnlocked

end SystemsLean.HostKernel
"#

end SystemsLean.HostFrontLiveHostKernel
