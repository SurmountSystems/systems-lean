/-
  Module: SystemsLean.HonestyGapThmFront
  Front for import SystemsLean.Capable plus theorem and
  example of `lhs = rhs := rfl` or `lhs = rhs := by decide`.
  The import name selects the seeded defs. The file name
  is not hardcoded. Namespace must be that same import.
  A decide or rfl whose sides differ is a def with no type.
  A false Bool stays false. Passing decide emits Bool true
  only after both sides reduce to the same value.
  The stored surface is 20 theorems and 20 examples.
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

namespace SystemsLean.HonestyGapThmFront

open SystemsLean.HostTerm
open SystemsLean.HostKernelReduce
open SystemsLean.HonestyFront
open SystemsLean.HonestyThmFront
open SystemsLean.HonestyReadThmFront

def gapImport : String := "SystemsLean.Capable"

def stageLit : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0"

def hostLit : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP"

def selfLit : String :=
  "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP"

def gapReadLit : String := "FREESTANDING-PERFORM-GAP-READ-SSOT"

def gapComposeLit : String := "FREESTANDING-PERFORM-GAP-COMPOSE"

def gapWriteLit : String := "FREESTANDING-PERFORM-GAP-WRITE-HC"

def installLit : String := "WRITER-PATH-STEP-INSTALL-OUT"

def pipeLit : String := "regenerate-product-path"

def readFreeLit : String := "freestanding-capable-read-lake-free"

def composeFreeLit : String := "freestanding-capable-compose-lake-free"

def writeFreeLit : String := "freestanding-capable-write-hc-lake-free"

def lakeExeLit : String := "slake-freestanding-capable-gap"

def justLit : String := "freestanding-capable-gap"

def installName : String := "productPathFreestandingCapableInstallOnly"

def readName : String := "productPathFreestandingCapableRead"

def composeName : String := "productPathFreestandingCapableCompose"

def writeName : String := "productPathFreestandingCapableWriteHc"

def fullName : String := "productPathFreestandingCapableFullPerform"

def readFreeName : String :=
  "productPathFreestandingCapableReadLakeFreeRecipe"

def composeFreeName : String :=
  "productPathFreestandingCapableComposeLakeFreeRecipe"

def writeFreeName : String :=
  "productPathFreestandingCapableWriteHcLakeFreeRecipe"

def okName : String := "productPathFreestandingCapableOk"

def partialName : String := "productPathFreestandingCapablePartialReady"

def okBody : Term :=
  andAll
    [ eqS "stageId" stageLit
    , eqS "hostId" hostLit
    , eqS "selfHostId" selfLit
    , eqB installName true
    , eqB readName true
    , eqB composeName true
    , eqB writeName true
    , eqB fullName false
    , eqS "gapReadSsot" gapReadLit
    , eqS "gapCompose" gapComposeLit
    , eqS "gapWriteHc" gapWriteLit
    , eqS "writerPathStepInstall" installLit
    , eqS "orderedPipelineRecipe" pipeLit
    , eqS readFreeName readFreeLit
    , eqS composeFreeName composeFreeLit
    , eqS writeFreeName writeFreeLit
    , eqS "lakeExeName" lakeExeLit
    , eqS "justMeasureRecipe" justLit
    ]

def partialBody : Term :=
  andAll
    [ Term.var (n okName)
    , Term.var (n installName)
    , Term.var (n readName)
    , Term.var (n composeName)
    , Term.var (n writeName)
    , notB (Term.var (n fullName))
    ]

def gapDefs : DefEnv :=
  [ ("stageId", strBody stageLit)
  , ("hostId", strBody hostLit)
  , ("selfHostId", strBody selfLit)
  , ("gapReadSsot", strBody gapReadLit)
  , ("gapCompose", strBody gapComposeLit)
  , ("gapWriteHc", strBody gapWriteLit)
  , ("writerPathStepInstall", strBody installLit)
  , ("orderedPipelineRecipe", strBody pipeLit)
  , (readFreeName, strBody readFreeLit)
  , (composeFreeName, strBody composeFreeLit)
  , (writeFreeName, strBody writeFreeLit)
  , ("lakeExeName", strBody lakeExeLit)
  , ("justMeasureRecipe", strBody justLit)
  , (installName, boolBody true)
  , (readName, boolBody true)
  , (composeName, boolBody true)
  , (writeName, boolBody true)
  , (fullName, boolBody false)
  , (okName, { binder := "", body := okBody })
  , (partialName, { binder := "", body := partialBody })
  ]

/-- Seed for this import. Another import is not this front. -/
def seedOf (imp : String) : Option DefEnv :=
  if imp == gapImport then some gapDefs else none

/-- Parse this surface. none means not this front. -/
def parseHonestyGapThmText (src : String) : Option Module :=
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
  "import SystemsLean.Capable\n" ++
  "namespace SystemsLean.Capable\n" ++
  "theorem stageId_eq : stageId =\n" ++
  "    \"SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0\"" ++
  " := rfl\n" ++
  "theorem productPathFreestandingCapableFullPerform_false :\n" ++
  "    productPathFreestandingCapableFullPerform = false := rfl\n" ++
  "theorem productPathFreestandingCapableOk_true :\n" ++
  "    productPathFreestandingCapableOk = true := by\n" ++
  "  decide\n" ++
  "end SystemsLean.Capable\n"

def toyAccepts : Bool :=
  match parseHonestyGapThmText toy with
  | some m => !m.commands.any cmdRejects
  | none => false

/-- A false Bool stays false. rfl against true is typeless. -/
def falseToy : String :=
  "import SystemsLean.Capable\n" ++
  "namespace SystemsLean.Capable\n" ++
  "theorem productPathFreestandingCapableFullPerform_false :\n" ++
  "    productPathFreestandingCapableFullPerform = true := rfl\n" ++
  "end SystemsLean.Capable\n"

def falseRejects : Bool :=
  match parseHonestyGapThmText falseToy with
  | some m => m.commands.any cmdRejects
  | none => false

def thinMisses : Bool :=
  match parseHonestyGapThmText
      ("import SystemsLean.Capable\n" ++
        "def main (args : List String) : IO UInt32 :=\n" ++
        "  SystemsLean.Capable.main args\n") with
  | none => true
  | some _ => false

def namespaceMisses : Bool :=
  match parseHonestyGapThmText
      "namespace SystemsLean.Capable\n" with
  | none => true
  | some _ => false

def otherImportMisses : Bool :=
  match parseHonestyGapThmText
      ("import SystemsLean.CapableStepContract\n" ++
        "namespace SystemsLean.CapableStepContract\n" ++
        "theorem stageId_eq : stageId = \"x\" := rfl\n" ++
        "end SystemsLean.CapableStepContract\n") with
  | none => true
  | some _ => false

end SystemsLean.HonestyGapThmFront
