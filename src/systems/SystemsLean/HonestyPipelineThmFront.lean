/-
  Module: SystemsLean.HonestyPipelineThmFront
  Front for import SystemsLean.CapableRegenerate plus theorem
  and example of `lhs = rhs := rfl` or `lhs = rhs := by decide`.
  The import name selects the seeded defs. The file name
  is not hardcoded. Namespace must be that same import.
  A decide or rfl whose sides differ is a def with no type.
  A false Bool stays false. Passing decide emits Bool true
  only after both sides reduce to the same value.
  The stored surface is 21 theorems and 21 examples.
  With namespace, import, and end that is 45 commands.
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

namespace SystemsLean.HonestyPipelineThmFront

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce
open SystemsLean.HonestyFront
open SystemsLean.HonestyThmFront
open SystemsLean.HonestyReadThmFront

def regenImport : String := "SystemsLean.CapableRegenerate"

def stageLit : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_REGENERATE_V0"

def hostLit : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE"

def selfLit : String :=
  "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE"

def pipeLit : String :=
  "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"

def blockLit : String := "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"

def apiLit : String := "freestandingCapableOrderedRegenerate"

def lakeExeLit : String := "slake-freestanding-capable-regenerate"

def justLit : String := "freestanding-capable-regenerate"

def withoutLit : String :=
  "freestanding-capable-regenerate-without-lake"

def prebuiltLit : String :=
  ".lake/build/bin/slake-freestanding-capable-regenerate"

def authName : String :=
  "productPathFreestandingCapableRegenerateAuthorityNotEmit"

def dependsName : String :=
  "productPathFreestandingCapableRegenerateDependsOnLake"

def installName : String :=
  "productPathFreestandingCapableRegenerateInstallOutOpen"

def fullName : String :=
  "productPathFreestandingCapableStepContractFullSatisfied"

def okName : String :=
  "productPathFreestandingCapableRegenerateOk"

def partialName : String :=
  "productPathFreestandingCapableRegeneratePartialReady"

def finishedName : String := "productWireWithoutLakeFinishedClaimed"

def keepsName : String := "productWireWithoutLakeKeepsHostLake"

def readyName : String := "productWireWithoutLakeReady"

def withoutName : String := "justRecipeProductWireWithoutLake"

def prebuiltName : String := "prebuiltCapableRegenerateRel"

def okBody : Term :=
  andAll
    [ eqS "stageId" stageLit
    , eqS "hostId" hostLit
    , eqS "selfHostId" selfLit
    , eqS "orderedPipelineId" pipeLit
    , eqS "blockerMustOwnRegenerate" blockLit
    , eqS "freestandingCapableRegenerateApi" apiLit
    , eqB authName true
    , eqB dependsName true
    , eqB installName false
    , eqB fullName false
    , eqS "lakeExeName" lakeExeLit
    , eqS "justRecipeName" justLit
    ]

def keepsBody : Term :=
  andAll
    [ Term.var (n finishedName)
    , Term.var (n "stillUsesLake")
    , Term.var (n "dependsOnLake")
    ]

def partialBody : Term :=
  andAll
    [ Term.var (n okName)
    , Term.var (n authName)
    , Term.var (n dependsName)
    , notB (Term.var (n installName))
    , notB (Term.var (n fullName))
    ]

def readyBody : Term :=
  andAll
    [ Term.var (n okName)
    , Term.var (n finishedName)
    , Term.var (n keepsName)
    , Term.var (n "stillUsesLake")
    , Term.var (n "dependsOnLake")
    , eqS withoutName withoutLit
    , eqS prebuiltName prebuiltLit
    , eqS "lakeExeName" lakeExeLit
    , eqS "justRecipeName" justLit
    ]

def regenDefs : DefEnv :=
  [ ("stageId", strBody stageLit)
  , ("hostId", strBody hostLit)
  , ("selfHostId", strBody selfLit)
  , ("orderedPipelineId", strBody pipeLit)
  , ("blockerMustOwnRegenerate", strBody blockLit)
  , ("freestandingCapableRegenerateApi", strBody apiLit)
  , ("lakeExeName", strBody lakeExeLit)
  , ("justRecipeName", strBody justLit)
  , (withoutName, strBody withoutLit)
  , (prebuiltName, strBody prebuiltLit)
  , (authName, boolBody true)
  , (dependsName, boolBody true)
  , (installName, boolBody false)
  , (fullName, boolBody false)
  , ("stillUsesLake", boolBody true)
  , ("dependsOnLake", boolBody true)
  , (finishedName, boolBody true)
  , (okName, { binder := "", body := okBody })
  , (keepsName, { binder := "", body := keepsBody })
  , (partialName, { binder := "", body := partialBody })
  , (readyName, { binder := "", body := readyBody })
  ]

/-- Seed for this import. Another import is not this front. -/
def seedOf (imp : String) : Option DefEnv :=
  if imp == regenImport then some regenDefs else none

/-- Parse this surface. none means not this front. -/
def parseHonestyPipelineThmText (src : String) : Option Module :=
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
  "import SystemsLean.CapableRegenerate\n" ++
  "namespace SystemsLean.CapableRegenerate\n" ++
  "theorem stageId_eq : stageId =\n" ++
  "    \"SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_REGENERATE_V0\"" ++
  " := rfl\n" ++
  "theorem productPathFreestandingCapableStepContractFullSatisfied_false :\n" ++
  "    productPathFreestandingCapableStepContractFullSatisfied = false := rfl\n" ++
  "theorem productPathFreestandingCapableRegenerateInstallOutOpen_false :\n" ++
  "    productPathFreestandingCapableRegenerateInstallOutOpen = false := rfl\n" ++
  "theorem productPathFreestandingCapableRegenerateOk_true :\n" ++
  "    productPathFreestandingCapableRegenerateOk = true := by\n" ++
  "  decide\n" ++
  "end SystemsLean.CapableRegenerate\n"

def toyAccepts : Bool :=
  match parseHonestyPipelineThmText toy with
  | some m => !m.commands.any cmdRejects
  | none => false

/-- A false Bool stays false. rfl against the other Bool is typeless. -/
def falseToy : String :=
  "import SystemsLean.CapableRegenerate\n" ++
  "namespace SystemsLean.CapableRegenerate\n" ++
  "theorem productPathFreestandingCapableStepContractFullSatisfied_false :\n" ++
  "    productPathFreestandingCapableStepContractFullSatisfied = true := rfl\n" ++
  "end SystemsLean.CapableRegenerate\n"

def falseRejects : Bool :=
  match parseHonestyPipelineThmText falseToy with
  | some m => m.commands.any cmdRejects
  | none => false

def thinMisses : Bool :=
  match parseHonestyPipelineThmText
      ("import SystemsLean.CapableRegenerate\n" ++
        "def main (args : List String) : IO UInt32 :=\n" ++
        "  SystemsLean.CapableRegenerate.main args\n") with
  | none => true
  | some _ => false

def namespaceMisses : Bool :=
  match parseHonestyPipelineThmText
      "namespace SystemsLean.CapableRegenerate\n" with
  | none => true
  | some _ => false

def otherImportMisses : Bool :=
  match parseHonestyPipelineThmText
      ("import SystemsLean.CapableRead\n" ++
        "namespace SystemsLean.CapableRead\n" ++
        "theorem stageId_eq : stageId = \"x\" := rfl\n" ++
        "end SystemsLean.CapableRead\n") with
  | none => true
  | some _ => false

end SystemsLean.HonestyPipelineThmFront
