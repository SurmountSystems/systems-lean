# SPDX-License-Identifier: Unlicense
# Data slice for systems-emit-wire emit product. Joined by emit-product.nix.
# No bash, no Python in eval.
rec {
  emitH = "src/systems/emit/slake_freestanding.h";
  emitC = "src/systems/emit/slake_freestanding.c";
  releaseH = "out/freestanding-c/slake_freestanding.h";
  releaseC = "out/freestanding-c/slake_freestanding.c";
  # Hosted behavioral smoke source (test debt; not product emit residual).
  behavioralProbe = "src/systems/smoke/slake_behavioral_probe.c";

  # Claim B path: B2 product kernel self-application stage ids.
  productKernelSelfApplyStageId = "SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0";
  productKernelSelfApplyHostId = "HOST-SELF-HOST-KERNEL-SELF-APPLY";
  productKernelSelfApplySelfHostId = "SELF-HOST-KERNEL-SELF-APPLY";

  # Batch-33: Ok/PartialReady bulk authority in KernelSelfApply
  # (land-time B-bar HOST-EMIT cites). Dual-pin thin batch 1: historical
  # stage/bar/module-cite strings are home-owned (tip keeps chain fold only).
  # Living-tip claim true defs stay off this module.
  # Name KernelSelfApply (not SelfApply) -- SelfApply.lean is host structural SH5.
  # Long-file split: live theorem/smoke in KernelSelfApplyTheorems;
  # greppable theorem cites stay on this primary header.
  productKernelSelfApplyModulePath =
    "src/systems/SystemsLean/KernelSelfApply.lean";
  productKernelSelfApplyModuleTokens = [
    "SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0"
    "HOST-SELF-HOST-KERNEL-SELF-APPLY"
    "SELF-HOST-KERNEL-SELF-APPLY"
    "productKernelBarSurfaceOk"
    "productKernelSelfApplyPartialReady"
    "def productKernelSelfApplyPartialReady : Bool :="
    # Greppable theorem cite (live def in KernelSelfApplyTheorems; long-file split).
    "theorem productKernelSelfApplyPartialReady_true"
    "KERNEL-SELF-APPLY-THEOREM"
    "HOST-KERNEL-SELF-APPLY-THEOREM"
    "KERNEL-SELF-APPLY-SMOKE"
    "HOST-KERNEL-SELF-APPLY-SMOKE"
    "KernelSelfApplyTheorems"
    "KernelSelfApply"
    "productKernelSelfApplyModuleCite"
    "productKernelBarMult"
    "productKernelBarLinear"
    "productKernelBarErasure"
    "productKernelBarTypes"
    "productKernelBarProgram"
    "HOST-EMIT-MULT"
    "HOST-EMIT-LINEAR"
    "HOST-EMIT-ERASURE"
    "HOST-EMIT-TYPES"
    "HOST-EMIT-PROGRAM"
  ];
  productKernelSelfApplyModuleForbiddenTokens = [
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "import SystemsLean.FreestandingEmit"
  ];

  # Claim B path: default B-bar ownership on product Out (partial B3).
  productOutBbarOwnership = [
    "HOST-EMIT-MULT"
    "HOST-EMIT-LINEAR"
    "HOST-EMIT-ERASURE"
    "HOST-EMIT-TYPES"
    "HOST-EMIT-PROGRAM"
  ];

  # Claim B path: default B-bar freestanding APIs on product Out (partial B3).
  productOutBbarApis = [
    "slake_mult_is_valid"
    "slake_linear_consume"
    "slake_erasure_is_runtime_absent"
    "slake_type_tag"
    "slake_ir_program"
  ];

  productOutKernelStageId = "SLAKE_SELF_HOST_PRODUCT_OUT_V0";
  productOutKernelHostId = "HOST-SELF-HOST-PRODUCT-OUT";
  productOutKernelSelfHostId = "SELF-HOST-PRODUCT-OUT";

  # Batch-32: Ok/PartialReady bulk authority in ProductOutKernel
  # (land-time Out path + B-bar API cites). Dual-pin thin batch 2: historical
  # stage/path/API/module-cite strings are home-owned (tip keeps chain fold only).
  # Living-tip claim true defs stay off this module.
  # Long-file split: live theorem/smoke in ProductOutKernelTheorems;
  # greppable theorem cites stay on this primary header.
  productOutKernelModulePath =
    "src/systems/SystemsLean/ProductOutKernel.lean";
  productOutKernelModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_OUT_V0"
    "HOST-SELF-HOST-PRODUCT-OUT"
    "SELF-HOST-PRODUCT-OUT"
    "productOutKernelBarSurfaceOk"
    "productOutKernelEvidencePartialReady"
    "def productOutKernelEvidencePartialReady : Bool :="
    # Greppable theorem cite (live def in ProductOutKernelTheorems; long-file split).
    "theorem productOutKernelEvidencePartialReady_true"
    "PRODUCT-OUT-THEOREM"
    "HOST-PRODUCT-OUT-THEOREM"
    "PRODUCT-OUT-SMOKE"
    "HOST-PRODUCT-OUT-SMOKE"
    "ProductOutKernelTheorems"
    "ProductOutKernel"
    "productOutKernelModuleCite"
    "productOutPath"
    "out/freestanding-c/"
    "productOutApiMult"
    "productOutApiLinear"
    "productOutApiErasure"
    "productOutApiTypes"
    "productOutApiProgram"
    "slake_mult_is_valid"
    "slake_linear_consume"
    "slake_erasure_is_runtime_absent"
    "slake_type_tag"
    "slake_ir_program"
  ];
  productOutKernelModuleForbiddenTokens = [
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "import SystemsLean.FreestandingEmit"
  ];

  # Claim B path: host Lake product writer bootstrap honesty (partial B4).
  productPathBootstrapStageId = "SLAKE_SELF_HOST_PRODUCT_PATH_BOOTSTRAP_V0";
  productPathBootstrapHostId = "HOST-SELF-HOST-PRODUCT-PATH-BOOTSTRAP";
  productPathBootstrapSelfHostId = "SELF-HOST-PRODUCT-PATH-BOOTSTRAP";
  productPathBootstrapWriterPath = "src/systems/SystemsLean/FreestandingEmit.lean";
  # Load peel: stageId + Body/Banner in FreestandingEmitLoad; Mult..Apply in Scaffold.
  freestandingEmitLoadPath = "src/systems/SystemsLean/FreestandingEmitLoad.lean";
  freestandingEmitLoadScaffoldPath =
    "src/systems/SystemsLean/FreestandingEmitLoadScaffold.lean";
  productPathBootstrapWriterTokens = [
    "SLAKE_EMIT_FREESTANDING_C_V0"
    "FreestandingEmit"
    "slake-emit-freestanding-c"
    "product residual free"
  ];
  # stageId def after load peel (FreestandingEmitLoad).
  productPathBootstrapWriterLoadTokens = [
    "def stageId : String := \"SLAKE_EMIT_FREESTANDING_C_V0\""
    "SLAKE_EMIT_FREESTANDING_C_V0"
    "FreestandingEmitLoad"
  ];
  productPathBootstrapAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-BOOTSTRAP"
    "HOST-SELF-HOST-PRODUCT-PATH-BOOTSTRAP"
    "SLAKE_SELF_HOST_PRODUCT_PATH_BOOTSTRAP_V0"
    "productPathHostLakeBootstrapRemains"
    "product path Lake bootstrap"
  ];

  # Batch-31: Ok/PartialReady bulk authority in BootstrapHonesty
  # (land-time remains + Lake writer path cites). Living-tip claim true defs stay off this module.
  # Dual-pin thin batch 3: home also owns historical stage/writer-path/module-cite strings.
  # Long-file split: live theorem/smoke in BootstrapHonestyTheorems;
  # greppable theorem cites stay on this primary header.
  productPathBootstrapModulePath =
    "src/systems/SystemsLean/BootstrapHonesty.lean";
  productPathBootstrapModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_BOOTSTRAP_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-BOOTSTRAP"
    "SELF-HOST-PRODUCT-PATH-BOOTSTRAP"
    "productPathBootstrapSurfaceOk"
    "productPathHostLakeBootstrapPartialReady"
    "def productPathHostLakeBootstrapPartialReady : Bool :="
    "def productPathHostLakeBootstrapRemains : Bool := true"
    # Greppable theorem cite (live def in BootstrapHonestyTheorems; long-file split).
    "theorem productPathHostLakeBootstrapPartialReady_true"
    "theorem productPathHostLakeBootstrapRemains_true"
    "BootstrapHonestyTheorems"
    "BootstrapHonesty"
    "bootstrapHonestyModuleCite"
    "hostLakeEmitWriterPath"
    "hostLakeEmitExe"
    "hostLakeEmitStageCite"
    "src/systems/SystemsLean/FreestandingEmit.lean"
    "slake-emit-freestanding-c"
    "SLAKE_EMIT_FREESTANDING_C_V0"
    "out/freestanding-c/"
  ];
  productPathBootstrapModuleForbiddenTokens = [
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "import SystemsLean.FreestandingEmit"
  ];

  # Claim B path: product writer surface substrate on product Out (partial B5).
  # Writer-side contracts (plan/apply/body) beyond B3 B-bar consumer APIs.
  productWriterSurfaceStageId = "SLAKE_SELF_HOST_PRODUCT_WRITER_SURFACE_V0";
  productWriterSurfaceHostId = "HOST-SELF-HOST-PRODUCT-WRITER-SURFACE";
  productWriterSurfaceSelfHostId = "SELF-HOST-PRODUCT-WRITER-SURFACE";
  productWriterSurfaceOwnership = [
    "HOST-EMIT-PLAN"
    "HOST-EMIT-APPLY"
    "HOST-EMIT-BODY"
  ];
  productWriterSurfaceApis = [
    "slake_emit_plan_from_compose"
    "slake_emit_apply_from_compose"
    "slake_emit_body_from_compose"
  ];
  productWriterSurfaceAcceptanceTokens = [
    "SELF-HOST-PRODUCT-WRITER-SURFACE"
    "HOST-SELF-HOST-PRODUCT-WRITER-SURFACE"
    "SLAKE_SELF_HOST_PRODUCT_WRITER_SURFACE_V0"
    "productWriterSurfacePartialReady"
    "product writer surface"
  ];

  # Batch-30: Ok/PartialReady bulk authority in ProductPathWriterSurface
  # (land-time plan/apply/body + ownership cites). Living-tip claim true defs stay off this module.
  # Dual-pin thin batch 4: home also owns historical stage/API/ownership/module-cite strings.
  # Long-file split: live theorem/smoke in ProductPathWriterSurfaceTheorems;
  # parent keeps greppable theorem cite + Theorems module name.
  productWriterSurfaceModulePath =
    "src/systems/SystemsLean/ProductPathWriterSurface.lean";
  productWriterSurfaceModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_WRITER_SURFACE_V0"
    "HOST-SELF-HOST-PRODUCT-WRITER-SURFACE"
    "SELF-HOST-PRODUCT-WRITER-SURFACE"
    "productWriterSurfaceOk"
    "productWriterSurfacePartialReady"
    "def productWriterSurfacePartialReady : Bool :="
    # Greppable theorem cite (live def in ProductPathWriterSurfaceTheorems; long-file split).
    "theorem productWriterSurfacePartialReady_true"
    "WRITER-SURFACE-THEOREM"
    "HOST-WRITER-SURFACE-THEOREM"
    "WRITER-SURFACE-SMOKE"
    "HOST-WRITER-SURFACE-SMOKE"
    "ProductPathWriterSurfaceTheorems"
    "ProductPathWriterSurface"
    "writerSurfaceModuleCite"
    "productWriterApiPlan"
    "productWriterApiApply"
    "productWriterApiBody"
    "productWriterOwnPlan"
    "productWriterOwnApply"
    "productWriterOwnBody"
    "HOST-EMIT-PLAN"
    "HOST-EMIT-APPLY"
    "HOST-EMIT-BODY"
    "slake_emit_plan_from_compose"
    "slake_emit_apply_from_compose"
    "slake_emit_body_from_compose"
    "slake_mult_is_valid"
    "slake_linear_consume"
    "out/freestanding-c/"
  ];
  productWriterSurfaceModuleForbiddenTokens = [
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "import SystemsLean.FreestandingEmit"
  ];

  # Claim B path: freestanding product writer path plan substrate (partial B6).
  # Ordered regenerate steps the product path must eventually own. Beyond B5
  # surface; not complete; Lake FreestandingEmit remains bootstrap writer (B4).
  productWriterPathPlanStageId = "SLAKE_SELF_HOST_PRODUCT_WRITER_PATH_PLAN_V0";
  productWriterPathPlanHostId = "HOST-SELF-HOST-PRODUCT-WRITER-PATH-PLAN";
  productWriterPathPlanSelfHostId = "SELF-HOST-PRODUCT-WRITER-PATH-PLAN";
  productWriterPathPlanStepTokens = [
    "WRITER-PATH-STEP-READ-SSOT"
    "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY"
    "WRITER-PATH-STEP-WRITE-FREESTANDING-HC"
    "WRITER-PATH-STEP-INSTALL-OUT"
  ];
  productWriterPathPlanAcceptanceTokens = [
    "SELF-HOST-PRODUCT-WRITER-PATH-PLAN"
    "HOST-SELF-HOST-PRODUCT-WRITER-PATH-PLAN"
    "SLAKE_SELF_HOST_PRODUCT_WRITER_PATH_PLAN_V0"
    "productWriterPathPlanPartialReady"
    "product writer path plan"
    "WRITER-PATH-STEP-READ-SSOT"
    "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY"
    "WRITER-PATH-STEP-WRITE-FREESTANDING-HC"
    "WRITER-PATH-STEP-INSTALL-OUT"
  ];

  # Batch-29: Ok/PartialReady bulk authority in ProductPathWriterPathPlan
  # (land-time ordered plan step cites). Living-tip claim true defs stay off this module.
  # Dual-pin thin batch 5: home also owns historical stage/step/module-cite strings.
  # Long-file split: live theorem/smoke in ProductPathWriterPathPlanTheorems;
  # parent keeps greppable theorem cite + Theorems module name.
  productWriterPathPlanModulePath =
    "src/systems/SystemsLean/ProductPathWriterPathPlan.lean";
  productWriterPathPlanModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_WRITER_PATH_PLAN_V0"
    "HOST-SELF-HOST-PRODUCT-WRITER-PATH-PLAN"
    "SELF-HOST-PRODUCT-WRITER-PATH-PLAN"
    "productWriterPathPlanOk"
    "productWriterPathPlanPartialReady"
    "def productWriterPathPlanPartialReady : Bool :="
    # Greppable theorem cite (live def in ProductPathWriterPathPlanTheorems; long-file split).
    "theorem productWriterPathPlanPartialReady_true"
    "WRITER-PATH-PLAN-THEOREM"
    "HOST-WRITER-PATH-PLAN-THEOREM"
    "WRITER-PATH-PLAN-SMOKE"
    "HOST-WRITER-PATH-PLAN-SMOKE"
    "ProductPathWriterPathPlanTheorems"
    "ProductPathWriterPathPlan"
    "writerPathPlanModuleCite"
    "productWriterPathStepReadSsot"
    "productWriterPathStepCompose"
    "productWriterPathStepWriteWire"
    "productWriterPathStepInstallOut"
    "WRITER-PATH-STEP-READ-SSOT"
    "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY"
    "WRITER-PATH-STEP-WRITE-FREESTANDING-HC"
    "WRITER-PATH-STEP-INSTALL-OUT"
    "FreestandingEmit"
    "slake-emit-freestanding-c"
    "SLAKE_EMIT_FREESTANDING_C_V0"
  ];
  productWriterPathPlanModuleForbiddenTokens = [
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "import SystemsLean.FreestandingEmit"
  ];

  # Claim B path: freestanding product writer path execution evidence (partial B7).
  # Host FreestandingEmit + just build **perform** B6 plan steps.
  # Tokens are DISTINCT from mere WRITER-PATH-STEP-* plan ids (plan-id re-list
  # theater banned). Still Lake bootstrap; complete stays false.
  productWriterPathExecutionStageId = "SLAKE_SELF_HOST_PRODUCT_WRITER_PATH_EXEC_V0";
  productWriterPathExecutionHostId = "HOST-SELF-HOST-PRODUCT-WRITER-PATH-EXEC";
  productWriterPathExecutionSelfHostId = "SELF-HOST-PRODUCT-WRITER-PATH-EXEC";
  # Execution cites on FreestandingEmit (function names / write entry).
  # Load peel: Body + Dual SSOT require on FreestandingEmitLoad.
  productWriterPathExecutionLoadTokens = [
    "def loadBodySsot"
    "def requireDualSsotEqual"
  ];
  # Mult..Apply unit loaders on FreestandingEmitLoadScaffold (same namespace).
  productWriterPathExecutionLoadScaffoldTokens = [
    "def loadMultSsot"
    "def loadPlanSsot"
  ];
  productWriterPathExecutionWriterTokens = [
    "def renderHeader"
    "def renderSource"
    "def emitAtRoot"
    "IO.FS.writeFile"
    "host_emit_mult.ssot.txt"
    "slake_freestanding.h"
    "slake_freestanding.c"
    "SLAKE_EMIT_FREESTANDING_C_V0"
  ];
  # Install step: just build (just/product-wire.just) copies emit -> product Out.
  productWriterPathExecutionInstallPath = "just/product-wire.just";
  productWriterPathExecutionInstallTokens = [
    "build"
    "cp -f"
    "out/freestanding-c"
    "slake_freestanding"
    "SLAKE_EMIT_FREESTANDING_C_V0"
  ];
  productWriterPathExecutionAcceptanceTokens = [
    "SELF-HOST-PRODUCT-WRITER-PATH-EXEC"
    "HOST-SELF-HOST-PRODUCT-WRITER-PATH-EXEC"
    "SLAKE_SELF_HOST_PRODUCT_WRITER_PATH_EXEC_V0"
    "productWriterPathExecutionPartialReady"
    "product writer path execution"
    "loadMultSsot"
    "renderHeader"
    "emitAtRoot"
    "IO.FS.writeFile"
    "build"
  ];

  # Batch-28: Ok/PartialReady bulk authority in ProductPathWriterPathExec
  # (land-time host execution cites). Living-tip claim true defs stay off this module.
  # Dual-pin thin batch 6: home also owns historical stage/fn/module-cite strings.
  # Long-file split: live theorem/smoke in ProductPathWriterPathExecTheorems;
  # parent keeps greppable theorem cite + Theorems module name.
  productWriterPathExecModulePath =
    "src/systems/SystemsLean/ProductPathWriterPathExec.lean";
  productWriterPathExecModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_WRITER_PATH_EXEC_V0"
    "HOST-SELF-HOST-PRODUCT-WRITER-PATH-EXEC"
    "SELF-HOST-PRODUCT-WRITER-PATH-EXEC"
    "productWriterPathExecutionOk"
    "productWriterPathExecutionPartialReady"
    "def productWriterPathExecutionPartialReady : Bool :="
    # Greppable theorem cite (live def in ProductPathWriterPathExecTheorems; long-file split).
    "theorem productWriterPathExecutionPartialReady_true"
    "WRITER-PATH-EXEC-THEOREM"
    "HOST-WRITER-PATH-EXEC-THEOREM"
    "WRITER-PATH-EXEC-SMOKE"
    "HOST-WRITER-PATH-EXEC-SMOKE"
    "ProductPathWriterPathExecTheorems"
    "ProductPathWriterPathExec"
    "writerPathExecModuleCite"
    "productWriterPathExecReadSsotFn"
    "productWriterPathExecComposeFn"
    "productWriterPathExecWriteFn"
    "productWriterPathExecInstallRecipe"
    "productWriterPathExecEmitEntry"
    "productWriterPathExecDualSsot"
    "loadMultSsot"
    "loadBodySsot"
    "loadPlanSsot"
    "requireDualSsotEqual"
    "renderHeader"
    "renderSource"
    "emitAtRoot"
    "IO.FS.writeFile"
    "build"
    "FreestandingEmit"
    "slake-emit-freestanding-c"
  ];
  productWriterPathExecModuleForbiddenTokens = [
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "import SystemsLean.FreestandingEmit"
  ];

  # Claim B path: freestanding product path ownership inputs bar (partial B8).
  # Mult..Out dual SSOT + emit .h/.c + Out surfaces a freestanding product path
  # must own. productPathFreestandingOwnershipClaimed stays false (inputs bar
  # is not freestanding ownership claimed). Beyond B7 host-exec; not complete.
  productPathOwnershipStageId = "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_V0";
  productPathOwnershipHostId = "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP";
  productPathOwnershipSelfHostId = "SELF-HOST-PRODUCT-PATH-OWNERSHIP";
  # Mult..Out host_emit_*.ssot.txt required for ownership input surface.
  productPathOwnershipSsotPaths = [
    "src/systems/emit/host_emit_mult.ssot.txt"
    "src/systems/emit/host_emit_linear.ssot.txt"
    "src/systems/emit/host_emit_erasure.ssot.txt"
    "src/systems/emit/host_emit_extract.ssot.txt"
    "src/systems/emit/host_emit_types.ssot.txt"
    "src/systems/emit/host_emit_program.ssot.txt"
    "src/systems/emit/host_emit_graph.ssot.txt"
    "src/systems/emit/host_emit_compose.ssot.txt"
    "src/systems/emit/host_emit_plan.ssot.txt"
    "src/systems/emit/host_emit_apply.ssot.txt"
    "src/systems/emit/host_emit_body_fragment.ssot.txt"
  ];
  productPathOwnershipEmitPaths = [
    "src/systems/emit/slake_freestanding.h"
    "src/systems/emit/slake_freestanding.c"
  ];
  productPathOwnershipAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-OWNERSHIP"
    "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP"
    "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_V0"
    "productPathOwnershipInputsPartialReady"
    "productPathFreestandingOwnershipClaimed"
    "product path ownership inputs"
    "host_emit_mult.ssot.txt"
    "host_emit_body_fragment.ssot.txt"
    "slake_freestanding.h"
    "slake_freestanding.c"
    "out/freestanding-c/"
  ];

  # Batch-27: Ok/PartialReady bulk authority in ProductPathOwnershipInputs
  # (land-time Mult..Out cites). Living-tip claim true defs stay off this module.
  # Dual-pin thin batch 7: historical stage/path/moduleCite dual-pins home-primary.
  # Long-file split: live theorem/smoke in ProductPathOwnershipInputsTheorems;
  # greppable theorem cites stay on this primary header.
  productPathOwnershipInputsModulePath =
    "src/systems/SystemsLean/ProductPathOwnershipInputs.lean";
  productPathOwnershipInputsModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP"
    "SELF-HOST-PRODUCT-PATH-OWNERSHIP"
    "productPathOwnershipInputsOk"
    "productPathOwnershipInputsPartialReady"
    "def productPathOwnershipInputsPartialReady : Bool :="
    # Greppable theorem cite (live def in ProductPathOwnershipInputsTheorems; long-file split).
    "theorem productPathOwnershipInputsPartialReady_true"
    "ProductPathOwnershipInputsTheorems"
    "ProductPathOwnershipInputs"
    "ownershipInputsModuleCite"
    "productPathOwnershipSsotMult"
    "productPathOwnershipSsotBody"
    "productPathOwnershipEmitH"
    "productPathOwnershipEmitC"
    "productPathOwnershipDualSsotCite"
    "productPathOwnershipOutPath"
    "host_emit_mult.ssot.txt"
    "host_emit_body_fragment.ssot.txt"
    "slake_freestanding.h"
    "slake_freestanding.c"
    "out/freestanding-c/"
    "requireDualSsotEqual"
  ];
  productPathOwnershipInputsModuleForbiddenTokens = [
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "import SystemsLean.FreestandingEmit"
    "IO.FS.writeFile"
    "def renderHeader"
    "def emitAtRoot"
  ];

  # Claim B path: freestanding product path perform gap (partial B9).
  # Full regenerate perform still depends on Lake FreestandingEmit for
  # read/compose/write. productPathFreestandingPerformClaimed stays false.
  # Install Out cp half is Lake-free step mechanism when emit wire present.
  # Lake-free install-only entrypoint is B10 (install-freestanding-c-out).
  # Beyond B8 ownership inputs; not complete; not ownership claimed; not
  # freestanding perform claimed.
}
