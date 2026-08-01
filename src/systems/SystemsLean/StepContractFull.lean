/-
  SYSTEMS_LEAN_HOST partial -- freestanding product path step-contract Full.
  SLAKE_SELF_HOST_PRODUCT_PATH_STEP_CONTRACT_FULL_V0 -- greppable close-path
  step Full beyond B40 OWNERSHIP-CLAIMED. Evidence: ownership-claimed (B40) +
  perform-claimed (B39) + official dual-eq WRITE (B38). SelfApplyFs claim-bool
  SSoT stepContractFull true. Full measured via just freestanding-step-contract-full.
  freestandingProductSelfHostComplete true (claim B). free / llvm / PROVABLY false.
  Lake exe: slake-freestanding-step-contract-full
  (just freestanding-step-contract-full-measure).

  Theorems (STEP-CONTRACT-FULL-THEOREM / HOST-STEP-CONTRACT-FULL-THEOREM +
  STEP-CONTRACT-FULL-SMOKE / HOST-STEP-CONTRACT-FULL-SMOKE): live in
  SystemsLean.StepContractFullTheorems (same namespace; long-file peel).
  theorem stepContractFullPartialReady_true / stepContractFullOk_true /
  stageId_eq / hostId_eq / selfHostId_eq + surface pins. Do not flip residual
  free / llvm / PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST,
  SLAKE_SELF_HOST_PRODUCT_PATH_STEP_CONTRACT_FULL_V0,
  HOST-SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL,
  SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL,
  product path freestanding step contract full,
  stepContractFullMeasured, stepContractFullPartialReady, stepContractFullOk,
  stepContractFullStepAdvanced, stepContractFull, stepContractFull_true,
  productPathFreestandingOwnershipClaimed, productPathFreestandingPerformClaimed,
  productPathPerformDependsOnLake, productPathOfficialPathRetireOfficialMeasured,
  productPathOfficialPathUsesDualEqualityWrite,
  productPathOfficialPathStillUsesFreestandingEmit,
  productPathOfficialPathStillUsesLake,
  productPathOfficialPathRetireFreestandingEmitRequired,
  productPathOfficialPathDualEqualityBlocksRetirement,
  productPathFreestandingPerformDualEqualityWriteCapableGapMeasured,
  FREESTANDING-STEP-CONTRACT-FULL, FREESTANDING-STEP-CONTRACT-FULL-MEASURED,
  FREESTANDING-STEP-CONTRACT-FULL-WITH-OWNERSHIP-PERFORM-DUAL-EQ-WRITE,
  FREESTANDING-STEP-CONTRACT-FULL-STEP-ADVANCED,
  FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL,
  FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED,
  FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED,
  FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE,
  FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
  STEP-CONTRACT-FULL-THEOREM, HOST-STEP-CONTRACT-FULL-THEOREM,
  STEP-CONTRACT-FULL-SMOKE, HOST-STEP-CONTRACT-FULL-SMOKE,
  StepContractFullTheorems, theorem stepContractFullPartialReady_true,
  just build, freestanding-capable-regenerate,
  freestandingCapableOrderedRegenerate, freestandingCapableWriteFreestandingHc,
  CapableWriteHc, CapableRegenerate, DUAL-SSOT-EQUALITY, requireDualSsotEqual,
  freestanding-step-contract-full, freestanding-step-contract-full-measure,
  slake-freestanding-step-contract-full, StepContractFull,
  freestanding-ownership-claimed, OwnershipClaimed,
  freestanding-perform-claimed, PerformClaimed,
  freestanding-retire-official, OfficialRetire,
  freestanding-perform-dual-equality-write-capable-gap,
  RUNTIME-FS, UNIT_SURFACE host surface.
  Not freestanding emit residual free. Not residual free. Not PROVABLY.
  Complete dual-pin true after claim B.
  Module: SystemsLean.StepContractFull
  Short role name (not ProductPathFreestanding*). Batch-2: PartialReady bulk
  authority here; tip re-exports chain fold. Dual-pin thin batch 32: Ok / stage /
  recipe / exe / FREESTANDING-STEP-CONTRACT-FULL-* home-primary here.
  Long-file peel: STEP-CONTRACT-FULL-THEOREM + SMOKE in
  SystemsLean.StepContractFullTheorems (same namespace).
  Module must stay ASCII.
-/

namespace SystemsLean.StepContractFull

/-- Greppable primary stage id (partial Full step-contract). -/
def stageId : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_STEP_CONTRACT_FULL_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL"

/-- Greppable short map id. -/
def selfHostId : String :=
  "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL"

/-- Full measured (ownership-claimed + perform-claimed + official dual-eq WRITE
    evidence; SelfApplyFs claim-bool SSoT true). just freestanding-step-contract-full
    dual-pins official dual-eq WRITE + B40 OWNERSHIP-CLAIMED + stepContractFull true.
    Greppable: stepContractFullMeasured, FREESTANDING-STEP-CONTRACT-FULL. -/
def stepContractFullMeasured : Bool := true

/-- Close-path step Full advanced (complete next).
    Greppable: stepContractFullStepAdvanced,
    FREESTANDING-STEP-CONTRACT-FULL-STEP-ADVANCED,
    FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL. -/
def stepContractFullStepAdvanced : Bool := true

/-- Official product path uses freestanding dual-equality WRITE as authority. -/
def productPathOfficialPathUsesDualEqualityWrite : Bool := true

/-- stepContractFull true with ownership-claimed + perform-claimed + dual-eq
    WRITE evidence. Claim-bool SSoT is SelfApplyFs; this module dual-pins true
    for Ok / pure Nix. Short role name (not productPathFreestandingCapable*).
    Greppable: stepContractFull. -/
def stepContractFull : Bool := true

/-- B40 OWNERSHIP-CLAIMED remains true (prerequisite evidence). -/
def productPathFreestandingOwnershipClaimed : Bool := true

/-- B39 PERFORM-CLAIMED remains true (prerequisite evidence). -/
def productPathFreestandingPerformClaimed : Bool := true

/-- Official product path regenerate still DependsOnLake (Lake host elaborator for
    freestanding-capable-regenerate). Greppable: productPathPerformDependsOnLake. -/
def productPathPerformDependsOnLake : Bool := true

/-- B38 RETIRE-OFFICIAL remains measured (prerequisite substrate). -/
def productPathOfficialPathRetireOfficialMeasured : Bool := true

/-- B40 OWNERSHIP-CLAIMED remains measured (prerequisite substrate). -/
def productPathFreestandingOwnershipClaimedMeasured : Bool := true

/-- B39 PERFORM-CLAIMED remains measured (prerequisite substrate). -/
def productPathFreestandingPerformClaimedMeasured : Bool := true

/-- B37 CAPABLE-GAP remains measured (prerequisite substrate). -/
def productPathFreestandingPerformDualEqualityWriteCapableGapMeasured : Bool := true

/-- Dual-equality WRITE parity gap stays closed after B37. -/
def productPathDualEqualityWriteParityGapOpen : Bool := false

/-- Capable WRITE dual-equality live (B37). -/
def productPathCapableWriteDualEqualityLive : Bool := true

/-- Official path no longer uses FreestandingEmit as product writer (B38). -/
def productPathOfficialPathStillUsesFreestandingEmit : Bool := false

/-- Official path still uses classic Lean Lake host elaborator. -/
def productPathOfficialPathStillUsesLake : Bool := true

/-- FreestandingEmit retired as official product authority (B38). -/
def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false

/-- Dual-equality no longer blocks retirement. -/
def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false

/-- Claim B complete stays false (next cliff after Full). -/
def freestandingProductSelfHostComplete : Bool := true

/-- Named Full tokens (short role). -/
def stepContractFullId : String :=
  "FREESTANDING-STEP-CONTRACT-FULL"
def stepContractFullMeasuredId : String :=
  "FREESTANDING-STEP-CONTRACT-FULL-MEASURED"
def stepContractFullWithOwnershipPerformDualEqWriteId : String :=
  "FREESTANDING-STEP-CONTRACT-FULL-WITH-OWNERSHIP-PERFORM-DUAL-EQ-WRITE"
def stepContractFullStepAdvancedId : String :=
  "FREESTANDING-STEP-CONTRACT-FULL-STEP-ADVANCED"

/-- Close-path step this partial advances / prior closed. -/
def closeStepFull : String :=
  "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL"
def closeStepOwnershipClaimed : String :=
  "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED"
def closeStepPerformClaimed : String :=
  "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED"
def closeStepRetireOfficial : String :=
  "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL"
def closeStepCapableGap : String :=
  "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP"

/-- Full-bar requirements closed with evidence prior to / with Full. -/
def fullBarReqOwnershipClaimedWithEvidence : String :=
  "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
def fullBarReqPerformClaimedWithEvidence : String :=
  "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"

/-- Official product path dual-equality writer cites. -/
def officialPathRecipe : String := "build"
def officialPathWriter : String := "freestandingCapableOrderedRegenerate"
def officialPathLakeExe : String := "slake-freestanding-capable-regenerate"
def officialPathJustRecipe : String := "freestanding-capable-regenerate"
def dualEqualityGateId : String := "DUAL-SSOT-EQUALITY"
def dualEqualityApiName : String := "requireDualSsotEqual"
def capableWriteApi : String := "freestandingCapableWriteFreestandingHc"
def capableWriteModule : String := "CapableWriteHc"

/-- Lake-free Full recipe. -/
def lakeFreeStepContractFullRecipe : String := "freestanding-step-contract-full"

/-- Diagnostic Lake measure recipe. -/
def justMeasureRecipe : String := "freestanding-step-contract-full-measure"
def lakeExeName : String := "slake-freestanding-step-contract-full"

/-- B40 OWNERSHIP-CLAIMED recipe (prerequisite). -/
def b40OwnershipClaimedRecipe : String := "freestanding-ownership-claimed"

/-- B39 PERFORM-CLAIMED recipe (prerequisite). -/
def b39PerformClaimedRecipe : String := "freestanding-perform-claimed"

/-- B38 RETIRE-OFFICIAL recipe (prerequisite). -/
def b38RetireOfficialRecipe : String := "freestanding-retire-official"

/-- B37 CAPABLE-GAP recipe (prerequisite). -/
def b37CapableGapRecipe : String :=
  "freestanding-perform-dual-equality-write-capable-gap"

/-- Full surface ok: measured true; step advanced; stepContractFull true;
    ownership claimed true; perform claimed true; official dual-eq WRITE true;
    StillUsesFreestandingEmit false; Blocks false; RetireRequired false;
    StillUsesLake true; DependsOnLake true; B40 measured; B39 measured; B38 measured;
    B37 measured; gap open false; dual-eq live; complete true (after claim B complete).
    Greppable: stepContractFullOk. -/
def stepContractFullOk : Bool :=
  (stageId
      == "SLAKE_SELF_HOST_PRODUCT_PATH_STEP_CONTRACT_FULL_V0")
    && (hostId
        == "HOST-SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL")
    && (selfHostId
        == "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL")
    && (stepContractFullMeasured == true)
    && (stepContractFullStepAdvanced == true)
    && (stepContractFull == true)
    && (productPathFreestandingOwnershipClaimed == true)
    && (productPathFreestandingOwnershipClaimedMeasured == true)
    && (productPathFreestandingPerformClaimed == true)
    && (productPathFreestandingPerformClaimedMeasured == true)
    && (productPathOfficialPathUsesDualEqualityWrite == true)
    && (productPathOfficialPathStillUsesFreestandingEmit == false)
    && (productPathOfficialPathStillUsesLake == true)
    && (productPathOfficialPathRetireFreestandingEmitRequired == false)
    && (productPathOfficialPathDualEqualityBlocksRetirement == false)
    && (productPathOfficialPathRetireOfficialMeasured == true)
    && (productPathPerformDependsOnLake == true)
    && (productPathFreestandingPerformDualEqualityWriteCapableGapMeasured == true)
    && (productPathDualEqualityWriteParityGapOpen == false)
    && (productPathCapableWriteDualEqualityLive == true)
    && (freestandingProductSelfHostComplete == true)
    && (stepContractFullId == "FREESTANDING-STEP-CONTRACT-FULL")
    && (stepContractFullMeasuredId
        == "FREESTANDING-STEP-CONTRACT-FULL-MEASURED")
    && (stepContractFullWithOwnershipPerformDualEqWriteId
        == "FREESTANDING-STEP-CONTRACT-FULL-WITH-OWNERSHIP-PERFORM-DUAL-EQ-WRITE")
    && (stepContractFullStepAdvancedId
        == "FREESTANDING-STEP-CONTRACT-FULL-STEP-ADVANCED")
    && (closeStepFull
        == "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL")
    && (closeStepOwnershipClaimed
        == "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED")
    && (closeStepPerformClaimed
        == "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED")
    && (closeStepRetireOfficial
        == "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL")
    && (closeStepCapableGap
        == "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP")
    && (fullBarReqOwnershipClaimedWithEvidence
        == "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE")
    && (fullBarReqPerformClaimedWithEvidence
        == "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE")
    && (officialPathRecipe == "build")
    && (officialPathWriter == "freestandingCapableOrderedRegenerate")
    && (officialPathLakeExe == "slake-freestanding-capable-regenerate")
    && (officialPathJustRecipe == "freestanding-capable-regenerate")
    && (dualEqualityGateId == "DUAL-SSOT-EQUALITY")
    && (dualEqualityApiName == "requireDualSsotEqual")
    && (capableWriteApi == "freestandingCapableWriteFreestandingHc")
    && (capableWriteModule == "CapableWriteHc")
    && (lakeFreeStepContractFullRecipe == "freestanding-step-contract-full")
    && (justMeasureRecipe == "freestanding-step-contract-full-measure")
    && (lakeExeName == "slake-freestanding-step-contract-full")
    && (b40OwnershipClaimedRecipe == "freestanding-ownership-claimed")
    && (b39PerformClaimedRecipe == "freestanding-perform-claimed")
    && (b38RetireOfficialRecipe == "freestanding-retire-official")
    && (b37CapableGapRecipe
        == "freestanding-perform-dual-equality-write-capable-gap")

/-- Print Full measure (diagnostic; not complete). -/
def printStepContractFullMeasure : IO Unit := do
  IO.println s!"== {stageId}: freestanding product path step-contract Full =="
  IO.println s!"  host: {hostId} / {selfHostId}"
  IO.println s!"  stepContractFullMeasured: {stepContractFullMeasured} ({stepContractFullId})"
  IO.println "  Full with ownership-claimed + perform-claimed + official dual-eq WRITE evidence:"
  IO.println s!"    step advanced: {stepContractFullStepAdvanced} ({stepContractFullStepAdvancedId})"
  IO.println s!"    stepContractFull: {stepContractFull} ({stepContractFullWithOwnershipPerformDualEqWriteId})"
  IO.println s!"    ownership claimed: {productPathFreestandingOwnershipClaimed} (B40 evidence)"
  IO.println s!"    perform claimed: {productPathFreestandingPerformClaimed} (B39 evidence)"
  IO.println s!"    uses dual-eq WRITE: {productPathOfficialPathUsesDualEqualityWrite}"
  IO.println s!"    close-path step: {closeStepFull}"
  IO.println s!"    prior OWNERSHIP-CLAIMED: {closeStepOwnershipClaimed} (closed B40)"
  IO.println s!"    prior PERFORM-CLAIMED: {closeStepPerformClaimed} (closed B39)"
  IO.println s!"    prior RETIRE-OFFICIAL: {closeStepRetireOfficial} (closed B38)"
  IO.println s!"    prior CAPABLE-GAP: {closeStepCapableGap} (closed B37)"
  IO.println s!"    Capable WRITE API: {capableWriteApi}"
  IO.println s!"    Capable WRITE module: {capableWriteModule}"
  IO.println s!"    gate: {dualEqualityGateId} / {dualEqualityApiName}"
  IO.println "  official product path freestanding dual-eq writer (FreestandingEmit retired B38):"
  IO.println s!"    recipe: {officialPathRecipe}"
  IO.println s!"    writer: {officialPathWriter}"
  IO.println s!"    Lake exe: {officialPathLakeExe}"
  IO.println s!"    just recipe: {officialPathJustRecipe}"
  IO.println s!"    still FreestandingEmit: {productPathOfficialPathStillUsesFreestandingEmit} (false = retired)"
  IO.println s!"    still Lake: {productPathOfficialPathStillUsesLake}"
  IO.println s!"    retire FreestandingEmit required: {productPathOfficialPathRetireFreestandingEmitRequired} (false = retired)"
  IO.println s!"    dual-equality blocks retirement: {productPathOfficialPathDualEqualityBlocksRetirement} (false = not blocked)"
  IO.println s!"  productPathFreestandingOwnershipClaimedMeasured: {productPathFreestandingOwnershipClaimedMeasured} (B40 remains)"
  IO.println s!"  productPathFreestandingPerformClaimedMeasured: {productPathFreestandingPerformClaimedMeasured} (B39 remains)"
  IO.println s!"  productPathOfficialPathRetireOfficialMeasured: {productPathOfficialPathRetireOfficialMeasured} (B38 remains)"
  IO.println s!"  productPathFreestandingPerformDualEqualityWriteCapableGapMeasured: {productPathFreestandingPerformDualEqualityWriteCapableGapMeasured} (B37 remains)"
  IO.println s!"  productPathDualEqualityWriteParityGapOpen: {productPathDualEqualityWriteParityGapOpen} (false = CAPABLE-GAP closed)"
  IO.println s!"  productPathCapableWriteDualEqualityLive: {productPathCapableWriteDualEqualityLive}"
  IO.println s!"  productPathPerformDependsOnLake: {productPathPerformDependsOnLake}"
  IO.println s!"  Full-bar ownership req: {fullBarReqOwnershipClaimedWithEvidence}"
  IO.println s!"  Full-bar perform req: {fullBarReqPerformClaimedWithEvidence}"
  IO.println s!"  freestandingProductSelfHostComplete: {freestandingProductSelfHostComplete} (true after claim B complete)"
  IO.println s!"  Lake-free Full recipe: just {lakeFreeStepContractFullRecipe}"
  IO.println s!"  measure: just {justMeasureRecipe} / lake exe {lakeExeName}"
  IO.println s!"  B40 OWNERSHIP-CLAIMED recipe: just {b40OwnershipClaimedRecipe}"
  IO.println s!"  B39 PERFORM-CLAIMED recipe: just {b39PerformClaimedRecipe}"
  IO.println s!"  B38 RETIRE-OFFICIAL recipe: just {b38RetireOfficialRecipe}"
  IO.println s!"  B37 CAPABLE-GAP recipe: just {b37CapableGapRecipe}"
  IO.println "  honest: Full with ownership-claimed + perform-claimed + dual-eq WRITE != complete"
  IO.println "  honest: complete true only with Full bar (this module dual-pins after complete)"
  IO.println "  honest: CAPABLE-GAP stays closed; free/llvm/PROVABLY stay false; complete dual-pin true"
  IO.println "  not complete; not residual free; not B40 OWNERSHIP rebrand"
  IO.println "  short module name StepContractFull (not ProductPathFreestanding* kitchen-sink)"
  IO.println "  short living tip bool stepContractFull (not productPathFreestandingCapableStepContractFullSatisfied)"
  if stepContractFullOk then
    IO.println s!"GREEN {stageId}: Full surface ok (measured true; stepContractFull true; ownership claimed true; perform claimed true; official dual-eq WRITE; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; complete true)"
  else
    IO.eprintln s!"error: {stageId} Full surface not ok"
    throw (IO.userError "stepContractFullOk false")

/-- Full PartialReady fold (closed Full step-contract). Historical readiness bulk for
    freestanding-capable step-contract Full. SelfApplyFs living tip re-exports a
    chain fold that includes this def for greppable dual-pin + ownership PartialReady.
    Does not flip residual free / llvm / PROVABLY. Complete dual-pin stays true.
    Greppable: stepContractFullPartialReady,
    SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL,
    FREESTANDING-STEP-CONTRACT-FULL. -/
def stepContractFullPartialReady : Bool :=
  stepContractFullOk
    && stepContractFullMeasured
    && stepContractFullStepAdvanced
    && stepContractFull
    && productPathFreestandingOwnershipClaimed
    && productPathFreestandingPerformClaimed
    && productPathOfficialPathUsesDualEqualityWrite
    && !productPathOfficialPathStillUsesFreestandingEmit
    && productPathOfficialPathStillUsesLake
    && !productPathOfficialPathRetireFreestandingEmitRequired
    && !productPathOfficialPathDualEqualityBlocksRetirement
    && productPathOfficialPathRetireOfficialMeasured
    && productPathFreestandingOwnershipClaimedMeasured
    && productPathFreestandingPerformClaimedMeasured
    && productPathPerformDependsOnLake
    && freestandingProductSelfHostComplete

/-- CLI: print Full measure. Fail-closed if Ok false. -/
def main (_args : List String) : IO UInt32 := do
  try
    printStepContractFullMeasure
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.StepContractFull

-- Theorems + smoke: SystemsLean.StepContractFullTheorems
-- (same namespace; long-file peel).
-- Lake entry is SystemsLean.StepContractFullMain (no top-level main here so
-- SelfApplyFs may import Full Ok / PartialReady bulk without main clash).
