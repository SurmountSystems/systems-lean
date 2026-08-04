# SPDX-License-Identifier: Unlicense
# Host presence token specs slice. Joined via specs.nix. Sub-1-KLOC.
# No bash, no Python.
{
  hostSpecsTipSelfApply3 = [
    {
      # B13 WRITE-HC perform substrate module (land-time DependsOnLake true /
      # EntrypointClaimed true). Batch-22 split: PartialReady bulk authority
      # lives here; SelfApplyFs re-exports.
      # Dual-pin thin batch 12: historical stage/Ok/moduleCite/recipe/exe/fn/gap
      # home-primary.
      # Long-file split: WRITE-HC-THEOREM + SMOKE in
      # ProductPathWriteHcTheorems (same namespace).
      rel = "src/systems/SystemsLean/ProductPathWriteHc.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_WRITE_HC_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC"
        "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC"
        "productPathPerformWriteHcOk"
        "productPathPerformWriteHcPartialReady"
        "def productPathPerformWriteHcPartialReady : Bool :="
        "def productPathPerformWriteHcDependsOnLake : Bool := true"
        "def productPathPerformWriteHcEntrypointClaimed : Bool := true"
        "WRITE-HC-THEOREM"
        "HOST-WRITE-HC-THEOREM"
        "WRITE-HC-SMOKE"
        "HOST-WRITE-HC-SMOKE"
        "ProductPathWriteHcTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as ProductPathReadSsot / ProductPathComposePlan).
        "theorem productPathPerformWriteHcPartialReady_true"
        "SystemsLean.ProductPathWriteHc"
        "ProductPathWriteHc"
        "writeHcModuleCite"
        "justRecipeName"
        "lakeExeName"
        "writeHcFnCite"
        "stageId"
        "hostId"
        "selfHostId"
        "gapWriteHc"
        "write-freestanding-hc"
        "slake-write-freestanding-hc"
        "writeFreestandingHcAtRoot"
        "FreestandingEmit.emitAtRoot"
        "WRITER-PATH-STEP-WRITE-FREESTANDING-HC"
        "FREESTANDING-PERFORM-GAP-WRITE-HC"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # WRITE-HC theorems + smoke split (same namespace ProductPathWriteHc).
      rel = "src/systems/SystemsLean/ProductPathWriteHcTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ProductPathWriteHcTheorems"
        "SystemsLean.ProductPathWriteHcTheorems"
        "import SystemsLean.ProductPathWriteHc"
        "WRITE-HC-THEOREM"
        "HOST-WRITE-HC-THEOREM"
        "WRITE-HC-SMOKE"
        "HOST-WRITE-HC-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathPerformWriteHcOk_true"
        "productPathPerformWriteHcPartialReady_true"
        "theorem productPathPerformWriteHcOk_true"
        "theorem productPathPerformWriteHcPartialReady_true"
        "theorem productPathPerformWriteHcDependsOnLake_true"
        "theorem productPathPerformWriteHcEntrypointClaimed_true"
        "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC"
        "FREESTANDING-PERFORM-GAP-WRITE-HC"
        "WRITER-PATH-STEP-WRITE-FREESTANDING-HC"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Capable-gap module (B14 land-time; InstallOnly + CapableRead/Compose/WriteHc
      # true / FullPerform false). Batch-21 split: PartialReady bulk authority
      # lives here; SelfApplyFs re-exports.
      # Dual-pin thin batch 13: home owns stage/host/recipe/exe/Ok/LakeFree bulk.
      # Long-file split: CAPABLE-GAP-THEOREM + SMOKE in
      # CapableTheorems (same namespace).
      rel = "src/systems/SystemsLean/Capable.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP"
        "def stageId : String :="
        "def hostId : String :="
        "def selfHostId : String :="
        "productPathFreestandingCapableOk"
        "productPathFreestandingCapablePartialReady"
        "def productPathFreestandingCapablePartialReady : Bool :="
        "def productPathFreestandingCapableInstallOnly : Bool := true"
        "def productPathFreestandingCapableRead : Bool := true"
        "def productPathFreestandingCapableCompose : Bool := true"
        "def productPathFreestandingCapableWriteHc : Bool := true"
        "def productPathFreestandingCapableFullPerform : Bool := false"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as CapableStepContract / InstallOut).
        "theorem productPathFreestandingCapablePartialReady_true"
        "CAPABLE-GAP-THEOREM"
        "HOST-CAPABLE-GAP-THEOREM"
        "CAPABLE-GAP-SMOKE"
        "HOST-CAPABLE-GAP-SMOKE"
        "CapableTheorems"
        "SystemsLean.Capable"
        "Capable"
        "freestanding-capable-gap"
        "slake-freestanding-capable-gap"
        "regenerate-product-path"
        "orderedPipelineRecipe"
        "justMeasureRecipe"
        "lakeExeName"
        "freestanding-capable-read-lake-free"
        "productPathFreestandingCapableReadLakeFreeRecipe"
        "freestanding-capable-compose-lake-free"
        "productPathFreestandingCapableComposeLakeFreeRecipe"
        "freestanding-capable-write-hc-lake-free"
        "productPathFreestandingCapableWriteHcLakeFreeRecipe"
        "FREESTANDING-PERFORM-GAP-READ-SSOT"
        "FREESTANDING-PERFORM-GAP-COMPOSE"
        "FREESTANDING-PERFORM-GAP-WRITE-HC"
        "WRITER-PATH-STEP-INSTALL-OUT"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Capable-gap theorems + smoke split (same namespace Capable).
      rel = "src/systems/SystemsLean/CapableTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "CapableTheorems"
        "SystemsLean.CapableTheorems"
        "import SystemsLean.Capable"
        "CAPABLE-GAP-THEOREM"
        "HOST-CAPABLE-GAP-THEOREM"
        "CAPABLE-GAP-SMOKE"
        "HOST-CAPABLE-GAP-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathFreestandingCapableOk_true"
        "productPathFreestandingCapablePartialReady_true"
        "theorem productPathFreestandingCapableOk_true"
        "theorem productPathFreestandingCapablePartialReady_true"
        "theorem productPathFreestandingCapableInstallOnly_true"
        "theorem productPathFreestandingCapableRead_true"
        "theorem productPathFreestandingCapableCompose_true"
        "theorem productPathFreestandingCapableWriteHc_true"
        "theorem productPathFreestandingCapableFullPerform_false"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP"
        "FREESTANDING-PERFORM-GAP-READ-SSOT"
        "FREESTANDING-PERFORM-GAP-COMPOSE"
        "FREESTANDING-PERFORM-GAP-WRITE-HC"
        "WRITER-PATH-STEP-INSTALL-OUT"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Step-contract module (B15 land-time; AuthorityNotEmit true /
      # Read+Compose+WriteHc satisfied true / Full long-name false). Dual-pin
      # thin batch 14: Ok/stage/recipe/exe/contract-step/blocker home-primary;
      # SelfApplyFs tip keeps honesty + chain fold only.
      # Long-file split: STEP-CONTRACT-THEOREM + SMOKE in
      # CapableStepContractTheorems (same namespace).
      rel = "src/systems/SystemsLean/CapableStepContract.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT"
        "def stageId : String :="
        "def hostId : String :="
        "def selfHostId : String :="
        "productPathFreestandingCapableStepContractOk"
        "productPathFreestandingCapableStepContractPartialReady"
        "def productPathFreestandingCapableStepContractPartialReady : Bool :="
        "def productPathFreestandingCapableStepContractAuthorityNotEmit : Bool := true"
        "def productPathFreestandingCapableStepContractReadSatisfied : Bool := true"
        "def productPathFreestandingCapableStepContractComposeSatisfied : Bool := true"
        "def productPathFreestandingCapableStepContractWriteHcSatisfied : Bool := true"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as CapableRead / CapableCompose).
        "theorem productPathFreestandingCapableStepContractPartialReady_true"
        "STEP-CONTRACT-THEOREM"
        "HOST-STEP-CONTRACT-THEOREM"
        "STEP-CONTRACT-SMOKE"
        "HOST-STEP-CONTRACT-SMOKE"
        "CapableStepContractTheorems"
        "SystemsLean.CapableStepContract"
        "CapableStepContract"
        "freestanding-capable-step-contract"
        "slake-freestanding-capable-step-contract"
        "justMeasureRecipe"
        "lakeExeName"
        "contractStepRead"
        "contractStepCompose"
        "contractStepWriteHc"
        "FREESTANDING-CAPABLE-STEP-CONTRACT-READ"
        "FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE"
        "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC"
        "freestandingCapableReadDualSsot"
        "freestandingCapableComposePlanApplyBody"
        "freestandingCapableWriteFreestandingHc"
        "BLOCKER-READ-STILL-LAKE-HOST-PRODUCT-PATH"
        "BLOCKER-COMPOSE-STILL-LAKE-HOST-PRODUCT-PATH"
        "BLOCKER-WRITE-HC-STILL-LAKE-HOST-PRODUCT-PATH"
        "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
        "FREESTANDING-PERFORM-GAP-READ-SSOT"
        "FREESTANDING-PERFORM-GAP-COMPOSE"
        "FREESTANDING-PERFORM-GAP-WRITE-HC"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Step-contract theorems + smoke split (same namespace CapableStepContract).
      rel = "src/systems/SystemsLean/CapableStepContractTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "CapableStepContractTheorems"
        "SystemsLean.CapableStepContractTheorems"
        "import SystemsLean.CapableStepContract"
        "STEP-CONTRACT-THEOREM"
        "HOST-STEP-CONTRACT-THEOREM"
        "STEP-CONTRACT-SMOKE"
        "HOST-STEP-CONTRACT-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathFreestandingCapableStepContractOk_true"
        "productPathFreestandingCapableStepContractPartialReady_true"
        "theorem productPathFreestandingCapableStepContractOk_true"
        "theorem productPathFreestandingCapableStepContractPartialReady_true"
        "theorem productPathFreestandingCapableStepContractAuthorityNotEmit_true"
        "theorem productPathFreestandingCapableStepContractReadSatisfied_true"
        "theorem productPathFreestandingCapableStepContractComposeSatisfied_true"
        "theorem productPathFreestandingCapableStepContractWriteHcSatisfied_true"
        "theorem productPathFreestandingCapableStepContractFullSatisfied_false"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT"
        "FREESTANDING-CAPABLE-STEP-CONTRACT-READ"
        "FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE"
        "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # READ module (B16 land-time; AuthorityNotEmit true / DependsOnLake true /
      # Full long-name false). Dual-pin thin batch 15: Ok/stage/recipe/exe/API
      # home-primary; SelfApplyFs tip keeps honesty + chain fold only.
      # Short role name CapableRead (batch 8).
      # Long-file split: READ-THEOREM + SMOKE in CapableReadTheorems
      # (same namespace).
      rel = "src/systems/SystemsLean/CapableRead.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ"
        "def stageId : String :="
        "def hostId : String :="
        "def selfHostId : String :="
        "productPathFreestandingCapableReadOk"
        "productPathFreestandingCapableReadPartialReady"
        "def productPathFreestandingCapableReadPartialReady : Bool :="
        "def productPathFreestandingCapableReadAuthorityNotEmit : Bool := true"
        "def productPathFreestandingCapableReadDependsOnLake : Bool := true"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as CapableCompose / SelfHostComplete).
        "theorem productPathFreestandingCapableReadPartialReady_true"
        "READ-THEOREM"
        "HOST-READ-THEOREM"
        "READ-SMOKE"
        "HOST-READ-SMOKE"
        "CapableReadTheorems"
        "freestandingCapableReadDualSsot"
        "freestandingCapableReadApi"
        "SystemsLean.CapableRead"
        "CapableRead"
        "lakeExeName"
        "justRecipeName"
        "freestanding-capable-read"
        "slake-freestanding-capable-read"
        "freestanding-capable-read-lake-free"
        "productPathFreestandingCapableReadLakeFreeRecipe"
        "FREESTANDING-CAPABLE-STEP-CONTRACT-READ"
        "FREESTANDING-PERFORM-GAP-READ-SSOT"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # READ theorems + smoke split (same namespace CapableRead).
      rel = "src/systems/SystemsLean/CapableReadTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "CapableReadTheorems"
        "SystemsLean.CapableReadTheorems"
        "import SystemsLean.CapableRead"
        "READ-THEOREM"
        "HOST-READ-THEOREM"
        "READ-SMOKE"
        "HOST-READ-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathFreestandingCapableReadOk_true"
        "productPathFreestandingCapableReadPartialReady_true"
        "theorem productPathFreestandingCapableReadOk_true"
        "theorem productPathFreestandingCapableReadPartialReady_true"
        "theorem productPathFreestandingCapableReadAuthorityNotEmit_true"
        "theorem productPathFreestandingCapableReadDependsOnLake_true"
        "theorem productPathFreestandingCapableStepContractFullSatisfied_false"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ"
        "FREESTANDING-CAPABLE-STEP-CONTRACT-READ"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # COMPOSE module (B17 land-time; AuthorityNotEmit true / DependsOnLake true /
      # Full long-name false). Batch-18 split: PartialReady bulk authority lives
      # here; SelfApplyFs re-exports.
      # Dual-pin thin batch 16: home-primary stage/host/recipe/exe/API.
      # Long-file split: COMPOSE-THEOREM + SMOKE in CapableComposeTheorems
      # (same namespace).
      rel = "src/systems/SystemsLean/CapableCompose.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_COMPOSE_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE"
        "def stageId : String :="
        "def hostId : String :="
        "def selfHostId : String :="
        "productPathFreestandingCapableComposeOk"
        "productPathFreestandingCapableComposePartialReady"
        "def productPathFreestandingCapableComposePartialReady : Bool :="
        "def productPathFreestandingCapableComposeAuthorityNotEmit : Bool := true"
        "def productPathFreestandingCapableComposeDependsOnLake : Bool := true"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as SelfHostComplete / OwnershipClaimed).
        "theorem productPathFreestandingCapableComposePartialReady_true"
        "COMPOSE-THEOREM"
        "HOST-COMPOSE-THEOREM"
        "COMPOSE-SMOKE"
        "HOST-COMPOSE-SMOKE"
        "CapableComposeTheorems"
        "freestandingCapableComposePlanApplyBody"
        "freestandingCapableComposeApi"
        "SystemsLean.CapableCompose"
        "CapableCompose"
        "lakeExeName"
        "justRecipeName"
        "freestanding-capable-compose"
        "slake-freestanding-capable-compose"
        "freestanding-capable-compose-lake-free"
        "productPathFreestandingCapableComposeLakeFreeRecipe"
        "FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE"
        "FREESTANDING-PERFORM-GAP-COMPOSE"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # COMPOSE theorems + smoke split (same namespace CapableCompose).
      rel = "src/systems/SystemsLean/CapableComposeTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "CapableComposeTheorems"
        "SystemsLean.CapableComposeTheorems"
        "import SystemsLean.CapableCompose"
        "COMPOSE-THEOREM"
        "HOST-COMPOSE-THEOREM"
        "COMPOSE-SMOKE"
        "HOST-COMPOSE-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathFreestandingCapableComposeOk_true"
        "productPathFreestandingCapableComposePartialReady_true"
        "theorem productPathFreestandingCapableComposeOk_true"
        "theorem productPathFreestandingCapableComposePartialReady_true"
        "theorem productPathFreestandingCapableComposeAuthorityNotEmit_true"
        "theorem productPathFreestandingCapableComposeDependsOnLake_true"
        "theorem productPathFreestandingCapableStepContractFullSatisfied_false"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE"
        "FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Dual-pin thin batch 17: home-primary stage/host/recipe/exe/API.
      # WRITE-HC module (B18 land-time; AuthorityNotEmit true / DependsOnLake true /
      # Full long-name false). PartialReady bulk authority lives here; tip fold only.
      # Long-file peel: load/assemble helpers in CapableWriteHcLoad (same namespace).
      rel = "src/systems/SystemsLean/CapableWriteHc.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC"
        "def hostId : String :="
        "def selfHostId : String :="
        "productPathFreestandingCapableWriteHcOk"
        "productPathFreestandingCapableWriteHcPartialReady"
        "def productPathFreestandingCapableWriteHcPartialReady : Bool :="
        "def productPathFreestandingCapableWriteHcAuthorityNotEmit : Bool := true"
        "def productPathFreestandingCapableWriteHcDependsOnLake : Bool := true"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        "theorem productPathFreestandingCapableWriteHcPartialReady_true"
        "freestandingCapableWriteFreestandingHc"
        "freestandingCapableWriteHcApi"
        "productPathCapableWriteDualEqualityLive"
        "DUAL-SSOT-EQUALITY"
        "SystemsLean.CapableWriteHc"
        "CapableWriteHc"
        "CapableWriteHcLoad"
        "lakeExeName"
        "justRecipeName"
        "freestanding-capable-write-hc"
        "slake-freestanding-capable-write-hc"
        "freestanding-capable-write-hc-lake-free"
        "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC"
        "FREESTANDING-PERFORM-GAP-WRITE-HC"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # CapableWriteHcLoad: dual SSOT load/assemble/dialect peel.
      rel = "src/systems/SystemsLean/CapableWriteHcLoad.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0"
        "CapableWriteHcLoad"
        "def stageId : String :="
        "def dualSsotBlockEqual"
        "def requireDualSsotEqual"
        "def dualSsotSpecs"
        "def freestandingCapableWriteLoadOneSsot"
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
      # Ordered regenerate module (B19 land-time; AuthorityNotEmit true / DependsOnLake
      # true / InstallOutOpen false / Full long-name false). Batch-16 split:
      # PartialReady bulk authority lives here; SelfApplyFs re-exports.
      # Dual-pin thin batch 18: home-primary stage/host/recipe/exe/API.
      # Long-file split: REGENERATE-THEOREM + SMOKE in
      # CapableRegenerateTheorems (same namespace).
      rel = "src/systems/SystemsLean/CapableRegenerate.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_REGENERATE_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE"
        "def stageId : String :="
        "def hostId : String :="
        "def selfHostId : String :="
        "productPathFreestandingCapableRegenerateOk"
        "productPathFreestandingCapableRegeneratePartialReady"
        "def productPathFreestandingCapableRegeneratePartialReady : Bool :="
        "def productPathFreestandingCapableRegenerateAuthorityNotEmit : Bool := true"
        "def productPathFreestandingCapableRegenerateDependsOnLake : Bool := true"
        "def productPathFreestandingCapableRegenerateInstallOutOpen : Bool := false"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as CapableFullBar / InstallOut).
        "theorem productPathFreestandingCapableRegeneratePartialReady_true"
        "REGENERATE-THEOREM"
        "HOST-REGENERATE-THEOREM"
        "REGENERATE-SMOKE"
        "HOST-REGENERATE-SMOKE"
        "CapableRegenerateTheorems"
        "freestandingCapableOrderedRegenerate"
        "freestandingCapableRegenerateApi"
        "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
        "SystemsLean.CapableRegenerate"
        "CapableRegenerate"
        "lakeExeName"
        "justRecipeName"
        "freestanding-capable-regenerate"
        "slake-freestanding-capable-regenerate"
        # M4 Name A product-wire without-Lake prebuilt pins
        "PRODUCT-WIRE-WITHOUT-LAKE"
        "productWireWithoutLakeFinishedClaimed"
        "justRecipeProductWireWithoutLake"
        "prebuiltCapableRegenerateRel"
        "productWireWithoutLakeKeepsHostLake"
        "productWireWithoutLakeReady"
        "freestanding-capable-regenerate-without-lake"
        "def productWireWithoutLakeFinishedClaimed : Bool := true"
        "def stillUsesLake : Bool := true"
        "def dependsOnLake : Bool := true"
        "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Ordered regenerate theorems + smoke split (same namespace CapableRegenerate).
      rel = "src/systems/SystemsLean/CapableRegenerateTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "CapableRegenerateTheorems"
        "SystemsLean.CapableRegenerateTheorems"
        "import SystemsLean.CapableRegenerate"
        "REGENERATE-THEOREM"
        "HOST-REGENERATE-THEOREM"
        "REGENERATE-SMOKE"
        "HOST-REGENERATE-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "orderedPipelineId_eq"
        "productPathFreestandingCapableRegenerateOk_true"
        "productPathFreestandingCapableRegeneratePartialReady_true"
        "theorem productPathFreestandingCapableRegenerateOk_true"
        "theorem productPathFreestandingCapableRegeneratePartialReady_true"
        "theorem productPathFreestandingCapableRegenerateAuthorityNotEmit_true"
        "theorem productPathFreestandingCapableRegenerateDependsOnLake_true"
        "theorem productPathFreestandingCapableRegenerateInstallOutOpen_false"
        "theorem productPathFreestandingCapableStepContractFullSatisfied_false"
        # M4 Name A product-wire without-Lake theorems + smoke
        "PRODUCT-WIRE-WITHOUT-LAKE"
        "productWireWithoutLakeFinishedClaimed_true"
        "productWireWithoutLakeKeepsHostLake_true"
        "productWireWithoutLakeReady_true"
        "justRecipeProductWireWithoutLake_eq"
        "prebuiltCapableRegenerateRel_eq"
        "theorem productWireWithoutLakeFinishedClaimed_true"
        "theorem productWireWithoutLakeReady_true"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE"
        "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
        "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Install Out module (B20 land-time; AuthorityNotEmit true / DependsOnLake true /
      # InstallOutOpen false / Full long-name false). Batch-15 split: PartialReady
      # bulk authority lives here; SelfApplyFs re-exports.
      # Long-file split: INSTALL-OUT-THEOREM + SMOKE in
      # InstallOutTheorems (same namespace).
      rel = "src/systems/SystemsLean/InstallOut.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_INSTALL_OUT_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT"
        "def stageId : String :="
        "def hostId : String :="
        "def selfHostId : String :="
        "productPathFreestandingCapableInstallOutOk"
        "productPathFreestandingCapableInstallOutPartialReady"
        "def productPathFreestandingCapableInstallOutPartialReady : Bool :="
        "def productPathFreestandingCapableInstallOutAuthorityNotEmit : Bool := true"
        "def productPathFreestandingCapableInstallOutDependsOnLake : Bool := true"
        "def productPathFreestandingCapableRegenerateInstallOutOpen : Bool := false"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as CapableStepContract / CapableRead).
        "theorem productPathFreestandingCapableInstallOutPartialReady_true"
        "INSTALL-OUT-THEOREM"
        "HOST-INSTALL-OUT-THEOREM"
        "INSTALL-OUT-SMOKE"
        "HOST-INSTALL-OUT-SMOKE"
        "InstallOutTheorems"
        "freestandingCapableInstallFreestandingOut"
        "SystemsLean.InstallOut"
        "InstallOut"
        "freestanding-capable-install-out"
        "slake-freestanding-capable-install-out"
        "FREESTANDING-CAPABLE-INSTALL-OUT"
        "WRITER-PATH-STEP-INSTALL-OUT"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Install Out theorems + smoke split (same namespace InstallOut).
      rel = "src/systems/SystemsLean/InstallOutTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "InstallOutTheorems"
        "SystemsLean.InstallOutTheorems"
        "import SystemsLean.InstallOut"
        "INSTALL-OUT-THEOREM"
        "HOST-INSTALL-OUT-THEOREM"
        "INSTALL-OUT-SMOKE"
        "HOST-INSTALL-OUT-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathFreestandingCapableInstallOutOk_true"
        "productPathFreestandingCapableInstallOutPartialReady_true"
        "theorem productPathFreestandingCapableInstallOutOk_true"
        "theorem productPathFreestandingCapableInstallOutPartialReady_true"
        "theorem productPathFreestandingCapableInstallOutAuthorityNotEmit_true"
        "theorem productPathFreestandingCapableInstallOutDependsOnLake_true"
        "theorem productPathFreestandingCapableRegenerateInstallOutOpen_false"
        "theorem productPathFreestandingCapableStepContractFullSatisfied_false"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT"
        "FREESTANDING-CAPABLE-INSTALL-OUT"
        "WRITER-PATH-STEP-INSTALL-OUT"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Full-bar module (B21 land-time; closed substrate true / DependsOnLake true /
      # Full long-name false). Batch-14 split: PartialReady bulk authority
      # lives here; SelfApplyFs re-exports.
      # Long-file split: FULL-BAR-THEOREM + SMOKE in
      # CapableFullBarTheorems (same namespace).
      rel = "src/systems/SystemsLean/CapableFullBar.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_FULL_BAR_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR"
        "productPathFreestandingCapableFullBarOk"
        "productPathFreestandingCapableFullBarPartialReady"
        "def productPathFreestandingCapableFullBarPartialReady : Bool :="
        "def productPathFreestandingCapableFullBarStepContractsClosed : Bool := true"
        "def productPathFreestandingCapableFullBarInstallOutClosed : Bool := true"
        "def productPathFreestandingCapableFullBarOrderedPipelineJoined : Bool := true"
        "def productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake : Bool := true"
        "def productPathFreestandingCapableFullBarCapableLakeFree : Bool := true"
        "def productPathFreestandingCapableFullBarDependsOnLake : Bool := true"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        "FULL-BAR-THEOREM"
        "HOST-FULL-BAR-THEOREM"
        "FULL-BAR-SMOKE"
        "HOST-FULL-BAR-SMOKE"
        "CapableFullBarTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as PerformEvidence / ProductPathComposePlan).
        "theorem productPathFreestandingCapableFullBarPartialReady_true"
        "SystemsLean.CapableFullBar"
        "CapableFullBar"
        "freestanding-capable-full-bar"
        "slake-freestanding-capable-full-bar"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # FULL-BAR theorems + smoke split (same namespace CapableFullBar).
      rel = "src/systems/SystemsLean/CapableFullBarTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "CapableFullBarTheorems"
        "SystemsLean.CapableFullBarTheorems"
        "import SystemsLean.CapableFullBar"
        "FULL-BAR-THEOREM"
        "HOST-FULL-BAR-THEOREM"
        "FULL-BAR-SMOKE"
        "HOST-FULL-BAR-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathFreestandingCapableFullBarOk_true"
        "productPathFreestandingCapableFullBarPartialReady_true"
        "theorem productPathFreestandingCapableFullBarOk_true"
        "theorem productPathFreestandingCapableFullBarPartialReady_true"
        "theorem productPathFreestandingCapableFullBarStepContractsClosed_true"
        "theorem productPathFreestandingCapableFullBarInstallOutClosed_true"
        "theorem productPathFreestandingCapableFullBarOrderedPipelineJoined_true"
        "theorem productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake_true"
        "theorem productPathFreestandingCapableFullBarCapableLakeFree_true"
        "theorem productPathFreestandingCapableFullBarDependsOnLake_true"
        "theorem productPathFreestandingCapableStepContractFullSatisfied_false"
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR"
        "FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE"
        "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
        "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
        "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Ownership regenerate module (B22..B30 land-time; WithoutLake true /
      # DependsOnLake true / Full long-name false / perform claimed false /
      # ownership claimed false). Batch-13 split: PartialReady bulk authority
      # lives here; SelfApplyFs re-exports.
      # Dual-pin thin batch 21: home-primary Ok/stage/recipe/exe/step ids.
      # Long-file peel: OWNERSHIP-REGENERATE-THEOREM + SMOKE in
      # ProductPathOwnershipRegenerateTheorems (same namespace).
      rel = "src/systems/SystemsLean/ProductPathOwnershipRegenerate.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"
        "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"
        "def stageId : String :="
        "def hostId : String :="
        "def selfHostId : String :="
        "productPathOwnershipRegenerateOk"
        "productPathOwnershipRegeneratePartialReady"
        "def productPathOwnershipRegeneratePartialReady : Bool :="
        "def productPathOwnershipRegenerateInstallLakeFree : Bool := true"
        "def productPathOwnershipRegenerateReadLakeFree : Bool := true"
        "def productPathOwnershipRegenerateComposeLakeFree : Bool := true"
        "def productPathOwnershipRegenerateWriteHcLakeFree : Bool := true"
        "def productPathOwnershipRegenerateLakeFreeJoinClaimed : Bool := true"
        "def productPathOwnershipRegenerateProductPathAuthorityClaimed : Bool := true"
        "def productPathOwnershipRegenerateWithoutLake : Bool := true"
        "def productPathOwnershipRegenerateDependsOnLake : Bool := true"
        "def productPathOwnershipRegenerateInstallPathClaimed : Bool := true"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        "OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE"
        "OWNERSHIP-REGENERATE-READ-LAKE-FREE"
        "OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE"
        "OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE"
        "OWNERSHIP-REGENERATE-LAKE-FREE-JOIN"
        "OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY"
        "OWNERSHIP-REGENERATE-THEOREM"
        "HOST-OWNERSHIP-REGENERATE-THEOREM"
        "OWNERSHIP-REGENERATE-SMOKE"
        "HOST-OWNERSHIP-REGENERATE-SMOKE"
        "ProductPathOwnershipRegenerateTheorems"
        "lakeExeName"
        "justMeasureRecipe"
        "lakeFreeInstallRecipe"
        "ownership-regenerate-install-only"
        "ownership-regenerate-read-only"
        "ownership-regenerate-compose-only"
        "ownership-regenerate-write-hc-only"
        "ownership-regenerate-lake-free"
        "ownership-regenerate-product-path-authority"
        # Greppable theorem cite (live def in Theorems module; same peel pattern
        # as ParityProgram). Emit-wire also greps this string on the home path.
        "theorem productPathOwnershipRegeneratePartialReady_true"
        "SystemsLean.ProductPathOwnershipRegenerate"
        "ProductPathOwnershipRegenerate"
        "ownership-regenerate"
        "slake-ownership-regenerate"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
  ];
}
