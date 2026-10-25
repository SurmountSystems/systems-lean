/-
  Module: SystemsLean.HonestyEqFront
  Front for an import plus theorem and example of
  `lhs = rhs := rfl` or `lhs = rhs := by decide`.
  The import name selects the seeded defs. The file name
  is not hardcoded. Namespace must be that same import.
  A decide or rfl whose sides differ is a def with no type.
  A thin forwarding main is not this front.
  A namespace file with no import is not this front.
  After the eq surface, an empty HostModuleCheck barrel.
  After that barrel, a HostFrontLive pin with FullHost false.
  A false Bool stays false.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HonestyFront
import SystemsLean.HonestyThmFront
import SystemsLean.HonestyDecide
import SystemsLean.HostKernelReduce
import SystemsLean.HmcBarrel
import SystemsLean.LivePin

namespace SystemsLean.HonestyEqFront

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce
open SystemsLean.HonestyFront
open SystemsLean.HonestyThmFront
open SystemsLean.HonestyDecide

def composeImport : String := "SystemsLean.CapableCompose"

def stageLit : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_COMPOSE_V0"

def hostLit : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE"

def selfLit : String :=
  "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE"

def contractLit : String :=
  "FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE"

def gapLit : String := "FREESTANDING-PERFORM-GAP-COMPOSE"

def writerLit : String :=
  "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY"

def apiLit : String := "freestandingCapableComposePlanApplyBody"

def lakeExeLit : String := "slake-freestanding-capable-compose"

def justLit : String := "freestanding-capable-compose"

def lakeFreeLit : String :=
  "freestanding-capable-compose-lake-free"

def strBody (s : String) : DefBody :=
  { binder := "", body := Term.litString s }

def boolBody (b : Bool) : DefBody :=
  { binder := "", body := Term.litBool b }

def eqS (nm s : String) : Term :=
  Term.decideEq (Term.var (n nm)) (Term.litString s)

def eqB (nm : String) (b : Bool) : Term :=
  Term.decideEq (Term.var (n nm)) (Term.litBool b)

def notB (t : Term) : Term :=
  Term.ite t (Term.litBool false) (Term.litBool true)

/-- Left-nested and. Each step is `if c then t else false`. -/
def andAll : List Term -> Term
  | [] => Term.litBool true
  | [t] => t
  | t :: rest => Term.ite t (andAll rest) (Term.litBool false)

def okBody : Term :=
  andAll
    [ eqS "stageId" stageLit
    , eqS "hostId" hostLit
    , eqS "selfHostId" selfLit
    , eqS "contractStepCompose" contractLit
    , eqS "gapCompose" gapLit
    , eqS "writerPathStepCompose" writerLit
    , eqS "freestandingCapableComposeApi" apiLit
    , eqB "productPathFreestandingCapableComposeAuthorityNotEmit" true
    , eqB "productPathFreestandingCapableComposeDependsOnLake" true
    , eqS "lakeExeName" lakeExeLit
    , eqS "justRecipeName" justLit
    , eqS "productPathFreestandingCapableComposeLakeFreeRecipe" lakeFreeLit
    ]

def partialBody : Term :=
  andAll
    [ Term.var (n "productPathFreestandingCapableComposeOk")
    , Term.var (n "productPathFreestandingCapableComposeAuthorityNotEmit")
    , Term.var (n "productPathFreestandingCapableComposeDependsOnLake")
    , notB (Term.var
        (n "productPathFreestandingCapableStepContractFullSatisfied"))
    ]

def composeDefs : DefEnv :=
  [ ("stageId", strBody stageLit)
  , ("hostId", strBody hostLit)
  , ("selfHostId", strBody selfLit)
  , ("contractStepCompose", strBody contractLit)
  , ("gapCompose", strBody gapLit)
  , ("writerPathStepCompose", strBody writerLit)
  , ("freestandingCapableComposeApi", strBody apiLit)
  , ("lakeExeName", strBody lakeExeLit)
  , ("justRecipeName", strBody justLit)
  , ("productPathFreestandingCapableComposeLakeFreeRecipe", strBody lakeFreeLit)
  , ("productPathFreestandingCapableComposeAuthorityNotEmit", boolBody true)
  , ("productPathFreestandingCapableComposeDependsOnLake", boolBody true)
  , ("productPathFreestandingCapableStepContractFullSatisfied", boolBody false)
  , ("productPathFreestandingCapableComposeOk",
      { binder := "", body := okBody })
  , ("productPathFreestandingCapableComposePartialReady",
      { binder := "", body := partialBody })
  ]

/-- Seed for this import. Another import is not this front. -/
def seedOf (imp : String) : Option DefEnv :=
  if imp == composeImport then some composeDefs else none

def parseProof (defs : DefEnv) (nm : String) (ts : List String) :
    Option (Prod Cmd (List String)) :=
  match parseSide ts with
  | some (lhs, "=" :: rest) =>
    match parseSide rest with
    | some (rhs, ":=" :: "rfl" :: rest2) =>
      some (emitDecide nm defs lhs rhs, rest2)
    | some (rhs, ":=" :: "by" :: "decide" :: rest2) =>
      some (emitDecide nm defs lhs rhs, rest2)
    | _ => none
  | _ => none

def parseItems (fuel : Nat) (defs : DefEnv) (acc : List Cmd)
    (ts : List String) : Option (Prod (List Cmd) (List String)) :=
  match fuel with
  | 0 => none
  | Nat.succ k =>
    match ts with
    | "theorem" :: name :: ":" :: rest =>
      if isIdent name then
        match parseProof defs name rest with
        | some (cmd, rest2) => parseItems k defs (cmd :: acc) rest2
        | none => none
      else
        none
    | "example" :: ":" :: rest =>
      match parseProof defs "example" rest with
      | some (cmd, rest2) => parseItems k defs (cmd :: acc) rest2
      | none => none
    | "end" :: _ => some (acc.reverse, ts)
    | _ => none
termination_by fuel

def eqFinish (ns imp : String) (thms : List Cmd) (ts : List String) :
    Option Module :=
  if thms.isEmpty || ns != imp then
    none
  else
    match ts with
    | "end" :: rest =>
      match parseDotted parseFuel rest with
      | some (nm, rest2) =>
        if nm == ns && rest2.isEmpty then
          let cmds :=
            [Cmd.namespace (n ns), Cmd.importModule (n imp)]
            ++ thms ++ [Cmd.endNamespace (n ns)]
          let m : Module := { name := n ns, commands := cmds }
          if isWellFormed m then some m else none
        else
          none
      | none => none
    | _ => none

/-- rfl or by decide. none means not this surface. -/
def parseEqSurface (src : String) : Option Module :=
  match strip src.toList SMode.code [] with
  | none => none
  | some kept =>
    match thmTok kept ThmMode.norm [] with
    | none => none
    | some ts =>
      match ts with
      | "import" :: rest =>
        match parseDotted parseFuel rest with
        | some (imp, rest2) =>
          match seedOf imp with
          | none => none
          | some defs =>
            match rest2 with
            | "namespace" :: rest3 =>
              match parseDotted parseFuel rest3 with
              | some (ns, rest4) =>
                match parseItems 64 defs [] rest4 with
                | some (thms, rest5) => eqFinish ns imp thms rest5
                | none => none
              | none => none
            | _ => none
        | none => none
      | _ => none

/-- Eq surface, else an empty HostModuleCheck barrel,
    else a HostFrontLive pin with FullHost false. -/
def parseHonestyEqText (src : String) : Option Module :=
  match parseEqSurface src with
  | some m => some m
  | none =>
    match HmcBarrel.parseHmcBarrel src with
    | some m => some m
    | none => LivePin.parseLivePin src

def toy : String :=
  "import SystemsLean.CapableCompose\n" ++
  "namespace SystemsLean.CapableCompose\n" ++
  "theorem stageId_eq :\n" ++
  "    stageId = \"SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_COMPOSE_V0\" := rfl\n" ++
  "theorem productPathFreestandingCapableComposeOk_true :\n" ++
  "    productPathFreestandingCapableComposeOk = true := by\n" ++
  "  decide\n" ++
  "end SystemsLean.CapableCompose\n"

def toyAccepts : Bool :=
  match parseHonestyEqText toy with
  | some m => !m.commands.any cmdRejects
  | none => false

/-- A false Bool stays false. rfl against the other Bool is typeless. -/
def falseToy : String :=
  "import SystemsLean.CapableCompose\n" ++
  "namespace SystemsLean.CapableCompose\n" ++
  "theorem productPathFreestandingCapableStepContractFullSatisfied_false :\n" ++
  "    productPathFreestandingCapableStepContractFullSatisfied = true := rfl\n" ++
  "end SystemsLean.CapableCompose\n"

def falseRejects : Bool :=
  match parseHonestyEqText falseToy with
  | some m => m.commands.any cmdRejects
  | none => false

def thinMisses : Bool :=
  match parseHonestyEqText
      ("import SystemsLean.CapableCompose\n" ++
        "def main (args : List String) : IO UInt32 :=\n" ++
        "  SystemsLean.CapableCompose.main args\n") with
  | none => true
  | some _ => false

def namespaceMisses : Bool :=
  match parseHonestyEqText "namespace SystemsLean.Capable\n" with
  | none => true
  | some _ => false

def pinHookAccepts : Bool :=
  match parseHonestyEqText LivePin.pinToy with
  | some m => isWellFormed m
  | none => false

def otherImportMisses : Bool :=
  match parseHonestyEqText
      ("import SystemsLean.BootstrapHonesty\n" ++
        "namespace SystemsLean.BootstrapHonesty\n" ++
        "theorem stageId_eq : stageId = \"x\" := rfl\n" ++
        "end SystemsLean.BootstrapHonesty\n") with
  | none => true
  | some _ => false

end SystemsLean.HonestyEqFront
