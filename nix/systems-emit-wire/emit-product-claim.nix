# SPDX-License-Identifier: Unlicense
# Data slice for systems-emit-wire emit product. Joined by emit-product.nix.
# No bash, no Python in eval.
rec {
  productPathOfficialPathRetireOfficialStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_RETIRE_OFFICIAL_V0";
  productPathOfficialPathRetireOfficialHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL";
  productPathOfficialPathRetireOfficialSelfHostId =
    "SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL";
  productPathOfficialPathRetireOfficialModulePath =
    "src/systems/SystemsLean/OfficialRetire.lean";
  productPathOfficialPathRetireOfficialModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_RETIRE_OFFICIAL_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL"
    "SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL"
    "productPathOfficialPathRetireOfficialOk"
    "productPathOfficialPathRetireOfficialMeasured"
    "productPathOfficialPathRetireOfficialStepAdvanced"
    "productPathOfficialPathRetireOfficialPartialReady"
    "productPathOfficialPathUsesDualEqualityWrite"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathStillUsesLake"
    "productPathOfficialPathRetireFreestandingEmitRequired"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "productPathFreestandingPerformDualEqualityWriteCapableGapMeasured"
    "FREESTANDING-PERFORM-RETIRE-OFFICIAL"
    "FREESTANDING-PERFORM-RETIRE-OFFICIAL-MEASURED"
    "FREESTANDING-PERFORM-RETIRE-OFFICIAL-USES-DUAL-EQ-WRITE"
    "FREESTANDING-PERFORM-RETIRE-OFFICIAL-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "build"
    "freestanding-capable-regenerate"
    "freestandingCapableOrderedRegenerate"
    "freestandingCapableWriteFreestandingHc"
    "CapableWriteHc"
    "DUAL-SSOT-EQUALITY"
    "requireDualSsotEqual"
    "freestanding-retire-official"
    "freestanding-retire-official-measure"
    "slake-freestanding-retire-official"
    "OfficialRetire"
    "freestanding-perform-dual-equality-write-capable-gap"
  ];
  productPathOfficialPathRetireOfficialModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    # B38: RETIRE-OFFICIAL dual-pin; forbid dishonest re-open / perform claimed forge.
    "def productPathOfficialPathRetireOfficialMeasured : Bool := false"
    "def productPathOfficialPathRetireOfficialStepAdvanced : Bool := false"
    "def productPathOfficialPathUsesDualEqualityWrite : Bool := false"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
    "def productPathOfficialPathStillUsesLake : Bool := true"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true"
    "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathPerformDependsOnLake : Bool := true"
    "def productPathDualEqualityWriteParityGapOpen : Bool := true"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := true"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathOfficialPathRetireOfficialLakefilePath =
    "src/systems/lakefile.lean";
  productPathOfficialPathRetireOfficialLakefileTokens = [
    "slake-freestanding-retire-official"
    "SystemsLean.OfficialRetireMain"
  ];
  productPathOfficialPathRetireOfficialJustPath = "just/freestanding-perform-3.just";
  productPathOfficialPathRetireOfficialJustTokens = [
    "freestanding-retire-official"
    "freestanding-retire-official-measure"
    "slake-freestanding-retire-official"
    "OfficialRetire"
    "lake build slake-freestanding-retire-official"
    "lake exe slake-freestanding-retire-official"
    "FREESTANDING-PERFORM-RETIRE-OFFICIAL"
    "FREESTANDING-PERFORM-RETIRE-OFFICIAL-MEASURED"
    "FREESTANDING-PERFORM-RETIRE-OFFICIAL-USES-DUAL-EQ-WRITE"
    "FREESTANDING-PERFORM-RETIRE-OFFICIAL-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "token: FREESTANDING-PERFORM-RETIRE-OFFICIAL"
    "framing: official just build uses freestanding dual-eq WRITE; FreestandingEmit retired"
    "distinct from B37 freestanding-perform-dual-equality-write-capable-gap (CAPABLE-GAP close, not official retire)"
    "def productPathOfficialPathRetireOfficialMeasured : Bool := true"
    "def productPathOfficialPathUsesDualEqualityWrite : Bool := true"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
    "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
    "def productPathFreestandingPerformClaimed : Bool := false"
    "def productPathPerformDependsOnLake : Bool := false"
    "def productPathOfficialPathStillUsesLake : Bool := false"
    "freestanding-capable-regenerate"
    "just freestanding-perform-dual-equality-write-capable-gap"
  ];
  productPathOfficialPathRetireOfficialAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL"
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_RETIRE_OFFICIAL_V0"
    "productPathOfficialPathRetireOfficialPartialReady"
    "productPathOfficialPathRetireOfficialMeasured"
    "productPathOfficialPathUsesDualEqualityWrite"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "FREESTANDING-PERFORM-RETIRE-OFFICIAL"
    "FREESTANDING-PERFORM-RETIRE-OFFICIAL-MEASURED"
    "FREESTANDING-PERFORM-RETIRE-OFFICIAL-USES-DUAL-EQ-WRITE"
    "FREESTANDING-PERFORM-RETIRE-OFFICIAL-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "freestanding-retire-official"
    "freestanding-retire-official-measure"
    "slake-freestanding-retire-official"
    "OfficialRetire"
    "product path freestanding perform retire official"
  ];

  # Partial B39: freestanding perform PERFORM-CLAIMED (close-path step PERFORM-CLAIMED).
  # Official dual-eq WRITE evidence; productPathFreestandingPerformClaimed true;
  # StillUsesFreestandingEmit false; DualEqualityBlocks false; RetireRequired false;
  # StillUsesLake true; DependsOnLake true; ownership claimed false; complete false;
  # CAPABLE-GAP stays closed; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed with evidence.
  productPathFreestandingPerformClaimedStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_CLAIMED_V0";
  productPathFreestandingPerformClaimedHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED";
  productPathFreestandingPerformClaimedSelfHostId =
    "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED";
  productPathFreestandingPerformClaimedModulePath =
    "src/systems/SystemsLean/PerformClaimed.lean";
  productPathFreestandingPerformClaimedModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_CLAIMED_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED"
    "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED"
    "productPathFreestandingPerformClaimedOk"
    "productPathFreestandingPerformClaimedMeasured"
    "productPathFreestandingPerformClaimedStepAdvanced"
    "productPathFreestandingPerformClaimedPartialReady"
    "productPathFreestandingPerformClaimed"
    "productPathOfficialPathUsesDualEqualityWrite"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathStillUsesLake"
    "productPathOfficialPathRetireFreestandingEmitRequired"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "productPathOfficialPathRetireOfficialMeasured"
    "productPathPerformDependsOnLake"
    "productPathFreestandingPerformDualEqualityWriteCapableGapMeasured"
    "productPathFreestandingOwnershipClaimed"
    "freestandingProductSelfHostComplete"
    "FREESTANDING-PERFORM-CLAIMED"
    "FREESTANDING-PERFORM-CLAIMED-MEASURED"
    "FREESTANDING-PERFORM-CLAIMED-WITH-OFFICIAL-DUAL-EQ-WRITE"
    "FREESTANDING-PERFORM-CLAIMED-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "build"
    "freestanding-capable-regenerate"
    "freestandingCapableOrderedRegenerate"
    "freestandingCapableWriteFreestandingHc"
    "CapableWriteHc"
    "DUAL-SSOT-EQUALITY"
    "requireDualSsotEqual"
    "freestanding-perform-claimed"
    "freestanding-perform-claimed-measure"
    "slake-freestanding-perform-claimed"
    "PerformClaimed"
    "freestanding-retire-official"
    "freestanding-perform-dual-equality-write-capable-gap"
  ];
  productPathFreestandingPerformClaimedModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    # B39: PERFORM-CLAIMED dual-pin; forbid dishonest flip-back / complete forge.
    # M6: product StillUsesLake / DependsOnLake false (forbid re-open to true).
    "def productPathFreestandingPerformClaimedMeasured : Bool := false"
    "def productPathFreestandingPerformClaimedStepAdvanced : Bool := false"
    "def productPathFreestandingPerformClaimed : Bool := false"
    "def productPathOfficialPathUsesDualEqualityWrite : Bool := false"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
    "def productPathOfficialPathStillUsesLake : Bool := true"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true"
    "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true"
    "def productPathOfficialPathRetireOfficialMeasured : Bool := false"
    "def productPathPerformDependsOnLake : Bool := true"
    "def productPathDualEqualityWriteParityGapOpen : Bool := true"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := true"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathFreestandingPerformClaimedLakefilePath =
    "src/systems/lakefile.lean";
  productPathFreestandingPerformClaimedLakefileTokens = [
    "slake-freestanding-perform-claimed"
    "SystemsLean.PerformClaimedMain"
  ];
  productPathFreestandingPerformClaimedJustPath = "just/freestanding-perform-3.just";
  productPathFreestandingPerformClaimedJustTokens = [
    "freestanding-perform-claimed"
    "freestanding-perform-claimed-measure"
    "slake-freestanding-perform-claimed"
    "PerformClaimed"
    "lake build slake-freestanding-perform-claimed"
    "lake exe slake-freestanding-perform-claimed"
    "FREESTANDING-PERFORM-CLAIMED"
    "FREESTANDING-PERFORM-CLAIMED-MEASURED"
    "FREESTANDING-PERFORM-CLAIMED-WITH-OFFICIAL-DUAL-EQ-WRITE"
    "FREESTANDING-PERFORM-CLAIMED-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "token: FREESTANDING-PERFORM-CLAIMED"
    "framing: official dual-eq WRITE evidence; SelfApplyFs perform claimed true; ownership false"
    "distinct from B38 freestanding-retire-official (RETIRE-OFFICIAL, land-time not claimed)"
    "def productPathFreestandingPerformClaimedMeasured : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathOfficialPathUsesDualEqualityWrite : Bool := true"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
    "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
    "def productPathOfficialPathRetireOfficialMeasured : Bool := true"
    "def productPathPerformDependsOnLake : Bool := false"
    "def productPathOfficialPathStillUsesLake : Bool := false"
    # Land-time PerformClaimed.lean keeps ownership false; SelfApplyFs living tip true after B40.
    "def productPathFreestandingOwnershipClaimed : Bool := false"
    "def freestandingProductSelfHostComplete : Bool := false"
    "freestanding-capable-regenerate"
    "just freestanding-retire-official"
    "SelfApplyFs living tip ownership claimed true after B40"
  ];
  productPathFreestandingPerformClaimedAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED"
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_CLAIMED_V0"
    "productPathFreestandingPerformClaimedPartialReady"
    "productPathFreestandingPerformClaimedMeasured"
    "productPathFreestandingPerformClaimed"
    "productPathOfficialPathUsesDualEqualityWrite"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "productPathPerformDependsOnLake"
    "FREESTANDING-PERFORM-CLAIMED"
    "FREESTANDING-PERFORM-CLAIMED-MEASURED"
    "FREESTANDING-PERFORM-CLAIMED-WITH-OFFICIAL-DUAL-EQ-WRITE"
    "FREESTANDING-PERFORM-CLAIMED-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "freestanding-perform-claimed"
    "freestanding-perform-claimed-measure"
    "slake-freestanding-perform-claimed"
    "PerformClaimed"
    "product path freestanding perform claimed"
  ];

  # Partial B40: freestanding ownership OWNERSHIP-CLAIMED (close-path step OWNERSHIP-CLAIMED).
  # perform-claimed + official dual-eq WRITE evidence; productPathFreestandingOwnershipClaimed true;
  # StillUsesFreestandingEmit false; DualEqualityBlocks false; RetireRequired false;
  # StillUsesLake true; DependsOnLake true; Full false; complete false;
  # CAPABLE-GAP stays closed; FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE closed with evidence.
  productPathFreestandingOwnershipClaimedStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_CLAIMED_V0";
  productPathFreestandingOwnershipClaimedHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED";
  productPathFreestandingOwnershipClaimedSelfHostId =
    "SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED";
  productPathFreestandingOwnershipClaimedModulePath =
    "src/systems/SystemsLean/OwnershipClaimed.lean";
  productPathFreestandingOwnershipClaimedModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_CLAIMED_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED"
    "SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED"
    "productPathFreestandingOwnershipClaimedOk"
    "productPathFreestandingOwnershipClaimedMeasured"
    "productPathFreestandingOwnershipClaimedStepAdvanced"
    "productPathFreestandingOwnershipClaimedPartialReady"
    "productPathFreestandingOwnershipClaimed"
    "productPathFreestandingPerformClaimed"
    "productPathOfficialPathUsesDualEqualityWrite"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathStillUsesLake"
    "productPathOfficialPathRetireFreestandingEmitRequired"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "productPathOfficialPathRetireOfficialMeasured"
    "productPathPerformDependsOnLake"
    "productPathFreestandingPerformDualEqualityWriteCapableGapMeasured"
    "freestandingProductSelfHostComplete"
    "FREESTANDING-OWNERSHIP-CLAIMED"
    "FREESTANDING-OWNERSHIP-CLAIMED-MEASURED"
    "FREESTANDING-OWNERSHIP-CLAIMED-WITH-PERFORM-CLAIMED-DUAL-EQ-WRITE"
    "FREESTANDING-OWNERSHIP-CLAIMED-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED"
    "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "build"
    "freestanding-capable-regenerate"
    "freestandingCapableOrderedRegenerate"
    "freestandingCapableWriteFreestandingHc"
    "CapableWriteHc"
    "DUAL-SSOT-EQUALITY"
    "requireDualSsotEqual"
    "freestanding-ownership-claimed"
    "freestanding-ownership-claimed-measure"
    "slake-freestanding-ownership-claimed"
    "OwnershipClaimed"
    "freestanding-perform-claimed"
    "freestanding-retire-official"
    "freestanding-perform-dual-equality-write-capable-gap"
  ];
  productPathFreestandingOwnershipClaimedModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    # B40: OWNERSHIP-CLAIMED dual-pin; forbid dishonest flip-back / complete forge.
    # M6: product StillUsesLake / DependsOnLake false (forbid re-open to true).
    "def productPathFreestandingOwnershipClaimedMeasured : Bool := false"
    "def productPathFreestandingOwnershipClaimedStepAdvanced : Bool := false"
    "def productPathFreestandingOwnershipClaimed : Bool := false"
    "def productPathFreestandingPerformClaimed : Bool := false"
    "def productPathOfficialPathUsesDualEqualityWrite : Bool := false"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
    "def productPathOfficialPathStillUsesLake : Bool := true"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true"
    "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true"
    "def productPathOfficialPathRetireOfficialMeasured : Bool := false"
    "def productPathPerformDependsOnLake : Bool := true"
    "def productPathDualEqualityWriteParityGapOpen : Bool := true"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := true"
    "def freestandingProductSelfHostComplete : Bool := true"
  ];
  productPathFreestandingOwnershipClaimedLakefilePath =
    "src/systems/lakefile.lean";
  productPathFreestandingOwnershipClaimedLakefileTokens = [
    "slake-freestanding-ownership-claimed"
    "SystemsLean.OwnershipClaimedMain"
  ];
  productPathFreestandingOwnershipClaimedJustPath = "just/freestanding-perform-3.just";
  productPathFreestandingOwnershipClaimedJustTokens = [
    "freestanding-ownership-claimed"
    "freestanding-ownership-claimed-measure"
    "slake-freestanding-ownership-claimed"
    "OwnershipClaimed"
    "lake build slake-freestanding-ownership-claimed"
    "lake exe slake-freestanding-ownership-claimed"
    "FREESTANDING-OWNERSHIP-CLAIMED"
    "FREESTANDING-OWNERSHIP-CLAIMED-MEASURED"
    "FREESTANDING-OWNERSHIP-CLAIMED-WITH-PERFORM-CLAIMED-DUAL-EQ-WRITE"
    "FREESTANDING-OWNERSHIP-CLAIMED-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED"
    "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
    "token: FREESTANDING-OWNERSHIP-CLAIMED"
    "framing: perform-claimed + official dual-eq WRITE evidence; SelfApplyFs ownership claimed true; living tip stepContractFull true after Full"
    "distinct from B39 freestanding-perform-claimed (PERFORM-CLAIMED, land-time not ownership)"
    "def productPathFreestandingOwnershipClaimedMeasured : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathOfficialPathUsesDualEqualityWrite : Bool := true"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
    "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
    "def productPathOfficialPathRetireOfficialMeasured : Bool := true"
    "def productPathPerformDependsOnLake : Bool := false"
    "def productPathOfficialPathStillUsesLake : Bool := false"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
    "def stepContractFull : Bool := true"
    "def freestandingProductSelfHostComplete : Bool := true"
    "freestanding-capable-regenerate"
    "just freestanding-perform-claimed"
  ];
  productPathFreestandingOwnershipClaimedAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED"
    "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED"
    "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_CLAIMED_V0"
    "productPathFreestandingOwnershipClaimedPartialReady"
    "productPathFreestandingOwnershipClaimedMeasured"
    "productPathFreestandingOwnershipClaimed"
    "productPathFreestandingPerformClaimed"
    "productPathOfficialPathUsesDualEqualityWrite"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "productPathPerformDependsOnLake"
    "FREESTANDING-OWNERSHIP-CLAIMED"
    "FREESTANDING-OWNERSHIP-CLAIMED-MEASURED"
    "FREESTANDING-OWNERSHIP-CLAIMED-WITH-PERFORM-CLAIMED-DUAL-EQ-WRITE"
    "FREESTANDING-OWNERSHIP-CLAIMED-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED"
    "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
    "freestanding-ownership-claimed"
    "freestanding-ownership-claimed-measure"
    "slake-freestanding-ownership-claimed"
    "OwnershipClaimed"
    "product path freestanding ownership claimed"
  ];


  # Full freestanding-capable step-contract after B40 OWNERSHIP-CLAIMED.
  # Living tip short name stepContractFull; complete true after claim B.
  stepContractFullStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_STEP_CONTRACT_FULL_V0";
  stepContractFullHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL";
  stepContractFullSelfHostId =
    "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL";
  stepContractFullModulePath =
    "src/systems/SystemsLean/StepContractFull.lean";
  stepContractFullModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_STEP_CONTRACT_FULL_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL"
    "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL"
    "stepContractFullOk"
    "stepContractFullMeasured"
    "stepContractFullStepAdvanced"
    "stepContractFullPartialReady"
    "stepContractFull"
    "productPathFreestandingOwnershipClaimed"
    "productPathFreestandingPerformClaimed"
    "productPathOfficialPathUsesDualEqualityWrite"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathStillUsesLake"
    "productPathOfficialPathRetireFreestandingEmitRequired"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "productPathOfficialPathRetireOfficialMeasured"
    "productPathPerformDependsOnLake"
    "productPathFreestandingPerformDualEqualityWriteCapableGapMeasured"
    "freestandingProductSelfHostComplete"
    "FREESTANDING-STEP-CONTRACT-FULL"
    "FREESTANDING-STEP-CONTRACT-FULL-MEASURED"
    "FREESTANDING-STEP-CONTRACT-FULL-WITH-OWNERSHIP-PERFORM-DUAL-EQ-WRITE"
    "FREESTANDING-STEP-CONTRACT-FULL-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED"
    "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "build"
    "freestanding-capable-regenerate"
    "freestandingCapableOrderedRegenerate"
    "freestandingCapableWriteFreestandingHc"
    "CapableWriteHc"
    "DUAL-SSOT-EQUALITY"
    "requireDualSsotEqual"
    "freestanding-step-contract-full"
    "freestanding-step-contract-full-measure"
    "slake-freestanding-step-contract-full"
    "StepContractFull"
    "freestanding-ownership-claimed"
    "freestanding-perform-claimed"
    "freestanding-retire-official"
    "freestanding-perform-dual-equality-write-capable-gap"
  ];
  stepContractFullModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    # Full dual-pin; forbid dishonest flip-back / complete forge.
    # M6: product StillUsesLake / DependsOnLake false (forbid re-open to true).
    "def stepContractFullMeasured : Bool := false"
    "def stepContractFullStepAdvanced : Bool := false"
    "def stepContractFull : Bool := false"
    "def productPathFreestandingOwnershipClaimed : Bool := false"
    "def productPathFreestandingPerformClaimed : Bool := false"
    "def productPathOfficialPathUsesDualEqualityWrite : Bool := false"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
    "def productPathOfficialPathStillUsesLake : Bool := true"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true"
    "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true"
    "def productPathOfficialPathRetireOfficialMeasured : Bool := false"
    "def productPathPerformDependsOnLake : Bool := true"
    "def productPathDualEqualityWriteParityGapOpen : Bool := true"
  ];
  stepContractFullLakefilePath =
    "src/systems/lakefile.lean";
  stepContractFullLakefileTokens = [
    "slake-freestanding-step-contract-full"
    "SystemsLean.StepContractFullMain"
  ];
  stepContractFullJustPath = "just/freestanding-complete.just";
  stepContractFullJustTokens = [
    "freestanding-step-contract-full"
    "freestanding-step-contract-full-measure"
    "slake-freestanding-step-contract-full"
    "StepContractFull"
    "lake build slake-freestanding-step-contract-full"
    "lake exe slake-freestanding-step-contract-full"
    "FREESTANDING-STEP-CONTRACT-FULL"
    "FREESTANDING-STEP-CONTRACT-FULL-MEASURED"
    "FREESTANDING-STEP-CONTRACT-FULL-WITH-OWNERSHIP-PERFORM-DUAL-EQ-WRITE"
    "FREESTANDING-STEP-CONTRACT-FULL-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL"
    "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
    "token: FREESTANDING-STEP-CONTRACT-FULL"
    "framing: ownership-claimed + perform-claimed + official dual-eq WRITE evidence; SelfApplyFs stepContractFull true; complete true after claim B"
    "distinct from B40 freestanding-ownership-claimed (OWNERSHIP-CLAIMED, land-time Full long-name false)"
    "def stepContractFullMeasured : Bool := true"
    "def stepContractFull : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathOfficialPathUsesDualEqualityWrite : Bool := true"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
    "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
    "def productPathOfficialPathRetireOfficialMeasured : Bool := true"
    "def productPathPerformDependsOnLake : Bool := false"
    "def productPathOfficialPathStillUsesLake : Bool := false"
    "def freestandingProductSelfHostComplete : Bool := true"
    "freestanding-capable-regenerate"
    "just freestanding-ownership-claimed"
  ];
  stepContractFullAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL"
    "HOST-SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL"
    "SLAKE_SELF_HOST_PRODUCT_PATH_STEP_CONTRACT_FULL_V0"
    "stepContractFullPartialReady"
    "stepContractFullMeasured"
    "stepContractFull"
    "productPathFreestandingOwnershipClaimed"
    "productPathFreestandingPerformClaimed"
    "productPathOfficialPathUsesDualEqualityWrite"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "productPathPerformDependsOnLake"
    "FREESTANDING-STEP-CONTRACT-FULL"
    "FREESTANDING-STEP-CONTRACT-FULL-MEASURED"
    "FREESTANDING-STEP-CONTRACT-FULL-WITH-OWNERSHIP-PERFORM-DUAL-EQ-WRITE"
    "FREESTANDING-STEP-CONTRACT-FULL-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL"
    "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
    "freestanding-step-contract-full"
    "freestanding-step-contract-full-measure"
    "slake-freestanding-step-contract-full"
    "StepContractFull"
    "product path freestanding step contract full"
  ];

  # Claim B freestanding product self-host complete (after Full).
  # Living tip freestandingProductSelfHostComplete true; residual free true;
  # llvm/PROVABLY false; host elaborator residual remains.
  selfHostCompleteStageId =
    "SLAKE_SELF_HOST_FREESTANDING_PRODUCT_COMPLETE_V0";
  selfHostCompleteHostId =
    "HOST-SELF-HOST-FREESTANDING-PRODUCT-COMPLETE";
  selfHostCompleteSelfHostId =
    "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE";
  selfHostCompleteModulePath =
    "src/systems/SystemsLean/SelfHostComplete.lean";
  selfHostCompleteModuleTokens = [
    "SLAKE_SELF_HOST_FREESTANDING_PRODUCT_COMPLETE_V0"
    "HOST-SELF-HOST-FREESTANDING-PRODUCT-COMPLETE"
    "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE"
    "freestandingProductSelfHostCompleteOk"
    "freestandingProductSelfHostCompleteMeasured"
    "freestandingProductSelfHostCompleteStepAdvanced"
    "freestandingProductSelfHostComplete"
    "stepContractFull"
    "productPathFreestandingOwnershipClaimed"
    "productPathFreestandingPerformClaimed"
    "productPathOfficialPathUsesDualEqualityWrite"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathStillUsesLake"
    "productPathPerformDependsOnLake"
    "residualFreeClaimed"
    "FREESTANDING-PRODUCT-SELF-HOST-COMPLETE"
    "FREESTANDING-PRODUCT-SELF-HOST-COMPLETE-MEASURED"
    "FREESTANDING-PRODUCT-SELF-HOST-COMPLETE-WITH-FULL-OWNERSHIP-PERFORM-DUAL-EQ-WRITE"
    "FREESTANDING-PRODUCT-SELF-HOST-COMPLETE-STEP-ADVANCED"
    "freestanding-self-host-complete"
    "freestanding-self-host-complete-measure"
    "slake-freestanding-self-host-complete"
    "SelfHostComplete"
    "def freestandingProductSelfHostCompleteMeasured : Bool := true"
    "def freestandingProductSelfHostCompleteStepAdvanced : Bool := true"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def stepContractFull : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
    "def productPathOfficialPathStillUsesLake : Bool := false"
    "def productPathPerformDependsOnLake : Bool := false"
    "def residualFreeClaimed : Bool := true"
    "def llvmUnlocked : Bool := false"
    "def provablyUnlocked : Bool := true"
  ];
  selfHostCompleteModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "def freestandingProductSelfHostCompleteMeasured : Bool := false"
    "def freestandingProductSelfHostCompleteStepAdvanced : Bool := false"
    "def freestandingProductSelfHostComplete : Bool := false"
    "def stepContractFull : Bool := false"
    "def productPathFreestandingOwnershipClaimed : Bool := false"
    "def productPathFreestandingPerformClaimed : Bool := false"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
    "def productPathOfficialPathStillUsesLake : Bool := true"
    "def productPathPerformDependsOnLake : Bool := true"
    "def residualFreeClaimed : Bool := false"
    "def llvmUnlocked : Bool := true"
    "def provablyUnlocked : Bool := false"
  ];
  selfHostCompleteLakefilePath = "src/systems/lakefile.lean";
  selfHostCompleteLakefileTokens = [
    "slake-freestanding-self-host-complete"
    "SystemsLean.SelfHostComplete"
  ];
  selfHostCompleteJustPath = "just/freestanding-complete.just";
  selfHostCompleteJustTokens = [
    "freestanding-self-host-complete"
    "freestanding-self-host-complete-measure"
    "slake-freestanding-self-host-complete"
    "SelfHostComplete"
    "framing: Full + ownership-claimed + perform-claimed + official dual-eq WRITE evidence; SelfApplyFs freestandingProductSelfHostComplete true"
    "def freestandingProductSelfHostCompleteMeasured : Bool := true"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def stepContractFull : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
    "just freestanding-step-contract-full"
  ];
  selfHostCompleteAcceptanceTokens = [
    "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE"
    "FREESTANDING-PRODUCT-SELF-HOST-COMPLETE"
    "SLAKE_SELF_HOST_FREESTANDING_PRODUCT_COMPLETE_V0"
    "freestandingProductSelfHostCompletePartialReady"
    "freestandingProductSelfHostCompleteMeasured"
    "freestandingProductSelfHostComplete"
  ];


}
