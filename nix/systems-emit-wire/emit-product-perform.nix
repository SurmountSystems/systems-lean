# SPDX-License-Identifier: Unlicense
# Data slice for systems-emit-wire emit product. Joined by emit-product.nix.
# No bash, no Python in eval.
rec {
  productPathPerformStageId = "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_V0";
  productPathPerformHostId = "HOST-SELF-HOST-PRODUCT-PATH-PERFORM";
  productPathPerformSelfHostId = "SELF-HOST-PRODUCT-PATH-PERFORM";
  # Lake still owns read/compose/write perform (dependency evidence).
  productPathPerformLakeWriterPath = "src/systems/SystemsLean/FreestandingEmit.lean";
  productPathPerformLakeWriterTokens = [
    "def renderHeader"
    "def renderSource"
    "def emitAtRoot"
    "IO.FS.writeFile"
    "SLAKE_EMIT_FREESTANDING_C_V0"
  ];
  # Load peel companion (loadMultSsot on FreestandingEmitLoadScaffold).
  productPathPerformLakeLoadTokens = [
    "def loadMultSsot"
  ];
  # Path for Mult..Apply scaffold (perform Lake load tokens scan target).
  productPathPerformLakeLoadPath = "src/systems/SystemsLean/FreestandingEmitLoadScaffold.lean";
  # Install step mechanism (cp half): just/product-wire.just has build + install cp.
  # B10 isolates Lake-free install-only recipe.
  productPathPerformInstallPath = "just/product-wire.just";
  productPathPerformInstallTokens = [
    "build"
    "cp -f"
    "out/freestanding-c"
    "slake_freestanding"
    "lake build slake-emit-freestanding-c"
    "lake exe slake-emit-freestanding-c"
  ];
  productPathPerformAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-PERFORM"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM"
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_V0"
    "productPathPerformPartialReady"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "productPathPerformInstallStepLakeFreeCapable"
    "productPathPerformInstallLakeFreeEntrypointClaimed"
    "product path perform"
    "install step mechanism"
    "FREESTANDING-PERFORM-GAP-READ-SSOT"
    "FREESTANDING-PERFORM-GAP-COMPOSE"
    "FREESTANDING-PERFORM-GAP-WRITE-HC"
    "FreestandingEmit"
    "build"
  ];

  # Batch-26: Ok/PartialReady bulk authority in ProductPathPerform (land-time).
  # Living-tip claim true defs stay off this land-time module.
  # Dual-pin thin batch 8: historical stage/gap/Lake-writer/moduleCite dual-pins home-primary.
  # Long-file split: live theorem/smoke in ProductPathPerformTheorems;
  # parent keeps greppable theorem cite + Theorems module name.
  productPathPerformModulePath = "src/systems/SystemsLean/ProductPathPerform.lean";
  productPathPerformModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM"
    "SELF-HOST-PRODUCT-PATH-PERFORM"
    "productPathPerformOk"
    "productPathPerformPartialReady"
    "def productPathPerformPartialReady : Bool :="
    "def productPathPerformDependsOnLake : Bool := true"
    "def productPathPerformInstallStepLakeFreeCapable : Bool := true"
    # Greppable theorem cite (live def in ProductPathPerformTheorems; long-file split).
    "theorem productPathPerformPartialReady_true"
    "PERFORM-THEOREM"
    "HOST-PERFORM-THEOREM"
    "PERFORM-SMOKE"
    "HOST-PERFORM-SMOKE"
    "ProductPathPerformTheorems"
    "ProductPathPerform"
    "performModuleCite"
    "productPathPerformLakeWriterCite"
    "productPathPerformLakeExeCite"
    "productPathPerformInstallRecipeCite"
    "productPathPerformGapReadSsot"
    "productPathPerformGapCompose"
    "productPathPerformGapWriteWire"
    "FreestandingEmit"
    "slake-emit-freestanding-c"
    "build"
    "FREESTANDING-PERFORM-GAP-READ-SSOT"
    "FREESTANDING-PERFORM-GAP-COMPOSE"
    "FREESTANDING-PERFORM-GAP-WRITE-HC"
  ];
  productPathPerformModuleForbiddenTokens = [
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "import SystemsLean.FreestandingEmit"
    "IO.FS.writeFile"
    "def renderHeader"
    "def emitAtRoot"
  ];

  # Claim B path: first freestanding-capable perform step (partial B10).
  # Lake-free install-only entrypoint (just install-freestanding-c-out) when
  # emit present. productPathFreestandingPerformClaimed stays false;
  # productPathPerformDependsOnLake stays true (read/compose/write still Lake).
  # Not complete; not ownership claimed; not B9 re-land theater.
  productPathPerformStepStageId = "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_STEP_V0";
  productPathPerformStepHostId = "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-STEP";
  productPathPerformStepSelfHostId = "SELF-HOST-PRODUCT-PATH-PERFORM-STEP";
  productPathPerformStepInstallPath = "just/product-wire.just";
  # Structural positive tokens for install-only recipe (not prose-only Lake-free).
  # Negative: pure Nix extracts recipe body and forbids leading lake build/exe cmds.
  productPathPerformStepInstallTokens = [
    "install-freestanding-c-out"
    "cp -f"
    "out/freestanding-c"
    "slake_freestanding"
    "src/systems/emit"
  ];
  # Forbidden as command lines in install-freestanding-c-out body (after strip ws).
  productPathPerformStepInstallForbiddenCmdPrefixes = [
    "lake build"
    "lake exe"
  ];
  productPathPerformStepAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-PERFORM-STEP"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-STEP"
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_STEP_V0"
    "productPathPerformStepPartialReady"
    "productPathPerformInstallLakeFreeEntrypointClaimed"
    "install-freestanding-c-out"
    "product path perform step"
    "Lake-free install entrypoint"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "FREESTANDING-PERFORM-GAP-READ-SSOT"
    "FREESTANDING-PERFORM-GAP-COMPOSE"
    "FREESTANDING-PERFORM-GAP-WRITE-HC"
  ];
  # Batch-25: Ok/PartialReady bulk authority in ProductPathPerformStep (land-time).
  # Living-tip claim true defs stay off this land-time module.
  # Dual-pin thin batch 9: historical stage/Ok/moduleCite/recipe/gap dual-pins home-primary.
  # Long-file split: live theorem/smoke in ProductPathPerformStepTheorems;
  # parent keeps greppable theorem cite + Theorems module name.
  productPathPerformStepModulePath = "src/systems/SystemsLean/ProductPathPerformStep.lean";
  productPathPerformStepModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_STEP_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-STEP"
    "SELF-HOST-PRODUCT-PATH-PERFORM-STEP"
    "install-freestanding-c-out"
    "WRITER-PATH-STEP-INSTALL-OUT"
    "productPathPerformStepOk"
    "productPathPerformStepPartialReady"
    "def productPathPerformStepPartialReady : Bool :="
    "def productPathPerformInstallLakeFreeEntrypointClaimed : Bool := true"
    "def productPathPerformInstallStepLakeFreeCapable : Bool := true"
    "def productPathPerformStepDependsOnLake : Bool := true"
    # Greppable theorem cite (live def in ProductPathPerformStepTheorems; long-file split).
    "theorem productPathPerformStepPartialReady_true"
    "PERFORM-STEP-THEOREM"
    "HOST-PERFORM-STEP-THEOREM"
    "PERFORM-STEP-SMOKE"
    "HOST-PERFORM-STEP-SMOKE"
    "ProductPathPerformStepTheorems"
    "ProductPathPerformStep"
    "stepModuleCite"
    "productPathPerformInstallLakeFreeEntrypointRecipe"
    "stageId"
    "hostId"
    "selfHostId"
    "gapReadSsot"
    "gapCompose"
    "gapWriteHc"
    "FREESTANDING-PERFORM-GAP-READ-SSOT"
    "FREESTANDING-PERFORM-GAP-COMPOSE"
    "FREESTANDING-PERFORM-GAP-WRITE-HC"
  ];
  productPathPerformStepModuleForbiddenTokens = [
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "import SystemsLean.FreestandingEmit"
    "IO.FS.writeFile"
    "def renderHeader"
    "def emitAtRoot"
  ];

  # Claim B path: first READ-SSOT perform substrate (partial B11).
  # Decomposed dual SSOT read via ProductPathReadSsot (IO.FS.readFile) + just
  # read-product-ssot / lake exe slake-read-product-ssot. No FreestandingEmit
  # renderHeader/renderSource/emitAtRoot on the read module. ReadDependsOnLake
  # true (still classic Lean Lake host). perform claimed false; complete false.
  # Not B6..B10 re-land theater.
  # Dual-pin thin batch 10: historical stage/Ok/moduleCite/recipe/exe/fn/gap
  # dual-pins home-primary.
  productPathPerformReadStageId = "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0";
  productPathPerformReadHostId = "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-READ";
  productPathPerformReadSelfHostId = "SELF-HOST-PRODUCT-PATH-PERFORM-READ";
  productPathPerformReadModulePath = "src/systems/SystemsLean/ProductPathReadSsot.lean";
  productPathPerformReadModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-READ"
    "SELF-HOST-PRODUCT-PATH-PERFORM-READ"
    "def readDualSsotAtRoot"
    "IO.FS.readFile"
    "host_emit_mult.ssot.txt"
    "host_emit_body_fragment.ssot.txt"
    "FREESTANDING-PERFORM-GAP-READ-SSOT"
    "slake-read-product-ssot"
    "read-product-ssot"
    "productPathPerformReadOk"
    "productPathPerformReadPartialReady"
    "def productPathPerformReadPartialReady : Bool :="
    "def productPathPerformReadDependsOnLake : Bool := true"
    "def productPathPerformReadEntrypointClaimed : Bool := true"
    # Greppable theorem cite (live def in ProductPathReadSsotTheorems; long-file split).
    "theorem productPathPerformReadPartialReady_true"
    "READ-SSOT-THEOREM"
    "HOST-READ-SSOT-THEOREM"
    "READ-SSOT-SMOKE"
    "HOST-READ-SSOT-SMOKE"
    "ProductPathReadSsotTheorems"
    "ProductPathReadSsot"
    "readModuleCite"
    "justRecipeName"
    "lakeExeName"
    "readFnCite"
    "stageId"
    "hostId"
    "selfHostId"
    "gapReadSsot"
  ];
  # Forbidden on the READ module (compose/write product path defs / import / write).
  # def forms for FreestandingEmit write path; IO.FS.writeFile/createDir ban any product write.
  # Living-tip claim true defs stay off this land-time module (batch-24 honesty).
  productPathPerformReadModuleForbiddenTokens = [
    "def renderHeader"
    "def renderSource"
    "def emitAtRoot"
    "import SystemsLean.FreestandingEmit"
    "IO.FS.writeFile"
    "IO.FS.createDir"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathPerformReadLakefilePath = "src/systems/lakefile.lean";
  productPathPerformReadLakefileTokens = [
    "slake-read-product-ssot"
    "SystemsLean.ProductPathReadSsotMain"
  ];
  productPathPerformReadJustPath = "just/product-wire.just";
  productPathPerformReadJustTokens = [
    "read-product-ssot"
    "slake-read-product-ssot"
    "ProductPathReadSsot"
    "lake build slake-read-product-ssot"
    "lake exe slake-read-product-ssot"
  ];
  productPathPerformReadAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-PERFORM-READ"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-READ"
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0"
    "productPathPerformReadPartialReady"
    "productPathPerformReadEntrypointClaimed"
    "productPathPerformReadDependsOnLake"
    "read-product-ssot"
    "slake-read-product-ssot"
    "ProductPathReadSsot"
    "product path perform read"
    "productPathFreestandingPerformClaimed"
    "FREESTANDING-PERFORM-GAP-READ-SSOT"
    "FREESTANDING-PERFORM-GAP-COMPOSE"
    "FREESTANDING-PERFORM-GAP-WRITE-HC"
  ];

  # Claim B path: first COMPOSE plan/apply/body perform substrate (partial B12).
  # Decomposed ordered compose via ProductPathComposePlan (composePlanApplyBodyAtRoot)
  # + just compose-product-plan / lake exe slake-compose-product-plan. No
  # FreestandingEmit renderHeader/renderSource/emitAtRoot on the compose module.
  # ComposeDependsOnLake true (still classic Lean Lake host). perform claimed false;
  # complete false. Not B6..B11 re-land theater.
  # Dual-pin thin batch 11: historical stage/Ok/moduleCite/recipe/exe/fn/gap
  # dual-pins home-primary.
  productPathPerformComposeStageId = "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0";
  productPathPerformComposeHostId = "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE";
  productPathPerformComposeSelfHostId = "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE";
  productPathPerformComposeModulePath = "src/systems/SystemsLean/ProductPathComposePlan.lean";
  productPathPerformComposeModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE"
    "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE"
    "def composePlanApplyBodyAtRoot"
    "def buildComposeMarker"
    "IO.FS.readFile"
    "host_emit_plan.ssot.txt"
    "host_emit_apply.ssot.txt"
    "host_emit_body_fragment.ssot.txt"
    "HOST-EMIT-PLAN"
    "HOST-EMIT-APPLY"
    "HOST-EMIT-BODY"
    "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY"
    "FREESTANDING-PERFORM-GAP-COMPOSE"
    "slake-compose-product-plan"
    "compose-product-plan"
    "productPathPerformComposeOk"
    "productPathPerformComposePartialReady"
    "def productPathPerformComposePartialReady : Bool :="
    "def productPathPerformComposeDependsOnLake : Bool := true"
    "def productPathPerformComposeEntrypointClaimed : Bool := true"
    "theorem productPathPerformComposePartialReady_true"
    "ProductPathComposePlan"
    "composeModuleCite"
    "justRecipeName"
    "lakeExeName"
    "composeFnCite"
    "stageId"
    "hostId"
    "selfHostId"
    "gapCompose"
  ];
  # Forbidden on the COMPOSE module (full template embed / write product path).
  productPathPerformComposeModuleForbiddenTokens = [
    "def renderHeader"
    "def renderSource"
    "def emitAtRoot"
    "import SystemsLean.FreestandingEmit"
    "IO.FS.writeFile"
    "IO.FS.createDir"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathPerformComposeLakefilePath = "src/systems/lakefile.lean";
  productPathPerformComposeLakefileTokens = [
    "slake-compose-product-plan"
    "SystemsLean.ProductPathComposePlanMain"
  ];
  productPathPerformComposeJustPath = "just/product-wire.just";
  productPathPerformComposeJustTokens = [
    "compose-product-plan"
    "slake-compose-product-plan"
    "ProductPathComposePlan"
    "lake build slake-compose-product-plan"
    "lake exe slake-compose-product-plan"
  ];
  productPathPerformComposeAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE"
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0"
    "productPathPerformComposePartialReady"
    "productPathPerformComposeEntrypointClaimed"
    "productPathPerformComposeDependsOnLake"
    "compose-product-plan"
    "slake-compose-product-plan"
    "ProductPathComposePlan"
    "product path perform compose"
    "productPathFreestandingPerformClaimed"
    "FREESTANDING-PERFORM-GAP-COMPOSE"
    "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY"
    "FREESTANDING-PERFORM-GAP-WRITE-HC"
  ];

  # Claim B path: first WRITE-HC freestanding .h/.c perform substrate (partial B13).
  # Decomposed write via ProductPathWriteHc (writeFreestandingHcAtRoot ->
  # FreestandingEmit.emitAtRoot) + just write-freestanding-hc / lake exe
  # slake-write-freestanding-hc. Honest Lake FreestandingEmit product writer
  # (WriteHcDependsOnLake true). Does not install Out. perform claimed false;
  # complete false. Not B6..B12 re-land theater.
  # Dual-pin thin batch 12: historical stage/Ok/moduleCite/recipe/exe/fn/gap
  # dual-pins home-primary.
  productPathPerformWriteHcStageId = "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_WRITE_HC_V0";
  productPathPerformWriteHcHostId = "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC";
  productPathPerformWriteHcSelfHostId = "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC";
  productPathPerformWriteHcModulePath = "src/systems/SystemsLean/ProductPathWriteHc.lean";
  productPathPerformWriteHcModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_WRITE_HC_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC"
    "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC"
    "def writeFreestandingHcAtRoot"
    "import SystemsLean.FreestandingEmit"
    "FreestandingEmit.emitAtRoot"
    "slake_freestanding.h"
    "slake_freestanding.c"
    "WRITER-PATH-STEP-WRITE-FREESTANDING-HC"
    "FREESTANDING-PERFORM-GAP-WRITE-HC"
    "slake-write-freestanding-hc"
    "write-freestanding-hc"
    "productPathPerformWriteHcOk"
    "productPathPerformWriteHcPartialReady"
    "def productPathPerformWriteHcPartialReady : Bool :="
    "def productPathPerformWriteHcDependsOnLake : Bool := true"
    "def productPathPerformWriteHcEntrypointClaimed : Bool := true"
    # Greppable theorem cite (live def in ProductPathWriteHcTheorems; long-file split).
    "theorem productPathPerformWriteHcPartialReady_true"
    "WRITE-HC-THEOREM"
    "HOST-WRITE-HC-THEOREM"
    "WRITE-HC-SMOKE"
    "HOST-WRITE-HC-SMOKE"
    "ProductPathWriteHcTheorems"
    "ProductPathWriteHc"
    "writeHcModuleCite"
    "justRecipeName"
    "lakeExeName"
    "writeHcFnCite"
    "stageId"
    "hostId"
    "selfHostId"
    "gapWriteHc"
  ];
  # Forbidden on WRITE-HC module: install Out / full-path install theater, dishonest complete claims.
  productPathPerformWriteHcModuleForbiddenTokens = [
    "install-freestanding-c-out"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
  ];
  productPathPerformWriteHcLakefilePath = "src/systems/lakefile.lean";
  productPathPerformWriteHcLakefileTokens = [
    "slake-write-freestanding-hc"
    "SystemsLean.ProductPathWriteHcMain"
  ];
  productPathPerformWriteHcJustPath = "just/product-wire.just";
  productPathPerformWriteHcJustTokens = [
    "write-freestanding-hc"
    "slake-write-freestanding-hc"
    "ProductPathWriteHc"
    "lake build slake-write-freestanding-hc"
    "lake exe slake-write-freestanding-hc"
  ];
  productPathPerformWriteHcAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC"
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_WRITE_HC_V0"
    "productPathPerformWriteHcPartialReady"
    "productPathPerformWriteHcEntrypointClaimed"
    "productPathPerformWriteHcDependsOnLake"
    "write-freestanding-hc"
    "slake-write-freestanding-hc"
    "ProductPathWriteHc"
    "product path perform write"
    "productPathFreestandingPerformClaimed"
    "FREESTANDING-PERFORM-GAP-WRITE-HC"
    "WRITER-PATH-STEP-WRITE-FREESTANDING-HC"
    "writeFreestandingHcAtRoot"
  ];

  # Claim B path: freestanding-capable gap measure + ordered pipeline join (partial B14).
  # Capable proves install Lake-free true; read/compose/write
  # false; full perform false. just regenerate-product-path joins existing
  # entrypoints in B6 order (still Lake for middle). perform claimed false; complete false.
}
