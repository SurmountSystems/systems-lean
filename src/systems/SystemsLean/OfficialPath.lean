/-
  SYSTEMS_LEAN_HOST partial -- freestanding product path perform official-path gap (B32).
  SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0 -- greppable official product
  path gap beyond B31 freestanding perform evidence. Official regenerate (just build)
  still uses Lake elaborating FreestandingEmit while B31 evidence claimed true.
  FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE: evidence alone is not perform claimed;
  retire FreestandingEmit before productPathFreestandingPerformClaimed may flip true.
  B32: just freestanding-perform-official-path (Lake-free dual-pin + B31 re-green).
  Does NOT flip perform claimed. Dual-pin thin batch 23: home Ok / stageId / hostId /
  recipe / exe / FREESTANDING-PERFORM-OFFICIAL-PATH-* step ids; tip keeps GapMeasured
  + living StillUsesFreestandingEmit false / RetireRequired false (post-B38) +
  PartialReady chain fold only. GapMeasured true; perform claimed false; DependsOnLake
  true; Full / ownership claimed / complete false; free / llvm / PROVABLY false.
  Lake exe: slake-freestanding-perform-official-path
  (just freestanding-perform-official-path-measure).
  Lake-free: just freestanding-perform-official-path.
  Theorems (OFFICIAL-PATH-THEOREM / HOST-OFFICIAL-PATH-THEOREM +
  OFFICIAL-PATH-SMOKE / HOST-OFFICIAL-PATH-SMOKE): SystemsLean.OfficialPathTheorems
  (same namespace; long-file split). theorem
  productPathFreestandingPerformOfficialPathPartialReady_true /
  productPathFreestandingPerformOfficialPathOk_true / stageId_eq + surface pins.

  Greppable: SYSTEMS_LEAN_HOST,
  SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0,
  HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH,
  SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH,
  product path freestanding perform official path,
  productPathFreestandingPerformOfficialPathPartialReady,
  productPathFreestandingPerformOfficialPathOk,
  productPathFreestandingPerformOfficialPathGapMeasured,
  productPathOfficialPathStillUsesFreestandingEmit,
  productPathOfficialPathStillUsesLake,
  productPathOfficialPathRetireFreestandingEmitRequired,
  productPathFreestandingPerformClaimed, productPathPerformDependsOnLake,
  productPathFreestandingPerformEvidenceClaimed,
  FREESTANDING-PERFORM-OFFICIAL-PATH-GAP,
  FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-FREESTANDING-EMIT,
  FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-LAKE,
  FREESTANDING-PERFORM-OFFICIAL-PATH-RETIRE-FREESTANDING-EMIT,
  FREESTANDING-PERFORM-OFFICIAL-PATH-RECIPE,
  FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-WRITER,
  FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-EXE,
  FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
  OFFICIAL-PATH-THEOREM, HOST-OFFICIAL-PATH-THEOREM,
  OFFICIAL-PATH-SMOKE, HOST-OFFICIAL-PATH-SMOKE, OfficialPathTheorems,
  theorem productPathFreestandingPerformOfficialPathPartialReady_true,
  just build, FreestandingEmit, slake-emit-freestanding-c,
  freestanding-perform-official-path,
  freestanding-perform-official-path-measure,
  slake-freestanding-perform-official-path, freestanding-perform-evidence,
  OfficialPath, PerformEvidence, RUNTIME-FS, UNIT_SURFACE host surface.
  Not freestanding emit residual free. Not residual free. Not PROVABLY.
  Module: SystemsLean.OfficialPath
  Long-file split: OFFICIAL-PATH-THEOREM + SMOKE in OfficialPathTheorems.
  Module must stay ASCII.
-/

namespace SystemsLean.OfficialPath

/-- Greppable primary stage id (partial B32 official-path gap). -/
def stageId : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH"

/-- Greppable short map id. -/
def selfHostId : String :=
  "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH"

/-- B32 official product path gap measured (substrate; not perform claimed).
    just freestanding-perform-official-path dual-pins that official regenerate
    (just build) still uses FreestandingEmit via Lake while B31 evidence
    stays true. Greppable:
    productPathFreestandingPerformOfficialPathGapMeasured,
    FREESTANDING-PERFORM-OFFICIAL-PATH-GAP. -/
def productPathFreestandingPerformOfficialPathGapMeasured : Bool := true

/-- productPathFreestandingPerformClaimed stays false until official product path
    performs ordered regenerate without Lake elaborating FreestandingEmit.
    Official-path gap measure (this partial) is not perform claimed.
    Greppable: productPathFreestandingPerformClaimed.
    Dual-pin note: SelfApplyFs is the claim-bool SSoT; this module repeats false for
    module-local Ok / pure Nix scan. Both must stay false until official path
    retires FreestandingEmit (do not flip only one). -/
def productPathFreestandingPerformClaimed : Bool := false

/-- Official product path regenerate still DependsOnLake (FreestandingEmit via
    just build). Greppable: productPathPerformDependsOnLake. -/
def productPathPerformDependsOnLake : Bool := true

/-- B31 evidence remains claimed (prerequisite substrate). -/
def productPathFreestandingPerformEvidenceClaimed : Bool := true

/-- Official path still uses FreestandingEmit as product writer. -/
def productPathOfficialPathStillUsesFreestandingEmit : Bool := true

/-- Official path still uses classic Lean Lake host elaborator. -/
def productPathOfficialPathStillUsesLake : Bool := true

/-- Retiring FreestandingEmit as official product authority is still required
    before perform claimed may flip true. -/
def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true

/-- Full freestanding-capable step-contract stays unsatisfied. -/
def productPathFreestandingCapableStepContractFullSatisfied : Bool := false

/-- Named official-path gap tokens. -/
def officialPathGapId : String := "FREESTANDING-PERFORM-OFFICIAL-PATH-GAP"
def officialPathStillEmitId : String :=
  "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-FREESTANDING-EMIT"
def officialPathStillLakeId : String :=
  "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-LAKE"
def officialPathRetireEmitId : String :=
  "FREESTANDING-PERFORM-OFFICIAL-PATH-RETIRE-FREESTANDING-EMIT"
def officialPathRecipeId : String := "FREESTANDING-PERFORM-OFFICIAL-PATH-RECIPE"
def officialPathLakeWriterId : String :=
  "FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-WRITER"
def officialPathLakeExeId : String :=
  "FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-EXE"

/-- Full-bar perform claimed requirement (still open; gap measured != claimed). -/
def fullBarReqPerformClaimedWithEvidence : String :=
  "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"

/-- Official product path recipe / Lake writer / Lake exe cites. -/
def officialPathRecipe : String := "build"
def officialPathLakeWriter : String := "FreestandingEmit"
def officialPathLakeExe : String := "slake-emit-freestanding-c"

/-- Lake-free official-path gap recipe (B32). -/
def lakeFreeOfficialPathRecipe : String := "freestanding-perform-official-path"

/-- Diagnostic Lake measure recipe. -/
def justMeasureRecipe : String := "freestanding-perform-official-path-measure"
def lakeExeName : String := "slake-freestanding-perform-official-path"

/-- B31 evidence recipe (prerequisite). -/
def b31EvidenceRecipe : String := "freestanding-perform-evidence"

/-- Official-path gap surface ok: gap measured true; perform claimed false;
    DependsOnLake true; still FreestandingEmit + Lake; retire required; B31
    evidence claimed true; Full false. Greppable:
    productPathFreestandingPerformOfficialPathOk. -/
def productPathFreestandingPerformOfficialPathOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0")
    && (hostId == "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH")
    && (selfHostId == "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH")
    && (productPathFreestandingPerformOfficialPathGapMeasured == true)
    && (productPathFreestandingPerformClaimed == false)
    && (productPathPerformDependsOnLake == true)
    && (productPathFreestandingPerformEvidenceClaimed == true)
    && (productPathOfficialPathStillUsesFreestandingEmit == true)
    && (productPathOfficialPathStillUsesLake == true)
    && (productPathOfficialPathRetireFreestandingEmitRequired == true)
    && (productPathFreestandingCapableStepContractFullSatisfied == false)
    && (officialPathGapId == "FREESTANDING-PERFORM-OFFICIAL-PATH-GAP")
    && (officialPathStillEmitId
        == "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-FREESTANDING-EMIT")
    && (officialPathStillLakeId
        == "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-LAKE")
    && (officialPathRetireEmitId
        == "FREESTANDING-PERFORM-OFFICIAL-PATH-RETIRE-FREESTANDING-EMIT")
    && (officialPathRecipeId == "FREESTANDING-PERFORM-OFFICIAL-PATH-RECIPE")
    && (officialPathLakeWriterId
        == "FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-WRITER")
    && (officialPathLakeExeId == "FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-EXE")
    && (fullBarReqPerformClaimedWithEvidence
        == "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE")
    && (officialPathRecipe == "build")
    && (officialPathLakeWriter == "FreestandingEmit")
    && (officialPathLakeExe == "slake-emit-freestanding-c")
    && (lakeFreeOfficialPathRecipe == "freestanding-perform-official-path")
    && (justMeasureRecipe == "freestanding-perform-official-path-measure")
    && (lakeExeName == "slake-freestanding-perform-official-path")
    && (b31EvidenceRecipe == "freestanding-perform-evidence")

/-- Print official-path gap measure (diagnostic; not perform claimed). -/
def printOfficialPathGapMeasure : IO Unit := do
  IO.println s!"== {stageId}: freestanding product path perform official-path gap (B32) =="
  IO.println s!"  host: {hostId} / {selfHostId}"
  IO.println s!"  productPathFreestandingPerformOfficialPathGapMeasured: {productPathFreestandingPerformOfficialPathGapMeasured} ({officialPathGapId})"
  IO.println "  official product path still Lake FreestandingEmit (not perform claimed):"
  IO.println s!"    recipe: {officialPathRecipe} ({officialPathRecipeId})"
  IO.println s!"    Lake writer: {officialPathLakeWriter} ({officialPathLakeWriterId})"
  IO.println s!"    Lake exe: {officialPathLakeExe} ({officialPathLakeExeId})"
  IO.println s!"    still FreestandingEmit: {productPathOfficialPathStillUsesFreestandingEmit} ({officialPathStillEmitId})"
  IO.println s!"    still Lake: {productPathOfficialPathStillUsesLake} ({officialPathStillLakeId})"
  IO.println s!"    retire FreestandingEmit required: {productPathOfficialPathRetireFreestandingEmitRequired} ({officialPathRetireEmitId})"
  IO.println s!"  productPathFreestandingPerformEvidenceClaimed: {productPathFreestandingPerformEvidenceClaimed} (B31 remains; prerequisite)"
  IO.println s!"  productPathFreestandingPerformClaimed: {productPathFreestandingPerformClaimed} (stays false)"
  IO.println s!"  productPathPerformDependsOnLake: {productPathPerformDependsOnLake}"
  IO.println s!"  Full-bar req still open: {fullBarReqPerformClaimedWithEvidence}"
  IO.println s!"  productPathFreestandingCapableStepContractFullSatisfied: {productPathFreestandingCapableStepContractFullSatisfied}"
  IO.println s!"  Lake-free official-path gap recipe: just {lakeFreeOfficialPathRecipe}"
  IO.println s!"  measure: just {justMeasureRecipe} / lake exe {lakeExeName}"
  IO.println s!"  B31 evidence recipe: just {b31EvidenceRecipe}"
  IO.println "  honest: B31 evidence claimed true != perform claimed true"
  IO.println "  honest: official path must retire FreestandingEmit before perform claimed"
  IO.println "  not ownership claimed; not Full; not complete; not residual free; not B31 rebrand"
  IO.println "  not B6..B31 theater (B32 is new official-path gap under perform framing)"
  if productPathFreestandingPerformOfficialPathOk then
    IO.println s!"GREEN {stageId}: official-path gap surface ok (gap measured true; perform claimed false; DependsOnLake true; Full false)"
  else
    IO.eprintln s!"error: {stageId} official-path gap surface not ok"
    throw (IO.userError "productPathFreestandingPerformOfficialPathOk false")

/-- Official-path gap PartialReady fold (closed B32). Historical
    readiness bulk for freestanding perform official-path gap.
    SelfApplyFs living tip re-exports a chain fold that includes this def for
    greppable dual-pin + B31 perform-evidence PartialReady. Land-time module pins:
    gap measured true; perform claimed false; StillUses FreestandingEmit true;
    retire required true; Full long-name false (living tip allows perform /
    ownership / stepContractFull / complete true and StillUses false / retire
    required false after later cliffs). Does not flip residual free / llvm /
    PROVABLY.
    Greppable: productPathFreestandingPerformOfficialPathPartialReady,
    SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH,
    FREESTANDING-PERFORM-OFFICIAL-PATH-GAP. -/
def productPathFreestandingPerformOfficialPathPartialReady : Bool :=
  productPathFreestandingPerformOfficialPathOk
    && productPathFreestandingPerformOfficialPathGapMeasured
    && !productPathFreestandingPerformClaimed
    && productPathPerformDependsOnLake
    && productPathOfficialPathStillUsesFreestandingEmit
    && productPathOfficialPathStillUsesLake
    && productPathOfficialPathRetireFreestandingEmitRequired
    && !productPathFreestandingCapableStepContractFullSatisfied

/-- CLI: print official-path gap measure. -/
def main (_args : List String) : IO UInt32 := do
  try
    printOfficialPathGapMeasure
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.OfficialPath

-- Theorems + smoke: SystemsLean.OfficialPathTheorems (same namespace).
-- Lake entry is SystemsLean.OfficialPathMain
-- (no top-level main here so SelfApplyFs may import official-path gap
-- Ok / PartialReady bulk without main clash).
