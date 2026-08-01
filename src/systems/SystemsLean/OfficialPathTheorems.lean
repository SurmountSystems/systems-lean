/-
  SYSTEMS_LEAN_HOST partial -- OfficialPath OFFICIAL-PATH-THEOREM + SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.OfficialPath: theorems and behavioral smoke
  live here; stage ids, claim Bools, recipe/exe names, Ok / PartialReady folds,
  and diagnostic print/main stay in OfficialPath. Same namespace
  SystemsLean.OfficialPath so theorem names stay unqualified under that
  namespace.

  Spec (readable):
  - OFFICIAL-PATH-THEOREM / HOST-OFFICIAL-PATH-THEOREM: stageId_eq /
    hostId_eq / selfHostId_eq /
    productPathFreestandingPerformOfficialPathOk_true /
    productPathFreestandingPerformOfficialPathPartialReady_true +
    gap measured true / perform claimed false / StillUses FreestandingEmit
    true / StillUses Lake true / retire required true / DependsOnLake true /
    B31 evidence claimed true / Full long-name false + recipe/exe pins.
  - OFFICIAL-PATH-SMOKE / HOST-OFFICIAL-PATH-SMOKE: stage / map / Ok /
    PartialReady / claim bool behavioral examples (lake build fails if
    example fails).

  These OFFICIAL-PATH theorems do NOT flip freestanding residual free, llvm,
  or PROVABLY. Land-time perform claimed stays false on this home (living tip
  / PerformClaimed true after B39). StillUses FreestandingEmit stays true
  (land-time B32; living tip retired after B38). Retire required stays true
  on this home (land-time B32; living tip false after B38). Full long-name
  stays false (Full lives on StepContractFull). Complete true lives on tip /
  SelfHostComplete / StepContractFull dual-pin, not here.

  Intentional non-claims:
  - OFFICIAL-PATH surface honesty only -- NOT freestanding residual free.
  - NOT perform claimed flip here (PerformClaimed owns living tip true).
  - NOT StillUses FreestandingEmit living tip false here (SelfApplyFs /
    OfficialRetire).
  - NOT Full / complete flip here.
  - NOT free / llvm / PROVABLY unlock.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, OFFICIAL-PATH-THEOREM,
  HOST-OFFICIAL-PATH-THEOREM, OFFICIAL-PATH-SMOKE,
  HOST-OFFICIAL-PATH-SMOKE, stageId_eq, hostId_eq, selfHostId_eq,
  productPathFreestandingPerformOfficialPathOk_true,
  productPathFreestandingPerformOfficialPathPartialReady_true,
  productPathFreestandingPerformOfficialPathGapMeasured_true,
  productPathFreestandingPerformClaimed_false,
  productPathOfficialPathStillUsesFreestandingEmit_true,
  productPathOfficialPathStillUsesLake_true,
  productPathOfficialPathRetireFreestandingEmitRequired_true,
  productPathPerformDependsOnLake_true,
  productPathFreestandingPerformEvidenceClaimed_true,
  productPathFreestandingCapableStepContractFullSatisfied_false,
  officialPathGapId_eq, lakeFreeOfficialPathRecipe_eq,
  lakeExeName_eq, justMeasureRecipe_eq,
  OfficialPathTheorems, UNIT_SURFACE host surface,
  RUNTIME-FS, SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH,
  FREESTANDING-PERFORM-OFFICIAL-PATH-GAP,
  FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-FREESTANDING-EMIT,
  FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-LAKE,
  FREESTANDING-PERFORM-OFFICIAL-PATH-RETIRE-FREESTANDING-EMIT,
  FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE.
  Module: SystemsLean.OfficialPathTheorems
  Red/green: just systems-host; lake build SystemsLean.OfficialPathTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.OfficialPath

namespace SystemsLean.OfficialPath

/-! ### OFFICIAL-PATH-THEOREM / HOST-OFFICIAL-PATH-THEOREM

  Real Lean theorems (not only `example` Bool canaries). Scope is B32
  official-path gap surface honesty only. Does not flip residual free /
  llvm / PROVABLY; land-time perform claimed stays false; StillUses
  FreestandingEmit stays true; retire required stays true; Full long-name
  stays false.
-/

/-- Primary stage id is greppable
    SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0.
    Greppable: stageId_eq, OFFICIAL-PATH-THEOREM,
    HOST-OFFICIAL-PATH-THEOREM. -/
theorem stageId_eq :
    stageId =
      "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0" :=
  rfl

/-- Host map id is greppable
    HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH.
    Greppable: hostId_eq, OFFICIAL-PATH-THEOREM. -/
theorem hostId_eq :
    hostId =
      "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH" :=
  rfl

/-- Short map id is greppable
    SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH.
    Greppable: selfHostId_eq, OFFICIAL-PATH-THEOREM. -/
theorem selfHostId_eq :
    selfHostId =
      "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH" :=
  rfl

/-- Official-path gap measured pin holds.
    Greppable: productPathFreestandingPerformOfficialPathGapMeasured_true,
    FREESTANDING-PERFORM-OFFICIAL-PATH-GAP,
    OFFICIAL-PATH-THEOREM. -/
theorem productPathFreestandingPerformOfficialPathGapMeasured_true :
    productPathFreestandingPerformOfficialPathGapMeasured = true :=
  rfl

/-- Land-time perform claimed stays false (gap measure != perform claimed;
    living tip / PerformClaimed true after B39).
    Greppable: productPathFreestandingPerformClaimed_false,
    OFFICIAL-PATH-THEOREM. -/
theorem productPathFreestandingPerformClaimed_false :
    productPathFreestandingPerformClaimed = false := rfl

/-- Perform DependsOnLake remains true (official path Lake elaborator).
    Greppable: productPathPerformDependsOnLake_true,
    OFFICIAL-PATH-THEOREM. -/
theorem productPathPerformDependsOnLake_true :
    productPathPerformDependsOnLake = true := rfl

/-- B31 evidence remains claimed pin holds.
    Greppable: productPathFreestandingPerformEvidenceClaimed_true,
    OFFICIAL-PATH-THEOREM. -/
theorem productPathFreestandingPerformEvidenceClaimed_true :
    productPathFreestandingPerformEvidenceClaimed = true := rfl

/-- Official path still uses FreestandingEmit (land-time B32; tip retired B38).
    Greppable: productPathOfficialPathStillUsesFreestandingEmit_true,
    OFFICIAL-PATH-THEOREM. -/
theorem productPathOfficialPathStillUsesFreestandingEmit_true :
    productPathOfficialPathStillUsesFreestandingEmit = true := rfl

/-- Official path still uses Lake host elaborator pin holds.
    Greppable: productPathOfficialPathStillUsesLake_true,
    OFFICIAL-PATH-THEOREM. -/
theorem productPathOfficialPathStillUsesLake_true :
    productPathOfficialPathStillUsesLake = true := rfl

/-- Retiring FreestandingEmit still required (land-time B32; tip retired B38).
    Greppable: productPathOfficialPathRetireFreestandingEmitRequired_true,
    OFFICIAL-PATH-THEOREM. -/
theorem productPathOfficialPathRetireFreestandingEmitRequired_true :
    productPathOfficialPathRetireFreestandingEmitRequired = true := rfl

/-- Land-time Full long-name stays false (Full lives on StepContractFull).
    Greppable: productPathFreestandingCapableStepContractFullSatisfied_false,
    OFFICIAL-PATH-THEOREM. -/
theorem productPathFreestandingCapableStepContractFullSatisfied_false :
    productPathFreestandingCapableStepContractFullSatisfied = false := rfl

/-- Official-path gap surface Ok fold holds.
    Greppable: productPathFreestandingPerformOfficialPathOk_true,
    OFFICIAL-PATH-THEOREM, HOST-OFFICIAL-PATH-THEOREM. -/
theorem productPathFreestandingPerformOfficialPathOk_true :
    productPathFreestandingPerformOfficialPathOk = true := by
  decide

/-- Official-path gap PartialReady fold holds (closed B32).
    Greppable: productPathFreestandingPerformOfficialPathPartialReady_true,
    SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH,
    OFFICIAL-PATH-THEOREM, HOST-OFFICIAL-PATH-THEOREM. -/
theorem productPathFreestandingPerformOfficialPathPartialReady_true :
    productPathFreestandingPerformOfficialPathPartialReady = true := by
  decide

/-- Named official-path gap token greppable. -/
theorem officialPathGapId_eq :
    officialPathGapId = "FREESTANDING-PERFORM-OFFICIAL-PATH-GAP" := rfl

/-- Named still-FreestandingEmit token greppable. -/
theorem officialPathStillEmitId_eq :
    officialPathStillEmitId =
      "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-FREESTANDING-EMIT" := rfl

/-- Named still-Lake token greppable. -/
theorem officialPathStillLakeId_eq :
    officialPathStillLakeId =
      "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-LAKE" := rfl

/-- Named retire FreestandingEmit token greppable. -/
theorem officialPathRetireEmitId_eq :
    officialPathRetireEmitId =
      "FREESTANDING-PERFORM-OFFICIAL-PATH-RETIRE-FREESTANDING-EMIT" := rfl

/-- Named recipe token greppable. -/
theorem officialPathRecipeId_eq :
    officialPathRecipeId = "FREESTANDING-PERFORM-OFFICIAL-PATH-RECIPE" := rfl

/-- Named Lake writer token greppable. -/
theorem officialPathLakeWriterId_eq :
    officialPathLakeWriterId =
      "FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-WRITER" := rfl

/-- Named Lake exe token greppable. -/
theorem officialPathLakeExeId_eq :
    officialPathLakeExeId =
      "FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-EXE" := rfl

/-- Full-bar perform claimed with evidence token greppable. -/
theorem fullBarReqPerformClaimedWithEvidence_eq :
    fullBarReqPerformClaimedWithEvidence =
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE" := rfl

/-- Official path recipe greppable (still just build land-time). -/
theorem officialPathRecipe_eq :
    officialPathRecipe = "build" := rfl

/-- Official path Lake writer greppable (land-time still FreestandingEmit). -/
theorem officialPathLakeWriter_eq :
    officialPathLakeWriter = "FreestandingEmit" := rfl

/-- Official path Lake exe greppable. -/
theorem officialPathLakeExe_eq :
    officialPathLakeExe = "slake-emit-freestanding-c" := rfl

/-- Lake-free official-path gap recipe name. -/
theorem lakeFreeOfficialPathRecipe_eq :
    lakeFreeOfficialPathRecipe = "freestanding-perform-official-path" := rfl

/-- Diagnostic just measure recipe name. -/
theorem justMeasureRecipe_eq :
    justMeasureRecipe = "freestanding-perform-official-path-measure" := rfl

/-- Diagnostic Lake exe name. -/
theorem lakeExeName_eq :
    lakeExeName = "slake-freestanding-perform-official-path" := rfl

/-- B31 evidence recipe greppable. -/
theorem b31EvidenceRecipe_eq :
    b31EvidenceRecipe = "freestanding-perform-evidence" := rfl

/-! ### OFFICIAL-PATH-SMOKE / HOST-OFFICIAL-PATH-SMOKE

  Behavioral `example` canaries. Lake build fails if any example fails.
-/

example :
    stageId =
      "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0" := by
  decide
example :
    hostId =
      "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH" := by
  decide
example :
    selfHostId =
      "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH" := by
  decide
example :
    productPathFreestandingPerformOfficialPathGapMeasured = true := by
  decide
example : productPathFreestandingPerformClaimed = false := by decide
example : productPathPerformDependsOnLake = true := by decide
example : productPathFreestandingPerformEvidenceClaimed = true := by decide
example : productPathOfficialPathStillUsesFreestandingEmit = true := by decide
example : productPathOfficialPathStillUsesLake = true := by decide
example : productPathOfficialPathRetireFreestandingEmitRequired = true := by
  decide
example : productPathFreestandingCapableStepContractFullSatisfied = false := by
  decide
example : productPathFreestandingPerformOfficialPathOk = true := by decide
example :
    productPathFreestandingPerformOfficialPathPartialReady = true := by
  decide
example :
    officialPathGapId = "FREESTANDING-PERFORM-OFFICIAL-PATH-GAP" := by
  decide
example :
    lakeFreeOfficialPathRecipe = "freestanding-perform-official-path" := by
  decide
example :
    lakeExeName = "slake-freestanding-perform-official-path" := by
  decide
example :
    justMeasureRecipe = "freestanding-perform-official-path-measure" := by
  decide
example : officialPathRecipe = "build" := by decide
example : officialPathLakeWriter = "FreestandingEmit" := by decide

end SystemsLean.OfficialPath
