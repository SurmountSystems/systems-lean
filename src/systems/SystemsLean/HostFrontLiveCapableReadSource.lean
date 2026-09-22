/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live CapableRead.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCapableReadSource. Not occupancy name 50. Not mill 70.
  This wrap is CapableRead.lean. It is not CapableReadTheorems.lean.
  It is not CapableReadMain.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveCapableReadSource,
  HOST-FRONT-LIVE-CAPABLE-READ, liveRel, CAPABLE-READ,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveCapableReadSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveCapableRead

/-- Dual-pinned live CapableRead.lean bytes (must match on-disk file).
    Greppable: liveCapableReadSource, HOST-FRONT-LIVE-CAPABLE-READ. -/
def liveCapableReadSource : String := r##"/-
  SYSTEMS_LEAN_HOST partial -- freestanding-capable READ dual SSOT (B16).
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0 -- first freestanding-
  capable product-path READ that advances FREESTANDING-CAPABLE-STEP-CONTRACT-READ
  without classic Lean FreestandingEmit as product authority.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Real IO: freestandingCapableReadDualSsot reads Mult..Out dual SSOT via
  IO.FS.readFile only -- presence + HOST-EMIT token + HEADER/BODY block parse
  (structural dual SSOT shape). Does not import FreestandingEmit. Does not call
  emit-at-root / render / product-wire write APIs.
  Distinct from B11 ProductPathReadSsot (perform substrate presence+token only).
  Not full DUAL-SSOT-EQUALITY vs Lean Emit* fragments. Not freestanding perform
  claimed. Not residual free. Not freestanding emit residual free. Not PROVABLY.
  B14 productPathFreestandingCapableRead true after B26 via Lake-free
  freestanding-capable-read-lake-free; this module is Lake diagnostic
  (productPathFreestandingCapableReadDependsOnLake true).
  productPathFreestandingCapableStepContractReadSatisfied true (no-emit dual SSOT
  READ as product authority). Compose/WriteHc/Full stay unsatisfied here.
  Lake exe: slake-freestanding-capable-read (just freestanding-capable-read).
  Lake-free B26: just freestanding-capable-read-lake-free.

  Theorems (READ-THEOREM / HOST-READ-THEOREM + READ-SMOKE / HOST-READ-SMOKE):
  SystemsLean.CapableReadTheorems (same namespace; long-file split).
  theorem productPathFreestandingCapableReadPartialReady_true /
  productPathFreestandingCapableReadOk_true / stageId_eq + surface pins.

  Greppable: SYSTEMS_LEAN_HOST,
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0,
  HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ,
  product path freestanding capable read,
  productPathFreestandingCapableReadPartialReady,
  productPathFreestandingCapableReadOk,
  freestandingCapableReadDualSsot,
  FREESTANDING-CAPABLE-STEP-CONTRACT-READ,
  productPathFreestandingCapableStepContractReadSatisfied,
  FREESTANDING-PERFORM-GAP-READ-SSOT, host_emit_mult.ssot.txt,
  freestanding-capable-read, slake-freestanding-capable-read,
  freestanding-capable-read-lake-free,
  productPathFreestandingCapableReadLakeFreeRecipe,
  READ-THEOREM, HOST-READ-THEOREM, READ-SMOKE, HOST-READ-SMOKE,
  CapableReadTheorems, theorem productPathFreestandingCapableReadPartialReady_true,
  CapableRead, RUNTIME-FS, UNIT_SURFACE host surface.
  Module: SystemsLean.CapableRead
  Dual-pin batch 15 home-primary; short-name batch 8 CapableRead.
  Long-file split: READ-THEOREM + SMOKE in CapableReadTheorems.
  Module must stay ASCII.
-/

namespace SystemsLean.CapableRead

/-- Greppable primary stage id (partial B16 freestanding-capable READ). -/
def stageId : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ"

/-- Greppable short map id. -/
def selfHostId : String :=
  "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ"

/-- Named freestanding-capable step contract this step satisfies (partial).
    Greppable: FREESTANDING-CAPABLE-STEP-CONTRACT-READ. -/
def contractStepRead : String := "FREESTANDING-CAPABLE-STEP-CONTRACT-READ"

/-- Named gap this step advances (not closed for full freestanding measure B14).
    Greppable: FREESTANDING-PERFORM-GAP-READ-SSOT. -/
def gapReadSsot : String := "FREESTANDING-PERFORM-GAP-READ-SSOT"

/-- Lake exe name for this freestanding-capable READ entrypoint. -/
def lakeExeName : String := "slake-freestanding-capable-read"

/-- just recipe name (Lake-hosted diagnostic). -/
def justRecipeName : String := "freestanding-capable-read"

/-- Lake-free freestanding-capable READ recipe (partial B26 CapableRead).
    Greppable: freestanding-capable-read-lake-free,
    productPathFreestandingCapableReadLakeFreeRecipe. -/
def productPathFreestandingCapableReadLakeFreeRecipe : String :=
  "freestanding-capable-read-lake-free"

/-- Real freestanding-capable READ API name (implemented in this module).
    Greppable: freestandingCapableReadDualSsot. -/
def freestandingCapableReadApi : String := "freestandingCapableReadDualSsot"

/-- Product authority is not FreestandingEmit (this module never imports it).
    Greppable: productPathFreestandingCapableReadAuthorityNotEmit. -/
def productPathFreestandingCapableReadAuthorityNotEmit : Bool := true

/-- This B16 READ still runs as a classic Lean Lake exe host (honest diagnostic).
    B14 productPathFreestandingCapableRead is true after B26 via separate Lake-
    free freestanding-capable-read-lake-free measure. Greppable:
    productPathFreestandingCapableReadDependsOnLake. -/
def productPathFreestandingCapableReadDependsOnLake : Bool := true

/-- Dual SSOT basename + required HOST-EMIT token + HEADER/BODY block names. -/
structure DualSsotSpec where
  base : String
  token : String
  headerBlock : String
  bodyBlock : String
  deriving Repr

/-- True when s contains needle as a contiguous substring (empty needle => false). -/
def containsStr (s needle : String) : Bool :=
  if needle.isEmpty then false
  else (s.splitOn needle).length > 1

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

/-- Fail closed when path missing. -/
def requireFile (path : System.FilePath) (label : String) : IO Unit := do
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {label}: {path}"
    throw (IO.userError s!"missing {label}")

/-- Mult..Out dual SSOT specs under emit/ (same ownership surface as B8/B11).
    HEADER/BODY names are structural dual SSOT markers on disk -- not Lean embeds. -/
def dualSsotSpecs : List DualSsotSpec := [
  { base := "host_emit_mult.ssot.txt", token := "HOST-EMIT-MULT",
    headerBlock := "MULT_C_HEADER", bodyBlock := "MULT_C_BODY" },
  { base := "host_emit_linear.ssot.txt", token := "HOST-EMIT-LINEAR",
    headerBlock := "LINEAR_C_HEADER", bodyBlock := "LINEAR_C_BODY" },
  { base := "host_emit_erasure.ssot.txt", token := "HOST-EMIT-ERASURE",
    headerBlock := "ERASURE_C_HEADER", bodyBlock := "ERASURE_C_BODY" },
  { base := "host_emit_extract.ssot.txt", token := "HOST-EMIT-EXTRACT",
    headerBlock := "EXTRACT_C_HEADER", bodyBlock := "EXTRACT_C_BODY" },
  { base := "host_emit_types.ssot.txt", token := "HOST-EMIT-TYPES",
    headerBlock := "TYPES_C_HEADER", bodyBlock := "TYPES_C_BODY" },
  { base := "host_emit_program.ssot.txt", token := "HOST-EMIT-PROGRAM",
    headerBlock := "PROGRAM_C_HEADER", bodyBlock := "PROGRAM_C_BODY" },
  { base := "host_emit_graph.ssot.txt", token := "HOST-EMIT-GRAPH",
    headerBlock := "GRAPH_C_HEADER", bodyBlock := "GRAPH_C_BODY" },
  { base := "host_emit_compose.ssot.txt", token := "HOST-EMIT-COMPOSE",
    headerBlock := "COMPOSE_C_HEADER", bodyBlock := "COMPOSE_C_BODY" },
  { base := "host_emit_plan.ssot.txt", token := "HOST-EMIT-PLAN",
    headerBlock := "PLAN_C_HEADER", bodyBlock := "PLAN_C_BODY" },
  { base := "host_emit_apply.ssot.txt", token := "HOST-EMIT-APPLY",
    headerBlock := "APPLY_C_HEADER", bodyBlock := "APPLY_C_BODY" },
  { base := "host_emit_body_fragment.ssot.txt", token := "HOST-EMIT-SSOT",
    headerBlock := "BODY_C_HEADER", bodyBlock := "BODY_C_BODY" },
  { base := "host_emit_banner.ssot.txt", token := "HOST-EMIT-BANNER",
    headerBlock := "BANNER_C_HEADER", bodyBlock := "BANNER_C_BODY" }
]

/-- Read one dual SSOT file: non-empty + greppable host token + non-empty
    HEADER/BODY structural blocks. Greppable: freestandingCapableReadOneSsot,
    IO.FS.readFile (read-only; no product write). -/
def freestandingCapableReadOneSsot (path : System.FilePath) (spec : DualSsotSpec) :
    IO Unit := do
  requireFile path s!"dual SSOT ({spec.token})"
  let content <- IO.FS.readFile path
  if content.isEmpty then
    IO.eprintln s!"error: empty dual SSOT: {path}"
    throw (IO.userError s!"empty {path}")
  unless containsStr content spec.token do
    IO.eprintln s!"error: dual SSOT missing token {spec.token}: {path}"
    throw (IO.userError s!"missing token {spec.token}")
  match ssotBlock content spec.headerBlock with
  | none =>
    IO.eprintln s!"error: dual SSOT missing HEADER block {spec.headerBlock}: {path}"
    throw (IO.userError s!"missing HEADER {spec.headerBlock}")
  | some h =>
    if h.isEmpty then
      IO.eprintln s!"error: empty HEADER block {spec.headerBlock}: {path}"
      throw (IO.userError s!"empty HEADER {spec.headerBlock}")
  match ssotBlock content spec.bodyBlock with
  | none =>
    IO.eprintln s!"error: dual SSOT missing BODY block {spec.bodyBlock}: {path}"
    throw (IO.userError s!"missing BODY {spec.bodyBlock}")
  | some b =>
    if b.isEmpty then
      IO.eprintln s!"error: empty BODY block {spec.bodyBlock}: {path}"
      throw (IO.userError s!"empty BODY {spec.bodyBlock}")
  pure ()

/-- freestandingCapableReadDualSsot -- freestanding-capable product-path READ of
    Mult..Out dual SSOT under root/src/systems/emit without FreestandingEmit as
    product authority. Structural dual SSOT (token + HEADER/BODY); not Lean-
    fragment DUAL-SSOT-EQUALITY; not compose/write.
    Greppable: freestandingCapableReadDualSsot,
    FREESTANDING-CAPABLE-STEP-CONTRACT-READ,
    FREESTANDING-PERFORM-GAP-READ-SSOT. -/
def freestandingCapableReadDualSsot (root : System.FilePath) : IO Unit := do
  let emitDir := root / "src" / "systems" / "emit"
  IO.println s!"== {stageId}: freestanding-capable READ dual SSOT =="
  IO.println s!"  host: {hostId} / {selfHostId}"
  IO.println s!"  contract: {contractStepRead} (productPathFreestandingCapableStepContractReadSatisfied)"
  IO.println s!"  gap: {gapReadSsot} (B14 CapableRead true after B26 Lake-free freestanding-capable-read-lake-free; this path is Lake exe diagnostic)"
  IO.println s!"  API: {freestandingCapableReadApi}"
  IO.println "  authority: not FreestandingEmit (no import; no emit-at-root/render)"
  IO.println s!"    productPathFreestandingCapableReadAuthorityNotEmit: {productPathFreestandingCapableReadAuthorityNotEmit}"
  IO.println s!"    productPathFreestandingCapableReadDependsOnLake: {productPathFreestandingCapableReadDependsOnLake} (Lake exe host diagnostic; Lake-free measure is freestanding-capable-read-lake-free)"
  IO.println "  depth: IO.FS.readFile + token + HEADER/BODY structural blocks"
  IO.println "  not: Lean-fragment DUAL-SSOT-EQUALITY; not compose/write; not perform claimed"
  let mut n : Nat := 0
  for spec in dualSsotSpecs do
    let path := emitDir / spec.base
    freestandingCapableReadOneSsot path spec
    IO.println s!"  read ok: {path} ({spec.token}; {spec.headerBlock}/{spec.bodyBlock})"
    n := n + 1
  IO.println s!"GREEN {stageId}: freestanding-capable read {n} dual SSOT file(s) under {emitDir}/"
  IO.println "  FREESTANDING-CAPABLE-STEP-CONTRACT-READ advanced (no-emit authority)"
  IO.println "  honest: WriteHc/Full unsatisfied; perform claimed false; complete false"
  IO.println "  B14 productPathFreestandingCapableRead true after B26 (just freestanding-capable-read-lake-free)"
  IO.println "  note: ComposeSatisfied true after B17 freestandingCapableComposePlanApplyBody (separate step)"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Surface ok: stage ids + authority-not-emit + named API + Lake dependency honest.
    Greppable: productPathFreestandingCapableReadOk. -/
def productPathFreestandingCapableReadOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0")
    && (hostId == "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ")
    && (selfHostId == "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ")
    && (contractStepRead == "FREESTANDING-CAPABLE-STEP-CONTRACT-READ")
    && (gapReadSsot == "FREESTANDING-PERFORM-GAP-READ-SSOT")
    && (freestandingCapableReadApi == "freestandingCapableReadDualSsot")
    && (productPathFreestandingCapableReadAuthorityNotEmit == true)
    && (productPathFreestandingCapableReadDependsOnLake == true)
    && (lakeExeName == "slake-freestanding-capable-read")
    && (justRecipeName == "freestanding-capable-read")
    && (productPathFreestandingCapableReadLakeFreeRecipe
        == "freestanding-capable-read-lake-free")

/-- Land-time Full step-contract long-name pin (false at B16 land; living tip
    stepContractFull true after later cliffs). Greppable:
    productPathFreestandingCapableStepContractFullSatisfied. -/
def productPathFreestandingCapableStepContractFullSatisfied : Bool := false

/-- READ PartialReady fold (closed B16 substrate: Ok + authority-not-emit +
    DependsOnLake + Full long-name false). Historical readiness bulk for
    freestanding-capable READ. SelfApplyFs living tip re-exports a chain fold
    that includes this def for greppable dual-pin + B15 step-contract PartialReady.
    Land-time module pins: AuthorityNotEmit true; DependsOnLake true; Full
    long-name false (living tip allows perform / ownership / stepContractFull /
    complete true after later cliffs). Does not flip residual free / llvm / PROVABLY.
    Greppable: productPathFreestandingCapableReadPartialReady,
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ,
    freestandingCapableReadDualSsot. -/
def productPathFreestandingCapableReadPartialReady : Bool :=
  productPathFreestandingCapableReadOk
    && productPathFreestandingCapableReadAuthorityNotEmit
    && productPathFreestandingCapableReadDependsOnLake
    && !productPathFreestandingCapableStepContractFullSatisfied

/-- CLI: optional repo root argument (default cwd). -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    unless productPathFreestandingCapableReadOk do
      IO.eprintln s!"error: {stageId} surface not ok"
      throw (IO.userError "productPathFreestandingCapableReadOk false")
    freestandingCapableReadDualSsot root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.CapableRead

-- Lake entry is SystemsLean.CapableReadMain (no top-level
-- main here so freestanding-capable ordered regenerate and SelfApplyFs may import
-- this API / Ok / PartialReady bulk without main clash).
"##

end SystemsLean.HostFrontLiveCapableRead
