/-
  SYSTEMS_LEAN_HOST partial -- freestanding product path freestanding-capable gap
  (B14 + partial B26 CapableRead + partial B27 CapableCompose + partial B28
  CapableWriteHc Lake-free).
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0 -- measure which ordered
  regenerate steps are Lake-free today vs still Lake-bound, plus host ordered
  pipeline join (just regenerate-product-path).
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Dual-pin thin batch 13: this home owns stage/host/recipe/exe/Ok/LakeFree bulk +
  PartialReady substrate. SelfApplyFs living tip keeps InstallOnly/Read/Compose/
  WriteHc/FullPerform honesty bools + B13-chain fold.
  Honest step capability (B6 order): INSTALL-OUT true (B10 Lake-free install);
  READ-SSOT CapableRead true after B26 (just freestanding-capable-read-lake-free;
  B16 Lake exe freestandingCapableReadDualSsot remains diagnostic);
  COMPOSE CapableCompose true after B27 (just freestanding-capable-compose-lake-free;
  B17 Lake exe freestandingCapableComposePlanApplyBody remains diagnostic);
  WRITE-HC CapableWriteHc true after B28 (just freestanding-capable-write-hc-lake-free;
  B18 Lake exe freestandingCapableWriteFreestandingHc remains diagnostic).
  Full freestanding-capable perform of FREESTANDING-PERFORM-GAP-* stays false.
  Living tip allows perform/ownership/complete true after later cliffs; this home
  must not mint living-tip claim true defs. Ordered pipeline is host join, not
  freestanding-capable full close.
  Lake exe: slake-freestanding-capable-gap (just freestanding-capable-gap).
  Pipeline: just regenerate-product-path (read -> compose -> write-hc -> install).
  Theorems (CAPABLE-GAP-THEOREM / HOST-CAPABLE-GAP-THEOREM +
  CAPABLE-GAP-SMOKE / HOST-CAPABLE-GAP-SMOKE):
  SystemsLean.CapableTheorems (same namespace; long-file split).
  theorem productPathFreestandingCapablePartialReady_true /
  productPathFreestandingCapableOk_true / stageId_eq + surface pins.

  Greppable: SYSTEMS_LEAN_HOST,
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0,
  HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP,
  product path freestanding capable gap, productPathFreestandingCapablePartialReady,
  productPathFreestandingCapableOk, productPathFreestandingCapableInstallOnly,
  productPathFreestandingCapableRead, productPathFreestandingCapableCompose,
  productPathFreestandingCapableWriteHc, productPathFreestandingCapableFullPerform,
  theorem productPathFreestandingCapablePartialReady_true,
  CAPABLE-GAP-THEOREM, HOST-CAPABLE-GAP-THEOREM,
  CAPABLE-GAP-SMOKE, HOST-CAPABLE-GAP-SMOKE, CapableTheorems,
  regenerate-product-path, freestanding-capable-gap, slake-freestanding-capable-gap,
  freestanding-capable-read-lake-free, productPathFreestandingCapableReadLakeFreeRecipe,
  freestanding-capable-compose-lake-free,
  productPathFreestandingCapableComposeLakeFreeRecipe,
  freestanding-capable-write-hc-lake-free,
  productPathFreestandingCapableWriteHcLakeFreeRecipe,
  Capable, FREESTANDING-PERFORM-GAP-READ-SSOT,
  FREESTANDING-PERFORM-GAP-COMPOSE, FREESTANDING-PERFORM-GAP-WRITE-HC,
  WRITER-PATH-STEP-INSTALL-OUT, RUNTIME-FS, UNIT_SURFACE host surface.
  Module: SystemsLean.Capable
  Long-file split: CAPABLE-GAP-THEOREM + SMOKE in CapableTheorems.
  Not freestanding emit residual free. Not residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.Capable

/-- Greppable primary stage id (partial B14 freestanding-capable gap measure). -/
def stageId : String := "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP"

/-- Greppable short map id. -/
def selfHostId : String := "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP"

/-- INSTALL-OUT step is freestanding-capable today (B10 Lake-free install-only
    when emit wire present). Greppable: productPathFreestandingCapableInstallOnly,
    WRITER-PATH-STEP-INSTALL-OUT, install-freestanding-c-out.
    Keep in sync with SelfApplyFs claim pins (pure Nix scans both literals). -/
def productPathFreestandingCapableInstallOnly : Bool := true

/-- B14 Lake-free freestanding CapableRead measure -- true after partial B26.
    Real evidence: just freestanding-capable-read-lake-free exercises Mult..Out
    dual SSOT token + HEADER/BODY structural blocks without lake build/exe
    (freestanding-capable contract depth matching B16 freestandingCapableReadDualSsot;
    NOT ownership-regenerate-read-only presence+token path piece).
    B16 Lake exe freestandingCapableReadDualSsot remains diagnostic host path.
    B11 ProductPathReadSsot is the older perform substrate. Greppable:
    productPathFreestandingCapableRead, FREESTANDING-PERFORM-GAP-READ-SSOT,
    freestanding-capable-read-lake-free.
    Keep in sync with SelfApplyFs. -/
def productPathFreestandingCapableRead : Bool := true

/-- B14 Lake-free freestanding CapableCompose measure -- true after partial B27.
    Real evidence: just freestanding-capable-compose-lake-free exercises plan/
    apply/body dual SSOT token + HEADER/BODY structural blocks without lake
    build/exe (freestanding-capable contract depth matching B17
    freestandingCapableComposePlanApplyBody; NOT ownership-regenerate-compose-only
    presence+token path piece). B17 Lake exe freestandingCapableComposePlanApplyBody
    remains diagnostic host path. B12 ProductPathComposePlan is perform substrate.
    Greppable: productPathFreestandingCapableCompose, FREESTANDING-PERFORM-GAP-COMPOSE,
    freestanding-capable-compose-lake-free.
    Keep in sync with SelfApplyFs. -/
def productPathFreestandingCapableCompose : Bool := true

/-- B14 Lake-free freestanding CapableWriteHc measure -- true after partial B28.
    Real evidence: just freestanding-capable-write-hc-lake-free exercises Mult..Out
    dual SSOT token + HEADER/BODY structural blocks plus write substrate markers
    (templates, freestanding .h/.c stage token, host module APIs) without lake
    build/exe (freestanding-capable contract depth matching B18
    freestandingCapableWriteFreestandingHc; NOT ownership-regenerate-write-hc-only
    presence+token path piece). B18 Lake exe freestandingCapableWriteFreestandingHc
    remains diagnostic host path. B13 ProductPathWriteHc is perform substrate.
    Greppable: productPathFreestandingCapableWriteHc, FREESTANDING-PERFORM-GAP-WRITE-HC,
    freestanding-capable-write-hc-lake-free.
    Keep in sync with SelfApplyFs. -/
def productPathFreestandingCapableWriteHc : Bool := true

/-- Full freestanding-capable perform of all FREESTANDING-PERFORM-GAP-* steps
    without classic Lean as product path -- false until real freestanding path.
    Greppable: productPathFreestandingCapableFullPerform.
    Keep in sync with SelfApplyFs. -/
def productPathFreestandingCapableFullPerform : Bool := false

/-- Named gaps still open for freestanding-capable close. -/
def gapReadSsot : String := "FREESTANDING-PERFORM-GAP-READ-SSOT"
def gapCompose : String := "FREESTANDING-PERFORM-GAP-COMPOSE"
def gapWriteHc : String := "FREESTANDING-PERFORM-GAP-WRITE-HC"

/-- Ordered B6 plan step that is freestanding-capable today. -/
def writerPathStepInstall : String := "WRITER-PATH-STEP-INSTALL-OUT"

/-- Host ordered pipeline join recipe (B6 order; READ/COMPOSE/WRITE-HC have Lake
    exe diagnostics + B26/B27/B28 Lake-free freestanding-capable measures).
    Greppable: regenerate-product-path. -/
def orderedPipelineRecipe : String := "regenerate-product-path"

/-- Lake-free freestanding-capable READ recipe (partial B26 CapableRead evidence).
    Greppable: freestanding-capable-read-lake-free,
    productPathFreestandingCapableReadLakeFreeRecipe. -/
def productPathFreestandingCapableReadLakeFreeRecipe : String :=
  "freestanding-capable-read-lake-free"

/-- Lake-free freestanding-capable COMPOSE recipe (partial B27 CapableCompose
    evidence). Greppable: freestanding-capable-compose-lake-free,
    productPathFreestandingCapableComposeLakeFreeRecipe. -/
def productPathFreestandingCapableComposeLakeFreeRecipe : String :=
  "freestanding-capable-compose-lake-free"

/-- Lake-free freestanding-capable WRITE-HC recipe (partial B28 CapableWriteHc
    evidence). Greppable: freestanding-capable-write-hc-lake-free,
    productPathFreestandingCapableWriteHcLakeFreeRecipe. -/
def productPathFreestandingCapableWriteHcLakeFreeRecipe : String :=
  "freestanding-capable-write-hc-lake-free"

/-- Diagnostic Lake exe / just recipe for this gap measure print. -/
def lakeExeName : String := "slake-freestanding-capable-gap"
def justMeasureRecipe : String := "freestanding-capable-gap"

/-- Gap measure surface ok: install Lake-free true; CapableRead true (B26);
    CapableCompose true (B27); CapableWriteHc true (B28); full perform false;
    gap tokens named; pipeline + Lake-free READ/COMPOSE/WRITE-HC recipes named.
    Greppable: productPathFreestandingCapableOk. -/
def productPathFreestandingCapableOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0")
    && (hostId == "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP")
    && (selfHostId == "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP")
    && (productPathFreestandingCapableInstallOnly == true)
    && (productPathFreestandingCapableRead == true)
    && (productPathFreestandingCapableCompose == true)
    && (productPathFreestandingCapableWriteHc == true)
    && (productPathFreestandingCapableFullPerform == false)
    && (gapReadSsot == "FREESTANDING-PERFORM-GAP-READ-SSOT")
    && (gapCompose == "FREESTANDING-PERFORM-GAP-COMPOSE")
    && (gapWriteHc == "FREESTANDING-PERFORM-GAP-WRITE-HC")
    && (writerPathStepInstall == "WRITER-PATH-STEP-INSTALL-OUT")
    && (orderedPipelineRecipe == "regenerate-product-path")
    && (productPathFreestandingCapableReadLakeFreeRecipe
        == "freestanding-capable-read-lake-free")
    && (productPathFreestandingCapableComposeLakeFreeRecipe
        == "freestanding-capable-compose-lake-free")
    && (productPathFreestandingCapableWriteHcLakeFreeRecipe
        == "freestanding-capable-write-hc-lake-free")
    && (lakeExeName == "slake-freestanding-capable-gap")
    && (justMeasureRecipe == "freestanding-capable-gap")

/-- Capable-gap PartialReady fold (closed B14 substrate: Ok + install-only +
    CapableRead/Compose/WriteHc Lake-free true + FullPerform false). Historical
    readiness bulk for freestanding-capable gap measure. SelfApplyFs living tip
    re-exports a chain fold that includes this def for greppable dual-pin + B13
    WRITE-HC PartialReady chain. Land-time module pins: InstallOnly true;
    CapableRead/Compose/WriteHc true; FullPerform false (living tip allows
    perform / ownership / stepContractFull / complete true after later cliffs).
    Does not flip residual free / llvm / PROVABLY.
    Greppable: productPathFreestandingCapablePartialReady,
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP. -/
def productPathFreestandingCapablePartialReady : Bool :=
  productPathFreestandingCapableOk
    && productPathFreestandingCapableInstallOnly
    && productPathFreestandingCapableRead
    && productPathFreestandingCapableCompose
    && productPathFreestandingCapableWriteHc
    && !productPathFreestandingCapableFullPerform

/-- Print freestanding-capable gap measure (diagnostic; not a perform claim).
    Theorems + smoke: SystemsLean.CapableTheorems. -/
def printGapMeasure : IO Unit := do
  IO.println s!"== {stageId}: freestanding product path freestanding-capable gap measure =="
  IO.println s!"  host: {hostId} / {selfHostId}"
  IO.println "  step capability (Lake-free / freestanding-capable product path):"
  IO.println s!"    INSTALL-OUT ({writerPathStepInstall}): {productPathFreestandingCapableInstallOnly} (B10 Lake-free install)"
  IO.println s!"    READ-SSOT ({gapReadSsot}): {productPathFreestandingCapableRead} (B14 CapableRead true after B26; just {productPathFreestandingCapableReadLakeFreeRecipe} token+HEADER/BODY no lake; B16 Lake exe freestandingCapableReadDualSsot remains diagnostic)"
  IO.println s!"    COMPOSE ({gapCompose}): {productPathFreestandingCapableCompose} (B14 CapableCompose true after B27; just {productPathFreestandingCapableComposeLakeFreeRecipe} plan/apply/body token+HEADER/BODY no lake; B17 Lake exe freestandingCapableComposePlanApplyBody remains diagnostic)"
  IO.println s!"    WRITE-HC ({gapWriteHc}): {productPathFreestandingCapableWriteHc} (B14 CapableWriteHc true after B28; just {productPathFreestandingCapableWriteHcLakeFreeRecipe} dual SSOT token+HEADER/BODY + write substrate no lake; B18 Lake exe freestandingCapableWriteFreestandingHc remains diagnostic)"
  IO.println s!"  full freestanding-capable perform: {productPathFreestandingCapableFullPerform}"
  IO.println s!"  ordered pipeline join: just {orderedPipelineRecipe} (read -> compose -> write-hc -> install)"
  IO.println s!"  Lake-free freestanding-capable READ: just {productPathFreestandingCapableReadLakeFreeRecipe}"
  IO.println s!"  Lake-free freestanding-capable COMPOSE: just {productPathFreestandingCapableComposeLakeFreeRecipe}"
  IO.println s!"  Lake-free freestanding-capable WRITE-HC: just {productPathFreestandingCapableWriteHcLakeFreeRecipe}"
  IO.println "  honest: pipeline is NOT freestanding-capable full close; CapableRead+Compose+WriteHc true; FullPerform false; B16/B17/B18 Lake exes remain diagnostic"
  IO.println "  not freestanding perform claimed; not residual free; not PROVABLY"
  if productPathFreestandingCapableOk then
    IO.println s!"GREEN {stageId}: gap measure surface ok (install+CapableRead+CapableCompose+CapableWriteHc Lake-free partial; full perform false)"
  else
    IO.eprintln s!"error: {stageId} gap measure surface not ok"
    throw (IO.userError "productPathFreestandingCapableOk false")

/-- CLI: print freestanding-capable gap measure. -/
def main (_args : List String) : IO UInt32 := do
  try
    printGapMeasure
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.Capable

-- Lake entry is SystemsLean.CapableMain (no top-level
-- main here so SelfApplyFs may import this API / Ok / PartialReady bulk
-- without main clash).
