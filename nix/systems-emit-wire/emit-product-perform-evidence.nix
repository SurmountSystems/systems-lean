# SPDX-License-Identifier: Unlicense
# Data slice for systems-emit-wire emit product. Joined by emit-product.nix.
# No bash, no Python in eval.
rec {
  productPathFreestandingPerformEvidenceStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_EVIDENCE_V0";
  productPathFreestandingPerformEvidenceHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE";
  productPathFreestandingPerformEvidenceSelfHostId =
    "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE";
  productPathFreestandingPerformEvidenceModulePath =
    "src/systems/SystemsLean/PerformEvidence.lean";
  # Dual-pin thin batch 22: home-primary stage/host/recipe/exe/Ok/step ids.
  productPathFreestandingPerformEvidenceModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_EVIDENCE_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE"
    "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE"
    "def stageId : String :="
    "def hostId : String :="
    "def selfHostId : String :="
    "productPathFreestandingPerformEvidenceOk"
    "productPathFreestandingPerformEvidenceClaimed"
    "productPathFreestandingPerformEvidencePartialReady"
    "def productPathFreestandingPerformEvidencePartialReady : Bool :="
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "FREESTANDING-PERFORM-EVIDENCE"
    "FREESTANDING-PERFORM-EVIDENCE-READ-SSOT"
    "FREESTANDING-PERFORM-EVIDENCE-COMPOSE"
    "FREESTANDING-PERFORM-EVIDENCE-WRITE-HC"
    "FREESTANDING-PERFORM-EVIDENCE-INSTALL-OUT"
    "FREESTANDING-PERFORM-EVIDENCE-ORDERED"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "FREESTANDING-PERFORM-GAP-READ-SSOT"
    "FREESTANDING-PERFORM-GAP-COMPOSE"
    "FREESTANDING-PERFORM-GAP-WRITE-HC"
    "freestandingCapableReadDualSsot"
    "freestandingCapableComposePlanApplyBody"
    "freestandingCapableWriteFreestandingHc"
    "freestandingCapableInstallFreestandingOut"
    "freestandingCapableOrderedRegenerate"
    "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
    "freestanding-perform-evidence"
    "freestanding-perform-evidence-measure"
    "slake-freestanding-perform-evidence"
    "lakeExeName"
    "justMeasureRecipe"
    "lakeFreeEvidenceRecipe"
    "freestanding-capable-read-lake-free"
    "freestanding-capable-compose-lake-free"
    "freestanding-capable-write-hc-lake-free"
    "install-freestanding-c-out"
    "PerformEvidence"
    "theorem productPathFreestandingPerformEvidencePartialReady_true"
  ];
  productPathFreestandingPerformEvidenceModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    # B31: evidence claimed dual-pin; forbid dishonest false / perform claimed true forge.
    "def productPathFreestandingPerformEvidenceClaimed : Bool := false"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathPerformDependsOnLake : Bool := false"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := true"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathFreestandingPerformEvidenceLakefilePath = "src/systems/lakefile.lean";
  productPathFreestandingPerformEvidenceLakefileTokens = [
    "slake-freestanding-perform-evidence"
    "SystemsLean.PerformEvidenceMain"
  ];
  productPathFreestandingPerformEvidenceJustPath = "just/freestanding-perform-1.just";
  productPathFreestandingPerformEvidenceJustTokens = [
    "freestanding-perform-evidence"
    "freestanding-perform-evidence-measure"
    "slake-freestanding-perform-evidence"
    "PerformEvidence"
    "lake build slake-freestanding-perform-evidence"
    "lake exe slake-freestanding-perform-evidence"
    "FREESTANDING-PERFORM-EVIDENCE"
    "FREESTANDING-PERFORM-EVIDENCE-READ-SSOT"
    "FREESTANDING-PERFORM-EVIDENCE-COMPOSE"
    "FREESTANDING-PERFORM-EVIDENCE-WRITE-HC"
    "FREESTANDING-PERFORM-EVIDENCE-INSTALL-OUT"
    "FREESTANDING-PERFORM-EVIDENCE-ORDERED"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    # B31 Lake-free evidence recipe banners (unique to freestanding-perform-evidence).
    "token: FREESTANDING-PERFORM-EVIDENCE"
    "framing: perform evidence (freestanding-capable performers); not ownership authority"
    "pipeline cite: FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
    "distinct from B30 ownership-regenerate-product-path-authority (ownership framing)"
    "def productPathFreestandingCapableReadAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableComposeAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableWriteHcAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableRegenerateAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableInstallOutAuthorityNotEmit : Bool := true"
    "def productPathFreestandingPerformEvidenceClaimed : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := false"
    "def productPathPerformDependsOnLake : Bool := true"
    "just freestanding-capable-read-lake-free"
    "just freestanding-capable-compose-lake-free"
    "just freestanding-capable-write-hc-lake-free"
    "just install-freestanding-c-out"
  ];
  productPathFreestandingPerformEvidenceAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE"
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_EVIDENCE_V0"
    "productPathFreestandingPerformEvidencePartialReady"
    "productPathFreestandingPerformEvidenceClaimed"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "FREESTANDING-PERFORM-EVIDENCE"
    "FREESTANDING-PERFORM-EVIDENCE-READ-SSOT"
    "FREESTANDING-PERFORM-EVIDENCE-COMPOSE"
    "FREESTANDING-PERFORM-EVIDENCE-WRITE-HC"
    "FREESTANDING-PERFORM-EVIDENCE-INSTALL-OUT"
    "FREESTANDING-PERFORM-EVIDENCE-ORDERED"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "freestanding-perform-evidence"
    "freestanding-perform-evidence-measure"
    "slake-freestanding-perform-evidence"
    "PerformEvidence"
    "product path freestanding perform evidence"
  ];

  # Partial B32: freestanding product path perform official-path gap beyond B31.
  # Gap measured true (freestanding-perform-official-path); perform claimed false;
  # DependsOnLake true; land-time B32 FreestandingEmit official pin; living tip
  # B38 FreestandingEmit retired; FULL-BAR open.
  productPathFreestandingPerformOfficialPathStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0";
  productPathFreestandingPerformOfficialPathHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH";
  productPathFreestandingPerformOfficialPathSelfHostId =
    "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH";
  productPathFreestandingPerformOfficialPathModulePath =
    "src/systems/SystemsLean/OfficialPath.lean";
  # Dual-pin thin batch 23: home-primary stage/host/recipe/exe/Ok/step ids
  # (land-time StillUses FreestandingEmit true / Retire required true).
  productPathFreestandingPerformOfficialPathModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH"
    "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH"
    "def stageId : String :="
    "def hostId : String :="
    "def selfHostId : String :="
    "productPathFreestandingPerformOfficialPathOk"
    "productPathFreestandingPerformOfficialPathGapMeasured"
    "productPathFreestandingPerformOfficialPathPartialReady"
    "def productPathFreestandingPerformOfficialPathPartialReady : Bool :="
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "productPathFreestandingPerformEvidenceClaimed"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathStillUsesLake"
    "productPathOfficialPathRetireFreestandingEmitRequired"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-GAP"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-FREESTANDING-EMIT"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-LAKE"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-RETIRE-FREESTANDING-EMIT"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-RECIPE"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-WRITER"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-LAKE-EXE"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "build"
    "FreestandingEmit"
    "slake-emit-freestanding-c"
    "freestanding-perform-official-path"
    "freestanding-perform-official-path-measure"
    "slake-freestanding-perform-official-path"
    "lakeExeName"
    "justMeasureRecipe"
    "lakeFreeOfficialPathRecipe"
    "freestanding-perform-evidence"
    "OfficialPath"
    "theorem productPathFreestandingPerformOfficialPathPartialReady_true"
  ];
  productPathFreestandingPerformOfficialPathModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    # B32: gap measured dual-pin; forbid dishonest false / perform claimed true forge.
    "def productPathFreestandingPerformOfficialPathGapMeasured : Bool := false"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathPerformDependsOnLake : Bool := false"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
    "def productPathOfficialPathStillUsesLake : Bool := false"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := true"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathFreestandingPerformOfficialPathLakefilePath = "src/systems/lakefile.lean";
  productPathFreestandingPerformOfficialPathLakefileTokens = [
    "slake-freestanding-perform-official-path"
    "SystemsLean.OfficialPathMain"
  ];
  productPathFreestandingPerformOfficialPathJustPath = "just/freestanding-perform-1.just";
  productPathFreestandingPerformOfficialPathJustTokens = [
    "freestanding-perform-official-path"
    "freestanding-perform-official-path-measure"
    "slake-freestanding-perform-official-path"
    "OfficialPath"
    "lake build slake-freestanding-perform-official-path"
    "lake exe slake-freestanding-perform-official-path"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-GAP"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-FREESTANDING-EMIT"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-LAKE"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-RETIRE-FREESTANDING-EMIT"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    # B32 Lake-free official-path gap recipe banners (land-time vs living tip B38).
    "token: FREESTANDING-PERFORM-OFFICIAL-PATH-GAP"
    "framing: land-time B32 Lake FreestandingEmit official pin; living tip B38 FreestandingEmit retired; B31 evidence remains"
    "distinct from B31 freestanding-perform-evidence (evidence substrate, not gap measure)"
    "def productPathFreestandingPerformOfficialPathGapMeasured : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := false"
    "def productPathPerformDependsOnLake : Bool := true"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
    "def productPathOfficialPathStillUsesLake : Bool := true"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true"
    "lake build slake-emit-freestanding-c"
    "lake exe slake-emit-freestanding-c"
    "just freestanding-perform-evidence"
  ];
  productPathFreestandingPerformOfficialPathAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH"
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_V0"
    "productPathFreestandingPerformOfficialPathPartialReady"
    "productPathFreestandingPerformOfficialPathGapMeasured"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-GAP"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-FREESTANDING-EMIT"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-STILL-LAKE"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-RETIRE-FREESTANDING-EMIT"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "freestanding-perform-official-path"
    "freestanding-perform-official-path-measure"
    "slake-freestanding-perform-official-path"
    "OfficialPath"
    "product path freestanding perform official path"
  ];

  # Partial B33: freestanding product path perform official-path alternate beyond B32.
  # Alternate measured true (freestanding-perform-official-path-alternate); perform
  # claimed false; DependsOnLake true; dual-equality blocks retirement; FULL-BAR open.
  productPathFreestandingPerformOfficialPathAlternateStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_ALTERNATE_V0";
  productPathFreestandingPerformOfficialPathAlternateHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE";
  productPathFreestandingPerformOfficialPathAlternateSelfHostId =
    "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE";
  productPathFreestandingPerformOfficialPathAlternateModulePath =
    "src/systems/SystemsLean/OfficialPathAlternate.lean";
  productPathFreestandingPerformOfficialPathAlternateModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_ALTERNATE_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE"
    "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE"
    # Dual-pin thin batch 24: home-primary stage/host/recipe/exe/step ids.
    "def stageId : String :="
    "def hostId : String :="
    "def selfHostId : String :="
    "productPathFreestandingPerformOfficialPathAlternateOk"
    "productPathFreestandingPerformOfficialPathAlternateMeasured"
    "productPathFreestandingPerformOfficialPathAlternatePartialReady"
    "def productPathFreestandingPerformOfficialPathAlternatePartialReady : Bool :="
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "productPathFreestandingPerformOfficialPathGapMeasured"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathStillUsesLake"
    "productPathOfficialPathRetireFreestandingEmitRequired"
    "productPathOfficialPathAlternateWriterPresent"
    "productPathOfficialPathAlternateNotOfficial"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-WRITER"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-NOT-OFFICIAL"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "officialPathAlternateId"
    "officialPathAlternateWriterId"
    "officialPathAlternateNotOfficialId"
    "officialPathDualEqualityBlocksId"
    "lakeFreeAlternateRecipe"
    "justMeasureRecipe"
    "lakeExeName"
    "alternateWriterRecipe"
    "alternateWriterApi"
    "alternateWriterPipeline"
    "build"
    "FreestandingEmit"
    "slake-emit-freestanding-c"
    "freestanding-capable-regenerate"
    "freestandingCapableOrderedRegenerate"
    "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
    "CapableRegenerate"
    "freestanding-perform-official-path-alternate"
    "freestanding-perform-official-path-alternate-measure"
    "slake-freestanding-perform-official-path-alternate"
    "freestanding-perform-official-path"
    "theorem productPathFreestandingPerformOfficialPathAlternatePartialReady_true"
  ];
  productPathFreestandingPerformOfficialPathAlternateModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    # B33: alternate measured dual-pin; forbid dishonest false / perform claimed true forge.
    "def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := false"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathPerformDependsOnLake : Bool := false"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
    "def productPathOfficialPathStillUsesLake : Bool := false"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
    "def productPathOfficialPathAlternateWriterPresent : Bool := false"
    "def productPathOfficialPathAlternateNotOfficial : Bool := false"
    "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := true"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathFreestandingPerformOfficialPathAlternateLakefilePath =
    "src/systems/lakefile.lean";
  productPathFreestandingPerformOfficialPathAlternateLakefileTokens = [
    "slake-freestanding-perform-official-path-alternate"
    "SystemsLean.OfficialPathAlternateMain"
  ];
  productPathFreestandingPerformOfficialPathAlternateJustPath = "just/freestanding-perform-1.just";
  productPathFreestandingPerformOfficialPathAlternateJustTokens = [
    "freestanding-perform-official-path-alternate"
    "freestanding-perform-official-path-alternate-measure"
    "slake-freestanding-perform-official-path-alternate"
    "OfficialPathAlternate"
    "lake build slake-freestanding-perform-official-path-alternate"
    "lake exe slake-freestanding-perform-official-path-alternate"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-WRITER"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-NOT-OFFICIAL"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    # B33 Lake-free official-path alternate recipe banners.
    "token: FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE"
    "framing: freestanding-capable-regenerate alternate present; land-time not official; dual-equality blocks at B33 land; living tip B38 same writer official"
    "distinct from B32 freestanding-perform-official-path (gap measure, not alternate dual-pin)"
    "def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := false"
    "def productPathPerformDependsOnLake : Bool := true"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
    "def productPathOfficialPathStillUsesLake : Bool := true"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true"
    "def productPathOfficialPathAlternateWriterPresent : Bool := true"
    "def productPathOfficialPathAlternateNotOfficial : Bool := true"
    "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true"
    "lake build slake-emit-freestanding-c"
    "lake exe slake-emit-freestanding-c"
    "just freestanding-perform-official-path"
  ];
  productPathFreestandingPerformOfficialPathAlternateAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE"
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_OFFICIAL_PATH_ALTERNATE_V0"
    "productPathFreestandingPerformOfficialPathAlternatePartialReady"
    "productPathFreestandingPerformOfficialPathAlternateMeasured"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathAlternateWriterPresent"
    "productPathOfficialPathAlternateNotOfficial"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-WRITER"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-ALTERNATE-NOT-OFFICIAL"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "freestanding-perform-official-path-alternate"
    "freestanding-perform-official-path-alternate-measure"
    "slake-freestanding-perform-official-path-alternate"
    "OfficialPathAlternate"
    "product path freestanding perform official path alternate"
  ];

  # Partial B34: freestanding product path perform dual-equality WRITE parity beyond B33.
  # Parity measured true (freestanding-perform-dual-equality-write-parity); gap open true;
  # Capable WRITE structural not dual-equality; perform claimed false; DependsOnLake true;
  # dual-equality blocks retirement; FULL-BAR open.
  productPathFreestandingPerformDualEqualityWriteParityStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_PARITY_V0";
  productPathFreestandingPerformDualEqualityWriteParityHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY";
  productPathFreestandingPerformDualEqualityWriteParitySelfHostId =
    "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY";
  productPathFreestandingPerformDualEqualityWriteParityModulePath =
    "src/systems/SystemsLean/DualEqWriteParity.lean";
  productPathFreestandingPerformDualEqualityWriteParityModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_PARITY_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
    "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
    "productPathFreestandingPerformDualEqualityWriteParityOk"
    "productPathFreestandingPerformDualEqualityWriteParityMeasured"
    "productPathFreestandingPerformDualEqualityWriteParityPartialReady"
    "productPathDualEqualityWriteParityGapOpen"
    "productPathCapableWriteStructuralNotDualEquality"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "productPathFreestandingPerformOfficialPathAlternateMeasured"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathStillUsesLake"
    "productPathOfficialPathRetireFreestandingEmitRequired"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-GAP-OPEN"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-CAPABLE-STRUCTURAL"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-OFFICIAL-EMIT"
    "FREESTANDING-PERFORM-OFFICIAL-PATH-DUAL-EQUALITY-BLOCKS-RETIREMENT"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "build"
    "FreestandingEmit"
    "slake-emit-freestanding-c"
    "DUAL-SSOT-EQUALITY"
    "requireDualSsotEqual"
    "freestandingCapableWriteFreestandingHc"
    "CapableWriteHc"
    "freestanding-perform-dual-equality-write-parity"
    "freestanding-perform-dual-equality-write-parity-measure"
    "slake-freestanding-perform-dual-equality-write-parity"
    "freestanding-perform-official-path-alternate"
  ];
  productPathFreestandingPerformDualEqualityWriteParityModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    # B34: parity measured dual-pin; forbid dishonest false / perform claimed true forge.
    "def productPathFreestandingPerformDualEqualityWriteParityMeasured : Bool := false"
    "def productPathDualEqualityWriteParityGapOpen : Bool := false"
    "def productPathCapableWriteStructuralNotDualEquality : Bool := false"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathPerformDependsOnLake : Bool := false"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
    "def productPathOfficialPathStillUsesLake : Bool := false"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
    "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := true"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathFreestandingPerformDualEqualityWriteParityLakefilePath =
    "src/systems/lakefile.lean";
  productPathFreestandingPerformDualEqualityWriteParityLakefileTokens = [
    "slake-freestanding-perform-dual-equality-write-parity"
    "SystemsLean.DualEqWriteParityMain"
  ];
  productPathFreestandingPerformDualEqualityWriteParityJustPath = "just/freestanding-perform-1.just";
  productPathFreestandingPerformDualEqualityWriteParityJustTokens = [
    "freestanding-perform-dual-equality-write-parity"
    "freestanding-perform-dual-equality-write-parity-measure"
    "slake-freestanding-perform-dual-equality-write-parity"
    "DualEqWriteParity"
    "lake build slake-freestanding-perform-dual-equality-write-parity"
    "lake exe slake-freestanding-perform-dual-equality-write-parity"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-GAP-OPEN"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-CAPABLE-STRUCTURAL"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-OFFICIAL-EMIT"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    # B34 Lake-free dual-equality WRITE parity recipe banners.
    "token: FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
    "framing: Capable WRITE structural embed != FreestandingEmit DUAL-SSOT-EQUALITY; gap open"
    "distinct from B33 freestanding-perform-official-path-alternate (alternate dual-pin, not WRITE parity)"
    "def productPathFreestandingPerformDualEqualityWriteParityMeasured : Bool := true"
    "def productPathDualEqualityWriteParityGapOpen : Bool := true"
    "def productPathCapableWriteStructuralNotDualEquality : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := false"
    "def productPathPerformDependsOnLake : Bool := true"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
    "def productPathOfficialPathStillUsesLake : Bool := true"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true"
    "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true"
    "lake build slake-emit-freestanding-c"
    "lake exe slake-emit-freestanding-c"
    "just freestanding-perform-official-path-alternate"
  ];
  productPathFreestandingPerformDualEqualityWriteParityAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_PARITY_V0"
    "productPathFreestandingPerformDualEqualityWriteParityPartialReady"
    "productPathFreestandingPerformDualEqualityWriteParityMeasured"
    "productPathDualEqualityWriteParityGapOpen"
    "productPathCapableWriteStructuralNotDualEquality"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-GAP-OPEN"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-CAPABLE-STRUCTURAL"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-OFFICIAL-EMIT"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "freestanding-perform-dual-equality-write-parity"
    "freestanding-perform-dual-equality-write-parity-measure"
    "slake-freestanding-perform-dual-equality-write-parity"
    "DualEqWriteParity"
    "product path freestanding perform dual equality write parity"
  ];

  # Partial B35: freestanding product path perform dual-equality WRITE close path beyond B34.
  # Close path measured true (freestanding-perform-dual-equality-write-close-path); named true;
  # not gap closed true; gap open true; Capable WRITE structural not dual-equality; perform claimed
  # false; DependsOnLake true; dual-equality blocks retirement; FULL-BAR open.
}
