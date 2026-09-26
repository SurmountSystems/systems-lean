/-
  SYSTEMS_LEAN_HOST. Module SystemsLean.CapableWriteHcLoad.
  Host Lean helpers, not freestanding C. They load dual SSOT text, check
  HEADER and BODY blocks against Emit fragment strings, fill templates,
  load and apply HOST-EMIT-SSOT dialect keys, and test product-wire tokens.
  Definitions are in namespace SystemsLean.CapableWriteHc. No main.
  Does not import FreestandingEmit.
  Stage id: SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0.
  Not PROVABLY. No garbage collector in this file.
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

/-- WRITE-HC stage id string. -/
def stageId : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0"

/-- Id recorded when a SSOT block and a Lean fragment differ. -/
def dualEqualityGateId : String := "DUAL-SSOT-EQUALITY"

/-- Basename, token, block names, placeholders, and Lean fragments for one role. -/
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

/-- True when needle is a non-empty contiguous substring of s. -/
def containsStr (s needle : String) : Bool :=
  if needle.isEmpty then false
  else (s.splitOn needle).length > 1

/-- Replace each non-overlapping needle with repl. Empty needle returns hay. -/
def replaceAll (hay needle repl : String) : String :=
  if needle.isEmpty then hay
  else String.intercalate repl (hay.splitOn needle)

/-- First value of a line that starts with key ++ "=". None if no such line. -/
def ssotGet (content key : String) : Option String :=
  let pref := key ++ "="
  let rec go : List String -> Option String
    | [] => none
    | line :: rest =>
      if line.startsWith pref then some (line.drop pref.length).copy
      else go rest
  go (content.splitOn "\n")

/-- First block from a line "# NAME_BEGIN" through a line "# NAME_END".
    Markers are excluded. None when either marker is missing.
    Interior lines are joined with newlines, then one newline is appended. -/
def ssotBlock (content name : String) : Option String :=
  let beginMark := "# " ++ name ++ "_BEGIN"
  let endMark := "# " ++ name ++ "_END"
  let rec go (grab : Bool) (acc : List String) : List String -> Option String
    | [] => none
    | line :: rest =>
      if !grab && line == beginMark then go true acc rest
      else if grab && line == endMark then
        some (String.intercalate "\n" acc.reverse ++ "\n")
      else if grab then go true (line :: acc) rest
      else go false acc rest
  go false [] (content.splitOn "\n")

/-- Drop one trailing newline when s ends with one. -/
def stripTrailingNl (s : String) : String :=
  if s.endsWith "\n" then (s.dropEnd 1).copy else s

/-- Replace each line that contains placeholder with the lines of content.
    None when placeholder is empty or is not a contiguous substring of template. -/
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

/-- Throw if path does not exist. -/
def requireFile (path : System.FilePath) (label : String) : IO Unit := do
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {label}: {path}"
    throw (IO.userError s!"missing {label}")

/-- Twelve dual SSOT roles, banner through body, each paired with Lean fragments. -/
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

/-- Header, body, and placeholders for one role after load. -/
structure LoadedSsot where
  token : String
  header : String
  body : String
  headerPlaceholder : String
  bodyPlaceholder : String
  deriving Repr

/-- Drop every trailing newline, then add one. -/
def ensureTrailingNl (s : String) : String :=
  let rec dropEmptyTail (xs : List String) : List String :=
    match xs with
    | [] => []
    | line :: rest =>
      match dropEmptyTail rest with
      | [] => if line.isEmpty then [] else [line]
      | kept => line :: kept
  String.intercalate "\n" (dropEmptyTail (s.splitOn "\n")) ++ "\n"

/-- True when both strings match after ensureTrailingNl. -/
def dualSsotBlockEqual (fileBlock leanFragment : String) : Bool :=
  ensureTrailingNl fileBlock == ensureTrailingNl leanFragment

/-- Throw when fileBlock and leanFragment differ under dualSsotBlockEqual. -/
def requireDualSsotEqual (label : String) (fileBlock leanFragment : String) : IO Unit := do
  unless dualSsotBlockEqual fileBlock leanFragment do
    IO.eprintln s!"RED {stageId}: {dualEqualityGateId}: {label} SSOT block diverges from Lean fragment"
    throw (IO.userError s!"{dualEqualityGateId}: diverge {label}")

/-- Read path, require spec.token, reject a HEADER or BODY with no text, and
    require each block to match its Lean fragment. -/
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
      if ensureTrailingNl h == "\n" then
        IO.eprintln s!"error: empty HEADER block {spec.headerBlock}: {path}"
        throw (IO.userError s!"empty HEADER {spec.headerBlock}")
      pure h
  let body <- match ssotBlock content spec.bodyBlock with
    | none =>
      IO.eprintln s!"error: dual SSOT missing BODY block {spec.bodyBlock}: {path}"
      throw (IO.userError s!"missing BODY {spec.bodyBlock}")
    | some b =>
      if ensureTrailingNl b == "\n" then
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

/-- Replace each loaded header placeholder. Throw if one is missing or any
    __HOST_EMIT_ text remains. -/
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

/-- Replace each loaded body placeholder. Throw if one is missing or any
    __HOST_EMIT_ text remains. -/
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

/-- EMPTY_FRAGMENT, HEADER_OPEN, HEADER_E, HEADER_CLOSE, and the TAG_* values. -/
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

/-- EMPTY_FRAGMENT string loadBodySsotDialect requires. -/
def expectedEmptyFragment : String := "/* EMIT_BODY_V0 RUNTIME-FS r=0 e=0 */"

/-- Load dialect keys from path. Throw if HOST-EMIT-SSOT or HOST-EMIT-BODY is
    absent, a key is absent, EMPTY_FRAGMENT is not expectedEmptyFragment, or
    HEADER_OPEN ++ "0" ++ HEADER_E ++ "0" ++ HEADER_CLOSE is not that string. -/
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

/-- Replace the nine __SSOT_ placeholders. Throw if a dialect value contains
    __SSOT_, or if any __SSOT_ text remains. -/
def applyBodySsotDialect (source : String) (d : BodySsotDialect) : IO String := do
  let values := [
    d.emptyFragment, d.headerOpen, d.headerE, d.headerClose,
    d.tagOpen, d.tagMult, d.tagKind, d.tagClose]
  for v in values do
    if containsStr v "__SSOT_" then
      IO.eprintln "error: dialect value contains __SSOT_ placeholder"
      throw (IO.userError "dialect value contains placeholder")
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

/-- Throw if content misses any token. path is only the error label. -/
def requireWrittenTokens (path : System.FilePath) (content : String)
    (tokens : List String) : IO Unit := do
  for tok in tokens do
    unless containsStr content tok do
      IO.eprintln s!"error: {path} missing greppable token {tok}"
      throw (IO.userError s!"missing token {tok} in {path}")

/-- Token list for requireWrittenTokens. This file does not write the .h or .c. -/
def productWireHonestyTokens : List String := [
  "UNIT_TRANSLATION_V0",
  "MULT-0", "MULT-1", "MULT-OMEGA",
  "RUNTIME-FS",
  "product residual free"
]

end SystemsLean.CapableWriteHc
