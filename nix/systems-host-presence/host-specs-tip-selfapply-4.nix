# SPDX-License-Identifier: Unlicense
# Host presence token specs slice. Joined via specs.nix. Sub-1-KLOC.
# No bash, no Python.
{
  hostSpecsTipSelfApply4 = [
    {
      # Ownership regenerate theorems + smoke peel (same namespace
      # ProductPathOwnershipRegenerate).
      rel = "src/systems/SystemsLean/ProductPathOwnershipRegenerateTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ProductPathOwnershipRegenerateTheorems"
        "SystemsLean.ProductPathOwnershipRegenerateTheorems"
        "import SystemsLean.ProductPathOwnershipRegenerate"
        "OWNERSHIP-REGENERATE-THEOREM"
        "HOST-OWNERSHIP-REGENERATE-THEOREM"
        "OWNERSHIP-REGENERATE-SMOKE"
        "HOST-OWNERSHIP-REGENERATE-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathOwnershipRegenerateOk_true"
        "productPathOwnershipRegeneratePartialReady_true"
        "theorem productPathOwnershipRegenerateOk_true"
        "theorem productPathOwnershipRegeneratePartialReady_true"
        "theorem productPathOwnershipRegenerateInstallLakeFree_true"
        "theorem productPathOwnershipRegenerateReadLakeFree_true"
        "theorem productPathOwnershipRegenerateComposeLakeFree_true"
        "theorem productPathOwnershipRegenerateWriteHcLakeFree_true"
        "theorem productPathOwnershipRegenerateLakeFreeJoinClaimed_true"
        "theorem productPathOwnershipRegenerateProductPathAuthorityClaimed_true"
        "theorem productPathOwnershipRegenerateWithoutLake_true"
        "theorem productPathOwnershipRegenerateDependsOnLake_true"
        "theorem productPathOwnershipRegenerateInstallPathClaimed_true"
        "theorem productPathOwnershipRegenerateReadPathClaimed_true"
        "theorem productPathOwnershipRegenerateComposePathClaimed_true"
        "theorem productPathOwnershipRegenerateWriteHcPathClaimed_true"
        "theorem productPathFreestandingCapableStepContractFullSatisfied_false"
        "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"
        "OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE"
        "OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Perform evidence module (B31 land-time; evidence claimed true / perform
      # claimed false / DependsOnLake true / Full long-name false). Batch-12 split:
      # PartialReady bulk authority lives here; SelfApplyFs re-exports.
      # Short role name PerformEvidence (kitchen-sink ProductPathFreestanding* retired).
      # Dual-pin thin batch 22: home-primary Ok/stage/recipe/exe/step ids.
      # Long-file split: PERFORM-EVIDENCE-THEOREM + SMOKE in
      # PerformEvidenceTheorems (same namespace).
      rel = "src/systems/SystemsLean/PerformEvidence.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_EVIDENCE_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE"
        "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE"
        "def stageId : String :="
        "def hostId : String :="
        "def selfHostId : String :="
        "FREESTANDING-PERFORM-EVIDENCE"
        "FREESTANDING-PERFORM-EVIDENCE-READ-SSOT"
        "FREESTANDING-PERFORM-EVIDENCE-COMPOSE"
        "FREESTANDING-PERFORM-EVIDENCE-WRITE-HC"
        "FREESTANDING-PERFORM-EVIDENCE-INSTALL-OUT"
        "FREESTANDING-PERFORM-EVIDENCE-ORDERED"
        "productPathFreestandingPerformEvidenceClaimed"
        "productPathFreestandingPerformEvidenceOk"
        "productPathFreestandingPerformEvidencePartialReady"
        "def productPathFreestandingPerformEvidenceClaimed : Bool := true"
        "def productPathFreestandingPerformEvidencePartialReady : Bool :="
        "def productPathFreestandingPerformClaimed : Bool := false"
        "def productPathPerformDependsOnLake : Bool := true"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        "lakeExeName"
        "justMeasureRecipe"
        "lakeFreeEvidenceRecipe"
        "freestanding-perform-evidence"
        "freestanding-perform-evidence-measure"
        "slake-freestanding-perform-evidence"
        "PERFORM-EVIDENCE-THEOREM"
        "HOST-PERFORM-EVIDENCE-THEOREM"
        "PERFORM-EVIDENCE-SMOKE"
        "HOST-PERFORM-EVIDENCE-SMOKE"
        "PerformEvidenceTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as OfficialPath / Capable).
        "theorem productPathFreestandingPerformEvidencePartialReady_true"
        "SystemsLean.PerformEvidence"
        "PerformEvidence"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # PERFORM-EVIDENCE theorems + smoke split (same namespace PerformEvidence).
      rel = "src/systems/SystemsLean/PerformEvidenceTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "PerformEvidenceTheorems"
        "SystemsLean.PerformEvidenceTheorems"
        "import SystemsLean.PerformEvidence"
        "PERFORM-EVIDENCE-THEOREM"
        "HOST-PERFORM-EVIDENCE-THEOREM"
        "PERFORM-EVIDENCE-SMOKE"
        "HOST-PERFORM-EVIDENCE-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathFreestandingPerformEvidenceOk_true"
        "productPathFreestandingPerformEvidencePartialReady_true"
        "theorem productPathFreestandingPerformEvidenceOk_true"
        "theorem productPathFreestandingPerformEvidencePartialReady_true"
        "theorem productPathFreestandingPerformEvidenceClaimed_true"
        "theorem productPathFreestandingPerformClaimed_false"
        "theorem productPathPerformDependsOnLake_true"
        "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE"
        "FREESTANDING-PERFORM-EVIDENCE"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Official-path gap module (B32 land-time; StillUses true / retire required
      # true / perform claimed false / Full long-name false). Batch-11 split:
      # PartialReady bulk authority lives here; SelfApplyFs re-exports.
      # Dual-pin thin batch 23: home-primary Ok/stage/recipe/exe/step ids
      # (land-time StillUses FreestandingEmit true / Retire required true).
      # Long-file split: OFFICIAL-PATH-THEOREM + SMOKE in
      # OfficialPathTheorems (same namespace).
      rel = "src/systems/SystemsLean/OfficialPath.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH"
        "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH"
        "def stageId : String :="
        "def hostId : String :="
        "def selfHostId : String :="
        "FREESTANDING-PERFORM-OFFICIAL-PATH-GAP"
        "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-FREESTANDING-EMIT"
        "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-LAKE"
        "FREESTANDING-PERFORM-OFFICIAL-PATH-RETIRE-FREESTANDING-EMIT"
        "productPathFreestandingPerformOfficialPathGapMeasured"
        "productPathFreestandingPerformOfficialPathOk"
        "productPathFreestandingPerformOfficialPathPartialReady"
        "def productPathFreestandingPerformOfficialPathGapMeasured : Bool := true"
        "def productPathFreestandingPerformOfficialPathPartialReady : Bool :="
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
        "def productPathOfficialPathStillUsesLake : Bool := true"
        "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true"
        "def productPathFreestandingPerformClaimed : Bool := false"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        "lakeExeName"
        "justMeasureRecipe"
        "lakeFreeOfficialPathRecipe"
        "freestanding-perform-official-path"
        "freestanding-perform-official-path-measure"
        "slake-freestanding-perform-official-path"
        "OFFICIAL-PATH-THEOREM"
        "HOST-OFFICIAL-PATH-THEOREM"
        "OFFICIAL-PATH-SMOKE"
        "HOST-OFFICIAL-PATH-SMOKE"
        "OfficialPathTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as OfficialPathAlternate / InstallOut).
        "theorem productPathFreestandingPerformOfficialPathPartialReady_true"
        "SystemsLean.OfficialPath"
        "OfficialPath"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # OFFICIAL-PATH theorems + smoke split (same namespace OfficialPath).
      rel = "src/systems/SystemsLean/OfficialPathTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "OfficialPathTheorems"
        "SystemsLean.OfficialPathTheorems"
        "import SystemsLean.OfficialPath"
        "OFFICIAL-PATH-THEOREM"
        "HOST-OFFICIAL-PATH-THEOREM"
        "OFFICIAL-PATH-SMOKE"
        "HOST-OFFICIAL-PATH-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathFreestandingPerformOfficialPathOk_true"
        "productPathFreestandingPerformOfficialPathPartialReady_true"
        "theorem productPathFreestandingPerformOfficialPathOk_true"
        "theorem productPathFreestandingPerformOfficialPathPartialReady_true"
        "theorem productPathFreestandingPerformOfficialPathGapMeasured_true"
        "theorem productPathFreestandingPerformClaimed_false"
        "theorem productPathOfficialPathStillUsesFreestandingEmit_true"
        "theorem productPathOfficialPathStillUsesLake_true"
        "theorem productPathOfficialPathRetireFreestandingEmitRequired_true"
        "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH"
        "FREESTANDING-PERFORM-OFFICIAL-PATH-GAP"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Official-path alternate module (B33 land-time; AlternateNotOfficial true /
      # dual-equality blocks true / StillUses true / perform claimed false / Full
      # long-name false). Batch-10 split: PartialReady bulk authority lives here;
      # SelfApplyFs re-exports. Dual-pin thin batch 24: home-primary Ok / stageId /
      # hostId / recipe / exe / FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-* step ids.
      # Long-file split: OFFICIAL-PATH-ALTERNATE-THEOREM + SMOKE in
      # OfficialPathAlternateTheorems (same namespace).
      rel = "src/systems/SystemsLean/OfficialPathAlternate.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_ALTERNATE_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE"
        "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE"
        "def stageId : String :="
        "def hostId : String :="
        "def selfHostId : String :="
        "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE"
        "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-WRITER"
        "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-NOT-OFFICIAL"
        "FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT"
        "productPathFreestandingPerformOfficialPathAlternateMeasured"
        "productPathFreestandingPerformOfficialPathAlternateOk"
        "productPathFreestandingPerformOfficialPathAlternatePartialReady"
        "def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := true"
        "def productPathFreestandingPerformOfficialPathAlternatePartialReady : Bool :="
        "def productPathOfficialPathAlternateWriterPresent : Bool := true"
        "def productPathOfficialPathAlternateNotOfficial : Bool := true"
        "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
        "def productPathFreestandingPerformClaimed : Bool := false"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        "lakeExeName"
        "justMeasureRecipe"
        "lakeFreeAlternateRecipe"
        "officialPathAlternateId"
        "freestanding-perform-official-path-alternate"
        "freestanding-perform-official-path-alternate-measure"
        "slake-freestanding-perform-official-path-alternate"
        "OFFICIAL-PATH-ALTERNATE-THEOREM"
        "HOST-OFFICIAL-PATH-ALTERNATE-THEOREM"
        "OFFICIAL-PATH-ALTERNATE-SMOKE"
        "HOST-OFFICIAL-PATH-ALTERNATE-SMOKE"
        "OfficialPathAlternateTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as DualEqWriteParity / OfficialRetire).
        "theorem productPathFreestandingPerformOfficialPathAlternatePartialReady_true"
        "SystemsLean.OfficialPathAlternate"
        "OfficialPathAlternate"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # OFFICIAL-PATH-ALTERNATE theorems + smoke split (same namespace
      # OfficialPathAlternate).
      rel = "src/systems/SystemsLean/OfficialPathAlternateTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "OfficialPathAlternateTheorems"
        "SystemsLean.OfficialPathAlternateTheorems"
        "import SystemsLean.OfficialPathAlternate"
        "OFFICIAL-PATH-ALTERNATE-THEOREM"
        "HOST-OFFICIAL-PATH-ALTERNATE-THEOREM"
        "OFFICIAL-PATH-ALTERNATE-SMOKE"
        "HOST-OFFICIAL-PATH-ALTERNATE-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathFreestandingPerformOfficialPathAlternateOk_true"
        "productPathFreestandingPerformOfficialPathAlternatePartialReady_true"
        "theorem productPathFreestandingPerformOfficialPathAlternateOk_true"
        "theorem productPathFreestandingPerformOfficialPathAlternatePartialReady_true"
        "theorem productPathFreestandingPerformOfficialPathAlternateMeasured_true"
        "theorem productPathOfficialPathAlternateWriterPresent_true"
        "theorem productPathOfficialPathAlternateNotOfficial_true"
        "theorem productPathOfficialPathStillUsesFreestandingEmit_true"
        "theorem productPathOfficialPathDualEqualityBlocksRetirement_true"
        "theorem productPathFreestandingPerformClaimed_false"
        "theorem productPathPerformDependsOnLake_true"
        "theorem productPathFreestandingCapableStepContractFullSatisfied_false"
        "officialPathAlternateId_eq"
        "lakeFreeAlternateRecipe_eq"
        "lakeExeName_eq"
        "justMeasureRecipe_eq"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
      ];
    }
    {
      # Dual-equality WRITE parity module (B34 land-time; gap open true / Capable
      # structural true / perform claimed false / StillUses true / dual-equality
      # blocks true / Full long-name false). Batch-9 split: PartialReady bulk
      # authority lives here; SelfApplyFs re-exports.
      # Long-file split: WRITE-PARITY-THEOREM + SMOKE in
      # DualEqWriteParityTheorems (same namespace).
      rel = "src/systems/SystemsLean/DualEqWriteParity.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_PARITY_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
        "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
        "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
        "productPathFreestandingPerformDualEqualityWriteParityMeasured"
        "productPathFreestandingPerformDualEqualityWriteParityOk"
        "productPathFreestandingPerformDualEqualityWriteParityPartialReady"
        "def productPathFreestandingPerformDualEqualityWriteParityMeasured : Bool := true"
        "def productPathFreestandingPerformDualEqualityWriteParityPartialReady : Bool :="
        "def productPathDualEqualityWriteParityGapOpen : Bool := true"
        "def productPathCapableWriteStructuralNotDualEquality : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
        "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true"
        "def productPathFreestandingPerformClaimed : Bool := false"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        "WRITE-PARITY-THEOREM"
        "HOST-WRITE-PARITY-THEOREM"
        "WRITE-PARITY-SMOKE"
        "HOST-WRITE-PARITY-SMOKE"
        "DualEqWriteParityTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as DualEqWriteClosePath / OfficialRetire).
        "theorem productPathFreestandingPerformDualEqualityWriteParityPartialReady_true"
        "SystemsLean.DualEqWriteParity"
        "DualEqWriteParity"
        "freestanding-perform-dual-equality-write-parity"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # WRITE-PARITY theorems + smoke split (same namespace DualEqWriteParity).
      rel = "src/systems/SystemsLean/DualEqWriteParityTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "DualEqWriteParityTheorems"
        "SystemsLean.DualEqWriteParityTheorems"
        "import SystemsLean.DualEqWriteParity"
        "WRITE-PARITY-THEOREM"
        "HOST-WRITE-PARITY-THEOREM"
        "WRITE-PARITY-SMOKE"
        "HOST-WRITE-PARITY-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathFreestandingPerformDualEqualityWriteParityOk_true"
        "productPathFreestandingPerformDualEqualityWriteParityPartialReady_true"
        "theorem productPathFreestandingPerformDualEqualityWriteParityOk_true"
        "theorem productPathFreestandingPerformDualEqualityWriteParityPartialReady_true"
        "theorem productPathFreestandingPerformDualEqualityWriteParityMeasured_true"
        "theorem productPathDualEqualityWriteParityGapOpen_true"
        "theorem productPathCapableWriteStructuralNotDualEquality_true"
        "theorem productPathOfficialPathStillUsesFreestandingEmit_true"
        "theorem productPathOfficialPathDualEqualityBlocksRetirement_true"
        "theorem productPathFreestandingPerformClaimed_false"
        "theorem productPathPerformDependsOnLake_true"
        "theorem productPathFreestandingCapableStepContractFullSatisfied_false"
        "dualEqualityWriteParityId_eq"
        "lakeFreeParityRecipe_eq"
        "lakeExeName_eq"
        "justMeasureRecipe_eq"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
      ];
    }
    {
      # Dual-equality WRITE close path module (B35 land-time; gap open true / not-gap-
      # closed true / perform claimed false / StillUses true / dual-equality blocks
      # true / Full long-name false). Batch-8 split: PartialReady bulk authority lives
      # here; SelfApplyFs re-exports.
      # Long-file peel: CLOSE-PATH-THEOREM + SMOKE in
      # DualEqWriteClosePathTheorems (same namespace).
      rel = "src/systems/SystemsLean/DualEqWriteClosePath.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CLOSE_PATH_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
        "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
        "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
        "productPathFreestandingPerformDualEqualityWriteClosePathMeasured"
        "productPathFreestandingPerformDualEqualityWriteClosePathOk"
        "productPathDualEqualityWriteClosePathNamed"
        "productPathDualEqualityWriteClosePathNotGapClosed"
        "productPathFreestandingPerformDualEqualityWriteClosePathPartialReady"
        "def productPathFreestandingPerformDualEqualityWriteClosePathMeasured : Bool := true"
        "def productPathFreestandingPerformDualEqualityWriteClosePathPartialReady : Bool :="
        "def productPathDualEqualityWriteClosePathNamed : Bool := true"
        "def productPathDualEqualityWriteClosePathNotGapClosed : Bool := true"
        "def productPathDualEqualityWriteParityGapOpen : Bool := true"
        "def productPathCapableWriteStructuralNotDualEquality : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
        "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true"
        "def productPathFreestandingPerformClaimed : Bool := false"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        "CLOSE-PATH-THEOREM"
        "HOST-CLOSE-PATH-THEOREM"
        "CLOSE-PATH-SMOKE"
        "HOST-CLOSE-PATH-SMOKE"
        "DualEqWriteClosePathTheorems"
        # Greppable theorem cite (live def in Theorems module; same peel pattern
        # as OwnershipClaimed / DualEqWriteCapableGap).
        "theorem productPathFreestandingPerformDualEqualityWriteClosePathPartialReady_true"
        "SystemsLean.DualEqWriteClosePath"
        "DualEqWriteClosePath"
        "freestanding-perform-dual-equality-write-close-path"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # CLOSE-PATH theorems + smoke peel (same namespace DualEqWriteClosePath).
      rel = "src/systems/SystemsLean/DualEqWriteClosePathTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "DualEqWriteClosePathTheorems"
        "SystemsLean.DualEqWriteClosePathTheorems"
        "import SystemsLean.DualEqWriteClosePath"
        "CLOSE-PATH-THEOREM"
        "HOST-CLOSE-PATH-THEOREM"
        "CLOSE-PATH-SMOKE"
        "HOST-CLOSE-PATH-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathFreestandingPerformDualEqualityWriteClosePathOk_true"
        "productPathFreestandingPerformDualEqualityWriteClosePathPartialReady_true"
        "theorem productPathFreestandingPerformDualEqualityWriteClosePathOk_true"
        "theorem productPathFreestandingPerformDualEqualityWriteClosePathPartialReady_true"
        "theorem productPathFreestandingPerformDualEqualityWriteClosePathMeasured_true"
        "theorem productPathDualEqualityWriteClosePathNamed_true"
        "theorem productPathDualEqualityWriteClosePathNotGapClosed_true"
        "theorem productPathDualEqualityWriteParityGapOpen_true"
        "theorem productPathCapableWriteStructuralNotDualEquality_true"
        "theorem productPathFreestandingPerformClaimed_false"
        "theorem productPathOfficialPathStillUsesFreestandingEmit_true"
        "theorem productPathFreestandingCapableStepContractFullSatisfied_false"
        "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
        "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Dual-equality WRITE API module (B36 land-time; gap open true / perform claimed
      # false / StillUses true / dual-equality blocks true / Full long-name false).
      # Batch-7 split: PartialReady bulk authority lives here; SelfApplyFs re-exports.
      # Long-file peel: load/assemble helpers in DualEqWriteLoad (same namespace).
      rel = "src/systems/SystemsLean/DualEqWriteApi.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_API_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API"
        "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API"
        "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API"
        "productPathFreestandingPerformDualEqualityWriteApiMeasured"
        "productPathFreestandingPerformDualEqualityWriteApiOk"
        "productPathDualEqualityWriteApiPresent"
        "productPathDualEqualityWriteApiAuthorityNotEmit"
        "productPathDualEqualityWriteApiNotOfficial"
        "productPathDualEqualityWriteApiStepAdvanced"
        "productPathFreestandingPerformDualEqualityWriteApiPartialReady"
        "def productPathFreestandingPerformDualEqualityWriteApiMeasured : Bool := true"
        "def productPathFreestandingPerformDualEqualityWriteApiPartialReady : Bool :="
        "def productPathDualEqualityWriteParityGapOpen : Bool := true"
        "def productPathCapableWriteStructuralNotDualEquality : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
        "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true"
        "def productPathFreestandingPerformClaimed : Bool := false"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        "theorem productPathFreestandingPerformDualEqualityWriteApiPartialReady_true"
        "SystemsLean.DualEqWriteApi"
        "DualEqWriteApi"
        "DualEqWriteLoad"
        "freestanding-perform-dual-equality-write-api"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # DualEqWriteLoad: dual SSOT load/assemble/dialect/validate peel.
      rel = "src/systems/SystemsLean/DualEqWriteLoad.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_API_V0"
        "DualEqWriteLoad"
        "def stageId : String :="
        "def dualSsotBlockEqual"
        "def requireDualSsotEqual"
        "def dualEqualityWriteSpecs"
        "def freestandingDualEqualityWriteLoadOne"
        "def validateDualEqualityWriteProduct"
        "def applyBodySsotDialect"
        "def loadBodySsotDialect"
        "DUAL-SSOT-EQUALITY"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # CAPABLE-GAP module (B37 land-time; perform claimed false / StillUses true /
      # dual-equality blocks true / Full long-name false). Batch-6 split: PartialReady
      # bulk authority lives here; SelfApplyFs re-exports.
      # Long-file peel: CAPABLE-GAP-THEOREM + SMOKE in
      # DualEqWriteCapableGapTheorems (same namespace).
      rel = "src/systems/SystemsLean/DualEqWriteCapableGap.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CAPABLE_GAP_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
        "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
        "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
        "productPathFreestandingPerformDualEqualityWriteCapableGapMeasured"
        "productPathFreestandingPerformDualEqualityWriteCapableGapOk"
        "productPathDualEqualityWriteCapableGapClosed"
        "productPathCapableWriteDualEqualityLive"
        "productPathDualEqualityWriteCapableGapStepAdvanced"
        "productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady"
        "def productPathFreestandingPerformDualEqualityWriteCapableGapMeasured : Bool := true"
        "def productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady : Bool :="
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
        "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true"
        "def productPathFreestandingPerformClaimed : Bool := false"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        "CAPABLE-GAP-THEOREM"
        "HOST-CAPABLE-GAP-THEOREM"
        "CAPABLE-GAP-SMOKE"
        "HOST-CAPABLE-GAP-SMOKE"
        "DualEqWriteCapableGapTheorems"
        # Greppable theorem cite (live def in Theorems module; same peel pattern
        # as OwnershipClaimed / SelfHostComplete).
        "theorem productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady_true"
        "SystemsLean.DualEqWriteCapableGap"
        "DualEqWriteCapableGap"
        "freestanding-perform-dual-equality-write-capable-gap"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # CAPABLE-GAP theorems + smoke peel (same namespace DualEqWriteCapableGap).
      rel = "src/systems/SystemsLean/DualEqWriteCapableGapTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "DualEqWriteCapableGapTheorems"
        "SystemsLean.DualEqWriteCapableGapTheorems"
        "import SystemsLean.DualEqWriteCapableGap"
        "CAPABLE-GAP-THEOREM"
        "HOST-CAPABLE-GAP-THEOREM"
        "CAPABLE-GAP-SMOKE"
        "HOST-CAPABLE-GAP-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathFreestandingPerformDualEqualityWriteCapableGapOk_true"
        "productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady_true"
        "theorem productPathFreestandingPerformDualEqualityWriteCapableGapOk_true"
        "theorem productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady_true"
        "theorem productPathFreestandingPerformDualEqualityWriteCapableGapMeasured_true"
        "theorem productPathDualEqualityWriteCapableGapClosed_true"
        "theorem productPathCapableWriteDualEqualityLive_true"
        "theorem productPathDualEqualityWriteCapableGapStepAdvanced_true"
        "theorem productPathFreestandingPerformClaimed_false"
        "theorem productPathOfficialPathStillUsesFreestandingEmit_true"
        "theorem productPathFreestandingCapableStepContractFullSatisfied_false"
        "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
        "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # RETIRE-OFFICIAL short module (B38 land-time; perform claimed false / Full long-name
      # false). Batch-5 split: PartialReady bulk authority lives here; SelfApplyFs re-exports.
      # Long-file split: RETIRE-OFFICIAL-THEOREM + SMOKE in
      # OfficialRetireTheorems (same namespace).
      rel = "src/systems/SystemsLean/OfficialRetire.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_RETIRE_OFFICIAL_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL"
        "SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL"
        "FREESTANDING-PERFORM-RETIRE-OFFICIAL"
        "productPathOfficialPathRetireOfficialMeasured"
        "productPathOfficialPathRetireOfficialOk"
        "productPathOfficialPathRetireOfficialStepAdvanced"
        "productPathOfficialPathRetireOfficialPartialReady"
        "def productPathOfficialPathRetireOfficialMeasured : Bool := true"
        "def productPathOfficialPathRetireOfficialPartialReady : Bool :="
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
        "def productPathFreestandingPerformClaimed : Bool := false"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        "RETIRE-OFFICIAL-THEOREM"
        "HOST-RETIRE-OFFICIAL-THEOREM"
        "RETIRE-OFFICIAL-SMOKE"
        "HOST-RETIRE-OFFICIAL-SMOKE"
        "OfficialRetireTheorems"
        # Greppable theorem cite (live def in Theorems module; same peel pattern
        # as PerformClaimed / OwnershipClaimed).
        "theorem productPathOfficialPathRetireOfficialPartialReady_true"
        "SystemsLean.OfficialRetire"
        "OfficialRetire"
        "freestanding-retire-official"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # RETIRE-OFFICIAL theorems + smoke peel (same namespace OfficialRetire).
      rel = "src/systems/SystemsLean/OfficialRetireTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "OfficialRetireTheorems"
        "SystemsLean.OfficialRetireTheorems"
        "import SystemsLean.OfficialRetire"
        "RETIRE-OFFICIAL-THEOREM"
        "HOST-RETIRE-OFFICIAL-THEOREM"
        "RETIRE-OFFICIAL-SMOKE"
        "HOST-RETIRE-OFFICIAL-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathOfficialPathRetireOfficialOk_true"
        "productPathOfficialPathRetireOfficialPartialReady_true"
        "theorem productPathOfficialPathRetireOfficialOk_true"
        "theorem productPathOfficialPathRetireOfficialPartialReady_true"
        "theorem productPathOfficialPathRetireOfficialMeasured_true"
        "theorem productPathOfficialPathRetireOfficialStepAdvanced_true"
        "theorem productPathOfficialPathUsesDualEqualityWrite_true"
        "theorem productPathOfficialPathStillUsesFreestandingEmit_false"
        "theorem productPathOfficialPathStillUsesLake_false"
        "theorem productPathFreestandingPerformClaimed_false"
        "theorem productPathPerformDependsOnLake_false"
        "theorem productPathFreestandingCapableStepContractFullSatisfied_false"
        "retireOfficialId_eq"
        "lakeFreeRetireOfficialRecipe_eq"
        "lakeExeName_eq"
        "justMeasureRecipe_eq"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
      ];
    }
    {
      # PERFORM-CLAIMED short module (B39 land-time; ownership false / Full long-name false /
      # complete false). Batch-4 split: PartialReady bulk authority lives here; SelfApplyFs
      # re-exports.
      # Long-file peel: PERFORM-CLAIMED-THEOREM + SMOKE in
      # PerformClaimedTheorems (same namespace).
      rel = "src/systems/SystemsLean/PerformClaimed.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_CLAIMED_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED"
        "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED"
        "FREESTANDING-PERFORM-CLAIMED"
        "productPathFreestandingPerformClaimedMeasured"
        "productPathFreestandingPerformClaimedOk"
        "productPathFreestandingPerformClaimedStepAdvanced"
        "productPathFreestandingPerformClaimedPartialReady"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "def productPathFreestandingPerformClaimedPartialReady : Bool :="
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
        "def productPathFreestandingOwnershipClaimed : Bool := false"
        "def freestandingProductSelfHostComplete : Bool := false"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        "PERFORM-CLAIMED-THEOREM"
        "HOST-PERFORM-CLAIMED-THEOREM"
        "PERFORM-CLAIMED-SMOKE"
        "HOST-PERFORM-CLAIMED-SMOKE"
        "PerformClaimedTheorems"
        # Greppable theorem cite (live def in Theorems module; same peel pattern
        # as OwnershipClaimed / DualEqWriteCapableGap).
        "theorem productPathFreestandingPerformClaimedPartialReady_true"
        "SystemsLean.PerformClaimed"
        "PerformClaimed"
        "freestanding-perform-claimed"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # PERFORM-CLAIMED theorems + smoke peel (same namespace PerformClaimed).
      rel = "src/systems/SystemsLean/PerformClaimedTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "PerformClaimedTheorems"
        "SystemsLean.PerformClaimedTheorems"
        "import SystemsLean.PerformClaimed"
        "PERFORM-CLAIMED-THEOREM"
        "HOST-PERFORM-CLAIMED-THEOREM"
        "PERFORM-CLAIMED-SMOKE"
        "HOST-PERFORM-CLAIMED-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathFreestandingPerformClaimedOk_true"
        "productPathFreestandingPerformClaimedPartialReady_true"
        "theorem productPathFreestandingPerformClaimedOk_true"
        "theorem productPathFreestandingPerformClaimedPartialReady_true"
        "theorem productPathFreestandingPerformClaimedMeasured_true"
        "theorem productPathFreestandingPerformClaimedStepAdvanced_true"
        "theorem productPathFreestandingPerformClaimed_true"
        "theorem productPathOfficialPathStillUsesFreestandingEmit_false"
        "theorem productPathFreestandingOwnershipClaimed_false"
        "theorem freestandingProductSelfHostComplete_false"
        "theorem productPathFreestandingCapableStepContractFullSatisfied_false"
        "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED"
        "FREESTANDING-PERFORM-CLAIMED"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # OWNERSHIP-CLAIMED short module (B40 land-time; complete false / Full long-name false).
      # Batch-3 split: PartialReady bulk authority lives here; SelfApplyFs re-exports.
      # Long-file peel: OWNERSHIP-CLAIMED-THEOREM + SMOKE in
      # OwnershipClaimedTheorems (same namespace).
      rel = "src/systems/SystemsLean/OwnershipClaimed.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_CLAIMED_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED"
        "SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED"
        "FREESTANDING-OWNERSHIP-CLAIMED"
        "productPathFreestandingOwnershipClaimedMeasured"
        "productPathFreestandingOwnershipClaimedOk"
        "productPathFreestandingOwnershipClaimedStepAdvanced"
        "productPathFreestandingOwnershipClaimedPartialReady"
        "def productPathFreestandingOwnershipClaimed : Bool := true"
        "def productPathFreestandingOwnershipClaimedPartialReady : Bool :="
        "def productPathFreestandingPerformClaimed : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
        "def freestandingProductSelfHostComplete : Bool := false"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        "OWNERSHIP-CLAIMED-THEOREM"
        "HOST-OWNERSHIP-CLAIMED-THEOREM"
        "OWNERSHIP-CLAIMED-SMOKE"
        "HOST-OWNERSHIP-CLAIMED-SMOKE"
        "OwnershipClaimedTheorems"
        # Greppable theorem cite (live def in Theorems module; same peel pattern
        # as StepContractFull / ProductPathOwnershipRegenerate).
        "theorem productPathFreestandingOwnershipClaimedPartialReady_true"
        "SystemsLean.OwnershipClaimed"
        "OwnershipClaimed"
        "freestanding-ownership-claimed"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
  ];
}
