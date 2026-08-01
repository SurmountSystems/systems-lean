/-
  SYSTEMS_LEAN_HOST partial -- freestanding product path perform WRITE-HC (B13).
  SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_WRITE_HC_V0 -- decomposed freestanding .h/.c
  WRITE step substrate.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Decomposed entrypoint over FreestandingEmit for product-path write of
  freestanding emit wire (slake_freestanding.h / slake_freestanding.c) under emit/
  via FreestandingEmit.emitAtRoot (WRITER-PATH-STEP-WRITE-FREESTANDING-HC).
  Full Mult..Apply dual SSOT + template embed + write (not write-only freestanding
  without Lake). Lake FreestandingEmit still product writer
  (productPathPerformWriteHcDependsOnLake true). Does NOT install Out (B10).
  Lake exe: slake-write-freestanding-hc (just write-freestanding-hc).
  Dual-pin thin batch 12: stage/Ok/moduleCite/recipe/exe/fn/gap home-primary;
  tip keeps WriteHcDependsOnLake + WriteHcEntrypointClaimed + chain fold only
  (no living-tip complete/perform/ownership true defs -- emit-wire forbid).
  Not freestanding perform claimed. Not residual free. Not PROVABLY.
  Not freestanding emit residual free.
  Theorems (WRITE-HC-THEOREM / HOST-WRITE-HC-THEOREM +
  WRITE-HC-SMOKE / HOST-WRITE-HC-SMOKE):
  SystemsLean.ProductPathWriteHcTheorems (same namespace; long-file split).
  theorem productPathPerformWriteHcPartialReady_true /
  productPathPerformWriteHcOk_true / stageId_eq + surface pins.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_WRITE_HC_V0,
  HOST-SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC, SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC,
  product path perform write, writeFreestandingHcAtRoot, emitAtRoot,
  FREESTANDING-PERFORM-GAP-WRITE-HC, WRITER-PATH-STEP-WRITE-FREESTANDING-HC,
  slake_freestanding.h, slake_freestanding.c, FreestandingEmit,
  slake-write-freestanding-hc, ProductPathWriteHc,
  productPathPerformWriteHcOk, productPathPerformWriteHcPartialReady,
  productPathPerformWriteHcDependsOnLake, productPathPerformWriteHcEntrypointClaimed,
  WRITE-HC-THEOREM, HOST-WRITE-HC-THEOREM,
  WRITE-HC-SMOKE, HOST-WRITE-HC-SMOKE, ProductPathWriteHcTheorems,
  theorem productPathPerformWriteHcPartialReady_true,
  RUNTIME-FS, UNIT_SURFACE host surface.
  Module: SystemsLean.ProductPathWriteHc
  Long-file split: WRITE-HC-THEOREM + SMOKE in ProductPathWriteHcTheorems.
  Not freestanding emit residual free. Not residual free. Not PROVABLY.
  Module must stay ASCII.
-/

import SystemsLean.FreestandingEmit

namespace SystemsLean.ProductPathWriteHc

/-- Greppable primary stage id (partial B13 WRITE-HC perform substrate). -/
def stageId : String := "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_WRITE_HC_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC"

/-- Greppable short map id. -/
def selfHostId : String := "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC"

/-- Named gap this step advances (not closed until freestanding-capable without
    classic Lean as product path). Greppable: FREESTANDING-PERFORM-GAP-WRITE-HC. -/
def gapWriteHc : String := "FREESTANDING-PERFORM-GAP-WRITE-HC"

/-- Ordered B6 plan step id this substrate advances. Greppable:
    WRITER-PATH-STEP-WRITE-FREESTANDING-HC. -/
def writerPathStepWriteHc : String := "WRITER-PATH-STEP-WRITE-FREESTANDING-HC"

/-- Lake exe name for this write-only entrypoint. -/
def lakeExeName : String := "slake-write-freestanding-hc"

/-- just recipe name. -/
def justRecipeName : String := "write-freestanding-hc"

/-- Emit workspace freestanding header basename. Greppable: slake_freestanding.h. -/
def emitHeaderBase : String := "slake_freestanding.h"

/-- Emit workspace freestanding source basename. Greppable: slake_freestanding.c. -/
def emitSourceBase : String := "slake_freestanding.c"

/-- Write entry function cite. Greppable: writeFreestandingHcAtRoot. -/
def writeHcFnCite : String := "writeFreestandingHcAtRoot"

/-- Module cite. Greppable: ProductPathWriteHc. -/
def writeHcModuleCite : String := "ProductPathWriteHc"

/-- productPathPerformWriteHcDependsOnLake -- WRITE-HC still uses classic Lean
    Lake FreestandingEmit.emitAtRoot, not freestanding C. Land-time true.
    Greppable: productPathPerformWriteHcDependsOnLake,
    SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC. -/
def productPathPerformWriteHcDependsOnLake : Bool := true

/-- productPathPerformWriteHcEntrypointClaimed -- decomposed WRITE-HC entry exists
    (just write-freestanding-hc / lake exe / writeFreestandingHcAtRoot).
    NOT freestanding perform claimed.
    Greppable: productPathPerformWriteHcEntrypointClaimed,
    SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC, write-freestanding-hc. -/
def productPathPerformWriteHcEntrypointClaimed : Bool := true

/-- productPathPerformWriteHcOk -- B13 stage ids + entrypoint claimed + recipe/exe/
    module cites + WriteHcDependsOnLake true + gap WRITE-HC + writer path step.
    Land-time only (no living-tip perform/ownership/complete true -- emit-wire forbid).
    Greppable: productPathPerformWriteHcOk, SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC,
    product path perform write. -/
def productPathPerformWriteHcOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_WRITE_HC_V0")
    && (hostId == "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC")
    && (selfHostId == "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC")
    && (productPathPerformWriteHcEntrypointClaimed == true)
    && (justRecipeName == "write-freestanding-hc")
    && (lakeExeName == "slake-write-freestanding-hc")
    && (writeHcModuleCite == "ProductPathWriteHc")
    && (writeHcFnCite == "writeFreestandingHcAtRoot")
    && (productPathPerformWriteHcDependsOnLake == true)
    && (gapWriteHc == "FREESTANDING-PERFORM-GAP-WRITE-HC")
    && (writerPathStepWriteHc == "WRITER-PATH-STEP-WRITE-FREESTANDING-HC")
    && (emitHeaderBase == "slake_freestanding.h")
    && (emitSourceBase == "slake_freestanding.c")

/-- WRITE-HC PartialReady fold (Ok + DependsOnLake + entrypoint claimed).
    Tip re-exports chain fold. Land-time DependsOnLake true; EntrypointClaimed true.
    Does not flip residual free / llvm / PROVABLY.
    Greppable: productPathPerformWriteHcPartialReady,
    SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC, product path perform write. -/
def productPathPerformWriteHcPartialReady : Bool :=
  productPathPerformWriteHcOk
    && productPathPerformWriteHcDependsOnLake
    && productPathPerformWriteHcEntrypointClaimed

/-- Fail closed when path missing. -/
def requireFile (path : System.FilePath) (label : String) : IO Unit := do
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {label}: {path}"
    throw (IO.userError s!"missing {label}")

/-- WRITE-HC entrypoint over FreestandingEmit.emitAtRoot (full dual SSOT +
    template embed + write emit .h/.c). Not freestanding without Lake; does not
    install Out (B10). Greppable: writeFreestandingHcAtRoot, emitAtRoot,
    FREESTANDING-PERFORM-GAP-WRITE-HC, WRITER-PATH-STEP-WRITE-FREESTANDING-HC,
    slake_freestanding.h, slake_freestanding.c. -/
def writeFreestandingHcAtRoot (root : System.FilePath) : IO Unit := do
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: product path perform WRITE-HC freestanding .h/.c (decomposed entrypoint over FreestandingEmit) =="
  IO.println s!"  host: {hostId} / {selfHostId}"
  IO.println s!"  gap: {gapWriteHc} (partial; not freestanding perform claimed)"
  IO.println s!"  step: {writerPathStepWriteHc}"
  IO.println "  write: FreestandingEmit.emitAtRoot (Lake still product writer; full read/compose/write)"
  IO.println "  not install Out; not residual free; not PROVABLY"
  -- Decomposed entrypoint over FreestandingEmit: product-wire write still owned there.
  SystemsLean.FreestandingEmit.emitAtRoot root
  requireFile outH s!"emit header after write ({emitHeaderBase})"
  requireFile outC s!"emit source after write ({emitSourceBase})"
  IO.println s!"GREEN {stageId}: wrote emit wire under {emitDir}/"
  IO.println s!"  wrote: {outH}"
  IO.println s!"  wrote: {outC}"
  IO.println "  not freestanding perform claimed; FREESTANDING-PERFORM-GAP-WRITE-HC not closed"
  IO.println "  still Lake FreestandingEmit entrypoint; install Out remains B10 / just build"

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
    unless productPathPerformWriteHcOk do
      IO.eprintln s!"error: {stageId} surface not ok"
      throw (IO.userError "productPathPerformWriteHcOk false")
    writeFreestandingHcAtRoot root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.ProductPathWriteHc

-- Theorems + smoke: SystemsLean.ProductPathWriteHcTheorems (same namespace).
-- Lake entry is SystemsLean.ProductPathWriteHcMain (no top-level main here so
-- SelfApplyFs may import this API / Ok / PartialReady bulk without main clash).
