/-
  SYSTEMS_LEAN_HOST partial -- PerformClaimed
  PERFORM-CLAIMED-THEOREM + PERFORM-CLAIMED-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file peel from SystemsLean.PerformClaimed: theorems and behavioral
  smoke live here; stage ids, claim bool pins, recipe/exe names, Ok /
  PartialReady folds, and diagnostic print/main stay in PerformClaimed.
  Same namespace SystemsLean.PerformClaimed so theorem names stay unqualified
  under that namespace.

  Spec (readable):
  - PERFORM-CLAIMED-THEOREM / HOST-PERFORM-CLAIMED-THEOREM:
    stageId_eq / hostId_eq / selfHostId_eq /
    productPathFreestandingPerformClaimedOk_true /
    productPathFreestandingPerformClaimedPartialReady_true +
    measured / step advanced / perform claimed /
    official dual-eq WRITE surface pins + recipe/exe pins +
    land-time ownership false + Full long-name false + complete false.
  - PERFORM-CLAIMED-SMOKE / HOST-PERFORM-CLAIMED-SMOKE: stage / map /
    Ok / PartialReady / claim bool behavioral examples
    (lake build fails if example fails).

  These PERFORM-CLAIMED theorems do NOT flip freestanding residual free,
  llvm, or PROVABLY. Land-time ownership stays false on this home (living tip
  / OwnershipClaimed true after B40). Full long-name land-time pin stays false
  (Full lives on StepContractFull). Complete stays false (claim B on tip /
  SelfHostComplete / StepContractFull dual-pin).

  Intentional non-claims:
  - PERFORM-CLAIMED surface honesty only -- NOT freestanding residual free.
  - NOT ownership claimed flip here (OwnershipClaimed owns living tip true).
  - NOT Full / complete flip here.
  - NOT free / llvm / PROVABLY unlock.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, PERFORM-CLAIMED-THEOREM,
  HOST-PERFORM-CLAIMED-THEOREM, PERFORM-CLAIMED-SMOKE,
  HOST-PERFORM-CLAIMED-SMOKE, stageId_eq, hostId_eq, selfHostId_eq,
  productPathFreestandingPerformClaimedOk_true,
  productPathFreestandingPerformClaimedPartialReady_true,
  productPathFreestandingPerformClaimedMeasured_true,
  productPathFreestandingPerformClaimedStepAdvanced_true,
  productPathFreestandingPerformClaimed_true,
  productPathOfficialPathUsesDualEqualityWrite_true,
  productPathOfficialPathStillUsesFreestandingEmit_false,
  productPathOfficialPathStillUsesLake_false,
  productPathPerformDependsOnLake_false,
  productPathFreestandingOwnershipClaimed_false,
  freestandingProductSelfHostComplete_false,
  productPathFreestandingCapableStepContractFullSatisfied_false,
  performClaimedId_eq, lakeFreePerformClaimedRecipe_eq,
  lakeExeName_eq, justMeasureRecipe_eq,
  PerformClaimedTheorems, UNIT_SURFACE host surface,
  RUNTIME-FS, SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED,
  FREESTANDING-PERFORM-CLAIMED,
  FREESTANDING-PERFORM-CLAIMED-MEASURED,
  FREESTANDING-PERFORM-CLAIMED-STEP-ADVANCED.
  Module: SystemsLean.PerformClaimedTheorems
  Red/green: just systems-host; lake build
  SystemsLean.PerformClaimedTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.PerformClaimed

namespace SystemsLean.PerformClaimed

/-! ### PERFORM-CLAIMED-THEOREM / HOST-PERFORM-CLAIMED-THEOREM

  Real Lean theorems (not only `example` Bool canaries). Scope is B39
  PERFORM-CLAIMED surface honesty only. Does not flip residual free / llvm /
  PROVABLY; land-time ownership stays false; Full long-name stays false;
  complete stays false.
-/

/-- Primary stage id is greppable SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_CLAIMED_V0.
    Greppable: stageId_eq, PERFORM-CLAIMED-THEOREM,
    HOST-PERFORM-CLAIMED-THEOREM. -/
theorem stageId_eq :
    stageId = "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_CLAIMED_V0" := rfl

/-- Host map id is greppable HOST-SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED.
    Greppable: hostId_eq, PERFORM-CLAIMED-THEOREM. -/
theorem hostId_eq :
    hostId = "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED" := rfl

/-- Short map id is greppable SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED.
    Greppable: selfHostId_eq, PERFORM-CLAIMED-THEOREM. -/
theorem selfHostId_eq :
    selfHostId = "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED" := rfl

/-- PERFORM-CLAIMED measured pin holds.
    Greppable: productPathFreestandingPerformClaimedMeasured_true,
    FREESTANDING-PERFORM-CLAIMED, PERFORM-CLAIMED-THEOREM. -/
theorem productPathFreestandingPerformClaimedMeasured_true :
    productPathFreestandingPerformClaimedMeasured = true := rfl

/-- Close-path step PERFORM-CLAIMED advanced pin holds.
    Greppable: productPathFreestandingPerformClaimedStepAdvanced_true,
    FREESTANDING-PERFORM-CLAIMED-STEP-ADVANCED, PERFORM-CLAIMED-THEOREM. -/
theorem productPathFreestandingPerformClaimedStepAdvanced_true :
    productPathFreestandingPerformClaimedStepAdvanced = true := rfl

/-- Perform claimed dual-pin holds (tip SSoT is SelfApplyFs).
    Greppable: productPathFreestandingPerformClaimed_true,
    PERFORM-CLAIMED-THEOREM. -/
theorem productPathFreestandingPerformClaimed_true :
    productPathFreestandingPerformClaimed = true := rfl

/-- Official path uses dual-equality WRITE pin holds.
    Greppable: productPathOfficialPathUsesDualEqualityWrite_true,
    PERFORM-CLAIMED-THEOREM. -/
theorem productPathOfficialPathUsesDualEqualityWrite_true :
    productPathOfficialPathUsesDualEqualityWrite = true := rfl

/-- Official path FreestandingEmit retired pin holds (false = retired).
    Greppable: productPathOfficialPathStillUsesFreestandingEmit_false,
    PERFORM-CLAIMED-THEOREM. -/
theorem productPathOfficialPathStillUsesFreestandingEmit_false :
    productPathOfficialPathStillUsesFreestandingEmit = false := rfl

/-- Official path still uses Lake host elaborator pin holds.
    Greppable: productPathOfficialPathStillUsesLake_false,
    PERFORM-CLAIMED-THEOREM. -/
theorem productPathOfficialPathStillUsesLake_false :
    productPathOfficialPathStillUsesLake = false := rfl

/-- Perform DependsOnLake false after M6 product-path Lake pins flip.
    Greppable: productPathPerformDependsOnLake_false, PERFORM-CLAIMED-THEOREM. -/
theorem productPathPerformDependsOnLake_false :
    productPathPerformDependsOnLake = false := rfl

/-- Land-time ownership claimed stays false (ownership is B40 /
    OwnershipClaimed / tip dual-pin).
    Greppable: productPathFreestandingOwnershipClaimed_false,
    PERFORM-CLAIMED-THEOREM. -/
theorem productPathFreestandingOwnershipClaimed_false :
    productPathFreestandingOwnershipClaimed = false := rfl

/-- Land-time complete stays false on PERFORM-CLAIMED home (claim B is tip /
    SelfHostComplete / StepContractFull dual-pin).
    Greppable: freestandingProductSelfHostComplete_false,
    PERFORM-CLAIMED-THEOREM. -/
theorem freestandingProductSelfHostComplete_false :
    freestandingProductSelfHostComplete = false := rfl

/-- Land-time Full long-name stays false (Full lives on StepContractFull).
    Greppable: productPathFreestandingCapableStepContractFullSatisfied_false,
    PERFORM-CLAIMED-THEOREM. -/
theorem productPathFreestandingCapableStepContractFullSatisfied_false :
    productPathFreestandingCapableStepContractFullSatisfied = false := rfl

/-- B38 RETIRE-OFFICIAL measured pin remains.
    Greppable: productPathOfficialPathRetireOfficialMeasured_true,
    PERFORM-CLAIMED-THEOREM. -/
theorem productPathOfficialPathRetireOfficialMeasured_true :
    productPathOfficialPathRetireOfficialMeasured = true := rfl

/-- B37 CAPABLE-GAP measured pin remains.
    Greppable: productPathFreestandingPerformDualEqualityWriteCapableGapMeasured_true,
    PERFORM-CLAIMED-THEOREM. -/
theorem productPathFreestandingPerformDualEqualityWriteCapableGapMeasured_true :
    productPathFreestandingPerformDualEqualityWriteCapableGapMeasured =
      true := rfl

/-- Dual-equality WRITE parity gap stays closed (false = closed after B37).
    Greppable: productPathDualEqualityWriteParityGapOpen_false,
    PERFORM-CLAIMED-THEOREM. -/
theorem productPathDualEqualityWriteParityGapOpen_false :
    productPathDualEqualityWriteParityGapOpen = false := rfl

/-- Capable WRITE dual-equality live pin holds.
    Greppable: productPathCapableWriteDualEqualityLive_true,
    PERFORM-CLAIMED-THEOREM. -/
theorem productPathCapableWriteDualEqualityLive_true :
    productPathCapableWriteDualEqualityLive = true := rfl

/-- PERFORM-CLAIMED surface Ok fold holds.
    Greppable: productPathFreestandingPerformClaimedOk_true,
    PERFORM-CLAIMED-THEOREM, HOST-PERFORM-CLAIMED-THEOREM. -/
theorem productPathFreestandingPerformClaimedOk_true :
    productPathFreestandingPerformClaimedOk = true := by decide

/-- PERFORM-CLAIMED PartialReady fold holds (closed B39).
    Greppable: productPathFreestandingPerformClaimedPartialReady_true,
    SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED, PERFORM-CLAIMED-THEOREM,
    HOST-PERFORM-CLAIMED-THEOREM. -/
theorem productPathFreestandingPerformClaimedPartialReady_true :
    productPathFreestandingPerformClaimedPartialReady = true := by decide

/-- Named PERFORM-CLAIMED token greppable. -/
theorem performClaimedId_eq :
    performClaimedId = "FREESTANDING-PERFORM-CLAIMED" := rfl

/-- Named PERFORM-CLAIMED measured token greppable. -/
theorem performClaimedMeasuredId_eq :
    performClaimedMeasuredId =
      "FREESTANDING-PERFORM-CLAIMED-MEASURED" := rfl

/-- Named PERFORM-CLAIMED with official dual-eq WRITE token greppable. -/
theorem performClaimedWithOfficialDualEqWriteId_eq :
    performClaimedWithOfficialDualEqWriteId =
      "FREESTANDING-PERFORM-CLAIMED-WITH-OFFICIAL-DUAL-EQ-WRITE" := rfl

/-- Named PERFORM-CLAIMED step-advanced token greppable. -/
theorem performClaimedStepAdvancedId_eq :
    performClaimedStepAdvancedId =
      "FREESTANDING-PERFORM-CLAIMED-STEP-ADVANCED" := rfl

/-- Close-path step PERFORM-CLAIMED token greppable. -/
theorem closeStepPerformClaimed_eq :
    closeStepPerformClaimed =
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED" := rfl

/-- Close-path step RETIRE-OFFICIAL token greppable. -/
theorem closeStepRetireOfficial_eq :
    closeStepRetireOfficial =
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL" := rfl

/-- Close-path step CAPABLE-GAP token greppable. -/
theorem closeStepCapableGap_eq :
    closeStepCapableGap =
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP" := rfl

/-- Full-bar perform claimed with evidence token greppable. -/
theorem fullBarReqPerformClaimedWithEvidence_eq :
    fullBarReqPerformClaimedWithEvidence =
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE" := rfl

/-- Lake-free PERFORM-CLAIMED recipe name. -/
theorem lakeFreePerformClaimedRecipe_eq :
    lakeFreePerformClaimedRecipe = "freestanding-perform-claimed" := rfl

/-- Diagnostic Lake exe name. -/
theorem lakeExeName_eq :
    lakeExeName = "slake-freestanding-perform-claimed" := rfl

/-- Diagnostic just measure recipe name. -/
theorem justMeasureRecipe_eq :
    justMeasureRecipe = "freestanding-perform-claimed-measure" := rfl

/-- Official dual-eq writer API name. -/
theorem officialPathWriter_eq :
    officialPathWriter = "freestandingCapableOrderedRegenerate" := rfl

/-- Dual-equality gate id greppable. -/
theorem dualEqualityGateId_eq :
    dualEqualityGateId = "DUAL-SSOT-EQUALITY" := rfl

/-- Dual-equality API name greppable. -/
theorem dualEqualityApiName_eq :
    dualEqualityApiName = "requireDualSsotEqual" := rfl

/-- Capable WRITE module cite greppable. -/
theorem capableWriteModule_eq :
    capableWriteModule = "CapableWriteHc" := rfl

/-- Capable WRITE API cite greppable. -/
theorem capableWriteApi_eq :
    capableWriteApi = "freestandingCapableWriteFreestandingHc" := rfl

/-! ### PERFORM-CLAIMED-SMOKE / HOST-PERFORM-CLAIMED-SMOKE

  Behavioral `example` canaries. Lake build fails if any example fails.
-/

example : stageId = "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_CLAIMED_V0" := by
  decide
example : hostId = "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED" := by decide
example : selfHostId = "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED" := by decide
example : productPathFreestandingPerformClaimedMeasured = true := by decide
example : productPathFreestandingPerformClaimedStepAdvanced = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : productPathOfficialPathUsesDualEqualityWrite = true := by decide
example : productPathOfficialPathStillUsesFreestandingEmit = false := by decide
example : productPathOfficialPathStillUsesLake = false := by decide
example : productPathPerformDependsOnLake = false := by decide
example : productPathFreestandingOwnershipClaimed = false := by decide
example : freestandingProductSelfHostComplete = false := by decide
example : productPathFreestandingCapableStepContractFullSatisfied = false := by
  decide
example : productPathFreestandingPerformClaimedOk = true := by decide
example : productPathFreestandingPerformClaimedPartialReady = true := by decide
example : performClaimedId = "FREESTANDING-PERFORM-CLAIMED" := by decide
example : lakeFreePerformClaimedRecipe = "freestanding-perform-claimed" := by
  decide
example : lakeExeName = "slake-freestanding-perform-claimed" := by decide
example : justMeasureRecipe = "freestanding-perform-claimed-measure" := by
  decide
example : dualEqualityGateId = "DUAL-SSOT-EQUALITY" := by decide

end SystemsLean.PerformClaimed
