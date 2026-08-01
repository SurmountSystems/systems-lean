/-
  SYSTEMS_LEAN_HOST partial -- freestanding emit SSOT load helpers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns shared string / Dual SSOT / require helpers plus fail-closed load of
  Body + Banner host_emit_*.ssot.txt. Mult..Apply unit SSOT loaders live in
  SystemsLean.FreestandingEmitLoadScaffold (same namespace). Render, validate,
  and emitAtRoot stay in SystemsLean.FreestandingEmit.
  Same namespace SystemsLean.FreestandingEmit so call sites stay unqualified.
  Greppable: SYSTEMS_LEAN_HOST, SLAKE_EMIT_FREESTANDING_C_V0, HOST-EMIT-SSOT,
  HOST-EMIT-BODY, HOST-EMIT-BANNER, DUAL-SSOT-EQUALITY, dualSsotBlockEqual,
  requireDualSsotEqual, dualSsotEqualityLive, loadBodySsot, loadBannerSsot,
  BODY_C_HEADER, BODY_C_BODY, BANNER_C_HEADER, BANNER_C_BODY,
  FreestandingEmitLoad, FreestandingEmitLoadScaffold, UNIT_SURFACE host surface.
  Module: SystemsLean.FreestandingEmitLoad
  Red/green: just systems-emit-wire; lake build SystemsLean.FreestandingEmit.
  Module must stay ASCII. Not freestanding emit residual free. Not PROVABLY.
  Stage honesty: not residual free; not PROVABLY; no product GC.
  RUNTIME-FS path honesty only (not residual free forge).
-/

namespace SystemsLean.FreestandingEmit

/-- Greppable freestanding emit stage id. -/
def stageId : String := "SLAKE_EMIT_FREESTANDING_C_V0"

/-- Greppable Dual SSOT equality gate id (emit-time fail-closed). -/
def dualSsotEqualityGateId : String := "DUAL-SSOT-EQUALITY"

/-- Expected empty-compose fragment (sans trailing newline; HOST-EMIT-SSOT). -/
def expectedEmptyFragment : String := "/* EMIT_BODY_V0 RUNTIME-FS r=0 e=0 */"

/-- True when s contains needle as a contiguous substring (empty needle => false). -/
def containsStr (s needle : String) : Bool :=
  if needle.isEmpty then false
  else (s.splitOn needle).length > 1

/-- Replace every occurrence of needle with repl (non-overlapping left-to-right). -/
def replaceAll (hay needle repl : String) : String :=
  if needle.isEmpty then hay
  else String.intercalate repl (hay.splitOn needle)

/-- KEY=value first match; none when missing. -/
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

/-- dualSsotEqualityLive -- greppable pin that Dual SSOT equality gate is coded. -/
def dualSsotEqualityLive : Bool :=
  (dualSsotEqualityGateId == "DUAL-SSOT-EQUALITY")
    && (stageId == "SLAKE_EMIT_FREESTANDING_C_V0")

/-- Replace any line containing placeholder with Mult block lines (bash embed parity). -/
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

/-- Fail with RED stage message to stderr. -/
def red (msg : String) : IO Unit :=
  IO.eprintln s!"RED {stageId}: {msg}"

/-- Fail closed when durable SSOT HEADER/BODY diverges from Lean fragment. -/
def requireDualSsotEqual (label : String) (fileBlock leanFragment : String) : IO Unit := do
  unless dualSsotBlockEqual fileBlock leanFragment do
    red s!"{dualSsotEqualityGateId}: {label} SSOT block diverges from Lean fragment"
    throw (IO.userError s!"{dualSsotEqualityGateId}: diverge {label}")

/-- Require path exists as a file. -/
def requireFile (path : System.FilePath) (label : String) : IO Unit := do
  unless (<- path.pathExists) do
    red s!"{label} missing: {path}"
    throw (IO.userError s!"{stageId}: missing {path}")

/-- Require greppable token in content. -/
def requireToken (content token label : String) : IO Unit := do
  unless containsStr content token do
    red s!"{label} missing token {token}"
    throw (IO.userError s!"{stageId}: missing token {token}")

/-- Body SSOT dialect keys + HOST-EMIT-BODY scaffolding C blocks. -/
structure BodySsot where
  emptyFragment : String
  headerOpen : String
  headerE : String
  headerClose : String
  tagOpen : String
  tagMult : String
  tagKind : String
  tagClose : String
  headerBlock : String
  bodyBlock : String
  deriving Repr

def loadBodySsot (path : System.FilePath) : IO BodySsot := do
  requireFile path "HOST-EMIT-SSOT / HOST-EMIT-BODY artifact"
  let content <- IO.FS.readFile path
  requireToken content "HOST-EMIT-SSOT" "HOST-EMIT-SSOT"
  requireToken content "HOST-EMIT-BODY" "HOST-EMIT-BODY"
  requireToken content "NON-SSOT" "HOST-EMIT-BODY"
  for tok in (["EMIT_BODY_V0", "slake_emit_body", "slake_emit_body_from_compose",
               "slake_emit_body_is_valid", "SLAKE_EMIT_BODY_CAP"] : List String) do
    requireToken content tok "HOST-EMIT-BODY"
  let get (k : String) : IO String := do
    match ssotGet content k with
    | some v => pure v
    | none =>
      red s!"HOST-EMIT-SSOT missing key {k} in {path}"
      throw (IO.userError s!"missing key {k}")
  let empty <- get "EMPTY_FRAGMENT"
  let hop <- get "HEADER_OPEN"
  let he <- get "HEADER_E"
  let hc <- get "HEADER_CLOSE"
  let tagOpen <- get "TAG_OPEN"
  let tagMult <- get "TAG_MULT"
  let tagKind <- get "TAG_KIND"
  let tagClose <- get "TAG_CLOSE"
  if empty != expectedEmptyFragment then
    red "EMPTY_FRAGMENT diverges from empty-compose SSOT"
    IO.eprintln s!"  got: {empty}"
    throw (IO.userError "EMPTY_FRAGMENT diverge")
  if hop ++ "0" ++ he ++ "0" ++ hc != empty then
    red "HEADER_* keys do not recompose EMPTY_FRAGMENT"
    throw (IO.userError "HEADER recompose")
  let header <- match ssotBlock content "BODY_C_HEADER" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-BODY missing block BODY_C_HEADER in {path}"
      throw (IO.userError "missing BODY_C_HEADER")
  let body <- match ssotBlock content "BODY_C_BODY" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-BODY missing block BODY_C_BODY in {path}"
      throw (IO.userError "missing BODY_C_BODY")
  for tok in (["HOST-EMIT-BODY", "slake_emit_body", "EMIT_BODY_V0",
               "SLAKE_EMIT_BODY_CAP", "slake_emit_body_from_compose",
               "slake_emit_body_is_valid", "HOST-EMIT-SSOT"] : List String) do
    unless containsStr header tok do
      red s!"Body SSOT header block missing token {tok}"
      throw (IO.userError s!"Body header missing {tok}")
  for tok in (["HOST-EMIT-BODY", "slake_emit_body_id", "slake_emit_body_from_compose",
               "slake_emit_body_is_valid", "EMIT_BODY_V0", "SLAKE_EMIT_BODY_CAP",
               "slake_emit_body_put_char", "slake_emit_body_put_u8",
               "__SSOT_EMPTY_FRAGMENT__", "__SSOT_HEADER_OPEN__"] : List String) do
    unless containsStr body tok do
      red s!"Body SSOT body block missing token {tok}"
      throw (IO.userError s!"Body body missing {tok}")
  pure {
    emptyFragment := empty
    headerOpen := hop
    headerE := he
    headerClose := hc
    tagOpen := tagOpen
    tagMult := tagMult
    tagKind := tagKind
    tagClose := tagClose
    headerBlock := header
    bodyBlock := body
  }

/-- Banner SSOT C blocks (file inventory + version / unit_translation). -/
structure BannerSsot where
  headerBlock : String
  bodyBlock : String
  deriving Repr

def loadBannerSsot (path : System.FilePath) : IO BannerSsot := do
  requireFile path "HOST-EMIT-BANNER artifact"
  let content <- IO.FS.readFile path
  requireToken content "HOST-EMIT-BANNER" "HOST-EMIT-BANNER"
  requireToken content "NON-SSOT" "HOST-EMIT-BANNER"
  for tok in (["slake_emit_version", "slake_unit_translation_id",
               "UNIT_TRANSLATION_V0", "SLAKE_EMIT_FREESTANDING_C_V0"] : List String) do
    requireToken content tok "HOST-EMIT-BANNER"
  let header <- match ssotBlock content "BANNER_C_HEADER" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-BANNER missing block BANNER_C_HEADER in {path}"
      throw (IO.userError "missing BANNER_C_HEADER")
  let body <- match ssotBlock content "BANNER_C_BODY" with
    | some b => pure b
    | none =>
      red s!"HOST-EMIT-BANNER missing block BANNER_C_BODY in {path}"
      throw (IO.userError "missing BANNER_C_BODY")
  for tok in (["HOST-EMIT-BANNER", "slake_emit_version", "slake_unit_translation_id",
               "UNIT_TRANSLATION_V0", "SLAKE_EMIT_FREESTANDING_C_V0"] : List String) do
    unless containsStr header tok do
      red s!"Banner SSOT header block missing token {tok}"
      throw (IO.userError s!"Banner header missing {tok}")
    unless containsStr body tok do
      red s!"Banner SSOT body block missing token {tok}"
      throw (IO.userError s!"Banner body missing {tok}")
  pure { headerBlock := header, bodyBlock := body }


end SystemsLean.FreestandingEmit
