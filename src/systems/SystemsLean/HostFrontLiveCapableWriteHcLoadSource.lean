/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live CapableWriteHcLoad.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCapableWriteHcLoadSource. Not occupancy name 50. Not mill 70.
  This wrap is CapableWriteHcLoad.lean. It is not CapableWriteHc.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveCapableWriteHcLoadSource,
  HOST-FRONT-LIVE-CAPABLE-WRITE-HC-LOAD, liveRel, DUAL-SSOT-EQUALITY,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveCapableWriteHcLoadSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveCapableWriteHcLoad

/-- Dual-pinned live CapableWriteHcLoad.lean bytes (must match on-disk file).
    Greppable: liveCapableWriteHcLoadSource, HOST-FRONT-LIVE-CAPABLE-WRITE-HC-LOAD.
    Raw delimiter is two hashes because the live file contains quote-hash. -/
def liveCapableWriteHcLoadSource : String := r##"/-
  SYSTEMS_LEAN_HOST partial -- freestanding-capable WRITE-HC load / assemble helpers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns fail-closed dual SSOT load, Dual SSOT equality helpers, template assemble,
  HOST-EMIT-SSOT dialect load/apply, and post-write product-wire honesty tokens
  used by SystemsLean.CapableWriteHc. Write API, honesty bools, Ok/PartialReady,
  and main stay in CapableWriteHc. Same namespace SystemsLean.CapableWriteHc so
  call sites stay unqualified.
  Greppable: SYSTEMS_LEAN_HOST,
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0,
  DUAL-SSOT-EQUALITY, dualSsotBlockEqual, requireDualSsotEqual,
  dualSsotSpecs, freestandingCapableWriteLoadOneSsot,
  assembleHeaderFromSsot, assembleSourceFromSsot, loadBodySsotDialect,
  applyBodySsotDialect, productWireHonestyTokens, requireWrittenTokens,
  CapableWriteHcLoad, UNIT_SURFACE host surface, RUNTIME-FS,
  EmitBanner, EmitMult, EmitLinear, EmitErasure, EmitExtract, EmitExtractScaffold,
  EmitTypes, EmitProgram, EmitGraph, EmitCompose, EmitPlan, EmitApply, EmitBody.
  Module: SystemsLean.CapableWriteHcLoad
  Red/green: just systems-emit-wire; lake build SystemsLean.CapableWriteHc.
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

namespace SystemsLean.CapableWriteHc

/-- Greppable primary stage id (partial B18 freestanding-capable WRITE-HC). Shared
    with CapableWriteHc public surface via same namespace. -/
def stageId : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0"

/-- Dual-equality gate id (local; not FreestandingEmit). -/
def dualEqualityGateId : String := "DUAL-SSOT-EQUALITY"

/-- Dual SSOT basename + HOST-EMIT token + HEADER/BODY + Lean Emit* fragments. -/
structure WriteSsotSpec where
  base : String
  token : String
  headerBlock : String
  bodyBlock : String
  headerPlaceholder : String
  bodyPlaceholder : String
  leanHeader : String
  leanBody : String
  deriving Repr

/-- True when s contains needle as a contiguous substring (empty needle => false). -/
def containsStr (s needle : String) : Bool :=
  if needle.isEmpty then false
  else (s.splitOn needle).length > 1

/-- Replace every non-overlapping needle with repl (empty needle => hay unchanged).
    Local; not FreestandingEmit.replaceAll. Greppable: replaceAll. -/
def replaceAll (hay needle repl : String) : String :=
  if needle.isEmpty then hay
  else String.intercalate repl (hay.splitOn needle)

/-- KEY=value line lookup in dual SSOT file content (local; not FreestandingEmit).
    Greppable: ssotGet, HOST-EMIT-SSOT. -/
def ssotGet (content key : String) : Option String :=
  let pref := key ++ "="
  let rec go : List String -> Option String
    | [] => none
    | line :: rest =>
      if line.startsWith pref then some (line.drop pref.length).copy
      else go rest
  go (content.splitOn "\n")

/-- Multi-line block between "# NAME_BEGIN" and "# NAME_END" (markers excluded).
    Greppable structural dual SSOT shape (not Lean-fragment DUAL-SSOT-EQUALITY). -/
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

/-- Local placeholder embed (line containing placeholder replaced by content lines).
    Not FreestandingEmit.renderHeader / renderSource. Greppable: embedPlaceholderLine. -/
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

/-- Mult..Out dual SSOT specs with Lean Emit* fragments (B37 dual-equality Capable WRITE).
    Greppable: dualSsotSpecs, DUAL-SSOT-EQUALITY, requireDualSsotEqual. -/
def dualSsotSpecs : List WriteSsotSpec := [
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

/-- Loaded dual SSOT HEADER/BODY for one role after dual-equality gate. -/
structure LoadedSsot where
  token : String
  header : String
  body : String
  headerPlaceholder : String
  bodyPlaceholder : String
  deriving Repr

/-- Normalize both sides to exactly one trailing newline for Dual SSOT compare.
    Uses stripTrailingNl defined above. -/
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

/-- Read one dual SSOT + requireDualSsotEqual vs Lean Emit* fragments (B37 dual-eq).
    Greppable: freestandingCapableWriteLoadOneSsot, requireDualSsotEqual, IO.FS.readFile. -/
def freestandingCapableWriteLoadOneSsot (path : System.FilePath)
    (spec : WriteSsotSpec) : IO LoadedSsot := do
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
    FreestandingEmit.renderHeader. Greppable: assembleHeaderFromSsot. -/
def assembleHeaderFromSsot (template : String) (loaded : List LoadedSsot) :
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
    FreestandingEmit.renderSource. Greppable: assembleSourceFromSsot. -/
def assembleSourceFromSsot (template : String) (loaded : List LoadedSsot) :
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
    Local load for dialect substitution after HOST_EMIT embed; not FreestandingEmit.
    Greppable: BodySsotDialect, HOST-EMIT-SSOT. -/
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

/-- Expected empty-compose fragment (matches EmitBody / FreestandingEmit pin).
    Greppable: expectedEmptyFragment, EMPTY_FRAGMENT. -/
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
    embed. Local parity with FreestandingEmit.renderSource dialect step and
    DualEqualityWriteApi.applyBodySsotDialect; not FreestandingEmit.renderSource.
    Required so product put_str emits greppable EMIT_BODY_V0 / RUNTIME-FS (probe
    assert 361). Greppable: applyBodySsotDialect, __SSOT_EMPTY_FRAGMENT__,
    __SSOT_HEADER_OPEN__. -/
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

/-- Greppable honesty after write: stable product-wire subset without importing
    FreestandingEmit or claiming DUAL-SSOT-EQUALITY / full validateProduct.
    Host-EMIT markers plus a small wire contract (UNIT_TRANSLATION, MULT grades,
    RUNTIME-FS, residual-free honesty). Not FreestandingEmit.validateProduct. -/
def requireWrittenTokens (path : System.FilePath) (content : String)
    (tokens : List String) : IO Unit := do
  for tok in tokens do
    unless containsStr content tok do
      IO.eprintln s!"error: {path} missing greppable token {tok}"
      throw (IO.userError s!"missing token {tok} in {path}")

/-- Stable product-wire honesty tokens checked on both written .h and .c.
    Subset of FreestandingEmit product-wire contract; local list only (no import).
    Greppable: UNIT_TRANSLATION_V0, MULT-0, RUNTIME-FS, product residual free. -/
def productWireHonestyTokens : List String := [
  "UNIT_TRANSLATION_V0",
  "MULT-0", "MULT-1", "MULT-OMEGA",
  "RUNTIME-FS",
  "product residual free"
]

end SystemsLean.CapableWriteHc
"##

end SystemsLean.HostFrontLiveCapableWriteHcLoad
