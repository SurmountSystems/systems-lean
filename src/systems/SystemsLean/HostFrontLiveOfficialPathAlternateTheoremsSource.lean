/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live OfficialPathAlternateTheorems.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveOfficialPathAlternateTheoremsSource.
  Not occupancy name 50. Not mill 70.
  This wrap is OfficialPathAlternateTheorems.lean.
  It is not OfficialPathAlternate.lean.
  Greppable: SYSTEMS_LEAN_HOST, OFFICIAL-PATH-ALTERNATE-THEOREM,
  liveOfficialPathAlternateTheoremsSource,
  HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveOfficialPathAlternateTheoremsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveOfficialPathAlternateTheorems

/-- Dual-pinned live OfficialPathAlternateTheorems.lean bytes (must match on-disk file).
    Greppable: liveOfficialPathAlternateTheoremsSource,
    OFFICIAL-PATH-ALTERNATE-THEOREM. -/
def liveOfficialPathAlternateTheoremsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- OfficialPathAlternate
  OFFICIAL-PATH-ALTERNATE-THEOREM + OFFICIAL-PATH-ALTERNATE-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.OfficialPathAlternate: theorems and behavioral
  smoke live here; stage ids, claim bool pins, recipe/exe names, Ok /
  PartialReady folds, and diagnostic print/main stay in OfficialPathAlternate.
  Same namespace SystemsLean.OfficialPathAlternate so theorem names stay
  unqualified under that namespace.

  Spec (readable):
  - OFFICIAL-PATH-ALTERNATE-THEOREM / HOST-OFFICIAL-PATH-ALTERNATE-THEOREM:
    stageId_eq / hostId_eq / selfHostId_eq /
    productPathFreestandingPerformOfficialPathAlternateOk_true /
    productPathFreestandingPerformOfficialPathAlternatePartialReady_true +
    measured / writer present / AlternateNotOfficial land-time true /
    dual-equality blocks land-time true / perform claimed false /
    StillUses FreestandingEmit true / Full long-name false + recipe/exe pins.
  - OFFICIAL-PATH-ALTERNATE-SMOKE / HOST-OFFICIAL-PATH-ALTERNATE-SMOKE:
    stage / map / Ok / PartialReady / claim bool behavioral examples
    (lake build fails if example fails).

  These OFFICIAL-PATH-ALTERNATE theorems do NOT flip freestanding residual free,
  llvm, or PROVABLY. Land-time perform claimed stays false on this home
  (living tip / PerformClaimed true after B39). StillUses FreestandingEmit
  stays true (land-time B33; living tip retired after B38). AlternateNotOfficial
  stays true on this home (land-time B33; living tip false after B38 when same
  writer is official just build). Full long-name stays false (Full lives on
  StepContractFull). Complete true lives on tip / SelfHostComplete /
  StepContractFull dual-pin, not here.

  Intentional non-claims:
  - OFFICIAL-PATH-ALTERNATE surface honesty only -- NOT freestanding residual free.
  - NOT perform claimed flip here (PerformClaimed owns living tip true).
  - NOT AlternateNotOfficial living tip false here (SelfApplyFs / OfficialRetire).
  - NOT Full / complete flip here.
  - NOT free / llvm / PROVABLY unlock.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, OFFICIAL-PATH-ALTERNATE-THEOREM,
  HOST-OFFICIAL-PATH-ALTERNATE-THEOREM, OFFICIAL-PATH-ALTERNATE-SMOKE,
  HOST-OFFICIAL-PATH-ALTERNATE-SMOKE, stageId_eq, hostId_eq, selfHostId_eq,
  productPathFreestandingPerformOfficialPathAlternateOk_true,
  productPathFreestandingPerformOfficialPathAlternatePartialReady_true,
  productPathFreestandingPerformOfficialPathAlternateMeasured_true,
  productPathOfficialPathAlternateWriterPresent_true,
  productPathOfficialPathAlternateNotOfficial_true,
  productPathOfficialPathDualEqualityBlocksRetirement_true,
  productPathFreestandingPerformClaimed_false,
  productPathOfficialPathStillUsesFreestandingEmit_true,
  productPathPerformDependsOnLake_true,
  productPathFreestandingCapableStepContractFullSatisfied_false,
  officialPathAlternateId_eq, lakeFreeAlternateRecipe_eq,
  lakeExeName_eq, justMeasureRecipe_eq,
  OfficialPathAlternateTheorems, UNIT_SURFACE host surface,
  RUNTIME-FS, SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE,
  FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE,
  FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-WRITER,
  FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-NOT-OFFICIAL,
  FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT.
  Module: SystemsLean.OfficialPathAlternateTheorems
  Red/green: just systems-host; lake build
  SystemsLean.OfficialPathAlternateTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.OfficialPathAlternate

namespace SystemsLean.OfficialPathAlternate

/-! ### OFFICIAL-PATH-ALTERNATE-THEOREM / HOST-OFFICIAL-PATH-ALTERNATE-THEOREM

  Real Lean theorems (not only `example` Bool canaries). Scope is B33
  official-path alternate surface honesty only. Does not flip residual
  free / llvm / PROVABLY; land-time perform claimed stays false; StillUses
  FreestandingEmit stays true; AlternateNotOfficial stays true; Full
  long-name stays false.
-/

/-- Primary stage id is greppable
    SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_ALTERNATE_V0.
    Greppable: stageId_eq, OFFICIAL-PATH-ALTERNATE-THEOREM,
    HOST-OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem stageId_eq :
    stageId =
      "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_ALTERNATE_V0" :=
  rfl

/-- Host map id is greppable
    HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE.
    Greppable: hostId_eq, OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem hostId_eq :
    hostId =
      "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE" :=
  rfl

/-- Short map id is greppable
    SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE.
    Greppable: selfHostId_eq, OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem selfHostId_eq :
    selfHostId =
      "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE" :=
  rfl

/-- Official-path alternate measured pin holds.
    Greppable: productPathFreestandingPerformOfficialPathAlternateMeasured_true,
    FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE,
    OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem productPathFreestandingPerformOfficialPathAlternateMeasured_true :
    productPathFreestandingPerformOfficialPathAlternateMeasured = true :=
  rfl

/-- Alternate non-emit writer present pin holds.
    Greppable: productPathOfficialPathAlternateWriterPresent_true,
    FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-WRITER,
    OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem productPathOfficialPathAlternateWriterPresent_true :
    productPathOfficialPathAlternateWriterPresent = true := rfl

/-- Alternate is not official just build (land-time B33; tip false after B38).
    Greppable: productPathOfficialPathAlternateNotOfficial_true,
    FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-NOT-OFFICIAL,
    OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem productPathOfficialPathAlternateNotOfficial_true :
    productPathOfficialPathAlternateNotOfficial = true := rfl

/-- Dual-equality still blocks official retirement (land-time B33; tip false B38).
    Greppable: productPathOfficialPathDualEqualityBlocksRetirement_true,
    FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT,
    OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem productPathOfficialPathDualEqualityBlocksRetirement_true :
    productPathOfficialPathDualEqualityBlocksRetirement = true := rfl

/-- Land-time perform claimed stays false (alternate measure != perform claimed;
    living tip / PerformClaimed true after B39).
    Greppable: productPathFreestandingPerformClaimed_false,
    OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem productPathFreestandingPerformClaimed_false :
    productPathFreestandingPerformClaimed = false := rfl

/-- Official path still uses FreestandingEmit (land-time B33; tip retired B38).
    Greppable: productPathOfficialPathStillUsesFreestandingEmit_true,
    OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem productPathOfficialPathStillUsesFreestandingEmit_true :
    productPathOfficialPathStillUsesFreestandingEmit = true := rfl

/-- Official path still uses Lake host elaborator pin holds.
    Greppable: productPathOfficialPathStillUsesLake_true,
    OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem productPathOfficialPathStillUsesLake_true :
    productPathOfficialPathStillUsesLake = true := rfl

/-- Retiring FreestandingEmit still required (land-time B33; tip retired B38).
    Greppable: productPathOfficialPathRetireFreestandingEmitRequired_true,
    OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem productPathOfficialPathRetireFreestandingEmitRequired_true :
    productPathOfficialPathRetireFreestandingEmitRequired = true := rfl

/-- Perform DependsOnLake remains true (official path Lake elaborator).
    Greppable: productPathPerformDependsOnLake_true,
    OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem productPathPerformDependsOnLake_true :
    productPathPerformDependsOnLake = true := rfl

/-- B32 official-path gap remains measured pin holds.
    Greppable: productPathFreestandingPerformOfficialPathGapMeasured_true,
    OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem productPathFreestandingPerformOfficialPathGapMeasured_true :
    productPathFreestandingPerformOfficialPathGapMeasured = true := rfl

/-- Land-time Full long-name stays false (Full lives on StepContractFull).
    Greppable: productPathFreestandingCapableStepContractFullSatisfied_false,
    OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem productPathFreestandingCapableStepContractFullSatisfied_false :
    productPathFreestandingCapableStepContractFullSatisfied = false := rfl

/-- Official-path alternate surface Ok fold holds.
    Greppable: productPathFreestandingPerformOfficialPathAlternateOk_true,
    OFFICIAL-PATH-ALTERNATE-THEOREM, HOST-OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem productPathFreestandingPerformOfficialPathAlternateOk_true :
    productPathFreestandingPerformOfficialPathAlternateOk = true := by
  decide

/-- Official-path alternate PartialReady fold holds (closed B33).
    Greppable: productPathFreestandingPerformOfficialPathAlternatePartialReady_true,
    SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE,
    OFFICIAL-PATH-ALTERNATE-THEOREM, HOST-OFFICIAL-PATH-ALTERNATE-THEOREM. -/
theorem productPathFreestandingPerformOfficialPathAlternatePartialReady_true :
    productPathFreestandingPerformOfficialPathAlternatePartialReady =
      true := by
  decide

/-- Named official-path alternate token greppable. -/
theorem officialPathAlternateId_eq :
    officialPathAlternateId =
      "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE" := rfl

/-- Named writer token greppable. -/
theorem officialPathAlternateWriterId_eq :
    officialPathAlternateWriterId =
      "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-WRITER" := rfl

/-- Named not-official token greppable. -/
theorem officialPathAlternateNotOfficialId_eq :
    officialPathAlternateNotOfficialId =
      "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-NOT-OFFICIAL" := rfl

/-- Dual-equality blocks retirement token greppable. -/
theorem officialPathDualEqualityBlocksId_eq :
    officialPathDualEqualityBlocksId =
      "FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT" :=
  rfl

/-- Full-bar perform claimed with evidence token greppable. -/
theorem fullBarReqPerformClaimedWithEvidence_eq :
    fullBarReqPerformClaimedWithEvidence =
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE" := rfl

/-- Lake-free alternate recipe name. -/
theorem lakeFreeAlternateRecipe_eq :
    lakeFreeAlternateRecipe =
      "freestanding-perform-official-path-alternate" := rfl

/-- Diagnostic Lake exe name. -/
theorem lakeExeName_eq :
    lakeExeName =
      "slake-freestanding-perform-official-path-alternate" := rfl

/-- Diagnostic just measure recipe name. -/
theorem justMeasureRecipe_eq :
    justMeasureRecipe =
      "freestanding-perform-official-path-alternate-measure" := rfl

/-- Official path recipe greppable (still just build land-time). -/
theorem officialPathRecipe_eq :
    officialPathRecipe = "build" := rfl

/-- Official path Lake writer greppable (land-time still FreestandingEmit). -/
theorem officialPathLakeWriter_eq :
    officialPathLakeWriter = "FreestandingEmit" := rfl

/-- Official path Lake exe greppable. -/
theorem officialPathLakeExe_eq :
    officialPathLakeExe = "slake-emit-freestanding-c" := rfl

/-- Alternate writer recipe greppable. -/
theorem alternateWriterRecipe_eq :
    alternateWriterRecipe = "freestanding-capable-regenerate" := rfl

/-- Alternate writer API greppable. -/
theorem alternateWriterApi_eq :
    alternateWriterApi = "freestandingCapableOrderedRegenerate" := rfl

/-- Alternate writer pipeline greppable. -/
theorem alternateWriterPipeline_eq :
    alternateWriterPipeline =
      "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE" := rfl

/-- Alternate writer module greppable. -/
theorem alternateWriterModule_eq :
    alternateWriterModule = "CapableRegenerate" := rfl

/-- B32 official-path gap recipe greppable. -/
theorem b32OfficialPathRecipe_eq :
    b32OfficialPathRecipe = "freestanding-perform-official-path" := rfl

/-! ### OFFICIAL-PATH-ALTERNATE-SMOKE / HOST-OFFICIAL-PATH-ALTERNATE-SMOKE

  Behavioral `example` canaries. Lake build fails if any example fails.
-/

example :
    stageId =
      "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_ALTERNATE_V0" :=
  by decide
example :
    hostId =
      "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE" := by
  decide
example :
    selfHostId =
      "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE" := by
  decide
example :
    productPathFreestandingPerformOfficialPathAlternateMeasured =
      true := by
  decide
example : productPathOfficialPathAlternateWriterPresent = true := by decide
example : productPathOfficialPathAlternateNotOfficial = true := by decide
example : productPathOfficialPathDualEqualityBlocksRetirement = true := by
  decide
example : productPathFreestandingPerformClaimed = false := by decide
example : productPathOfficialPathStillUsesFreestandingEmit = true := by decide
example : productPathOfficialPathStillUsesLake = true := by decide
example : productPathOfficialPathRetireFreestandingEmitRequired = true := by
  decide
example : productPathPerformDependsOnLake = true := by decide
example : productPathFreestandingCapableStepContractFullSatisfied = false := by
  decide
example :
    productPathFreestandingPerformOfficialPathAlternateOk = true := by
  decide
example :
    productPathFreestandingPerformOfficialPathAlternatePartialReady =
      true := by
  decide
example :
    officialPathAlternateId =
      "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE" := by
  decide
example :
    lakeFreeAlternateRecipe =
      "freestanding-perform-official-path-alternate" := by
  decide
example :
    lakeExeName =
      "slake-freestanding-perform-official-path-alternate" := by
  decide
example :
    justMeasureRecipe =
      "freestanding-perform-official-path-alternate-measure" := by
  decide
example : officialPathRecipe = "build" := by decide
example : officialPathLakeWriter = "FreestandingEmit" := by decide

end SystemsLean.OfficialPathAlternate
"#

end SystemsLean.HostFrontLiveOfficialPathAlternateTheorems
