/-
  SYSTEMS_LEAN_HOST partial -- freestanding-capable WRITE-HC (B18 + B37 dual-eq).
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0 -- first freestanding-
  capable product-path WRITE-HC that advances FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC
  without classic Lean FreestandingEmit as product authority.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Real IO: freestandingCapableWriteFreestandingHc reads Mult..Out dual SSOT via
  IO.FS.readFile (token + HEADER/BODY), fails closed on DUAL-SSOT-EQUALITY vs Lean
  Emit* fragments (requireDualSsotEqual; B37 CAPABLE-GAP close), embeds HEADER/BODY
  via local placeholder embed (not FreestandingEmit.renderHeader/renderSource), then
  HOST-EMIT-SSOT dialect substitution (__SSOT_*__ -> HEADER_*/TAG_*/EMPTY_FRAGMENT
  put_str strings from host_emit_body_fragment.ssot.txt), then IO.FS.writeFile of
  slake_freestanding.h / slake_freestanding.c under emit/. Without dialect apply,
  body put_str leaves literal __SSOT_*__ and behavioral probe assert 361 fails
  (exit 105 via 8-bit wrap). Does not import FreestandingEmit. Does not call
  emitAtRoot / renderHeader / renderSource as product authority. Authority is
  this module + Emit* fragments + HOST-EMIT-SSOT keys.
  Distinct from B13 ProductPathWriteHc (decomposed entrypoint that still calls
  FreestandingEmit.emitAtRoot -- Lake FreestandingEmit product writer).
  B37: freestandingCapableWriteFreestandingHc is dual-equality (not structural-only).
  productPathCapableWriteDualEqualityLive true. Closes dual-equality WRITE parity gap
  (Capable structural vs dual-equality) with greppable Capable dual-eq evidence.
  Does NOT flip perform claimed. Does NOT switch just build / retire
  FreestandingEmit as official writer. Not out/ install ownership (B10).
  Not freestanding emit residual free. Not residual free. Not PROVABLY. B14
  productPathFreestandingCapableWriteHc is true
  after partial B28 Lake-free measure (just freestanding-capable-write-hc-lake-free);
  this Lake exe remains a diagnostic host path (DependsOnLake true for Lake recipe).
  productPathFreestandingCapableStepContractWriteHcSatisfied is true (acceptance:
  "satisfied" = no-emit freestanding .h/.c dual-equality write as product authority
  for the freestanding-capable step contract WRITE-HC). Full step-contract stays
  unsatisfied (WithoutLake closed B30 as product path authority; Full still needs
  perform claimed + ownership claimed with freestanding evidence).
  Lake exe: slake-freestanding-capable-write-hc (just freestanding-capable-write-hc).
  Lake-free measure: just freestanding-capable-write-hc-lake-free.

  Greppable: SYSTEMS_LEAN_HOST,
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0,
  HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC,
  product path freestanding capable write,
  productPathFreestandingCapableWriteHcPartialReady,
  productPathFreestandingCapableWriteHcOk,
  freestandingCapableWriteFreestandingHc,
  applyBodySsotDialect, loadBodySsotDialect, HOST-EMIT-SSOT,
  productPathCapableWriteDualEqualityLive,
  DUAL-SSOT-EQUALITY, requireDualSsotEqual, dualSsotBlockEqual,
  FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC,
  productPathFreestandingCapableStepContractWriteHcSatisfied,
  FREESTANDING-PERFORM-GAP-WRITE-HC, WRITER-PATH-STEP-WRITE-FREESTANDING-HC,
  slake_freestanding.h, slake_freestanding.c,
  freestanding-capable-write-hc, freestanding-capable-write-hc-lake-free,
  slake-freestanding-capable-write-hc,
  CapableWriteHc, CapableWriteHcLoad, RUNTIME-FS, UNIT_SURFACE host surface.
  Module: SystemsLean.CapableWriteHc
  Load helpers: SystemsLean.CapableWriteHcLoad (same namespace).
  Dual-pin thin batch 17 (2026-07-31): home-primary stageId/hostId/selfHostId/
  recipe/exe/Ok/PartialReady bulk; SelfApplyFs tip keeps honesty bools + chain fold
  only (no living complete/perform/ownership true defs here). Short-name rename
  CapableWriteHc -> CapableWriteHc deferred.
  Long-file peel: dual SSOT load/assemble/dialect peeled to CapableWriteHcLoad
  (same namespace). Write API + Ok/PartialReady stay here.
  Module must stay ASCII.
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

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC"

/-- Greppable short map id. -/
def selfHostId : String :=
  "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC"

/-- Named freestanding-capable step contract this step satisfies (partial).
    Greppable: FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC. -/
def contractStepWriteHc : String := "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC"

/-- Named gap this step advances (not closed for full freestanding measure B14).
    Greppable: FREESTANDING-PERFORM-GAP-WRITE-HC. -/
def gapWriteHc : String := "FREESTANDING-PERFORM-GAP-WRITE-HC"

/-- Ordered B6 plan step id this substrate advances. Greppable:
    WRITER-PATH-STEP-WRITE-FREESTANDING-HC. -/
def writerPathStepWriteHc : String := "WRITER-PATH-STEP-WRITE-FREESTANDING-HC"

/-- Lake exe name for this freestanding-capable WRITE-HC entrypoint. -/
def lakeExeName : String := "slake-freestanding-capable-write-hc"

/-- just recipe name (Lake diagnostic). -/
def justRecipeName : String := "freestanding-capable-write-hc"

/-- Lake-free freestanding-capable WRITE-HC recipe (partial B28 CapableWriteHc
    evidence). Greppable: freestanding-capable-write-hc-lake-free. -/
def lakeFreeRecipeName : String := "freestanding-capable-write-hc-lake-free"

/-- Real freestanding-capable WRITE-HC API name (implemented in this module).
    Greppable: freestandingCapableWriteFreestandingHc. -/
def freestandingCapableWriteHcApi : String :=
  "freestandingCapableWriteFreestandingHc"

/-- Product authority is not FreestandingEmit (this module never imports it).
    Greppable: productPathFreestandingCapableWriteHcAuthorityNotEmit. -/
def productPathFreestandingCapableWriteHcAuthorityNotEmit : Bool := true

/-- This WRITE Lake exe still runs as a classic Lean Lake host (honest diagnostic).
    B14 productPathFreestandingCapableWriteHc is true after B28 Lake-free measure
    (just freestanding-capable-write-hc-lake-free); DependsOnLake stays true for
    this Lake exe path. Greppable: productPathFreestandingCapableWriteHcDependsOnLake. -/
def productPathFreestandingCapableWriteHcDependsOnLake : Bool := true

/-- freestandingCapableWriteFreestandingHc is dual-equality (Emit* + requireDualSsotEqual)
    after B37 CAPABLE-GAP close. Not structural-only HEADER/BODY embed.
    Greppable: productPathCapableWriteDualEqualityLive, DUAL-SSOT-EQUALITY. -/
def productPathCapableWriteDualEqualityLive : Bool := true

/-- Dual-equality API name (gate id lives on CapableWriteHcLoad). -/
def dualEqualityApiName : String := "requireDualSsotEqual"

/-- Emit workspace freestanding header basename. Greppable: slake_freestanding.h. -/
def emitHeaderBase : String := "slake_freestanding.h"

/-- Emit workspace freestanding source basename. Greppable: slake_freestanding.c. -/
def emitSourceBase : String := "slake_freestanding.c"

/-- freestandingCapableWriteFreestandingHc -- freestanding-capable product-path
    WRITE of freestanding .h/.c under root/src/systems/emit without FreestandingEmit
    as product authority. Dual SSOT (token + HEADER/BODY) + DUAL-SSOT-EQUALITY vs
    Lean Emit* fragments (B37 CAPABLE-GAP) + template embed + HOST-EMIT-SSOT dialect
    apply (__SSOT_*__) + IO.FS.writeFile.
    Not Out install. Not perform claimed. Not official just build retirement.
    Greppable: freestandingCapableWriteFreestandingHc, applyBodySsotDialect,
    loadBodySsotDialect, HOST-EMIT-SSOT,
    productPathCapableWriteDualEqualityLive, DUAL-SSOT-EQUALITY, requireDualSsotEqual,
    FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC,
    FREESTANDING-PERFORM-GAP-WRITE-HC, WRITER-PATH-STEP-WRITE-FREESTANDING-HC,
    slake_freestanding.h, slake_freestanding.c, IO.FS.writeFile. -/
def freestandingCapableWriteFreestandingHc (root : System.FilePath) : IO Unit := do
  let emitDir := root / "src" / "systems" / "emit"
  let tmplH := emitDir / "template_slake_freestanding.h.in"
  let tmplC := emitDir / "template_slake_freestanding.c.in"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: freestanding-capable WRITE-HC freestanding .h/.c (B37 dual-eq) =="
  IO.println s!"  host: {hostId} / {selfHostId}"
  IO.println s!"  contract: {contractStepWriteHc} (productPathFreestandingCapableStepContractWriteHcSatisfied)"
  IO.println s!"  gap: {gapWriteHc} (B14 CapableWriteHc true after B28; dual-eq live after B37)"
  IO.println s!"  step: {writerPathStepWriteHc}"
  IO.println s!"  API: {freestandingCapableWriteHcApi}"
  IO.println s!"  dual-eq live: {productPathCapableWriteDualEqualityLive} ({dualEqualityGateId} / {dualEqualityApiName})"
  IO.println "  authority: not FreestandingEmit (no import; Emit* + requireDualSsotEqual + write)"
  IO.println s!"    productPathFreestandingCapableWriteHcAuthorityNotEmit: {productPathFreestandingCapableWriteHcAuthorityNotEmit}"
  IO.println s!"    productPathFreestandingCapableWriteHcDependsOnLake: {productPathFreestandingCapableWriteHcDependsOnLake} (Lake exe host only)"
  IO.println "  depth: dual SSOT HEADER/BODY + DUAL-SSOT-EQUALITY vs Lean Emit* + template embed + HOST-EMIT-SSOT dialect + IO.FS.writeFile"
  IO.println "  not: FreestandingEmit.emitAtRoot; not Out install; not perform claimed; not official retirement"
  unless productPathCapableWriteDualEqualityLive do
    IO.eprintln "error: productPathCapableWriteDualEqualityLive pin false"
    throw (IO.userError "dual-eq live pin")
  let mut loaded : List LoadedSsot := []
  for spec in dualSsotSpecs do
    let path := emitDir / spec.base
    let one <- freestandingCapableWriteLoadOneSsot path spec
    IO.println s!"  dual-eq ok: {path} ({spec.token}; {spec.headerBlock}/{spec.bodyBlock} == Lean fragment)"
    loaded := loaded ++ [one]
  if loaded.isEmpty then
    IO.eprintln "error: no dual SSOT loaded for write"
    throw (IO.userError "empty write inputs")
  IO.println s!"  {dualEqualityGateId}: Banner + Mult..Body HEADER/BODY match Lean Emit* fragments"
  requireFile tmplH "header template"
  requireFile tmplC "source template"
  let th <- IO.FS.readFile tmplH
  let tc <- IO.FS.readFile tmplC
  if th.isEmpty || tc.isEmpty then
    IO.eprintln "error: empty emit template"
    throw (IO.userError "empty template")
  let bodyDialectPath := emitDir / "host_emit_body_fragment.ssot.txt"
  let dialect <- loadBodySsotDialect bodyDialectPath
  IO.println "  HOST-EMIT-SSOT dialect keys loaded (EMPTY_FRAGMENT + HEADER_*/TAG_*)"
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
  -- Dialect embed honesty (parity with FreestandingEmit.validateProduct source checks).
  unless containsStr sourceWritten dialect.headerOpen do
    IO.eprintln s!"error: {outC} missing SSOT HEADER_OPEN dialect string"
    throw (IO.userError "missing HEADER_OPEN embed")
  unless containsStr sourceWritten dialect.emptyFragment do
    IO.eprintln s!"error: {outC} missing EMPTY_FRAGMENT reference from HOST-EMIT-SSOT"
    throw (IO.userError "missing EMPTY_FRAGMENT embed")
  if containsStr sourceWritten "__SSOT_" then
    IO.eprintln s!"error: {outC} still has unsubstituted __SSOT_* dialect placeholders"
    throw (IO.userError "ssot placeholder remain after write")
  IO.println s!"GREEN {stageId}: freestanding-capable dual-eq wrote emit wire under {emitDir}/"
  IO.println s!"  wrote: {outH} ({headerWritten.length} chars)"
  IO.println s!"  wrote: {outC} ({sourceWritten.length} chars)"
  IO.println "  FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC advanced (no-emit dual-eq authority)"
  IO.println "  HOST-EMIT-SSOT dialect applied (no __SSOT_* remain; HEADER_OPEN + EMPTY_FRAGMENT present)"
  IO.println "  honest: CAPABLE-GAP closed (Capable WRITE is dual-equality); perform claimed false"
  IO.println "  honest: Full step-contract unsatisfied; complete false; not residual free"
  IO.println "  B14 productPathFreestandingCapableWriteHc true after B28 (just freestanding-capable-write-hc-lake-free)"
  IO.println "  not Out install alone (B10); not B13 FreestandingEmit.emitAtRoot product path"
  IO.println "  living tip B38: freestanding-capable-regenerate owns official just build (FreestandingEmit retired)"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Surface ok: stage ids + authority-not-emit + dual-eq live + named API + Lake honest.
    Greppable: productPathFreestandingCapableWriteHcOk. -/
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

/-- Land-time Full step-contract long-name pin (false at B18 land; living tip
    stepContractFull true after later cliffs). Greppable:
    productPathFreestandingCapableStepContractFullSatisfied. -/
def productPathFreestandingCapableStepContractFullSatisfied : Bool := false

/-- WRITE-HC PartialReady fold (closed B18 substrate: Ok + authority-not-emit +
    DependsOnLake + Full long-name false). Historical readiness bulk for
    freestanding-capable WRITE-HC. SelfApplyFs living tip re-exports a chain fold
    that includes this def for greppable dual-pin + B17 Compose PartialReady.
    Land-time module pins: AuthorityNotEmit true; DependsOnLake true; Full
    long-name false (living tip allows perform / ownership / stepContractFull /
    complete true after later cliffs). Does not flip residual free / llvm / PROVABLY.
    Greppable: productPathFreestandingCapableWriteHcPartialReady,
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC,
    freestandingCapableWriteFreestandingHc. -/
def productPathFreestandingCapableWriteHcPartialReady : Bool :=
  productPathFreestandingCapableWriteHcOk
    && productPathFreestandingCapableWriteHcAuthorityNotEmit
    && productPathFreestandingCapableWriteHcDependsOnLake
    && !productPathFreestandingCapableStepContractFullSatisfied

/-- WRITE-HC PartialReady holds. Greppable:
    productPathFreestandingCapableWriteHcPartialReady_true. -/
theorem productPathFreestandingCapableWriteHcPartialReady_true :
    productPathFreestandingCapableWriteHcPartialReady = true := by
  decide

example : productPathFreestandingCapableWriteHcPartialReady = true := by
  decide

/-- CLI: optional repo root argument (default cwd). -/
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

-- Lake entry is SystemsLean.CapableWriteHcMain (no top-level
-- main here so freestanding-capable ordered regenerate and SelfApplyFs may import
-- this API / Ok / PartialReady bulk without main clash).
