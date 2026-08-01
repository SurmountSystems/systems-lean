# SPDX-License-Identifier: Unlicense
# Data only: freestanding emit product paths, APIs, stage tokens, driver path specs.
# Imported by ./specs.nix. Driver *runs* stay shell; tokens here are presence only.
# Pure Nix supersets emit-driver self-greps (SLAKE_EMIT_FREESTANDING_C_V0 + UNIT_DEEPEN_V1).
# SELF-HOST-KERNEL-SELF-APPLY / SELF-HOST-KERNEL-REBUILD (partial B2): HOST-EMIT-*
# Mult+Linear+Erasure+Types+Program (+ Mult..Out expand) required on emit product
# wire via emitProductAll; emit/out byte match when release present lives in
# default.nix; batch-33 KernelSelfApply module dual-pin. SELF-HOST-PRODUCT-OUT
# (partial B3): Out-first B-bar ownership + API tokens when release present
# (productOutBbar*). SELF-HOST-PRODUCT-PATH-BOOTSTRAP (partial B4): host Lake
# FreestandingEmit still owns product writer while Out is consumer evidence.
# SELF-HOST-PRODUCT-WRITER-SURFACE (partial B5): product Out writer plan/apply/body
# APIs + HOST-EMIT-PLAN/APPLY/BODY (productWriter*).
# SELF-HOST-PRODUCT-WRITER-PATH-PLAN (partial B6): ordered WRITER-PATH-STEP-*.
# SELF-HOST-PRODUCT-WRITER-PATH-EXEC (partial B7): host FreestandingEmit + just
# just build perform cites (distinct from plan step ids).
# SELF-HOST-PRODUCT-PATH-OWNERSHIP (partial B8): Mult..Out SSOT + emit + Out
# ownership inputs substrate; living tip after B40 SelfApplyFs ownership claimed
# true (scan requires true); B8 is not Full/complete.
# SELF-HOST-PRODUCT-PATH-PERFORM (partial B9): perform gap (Lake still performs
# read/compose/write) + install step mechanism; entrypoint claimed false; freestanding perform claimed
# false; complete false.
# SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE (partial B12): host plan/apply/body compose
# substrate ProductPathComposePlan + compose-product-plan; ComposeDependsOnLake true;
# perform claimed false; complete false.
# PRODUCT-RESIDUAL-FREE-MEASURE (claim A) scans release for forbidden managed
# residual in default.nix + residual-free-measure.nix. Not host elaborator free;
# residualFreeClaimed may be true with DualResidual honesty (Step 3).
let
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
  # Install step: just build copies emit -> product Out.
  productWriterPathExecutionInstallPath = "justfile";
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
  productPathPerformLakeLoadPath = freestandingEmitLoadScaffoldPath;
  # Install step mechanism (cp half): justfile full path still has Lake emit +
  # install cp (just build). B10 isolates Lake-free install-only recipe.
  productPathPerformInstallPath = "justfile";
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
  productPathPerformStepInstallPath = "justfile";
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
  productPathPerformReadJustPath = "justfile";
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
  productPathPerformComposeJustPath = "justfile";
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
  productPathPerformWriteHcJustPath = "justfile";
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
  productPathFreestandingCapableJustPath = "justfile";
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
  productPathFreestandingCapableStepContractJustPath = "justfile";
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
  productPathFreestandingCapableReadJustPath = "justfile";
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
  productPathFreestandingCapableComposeJustPath = "justfile";
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
  productPathFreestandingCapableWriteHcJustPath = "justfile";
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
  productPathFreestandingCapableRegenerateJustPath = "justfile";
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
  productPathFreestandingCapableInstallOutJustPath = "justfile";
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
  productPathFreestandingCapableFullBarJustPath = "justfile";
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
  productPathOwnershipRegenerateStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0";
  productPathOwnershipRegenerateHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE";
  productPathOwnershipRegenerateSelfHostId =
    "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE";
  productPathOwnershipRegenerateModulePath =
    "src/systems/SystemsLean/ProductPathOwnershipRegenerate.lean";
  # Dual-pin thin batch 21: home-primary stage/host/recipe/exe/Ok/step ids.
  productPathOwnershipRegenerateModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"
    "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"
    "def stageId : String :="
    "def hostId : String :="
    "def selfHostId : String :="
    "productPathOwnershipRegenerateOk"
    "productPathOwnershipRegeneratePartialReady"
    "def productPathOwnershipRegeneratePartialReady : Bool :="
    "productPathOwnershipRegenerateInstallLakeFree"
    "productPathOwnershipRegenerateReadLakeFree"
    "productPathOwnershipRegenerateComposeLakeFree"
    "productPathOwnershipRegenerateWriteHcLakeFree"
    "productPathOwnershipRegenerateLakeFreeJoinClaimed"
    "productPathOwnershipRegenerateProductPathAuthorityClaimed"
    "productPathOwnershipRegenerateWithoutLake"
    "productPathOwnershipRegenerateDependsOnLake"
    "productPathOwnershipRegenerateInstallPathClaimed"
    "productPathOwnershipRegenerateReadPathClaimed"
    "productPathOwnershipRegenerateComposePathClaimed"
    "productPathOwnershipRegenerateWriteHcPathClaimed"
    "OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE"
    "OWNERSHIP-REGENERATE-READ-LAKE-FREE"
    "OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE"
    "OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE"
    "OWNERSHIP-REGENERATE-LAKE-FREE-JOIN"
    "OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY"
    "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
    "FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE"
    "ownership-regenerate"
    "ownership-regenerate-install-only"
    "ownership-regenerate-read-only"
    "ownership-regenerate-compose-only"
    "ownership-regenerate-write-hc-only"
    "ownership-regenerate-lake-free"
    "ownership-regenerate-product-path-authority"
    "slake-ownership-regenerate"
    "lakeExeName"
    "justMeasureRecipe"
    "lakeFreeInstallRecipe"
    "lakeFreeReadRecipe"
    "lakeFreeComposeRecipe"
    "lakeFreeWriteHcRecipe"
    "lakeFreeJoinRecipe"
    "productPathAuthorityRecipe"
    "sharedInstallRecipe"
    "install-freestanding-c-out"
    "ProductPathOwnershipRegenerate"
    "ProductPathComposePlan.planApplyBodySpecs"
    "ProductPathWriteHc"
    "slake_freestanding.h"
    "slake_freestanding.c"
    "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
    "theorem productPathOwnershipRegeneratePartialReady_true"
  ];
  productPathOwnershipRegenerateModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    # B30: WithoutLake dual-pin closed with product path authority; forbid dishonest false.
    "def productPathOwnershipRegenerateWithoutLake : Bool := false"
    "def productPathOwnershipRegenerateProductPathAuthorityClaimed : Bool := false"
    "def productPathOwnershipRegenerateLakeFreeJoinClaimed : Bool := false"
    "def productPathOwnershipRegenerateInstallLakeFree : Bool := false"
    "def productPathOwnershipRegenerateReadLakeFree : Bool := false"
    "def productPathOwnershipRegenerateComposeLakeFree : Bool := false"
    "def productPathOwnershipRegenerateWriteHcLakeFree : Bool := false"
    "def productPathFreestandingCapableStepContractFullSatisfied : Bool := true"
    "def freestandingProductSelfHostComplete : Bool := true"
    "def productPathFreestandingPerformClaimed : Bool := true"
    "def productPathFreestandingOwnershipClaimed : Bool := true"
    "OWNERSHIP-REGENERATE-COMPOSE-STILL-LAKE"
    "OWNERSHIP-REGENERATE-WRITE-HC-STILL-LAKE"
  ];
  productPathOwnershipRegenerateLakefilePath = "src/systems/lakefile.lean";
  productPathOwnershipRegenerateLakefileTokens = [
    "slake-ownership-regenerate"
    "SystemsLean.ProductPathOwnershipRegenerateMain"
  ];
  productPathOwnershipRegenerateJustPath = "justfile";
  productPathOwnershipRegenerateJustTokens = [
    "ownership-regenerate"
    "ownership-regenerate-install-only"
    "ownership-regenerate-read-only"
    "ownership-regenerate-compose-only"
    "ownership-regenerate-write-hc-only"
    "ownership-regenerate-lake-free"
    "ownership-regenerate-product-path-authority"
    "slake-ownership-regenerate"
    "ProductPathOwnershipRegenerate"
    "lake build slake-ownership-regenerate"
    "lake exe slake-ownership-regenerate"
    "OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE"
    "OWNERSHIP-REGENERATE-READ-LAKE-FREE"
    "OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE"
    "OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE"
    "OWNERSHIP-REGENERATE-LAKE-FREE-JOIN"
    "OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY"
    # B23 Lake-free READ recipe banner (unique to ownership-regenerate-read-only body).
    # Measure recipe may still lake-build; this string must stay on the read-only path.
    "Lake-free: no lake build/exe; dual SSOT presence+token only"
    # List authority cite for dual SSOT pairs (ProductPathReadSsot.dualSsotSpecs).
    "ProductPathReadSsot.dualSsotSpecs"
    # B24 Lake-free COMPOSE recipe banner (unique to ownership-regenerate-compose-only).
    "Lake-free: no lake build/exe; plan/apply/body dual SSOT presence+token only"
    # List authority cite for compose SSOT pairs (ProductPathComposePlan.planApplyBodySpecs).
    "ProductPathComposePlan.planApplyBodySpecs"
    # B25 Lake-free WRITE-HC recipe banner (unique to ownership-regenerate-write-hc-only).
    "Lake-free: no lake build/exe; freestanding .h/.c presence+token only"
    # List authority cite for write-hc basenames (ProductPathWriteHc.emitHeaderBase).
    "ProductPathWriteHc.emitHeaderBase"
    # B29 ordered Lake-free join banner (unique to ownership-regenerate-lake-free).
    # Require full join body invocs (Capable* + ownership path pieces + install)
    # so a future edit cannot drop middle path-piece steps and still pass pure Nix.
    "Lake-free: no lake build/exe; joins existing Lake-free Capable* + ownership path recipes"
    "just freestanding-capable-read-lake-free"
    "just freestanding-capable-compose-lake-free"
    "just freestanding-capable-write-hc-lake-free"
    "just ownership-regenerate-read-only"
    "just ownership-regenerate-compose-only"
    "just ownership-regenerate-write-hc-only"
    "just ownership-regenerate-install-only"
    # B30 product path authority recipe banners (unique to
    # ownership-regenerate-product-path-authority; not a B29 join rebrand).
    "token: OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY"
    "authority: freestanding-capable path (AuthorityNotEmit); not FreestandingEmit"
    "pipeline cite: FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"
    "distinct from B29 ownership-regenerate-lake-free join"
    "def productPathFreestandingCapableReadAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableComposeAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableWriteHcAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableRegenerateAuthorityNotEmit : Bool := true"
    "def productPathFreestandingCapableInstallOutAuthorityNotEmit : Bool := true"
  ];
  productPathOwnershipRegenerateAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"
    "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"
    "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0"
    "productPathOwnershipRegeneratePartialReady"
    "productPathOwnershipRegenerateInstallLakeFree"
    "productPathOwnershipRegenerateReadLakeFree"
    "productPathOwnershipRegenerateComposeLakeFree"
    "productPathOwnershipRegenerateWriteHcLakeFree"
    "productPathOwnershipRegenerateLakeFreeJoinClaimed"
    "productPathOwnershipRegenerateProductPathAuthorityClaimed"
    "productPathOwnershipRegenerateWithoutLake"
    "productPathOwnershipRegenerateDependsOnLake"
    "OWNERSHIP-REGENERATE-INSTALL-LAKE-FREE"
    "OWNERSHIP-REGENERATE-READ-LAKE-FREE"
    "OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE"
    "OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE"
    "OWNERSHIP-REGENERATE-LAKE-FREE-JOIN"
    "OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY"
    "ownership-regenerate"
    "ownership-regenerate-install-only"
    "ownership-regenerate-read-only"
    "ownership-regenerate-compose-only"
    "ownership-regenerate-write-hc-only"
    "ownership-regenerate-lake-free"
    "ownership-regenerate-product-path-authority"
    "slake-ownership-regenerate"
    "ProductPathOwnershipRegenerate"
    "product path ownership regenerate"
    "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"
    "FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE"
  ];

  # Partial B31: freestanding product path perform evidence beyond B30.
  # Evidence claimed true (freestanding-perform-evidence); perform claimed false;
  # DependsOnLake true; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE open.
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
  productPathFreestandingPerformEvidenceJustPath = "justfile";
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
  productPathFreestandingPerformOfficialPathJustPath = "justfile";
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
  productPathFreestandingPerformOfficialPathAlternateJustPath = "justfile";
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
  productPathFreestandingPerformDualEqualityWriteParityJustPath = "justfile";
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
  productPathFreestandingPerformDualEqualityWriteClosePathStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CLOSE_PATH_V0";
  productPathFreestandingPerformDualEqualityWriteClosePathHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH";
  productPathFreestandingPerformDualEqualityWriteClosePathSelfHostId =
    "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH";
  productPathFreestandingPerformDualEqualityWriteClosePathModulePath =
    "src/systems/SystemsLean/DualEqWriteClosePath.lean";
  productPathFreestandingPerformDualEqualityWriteClosePathModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CLOSE_PATH_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
    "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
    "productPathFreestandingPerformDualEqualityWriteClosePathOk"
    "productPathFreestandingPerformDualEqualityWriteClosePathMeasured"
    "productPathFreestandingPerformDualEqualityWriteClosePathPartialReady"
    "productPathDualEqualityWriteClosePathNamed"
    "productPathDualEqualityWriteClosePathNotGapClosed"
    "productPathDualEqualityWriteParityGapOpen"
    "productPathCapableWriteStructuralNotDualEquality"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "productPathFreestandingPerformDualEqualityWriteParityMeasured"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathStillUsesLake"
    "productPathOfficialPathRetireFreestandingEmitRequired"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NAMED"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NOT-GAP-CLOSED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "build"
    "FreestandingEmit"
    "slake-emit-freestanding-c"
    "DUAL-SSOT-EQUALITY"
    "requireDualSsotEqual"
    "freestandingCapableWriteFreestandingHc"
    "CapableWriteHc"
    "freestanding-perform-dual-equality-write-close-path"
    "freestanding-perform-dual-equality-write-close-path-measure"
    "slake-freestanding-perform-dual-equality-write-close-path"
    "freestanding-perform-dual-equality-write-parity"
  ];
  productPathFreestandingPerformDualEqualityWriteClosePathModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    # B35: close path measured dual-pin; forbid dishonest false / gap closed / perform claimed true forge.
    "def productPathFreestandingPerformDualEqualityWriteClosePathMeasured : Bool := false"
    "def productPathDualEqualityWriteClosePathNamed : Bool := false"
    "def productPathDualEqualityWriteClosePathNotGapClosed : Bool := false"
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
  productPathFreestandingPerformDualEqualityWriteClosePathLakefilePath =
    "src/systems/lakefile.lean";
  productPathFreestandingPerformDualEqualityWriteClosePathLakefileTokens = [
    "slake-freestanding-perform-dual-equality-write-close-path"
    "SystemsLean.DualEqWriteClosePathMain"
  ];
  productPathFreestandingPerformDualEqualityWriteClosePathJustPath = "justfile";
  productPathFreestandingPerformDualEqualityWriteClosePathJustTokens = [
    "freestanding-perform-dual-equality-write-close-path"
    "freestanding-perform-dual-equality-write-close-path-measure"
    "slake-freestanding-perform-dual-equality-write-close-path"
    "DualEqWriteClosePath"
    "lake build slake-freestanding-perform-dual-equality-write-close-path"
    "lake exe slake-freestanding-perform-dual-equality-write-close-path"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NAMED"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NOT-GAP-CLOSED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    # B35 Lake-free dual-equality WRITE close-path recipe banners.
    "token: FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
    "framing: ordered close-path steps named; gap stays open; close path named != gap closed"
    "distinct from B34 freestanding-perform-dual-equality-write-parity (parity dual-pin, not close path)"
    "def productPathFreestandingPerformDualEqualityWriteClosePathMeasured : Bool := true"
    "def productPathDualEqualityWriteClosePathNamed : Bool := true"
    "def productPathDualEqualityWriteClosePathNotGapClosed : Bool := true"
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
    "just freestanding-perform-dual-equality-write-parity"
  ];
  productPathFreestandingPerformDualEqualityWriteClosePathAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CLOSE_PATH_V0"
    "productPathFreestandingPerformDualEqualityWriteClosePathPartialReady"
    "productPathFreestandingPerformDualEqualityWriteClosePathMeasured"
    "productPathDualEqualityWriteClosePathNamed"
    "productPathDualEqualityWriteClosePathNotGapClosed"
    "productPathDualEqualityWriteParityGapOpen"
    "productPathCapableWriteStructuralNotDualEquality"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NAMED"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH-NOT-GAP-CLOSED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "freestanding-perform-dual-equality-write-close-path"
    "freestanding-perform-dual-equality-write-close-path-measure"
    "slake-freestanding-perform-dual-equality-write-close-path"
    "DualEqWriteClosePath"
    "product path freestanding perform dual equality write close path"
  ];

  # Partial B36: freestanding product path perform dual-equality WRITE API beyond B35
  # (close-path step DUAL-EQUALITY-API). API measured true; present true; authority not
  # emit; not official; step advanced; gap open true; Capable WRITE structural not dual-
  # equality; perform claimed false; DependsOnLake true; dual-equality blocks retirement;
  # FULL-BAR open.
  productPathFreestandingPerformDualEqualityWriteApiStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_API_V0";
  productPathFreestandingPerformDualEqualityWriteApiHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API";
  productPathFreestandingPerformDualEqualityWriteApiSelfHostId =
    "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API";
  productPathFreestandingPerformDualEqualityWriteApiModulePath =
    "src/systems/SystemsLean/DualEqWriteApi.lean";
  # Load peel companion (dual SSOT load/assemble/dialect/validate).
  productPathFreestandingPerformDualEqualityWriteApiLoadPath =
    "src/systems/SystemsLean/DualEqWriteLoad.lean";
  productPathFreestandingPerformDualEqualityWriteApiModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_API_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API"
    "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API"
    "productPathFreestandingPerformDualEqualityWriteApiOk"
    "productPathFreestandingPerformDualEqualityWriteApiMeasured"
    "productPathFreestandingPerformDualEqualityWriteApiPartialReady"
    "productPathDualEqualityWriteApiPresent"
    "productPathDualEqualityWriteApiAuthorityNotEmit"
    "productPathDualEqualityWriteApiNotOfficial"
    "productPathDualEqualityWriteApiStepAdvanced"
    "productPathDualEqualityWriteParityGapOpen"
    "productPathCapableWriteStructuralNotDualEquality"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "productPathFreestandingPerformDualEqualityWriteClosePathMeasured"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathStillUsesLake"
    "productPathOfficialPathRetireFreestandingEmitRequired"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-PRESENT"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-AUTHORITY-NOT-EMIT"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-NOT-OFFICIAL"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "build"
    "FreestandingEmit"
    "slake-emit-freestanding-c"
    "DUAL-SSOT-EQUALITY"
    "requireDualSsotEqual"
    "dualSsotBlockEqual"
    "freestandingDualEqualityWriteFreestandingHc"
    # Load peel cite (helpers live on DualEqWriteLoad).
    "DualEqWriteLoad"
    "import SystemsLean.DualEqWriteLoad"
    # Full dual-eq surface: all twelve Emit* imports (matches just dual-pin).
    "import SystemsLean.EmitBanner"
    "import SystemsLean.EmitMult"
    "import SystemsLean.EmitLinear"
    "import SystemsLean.EmitErasure"
    "import SystemsLean.EmitExtract"
    "import SystemsLean.EmitExtractScaffold"
    "import SystemsLean.EmitTypes"
    "import SystemsLean.EmitTypesScaffold"
    "import SystemsLean.EmitProgram"
    "import SystemsLean.EmitProgramScaffold"
    "import SystemsLean.EmitGraph"
    "import SystemsLean.EmitGraphScaffold"
    "import SystemsLean.EmitCompose"
    "import SystemsLean.EmitComposeScaffold"
    "import SystemsLean.EmitPlan"
    "import SystemsLean.EmitPlanScaffold"
    "import SystemsLean.EmitApply"
    "import SystemsLean.EmitApplyScaffold"
    "import SystemsLean.EmitBody"
    "import SystemsLean.EmitBodyScaffold"
    # B36 post-write validateProduct-parity greppable cites (defs on DualEqWriteLoad).
    "validateDualEqualityWriteProduct"
    "productWireHonestyTokens"
    "applyBodySsotDialect"
    "UNIT_DEEPEN_V1"
    "HOST-EMIT-SSOT"
    "freestanding-perform-dual-equality-write-api"
    "freestanding-perform-dual-equality-write-api-measure"
    "slake-freestanding-perform-dual-equality-write-api"
    "freestanding-perform-dual-equality-write-close-path"
  ];
  # Load peel: stageId + dual SSOT load/assemble + validate defs.
  productPathFreestandingPerformDualEqualityWriteApiLoadTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_API_V0"
    "DualEqWriteLoad"
    "def stageId : String :="
    "def dualSsotBlockEqual"
    "def requireDualSsotEqual"
    "def dualEqualityWriteSpecs"
    "def freestandingDualEqualityWriteLoadOne"
    "def assembleHeaderFromSsot"
    "def assembleSourceFromSsot"
    "def loadBodySsotDialect"
    "def applyBodySsotDialect"
    "def validateDualEqualityWriteProduct"
    "def productWireHonestyTokens"
    "DUAL-SSOT-EQUALITY"
    "import SystemsLean.EmitBanner"
    "import SystemsLean.EmitBody"
    "import SystemsLean.EmitBodyScaffold"
    "UNIT_DEEPEN_V1"
    "HOST-EMIT-SSOT"
    "product residual free"
    "not PROVABLY"
  ];
  productPathFreestandingPerformDualEqualityWriteApiModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    # B36: API measured dual-pin; forbid dishonest false / gap closed / perform claimed true forge.
    "def productPathFreestandingPerformDualEqualityWriteApiMeasured : Bool := false"
    "def productPathDualEqualityWriteApiPresent : Bool := false"
    "def productPathDualEqualityWriteApiAuthorityNotEmit : Bool := false"
    "def productPathDualEqualityWriteApiNotOfficial : Bool := false"
    "def productPathDualEqualityWriteApiStepAdvanced : Bool := false"
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
  productPathFreestandingPerformDualEqualityWriteApiLakefilePath =
    "src/systems/lakefile.lean";
  productPathFreestandingPerformDualEqualityWriteApiLakefileTokens = [
    "slake-freestanding-perform-dual-equality-write-api"
    "SystemsLean.DualEqWriteApiMain"
  ];
  productPathFreestandingPerformDualEqualityWriteApiJustPath = "justfile";
  productPathFreestandingPerformDualEqualityWriteApiJustTokens = [
    "freestanding-perform-dual-equality-write-api"
    "freestanding-perform-dual-equality-write-api-measure"
    "slake-freestanding-perform-dual-equality-write-api"
    "DualEqWriteApi"
    "lake build slake-freestanding-perform-dual-equality-write-api"
    "lake exe slake-freestanding-perform-dual-equality-write-api"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-PRESENT"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-AUTHORITY-NOT-EMIT"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-NOT-OFFICIAL"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-STEP-ADVANCED"
    "freestandingDualEqualityWriteFreestandingHc"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    # B36 Lake-free dual-equality WRITE API recipe banners.
    "token: FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API"
    "framing: real freestanding dual-equality WRITE (Emit* + requireDualSsotEqual + write); SelfApplyFs gap closed after B37 (historical API module may pin gap open)"
    "distinct from B35 freestanding-perform-dual-equality-write-close-path (close-path naming, not dual-equality WRITE API)"
    "def productPathFreestandingPerformDualEqualityWriteApiMeasured : Bool := true"
    "def productPathDualEqualityWriteApiPresent : Bool := true"
    "def productPathDualEqualityWriteApiAuthorityNotEmit : Bool := true"
    "def productPathDualEqualityWriteApiNotOfficial : Bool := true"
    "def productPathDualEqualityWriteApiStepAdvanced : Bool := true"
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
    "just freestanding-perform-dual-equality-write-close-path"
  ];
  productPathFreestandingPerformDualEqualityWriteApiAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API"
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_API_V0"
    "productPathFreestandingPerformDualEqualityWriteApiPartialReady"
    "productPathFreestandingPerformDualEqualityWriteApiMeasured"
    "productPathDualEqualityWriteApiPresent"
    "productPathDualEqualityWriteApiAuthorityNotEmit"
    "productPathDualEqualityWriteApiNotOfficial"
    "productPathDualEqualityWriteApiStepAdvanced"
    "productPathDualEqualityWriteParityGapOpen"
    "productPathCapableWriteStructuralNotDualEquality"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-PRESENT"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-AUTHORITY-NOT-EMIT"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-NOT-OFFICIAL"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-API-STEP-ADVANCED"
    "freestandingDualEqualityWriteFreestandingHc"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "freestanding-perform-dual-equality-write-api"
    "freestanding-perform-dual-equality-write-api-measure"
    "slake-freestanding-perform-dual-equality-write-api"
    "DualEqWriteApi"
    "product path freestanding perform dual equality write api"
  ];

  # Partial B37: freestanding perform dual-equality WRITE CAPABLE-GAP close
  # (close-path step CAPABLE-GAP). CAPABLE-GAP measured true; gap closed true;
  # Capable dual-eq live true; step advanced; gap open false; perform claimed false;
  # DependsOnLake true; land-time B37 dual-equality blocks retirement pin;
  # FULL-BAR open. Land-time FreestandingEmit official; living tip B38 retired.
  productPathFreestandingPerformDualEqualityWriteCapableGapStageId =
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CAPABLE_GAP_V0";
  productPathFreestandingPerformDualEqualityWriteCapableGapHostId =
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP";
  productPathFreestandingPerformDualEqualityWriteCapableGapSelfHostId =
    "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP";
  productPathFreestandingPerformDualEqualityWriteCapableGapModulePath =
    "src/systems/SystemsLean/DualEqWriteCapableGap.lean";
  productPathFreestandingPerformDualEqualityWriteCapableGapModuleTokens = [
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CAPABLE_GAP_V0"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
    "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
    "productPathFreestandingPerformDualEqualityWriteCapableGapOk"
    "productPathFreestandingPerformDualEqualityWriteCapableGapMeasured"
    "productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady"
    "productPathDualEqualityWriteCapableGapClosed"
    "productPathCapableWriteDualEqualityLive"
    "productPathDualEqualityWriteCapableGapStepAdvanced"
    "productPathDualEqualityWriteParityGapOpen"
    "productPathCapableWriteStructuralNotDualEquality"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "productPathFreestandingPerformDualEqualityWriteApiMeasured"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathStillUsesLake"
    "productPathOfficialPathRetireFreestandingEmitRequired"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-CLOSED"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-DUAL-EQ-LIVE"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "build"
    "FreestandingEmit"
    "slake-emit-freestanding-c"
    "DUAL-SSOT-EQUALITY"
    "requireDualSsotEqual"
    "freestandingCapableWriteFreestandingHc"
    "CapableWriteHc"
    "freestanding-perform-dual-equality-write-capable-gap"
    "freestanding-perform-dual-equality-write-capable-gap-measure"
    "slake-freestanding-perform-dual-equality-write-capable-gap"
    "freestanding-perform-dual-equality-write-api"
  ];
  productPathFreestandingPerformDualEqualityWriteCapableGapModuleForbiddenTokens = [
    "import SystemsLean.FreestandingEmit"
    "SystemsLean.FreestandingEmit.emitAtRoot"
    # B37: CAPABLE-GAP measured dual-pin; forbid dishonest false / gap re-open / perform claimed true forge.
    "def productPathFreestandingPerformDualEqualityWriteCapableGapMeasured : Bool := false"
    "def productPathDualEqualityWriteCapableGapClosed : Bool := false"
    "def productPathCapableWriteDualEqualityLive : Bool := false"
    "def productPathDualEqualityWriteCapableGapStepAdvanced : Bool := false"
    "def productPathDualEqualityWriteParityGapOpen : Bool := true"
    "def productPathCapableWriteStructuralNotDualEquality : Bool := true"
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
  productPathFreestandingPerformDualEqualityWriteCapableGapLakefilePath =
    "src/systems/lakefile.lean";
  productPathFreestandingPerformDualEqualityWriteCapableGapLakefileTokens = [
    "slake-freestanding-perform-dual-equality-write-capable-gap"
    "SystemsLean.DualEqWriteCapableGapMain"
  ];
  productPathFreestandingPerformDualEqualityWriteCapableGapJustPath = "justfile";
  productPathFreestandingPerformDualEqualityWriteCapableGapJustTokens = [
    "freestanding-perform-dual-equality-write-capable-gap"
    "freestanding-perform-dual-equality-write-capable-gap-measure"
    "slake-freestanding-perform-dual-equality-write-capable-gap"
    "DualEqWriteCapableGap"
    "lake build slake-freestanding-perform-dual-equality-write-capable-gap"
    "lake exe slake-freestanding-perform-dual-equality-write-capable-gap"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-CLOSED"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-DUAL-EQ-LIVE"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    # B37 Lake-free CAPABLE-GAP recipe banners.
    "token: FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
    "framing: Capable WRITE dual-eq (Emit* + requireDualSsotEqual); parity gap closed; land-time FreestandingEmit official pin; living tip B38 retired"
    "distinct from B36 freestanding-perform-dual-equality-write-api (API present, not CAPABLE-GAP close)"
    "def productPathFreestandingPerformDualEqualityWriteCapableGapMeasured : Bool := true"
    "def productPathDualEqualityWriteCapableGapClosed : Bool := true"
    "def productPathCapableWriteDualEqualityLive : Bool := true"
    "def productPathDualEqualityWriteCapableGapStepAdvanced : Bool := true"
    "def productPathDualEqualityWriteParityGapOpen : Bool := false"
    "def productPathCapableWriteStructuralNotDualEquality : Bool := false"
    "def productPathFreestandingPerformClaimed : Bool := false"
    "def productPathPerformDependsOnLake : Bool := true"
    "def productPathOfficialPathStillUsesFreestandingEmit : Bool := true"
    "def productPathOfficialPathStillUsesLake : Bool := true"
    "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := true"
    "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := true"
    "lake build slake-emit-freestanding-c"
    "lake exe slake-emit-freestanding-c"
    "just freestanding-perform-dual-equality-write-api"
  ];
  productPathFreestandingPerformDualEqualityWriteCapableGapAcceptanceTokens = [
    "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
    "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
    "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_DUAL_EQUALITY_WRITE_CAPABLE_GAP_V0"
    "productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady"
    "productPathFreestandingPerformDualEqualityWriteCapableGapMeasured"
    "productPathDualEqualityWriteCapableGapClosed"
    "productPathCapableWriteDualEqualityLive"
    "productPathDualEqualityWriteCapableGapStepAdvanced"
    "productPathDualEqualityWriteParityGapOpen"
    "productPathCapableWriteStructuralNotDualEquality"
    "productPathFreestandingPerformClaimed"
    "productPathPerformDependsOnLake"
    "productPathOfficialPathStillUsesFreestandingEmit"
    "productPathOfficialPathDualEqualityBlocksRetirement"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-CLOSED"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-DUAL-EQ-LIVE"
    "FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP-STEP-ADVANCED"
    "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP"
    "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
    "freestanding-perform-dual-equality-write-capable-gap"
    "freestanding-perform-dual-equality-write-capable-gap-measure"
    "slake-freestanding-perform-dual-equality-write-capable-gap"
    "DualEqWriteCapableGap"
    "product path freestanding perform dual equality write capable gap"
  ];

  # Partial B38: freestanding perform RETIRE-OFFICIAL (close-path step RETIRE-OFFICIAL).
  # Official just build uses freestanding dual-eq WRITE; StillUsesFreestandingEmit
  # false; DualEqualityBlocks false; RetireRequired false; StillUsesLake true;
  # perform claimed false; DependsOnLake true; CAPABLE-GAP stays closed.
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
  productPathOfficialPathRetireOfficialJustPath = "justfile";
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
  productPathFreestandingPerformClaimedJustPath = "justfile";
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
  productPathFreestandingOwnershipClaimedJustPath = "justfile";
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
  stepContractFullJustPath = "justfile";
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
    "def provablyUnlocked : Bool := false"
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
    "def provablyUnlocked : Bool := true"
  ];
  selfHostCompleteLakefilePath = "src/systems/lakefile.lean";
  selfHostCompleteLakefileTokens = [
    "slake-freestanding-self-host-complete"
    "SystemsLean.SelfHostComplete"
  ];
  selfHostCompleteJustPath = "justfile";
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


  unitTranslationApis = [
    "slake_mult_is_valid"
    "slake_linear_consume"
    "slake_erasure_is_runtime_absent"
    "slake_check_fail_closed"
    "slake_extract_with_checks"
    "slake_typed_ir_id"
    "slake_ir_node_init"
    "slake_ir_node_is_well_typed"
    "slake_ir_node_check_fail_closed"
    "slake_ir_program_id"
    "slake_ir_program_init"
    "slake_ir_program_push"
    "slake_ir_program_is_well_typed"
    "slake_ir_program_check_fail_closed"
    "slake_ir_graph_id"
    "slake_ir_graph_init"
    "slake_ir_graph_push_node"
    "slake_ir_graph_add_edge"
    "slake_ir_graph_is_well_typed"
    "slake_ir_graph_check_fail_closed"
    "slake_host_compose_id"
    "slake_host_compose_init"
    "slake_host_compose_push_node"
    "slake_host_compose_add_edge"
    "slake_host_compose_mint"
    "slake_host_compose_consume"
    "slake_host_compose_mark_erased"
    "slake_host_compose_is_well_typed"
    "slake_host_compose_check_fail_closed"
    "slake_host_compose_extract"
    "slake_emit_plan_id"
    "slake_emit_plan_from_compose"
    "slake_emit_plan_is_ready"
    "slake_emit_apply_id"
    "slake_emit_apply_from_compose"
    "slake_emit_apply_is_valid"
    "slake_emit_body_id"
    "slake_emit_body_from_compose"
    "slake_emit_body_is_valid"
  ];

  emitProductAll = [
    "SLAKE_EMIT_FREESTANDING_C_V0"
    "UNIT_DEEPEN_V1"
    "UNIT_TRANSLATION_V0"
    "MULT-0"
    "MULT-1"
    "MULT-OMEGA"
    "RUNTIME-FS"
    "product residual free"
    "FAIL_CLOSED_CHECKER_V1"
    "CONSUME_TOKEN_HOST_V0"
    "JOIN-ALG"
    "ConsumeToken"
    "LINEAR-EXACT-ONCE"
    "TYPED_IR_V0"
    "IR_PROGRAM_V0"
    "IR_GRAPH_EDGES_V0"
    "HOST_COMPOSE_V0"
    "EMIT_PLAN_V0"
    "EMIT_APPLY_V0"
    "EMIT_BODY_V0"
    "HOST-EMIT-SSOT"
    "HOST-EMIT-BODY"
    "HOST-EMIT-BANNER"
    "HOST-EMIT-MULT"
    "HOST-EMIT-LINEAR"
    "HOST-EMIT-ERASURE"
    "HOST-EMIT-EXTRACT"
    "HOST-EMIT-TYPES"
    "HOST-EMIT-PROGRAM"
    "HOST-EMIT-GRAPH"
    "HOST-EMIT-COMPOSE"
    "HOST-EMIT-PLAN"
    "HOST-EMIT-APPLY"
    "SLAKE_IR_KIND_VALUE"
    "SLAKE_IR_KIND_LINEAR"
    "SLAKE_IR_KIND_ERASED"
    "slake_ir_node"
    "SLAKE_IR_PROGRAM_CAP"
    "slake_ir_program"
    "SLAKE_IR_EDGE_MAX"
    "slake_ir_graph"
    "slake_ir_edge"
    "slake_host_compose"
    "EMIT-BOUNDARY"
    "slake_emit_plan"
    "slake_emit_apply"
    "SLAKE_EMIT_APPLY_CAP"
    "slake_emit_body"
    "SLAKE_EMIT_BODY_CAP"
    "slake_check_bundle"
    "slake_consume_token_mint"
    "slake_consume_token_consume"
    "slake_consume_token_check_fail_closed"
    "slake_consume_token_host_id"
    "slake_consume_token_init"
    "slake_consume_token_is_live"
    "slake_emit_version"
    "slake_type_tag_init"
    "slake_mult_is_known"
    "slake_mult_name"
    "slake_linear_token_consume"
    "slake_erased_mark"
    "slake_extract_product_runtime"
    "slake_type_tag_get"
    "slake_unit_translation_id"
  ]
  ++ unitTranslationApis;

  emitProductNone = [
    "SLAKE_IR_PROGRAM_MAX"
    "SLAKE_IR_EDGE_CAP"
  ];

  releaseAll = emitProductAll;
  releaseNone = emitProductNone;
in
{
  inherit
    emitH
    emitC
    releaseH
    releaseC
    behavioralProbe
    unitTranslationApis
    emitProductAll
    emitProductNone
    releaseAll
    releaseNone
    productOutBbarOwnership
    productOutBbarApis
    productKernelSelfApplyStageId
    productKernelSelfApplyHostId
    productKernelSelfApplySelfHostId
    productKernelSelfApplyModulePath
    productKernelSelfApplyModuleTokens
    productKernelSelfApplyModuleForbiddenTokens
    productOutKernelStageId
    productOutKernelHostId
    productOutKernelSelfHostId
    productOutKernelModulePath
    productOutKernelModuleTokens
    productOutKernelModuleForbiddenTokens
    productPathBootstrapStageId
    productPathBootstrapHostId
    productPathBootstrapSelfHostId
    productPathBootstrapWriterPath
    freestandingEmitLoadPath
    freestandingEmitLoadScaffoldPath
    productPathBootstrapWriterTokens
    productPathBootstrapWriterLoadTokens
    productPathBootstrapAcceptanceTokens
    productPathBootstrapModulePath
    productPathBootstrapModuleTokens
    productPathBootstrapModuleForbiddenTokens
    productWriterSurfaceStageId
    productWriterSurfaceHostId
    productWriterSurfaceSelfHostId
    productWriterSurfaceOwnership
    productWriterSurfaceApis
    productWriterSurfaceAcceptanceTokens
    productWriterSurfaceModulePath
    productWriterSurfaceModuleTokens
    productWriterSurfaceModuleForbiddenTokens
    productWriterPathPlanStageId
    productWriterPathPlanHostId
    productWriterPathPlanSelfHostId
    productWriterPathPlanStepTokens
    productWriterPathPlanAcceptanceTokens
    productWriterPathPlanModulePath
    productWriterPathPlanModuleTokens
    productWriterPathPlanModuleForbiddenTokens
    productWriterPathExecutionStageId
    productWriterPathExecutionHostId
    productWriterPathExecutionSelfHostId
    productWriterPathExecutionWriterTokens
    productWriterPathExecutionLoadTokens
    productWriterPathExecutionLoadScaffoldTokens
    productWriterPathExecutionInstallPath
    productWriterPathExecutionInstallTokens
    productWriterPathExecutionAcceptanceTokens
    productWriterPathExecModulePath
    productWriterPathExecModuleTokens
    productWriterPathExecModuleForbiddenTokens
    productPathOwnershipStageId
    productPathOwnershipHostId
    productPathOwnershipSelfHostId
    productPathOwnershipSsotPaths
    productPathOwnershipEmitPaths
    productPathOwnershipAcceptanceTokens
    productPathOwnershipInputsModulePath
    productPathOwnershipInputsModuleTokens
    productPathOwnershipInputsModuleForbiddenTokens
    productPathPerformStageId
    productPathPerformHostId
    productPathPerformSelfHostId
    productPathPerformLakeWriterPath
    productPathPerformLakeWriterTokens
    productPathPerformLakeLoadTokens
    productPathPerformLakeLoadPath
    productPathPerformInstallPath
    productPathPerformInstallTokens
    productPathPerformAcceptanceTokens
    productPathPerformModulePath
    productPathPerformModuleTokens
    productPathPerformModuleForbiddenTokens
    productPathPerformStepStageId
    productPathPerformStepHostId
    productPathPerformStepSelfHostId
    productPathPerformStepInstallPath
    productPathPerformStepInstallTokens
    productPathPerformStepInstallForbiddenCmdPrefixes
    productPathPerformStepAcceptanceTokens
    productPathPerformStepModulePath
    productPathPerformStepModuleTokens
    productPathPerformStepModuleForbiddenTokens
    productPathPerformReadStageId
    productPathPerformReadHostId
    productPathPerformReadSelfHostId
    productPathPerformReadModulePath
    productPathPerformReadModuleTokens
    productPathPerformReadModuleForbiddenTokens
    productPathPerformReadLakefilePath
    productPathPerformReadLakefileTokens
    productPathPerformReadJustPath
    productPathPerformReadJustTokens
    productPathPerformReadAcceptanceTokens
    productPathPerformComposeStageId
    productPathPerformComposeHostId
    productPathPerformComposeSelfHostId
    productPathPerformComposeModulePath
    productPathPerformComposeModuleTokens
    productPathPerformComposeModuleForbiddenTokens
    productPathPerformComposeLakefilePath
    productPathPerformComposeLakefileTokens
    productPathPerformComposeJustPath
    productPathPerformComposeJustTokens
    productPathPerformComposeAcceptanceTokens
    productPathPerformWriteHcStageId
    productPathPerformWriteHcHostId
    productPathPerformWriteHcSelfHostId
    productPathPerformWriteHcModulePath
    productPathPerformWriteHcModuleTokens
    productPathPerformWriteHcModuleForbiddenTokens
    productPathPerformWriteHcLakefilePath
    productPathPerformWriteHcLakefileTokens
    productPathPerformWriteHcJustPath
    productPathPerformWriteHcJustTokens
    productPathPerformWriteHcAcceptanceTokens
    productPathFreestandingCapableStageId
    productPathFreestandingCapableHostId
    productPathFreestandingCapableSelfHostId
    productPathFreestandingCapableModulePath
    productPathFreestandingCapableModuleTokens
    productPathFreestandingCapableModuleForbiddenTokens
    productPathFreestandingCapableLakefilePath
    productPathFreestandingCapableLakefileTokens
    productPathFreestandingCapableJustPath
    productPathFreestandingCapableJustTokens
    productPathFreestandingCapableAcceptanceTokens
    productPathFreestandingCapableStepContractStageId
    productPathFreestandingCapableStepContractHostId
    productPathFreestandingCapableStepContractSelfHostId
    productPathFreestandingCapableStepContractModulePath
    productPathFreestandingCapableStepContractModuleTokens
    productPathFreestandingCapableStepContractModuleForbiddenTokens
    productPathFreestandingCapableStepContractLakefilePath
    productPathFreestandingCapableStepContractLakefileTokens
    productPathFreestandingCapableStepContractJustPath
    productPathFreestandingCapableStepContractJustTokens
    productPathFreestandingCapableStepContractAcceptanceTokens
    productPathFreestandingCapableReadStageId
    productPathFreestandingCapableReadHostId
    productPathFreestandingCapableReadSelfHostId
    productPathFreestandingCapableReadModulePath
    productPathFreestandingCapableReadModuleTokens
    productPathFreestandingCapableReadModuleForbiddenTokens
    productPathFreestandingCapableReadLakefilePath
    productPathFreestandingCapableReadLakefileTokens
    productPathFreestandingCapableReadJustPath
    productPathFreestandingCapableReadJustTokens
    productPathFreestandingCapableReadAcceptanceTokens
    productPathFreestandingCapableComposeStageId
    productPathFreestandingCapableComposeHostId
    productPathFreestandingCapableComposeSelfHostId
    productPathFreestandingCapableComposeModulePath
    productPathFreestandingCapableComposeModuleTokens
    productPathFreestandingCapableComposeModuleForbiddenTokens
    productPathFreestandingCapableComposeLakefilePath
    productPathFreestandingCapableComposeLakefileTokens
    productPathFreestandingCapableComposeJustPath
    productPathFreestandingCapableComposeJustTokens
    productPathFreestandingCapableComposeAcceptanceTokens
    productPathFreestandingCapableWriteHcStageId
    productPathFreestandingCapableWriteHcHostId
    productPathFreestandingCapableWriteHcSelfHostId
    productPathFreestandingCapableWriteHcModulePath
    productPathFreestandingCapableWriteHcLoadPath
    productPathFreestandingCapableWriteHcModuleTokens
    productPathFreestandingCapableWriteHcLoadTokens
    productPathFreestandingCapableWriteHcModuleForbiddenTokens
    productPathFreestandingCapableWriteHcLakefilePath
    productPathFreestandingCapableWriteHcLakefileTokens
    productPathFreestandingCapableWriteHcJustPath
    productPathFreestandingCapableWriteHcJustTokens
    productPathFreestandingCapableWriteHcAcceptanceTokens
    productPathFreestandingCapableRegenerateStageId
    productPathFreestandingCapableRegenerateHostId
    productPathFreestandingCapableRegenerateSelfHostId
    productPathFreestandingCapableRegenerateModulePath
    productPathFreestandingCapableRegenerateModuleTokens
    productPathFreestandingCapableRegenerateModuleForbiddenTokens
    productPathFreestandingCapableRegenerateLakefilePath
    productPathFreestandingCapableRegenerateLakefileTokens
    productPathFreestandingCapableRegenerateJustPath
    productPathFreestandingCapableRegenerateJustTokens
    productPathFreestandingCapableRegenerateAcceptanceTokens
    productPathFreestandingCapableInstallOutStageId
    productPathFreestandingCapableInstallOutHostId
    productPathFreestandingCapableInstallOutSelfHostId
    productPathFreestandingCapableInstallOutModulePath
    productPathFreestandingCapableInstallOutModuleTokens
    productPathFreestandingCapableInstallOutModuleForbiddenTokens
    productPathFreestandingCapableInstallOutLakefilePath
    productPathFreestandingCapableInstallOutLakefileTokens
    productPathFreestandingCapableInstallOutJustPath
    productPathFreestandingCapableInstallOutJustTokens
    productPathFreestandingCapableInstallOutAcceptanceTokens
    productPathFreestandingCapableFullBarStageId
    productPathFreestandingCapableFullBarHostId
    productPathFreestandingCapableFullBarSelfHostId
    productPathFreestandingCapableFullBarModulePath
    productPathFreestandingCapableFullBarModuleTokens
    productPathFreestandingCapableFullBarModuleForbiddenTokens
    productPathFreestandingCapableFullBarLakefilePath
    productPathFreestandingCapableFullBarLakefileTokens
    productPathFreestandingCapableFullBarJustPath
    productPathFreestandingCapableFullBarJustTokens
    productPathFreestandingCapableFullBarAcceptanceTokens
    productPathOwnershipRegenerateStageId
    productPathOwnershipRegenerateHostId
    productPathOwnershipRegenerateSelfHostId
    productPathOwnershipRegenerateModulePath
    productPathOwnershipRegenerateModuleTokens
    productPathOwnershipRegenerateModuleForbiddenTokens
    productPathOwnershipRegenerateLakefilePath
    productPathOwnershipRegenerateLakefileTokens
    productPathOwnershipRegenerateJustPath
    productPathOwnershipRegenerateJustTokens
    productPathOwnershipRegenerateAcceptanceTokens
    productPathFreestandingPerformEvidenceStageId
    productPathFreestandingPerformEvidenceHostId
    productPathFreestandingPerformEvidenceSelfHostId
    productPathFreestandingPerformEvidenceModulePath
    productPathFreestandingPerformEvidenceModuleTokens
    productPathFreestandingPerformEvidenceModuleForbiddenTokens
    productPathFreestandingPerformEvidenceLakefilePath
    productPathFreestandingPerformEvidenceLakefileTokens
    productPathFreestandingPerformEvidenceJustPath
    productPathFreestandingPerformEvidenceJustTokens
    productPathFreestandingPerformEvidenceAcceptanceTokens
    productPathFreestandingPerformOfficialPathStageId
    productPathFreestandingPerformOfficialPathHostId
    productPathFreestandingPerformOfficialPathSelfHostId
    productPathFreestandingPerformOfficialPathModulePath
    productPathFreestandingPerformOfficialPathModuleTokens
    productPathFreestandingPerformOfficialPathModuleForbiddenTokens
    productPathFreestandingPerformOfficialPathLakefilePath
    productPathFreestandingPerformOfficialPathLakefileTokens
    productPathFreestandingPerformOfficialPathJustPath
    productPathFreestandingPerformOfficialPathJustTokens
    productPathFreestandingPerformOfficialPathAcceptanceTokens
    productPathFreestandingPerformOfficialPathAlternateStageId
    productPathFreestandingPerformOfficialPathAlternateHostId
    productPathFreestandingPerformOfficialPathAlternateSelfHostId
    productPathFreestandingPerformOfficialPathAlternateModulePath
    productPathFreestandingPerformOfficialPathAlternateModuleTokens
    productPathFreestandingPerformOfficialPathAlternateModuleForbiddenTokens
    productPathFreestandingPerformOfficialPathAlternateLakefilePath
    productPathFreestandingPerformOfficialPathAlternateLakefileTokens
    productPathFreestandingPerformOfficialPathAlternateJustPath
    productPathFreestandingPerformOfficialPathAlternateJustTokens
    productPathFreestandingPerformOfficialPathAlternateAcceptanceTokens
    productPathFreestandingPerformDualEqualityWriteParityStageId
    productPathFreestandingPerformDualEqualityWriteParityHostId
    productPathFreestandingPerformDualEqualityWriteParitySelfHostId
    productPathFreestandingPerformDualEqualityWriteParityModulePath
    productPathFreestandingPerformDualEqualityWriteParityModuleTokens
    productPathFreestandingPerformDualEqualityWriteParityModuleForbiddenTokens
    productPathFreestandingPerformDualEqualityWriteParityLakefilePath
    productPathFreestandingPerformDualEqualityWriteParityLakefileTokens
    productPathFreestandingPerformDualEqualityWriteParityJustPath
    productPathFreestandingPerformDualEqualityWriteParityJustTokens
    productPathFreestandingPerformDualEqualityWriteParityAcceptanceTokens
    productPathFreestandingPerformDualEqualityWriteClosePathStageId
    productPathFreestandingPerformDualEqualityWriteClosePathHostId
    productPathFreestandingPerformDualEqualityWriteClosePathSelfHostId
    productPathFreestandingPerformDualEqualityWriteClosePathModulePath
    productPathFreestandingPerformDualEqualityWriteClosePathModuleTokens
    productPathFreestandingPerformDualEqualityWriteClosePathModuleForbiddenTokens
    productPathFreestandingPerformDualEqualityWriteClosePathLakefilePath
    productPathFreestandingPerformDualEqualityWriteClosePathLakefileTokens
    productPathFreestandingPerformDualEqualityWriteClosePathJustPath
    productPathFreestandingPerformDualEqualityWriteClosePathJustTokens
    productPathFreestandingPerformDualEqualityWriteClosePathAcceptanceTokens
    productPathFreestandingPerformDualEqualityWriteApiStageId
    productPathFreestandingPerformDualEqualityWriteApiHostId
    productPathFreestandingPerformDualEqualityWriteApiSelfHostId
    productPathFreestandingPerformDualEqualityWriteApiModulePath
    productPathFreestandingPerformDualEqualityWriteApiLoadPath
    productPathFreestandingPerformDualEqualityWriteApiModuleTokens
    productPathFreestandingPerformDualEqualityWriteApiLoadTokens
    productPathFreestandingPerformDualEqualityWriteApiModuleForbiddenTokens
    productPathFreestandingPerformDualEqualityWriteApiLakefilePath
    productPathFreestandingPerformDualEqualityWriteApiLakefileTokens
    productPathFreestandingPerformDualEqualityWriteApiJustPath
    productPathFreestandingPerformDualEqualityWriteApiJustTokens
    productPathFreestandingPerformDualEqualityWriteApiAcceptanceTokens
    productPathFreestandingPerformDualEqualityWriteCapableGapStageId
    productPathFreestandingPerformDualEqualityWriteCapableGapHostId
    productPathFreestandingPerformDualEqualityWriteCapableGapSelfHostId
    productPathFreestandingPerformDualEqualityWriteCapableGapModulePath
    productPathFreestandingPerformDualEqualityWriteCapableGapModuleTokens
    productPathFreestandingPerformDualEqualityWriteCapableGapModuleForbiddenTokens
    productPathFreestandingPerformDualEqualityWriteCapableGapLakefilePath
    productPathFreestandingPerformDualEqualityWriteCapableGapLakefileTokens
    productPathFreestandingPerformDualEqualityWriteCapableGapJustPath
    productPathFreestandingPerformDualEqualityWriteCapableGapJustTokens
    productPathFreestandingPerformDualEqualityWriteCapableGapAcceptanceTokens
    productPathOfficialPathRetireOfficialStageId
    productPathOfficialPathRetireOfficialHostId
    productPathOfficialPathRetireOfficialSelfHostId
    productPathOfficialPathRetireOfficialModulePath
    productPathOfficialPathRetireOfficialModuleTokens
    productPathOfficialPathRetireOfficialModuleForbiddenTokens
    productPathOfficialPathRetireOfficialLakefilePath
    productPathOfficialPathRetireOfficialLakefileTokens
    productPathOfficialPathRetireOfficialJustPath
    productPathOfficialPathRetireOfficialJustTokens
    productPathOfficialPathRetireOfficialAcceptanceTokens
    productPathFreestandingPerformClaimedStageId
    productPathFreestandingPerformClaimedHostId
    productPathFreestandingPerformClaimedSelfHostId
    productPathFreestandingPerformClaimedModulePath
    productPathFreestandingPerformClaimedModuleTokens
    productPathFreestandingPerformClaimedModuleForbiddenTokens
    productPathFreestandingPerformClaimedLakefilePath
    productPathFreestandingPerformClaimedLakefileTokens
    productPathFreestandingPerformClaimedJustPath
    productPathFreestandingPerformClaimedJustTokens
    productPathFreestandingPerformClaimedAcceptanceTokens
    productPathFreestandingOwnershipClaimedStageId
    productPathFreestandingOwnershipClaimedHostId
    productPathFreestandingOwnershipClaimedSelfHostId
    productPathFreestandingOwnershipClaimedModulePath
    productPathFreestandingOwnershipClaimedModuleTokens
    productPathFreestandingOwnershipClaimedModuleForbiddenTokens
    productPathFreestandingOwnershipClaimedLakefilePath
    productPathFreestandingOwnershipClaimedLakefileTokens
    productPathFreestandingOwnershipClaimedJustPath
    productPathFreestandingOwnershipClaimedJustTokens
    productPathFreestandingOwnershipClaimedAcceptanceTokens
    stepContractFullStageId
    stepContractFullHostId
    stepContractFullSelfHostId
    stepContractFullModulePath
    stepContractFullModuleTokens
    stepContractFullModuleForbiddenTokens
    stepContractFullLakefilePath
    stepContractFullLakefileTokens
    stepContractFullJustPath
    stepContractFullJustTokens
    stepContractFullAcceptanceTokens
    selfHostCompleteStageId
    selfHostCompleteHostId
    selfHostCompleteSelfHostId
    selfHostCompleteModulePath
    selfHostCompleteModuleTokens
    selfHostCompleteModuleForbiddenTokens
    selfHostCompleteLakefilePath
    selfHostCompleteLakefileTokens
    selfHostCompleteJustPath
    selfHostCompleteJustTokens
    selfHostCompleteAcceptanceTokens
    ;

  # Wave B: build + just build live in justfile (scripts deleted).
  # Wave C: Lean FreestandingEmit owns product wire write; bash emit deleted.
  # Compile-path shell stamp deleted: static presence is pure Nix (unit walk +
  # systems-host HOST-COMPILE-PATH / SLAKE_COMPILE_PATH_V1). Stage id
  # SLAKE_COMPILE_PATH_V0 remains greppable in justfile as retired-shell honesty.
  requiredDriverAndEmit = [
    "justfile"
    "src/systems/SystemsLean/CompilePath.lean"
    "src/systems/SystemsLean/FreestandingEmit.lean"
    # SSOT load helpers peel (Body + Banner; Mult..Apply on Scaffold).
    "src/systems/SystemsLean/FreestandingEmitLoad.lean"
    "src/systems/SystemsLean/FreestandingEmitLoadScaffold.lean"
    # Thin Lake root for slake-emit-freestanding-c (critical path for just build).
    "src/systems/SystemsLean/FreestandingEmitMain.lean"
    "src/systems/lakefile.lean"
    "src/systems/emit/template_slake_freestanding.h.in"
    "src/systems/emit/template_slake_freestanding.c.in"
    emitH
    emitC
    behavioralProbe
    # HOST-EMIT-SSOT durable fragment dialect (Lean buildFragment owner).
    "src/systems/emit/host_emit_body_fragment.ssot.txt"
    # HOST-EMIT-BANNER durable banner / version product text (Lean EmitBanner owner).
    "src/systems/emit/host_emit_banner.ssot.txt"
    # HOST-EMIT-MULT durable Mult product text (Lean EmitMult owner).
    "src/systems/emit/host_emit_mult.ssot.txt"
    # HOST-EMIT-LINEAR durable Linear product text (Lean EmitLinear owner).
    "src/systems/emit/host_emit_linear.ssot.txt"
    # HOST-EMIT-ERASURE durable Erasure product text (Lean EmitErasure owner).
    "src/systems/emit/host_emit_erasure.ssot.txt"
    # HOST-EMIT-EXTRACT durable Extract + FAIL_CLOSED product text (Lean EmitExtract owner).
    "src/systems/emit/host_emit_extract.ssot.txt"
    # HOST-EMIT-TYPES durable Types/TYPED_IR product text (Lean EmitTypes owner).
    "src/systems/emit/host_emit_types.ssot.txt"
    # HOST-EMIT-PROGRAM durable IR program product text (Lean EmitProgram owner).
    "src/systems/emit/host_emit_program.ssot.txt"
    # HOST-EMIT-GRAPH durable IR graph product text (Lean EmitGraph owner).
    "src/systems/emit/host_emit_graph.ssot.txt"
    # HOST-EMIT-COMPOSE durable host compose product text (Lean EmitCompose owner).
    "src/systems/emit/host_emit_compose.ssot.txt"
    # HOST-EMIT-PLAN durable emit plan product text (Lean EmitPlan owner).
    "src/systems/emit/host_emit_plan.ssot.txt"
    # HOST-EMIT-APPLY durable emit apply product text (Lean EmitApply owner).
    "src/systems/emit/host_emit_apply.ssot.txt"
  ];

  optionalFiles = [
    releaseH
    releaseC
  ];

  # Drivers + emit product wire content.
  contentSpecs = [
    {
      # Host-informed compile path (replaces retired shell stamp).
      rel = "src/systems/SystemsLean/CompilePath.lean";
      all = [
        "SLAKE_COMPILE_PATH_V1"
        "HOST-COMPILE-PATH"
        "SYSTEMS_LEAN_HOST"
        "not product C"
      ];
    }
    {
      # Wave B/C: just build owns product wire process glue;
      # Lean FreestandingEmit / freestanding-capable path is the emit writer.
      # SLAKE_COMPILE_PATH_V0 = retired shell stamp honesty (no script path).
      rel = "justfile";
      all = [
        "SLAKE_COMPILE_PATH_V0"
        "SLAKE_COMPILE_PATH_V1"
        "HOST-COMPILE-PATH"
        "systems-emit-wire"
        "slake-emit"
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "FreestandingEmit"
        "product residual free"
        "not PROVABLY"
      ];
    }
    {
      # Lake root for slake-emit-freestanding-c after main split (B13 supporting).
      rel = "src/systems/lakefile.lean";
      all = [
        "slake-emit-freestanding-c"
        "SystemsLean.FreestandingEmitMain"
      ];
    }
    {
      # Thin main forwards to FreestandingEmit; pure-eval file presence for lake root.
      rel = "src/systems/SystemsLean/FreestandingEmitMain.lean";
      all = [
        "FreestandingEmitMain"
        "FreestandingEmit.main"
        "slake-emit-freestanding-c"
        "SLAKE_EMIT_FREESTANDING_C_V0"
      ];
    }
    {
      rel = "src/systems/SystemsLean/FreestandingEmit.lean";
      all = [
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "product residual free"
        "no product GC"
        "HOST-EMIT-SSOT"
        "HOST-EMIT-BODY"
        "HOST-EMIT-BANNER"
        "HOST-EMIT-MULT"
        "HOST-EMIT-LINEAR"
        "HOST-EMIT-ERASURE"
        "HOST-EMIT-EXTRACT"
        "EmitExtractScaffold"
        "import SystemsLean.EmitExtractScaffold"
        "extractHeaderFragment"
        "HOST-EMIT-TYPES"
        "EmitTypesScaffold"
        "import SystemsLean.EmitTypesScaffold"
        "typesHeaderFragment"
        "HOST-EMIT-PROGRAM"
        "EmitProgramScaffold"
        "import SystemsLean.EmitProgramScaffold"
        "programHeaderFragment"
        "HOST-EMIT-GRAPH"
        "EmitGraphScaffold"
        "import SystemsLean.EmitGraphScaffold"
        "graphHeaderFragment"
        "HOST-EMIT-COMPOSE"
        "EmitComposeScaffold"
        "import SystemsLean.EmitComposeScaffold"
        "composeHeaderFragment"
        "HOST-EMIT-PLAN"
        "HOST-EMIT-APPLY"
        "planHeaderFragment"
        "EmitPlanScaffold"
        "import SystemsLean.EmitPlanScaffold"
        "applyHeaderFragment"
        "EmitApplyScaffold"
        "import SystemsLean.EmitApplyScaffold"
        # Dual SSOT equality gate (emit-time fail-closed; live pin).
        "DUAL-SSOT-EQUALITY"
        "dualSsotBlockEqual"
        "requireDualSsotEqual"
        "dualSsotEqualityLive"
        "bannerHeaderFragment"
        "multHeaderFragment"
        "bodyHeaderFragment"
        "EmitBodyScaffold"
        "import SystemsLean.EmitBodyScaffold"
        "host_emit_body_fragment.ssot.txt"
        "host_emit_banner.ssot.txt"
        "host_emit_mult.ssot.txt"
        "host_emit_linear.ssot.txt"
        "host_emit_erasure.ssot.txt"
        "host_emit_extract.ssot.txt"
        "host_emit_types.ssot.txt"
        "host_emit_program.ssot.txt"
        "host_emit_graph.ssot.txt"
        "host_emit_compose.ssot.txt"
        "host_emit_plan.ssot.txt"
        "host_emit_apply.ssot.txt"
        "template_slake_freestanding"
        "BODY_C_HEADER"
        "BODY_C_BODY"
        "BANNER_C_HEADER"
        "BANNER_C_BODY"
        "FreestandingEmitLoad"
        "FreestandingEmitLoadScaffold"
        "def renderHeader"
        "def emitAtRoot"
      ];
    }
    {
      # SSOT load peel: Body + Banner + Dual SSOT helpers.
      rel = "src/systems/SystemsLean/FreestandingEmitLoad.lean";
      all = [
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "FreestandingEmitLoad"
        "FreestandingEmitLoadScaffold"
        "def stageId : String := \"SLAKE_EMIT_FREESTANDING_C_V0\""
        "def loadBodySsot"
        "def loadBannerSsot"
        "def requireDualSsotEqual"
        "dualSsotBlockEqual"
        "dualSsotEqualityLive"
        "DUAL-SSOT-EQUALITY"
        "BODY_C_HEADER"
        "BODY_C_BODY"
        "BANNER_C_HEADER"
        "BANNER_C_BODY"
        "HOST-EMIT-SSOT"
        "HOST-EMIT-BODY"
        "HOST-EMIT-BANNER"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # Mult..Apply unit SSOT loaders peel (same namespace FreestandingEmit).
      rel = "src/systems/SystemsLean/FreestandingEmitLoadScaffold.lean";
      all = [
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "FreestandingEmitLoadScaffold"
        "SystemsLean.FreestandingEmitLoadScaffold"
        "def loadMultSsot"
        "def loadPlanSsot"
        "def loadApplySsot"
        "HOST-EMIT-MULT"
        "HOST-EMIT-LINEAR"
        "HOST-EMIT-PLAN"
        "HOST-EMIT-APPLY"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitBannerScaffold: HOST-EMIT-BANNER scaffolding split (same namespace EmitBanner).
      rel = "src/systems/SystemsLean/EmitBannerScaffold.lean";
      all = [
        "EmitBannerScaffold"
        "HOST-EMIT-BANNER"
        "SELF-HOST-EMIT-BANNER"
        "SLAKE_SELF_HOST_EMIT_BANNER_V0"
        "def bannerHeaderFragment : String :="
        "def bannerBodyFragment : String :="
        "def emitBannerReady : Bool :="
        "ssotArtifactPath"
        "host_emit_banner.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitMultScaffold: HOST-EMIT-MULT scaffolding split (same namespace EmitMult).
      rel = "src/systems/SystemsLean/EmitMultScaffold.lean";
      all = [
        "EmitMultScaffold"
        "HOST-EMIT-MULT"
        "SELF-HOST-EMIT-MULT"
        "SLAKE_SELF_HOST_EMIT_MULT_V0"
        "def multHeaderFragment : String :="
        "def multBodyFragment : String :="
        "def emitMultReady : Bool :="
        "ssotArtifactPath"
        "host_emit_mult.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitLinearScaffold: HOST-EMIT-LINEAR scaffolding peel (same namespace EmitLinear).
      rel = "src/systems/SystemsLean/EmitLinearScaffold.lean";
      all = [
        "EmitLinearScaffold"
        "HOST-EMIT-LINEAR"
        "SELF-HOST-EMIT-LINEAR"
        "SLAKE_SELF_HOST_EMIT_LINEAR_V0"
        "def linearHeaderFragment : String :="
        "def linearBodyFragment : String :="
        "def emitLinearReady : Bool :="
        "ssotArtifactPath"
        "host_emit_linear.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitErasureScaffold: HOST-EMIT-ERASURE scaffolding split (same namespace EmitErasure).
      rel = "src/systems/SystemsLean/EmitErasureScaffold.lean";
      all = [
        "EmitErasureScaffold"
        "HOST-EMIT-ERASURE"
        "SELF-HOST-EMIT-ERASURE"
        "SLAKE_SELF_HOST_EMIT_ERASURE_V0"
        "def erasureHeaderFragment : String :="
        "def erasureBodyFragment : String :="
        "def emitErasureReady : Bool :="
        "ssotArtifactPath"
        "host_emit_erasure.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitExtractScaffold: HOST-EMIT-EXTRACT scaffolding peel (same namespace EmitExtract).
      rel = "src/systems/SystemsLean/EmitExtractScaffold.lean";
      all = [
        "EmitExtractScaffold"
        "HOST-EMIT-EXTRACT"
        "SELF-HOST-EMIT-EXTRACT"
        "SLAKE_SELF_HOST_EMIT_EXTRACT_V0"
        "def extractHeaderFragment : String :="
        "def extractBodyFragment : String :="
        "def emitExtractReady : Bool :="
        "ssotArtifactPath"
        "host_emit_extract.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitTypesScaffold: HOST-EMIT-TYPES scaffolding peel (same namespace EmitTypes).
      rel = "src/systems/SystemsLean/EmitTypesScaffold.lean";
      all = [
        "EmitTypesScaffold"
        "HOST-EMIT-TYPES"
        "SELF-HOST-EMIT-TYPES"
        "SLAKE_SELF_HOST_EMIT_TYPES_V0"
        "def typesHeaderFragment : String :="
        "def typesBodyFragment : String :="
        "def emitTypesReady : Bool :="
        "ssotArtifactPath"
        "host_emit_types.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitProgramScaffold: HOST-EMIT-PROGRAM scaffolding peel (same namespace EmitProgram).
      rel = "src/systems/SystemsLean/EmitProgramScaffold.lean";
      all = [
        "EmitProgramScaffold"
        "HOST-EMIT-PROGRAM"
        "SELF-HOST-EMIT-PROGRAM"
        "SLAKE_SELF_HOST_EMIT_PROGRAM_V0"
        "def programHeaderFragment : String :="
        "def programBodyFragment : String :="
        "def emitProgramReady : Bool :="
        "ssotArtifactPath"
        "host_emit_program.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitGraphScaffold: HOST-EMIT-GRAPH scaffolding peel (same namespace EmitGraph).
      rel = "src/systems/SystemsLean/EmitGraphScaffold.lean";
      all = [
        "EmitGraphScaffold"
        "HOST-EMIT-GRAPH"
        "SELF-HOST-EMIT-GRAPH"
        "SLAKE_SELF_HOST_EMIT_GRAPH_V0"
        "def graphHeaderFragment : String :="
        "def graphBodyFragment : String :="
        "def emitGraphReady : Bool :="
        "ssotArtifactPath"
        "host_emit_graph.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitComposeScaffold: HOST-EMIT-COMPOSE scaffolding peel (same namespace EmitCompose).
      rel = "src/systems/SystemsLean/EmitComposeScaffold.lean";
      all = [
        "EmitComposeScaffold"
        "HOST-EMIT-COMPOSE"
        "SELF-HOST-EMIT-COMPOSE"
        "SLAKE_SELF_HOST_EMIT_COMPOSE_V0"
        "def composeHeaderFragment : String :="
        "def composeBodyFragment : String :="
        "def emitComposeReady : Bool :="
        "ssotArtifactPath"
        "host_emit_compose.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitPlanScaffold: HOST-EMIT-PLAN scaffolding peel (same namespace EmitPlan).
      rel = "src/systems/SystemsLean/EmitPlanScaffold.lean";
      all = [
        "EmitPlanScaffold"
        "HOST-EMIT-PLAN"
        "SELF-HOST-EMIT-PLAN"
        "SLAKE_SELF_HOST_EMIT_PLAN_V0"
        "def planHeaderFragment : String :="
        "def planBodyFragment : String :="
        "def emitPlanReady : Bool :="
        "planSsotArtifactPath"
        "host_emit_plan.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitApplyScaffold: HOST-EMIT-APPLY scaffolding peel (same namespace EmitApply).
      rel = "src/systems/SystemsLean/EmitApplyScaffold.lean";
      all = [
        "EmitApplyScaffold"
        "HOST-EMIT-APPLY"
        "SELF-HOST-EMIT-APPLY"
        "SLAKE_SELF_HOST_EMIT_APPLY_V0"
        "def applyHeaderFragment : String :="
        "def applyBodyFragment : String :="
        "def emitApplyReady : Bool :="
        "applySsotArtifactPath"
        "host_emit_apply.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitBodyScaffold: HOST-EMIT-BODY scaffolding peel (same namespace EmitBody).
      rel = "src/systems/SystemsLean/EmitBodyScaffold.lean";
      all = [
        "EmitBodyScaffold"
        "HOST-EMIT-BODY"
        "SELF-HOST-EMIT-BODY"
        "SLAKE_SELF_HOST_EMIT_BODY_V0"
        "def bodyHeaderFragment : String :="
        "def bodyBodyFragment : String :="
        "def emitBodyReady : Bool :="
        "bodySsotArtifactPath"
        "host_emit_body_fragment.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # Thin template shell: SPDX + stage cite + placeholders (banner SSOT-owned).
      rel = "src/systems/emit/template_slake_freestanding.h.in";
      all = [
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "__HOST_EMIT_BANNER_HEADER__"
        "__HOST_EMIT_MULT_HEADER__"
        "__HOST_EMIT_LINEAR_HEADER__"
        "__HOST_EMIT_ERASURE_HEADER__"
        "__HOST_EMIT_EXTRACT_HEADER__"
        "__HOST_EMIT_TYPES_HEADER__"
        "__HOST_EMIT_PROGRAM_HEADER__"
        "__HOST_EMIT_GRAPH_HEADER__"
        "__HOST_EMIT_COMPOSE_HEADER__"
        "__HOST_EMIT_PLAN_HEADER__"
        "__HOST_EMIT_APPLY_HEADER__"
        "__HOST_EMIT_BODY_HEADER__"
      ];
    }
    {
      # Thin template shell: SPDX + stage cite + placeholders (banner SSOT-owned).
      rel = "src/systems/emit/template_slake_freestanding.c.in";
      all = [
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "__HOST_EMIT_BANNER_BODY__"
        "__HOST_EMIT_MULT_BODY__"
        "__HOST_EMIT_LINEAR_BODY__"
        "__HOST_EMIT_ERASURE_BODY__"
        "__HOST_EMIT_EXTRACT_BODY__"
        "__HOST_EMIT_TYPES_BODY__"
        "__HOST_EMIT_PROGRAM_BODY__"
        "__HOST_EMIT_GRAPH_BODY__"
        "__HOST_EMIT_COMPOSE_BODY__"
        "__HOST_EMIT_PLAN_BODY__"
        "__HOST_EMIT_APPLY_BODY__"
        "__HOST_EMIT_BODY_BODY__"
      ];
    }
    {
      # HOST-EMIT-SSOT + HOST-EMIT-BODY: dialect keys + body scaffolding for EMIT_BODY_V0.
      rel = "src/systems/emit/host_emit_body_fragment.ssot.txt";
      all = [
        "HOST-EMIT-SSOT"
        "HOST-EMIT-BODY"
        "SELF-HOST-EMIT-BODY"
        "SLAKE_SELF_HOST_EMIT_BODY_V0"
        "EMPTY_FRAGMENT"
        "HEADER_OPEN"
        "/* EMIT_BODY_V0 RUNTIME-FS r=0 e=0 */"
        "NON-SSOT"
        "BODY_C_HEADER_BEGIN"
        "BODY_C_BODY_BEGIN"
        "slake_emit_body_put_char"
        "slake_emit_body_put_u8"
        "slake_emit_body_from_compose"
        "SLAKE_EMIT_BODY_CAP"
      ];
    }
    {
      # HOST-EMIT-BANNER: banner / version / unit_translation owned by Lean EmitBanner.
      rel = "src/systems/emit/host_emit_banner.ssot.txt";
      all = [
        "HOST-EMIT-BANNER"
        "NON-SSOT"
        "SELF-HOST-EMIT-BANNER"
        "SLAKE_SELF_HOST_EMIT_BANNER_V0"
        "slake_emit_version"
        "slake_unit_translation_id"
        "UNIT_TRANSLATION_V0"
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "BANNER_C_HEADER_BEGIN"
        "BANNER_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-MULT: Mult product C text owned by Lean EmitMult (SH2).
      rel = "src/systems/emit/host_emit_mult.ssot.txt";
      all = [
        "HOST-EMIT-MULT"
        "NON-SSOT"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "slake_mult_is_valid"
        "MULT_C_HEADER_BEGIN"
        "MULT_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-LINEAR: Linear product C text owned by Lean EmitLinear.
      rel = "src/systems/emit/host_emit_linear.ssot.txt";
      all = [
        "HOST-EMIT-LINEAR"
        "NON-SSOT"
        "LINEAR-EXACT-ONCE"
        "CONSUME_TOKEN_HOST_V0"
        "JOIN-ALG"
        "slake_linear_consume"
        "slake_consume_token_consume"
        "LINEAR_C_HEADER_BEGIN"
        "LINEAR_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-ERASURE: Erasure product C text owned by Lean EmitErasure.
      rel = "src/systems/emit/host_emit_erasure.ssot.txt";
      all = [
        "HOST-EMIT-ERASURE"
        "NON-SSOT"
        "ERASE-RULE-MULT-0"
        "ERASE-NO-RUNTIME"
        "slake_erased"
        "slake_erased_mark"
        "slake_erasure_is_runtime_absent"
        "ERASURE_C_HEADER_BEGIN"
        "ERASURE_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-EXTRACT: Extract + FAIL_CLOSED product C text owned by Lean EmitExtract.
      rel = "src/systems/emit/host_emit_extract.ssot.txt";
      all = [
        "HOST-EMIT-EXTRACT"
        "NON-SSOT"
        "FAIL_CLOSED_CHECKER_V1"
        "EMIT-BOUNDARY"
        "RUNTIME-FS"
        "slake_extract_status"
        "slake_check_bundle"
        "slake_check_fail_closed"
        "slake_extract_with_checks"
        "EXTRACT_C_HEADER_BEGIN"
        "EXTRACT_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-TYPES: Types/TYPED_IR product C text owned by Lean EmitTypes.
      rel = "src/systems/emit/host_emit_types.ssot.txt";
      all = [
        "HOST-EMIT-TYPES"
        "NON-SSOT"
        "TYPED_IR_V0"
        "COMMON-UNIVERSE"
        "slake_type_tag"
        "slake_ir_node"
        "slake_ir_node_init"
        "slake_ir_node_is_well_typed"
        "TYPES_C_HEADER_BEGIN"
        "TYPES_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-PROGRAM: IR program product C text owned by Lean EmitProgram.
      rel = "src/systems/emit/host_emit_program.ssot.txt";
      all = [
        "HOST-EMIT-PROGRAM"
        "NON-SSOT"
        "IR_PROGRAM_V0"
        "SLAKE_IR_PROGRAM_CAP"
        "slake_ir_program"
        "slake_ir_program_init"
        "slake_ir_program_push"
        "slake_ir_program_is_well_typed"
        "PROGRAM_C_HEADER_BEGIN"
        "PROGRAM_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-GRAPH: IR graph product C text owned by Lean EmitGraph.
      rel = "src/systems/emit/host_emit_graph.ssot.txt";
      all = [
        "HOST-EMIT-GRAPH"
        "NON-SSOT"
        "IR_GRAPH_EDGES_V0"
        "SLAKE_IR_EDGE_MAX"
        "slake_ir_graph"
        "slake_ir_edge"
        "slake_ir_graph_init"
        "slake_ir_graph_push_node"
        "slake_ir_graph_add_edge"
        "slake_ir_graph_is_well_typed"
        "GRAPH_C_HEADER_BEGIN"
        "GRAPH_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-COMPOSE: host compose product C text owned by Lean EmitCompose.
      rel = "src/systems/emit/host_emit_compose.ssot.txt";
      all = [
        "HOST-EMIT-COMPOSE"
        "NON-SSOT"
        "HOST_COMPOSE_V0"
        "slake_host_compose"
        "slake_host_compose_init"
        "slake_host_compose_push_node"
        "slake_host_compose_add_edge"
        "slake_host_compose_mint"
        "slake_host_compose_consume"
        "slake_host_compose_mark_erased"
        "slake_host_compose_is_well_typed"
        "COMPOSE_C_HEADER_BEGIN"
        "COMPOSE_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-PLAN: emit plan product C text owned by Lean EmitPlan.
      rel = "src/systems/emit/host_emit_plan.ssot.txt";
      all = [
        "HOST-EMIT-PLAN"
        "NON-SSOT"
        "EMIT_PLAN_V0"
        "slake_emit_plan"
        "slake_emit_plan_from_compose"
        "slake_emit_plan_is_ready"
        "PLAN_C_HEADER_BEGIN"
        "PLAN_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-APPLY: emit apply product C text owned by Lean EmitApply.
      rel = "src/systems/emit/host_emit_apply.ssot.txt";
      all = [
        "HOST-EMIT-APPLY"
        "NON-SSOT"
        "EMIT_APPLY_V0"
        "SLAKE_EMIT_APPLY_CAP"
        "slake_emit_apply"
        "slake_emit_apply_from_compose"
        "slake_emit_apply_is_valid"
        "APPLY_C_HEADER_BEGIN"
        "APPLY_C_BODY_BEGIN"
      ];
    }
    {
      rel = emitH;
      all = emitProductAll;
      none = emitProductNone;
    }
    {
      rel = emitC;
      all = emitProductAll;
      none = emitProductNone;
    }
    {
      # Smoke debt only -- fail closed if probe stripped; not product wire growth.
      # HOST-PARITY-MULT (SH3): product Mult name / is_known / enum tag parity.
      # HOST-PARITY-LINEAR: product Linear / CONSUME_TOKEN path honesty labels.
      # HOST-PARITY-TYPES: product TYPED_IR / slake_ir_node path honesty labels.
      # HOST-PARITY-PROGRAM: product IR_PROGRAM / IR_GRAPH / HOST_COMPOSE path
      # honesty labels (Mult+Linear+Types+Program freestanding path).
      # HOST-PARITY-EMIT: product EMIT_PLAN / EMIT_APPLY / EMIT_BODY path
      # honesty labels (Mult+Linear+Types+Program+Emit freestanding path).
      rel = behavioralProbe;
      all = [
        "slake_freestanding.h"
        "UNIT_TRANSLATION_V0"
        "UNIT_DEEPEN_V1"
        "slake_emit_body_is_valid"
        "main"
        "HOST-PARITY-MULT"
        "SELF-HOST-PARITY-MULT"
        "SLAKE_SELF_HOST_PARITY_MULT_V0"
        "PARITY-MULT-SMOKE"
        "slake_mult_name"
        "slake_mult_is_known"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "HOST-PARITY-LINEAR"
        "SELF-HOST-PARITY-LINEAR"
        "SLAKE_SELF_HOST_PARITY_LINEAR_V0"
        "PARITY-LINEAR-SMOKE"
        "slake_linear_token_init"
        "slake_linear_consume"
        "slake_consume_token_mint"
        "CONSUME_TOKEN_HOST_V0"
        "HOST-PARITY-TYPES"
        "SELF-HOST-PARITY-TYPES"
        "SLAKE_SELF_HOST_PARITY_TYPES_V0"
        "PARITY-TYPES-SMOKE"
        "TYPED_IR_V0"
        "slake_ir_node"
        "slake_ir_node_init"
        "slake_ir_node_is_well_typed"
        "slake_ir_node_check_fail_closed"
        "HOST-PARITY-PROGRAM"
        "SELF-HOST-PARITY-PROGRAM"
        "SLAKE_SELF_HOST_PARITY_PROGRAM_V0"
        "PARITY-PROGRAM-SMOKE"
        "IR_PROGRAM_V0"
        "IR_GRAPH_EDGES_V0"
        "HOST_COMPOSE_V0"
        "slake_ir_program"
        "slake_ir_graph"
        "slake_host_compose"
        "HOST-PARITY-EMIT"
        "SELF-HOST-PARITY-EMIT"
        "SLAKE_SELF_HOST_PARITY_EMIT_V0"
        "PARITY-EMIT-SMOKE"
        "EMIT_PLAN_V0"
        "EMIT_APPLY_V0"
        "EMIT_BODY_V0"
        "slake_emit_plan"
        "slake_emit_apply"
        "slake_emit_body"
      ];
      none = [
        "SLAKE_EMIT_FREESTANDING_C_V0"
      ];
    }
  ];

  optionalContentSpecs = [
    {
      rel = releaseH;
      all = releaseAll;
      none = releaseNone;
    }
    {
      rel = releaseC;
      all = releaseAll;
      none = releaseNone;
    }
  ];
}
