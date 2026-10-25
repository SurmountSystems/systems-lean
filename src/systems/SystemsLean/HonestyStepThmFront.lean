/-
  Module: SystemsLean.HonestyStepThmFront
  Front for import SystemsLean.CapableStepContract plus theorem
  and example of `lhs = rhs := rfl` or `lhs = rhs := by decide`.
  The import name selects the seeded defs. The file name
  is not hardcoded. Namespace must be that same import.
  A decide or rfl whose sides differ is a def with no type.
  A false Bool stays false. Passing decide emits Bool true
  only after both sides reduce to the same value.
  The stored surface is 21 theorems and 19 examples.
  With namespace, import, and end that is 43 commands.
  kernelFuel stays 64. Each accepted command is a Bool literal.
  A thin forwarding main is not this front.
  A namespace file with no import is not this front.
  This is not a general Lean parser.
  Does not call Lean.Elab.processCommands.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

import SystemsLean.HostTerm
import SystemsLean.HostKernelReduce
import SystemsLean.HonestyFront
import SystemsLean.HonestyThmFront
import SystemsLean.HonestyReadThmFront

namespace SystemsLean.HonestyStepThmFront

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce
open SystemsLean.HonestyFront
open SystemsLean.HonestyThmFront
open SystemsLean.HonestyReadThmFront

def stepImport : String := "SystemsLean.CapableStepContract"

def stageLit : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0"

def hostLit : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT"

def selfLit : String :=
  "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT"

def readStepLit : String := "FREESTANDING-CAPABLE-STEP-CONTRACT-READ"

def composeStepLit : String := "FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE"

def writeStepLit : String := "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC"

def gapReadLit : String := "FREESTANDING-PERFORM-GAP-READ-SSOT"

def gapComposeLit : String := "FREESTANDING-PERFORM-GAP-COMPOSE"

def gapWriteLit : String := "FREESTANDING-PERFORM-GAP-WRITE-HC"

def readApiLit : String := "freestandingCapableReadDualSsot"

def composeApiLit : String := "freestandingCapableComposePlanApplyBody"

def writeApiLit : String := "freestandingCapableWriteFreestandingHc"

def blockReadLit : String := "BLOCKER-READ-STILL-LAKE-HOST-PRODUCT-PATH"

def blockComposeLit : String :=
  "BLOCKER-COMPOSE-STILL-LAKE-HOST-PRODUCT-PATH"

def blockWriteLit : String := "BLOCKER-WRITE-HC-STILL-LAKE-HOST-PRODUCT-PATH"

def blockOwnLit : String := "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"

def lakeExeLit : String := "slake-freestanding-capable-step-contract"

def justLit : String := "freestanding-capable-step-contract"

def authName : String :=
  "productPathFreestandingCapableStepContractAuthorityNotEmit"

def readSatName : String :=
  "productPathFreestandingCapableStepContractReadSatisfied"

def composeSatName : String :=
  "productPathFreestandingCapableStepContractComposeSatisfied"

def writeSatName : String :=
  "productPathFreestandingCapableStepContractWriteHcSatisfied"

def fullName : String :=
  "productPathFreestandingCapableStepContractFullSatisfied"

def okName : String := "productPathFreestandingCapableStepContractOk"

def partialName : String :=
  "productPathFreestandingCapableStepContractPartialReady"

def hostLakeName : String := "hostLakeBootstrapRemainsForWriter"

def okBody : Term :=
  andAll
    [ eqS "stageId" stageLit
    , eqS "hostId" hostLit
    , eqS "selfHostId" selfLit
    , eqB authName true
    , eqB hostLakeName true
    , eqB readSatName true
    , eqB composeSatName true
    , eqB writeSatName true
    , eqB fullName false
    , eqS "contractStepRead" readStepLit
    , eqS "contractStepCompose" composeStepLit
    , eqS "contractStepWriteHc" writeStepLit
    , eqS "gapReadSsot" gapReadLit
    , eqS "gapCompose" gapComposeLit
    , eqS "gapWriteHc" gapWriteLit
    , eqS "freestandingCapableReadApi" readApiLit
    , eqS "freestandingCapableComposeApi" composeApiLit
    , eqS "freestandingCapableWriteHcApi" writeApiLit
    , eqS "blockerReadStillLakeHost" blockReadLit
    , eqS "blockerComposeStillLakeHost" blockComposeLit
    , eqS "blockerWriteHcStillLakeHost" blockWriteLit
    , eqS "blockerFreestandingMustOwnRegenerate" blockOwnLit
    , eqS "lakeExeName" lakeExeLit
    , eqS "justMeasureRecipe" justLit
    ]

def partialBody : Term :=
  andAll
    [ Term.var (n okName)
    , Term.var (n authName)
    , Term.var (n readSatName)
    , Term.var (n composeSatName)
    , Term.var (n writeSatName)
    , notB (Term.var (n fullName))
    ]

def stepDefs : DefEnv :=
  [ ("stageId", strBody stageLit)
  , ("hostId", strBody hostLit)
  , ("selfHostId", strBody selfLit)
  , ("contractStepRead", strBody readStepLit)
  , ("contractStepCompose", strBody composeStepLit)
  , ("contractStepWriteHc", strBody writeStepLit)
  , ("gapReadSsot", strBody gapReadLit)
  , ("gapCompose", strBody gapComposeLit)
  , ("gapWriteHc", strBody gapWriteLit)
  , ("freestandingCapableReadApi", strBody readApiLit)
  , ("freestandingCapableComposeApi", strBody composeApiLit)
  , ("freestandingCapableWriteHcApi", strBody writeApiLit)
  , ("blockerReadStillLakeHost", strBody blockReadLit)
  , ("blockerComposeStillLakeHost", strBody blockComposeLit)
  , ("blockerWriteHcStillLakeHost", strBody blockWriteLit)
  , ("blockerFreestandingMustOwnRegenerate", strBody blockOwnLit)
  , ("lakeExeName", strBody lakeExeLit)
  , ("justMeasureRecipe", strBody justLit)
  , (authName, boolBody true)
  , (hostLakeName, boolBody true)
  , (readSatName, boolBody true)
  , (composeSatName, boolBody true)
  , (writeSatName, boolBody true)
  , (fullName, boolBody false)
  , (okName, { binder := "", body := okBody })
  , (partialName, { binder := "", body := partialBody })
  ]

/-- Seed for this import. Another import is not this front. -/
def seedOf (imp : String) : Option DefEnv :=
  if imp == stepImport then some stepDefs else none

/-- Parse this surface. none means not this front. -/
def parseHonestyStepThmText (src : String) : Option Module :=
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
                match HonestyReadThmFront.parseItems 64 defs [] rest4 with
                | some (thms, rest5) => eqFinish ns imp thms rest5
                | none => none
              | none => none
            | _ => none
        | none => none
      | _ => none

def toy : String :=
  "import SystemsLean.CapableStepContract\n" ++
  "namespace SystemsLean.CapableStepContract\n" ++
  "theorem stageId_eq : stageId =\n" ++
  "    \"SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0\"" ++
  " := rfl\n" ++
  "theorem productPathFreestandingCapableStepContractFullSatisfied_false :\n" ++
  "    productPathFreestandingCapableStepContractFullSatisfied = false := rfl\n" ++
  "theorem productPathFreestandingCapableStepContractOk_true :\n" ++
  "    productPathFreestandingCapableStepContractOk = true := by\n" ++
  "  decide\n" ++
  "end SystemsLean.CapableStepContract\n"

def toyAccepts : Bool :=
  match parseHonestyStepThmText toy with
  | some m => !m.commands.any cmdRejects
  | none => false

/-- A false Bool stays false. rfl against true is typeless. -/
def falseToy : String :=
  "import SystemsLean.CapableStepContract\n" ++
  "namespace SystemsLean.CapableStepContract\n" ++
  "theorem productPathFreestandingCapableStepContractFullSatisfied_false :\n" ++
  "    productPathFreestandingCapableStepContractFullSatisfied = true := rfl\n" ++
  "end SystemsLean.CapableStepContract\n"

def falseRejects : Bool :=
  match parseHonestyStepThmText falseToy with
  | some m => m.commands.any cmdRejects
  | none => false

def thinMisses : Bool :=
  match parseHonestyStepThmText
      ("import SystemsLean.CapableStepContract\n" ++
        "def main (args : List String) : IO UInt32 :=\n" ++
        "  SystemsLean.CapableStepContract.main args\n") with
  | none => true
  | some _ => false

def namespaceMisses : Bool :=
  match parseHonestyStepThmText
      "namespace SystemsLean.CapableStepContract\n" with
  | none => true
  | some _ => false

def otherImportMisses : Bool :=
  match parseHonestyStepThmText
      ("import SystemsLean.CapableRegenerate\n" ++
        "namespace SystemsLean.CapableRegenerate\n" ++
        "theorem stageId_eq : stageId = \"x\" := rfl\n" ++
        "end SystemsLean.CapableRegenerate\n") with
  | none => true
  | some _ => false

end SystemsLean.HonestyStepThmFront
