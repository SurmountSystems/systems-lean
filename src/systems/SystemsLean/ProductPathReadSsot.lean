/-
  SYSTEMS_LEAN_HOST partial -- freestanding product path perform READ-SSOT (B11).
  SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0 -- decomposed dual SSOT READ step.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Decomposed product-path **read** of Mult..Out dual SSOT via IO.FS.readFile only.
  No FreestandingEmit import; no compose/render; no product-wire write APIs.
  Read depth: presence + non-empty + HOST-EMIT token only -- not HEADER/BODY parse,
  not DUAL-SSOT-EQUALITY (full dual equality remains FreestandingEmit product path).
  Lake exe: slake-read-product-ssot (just read-product-ssot).
  Not freestanding perform claimed. Not residual free. Not PROVABLY.
  Not freestanding emit residual free.
  Dual-pin thin batch 10: stage/Ok/moduleCite/recipe/exe/fn/gap home-primary;
  tip keeps chain fold + ReadDependsOnLake + ReadEntrypointClaimed only.
  Living tip owns claim-bool SSoT; this land-time module does NOT define those
  claim bools true (emit-wire forbid).
  Theorems (READ-SSOT-THEOREM / HOST-READ-SSOT-THEOREM +
  READ-SSOT-SMOKE / HOST-READ-SSOT-SMOKE):
  SystemsLean.ProductPathReadSsotTheorems (same namespace; long-file split).
  theorem productPathPerformReadPartialReady_true /
  productPathPerformReadOk_true / stageId_eq + surface pins.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0,
  HOST-SELF-HOST-PRODUCT-PATH-PERFORM-READ, SELF-HOST-PRODUCT-PATH-PERFORM-READ,
  product path perform read, readDualSsotAtRoot, IO.FS.readFile,
  FREESTANDING-PERFORM-GAP-READ-SSOT, host_emit_mult.ssot.txt,
  slake-read-product-ssot, ProductPathReadSsot, MULT-0, MULT-1, MULT-OMEGA,
  productPathPerformReadOk, productPathPerformReadPartialReady,
  productPathPerformReadDependsOnLake, productPathPerformReadEntrypointClaimed,
  READ-SSOT-THEOREM, HOST-READ-SSOT-THEOREM,
  READ-SSOT-SMOKE, HOST-READ-SSOT-SMOKE, ProductPathReadSsotTheorems,
  theorem productPathPerformReadPartialReady_true,
  RUNTIME-FS, UNIT_SURFACE host surface.
  Module: SystemsLean.ProductPathReadSsot
  Long-file split: READ-SSOT-THEOREM + SMOKE in ProductPathReadSsotTheorems.
  Not freestanding emit residual free. Not residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.ProductPathReadSsot

/-- Greppable primary stage id (partial B11 READ-SSOT perform substrate). -/
def stageId : String := "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-READ"

/-- Greppable short map id. -/
def selfHostId : String := "SELF-HOST-PRODUCT-PATH-PERFORM-READ"

/-- Named gap this step advances (not closed until freestanding-capable without
    classic Lean as product path). Greppable: FREESTANDING-PERFORM-GAP-READ-SSOT. -/
def gapReadSsot : String := "FREESTANDING-PERFORM-GAP-READ-SSOT"

/-- Lake exe name for this read-only entrypoint. -/
def lakeExeName : String := "slake-read-product-ssot"

/-- just recipe name. -/
def justRecipeName : String := "read-product-ssot"

/-- Read entry function cite. Greppable: readDualSsotAtRoot. -/
def readFnCite : String := "readDualSsotAtRoot"

/-- Module cite. Greppable: ProductPathReadSsot. -/
def readModuleCite : String := "ProductPathReadSsot"

/-- productPathPerformReadDependsOnLake -- READ step still uses classic Lean
    Lake host exe, not freestanding C. Land-time honesty pin (true). Greppable:
    productPathPerformReadDependsOnLake, SELF-HOST-PRODUCT-PATH-PERFORM-READ. -/
def productPathPerformReadDependsOnLake : Bool := true

/-- productPathPerformReadEntrypointClaimed -- decomposed READ entry exists
    (just read-product-ssot / lake exe slake-read-product-ssot /
    readDualSsotAtRoot). NOT freestanding perform claimed.
    Greppable: productPathPerformReadEntrypointClaimed,
    SELF-HOST-PRODUCT-PATH-PERFORM-READ, read-product-ssot. -/
def productPathPerformReadEntrypointClaimed : Bool := true

/-- productPathPerformReadOk -- B11 stage ids + entrypoint claimed + recipe/exe/
    module cites + ReadDependsOnLake true + gap READ-SSOT. Land-time surface only
    (no living-tip perform/ownership/complete true defs -- emit-wire forbid).
    Greppable: productPathPerformReadOk, SELF-HOST-PRODUCT-PATH-PERFORM-READ,
    product path perform read. -/
def productPathPerformReadOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0")
    && (hostId == "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-READ")
    && (selfHostId == "SELF-HOST-PRODUCT-PATH-PERFORM-READ")
    && (productPathPerformReadEntrypointClaimed == true)
    && (justRecipeName == "read-product-ssot")
    && (lakeExeName == "slake-read-product-ssot")
    && (readModuleCite == "ProductPathReadSsot")
    && (readFnCite == "readDualSsotAtRoot")
    && (productPathPerformReadDependsOnLake == true)
    && (gapReadSsot == "FREESTANDING-PERFORM-GAP-READ-SSOT")

/-- READ PartialReady fold (closed B11: Ok + DependsOnLake + entrypoint claimed).
    SelfApplyFs living tip re-exports a chain fold including this def.
    Land-time: DependsOnLake true; EntrypointClaimed true. Does not flip residual
    free / llvm / PROVABLY. Greppable: productPathPerformReadPartialReady,
    SELF-HOST-PRODUCT-PATH-PERFORM-READ, product path perform read. -/
def productPathPerformReadPartialReady : Bool :=
  productPathPerformReadOk
    && productPathPerformReadDependsOnLake
    && productPathPerformReadEntrypointClaimed

/-- Dual SSOT basename + required HOST-EMIT token. -/
structure DualSsotSpec where
  base : String
  token : String
  deriving Repr

/-- True when s contains needle as contiguous substring (empty needle => false). -/
def containsStr (s needle : String) : Bool :=
  if needle.isEmpty then false
  else (s.splitOn needle).length > 1

/-- Fail closed when path missing. -/
def requireFile (path : System.FilePath) (label : String) : IO Unit := do
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {label}: {path}"
    throw (IO.userError s!"missing {label}")

/-- Mult..Out dual SSOT basenames under emit/ with required HOST-EMIT token.
    Mult grades MULT-0 / MULT-1 / MULT-OMEGA on host_emit_mult.ssot.txt. -/
def dualSsotSpecs : List DualSsotSpec := [
  { base := "host_emit_mult.ssot.txt", token := "HOST-EMIT-MULT" },
  { base := "host_emit_linear.ssot.txt", token := "HOST-EMIT-LINEAR" },
  { base := "host_emit_erasure.ssot.txt", token := "HOST-EMIT-ERASURE" },
  { base := "host_emit_extract.ssot.txt", token := "HOST-EMIT-EXTRACT" },
  { base := "host_emit_types.ssot.txt", token := "HOST-EMIT-TYPES" },
  { base := "host_emit_program.ssot.txt", token := "HOST-EMIT-PROGRAM" },
  { base := "host_emit_graph.ssot.txt", token := "HOST-EMIT-GRAPH" },
  { base := "host_emit_compose.ssot.txt", token := "HOST-EMIT-COMPOSE" },
  { base := "host_emit_plan.ssot.txt", token := "HOST-EMIT-PLAN" },
  { base := "host_emit_apply.ssot.txt", token := "HOST-EMIT-APPLY" },
  { base := "host_emit_body_fragment.ssot.txt", token := "HOST-EMIT-SSOT" },
  { base := "host_emit_banner.ssot.txt", token := "HOST-EMIT-BANNER" }
]

/-- Read one dual SSOT; require non-empty + HOST-EMIT token.
    Greppable: readOneSsot, IO.FS.readFile (read-only; no product write). -/
def readOneSsot (path : System.FilePath) (token : String) : IO String := do
  requireFile path s!"dual SSOT ({token})"
  let content <- IO.FS.readFile path
  if content.isEmpty then
    IO.eprintln s!"error: empty dual SSOT: {path}"
    throw (IO.userError s!"empty {path}")
  unless containsStr content token do
    IO.eprintln s!"error: dual SSOT missing token {token}: {path}"
    throw (IO.userError s!"missing token {token}")
  pure content

/-- Read Mult..Out dual SSOT under root/src/systems/emit (presence/token only).
    Greppable: readDualSsotAtRoot, FREESTANDING-PERFORM-GAP-READ-SSOT. -/
def readDualSsotAtRoot (root : System.FilePath) : IO Unit := do
  let emitDir := root / "src" / "systems" / "emit"
  IO.println s!"== {stageId}: product path perform READ SSOT (decomposed) =="
  IO.println s!"  host: {hostId} / {selfHostId}"
  IO.println s!"  gap: {gapReadSsot} (partial; not freestanding perform claimed)"
  IO.println "  read-only: IO.FS.readFile presence+token; not dual-equality"
  IO.println "  not residual free; not PROVABLY; compose/write still Lake FreestandingEmit"
  let mut n : Nat := 0
  for spec in dualSsotSpecs do
    let path := emitDir / spec.base
    let _ <- readOneSsot path spec.token
    IO.println s!"  read ok: {path} ({spec.token})"
    n := n + 1
  IO.println s!"GREEN {stageId}: read {n} dual SSOT file(s) under {emitDir}/"
  IO.println "  not freestanding perform claimed; FREESTANDING-PERFORM-GAP-READ-SSOT not closed"
  IO.println "  compose/write still require FreestandingEmit product path"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: optional repo root argument (default cwd). -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    unless productPathPerformReadOk do
      IO.eprintln s!"error: {stageId} surface not ok"
      throw (IO.userError "productPathPerformReadOk false")
    readDualSsotAtRoot root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.ProductPathReadSsot

-- Theorems + smoke: SystemsLean.ProductPathReadSsotTheorems (same namespace).
-- Lake entry is SystemsLean.ProductPathReadSsotMain (no top-level main here so
-- SelfApplyFs may import this API / Ok / PartialReady bulk without main clash).
