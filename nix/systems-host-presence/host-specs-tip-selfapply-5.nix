# SPDX-License-Identifier: Unlicense
# Host presence token specs slice. Joined via specs.nix. Sub-1-KLOC.
# No bash, no Python.
{
  hostSpecsTipSelfApply5 = [
    {
      # OWNERSHIP-CLAIMED theorems + smoke peel (same namespace OwnershipClaimed).
      rel = "src/systems/SystemsLean/OwnershipClaimedTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "OwnershipClaimedTheorems"
        "SystemsLean.OwnershipClaimedTheorems"
        "import SystemsLean.OwnershipClaimed"
        "OWNERSHIP-CLAIMED-THEOREM"
        "HOST-OWNERSHIP-CLAIMED-THEOREM"
        "OWNERSHIP-CLAIMED-SMOKE"
        "HOST-OWNERSHIP-CLAIMED-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathFreestandingOwnershipClaimedOk_true"
        "productPathFreestandingOwnershipClaimedPartialReady_true"
        "theorem productPathFreestandingOwnershipClaimedOk_true"
        "theorem productPathFreestandingOwnershipClaimedPartialReady_true"
        "theorem productPathFreestandingOwnershipClaimedMeasured_true"
        "theorem productPathFreestandingOwnershipClaimedStepAdvanced_true"
        "theorem productPathFreestandingOwnershipClaimed_true"
        "theorem productPathFreestandingPerformClaimed_true"
        "theorem freestandingProductSelfHostComplete_false"
        "SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED"
        "FREESTANDING-OWNERSHIP-CLAIMED"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Full step-contract close-path fold (after B40 OWNERSHIP-CLAIMED).
      # PartialReady fold lives in SelfApplyFsClose; claim bool SSoT on tip.
      # Short role name stepContractFull; complete true after claim B.
      rel = "src/systems/SystemsLean/SelfApplyFsClose.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL"
        "stepContractFullPartialReady"
        "def stepContractFullMeasured : Bool := true"
        "def stepContractFullStepAdvanced : Bool := true"
        "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL"
        "StepContractFull"
        "product path freestanding step contract full"
        "SelfApplyFsClose"
      ];
    }
    {
      # Full step-contract short module (after B40 OWNERSHIP-CLAIMED).
      # Batch-2 split: PartialReady bulk authority lives here; SelfApplyFs re-exports.
      # Long-file role module: STEP-CONTRACT-FULL-THEOREM + SMOKE in
      # StepContractFullTheorems (same namespace).
      rel = "src/systems/SystemsLean/StepContractFull.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_STEP_CONTRACT_FULL_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL"
        "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL"
        "FREESTANDING-STEP-CONTRACT-FULL"
        "stepContractFullMeasured"
        "stepContractFullOk"
        "stepContractFullStepAdvanced"
        "stepContractFullPartialReady"
        "def stepContractFull : Bool := true"
        "def stepContractFullPartialReady : Bool :="
        "def productPathFreestandingOwnershipClaimed : Bool := true"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
        "def freestandingProductSelfHostComplete : Bool := true"
        "STEP-CONTRACT-FULL-THEOREM"
        "HOST-STEP-CONTRACT-FULL-THEOREM"
        "STEP-CONTRACT-FULL-SMOKE"
        "HOST-STEP-CONTRACT-FULL-SMOKE"
        "StepContractFullTheorems"
        # Greppable theorem cite (live def in Theorems module; same peel pattern
        # as ProductPathOwnershipRegenerate).
        "theorem stepContractFullPartialReady_true"
        "SystemsLean.StepContractFull"
        "StepContractFull"
        "freestanding-step-contract-full"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Full step-contract theorems + smoke peel (same namespace StepContractFull).
      rel = "src/systems/SystemsLean/StepContractFullTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "StepContractFullTheorems"
        "SystemsLean.StepContractFullTheorems"
        "import SystemsLean.StepContractFull"
        "STEP-CONTRACT-FULL-THEOREM"
        "HOST-STEP-CONTRACT-FULL-THEOREM"
        "STEP-CONTRACT-FULL-SMOKE"
        "HOST-STEP-CONTRACT-FULL-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "stepContractFullOk_true"
        "stepContractFullPartialReady_true"
        "theorem stepContractFullOk_true"
        "theorem stepContractFullPartialReady_true"
        "theorem stepContractFullMeasured_true"
        "theorem stepContractFullStepAdvanced_true"
        "theorem stepContractFull_true"
        "theorem productPathFreestandingOwnershipClaimed_true"
        "theorem productPathFreestandingPerformClaimed_true"
        "theorem freestandingProductSelfHostComplete_true"
        "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL"
        "FREESTANDING-STEP-CONTRACT-FULL"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Claim B freestanding product self-host complete (after Full).
      # Batch-1 split: PartialReady bulk authority lives here; SelfApplyFs re-exports.
      # Long-file peel: COMPLETE-THEOREM + SMOKE in
      # SelfHostCompleteTheorems (same namespace).
      rel = "src/systems/SystemsLean/SelfHostComplete.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_FREESTANDING_PRODUCT_COMPLETE_V0"
        "HOST-SELF-HOST-FREESTANDING-PRODUCT-COMPLETE"
        "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE"
        "FREESTANDING-PRODUCT-SELF-HOST-COMPLETE"
        "freestandingProductSelfHostCompleteMeasured"
        "freestandingProductSelfHostCompleteOk"
        "freestandingProductSelfHostCompleteStepAdvanced"
        "freestandingProductSelfHostCompletePartialReady"
        "def freestandingProductSelfHostComplete : Bool := true"
        "def freestandingProductSelfHostCompletePartialReady : Bool :="
        "def stepContractFull : Bool := true"
        "def productPathFreestandingOwnershipClaimed : Bool := true"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
        "def residualFreeClaimed : Bool := true"
        "def llvmUnlocked : Bool := false"
        "def provablyUnlocked : Bool := true"
        "COMPLETE-THEOREM"
        "HOST-COMPLETE-THEOREM"
        "COMPLETE-SMOKE"
        "HOST-COMPLETE-SMOKE"
        "SelfHostCompleteTheorems"
        # Greppable theorem cite (live def in Theorems module; same peel pattern
        # as StepContractFull / OwnershipClaimed).
        "theorem freestandingProductSelfHostCompletePartialReady_true"
        "SystemsLean.SelfHostComplete"
        "SelfHostComplete"
        "freestanding-self-host-complete"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Complete theorems + smoke peel (same namespace SelfHostComplete).
      rel = "src/systems/SystemsLean/SelfHostCompleteTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SelfHostCompleteTheorems"
        "SystemsLean.SelfHostCompleteTheorems"
        "import SystemsLean.SelfHostComplete"
        "COMPLETE-THEOREM"
        "HOST-COMPLETE-THEOREM"
        "COMPLETE-SMOKE"
        "HOST-COMPLETE-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "freestandingProductSelfHostCompleteOk_true"
        "freestandingProductSelfHostCompletePartialReady_true"
        "theorem freestandingProductSelfHostCompleteOk_true"
        "theorem freestandingProductSelfHostCompletePartialReady_true"
        "theorem freestandingProductSelfHostCompleteMeasured_true"
        "theorem freestandingProductSelfHostCompleteStepAdvanced_true"
        "theorem freestandingProductSelfHostComplete_true"
        "theorem stepContractFull_true"
        "theorem productPathFreestandingOwnershipClaimed_true"
        "theorem productPathFreestandingPerformClaimed_true"
        "theorem residualFreeClaimed_true"
        "theorem llvmUnlocked_false"
        "theorem provablyUnlocked_true"
        "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE"
        "FREESTANDING-PRODUCT-SELF-HOST-COMPLETE"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # SelfApplyFsClose complete PartialReady fold (claim B after Full).
      # Living complete bool SSoT stays on SelfApplyFs tip.
      rel = "src/systems/SystemsLean/SelfApplyFsClose.lean";
      all = [
        "freestandingProductSelfHostCompletePartialReady"
        "def freestandingProductSelfHostCompleteMeasured : Bool := true"
        "def freestandingProductSelfHostCompleteStepAdvanced : Bool := true"
        "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE"
        "SelfHostComplete"
        "SelfApplyFsClose"
      ];
    }
    {
      # SelfApplyFs tip still owns living claim bool SSoT (complete / Full / ownership / perform).
      rel = "src/systems/SystemsLean/SelfApplyFs.lean";
      all = [
        "def freestandingProductSelfHostComplete : Bool := true"
        "def stepContractFull : Bool := true"
        "def productPathFreestandingOwnershipClaimed : Bool := true"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
        "SelfApplyFsClose"
        "selfApplyFsCloseModuleCite"
      ];
    }
  ];
}
