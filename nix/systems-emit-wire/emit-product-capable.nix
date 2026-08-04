# SPDX-License-Identifier: Unlicense
# Data slice for systems-emit-wire emit product. Joined by emit-product.nix.
# No bash, no Python in eval.
rec {
  productPathFreestandingCapableStageId = "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0";
  productPathFreestandingCapableHostId = "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP";
  productPathFreestandingCapableSelfHostId = "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP";
  productPathFreestandingCapableModulePath = "src/systems/SystemsLean/Capable.lean";
  # Dual-pin thin batch 13: home owns stage/host/recipe/exe/Ok/LakeFree bulk.
  productPathFreestandingCapableModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP"
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP"
    "def stageId : String :="
    "def hostId : String :="
    "def selfHostId : String :="
    "productPathFreestandingCapableInstallOnly"
    "productPathFreestandingCapableRead"
    "productPathFreestandingCapableCompose"
    "productPathFreestandingCapableWriteHc"
    "productPathFreestandingCapableFullPerform"
    "productPathFreestandingCapableOk"
    "productPathFreestandingCapablePartialReady"
    "def productPathFreestandingCapablePartialReady : Bool :="
    "theorem productPathFreestandingCapablePartialReady_true"
    "regenerate-product-path"
    "orderedPipelineRecipe"
    "freestanding-capable-gap"
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
    "slake-freestanding-capable-gap"
    "def productPathFreestandingCapableInstallOnly : Bool := true"
    "def productPathFreestandingCapableRead : Bool := true"
    "def productPathFreestandingCapableCompose : Bool := true"
    "def productPathFreestandingCapableWriteHc : Bool := true"
    "def productPathFreestandingCapableFullPerform : Bool := false"
  ];
  productPathFreestandingCapableModuleForbiddenTokens = [
    "def productPathFreestandingCapableFullPerform : Bool := true"
    "def productPathFreestandingCapableRead : Bool := false"
    "def productPathFreestandingCapableCompose : Bool := false"
    "def productPathFreestandingCapableWriteHc : Bool := false"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathFreestandingCapableLakefilePath = "src/systems/lakefile.lean";
  productPathFreestandingCapableLakefileTokens = [
    "slake-freestanding-capable-gap"
    "SystemsLean.CapableMain"
  ];
  productPathFreestandingCapableJustPath = "just/freestanding-capable.just";
  productPathFreestandingCapableJustTokens = [
    "regenerate-product-path"
    "freestanding-capable-gap"
    "freestanding-capable-read-lake-free"
    "freestanding-capable-compose-lake-free"
    "freestanding-capable-write-hc-lake-free"
    "slake-freestanding-capable-gap"
    "Capable"
    "lake build slake-freestanding-capable-gap"
    "lake exe slake-freestanding-capable-gap"
    "just read-product-ssot"
    "just compose-product-plan"
    "just write-freestanding-hc"
    "just install-freestanding-c-out"
    "productPathFreestandingCapableRead true"
    "productPathFreestandingCapableCompose true"
    "productPathFreestandingCapableWriteHc true"
  ];
  productPathFreestandingCapableAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP"
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_GAP_V0"
    "productPathFreestandingCapablePartialReady"
    "productPathFreestandingCapableInstallOnly"
    "productPathFreestandingCapableRead"
    "productPathFreestandingCapableCompose"
    "productPathFreestandingCapableWriteHc"
    "productPathFreestandingCapableFullPerform"
    "regenerate-product-path"
    "freestanding-capable-gap"
    "freestanding-capable-read-lake-free"
    "freestanding-capable-compose-lake-free"
    "freestanding-capable-write-hc-lake-free"
    "slake-freestanding-capable-gap"
    "Capable"
    "product path freestanding capable gap"
    "productPathFreestandingPerformClaimed"
    "FREESTANDING-PERFORM-GAP-READ-SSOT"
    "FREESTANDING-PERFORM-GAP-COMPOSE"
    "FREESTANDING-PERFORM-GAP-WRITE-HC"
  ];

  # Claim B path: freestanding-capable step contract / interface (partial B15).
  # CapableStepContract names freestanding-capable READ/
  # COMPOSE/WRITE-HC contracts + API surface + authority-not-FreestandingEmit;
  # all satisfied false. just freestanding-capable-step-contract diagnostic.
  # perform claimed false; complete false. Not freestanding-capable close.
  productPathFreestandingCapableStepContractStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0";
  productPathFreestandingCapableStepContractHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT";
  productPathFreestandingCapableStepContractSelfHostId =
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT";
  productPathFreestandingCapableStepContractModulePath =
    "src/systems/SystemsLean/CapableStepContract.lean";
  productPathFreestandingCapableStepContractModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT"
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT"
    "def stageId : String :="
    "def hostId : String :="
    "def selfHostId : String :="
    "productPathFreestandingCapableStepContractAuthorityNotEmit"
    "productPathFreestandingCapableStepContractReadSatisfied"
    "productPathFreestandingCapableStepContractComposeSatisfied"
    "productPathFreestandingCapableStepContractWriteHcSatisfied"
    "productPathFreestandingCapableStepContractFullSatisfied"
    "productPathFreestandingCapableStepContractOk"
    "productPathFreestandingCapableStepContractPartialReady"
    "def productPathFreestandingCapableStepContractPartialReady : Bool :="
    "theorem productPathFreestandingCapableStepContractPartialReady_true"
    "def productPathFreestandingCapableStepContractAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableStepContractReadSatisfied : Bool := true"
    "def productPathFreestandingCapableStepContractComposeSatisfied : Bool := true"
    "def productPathFreestandingCapableStepContractWriteHcSatisfied : Bool := true"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
    "FREESTANDING-CAPABLE-STEP-CONTRACT-READ"
    "FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE"
    "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC"
    "contractStepRead"
    "contractStepCompose"
    "contractStepWriteHc"
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
    "freestanding-capable-step-contract"
    "justMeasureRecipe"
    "lakeExeName"
    "slake-freestanding-capable-step-contract"
  ];
  productPathFreestandingCapableStepContractModuleForbiddenTokens = [
    # B16..B18: ReadSatisfied + ComposeSatisfied + WriteHcSatisfied true
    # (required elsewhere); keep Full false.
    "def productPathFreestandingCapableStepContractReadSatisfied : Bool := false"
    "def productPathFreestandingCapableStepContractComposeSatisfied : Bool := false"
    "def productPathFreestandingCapableStepContractWriteHcSatisfied : Bool := false"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := true"
    "def productPathFreestandingCapableStepContractAuthorityNotEmit : Bool := false"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathFreestandingCapableStepContractLakefilePath = "src/systems/lakefile.lean";
  productPathFreestandingCapableStepContractLakefileTokens = [
    "slake-freestanding-capable-step-contract"
    "SystemsLean.CapableStepContractMain"
  ];
  productPathFreestandingCapableStepContractJustPath = "just/freestanding-capable.just";
  productPathFreestandingCapableStepContractJustTokens = [
    "freestanding-capable-step-contract"
    "slake-freestanding-capable-step-contract"
    "CapableStepContract"
    "lake build slake-freestanding-capable-step-contract"
    "lake exe slake-freestanding-capable-step-contract"
  ];
  productPathFreestandingCapableStepContractAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT"
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0"
    "productPathFreestandingCapableStepContractPartialReady"
    "productPathFreestandingCapableStepContractAuthorityNotEmit"
    "productPathFreestandingCapableStepContractReadSatisfied"
    "productPathFreestandingCapableStepContractFullSatisfied"
    "freestanding-capable-step-contract"
    "slake-freestanding-capable-step-contract"
    "CapableStepContract"
    "product path freestanding capable step contract"
    "FREESTANDING-CAPABLE-STEP-CONTRACT-READ"
    "FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE"
    "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC"
    "freestandingCapableReadDualSsot"
    "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
    "productPathFreestandingPerformClaimed"
    "FREESTANDING-PERFORM-GAP-READ-SSOT"
    "FREESTANDING-PERFORM-GAP-COMPOSE"
    "FREESTANDING-PERFORM-GAP-WRITE-HC"
  ];

  # Partial B16 + B26: freestanding-capable READ dual SSOT without FreestandingEmit
  # as product authority (freestandingCapableReadDualSsot). Dual-pin thin batch 15:
  # home owns stageId/hostId/selfHostId/recipe/exe/API/Ok/PartialReady bulk;
  # tip keeps EntrypointClaimed/AuthorityNotEmit/DependsOnLake honesty + chain fold.
  # ReadSatisfied true; B14 CapableRead true after B26 freestanding-capable-read-lake-free;
  # CapableCompose true after B27; CapableWriteHc true after B28; Full unsatisfied;
  # perform claimed false.
  productPathFreestandingCapableReadStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0";
  productPathFreestandingCapableReadHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ";
  productPathFreestandingCapableReadSelfHostId =
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ";
  productPathFreestandingCapableReadModulePath =
    "src/systems/SystemsLean/CapableRead.lean";
  productPathFreestandingCapableReadModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ"
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ"
    "def stageId : String :="
    "def hostId : String :="
    "def selfHostId : String :="
    "freestandingCapableReadDualSsot"
    "freestandingCapableReadApi"
    "productPathFreestandingCapableReadOk"
    "productPathFreestandingCapableReadPartialReady"
    "def productPathFreestandingCapableReadPartialReady : Bool :="
    "def productPathFreestandingCapableReadAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableReadDependsOnLake : Bool := true"
    "theorem productPathFreestandingCapableReadPartialReady_true"
    "lakeExeName"
    "justRecipeName"
    "FREESTANDING-CAPABLE-STEP-CONTRACT-READ"
    "FREESTANDING-PERFORM-GAP-READ-SSOT"
    "IO.FS.readFile"
    "slake-freestanding-capable-read"
    "freestanding-capable-read"
    "freestanding-capable-read-lake-free"
    "productPathFreestandingCapableReadLakeFreeRecipe"
  ];
  productPathFreestandingCapableReadModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "def emitAtRoot"
    "def renderHeader"
    "def renderSource"
    "IO.FS.writeFile"
    "IO.FS.createDir"
    "def productPathFreestandingCapableReadAuthorityNotEmit : Bool := false"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathFreestandingCapableReadLakefilePath = "src/systems/lakefile.lean";
  productPathFreestandingCapableReadLakefileTokens = [
    "slake-freestanding-capable-read"
    "SystemsLean.CapableReadMain"
  ];
  productPathFreestandingCapableReadJustPath = "just/freestanding-capable.just";
  productPathFreestandingCapableReadJustTokens = [
    "freestanding-capable-read"
    "freestanding-capable-read-lake-free"
    "slake-freestanding-capable-read"
    "CapableRead"
    "lake build slake-freestanding-capable-read"
    "lake exe slake-freestanding-capable-read"
    "productPathFreestandingCapableRead true"
  ];
  productPathFreestandingCapableReadAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ"
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0"
    "productPathFreestandingCapableReadPartialReady"
    "freestandingCapableReadDualSsot"
    "productPathFreestandingCapableStepContractReadSatisfied"
    "FREESTANDING-CAPABLE-STEP-CONTRACT-READ"
    "freestanding-capable-read"
    "freestanding-capable-read-lake-free"
    "slake-freestanding-capable-read"
    "CapableRead"
    "product path freestanding capable read"
    "productPathFreestandingPerformClaimed"
    "productPathFreestandingCapableRead"
    "FREESTANDING-PERFORM-GAP-READ-SSOT"
  ];

  # Partial B17 + B27: freestanding-capable COMPOSE plan/apply/body without
  # FreestandingEmit as product authority (freestandingCapableComposePlanApplyBody).
  # ComposeSatisfied true; B14 CapableCompose true after B27 freestanding-capable-
  # compose-lake-free; CapableWriteHc true after B28; Full unsatisfied; perform claimed false.
  productPathFreestandingCapableComposeStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_COMPOSE_V0";
  productPathFreestandingCapableComposeHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE";
  productPathFreestandingCapableComposeSelfHostId =
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE";
  productPathFreestandingCapableComposeModulePath =
    "src/systems/SystemsLean/CapableCompose.lean";
  # Dual-pin thin batch 16: home-primary stage/host/recipe/exe/API + PartialReady.
  productPathFreestandingCapableComposeModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_COMPOSE_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE"
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE"
    "def stageId : String :="
    "def hostId : String :="
    "def selfHostId : String :="
    "freestandingCapableComposePlanApplyBody"
    "freestandingCapableComposeApi"
    "productPathFreestandingCapableComposeOk"
    "productPathFreestandingCapableComposePartialReady"
    "def productPathFreestandingCapableComposePartialReady : Bool :="
    "def productPathFreestandingCapableComposeAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableComposeDependsOnLake : Bool := true"
    "theorem productPathFreestandingCapableComposePartialReady_true"
    "lakeExeName"
    "justRecipeName"
    "FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE"
    "FREESTANDING-PERFORM-GAP-COMPOSE"
    "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY"
    "IO.FS.readFile"
    "slake-freestanding-capable-compose"
    "freestanding-capable-compose"
    "freestanding-capable-compose-lake-free"
    "productPathFreestandingCapableComposeLakeFreeRecipe"
  ];
  productPathFreestandingCapableComposeModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "def emitAtRoot"
    "def renderHeader"
    "def renderSource"
    "IO.FS.writeFile"
    "IO.FS.createDir"
    "def productPathFreestandingCapableComposeAuthorityNotEmit : Bool := false"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathFreestandingCapableComposeLakefilePath = "src/systems/lakefile.lean";
  productPathFreestandingCapableComposeLakefileTokens = [
    "slake-freestanding-capable-compose"
    "SystemsLean.CapableComposeMain"
  ];
  productPathFreestandingCapableComposeJustPath = "just/freestanding-capable.just";
  productPathFreestandingCapableComposeJustTokens = [
    "freestanding-capable-compose"
    "freestanding-capable-compose-lake-free"
    "slake-freestanding-capable-compose"
    "CapableCompose"
    "lake build slake-freestanding-capable-compose"
    "lake exe slake-freestanding-capable-compose"
    "productPathFreestandingCapableCompose true"
  ];
  productPathFreestandingCapableComposeAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE"
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_COMPOSE_V0"
    "productPathFreestandingCapableComposePartialReady"
    "freestandingCapableComposePlanApplyBody"
    "productPathFreestandingCapableStepContractComposeSatisfied"
    "FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE"
    "freestanding-capable-compose"
    "freestanding-capable-compose-lake-free"
    "slake-freestanding-capable-compose"
    "CapableCompose"
    "product path freestanding capable compose"
    "productPathFreestandingPerformClaimed"
    "productPathFreestandingCapableCompose"
    "FREESTANDING-PERFORM-GAP-COMPOSE"
  ];

  # Partial B18 + B28: freestanding-capable WRITE-HC freestanding .h/.c without
  # FreestandingEmit as product authority (freestandingCapableWriteFreestandingHc).
  # WriteHcSatisfied true; B14 CapableWriteHc true after B28 Lake-free measure;
  # Full unsatisfied; perform claimed false.
  productPathFreestandingCapableWriteHcStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0";
  productPathFreestandingCapableWriteHcHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC";
  productPathFreestandingCapableWriteHcSelfHostId =
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC";
  productPathFreestandingCapableWriteHcModulePath =
    "src/systems/SystemsLean/CapableWriteHc.lean";
  # Load peel companion (dual SSOT load/assemble/dialect).
  productPathFreestandingCapableWriteHcLoadPath =
    "src/systems/SystemsLean/CapableWriteHcLoad.lean";
  # Dual-pin thin batch 17: home-primary stage/host/recipe/exe/API + PartialReady.
  # stageId + dual SSOT load defs live on CapableWriteHcLoad after peel.
  productPathFreestandingCapableWriteHcModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC"
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC"
    "def hostId : String :="
    "def selfHostId : String :="
    "freestandingCapableWriteFreestandingHc"
    "freestandingCapableWriteHcApi"
    "productPathFreestandingCapableWriteHcOk"
    "productPathFreestandingCapableWriteHcPartialReady"
    "def productPathFreestandingCapableWriteHcPartialReady : Bool :="
    "def productPathFreestandingCapableWriteHcAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableWriteHcDependsOnLake : Bool := true"
    "theorem productPathFreestandingCapableWriteHcPartialReady_true"
    "lakeExeName"
    "justRecipeName"
    # B37 CAPABLE-GAP: Capable WRITE is dual-equality (Emit* + requireDualSsotEqual).
    "productPathCapableWriteDualEqualityLive"
    "DUAL-SSOT-EQUALITY"
    "requireDualSsotEqual"
    "dualSsotBlockEqual"
    # Load peel cite (helpers live on CapableWriteHcLoad).
    "CapableWriteHcLoad"
    "import SystemsLean.CapableWriteHcLoad"
    "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC"
    "FREESTANDING-PERFORM-GAP-WRITE-HC"
    "WRITER-PATH-STEP-WRITE-FREESTANDING-HC"
    "IO.FS.writeFile"
    "slake_freestanding.h"
    "slake_freestanding.c"
    "slake-freestanding-capable-write-hc"
    "freestanding-capable-write-hc"
    "freestanding-capable-write-hc-lake-free"
  ];
  # Load peel: stageId + dual SSOT load/assemble + dialect defs.
  productPathFreestandingCapableWriteHcLoadTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0"
    "CapableWriteHcLoad"
    "def stageId : String :="
    "def dualSsotBlockEqual"
    "def requireDualSsotEqual"
    "def dualSsotSpecs"
    "def freestandingCapableWriteLoadOneSsot"
    "def assembleHeaderFromSsot"
    "def assembleSourceFromSsot"
    "def loadBodySsotDialect"
    "def applyBodySsotDialect"
    "def productWireHonestyTokens"
    "DUAL-SSOT-EQUALITY"
    "import SystemsLean.EmitBanner"
    "import SystemsLean.EmitBody"
    "import SystemsLean.EmitBodyScaffold"
    "HOST-EMIT-SSOT"
    "product residual free"
    "not PROVABLY"
  ];
  productPathFreestandingCapableWriteHcModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    "def emitAtRoot"
    "def renderHeader"
    "def renderSource"
    "def productPathFreestandingCapableWriteHcAuthorityNotEmit : Bool := false"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathFreestandingCapableWriteHcLakefilePath = "src/systems/lakefile.lean";
  productPathFreestandingCapableWriteHcLakefileTokens = [
    "slake-freestanding-capable-write-hc"
    "SystemsLean.CapableWriteHc"
  ];
  productPathFreestandingCapableWriteHcJustPath = "just/freestanding-capable.just";
  productPathFreestandingCapableWriteHcJustTokens = [
    "freestanding-capable-write-hc"
    "freestanding-capable-write-hc-lake-free"
    "slake-freestanding-capable-write-hc"
    "CapableWriteHc"
    "lake build slake-freestanding-capable-write-hc"
    "lake exe slake-freestanding-capable-write-hc"
    "productPathFreestandingCapableWriteHc true"
  ];
  productPathFreestandingCapableWriteHcAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC"
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_WRITE_HC_V0"
    "productPathFreestandingCapableWriteHcPartialReady"
    "freestandingCapableWriteFreestandingHc"
    "productPathFreestandingCapableStepContractWriteHcSatisfied"
    "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC"
    "freestanding-capable-write-hc"
    "freestanding-capable-write-hc-lake-free"
    "slake-freestanding-capable-write-hc"
    "CapableWriteHc"
    "product path freestanding capable write"
    "productPathFreestandingPerformClaimed"
    "productPathFreestandingCapableWriteHc"
    "FREESTANDING-PERFORM-GAP-WRITE-HC"
  ];

  # Partial B19: freestanding-capable ordered regenerate pipeline (READ then COMPOSE
  # then WRITE-HC then Install Out) without FreestandingEmit as product authority
  # (freestandingCapableOrderedRegenerate). Full unsatisfied; InstallOut closed by B20;
  # CapableRead/Compose/WriteHc true after B26..B28; Full unsatisfied; perform claimed false.
  productPathFreestandingCapableRegenerateStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_REGENERATE_V0";
  productPathFreestandingCapableRegenerateHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE";
  productPathFreestandingCapableRegenerateSelfHostId =
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE";
  productPathFreestandingCapableRegenerateModulePath =
    "src/systems/SystemsLean/CapableRegenerate.lean";
  # Dual-pin thin batch 18: home-primary stage/host/recipe/exe/API + PartialReady.
  productPathFreestandingCapableRegenerateModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_REGENERATE_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE"
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE"
    "def stageId : String :="
    "def hostId : String :="
    "def selfHostId : String :="
    "freestandingCapableOrderedRegenerate"
    "freestandingCapableRegenerateApi"
    "productPathFreestandingCapableRegenerateOk"
    "productPathFreestandingCapableRegeneratePartialReady"
    "def productPathFreestandingCapableRegeneratePartialReady : Bool :="
    "def productPathFreestandingCapableRegenerateAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableRegenerateDependsOnLake : Bool := true"
    "def productPathFreestandingCapableRegenerateInstallOutOpen : Bool := false"
    # Greppable theorem cite (live def in CapableRegenerateTheorems; long-file split).
    "theorem productPathFreestandingCapableRegeneratePartialReady_true"
    "REGENERATE-THEOREM"
    "HOST-REGENERATE-THEOREM"
    "REGENERATE-SMOKE"
    "HOST-REGENERATE-SMOKE"
    "CapableRegenerateTheorems"
    "lakeExeName"
    "justRecipeName"
    "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
    "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
    "freestandingCapableReadDualSsot"
    "freestandingCapableComposePlanApplyBody"
    "freestandingCapableWriteFreestandingHc"
    "freestandingCapableInstallFreestandingOut"
    "slake-freestanding-capable-regenerate"
    "freestanding-capable-regenerate"
  ];
  productPathFreestandingCapableRegenerateModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    "def emitAtRoot"
    "def renderHeader"
    "def renderSource"
    "def productPathFreestandingCapableRegenerateAuthorityNotEmit : Bool := false"
    "def productPathFreestandingCapableRegenerateInstallOutOpen : Bool := true"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := true"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathFreestandingCapableRegenerateLakefilePath = "src/systems/lakefile.lean";
  productPathFreestandingCapableRegenerateLakefileTokens = [
    "slake-freestanding-capable-regenerate"
    "SystemsLean.CapableRegenerateMain"
  ];
  productPathFreestandingCapableRegenerateJustPath = "just/freestanding-capable.just";
  productPathFreestandingCapableRegenerateJustTokens = [
    "freestanding-capable-regenerate"
    "slake-freestanding-capable-regenerate"
    "CapableRegenerate"
    "lake build slake-freestanding-capable-regenerate"
    "lake exe slake-freestanding-capable-regenerate"
  ];
  productPathFreestandingCapableRegenerateAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE"
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_REGENERATE_V0"
    "productPathFreestandingCapableRegeneratePartialReady"
    "freestandingCapableOrderedRegenerate"
    "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
    "productPathFreestandingCapableStepContractFullSatisfied"
    "productPathFreestandingCapableRegenerateInstallOutOpen"
    "freestanding-capable-regenerate"
    "slake-freestanding-capable-regenerate"
    "CapableRegenerate"
    "product path freestanding capable regenerate"
    "productPathFreestandingPerformClaimed"
    "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
  ];

  # Partial B20: freestanding-capable Install Out without FreestandingEmit as
  # product authority (freestandingCapableInstallFreestandingOut). Full unsatisfied;
  # InstallOutOpen false; Capable* true after B26..B28; Full unsatisfied; perform claimed false.
  productPathFreestandingCapableInstallOutStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_INSTALL_OUT_V0";
  productPathFreestandingCapableInstallOutHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT";
  productPathFreestandingCapableInstallOutSelfHostId =
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT";
  productPathFreestandingCapableInstallOutModulePath =
    "src/systems/SystemsLean/InstallOut.lean";
  productPathFreestandingCapableInstallOutModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_INSTALL_OUT_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT"
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT"
    "freestandingCapableInstallFreestandingOut"
    "productPathFreestandingCapableInstallOutOk"
    "productPathFreestandingCapableInstallOutPartialReady"
    "productPathFreestandingCapableInstallOutAuthorityNotEmit"
    "productPathFreestandingCapableInstallOutDependsOnLake"
    "productPathFreestandingCapableRegenerateInstallOutOpen"
    "FREESTANDING-CAPABLE-INSTALL-OUT"
    "WRITER-PATH-STEP-INSTALL-OUT"
    "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
    "slake_freestanding.h"
    "slake_freestanding.c"
    "out/freestanding-c/"
    "IO.FS.readFile"
    "IO.FS.writeFile"
    "IO.FS.createDirAll"
    "slake-freestanding-capable-install-out"
    "freestanding-capable-install-out"
  ];
  productPathFreestandingCapableInstallOutModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    "def emitAtRoot"
    "def renderHeader"
    "def renderSource"
    "def productPathFreestandingCapableInstallOutAuthorityNotEmit : Bool := false"
    "def productPathFreestandingCapableRegenerateInstallOutOpen : Bool := true"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := true"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathFreestandingCapableInstallOutLakefilePath = "src/systems/lakefile.lean";
  productPathFreestandingCapableInstallOutLakefileTokens = [
    "slake-freestanding-capable-install-out"
    "SystemsLean.InstallOutMain"
  ];
  productPathFreestandingCapableInstallOutJustPath = "just/freestanding-capable.just";
  productPathFreestandingCapableInstallOutJustTokens = [
    "freestanding-capable-install-out"
    "slake-freestanding-capable-install-out"
    "InstallOut"
    "lake build slake-freestanding-capable-install-out"
    "lake exe slake-freestanding-capable-install-out"
  ];
  productPathFreestandingCapableInstallOutAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT"
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_INSTALL_OUT_V0"
    "productPathFreestandingCapableInstallOutPartialReady"
    "freestandingCapableInstallFreestandingOut"
    "FREESTANDING-CAPABLE-INSTALL-OUT"
    "productPathFreestandingCapableStepContractFullSatisfied"
    "productPathFreestandingCapableRegenerateInstallOutOpen"
    "freestanding-capable-install-out"
    "slake-freestanding-capable-install-out"
    "InstallOut"
    "product path freestanding capable install out"
    "productPathFreestandingPerformClaimed"
    "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
  ];

  # Partial B21: freestanding-capable Full bar / ownership-gap measure beyond B20.
  # Closed: step contracts + InstallOut + ordered regenerate. Open: ownership
  # regenerate without Lake; B14 Capable*; Full; perform/ownership claimed.
  productPathFreestandingCapableFullBarStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_FULL_BAR_V0";
  productPathFreestandingCapableFullBarHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR";
  productPathFreestandingCapableFullBarSelfHostId =
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR";
  productPathFreestandingCapableFullBarModulePath =
    "src/systems/SystemsLean/CapableFullBar.lean";
  productPathFreestandingCapableFullBarModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_FULL_BAR_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR"
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR"
    "productPathFreestandingCapableFullBarOk"
    "productPathFreestandingCapableFullBarPartialReady"
    "productPathFreestandingCapableFullBarStepContractsClosed"
    "productPathFreestandingCapableFullBarInstallOutClosed"
    "productPathFreestandingCapableFullBarOrderedPipelineJoined"
    "productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake"
    "productPathFreestandingCapableFullBarCapableLakeFree"
    "productPathFreestandingCapableFullBarDependsOnLake"
    "productPathFreestandingCapableStepContractFullSatisfied"
    "FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE"
    "FULL-BAR-REQ-B14-CAPABLE-READ-LAKE-FREE"
    "FULL-BAR-REQ-B14-CAPABLE-COMPOSE-LAKE-FREE"
    "FULL-BAR-REQ-B14-CAPABLE-WRITE-HC-LAKE-FREE"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
    "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
    "slake-freestanding-capable-full-bar"
    "freestanding-capable-full-bar"
  ];
  productPathFreestandingCapableFullBarModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := true"
    # B30: WithoutLake dual-pin closed; forbidding true would fight product path authority.
    "def productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake : Bool := false"
    "def productPathFreestandingCapableFullBarCapableLakeFree : Bool := false"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "def productPathFreestandingCapableFullBarStepContractsClosed : Bool := false"
    "def productPathFreestandingCapableFullBarInstallOutClosed : Bool := false"
    "def productPathFreestandingCapableFullBarOrderedPipelineJoined : Bool := false"
  ];
  productPathFreestandingCapableFullBarLakefilePath = "src/systems/lakefile.lean";
  productPathFreestandingCapableFullBarLakefileTokens = [
    "slake-freestanding-capable-full-bar"
    "SystemsLean.CapableFullBarMain"
  ];
  productPathFreestandingCapableFullBarJustPath = "just/freestanding-capable.just";
  productPathFreestandingCapableFullBarJustTokens = [
    "freestanding-capable-full-bar"
    "slake-freestanding-capable-full-bar"
    "CapableFullBar"
    "lake build slake-freestanding-capable-full-bar"
    "lake exe slake-freestanding-capable-full-bar"
  ];
  productPathFreestandingCapableFullBarAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR"
    "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR"
    "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_FULL_BAR_V0"
    "productPathFreestandingCapableFullBarPartialReady"
    "productPathFreestandingCapableFullBarStepContractsClosed"
    "productPathFreestandingCapableFullBarInstallOutClosed"
    "productPathFreestandingCapableFullBarOrderedPipelineJoined"
    "productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake"
    "productPathFreestandingCapableFullBarCapableLakeFree"
    "productPathFreestandingCapableStepContractFullSatisfied"
    "FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE"
    "FULL-BAR-REQ-B14-CAPABLE-READ-LAKE-FREE"
    "FULL-BAR-REQ-B14-CAPABLE-COMPOSE-LAKE-FREE"
    "FULL-BAR-REQ-B14-CAPABLE-WRITE-HC-LAKE-FREE"
    "freestanding-capable-full-bar"
    "slake-freestanding-capable-full-bar"
    "CapableFullBar"
    "product path freestanding capable full bar"
    "productPathFreestandingPerformClaimed"
    "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
  ];

  # Partial B22..B30: product path ownership regenerate substrate beyond B21.
  # Install Lake-free true (ownership-regenerate-install-only); READ Lake-free
  # true (B23 ownership-regenerate-read-only); COMPOSE Lake-free true (B24
  # ownership-regenerate-compose-only); WRITE-HC Lake-free true (B25
  # ownership-regenerate-write-hc-only); B29 ordered Lake-free join claimed
  # (ownership-regenerate-lake-free ties freestanding Capable* + path pieces);
  # B30 product path authority claimed (ownership-regenerate-product-path-authority);
  # WithoutLake true (FullBar dual-pin); ownership claimed false.
  # B14 Capable* true after B26..B28.
}
