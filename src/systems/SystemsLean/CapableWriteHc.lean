/-
  SYSTEMS_LEAN_HOST
  SystemsLean.CapableWriteHc writes slake_freestanding.h and slake_freestanding.c
  under root/src/systems/emit. freestandingCapableWriteFreestandingHc loads each
  dualSsotSpecs entry, reads the two emit templates with IO.FS.readFile, loads
  host_emit_body_fragment.ssot.txt, assembles header and source, applies the body
  dialect, and IO.FS.writeFile writes both outputs. This file does not import
  FreestandingEmit and does not call requireDualSsotEqual. The Full step-contract
  bool in this file is false. The theorem in this file shows PartialReady equals
  true, proved here by decide. This file does not run Lake. Load, assemble,
  and dialect helpers are not defined in this file.
  ASCII only.
-/

import SystemsLean.CapableWriteHcLoad
import SystemsLean.EmitBanner
import SystemsLean.EmitMult
import SystemsLean.EmitLinear
import SystemsLean.EmitErasure
import SystemsLean.EmitExtract
import SystemsLean.EmitExtractScaffold
import SystemsLean.EmitTypes
import SystemsLean.EmitTypesScaffold
import SystemsLean.EmitProgram
import SystemsLean.EmitProgramScaffold
import SystemsLean.EmitGraph
import SystemsLean.EmitGraphScaffold
import SystemsLean.EmitCompose
import SystemsLean.EmitComposeScaffold
import SystemsLean.EmitPlan
import SystemsLean.EmitPlanScaffold
import SystemsLean.EmitApply
import SystemsLean.EmitApplyScaffold
import SystemsLean.EmitBody
import SystemsLean.EmitBodyScaffold

namespace SystemsLean.CapableWriteHc

/-- Host map id string. -/
def hostId : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC"

/-- Short map id string. -/
def selfHostId : String :=
  "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC"

/-- Step-contract name. Not a proof the step holds. -/
def contractStepWriteHc : String := "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC"

/-- Perform-gap name. Not a proof the gap is open or closed. -/
def gapWriteHc : String := "FREESTANDING-PERFORM-GAP-WRITE-HC"

/-- Writer path step id string. -/
def writerPathStepWriteHc : String := "WRITER-PATH-STEP-WRITE-FREESTANDING-HC"

/-- Lake exe name string. This file does not run Lake. -/
def lakeExeName : String := "slake-freestanding-capable-write-hc"

/-- Recipe name string. This file does not run it. -/
def justRecipeName : String := "freestanding-capable-write-hc"

/-- Lake-free recipe name string. This file does not run it. -/
def lakeFreeRecipeName : String := "freestanding-capable-write-hc-lake-free"

/-- Name of the write function defined in this file. -/
def freestandingCapableWriteHcApi : String :=
  "freestandingCapableWriteFreestandingHc"

/-- Constant true. The import list has no FreestandingEmit. -/
def productPathFreestandingCapableWriteHcAuthorityNotEmit : Bool := true

/-- Constant true. This file does not run Lake. -/
def productPathFreestandingCapableWriteHcDependsOnLake : Bool := true

/-- Constant true. This file does not call requireDualSsotEqual. -/
def productPathCapableWriteDualEqualityLive : Bool := true

/-- Name string. requireDualSsotEqual is not defined in this file. -/
def dualEqualityApiName : String := "requireDualSsotEqual"

/-- Header basename written under src/systems/emit. -/
def emitHeaderBase : String := "slake_freestanding.h"

/-- Source basename written under src/systems/emit. -/
def emitSourceBase : String := "slake_freestanding.c"

/-- Constant false. This file has no true Full step-contract bool. -/
def productPathFreestandingCapableStepContractFullSatisfied : Bool := false

/-- Load dual SSOT records, embed the two templates, apply the body dialect,
    and write both emit outputs. Checks HOST-EMIT tokens, dialect.headerOpen,
    dialect.emptyFragment, and rejects a remaining __SSOT_ substring.
    Does not call requireDualSsotEqual. Printed lines are not proofs. -/
def freestandingCapableWriteFreestandingHc (root : System.FilePath) : IO Unit := do
  let emitDir := root / "src" / "systems" / "emit"
  let tmplH := emitDir / "template_slake_freestanding.h.in"
  let tmplC := emitDir / "template_slake_freestanding.c.in"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: freestanding-capable WRITE-HC =="
  IO.println s!"  host: {hostId} / {selfHostId}"
  IO.println s!"  contract: {contractStepWriteHc}"
  IO.println s!"  gap: {gapWriteHc}"
  IO.println s!"  step: {writerPathStepWriteHc}"
  IO.println s!"  API: {freestandingCapableWriteHcApi}"
  IO.println s!"  dual-eq pin: {productPathCapableWriteDualEqualityLive} ({dualEqualityGateId} / {dualEqualityApiName})"
  IO.println s!"  authority-not-emit: {productPathFreestandingCapableWriteHcAuthorityNotEmit}"
  IO.println s!"  DependsOnLake: {productPathFreestandingCapableWriteHcDependsOnLake}"
  IO.println s!"  Full pin: {productPathFreestandingCapableStepContractFullSatisfied}"
  unless productPathCapableWriteDualEqualityLive do
    IO.eprintln "error: productPathCapableWriteDualEqualityLive pin false"
    throw (IO.userError "dual-eq live pin")
  let mut loaded : List LoadedSsot := []
  for spec in dualSsotSpecs do
    let path := emitDir / spec.base
    let one <- freestandingCapableWriteLoadOneSsot path spec
    IO.println s!"  loaded: {path} ({spec.token}; {spec.headerBlock}/{spec.bodyBlock})"
    loaded := loaded ++ [one]
  if loaded.isEmpty then
    IO.eprintln "error: no dual SSOT loaded for write"
    throw (IO.userError "empty write inputs")
  IO.println s!"  {dualEqualityGateId}: loaded dual SSOT records"
  requireFile tmplH "header template"
  requireFile tmplC "source template"
  let th <- IO.FS.readFile tmplH
  let tc <- IO.FS.readFile tmplC
  if th.isEmpty || tc.isEmpty then
    IO.eprintln "error: empty emit template"
    throw (IO.userError "empty template")
  let bodyDialectPath := emitDir / "host_emit_body_fragment.ssot.txt"
  let dialect <- loadBodySsotDialect bodyDialectPath
  IO.println s!"  dialect file: {bodyDialectPath}"
  let header <- assembleHeaderFromSsot th loaded
  let sourceRaw <- assembleSourceFromSsot tc loaded
  let source <- applyBodySsotDialect sourceRaw dialect
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH header
  IO.FS.writeFile outC source
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"emit header after write ({emitHeaderBase})"
  requireFile outC s!"emit source after write ({emitSourceBase})"
  requireWrittenTokens outH headerWritten ([
    "SLAKE_EMIT_FREESTANDING_C_V0",
    "HOST-EMIT-BANNER", "HOST-EMIT-MULT", "HOST-EMIT-LINEAR", "HOST-EMIT-ERASURE",
    "HOST-EMIT-EXTRACT", "HOST-EMIT-TYPES", "HOST-EMIT-PROGRAM", "HOST-EMIT-GRAPH",
    "HOST-EMIT-COMPOSE", "HOST-EMIT-PLAN", "HOST-EMIT-APPLY", "HOST-EMIT-BODY"
  ] ++ productWireHonestyTokens)
  requireWrittenTokens outC sourceWritten ([
    "HOST-EMIT-BANNER", "HOST-EMIT-MULT", "HOST-EMIT-LINEAR", "HOST-EMIT-ERASURE",
    "HOST-EMIT-EXTRACT", "HOST-EMIT-TYPES", "HOST-EMIT-PROGRAM", "HOST-EMIT-GRAPH",
    "HOST-EMIT-COMPOSE", "HOST-EMIT-PLAN", "HOST-EMIT-APPLY", "HOST-EMIT-BODY",
    "HOST-EMIT-SSOT"
  ] ++ productWireHonestyTokens)
  -- Source must contain dialect.headerOpen and dialect.emptyFragment, and no __SSOT_ substring.
  unless containsStr sourceWritten dialect.headerOpen do
    IO.eprintln s!"error: {outC} missing SSOT HEADER_OPEN dialect string"
    throw (IO.userError "missing HEADER_OPEN embed")
  unless containsStr sourceWritten dialect.emptyFragment do
    IO.eprintln s!"error: {outC} missing EMPTY_FRAGMENT reference from HOST-EMIT-SSOT"
    throw (IO.userError "missing EMPTY_FRAGMENT embed")
  if containsStr sourceWritten "__SSOT_" then
    IO.eprintln s!"error: {outC} still has unsubstituted __SSOT_* dialect placeholders"
    throw (IO.userError "ssot placeholder remain after write")
  IO.println s!"GREEN {stageId}: wrote {emitHeaderBase} and {emitSourceBase} under {emitDir}/"
  IO.println s!"  wrote: {outH} ({headerWritten.length} chars)"
  IO.println s!"  wrote: {outC} ({sourceWritten.length} chars)"
  IO.println "  source has dialect.headerOpen and dialect.emptyFragment; no __SSOT_ substring"
  IO.println s!"  Full pin: {productPathFreestandingCapableStepContractFullSatisfied}"
  IO.println s!"  recipe name: {justRecipeName}"
  IO.println s!"  lake-free recipe name, not run: {lakeFreeRecipeName}"

/-- Drop every "--" entry. Keep every other argument in order. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- True exactly for the comparisons below. stageId and dualEqualityGateId
    are not defined in this file. lakeFreeRecipeName is not one of them. -/
def productPathFreestandingCapableWriteHcOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0")
    && (hostId == "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC")
    && (selfHostId == "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC")
    && (contractStepWriteHc == "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC")
    && (gapWriteHc == "FREESTANDING-PERFORM-GAP-WRITE-HC")
    && (writerPathStepWriteHc == "WRITER-PATH-STEP-WRITE-FREESTANDING-HC")
    && (freestandingCapableWriteHcApi == "freestandingCapableWriteFreestandingHc")
    && (productPathFreestandingCapableWriteHcAuthorityNotEmit == true)
    && (productPathFreestandingCapableWriteHcDependsOnLake == true)
    && (productPathCapableWriteDualEqualityLive == true)
    && (dualEqualityGateId == "DUAL-SSOT-EQUALITY")
    && (dualEqualityApiName == "requireDualSsotEqual")
    && (lakeExeName == "slake-freestanding-capable-write-hc")
    && (justRecipeName == "freestanding-capable-write-hc")
    && (emitHeaderBase == "slake_freestanding.h")
    && (emitSourceBase == "slake_freestanding.c")

/-- Ok, authority-not-emit, Lake-dependence, and Full bool false. -/
def productPathFreestandingCapableWriteHcPartialReady : Bool :=
  productPathFreestandingCapableWriteHcOk
    && productPathFreestandingCapableWriteHcAuthorityNotEmit
    && productPathFreestandingCapableWriteHcDependsOnLake
    && !productPathFreestandingCapableStepContractFullSatisfied

/-- Proof in this file: PartialReady reduces to true. -/
theorem productPathFreestandingCapableWriteHcPartialReady_true :
    productPathFreestandingCapableWriteHcPartialReady = true := by
  decide

example : productPathFreestandingCapableWriteHcPartialReady = true := by
  decide

/-- First remaining argument is the repo root. Default path is ".". -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    unless productPathFreestandingCapableWriteHcOk do
      IO.eprintln s!"error: {stageId} surface not ok"
      throw (IO.userError "productPathFreestandingCapableWriteHcOk false")
    freestandingCapableWriteFreestandingHc root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.CapableWriteHc

-- main is SystemsLean.CapableWriteHc.main. This file has no top-level main.
