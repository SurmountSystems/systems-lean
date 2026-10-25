/-
  Module: SystemsLean.HonestyFullBarFront
  Front for import SystemsLean.CapableFullBar plus theorem
  and example of `lhs = rhs := rfl` or `lhs = rhs := by decide`.
  The import name selects the seeded defs. The file name
  is not hardcoded. Namespace must be that same import.
  A decide or rfl whose sides differ is a def with no type.
  A false Bool stays false. Passing decide emits Bool true
  only after both sides reduce to the same value.
  The stored surface is 21 theorems and 18 examples.
  With namespace, import, and end that is 42 commands.
  kernelFuel stays 64. Each accepted command is a Bool literal.
  A thin forwarding main is not this front.
  A namespace file with no import is not this front.
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

namespace SystemsLean.HonestyFullBarFront

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce
open SystemsLean.HonestyFront
open SystemsLean.HonestyThmFront
open SystemsLean.HonestyDecide

def fullBarImport : String := "SystemsLean.CapableFullBar"

def stageLit : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_FULL_BAR_V0"

def hostLit : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR"

def selfLit : String :=
  "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR"

def ownLit : String :=
  "FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE"

def readLit : String := "FULL-BAR-REQ-B14-CAPABLE-READ-LAKE-FREE"

def composeLit : String :=
  "FULL-BAR-REQ-B14-CAPABLE-COMPOSE-LAKE-FREE"

def writeLit : String :=
  "FULL-BAR-REQ-B14-CAPABLE-WRITE-HC-LAKE-FREE"

def performLit : String :=
  "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"

def claimLit : String :=
  "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"

def blockerLit : String := "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"

def lakeExeLit : String := "slake-freestanding-capable-full-bar"

def justLit : String := "freestanding-capable-full-bar"

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

/-- Right-nested and. Each step is `if c then t else false`. -/
def andAll : List Term -> Term
  | [] => Term.litBool true
  | [t] => t
  | t :: rest => Term.ite t (andAll rest) (Term.litBool false)

def closedName : String :=
  "productPathFreestandingCapableFullBarStepContractsClosed"

def installName : String :=
  "productPathFreestandingCapableFullBarInstallOutClosed"

def orderedName : String :=
  "productPathFreestandingCapableFullBarOrderedPipelineJoined"

def ownName : String :=
  "productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake"

def lakeFreeName : String :=
  "productPathFreestandingCapableFullBarCapableLakeFree"

def fullName : String :=
  "productPathFreestandingCapableStepContractFullSatisfied"

def dependsName : String :=
  "productPathFreestandingCapableFullBarDependsOnLake"

def okName : String := "productPathFreestandingCapableFullBarOk"

def partialName : String :=
  "productPathFreestandingCapableFullBarPartialReady"

def okBody : Term :=
  andAll
    [ eqS "stageId" stageLit
    , eqS "hostId" hostLit
    , eqS "selfHostId" selfLit
    , eqB closedName true
    , eqB installName true
    , eqB orderedName true
    , eqB ownName true
    , eqB lakeFreeName true
    , eqB fullName false
    , eqB dependsName true
    , eqS "fullBarReqOwnershipRegenerateWithoutLake" ownLit
    , eqS "fullBarReqCapableReadLakeFree" readLit
    , eqS "fullBarReqCapableComposeLakeFree" composeLit
    , eqS "fullBarReqCapableWriteHcLakeFree" writeLit
    , eqS "fullBarReqPerformClaimedWithEvidence" performLit
    , eqS "fullBarReqOwnershipClaimedWithEvidence" claimLit
    , eqS "blockerMustOwnRegenerate" blockerLit
    , eqS "lakeExeName" lakeExeLit
    , eqS "justMeasureRecipe" justLit
    ]

def partialBody : Term :=
  andAll
    [ Term.var (n okName)
    , Term.var (n closedName)
    , Term.var (n installName)
    , Term.var (n orderedName)
    , Term.var (n ownName)
    , Term.var (n lakeFreeName)
    , Term.var (n dependsName)
    , notB (Term.var (n fullName))
    ]

def fullBarDefs : DefEnv :=
  [ ("stageId", strBody stageLit)
  , ("hostId", strBody hostLit)
  , ("selfHostId", strBody selfLit)
  , ("fullBarReqOwnershipRegenerateWithoutLake", strBody ownLit)
  , ("fullBarReqCapableReadLakeFree", strBody readLit)
  , ("fullBarReqCapableComposeLakeFree", strBody composeLit)
  , ("fullBarReqCapableWriteHcLakeFree", strBody writeLit)
  , ("fullBarReqPerformClaimedWithEvidence", strBody performLit)
  , ("fullBarReqOwnershipClaimedWithEvidence", strBody claimLit)
  , ("blockerMustOwnRegenerate", strBody blockerLit)
  , ("lakeExeName", strBody lakeExeLit)
  , ("justMeasureRecipe", strBody justLit)
  , (closedName, boolBody true)
  , (installName, boolBody true)
  , (orderedName, boolBody true)
  , (ownName, boolBody true)
  , (lakeFreeName, boolBody true)
  , (fullName, boolBody false)
  , (dependsName, boolBody true)
  , (okName, { binder := "", body := okBody })
  , (partialName, { binder := "", body := partialBody })
  ]

/-- Seed for this import. Another import is not this front. -/
def seedOf (imp : String) : Option DefEnv :=
  if imp == fullBarImport then some fullBarDefs else none

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

/-- Parse this surface. none means not this front. -/
def parseHonestyFullBarText (src : String) : Option Module :=
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

def toy : String :=
  "import SystemsLean.CapableFullBar\n" ++
  "namespace SystemsLean.CapableFullBar\n" ++
  "theorem stageId_eq : stageId =\n" ++
  "    \"SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_FULL_BAR_V0\"" ++
  " := rfl\n" ++
  "theorem productPathFreestandingCapableStepContractFullSatisfied_false :\n" ++
  "    productPathFreestandingCapableStepContractFullSatisfied = false := rfl\n" ++
  "theorem productPathFreestandingCapableFullBarOk_true :\n" ++
  "    productPathFreestandingCapableFullBarOk = true := by\n" ++
  "  decide\n" ++
  "theorem productPathFreestandingCapableFullBarPartialReady_true :\n" ++
  "    productPathFreestandingCapableFullBarPartialReady = true := by\n" ++
  "  decide\n" ++
  "example : justMeasureRecipe = \"freestanding-capable-full-bar\"" ++
  " := by decide\n" ++
  "end SystemsLean.CapableFullBar\n"

def toyAccepts : Bool :=
  match parseHonestyFullBarText toy with
  | some m => !m.commands.any cmdRejects
  | none => false

/-- A false Bool stays false. rfl against the other Bool is typeless. -/
def falseToy : String :=
  "import SystemsLean.CapableFullBar\n" ++
  "namespace SystemsLean.CapableFullBar\n" ++
  "theorem productPathFreestandingCapableStepContractFullSatisfied_false :\n" ++
  "    productPathFreestandingCapableStepContractFullSatisfied = true := rfl\n" ++
  "end SystemsLean.CapableFullBar\n"

def falseRejects : Bool :=
  match parseHonestyFullBarText falseToy with
  | some m => m.commands.any cmdRejects
  | none => false

def thinMisses : Bool :=
  match parseHonestyFullBarText
      ("import SystemsLean.CapableFullBar\n" ++
        "def main (args : List String) : IO UInt32 :=\n" ++
        "  SystemsLean.CapableFullBar.main args\n") with
  | none => true
  | some _ => false

def namespaceMisses : Bool :=
  match parseHonestyFullBarText "namespace SystemsLean.CapableFullBar\n" with
  | none => true
  | some _ => false

def otherImportMisses : Bool :=
  match parseHonestyFullBarText
      ("import SystemsLean.CapableCompose\n" ++
        "namespace SystemsLean.CapableCompose\n" ++
        "theorem stageId_eq : stageId = \"x\" := rfl\n" ++
        "end SystemsLean.CapableCompose\n") with
  | none => true
  | some _ => false

end SystemsLean.HonestyFullBarFront
