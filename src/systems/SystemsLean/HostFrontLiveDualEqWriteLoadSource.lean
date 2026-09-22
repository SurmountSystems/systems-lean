/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live DualEqWriteLoad.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveDualEqWriteLoadSource. Not occupancy name 50. Not mill 70.
  This wrap is DualEqWriteLoad.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveDualEqWriteLoadSource,
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-LOAD, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveDualEqWriteLoadSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveDualEqWriteLoad

/-- Live file basename. Must be exactly DualEqWriteLoad.lean. -/
def liveRel : String := "DualEqWriteLoad.lean"

/-- Dual-pinned live DualEqWriteLoad.lean bytes (must match on-disk file).
    Greppable: liveDualEqWriteLoadSource, HOST-FRONT-LIVE-DUAL-EQ-WRITE-LOAD. -/
def liveDualEqWriteLoadSource : String := r##"/-
  SYSTEMS_LEAN_HOST partial -- dual-equality WRITE load / assemble helpers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns fail-closed dual SSOT load, Dual SSOT equality helpers, template assemble,
  HOST-EMIT-SSOT dialect load/apply, and post-write validateProduct-parity tokens
  used by SystemsLean.DualEqWriteApi. Write API, honesty bools, Ok/PartialReady,
  and main stay in DualEqWriteApi. Same namespace SystemsLean.DualEqWriteApi so
  call sites stay unqualified.
  Greppable: SYSTEMS_LEAN_HOST,
  SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_API_V0,
  DUAL-SSOT-EQUALITY, dualSsotBlockEqual, requireDualSsotEqual,
  dualEqualityWriteSpecs, freestandingDualEqualityWriteLoadOne,
  assembleHeaderFromSsot, assembleSourceFromSsot, loadBodySsotDialect,
  applyBodySsotDialect, validateDualEqualityWriteProduct, productWireHonestyTokens,
  DualEqWriteLoad, UNIT_SURFACE host surface, RUNTIME-FS,
  EmitBanner, EmitMult, EmitLinear, EmitErasure, EmitExtract, EmitExtractScaffold,
  EmitTypes, EmitProgram, EmitProgramScaffold, EmitGraph, EmitCompose, EmitPlan,
  EmitApply, EmitBody.
  Module: SystemsLean.DualEqWriteLoad
  Red/green: just systems-emit-wire; lake build SystemsLean.DualEqWriteApi.
  Module must stay ASCII. Not freestanding emit residual free. Not residual free.
  Not PROVABLY. Stage honesty: not residual free; not PROVABLY; no product GC.
-/

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

namespace SystemsLean.DualEqWriteApi

/-- Greppable primary stage id (partial B36 dual-equality WRITE API). Shared with
    DualEqWriteApi public surface via same namespace. -/
def stageId : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_API_V0"

/-- Dual SSOT equality gate id (fail-closed load path). -/
def dualEqualityGateId : String := "DUAL-SSOT-EQUALITY"

/-- True when s contains needle as a contiguous substring (empty needle => false). -/
def containsStr (s needle : String) : Bool :=
  if needle.isEmpty then false
  else (s.splitOn needle).length > 1

/-- Replace every occurrence of needle with repl (local; not FreestandingEmit). -/
def replaceAll (hay needle repl : String) : String :=
  if needle.isEmpty then hay
  else String.intercalate repl (hay.splitOn needle)

/-- KEY=value line lookup in dual SSOT file content (local; not FreestandingEmit). -/
def ssotGet (content key : String) : Option String :=
  let pref := key ++ "="
  let rec go : List String -> Option String
    | [] => none
    | line :: rest =>
      if line.startsWith pref then some (line.drop pref.length).copy
      else go rest
  go (content.splitOn "\n")

/-- Multi-line block between "# NAME_BEGIN" and "# NAME_END" (markers excluded). -/
def ssotBlock (content name : String) : Option String :=
  let beginMark := "# " ++ name ++ "_BEGIN"
  let endMark := "# " ++ name ++ "_END"
  let rec go (grab : Bool) (acc : List String) : List String -> Option String
    | [] =>
      if grab || acc.isEmpty then none
      else some (String.intercalate "\n" acc.reverse ++ "\n")
    | line :: rest =>
      if !grab && line == beginMark then go true acc rest
      else if grab && line == endMark then
        some (String.intercalate "\n" acc.reverse ++ "\n")
      else if grab then go true (line :: acc) rest
      else go false acc rest
  go false [] (content.splitOn "\n")

/-- Strip one trailing newline if present. -/
def stripTrailingNl (s : String) : String :=
  if s.endsWith "\n" then (s.dropEnd 1).copy else s
/-- Normalize both sides to exactly one trailing newline for Dual SSOT compare. -/
def ensureTrailingNl (s : String) : String :=
  stripTrailingNl s ++ "\n"

/-- True when SSOT file block and Lean fragment match after trailing-newline normalize.
    Greppable: dualSsotBlockEqual (DUAL-SSOT-EQUALITY). -/
def dualSsotBlockEqual (fileBlock leanFragment : String) : Bool :=
  ensureTrailingNl fileBlock == ensureTrailingNl leanFragment

/-- Fail closed when durable SSOT HEADER/BODY diverges from Lean fragment.
    Greppable: requireDualSsotEqual (not FreestandingEmit.requireDualSsotEqual). -/
def requireDualSsotEqual (label : String) (fileBlock leanFragment : String) : IO Unit := do
  unless dualSsotBlockEqual fileBlock leanFragment do
    IO.eprintln s!"RED {stageId}: {dualEqualityGateId}: {label} SSOT block diverges from Lean fragment"
    throw (IO.userError s!"{dualEqualityGateId}: diverge {label}")

/-- Local placeholder embed (line containing placeholder replaced by content lines).
    Not FreestandingEmit.renderHeader / renderSource. -/
def embedPlaceholderLine (template placeholder content : String) : Option String :=
  if !containsStr template placeholder then none
  else
    let contentLines := (stripTrailingNl content).splitOn "\n"
    let rec go : List String -> List String
      | [] => []
      | line :: rest =>
        if containsStr line placeholder then contentLines ++ go rest
        else line :: go rest
    some (String.intercalate "\n" (go (template.splitOn "\n")))

/-- Fail closed when path missing. -/
def requireFile (path : System.FilePath) (label : String) : IO Unit := do
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {label}: {path}"
    throw (IO.userError s!"missing {label}")

/-- Dual SSOT role + Lean fragment pair for freestanding dual-equality WRITE. -/
structure DualEqualityWriteSpec where
  base : String
  token : String
  headerBlock : String
  bodyBlock : String
  headerPlaceholder : String
  bodyPlaceholder : String
  leanHeader : String
  leanBody : String
  deriving Repr

/-- Loaded dual SSOT HEADER/BODY after dual-equality gate. -/
structure LoadedDualSsot where
  token : String
  header : String
  body : String
  headerPlaceholder : String
  bodyPlaceholder : String
  deriving Repr

/-- Mult..Body dual SSOT specs with Lean Emit* fragment cites (Banner + Mult..Body).
    Greppable: dualEqualityWriteSpecs, EmitBanner, EmitMult, ... EmitBody. -/
def dualEqualityWriteSpecs : List DualEqualityWriteSpec := [
  { base := "host_emit_banner.ssot.txt", token := "HOST-EMIT-BANNER",
    headerBlock := "BANNER_C_HEADER", bodyBlock := "BANNER_C_BODY",
    headerPlaceholder := "__HOST_EMIT_BANNER_HEADER__",
    bodyPlaceholder := "__HOST_EMIT_BANNER_BODY__",
    leanHeader := SystemsLean.EmitBanner.bannerHeaderFragment,
    leanBody := SystemsLean.EmitBanner.bannerBodyFragment },
  { base := "host_emit_mult.ssot.txt", token := "HOST-EMIT-MULT",
    headerBlock := "MULT_C_HEADER", bodyBlock := "MULT_C_BODY",
    headerPlaceholder := "__HOST_EMIT_MULT_HEADER__",
    bodyPlaceholder := "__HOST_EMIT_MULT_BODY__",
    leanHeader := SystemsLean.EmitMult.multHeaderFragment,
    leanBody := SystemsLean.EmitMult.multBodyFragment },
  { base := "host_emit_linear.ssot.txt", token := "HOST-EMIT-LINEAR",
    headerBlock := "LINEAR_C_HEADER", bodyBlock := "LINEAR_C_BODY",
    headerPlaceholder := "__HOST_EMIT_LINEAR_HEADER__",
    bodyPlaceholder := "__HOST_EMIT_LINEAR_BODY__",
    leanHeader := SystemsLean.EmitLinear.linearHeaderFragment,
    leanBody := SystemsLean.EmitLinear.linearBodyFragment },
  { base := "host_emit_erasure.ssot.txt", token := "HOST-EMIT-ERASURE",
    headerBlock := "ERASURE_C_HEADER", bodyBlock := "ERASURE_C_BODY",
    headerPlaceholder := "__HOST_EMIT_ERASURE_HEADER__",
    bodyPlaceholder := "__HOST_EMIT_ERASURE_BODY__",
    leanHeader := SystemsLean.EmitErasure.erasureHeaderFragment,
    leanBody := SystemsLean.EmitErasure.erasureBodyFragment },
  { base := "host_emit_extract.ssot.txt", token := "HOST-EMIT-EXTRACT",
    headerBlock := "EXTRACT_C_HEADER", bodyBlock := "EXTRACT_C_BODY",
    headerPlaceholder := "__HOST_EMIT_EXTRACT_HEADER__",
    bodyPlaceholder := "__HOST_EMIT_EXTRACT_BODY__",
    leanHeader := SystemsLean.EmitExtract.extractHeaderFragment,
    leanBody := SystemsLean.EmitExtract.extractBodyFragment },
  { base := "host_emit_types.ssot.txt", token := "HOST-EMIT-TYPES",
    headerBlock := "TYPES_C_HEADER", bodyBlock := "TYPES_C_BODY",
    headerPlaceholder := "__HOST_EMIT_TYPES_HEADER__",
    bodyPlaceholder := "__HOST_EMIT_TYPES_BODY__",
    leanHeader := SystemsLean.EmitTypes.typesHeaderFragment,
    leanBody := SystemsLean.EmitTypes.typesBodyFragment },
  { base := "host_emit_program.ssot.txt", token := "HOST-EMIT-PROGRAM",
    headerBlock := "PROGRAM_C_HEADER", bodyBlock := "PROGRAM_C_BODY",
    headerPlaceholder := "__HOST_EMIT_PROGRAM_HEADER__",
    bodyPlaceholder := "__HOST_EMIT_PROGRAM_BODY__",
    leanHeader := SystemsLean.EmitProgram.programHeaderFragment,
    leanBody := SystemsLean.EmitProgram.programBodyFragment },
  { base := "host_emit_graph.ssot.txt", token := "HOST-EMIT-GRAPH",
    headerBlock := "GRAPH_C_HEADER", bodyBlock := "GRAPH_C_BODY",
    headerPlaceholder := "__HOST_EMIT_GRAPH_HEADER__",
    bodyPlaceholder := "__HOST_EMIT_GRAPH_BODY__",
    leanHeader := SystemsLean.EmitGraph.graphHeaderFragment,
    leanBody := SystemsLean.EmitGraph.graphBodyFragment },
  { base := "host_emit_compose.ssot.txt", token := "HOST-EMIT-COMPOSE",
    headerBlock := "COMPOSE_C_HEADER", bodyBlock := "COMPOSE_C_BODY",
    headerPlaceholder := "__HOST_EMIT_COMPOSE_HEADER__",
    bodyPlaceholder := "__HOST_EMIT_COMPOSE_BODY__",
    leanHeader := SystemsLean.EmitCompose.composeHeaderFragment,
    leanBody := SystemsLean.EmitCompose.composeBodyFragment },
  { base := "host_emit_plan.ssot.txt", token := "HOST-EMIT-PLAN",
    headerBlock := "PLAN_C_HEADER", bodyBlock := "PLAN_C_BODY",
    headerPlaceholder := "__HOST_EMIT_PLAN_HEADER__",
    bodyPlaceholder := "__HOST_EMIT_PLAN_BODY__",
    leanHeader := SystemsLean.EmitPlan.planHeaderFragment,
    leanBody := SystemsLean.EmitPlan.planBodyFragment },
  { base := "host_emit_apply.ssot.txt", token := "HOST-EMIT-APPLY",
    headerBlock := "APPLY_C_HEADER", bodyBlock := "APPLY_C_BODY",
    headerPlaceholder := "__HOST_EMIT_APPLY_HEADER__",
    bodyPlaceholder := "__HOST_EMIT_APPLY_BODY__",
    leanHeader := SystemsLean.EmitApply.applyHeaderFragment,
    leanBody := SystemsLean.EmitApply.applyBodyFragment },
  { base := "host_emit_body_fragment.ssot.txt", token := "HOST-EMIT-BODY",
    headerBlock := "BODY_C_HEADER", bodyBlock := "BODY_C_BODY",
    headerPlaceholder := "__HOST_EMIT_BODY_HEADER__",
    bodyPlaceholder := "__HOST_EMIT_BODY_BODY__",
    leanHeader := SystemsLean.EmitBody.bodyHeaderFragment,
    leanBody := SystemsLean.EmitBody.bodyBodyFragment }
]

/-- Load one dual SSOT + requireDualSsotEqual vs Lean fragments.
    Greppable: freestandingDualEqualityWriteLoadOne, requireDualSsotEqual. -/
def freestandingDualEqualityWriteLoadOne (path : System.FilePath)
    (spec : DualEqualityWriteSpec) : IO LoadedDualSsot := do
  requireFile path s!"dual SSOT ({spec.token})"
  let content <- IO.FS.readFile path
  if content.isEmpty then
    IO.eprintln s!"error: empty dual SSOT: {path}"
    throw (IO.userError s!"empty {path}")
  unless containsStr content spec.token do
    IO.eprintln s!"error: dual SSOT missing token {spec.token}: {path}"
    throw (IO.userError s!"missing token {spec.token}")
  let header <- match ssotBlock content spec.headerBlock with
    | none =>
      IO.eprintln s!"error: dual SSOT missing HEADER block {spec.headerBlock}: {path}"
      throw (IO.userError s!"missing HEADER {spec.headerBlock}")
    | some h =>
      if h.isEmpty then
        IO.eprintln s!"error: empty HEADER block {spec.headerBlock}: {path}"
        throw (IO.userError s!"empty HEADER {spec.headerBlock}")
      pure h
  let body <- match ssotBlock content spec.bodyBlock with
    | none =>
      IO.eprintln s!"error: dual SSOT missing BODY block {spec.bodyBlock}: {path}"
      throw (IO.userError s!"missing BODY {spec.bodyBlock}")
    | some b =>
      if b.isEmpty then
        IO.eprintln s!"error: empty BODY block {spec.bodyBlock}: {path}"
        throw (IO.userError s!"empty BODY {spec.bodyBlock}")
      pure b
  requireDualSsotEqual s!"{spec.token} HEADER" header spec.leanHeader
  requireDualSsotEqual s!"{spec.token} BODY" body spec.leanBody
  pure {
    token := spec.token
    header := header
    body := body
    headerPlaceholder := spec.headerPlaceholder
    bodyPlaceholder := spec.bodyPlaceholder
  }

/-- Embed all HEADER blocks into header template. Local assemble -- not
    FreestandingEmit.renderHeader. -/
def assembleHeaderFromSsot (template : String) (loaded : List LoadedDualSsot) :
    IO String := do
  let mut acc := template
  for s in loaded do
    match embedPlaceholderLine acc s.headerPlaceholder s.header with
    | none =>
      IO.eprintln s!"error: header template missing placeholder {s.headerPlaceholder}"
      throw (IO.userError s!"missing placeholder {s.headerPlaceholder}")
    | some next => acc := next
  if containsStr acc "__HOST_EMIT_" then
    IO.eprintln "error: HOST_EMIT placeholders remain after header embed"
    throw (IO.userError "placeholder remain header")
  pure acc

/-- Embed all BODY blocks into source template. Local assemble -- not
    FreestandingEmit.renderSource. HOST-EMIT body placeholders only; dialect
    __SSOT_* keys are substituted by applyBodySsotDialect after this. -/
def assembleSourceFromSsot (template : String) (loaded : List LoadedDualSsot) :
    IO String := do
  let mut acc := template
  for s in loaded do
    match embedPlaceholderLine acc s.bodyPlaceholder s.body with
    | none =>
      IO.eprintln s!"error: source template missing placeholder {s.bodyPlaceholder}"
      throw (IO.userError s!"missing placeholder {s.bodyPlaceholder}")
    | some next => acc := next
  if containsStr acc "__HOST_EMIT_" then
    IO.eprintln "error: HOST_EMIT placeholders remain after source embed"
    throw (IO.userError "placeholder remain source")
  pure acc

/-- HOST-EMIT-SSOT dialect keys from body dual SSOT (EMPTY_FRAGMENT + HEADER_*/TAG_*).
    Local load for dialect substitution; not FreestandingEmit.BodySsot. -/
structure BodySsotDialect where
  emptyFragment : String
  headerOpen : String
  headerE : String
  headerClose : String
  tagOpen : String
  tagMult : String
  tagKind : String
  tagClose : String
  deriving Repr

/-- Expected empty-compose fragment (matches EmitBody / FreestandingEmit pin). -/
def expectedEmptyFragment : String := "/* EMIT_BODY_V0 RUNTIME-FS r=0 e=0 */"

/-- Load HOST-EMIT-SSOT dialect keys from host_emit_body_fragment.ssot.txt.
    Fail closed on missing keys or EMPTY_FRAGMENT drift. Greppable:
    loadBodySsotDialect, HOST-EMIT-SSOT, EMPTY_FRAGMENT, HEADER_OPEN. -/
def loadBodySsotDialect (path : System.FilePath) : IO BodySsotDialect := do
  requireFile path "HOST-EMIT-SSOT / HOST-EMIT-BODY dual SSOT"
  let content <- IO.FS.readFile path
  unless containsStr content "HOST-EMIT-SSOT" do
    IO.eprintln s!"error: dual SSOT missing HOST-EMIT-SSOT: {path}"
    throw (IO.userError "missing HOST-EMIT-SSOT")
  unless containsStr content "HOST-EMIT-BODY" do
    IO.eprintln s!"error: dual SSOT missing HOST-EMIT-BODY: {path}"
    throw (IO.userError "missing HOST-EMIT-BODY")
  let get (k : String) : IO String := do
    match ssotGet content k with
    | some v => pure v
    | none =>
      IO.eprintln s!"error: HOST-EMIT-SSOT missing key {k} in {path}"
      throw (IO.userError s!"missing key {k}")
  let empty <- get "EMPTY_FRAGMENT"
  let hop <- get "HEADER_OPEN"
  let he <- get "HEADER_E"
  let hc <- get "HEADER_CLOSE"
  let tagOpen <- get "TAG_OPEN"
  let tagMult <- get "TAG_MULT"
  let tagKind <- get "TAG_KIND"
  let tagClose <- get "TAG_CLOSE"
  unless empty == expectedEmptyFragment do
    IO.eprintln s!"error: EMPTY_FRAGMENT diverges from empty-compose pin: got {empty}"
    throw (IO.userError "EMPTY_FRAGMENT diverge")
  unless hop ++ "0" ++ he ++ "0" ++ hc == empty do
    IO.eprintln "error: HEADER_* keys do not recompose EMPTY_FRAGMENT"
    throw (IO.userError "HEADER recompose")
  pure {
    emptyFragment := empty
    headerOpen := hop
    headerE := he
    headerClose := hc
    tagOpen := tagOpen
    tagMult := tagMult
    tagKind := tagKind
    tagClose := tagClose
  }

/-- Substitute HOST-EMIT-SSOT dialect keys into body scaffolding after HOST_EMIT
    embed. Local parity with FreestandingEmit.renderSource dialect step; not
    FreestandingEmit.renderSource. Greppable: applyBodySsotDialect,
    __SSOT_EMPTY_FRAGMENT__, __SSOT_HEADER_OPEN__. -/
def applyBodySsotDialect (source : String) (d : BodySsotDialect) : IO String := do
  let s := replaceAll source "__SSOT_EMPTY_FRAGMENT__" d.emptyFragment
  let s := replaceAll s "__SSOT_HEADER_OPEN__" d.headerOpen
  let s := replaceAll s "__SSOT_HEADER_E__" d.headerE
  let s := replaceAll s "__SSOT_HEADER_CLOSE__" d.headerClose
  let s := replaceAll s "__SSOT_TAG_OPEN__" d.tagOpen
  let s := replaceAll s "__SSOT_TAG_MULT__" d.tagMult
  let s := replaceAll s "__SSOT_TAG_KIND__" d.tagKind
  let s := replaceAll s "__SSOT_TAG_CLOSE__" d.tagClose
  if containsStr s "__SSOT_" then
    IO.eprintln "error: body SSOT dialect placeholders remain after dialect embed"
    throw (IO.userError "ssot placeholder remain")
  pure s

/-- Greppable honesty after write. Local mirror of FreestandingEmit.validateProduct
    token + ban surface (no FreestandingEmit import). Toward validateProduct parity
    for B36 dual-eq WRITE; still NOT retirement evidence: gap open / perform claimed
    stay false until CAPABLE-GAP + official path dual-eq retirement (B37+).
    Greppable: requireWrittenTokens, validateDualEqualityWriteProduct,
    productWireHonestyTokens. -/
def requireWrittenTokens (path : System.FilePath) (content : String)
    (tokens : List String) : IO Unit := do
  for tok in tokens do
    unless containsStr content tok do
      IO.eprintln s!"error: {path} missing greppable token {tok}"
      throw (IO.userError s!"missing token {tok} in {path}")

/-- Product-wire honesty tokens: validateProduct token list parity (local copy).
    HOST-EMIT role markers are appended by callers. Not byte-identical emit proof;
    not gap-closed / perform-claimed evidence. Greppable: productWireHonestyTokens,
    UNIT_DEEPEN_V1, HOST-EMIT-SSOT, validateProduct-parity. -/
def productWireHonestyTokens : List String := [
  "SLAKE_EMIT_FREESTANDING_C_V0", "UNIT_TRANSLATION_V0", "UNIT_DEEPEN_V1",
  "HOST-EMIT-SSOT", "HOST-EMIT-BODY", "HOST-EMIT-BANNER", "HOST-EMIT-MULT",
  "HOST-EMIT-LINEAR", "HOST-EMIT-ERASURE", "HOST-EMIT-EXTRACT",
  "HOST-EMIT-TYPES", "HOST-EMIT-PROGRAM", "HOST-EMIT-GRAPH", "HOST-EMIT-COMPOSE",
  "HOST-EMIT-PLAN", "HOST-EMIT-APPLY",
  "RUNTIME-FS", "product residual free",
  "MULT-0", "MULT-1", "MULT-OMEGA", "slake_mult_is_valid",
  "EMIT_BODY_V0", "EMIT_PLAN_V0", "EMIT_APPLY_V0", "JOIN-ALG", "ConsumeToken",
  "LINEAR-EXACT-ONCE", "FAIL_CLOSED_CHECKER_V1", "CONSUME_TOKEN_HOST_V0",
  "ERASE-RULE-MULT-0", "slake_erased_mark", "slake_erasure_is_runtime_absent",
  "TYPED_IR_V0", "slake_type_tag", "slake_ir_node", "COMMON-UNIVERSE",
  "IR_PROGRAM_V0", "IR_GRAPH_EDGES_V0", "HOST_COMPOSE_V0",
  "SLAKE_IR_PROGRAM_CAP", "SLAKE_IR_EDGE_MAX", "SLAKE_EMIT_APPLY_CAP",
  "SLAKE_EMIT_BODY_CAP", "slake_emit_version", "slake_unit_translation_id"
]

/-- Banned legacy renames (same ban surface as FreestandingEmit.validateProduct). -/
def productWireBannedTokens : List String := [
  "SLAKE_IR_EDGE_CAP",
  "SLAKE_IR_PROGRAM_MAX"
]

/-- Post-write product validate toward FreestandingEmit.validateProduct parity.
    Token list + banned renames + (source only) HEADER_OPEN / EMPTY_FRAGMENT dialect
    embeds. Local; not FreestandingEmit.validateProduct. Honest: this is still not
    CAPABLE-GAP close, not perform claimed, not official path retirement, not
    byte-identical emit vs FreestandingEmit proof. Greppable:
    validateDualEqualityWriteProduct, validateProduct-parity. -/
def validateDualEqualityWriteProduct (path : System.FilePath) (content : String)
    (isSource : Bool) (dialect : BodySsotDialect) : IO Unit := do
  requireWrittenTokens path content productWireHonestyTokens
  for banned in productWireBannedTokens do
    if containsStr content banned then
      IO.eprintln s!"error: {path} still cites banned token {banned}"
      throw (IO.userError s!"banned {banned}")
  if isSource then
    unless containsStr content dialect.headerOpen do
      IO.eprintln s!"error: {path} missing SSOT HEADER_OPEN dialect string"
      throw (IO.userError "missing HEADER_OPEN embed")
    unless containsStr content dialect.emptyFragment do
      IO.eprintln s!"error: {path} missing EMPTY_FRAGMENT reference from HOST-EMIT-SSOT"
      throw (IO.userError "missing EMPTY_FRAGMENT embed")
  -- Honesty pin (doc for B37+): full validateProduct parity + byte-identical
  -- FreestandingEmit emit still required before gap closed / perform claimed.
  pure ()

end SystemsLean.DualEqWriteApi
"##

end SystemsLean.HostFrontLiveDualEqWriteLoad
