/-
  SYSTEMS_LEAN_HOST partial -- PerformEvidence PERFORM-EVIDENCE-THEOREM + SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.PerformEvidence: theorems and behavioral smoke
  live here; stage ids, claim Bools, recipe/exe names, Ok / PartialReady folds,
  and diagnostic print/main stay in PerformEvidence. Same namespace
  SystemsLean.PerformEvidence so theorem names stay unqualified under that
  namespace.

  Spec (readable):
  - PERFORM-EVIDENCE-THEOREM / HOST-PERFORM-EVIDENCE-THEOREM: stageId_eq /
    hostId_eq / selfHostId_eq /
    productPathFreestandingPerformEvidenceOk_true /
    productPathFreestandingPerformEvidencePartialReady_true +
    evidence claimed true / perform claimed false / DependsOnLake true /
    Full long-name false + perform evidence step / recipe / exe / gap pins.
  - PERFORM-EVIDENCE-SMOKE / HOST-PERFORM-EVIDENCE-SMOKE: stage / map / Ok /
    PartialReady / claim bool behavioral examples (lake build fails if
    example fails).

  These PERFORM-EVIDENCE theorems do NOT flip freestanding residual free, llvm,
  or PROVABLY. Land-time perform claimed stays false on this home (living tip /
  PerformClaimed true after B39). Evidence claimed true is substrate only.
  Full long-name stays false (Full lives on StepContractFull). Complete true
  lives on tip / SelfHostComplete / StepContractFull dual-pin, not here.

  Intentional non-claims:
  - PERFORM-EVIDENCE surface honesty only -- NOT freestanding residual free.
  - NOT perform claimed flip here (PerformClaimed owns living tip true).
  - NOT Full / complete flip here.
  - NOT free / llvm / PROVABLY unlock.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, PERFORM-EVIDENCE-THEOREM,
  HOST-PERFORM-EVIDENCE-THEOREM, PERFORM-EVIDENCE-SMOKE,
  HOST-PERFORM-EVIDENCE-SMOKE, stageId_eq, hostId_eq, selfHostId_eq,
  productPathFreestandingPerformEvidenceOk_true,
  productPathFreestandingPerformEvidencePartialReady_true,
  productPathFreestandingPerformEvidenceClaimed_true,
  productPathFreestandingPerformClaimed_false,
  productPathPerformDependsOnLake_true,
  productPathFreestandingCapableStepContractFullSatisfied_false,
  performEvidenceId_eq, lakeFreeEvidenceRecipe_eq,
  lakeExeName_eq, justMeasureRecipe_eq,
  PerformEvidenceTheorems, UNIT_SURFACE host surface,
  RUNTIME-FS, SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE,
  FREESTANDING-PERFORM-EVIDENCE,
  FREESTANDING-PERFORM-EVIDENCE-READ-SSOT,
  FREESTANDING-PERFORM-EVIDENCE-COMPOSE,
  FREESTANDING-PERFORM-EVIDENCE-WRITE-HC,
  FREESTANDING-PERFORM-EVIDENCE-INSTALL-OUT,
  FREESTANDING-PERFORM-EVIDENCE-ORDERED,
  FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
  FREESTANDING-PERFORM-GAP-READ-SSOT,
  FREESTANDING-PERFORM-GAP-COMPOSE,
  FREESTANDING-PERFORM-GAP-WRITE-HC.
  Module: SystemsLean.PerformEvidenceTheorems
  Red/green: just systems-host; lake build SystemsLean.PerformEvidenceTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.PerformEvidence

namespace SystemsLean.PerformEvidence

/-! ### PERFORM-EVIDENCE-THEOREM / HOST-PERFORM-EVIDENCE-THEOREM

  Real Lean theorems (not only `example` Bool canaries). Scope is B31
  freestanding perform evidence surface honesty only. Does not flip residual
  free / llvm / PROVABLY; land-time perform claimed stays false; DependsOnLake
  stays true; Full long-name stays false. Evidence claimed true is substrate
  only (not perform claimed).
-/

/-- Primary stage id is greppable
    SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_EVIDENCE_V0.
    Greppable: stageId_eq, PERFORM-EVIDENCE-THEOREM,
    HOST-PERFORM-EVIDENCE-THEOREM. -/
theorem stageId_eq :
    stageId =
      "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_EVIDENCE_V0" :=
  rfl

/-- Host map id is greppable
    HOST-SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE.
    Greppable: hostId_eq, PERFORM-EVIDENCE-THEOREM. -/
theorem hostId_eq :
    hostId =
      "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE" :=
  rfl

/-- Short map id is greppable
    SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE.
    Greppable: selfHostId_eq, PERFORM-EVIDENCE-THEOREM. -/
theorem selfHostId_eq :
    selfHostId =
      "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE" :=
  rfl

/-- B31 freestanding perform evidence claimed pin holds.
    Greppable: productPathFreestandingPerformEvidenceClaimed_true,
    FREESTANDING-PERFORM-EVIDENCE, PERFORM-EVIDENCE-THEOREM. -/
theorem productPathFreestandingPerformEvidenceClaimed_true :
    productPathFreestandingPerformEvidenceClaimed = true :=
  rfl

/-- Land-time perform claimed stays false (evidence != perform claimed;
    living tip / PerformClaimed true after B39).
    Greppable: productPathFreestandingPerformClaimed_false,
    PERFORM-EVIDENCE-THEOREM. -/
theorem productPathFreestandingPerformClaimed_false :
    productPathFreestandingPerformClaimed = false := rfl

/-- Perform DependsOnLake remains true (official path Lake elaborator).
    Greppable: productPathPerformDependsOnLake_true,
    PERFORM-EVIDENCE-THEOREM. -/
theorem productPathPerformDependsOnLake_true :
    productPathPerformDependsOnLake = true := rfl

/-- Land-time Full long-name stays false (Full lives on StepContractFull).
    Greppable: productPathFreestandingCapableStepContractFullSatisfied_false,
    PERFORM-EVIDENCE-THEOREM. -/
theorem productPathFreestandingCapableStepContractFullSatisfied_false :
    productPathFreestandingCapableStepContractFullSatisfied = false := rfl

/-- Perform evidence surface Ok fold holds.
    Greppable: productPathFreestandingPerformEvidenceOk_true,
    PERFORM-EVIDENCE-THEOREM, HOST-PERFORM-EVIDENCE-THEOREM. -/
theorem productPathFreestandingPerformEvidenceOk_true :
    productPathFreestandingPerformEvidenceOk = true := by
  decide

/-- Perform evidence PartialReady fold holds (closed B31).
    Greppable: productPathFreestandingPerformEvidencePartialReady_true,
    SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE,
    PERFORM-EVIDENCE-THEOREM, HOST-PERFORM-EVIDENCE-THEOREM. -/
theorem productPathFreestandingPerformEvidencePartialReady_true :
    productPathFreestandingPerformEvidencePartialReady = true := by
  decide

/-- Named perform evidence token greppable. -/
theorem performEvidenceId_eq :
    performEvidenceId = "FREESTANDING-PERFORM-EVIDENCE" := rfl

/-- Named READ-SSOT evidence step token greppable. -/
theorem performEvidenceReadId_eq :
    performEvidenceReadId = "FREESTANDING-PERFORM-EVIDENCE-READ-SSOT" := rfl

/-- Named COMPOSE evidence step token greppable. -/
theorem performEvidenceComposeId_eq :
    performEvidenceComposeId = "FREESTANDING-PERFORM-EVIDENCE-COMPOSE" := rfl

/-- Named WRITE-HC evidence step token greppable. -/
theorem performEvidenceWriteHcId_eq :
    performEvidenceWriteHcId = "FREESTANDING-PERFORM-EVIDENCE-WRITE-HC" := rfl

/-- Named INSTALL-OUT evidence step token greppable. -/
theorem performEvidenceInstallId_eq :
    performEvidenceInstallId = "FREESTANDING-PERFORM-EVIDENCE-INSTALL-OUT" := rfl

/-- Named ORDERED evidence step token greppable. -/
theorem performEvidenceOrderedId_eq :
    performEvidenceOrderedId = "FREESTANDING-PERFORM-EVIDENCE-ORDERED" := rfl

/-- Full-bar perform claimed with evidence token greppable. -/
theorem fullBarReqPerformClaimedWithEvidence_eq :
    fullBarReqPerformClaimedWithEvidence =
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE" := rfl

/-- Named freestanding-capable READ gap token greppable. -/
theorem gapReadSsot_eq :
    gapReadSsot = "FREESTANDING-PERFORM-GAP-READ-SSOT" := rfl

/-- Named freestanding-capable COMPOSE gap token greppable. -/
theorem gapCompose_eq :
    gapCompose = "FREESTANDING-PERFORM-GAP-COMPOSE" := rfl

/-- Named freestanding-capable WRITE-HC gap token greppable. -/
theorem gapWriteHc_eq :
    gapWriteHc = "FREESTANDING-PERFORM-GAP-WRITE-HC" := rfl

/-- Freestanding-capable READ API cite greppable. -/
theorem freestandingCapableReadApi_eq :
    freestandingCapableReadApi = "freestandingCapableReadDualSsot" := rfl

/-- Freestanding-capable COMPOSE API cite greppable. -/
theorem freestandingCapableComposeApi_eq :
    freestandingCapableComposeApi =
      "freestandingCapableComposePlanApplyBody" := rfl

/-- Freestanding-capable WRITE-HC API cite greppable. -/
theorem freestandingCapableWriteHcApi_eq :
    freestandingCapableWriteHcApi =
      "freestandingCapableWriteFreestandingHc" := rfl

/-- Freestanding-capable INSTALL API cite greppable. -/
theorem freestandingCapableInstallApi_eq :
    freestandingCapableInstallApi =
      "freestandingCapableInstallFreestandingOut" := rfl

/-- Freestanding-capable ORDERED API cite greppable. -/
theorem freestandingCapableOrderedApi_eq :
    freestandingCapableOrderedApi =
      "freestandingCapableOrderedRegenerate" := rfl

/-- Ordered pipeline id greppable. -/
theorem orderedPipelineId_eq :
    orderedPipelineId =
      "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE" := rfl

/-- Lake-free evidence recipe name. -/
theorem lakeFreeEvidenceRecipe_eq :
    lakeFreeEvidenceRecipe = "freestanding-perform-evidence" := rfl

/-- Diagnostic just measure recipe name. -/
theorem justMeasureRecipe_eq :
    justMeasureRecipe = "freestanding-perform-evidence-measure" := rfl

/-- Diagnostic Lake exe name. -/
theorem lakeExeName_eq :
    lakeExeName = "slake-freestanding-perform-evidence" := rfl

/-- Shared Lake-free install recipe greppable. -/
theorem sharedInstallRecipe_eq :
    sharedInstallRecipe = "install-freestanding-c-out" := rfl

/-- CapableRead Lake-free recipe greppable. -/
theorem capableReadLakeFreeRecipe_eq :
    capableReadLakeFreeRecipe = "freestanding-capable-read-lake-free" := rfl

/-- CapableCompose Lake-free recipe greppable. -/
theorem capableComposeLakeFreeRecipe_eq :
    capableComposeLakeFreeRecipe =
      "freestanding-capable-compose-lake-free" := rfl

/-- CapableWriteHc Lake-free recipe greppable. -/
theorem capableWriteHcLakeFreeRecipe_eq :
    capableWriteHcLakeFreeRecipe =
      "freestanding-capable-write-hc-lake-free" := rfl

/-! ### PERFORM-EVIDENCE-SMOKE / HOST-PERFORM-EVIDENCE-SMOKE

  Behavioral `example` canaries. Lake build fails if any example fails.
-/

example :
    stageId =
      "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_EVIDENCE_V0" := by
  decide
example :
    hostId =
      "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE" := by
  decide
example :
    selfHostId =
      "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE" := by
  decide
example : productPathFreestandingPerformEvidenceClaimed = true := by decide
example : productPathFreestandingPerformClaimed = false := by decide
example : productPathPerformDependsOnLake = true := by decide
example : productPathFreestandingCapableStepContractFullSatisfied = false := by
  decide
example : productPathFreestandingPerformEvidenceOk = true := by decide
example :
    productPathFreestandingPerformEvidencePartialReady = true := by
  decide
example : performEvidenceId = "FREESTANDING-PERFORM-EVIDENCE" := by decide
example :
    lakeFreeEvidenceRecipe = "freestanding-perform-evidence" := by
  decide
example :
    lakeExeName = "slake-freestanding-perform-evidence" := by
  decide
example :
    justMeasureRecipe = "freestanding-perform-evidence-measure" := by
  decide
example : gapReadSsot = "FREESTANDING-PERFORM-GAP-READ-SSOT" := by decide
example : gapCompose = "FREESTANDING-PERFORM-GAP-COMPOSE" := by decide
example : gapWriteHc = "FREESTANDING-PERFORM-GAP-WRITE-HC" := by decide
example : sharedInstallRecipe = "install-freestanding-c-out" := by decide

end SystemsLean.PerformEvidence
