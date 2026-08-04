# SPDX-License-Identifier: Unlicense
# Host presence token specs slice. Joined via specs.nix. Sub-1-KLOC.
# No bash, no Python.
{
  hostSpecsTipSelfApply2 = [
    {
      # KERNEL-SELF-APPLY theorems + smoke split (same namespace KernelSelfApply).
      rel = "src/systems/SystemsLean/KernelSelfApplyTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "KernelSelfApplyTheorems"
        "SystemsLean.KernelSelfApplyTheorems"
        "import SystemsLean.KernelSelfApply"
        "KERNEL-SELF-APPLY-THEOREM"
        "HOST-KERNEL-SELF-APPLY-THEOREM"
        "KERNEL-SELF-APPLY-SMOKE"
        "HOST-KERNEL-SELF-APPLY-SMOKE"
        "example"
        "productKernelSelfApplyPartialReady_true"
        "theorem productKernelSelfApplyPartialReady_true"
        "SELF-HOST-KERNEL-SELF-APPLY"
        "SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0"
        "HOST-SELF-HOST-KERNEL-SELF-APPLY"
        "productKernelBarSurfaceOk"
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
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # B3 PRODUCT-OUT kernel evidence module (land-time Out path + B-bar API cites).
      # Batch-32 PartialReady bulk + dual-pin thin batch 2 historical stage/path/API
      # string authority. SelfApplyFs tip keeps chain fold only.
      # No living-tip claim true defs on this land-time module.
      # Long-file split: PRODUCT-OUT-THEOREM + SMOKE in ProductOutKernelTheorems
      # (same namespace).
      rel = "src/systems/SystemsLean/ProductOutKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_OUT_V0"
        "HOST-SELF-HOST-PRODUCT-OUT"
        "SELF-HOST-PRODUCT-OUT"
        "productOutKernelBarSurfaceOk"
        "productOutKernelEvidencePartialReady"
        "def productOutKernelEvidencePartialReady : Bool :="
        "PRODUCT-OUT-THEOREM"
        "HOST-PRODUCT-OUT-THEOREM"
        "PRODUCT-OUT-SMOKE"
        "HOST-PRODUCT-OUT-SMOKE"
        "ProductOutKernelTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as ProductPathPerform / ProductPathOwnershipInputs).
        "theorem productOutKernelEvidencePartialReady_true"
        "SystemsLean.ProductOutKernel"
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
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # PRODUCT-OUT theorems + smoke split (same namespace ProductOutKernel).
      rel = "src/systems/SystemsLean/ProductOutKernelTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ProductOutKernelTheorems"
        "SystemsLean.ProductOutKernelTheorems"
        "import SystemsLean.ProductOutKernel"
        "PRODUCT-OUT-THEOREM"
        "HOST-PRODUCT-OUT-THEOREM"
        "PRODUCT-OUT-SMOKE"
        "HOST-PRODUCT-OUT-SMOKE"
        "example"
        "productOutKernelEvidencePartialReady_true"
        "theorem productOutKernelEvidencePartialReady_true"
        "SELF-HOST-PRODUCT-OUT"
        "SLAKE_SELF_HOST_PRODUCT_OUT_V0"
        "HOST-SELF-HOST-PRODUCT-OUT"
        "productOutKernelBarSurfaceOk"
        "productOutPath"
        "productOutApiMult"
        "productOutApiLinear"
        "productOutApiErasure"
        "productOutApiTypes"
        "productOutApiProgram"
        "out/freestanding-c/"
        "slake_mult_is_valid"
        "slake_linear_consume"
        "slake_erasure_is_runtime_absent"
        "slake_type_tag"
        "slake_ir_program"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # B4 BOOTSTRAP honesty module (land-time remains + Lake writer path cites).
      # Batch-31 split: PartialReady bulk authority lives here; SelfApplyFs
      # re-exports chain fold + remains tip honesty. Dual-pin thin batch 3:
      # home owns historical stage/writer-path/module-cite string defs.
      # Long-file split: BOOTSTRAP-THEOREM + SMOKE in
      # BootstrapHonestyTheorems (same namespace).
      # No living-tip claim true defs on this land-time module.
      rel = "src/systems/SystemsLean/BootstrapHonesty.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_BOOTSTRAP_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-BOOTSTRAP"
        "SELF-HOST-PRODUCT-PATH-BOOTSTRAP"
        "productPathBootstrapSurfaceOk"
        "productPathHostLakeBootstrapPartialReady"
        "def productPathHostLakeBootstrapPartialReady : Bool :="
        "def productPathHostLakeBootstrapRemains : Bool := true"
        "BOOTSTRAP-THEOREM"
        "HOST-BOOTSTRAP-THEOREM"
        "BOOTSTRAP-SMOKE"
        "HOST-BOOTSTRAP-SMOKE"
        "BootstrapHonestyTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as ProductPathWriterPathPlan / ProductPathWriterSurface).
        "theorem productPathHostLakeBootstrapPartialReady_true"
        "theorem productPathHostLakeBootstrapRemains_true"
        "SystemsLean.BootstrapHonesty"
        "BootstrapHonesty"
        "bootstrapHonestyModuleCite"
        "hostLakeEmitWriterPath"
        "hostLakeEmitExe"
        "hostLakeEmitStageCite"
        "src/systems/SystemsLean/FreestandingEmit.lean"
        "slake-emit-freestanding-c"
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "out/freestanding-c/"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # BOOTSTRAP theorems + smoke split (same namespace BootstrapHonesty).
      rel = "src/systems/SystemsLean/BootstrapHonestyTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "BootstrapHonestyTheorems"
        "SystemsLean.BootstrapHonestyTheorems"
        "import SystemsLean.BootstrapHonesty"
        "BOOTSTRAP-THEOREM"
        "HOST-BOOTSTRAP-THEOREM"
        "BOOTSTRAP-SMOKE"
        "HOST-BOOTSTRAP-SMOKE"
        "example"
        "productPathHostLakeBootstrapPartialReady_true"
        "productPathHostLakeBootstrapRemains_true"
        "theorem productPathHostLakeBootstrapPartialReady_true"
        "theorem productPathHostLakeBootstrapRemains_true"
        "SELF-HOST-PRODUCT-PATH-BOOTSTRAP"
        "SLAKE_SELF_HOST_PRODUCT_PATH_BOOTSTRAP_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-BOOTSTRAP"
        "hostLakeEmitWriterPath"
        "slake-emit-freestanding-c"
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # B5 WRITER-SURFACE substrate module (land-time plan/apply/body + ownership cites).
      # Batch-30 split: PartialReady bulk authority lives here; SelfApplyFs
      # re-exports chain fold. Dual-pin thin batch 4: home owns historical
      # stage/API/ownership/module-cite string defs.
      # Long-file split: WRITER-SURFACE-THEOREM + SMOKE in
      # ProductPathWriterSurfaceTheorems (same namespace).
      # No living-tip claim true defs on this land-time module.
      rel = "src/systems/SystemsLean/ProductPathWriterSurface.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_WRITER_SURFACE_V0"
        "HOST-SELF-HOST-PRODUCT-WRITER-SURFACE"
        "SELF-HOST-PRODUCT-WRITER-SURFACE"
        "productWriterSurfaceOk"
        "productWriterSurfacePartialReady"
        "def productWriterSurfacePartialReady : Bool :="
        "WRITER-SURFACE-THEOREM"
        "HOST-WRITER-SURFACE-THEOREM"
        "WRITER-SURFACE-SMOKE"
        "HOST-WRITER-SURFACE-SMOKE"
        "ProductPathWriterSurfaceTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as ProductPathPerformStep / ProductPathWriterPathExec).
        "theorem productWriterSurfacePartialReady_true"
        "SystemsLean.ProductPathWriterSurface"
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
        "slake_erasure_is_runtime_absent"
        "slake_type_tag"
        "slake_ir_program"
        "out/freestanding-c/"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # WRITER-SURFACE theorems + smoke split (same namespace ProductPathWriterSurface).
      rel = "src/systems/SystemsLean/ProductPathWriterSurfaceTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ProductPathWriterSurfaceTheorems"
        "SystemsLean.ProductPathWriterSurfaceTheorems"
        "import SystemsLean.ProductPathWriterSurface"
        "WRITER-SURFACE-THEOREM"
        "HOST-WRITER-SURFACE-THEOREM"
        "WRITER-SURFACE-SMOKE"
        "HOST-WRITER-SURFACE-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productWriterSurfaceOk_true"
        "productWriterSurfacePartialReady_true"
        "theorem productWriterSurfaceOk_true"
        "theorem productWriterSurfacePartialReady_true"
        "SELF-HOST-PRODUCT-WRITER-SURFACE"
        "slake_emit_plan_from_compose"
        "HOST-EMIT-PLAN"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
      ];
    }
    {
      # B6 WRITER-PATH-PLAN substrate module (land-time ordered plan step cites).
      # Batch-29 split: PartialReady bulk authority lives here; SelfApplyFs
      # re-exports chain fold only. Dual-pin thin batch 5: historical
      # stage/step/module-cite strings also home-owned. No living-tip claim
      # true defs on this land-time module.
      # Long-file split: WRITER-PATH-PLAN-THEOREM + SMOKE in
      # ProductPathWriterPathPlanTheorems (same namespace).
      rel = "src/systems/SystemsLean/ProductPathWriterPathPlan.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_WRITER_PATH_PLAN_V0"
        "HOST-SELF-HOST-PRODUCT-WRITER-PATH-PLAN"
        "SELF-HOST-PRODUCT-WRITER-PATH-PLAN"
        "productWriterPathPlanOk"
        "productWriterPathPlanPartialReady"
        "def productWriterPathPlanPartialReady : Bool :="
        "WRITER-PATH-PLAN-THEOREM"
        "HOST-WRITER-PATH-PLAN-THEOREM"
        "WRITER-PATH-PLAN-SMOKE"
        "HOST-WRITER-PATH-PLAN-SMOKE"
        "ProductPathWriterPathPlanTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as ProductPathWriterPathExec / ProductPathWriterSurface).
        "theorem productWriterPathPlanPartialReady_true"
        "SystemsLean.ProductPathWriterPathPlan"
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
        "out/freestanding-c/"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # WRITER-PATH-PLAN theorems + smoke split (same namespace ProductPathWriterPathPlan).
      rel = "src/systems/SystemsLean/ProductPathWriterPathPlanTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ProductPathWriterPathPlanTheorems"
        "SystemsLean.ProductPathWriterPathPlanTheorems"
        "import SystemsLean.ProductPathWriterPathPlan"
        "WRITER-PATH-PLAN-THEOREM"
        "HOST-WRITER-PATH-PLAN-THEOREM"
        "WRITER-PATH-PLAN-SMOKE"
        "HOST-WRITER-PATH-PLAN-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productWriterPathPlanOk_true"
        "productWriterPathPlanPartialReady_true"
        "theorem productWriterPathPlanOk_true"
        "theorem productWriterPathPlanPartialReady_true"
        "SELF-HOST-PRODUCT-WRITER-PATH-PLAN"
        "WRITER-PATH-STEP-READ-SSOT"
        "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY"
        "WRITER-PATH-STEP-WRITE-FREESTANDING-HC"
        "WRITER-PATH-STEP-INSTALL-OUT"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # B7 WRITER-PATH-EXEC substrate module (land-time host execution cites).
      # Batch-28 split: PartialReady bulk authority lives here; SelfApplyFs
      # tip keeps chain fold only (dual-pin thin batch 6). Historical
      # stage/fn/module-cite strings also home-owned. No living-tip claim
      # true defs on this land-time module.
      # Long-file split: WRITER-PATH-EXEC-THEOREM + SMOKE in
      # ProductPathWriterPathExecTheorems (same namespace).
      rel = "src/systems/SystemsLean/ProductPathWriterPathExec.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_WRITER_PATH_EXEC_V0"
        "HOST-SELF-HOST-PRODUCT-WRITER-PATH-EXEC"
        "SELF-HOST-PRODUCT-WRITER-PATH-EXEC"
        "productWriterPathExecutionOk"
        "productWriterPathExecutionPartialReady"
        "def productWriterPathExecutionPartialReady : Bool :="
        "WRITER-PATH-EXEC-THEOREM"
        "HOST-WRITER-PATH-EXEC-THEOREM"
        "WRITER-PATH-EXEC-SMOKE"
        "HOST-WRITER-PATH-EXEC-SMOKE"
        "ProductPathWriterPathExecTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as ProductPathWriteHc / ProductPathReadSsot).
        "theorem productWriterPathExecutionPartialReady_true"
        "SystemsLean.ProductPathWriterPathExec"
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
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # WRITER-PATH-EXEC theorems + smoke split (same namespace ProductPathWriterPathExec).
      rel = "src/systems/SystemsLean/ProductPathWriterPathExecTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ProductPathWriterPathExecTheorems"
        "SystemsLean.ProductPathWriterPathExecTheorems"
        "import SystemsLean.ProductPathWriterPathExec"
        "WRITER-PATH-EXEC-THEOREM"
        "HOST-WRITER-PATH-EXEC-THEOREM"
        "WRITER-PATH-EXEC-SMOKE"
        "HOST-WRITER-PATH-EXEC-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productWriterPathExecutionOk_true"
        "productWriterPathExecutionPartialReady_true"
        "theorem productWriterPathExecutionOk_true"
        "theorem productWriterPathExecutionPartialReady_true"
        "SELF-HOST-PRODUCT-WRITER-PATH-EXEC"
        "loadMultSsot"
        "renderHeader"
        "IO.FS.writeFile"
        "build"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # B8 OWNERSHIP inputs substrate module (land-time Mult..Out Ok cites).
      # Batch-27 split: PartialReady bulk authority lives here; SelfApplyFs
      # re-exports. Dual-pin thin batch 7: historical stage/path/moduleCite
      # dual-pins home-primary. Long-file split: OWNERSHIP-INPUTS-THEOREM + SMOKE
      # in ProductPathOwnershipInputsTheorems (same namespace).
      # No living-tip claim true defs on this module.
      rel = "src/systems/SystemsLean/ProductPathOwnershipInputs.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP"
        "SELF-HOST-PRODUCT-PATH-OWNERSHIP"
        "productPathOwnershipInputsOk"
        "productPathOwnershipInputsPartialReady"
        "def productPathOwnershipInputsPartialReady : Bool :="
        "OWNERSHIP-INPUTS-THEOREM"
        "HOST-OWNERSHIP-INPUTS-THEOREM"
        "OWNERSHIP-INPUTS-SMOKE"
        "HOST-OWNERSHIP-INPUTS-SMOKE"
        "ProductPathOwnershipInputsTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as BootstrapHonesty / ProductPathWriterPathPlan).
        "theorem productPathOwnershipInputsPartialReady_true"
        "SystemsLean.ProductPathOwnershipInputs"
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
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # OWNERSHIP-INPUTS theorems + smoke split (same namespace ProductPathOwnershipInputs).
      rel = "src/systems/SystemsLean/ProductPathOwnershipInputsTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ProductPathOwnershipInputsTheorems"
        "SystemsLean.ProductPathOwnershipInputsTheorems"
        "import SystemsLean.ProductPathOwnershipInputs"
        "OWNERSHIP-INPUTS-THEOREM"
        "HOST-OWNERSHIP-INPUTS-THEOREM"
        "OWNERSHIP-INPUTS-SMOKE"
        "HOST-OWNERSHIP-INPUTS-SMOKE"
        "example"
        "productPathOwnershipInputsPartialReady_true"
        "theorem productPathOwnershipInputsPartialReady_true"
        "SELF-HOST-PRODUCT-PATH-OWNERSHIP"
        "SLAKE_SELF_HOST_PRODUCT_PATH_OWNERSHIP_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-OWNERSHIP"
        "productPathOwnershipSsotMult"
        "productPathOwnershipEmitH"
        "productPathOwnershipDualSsotCite"
        "host_emit_mult.ssot.txt"
        "slake_freestanding.h"
        "requireDualSsotEqual"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # B9 PERFORM gap substrate module (land-time DependsOnLake true /
      # InstallStepLakeFreeCapable true). Batch-26 split: PartialReady bulk
      # authority lives here; SelfApplyFs re-exports chain fold only.
      # Dual-pin thin batch 8: historical stage/gap/Lake-writer/moduleCite home-primary.
      # Long-file split: PERFORM-THEOREM + SMOKE in ProductPathPerformTheorems
      # (same namespace).
      rel = "src/systems/SystemsLean/ProductPathPerform.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM"
        "SELF-HOST-PRODUCT-PATH-PERFORM"
        "productPathPerformOk"
        "productPathPerformPartialReady"
        "def productPathPerformPartialReady : Bool :="
        "def productPathPerformDependsOnLake : Bool := true"
        "def productPathPerformInstallStepLakeFreeCapable : Bool := true"
        "PERFORM-THEOREM"
        "HOST-PERFORM-THEOREM"
        "PERFORM-SMOKE"
        "HOST-PERFORM-SMOKE"
        "ProductPathPerformTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as ProductPathOwnershipInputs / ProductPathPerformStep).
        "theorem productPathPerformPartialReady_true"
        "SystemsLean.ProductPathPerform"
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
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # PERFORM theorems + smoke split (same namespace ProductPathPerform).
      rel = "src/systems/SystemsLean/ProductPathPerformTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ProductPathPerformTheorems"
        "SystemsLean.ProductPathPerformTheorems"
        "import SystemsLean.ProductPathPerform"
        "PERFORM-THEOREM"
        "HOST-PERFORM-THEOREM"
        "PERFORM-SMOKE"
        "HOST-PERFORM-SMOKE"
        "example"
        "productPathPerformPartialReady_true"
        "theorem productPathPerformPartialReady_true"
        "SELF-HOST-PRODUCT-PATH-PERFORM"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM"
        "productPathPerformDependsOnLake"
        "productPathPerformInstallStepLakeFreeCapable"
        "productPathPerformLakeWriterCite"
        "FreestandingEmit"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # B10 STEP perform substrate module (land-time entrypoint claimed true /
      # InstallStepLakeFreeCapable true / DependsOnLake true). Batch-25 split:
      # PartialReady bulk authority lives here; SelfApplyFs re-exports.
      # Dual-pin thin batch 9: historical stage/Ok/moduleCite/recipe/gap home-primary.
      # Long-file split: PERFORM-STEP-THEOREM + SMOKE in
      # ProductPathPerformStepTheorems (same namespace).
      rel = "src/systems/SystemsLean/ProductPathPerformStep.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_STEP_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-STEP"
        "SELF-HOST-PRODUCT-PATH-PERFORM-STEP"
        "productPathPerformStepOk"
        "productPathPerformStepPartialReady"
        "def productPathPerformStepPartialReady : Bool :="
        "def productPathPerformInstallLakeFreeEntrypointClaimed : Bool := true"
        "def productPathPerformInstallStepLakeFreeCapable : Bool := true"
        "def productPathPerformStepDependsOnLake : Bool := true"
        "PERFORM-STEP-THEOREM"
        "HOST-PERFORM-STEP-THEOREM"
        "PERFORM-STEP-SMOKE"
        "HOST-PERFORM-STEP-SMOKE"
        "ProductPathPerformStepTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as ProductPathWriterPathExec / ProductPathWriteHc).
        "theorem productPathPerformStepPartialReady_true"
        "SystemsLean.ProductPathPerformStep"
        "ProductPathPerformStep"
        "stepModuleCite"
        "productPathPerformInstallLakeFreeEntrypointRecipe"
        "stageId"
        "hostId"
        "selfHostId"
        "gapReadSsot"
        "gapCompose"
        "gapWriteHc"
        "install-freestanding-c-out"
        "WRITER-PATH-STEP-INSTALL-OUT"
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
      # PERFORM-STEP theorems + smoke split (same namespace ProductPathPerformStep).
      rel = "src/systems/SystemsLean/ProductPathPerformStepTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ProductPathPerformStepTheorems"
        "SystemsLean.ProductPathPerformStepTheorems"
        "import SystemsLean.ProductPathPerformStep"
        "PERFORM-STEP-THEOREM"
        "HOST-PERFORM-STEP-THEOREM"
        "PERFORM-STEP-SMOKE"
        "HOST-PERFORM-STEP-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathPerformStepOk_true"
        "productPathPerformStepPartialReady_true"
        "theorem productPathPerformStepOk_true"
        "theorem productPathPerformStepPartialReady_true"
        "SELF-HOST-PRODUCT-PATH-PERFORM-STEP"
        "install-freestanding-c-out"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # B11 READ-SSOT perform substrate module (land-time DependsOnLake true /
      # EntrypointClaimed true). Batch-24 split: PartialReady bulk authority
      # lives here; SelfApplyFs re-exports.
      # Dual-pin thin batch 10: historical stage/Ok/moduleCite/recipe/exe/fn/gap
      # home-primary.
      # Long-file split: READ-SSOT-THEOREM + SMOKE in
      # ProductPathReadSsotTheorems (same namespace).
      rel = "src/systems/SystemsLean/ProductPathReadSsot.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-READ"
        "SELF-HOST-PRODUCT-PATH-PERFORM-READ"
        "productPathPerformReadOk"
        "productPathPerformReadPartialReady"
        "def productPathPerformReadPartialReady : Bool :="
        "def productPathPerformReadDependsOnLake : Bool := true"
        "def productPathPerformReadEntrypointClaimed : Bool := true"
        "READ-SSOT-THEOREM"
        "HOST-READ-SSOT-THEOREM"
        "READ-SSOT-SMOKE"
        "HOST-READ-SSOT-SMOKE"
        "ProductPathReadSsotTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as ProductPathComposePlan / CapableRegenerate).
        "theorem productPathPerformReadPartialReady_true"
        "SystemsLean.ProductPathReadSsot"
        "ProductPathReadSsot"
        "readModuleCite"
        "justRecipeName"
        "lakeExeName"
        "readFnCite"
        "stageId"
        "hostId"
        "selfHostId"
        "gapReadSsot"
        "read-product-ssot"
        "slake-read-product-ssot"
        "readDualSsotAtRoot"
        "FREESTANDING-PERFORM-GAP-READ-SSOT"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # READ-SSOT theorems + smoke split (same namespace ProductPathReadSsot).
      rel = "src/systems/SystemsLean/ProductPathReadSsotTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ProductPathReadSsotTheorems"
        "SystemsLean.ProductPathReadSsotTheorems"
        "import SystemsLean.ProductPathReadSsot"
        "READ-SSOT-THEOREM"
        "HOST-READ-SSOT-THEOREM"
        "READ-SSOT-SMOKE"
        "HOST-READ-SSOT-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathPerformReadOk_true"
        "productPathPerformReadPartialReady_true"
        "theorem productPathPerformReadOk_true"
        "theorem productPathPerformReadPartialReady_true"
        "theorem productPathPerformReadDependsOnLake_true"
        "theorem productPathPerformReadEntrypointClaimed_true"
        "SELF-HOST-PRODUCT-PATH-PERFORM-READ"
        "FREESTANDING-PERFORM-GAP-READ-SSOT"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # B12 COMPOSE perform substrate module (land-time DependsOnLake true /
      # EntrypointClaimed true). Batch-23 split: PartialReady bulk authority
      # lives here; SelfApplyFs re-exports.
      # Dual-pin thin batch 11: historical stage/Ok/moduleCite/recipe/exe/fn/gap
      # home-primary.
      # Long-file split: COMPOSE-PLAN-THEOREM + SMOKE in
      # ProductPathComposePlanTheorems (same namespace).
      rel = "src/systems/SystemsLean/ProductPathComposePlan.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0"
        "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE"
        "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE"
        "productPathPerformComposeOk"
        "productPathPerformComposePartialReady"
        "def productPathPerformComposePartialReady : Bool :="
        "def productPathPerformComposeDependsOnLake : Bool := true"
        "def productPathPerformComposeEntrypointClaimed : Bool := true"
        "COMPOSE-PLAN-THEOREM"
        "HOST-COMPOSE-PLAN-THEOREM"
        "COMPOSE-PLAN-SMOKE"
        "HOST-COMPOSE-PLAN-SMOKE"
        "ProductPathComposePlanTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as PerformEvidence / OfficialPath).
        "theorem productPathPerformComposePartialReady_true"
        "SystemsLean.ProductPathComposePlan"
        "ProductPathComposePlan"
        "composeModuleCite"
        "justRecipeName"
        "lakeExeName"
        "composeFnCite"
        "stageId"
        "hostId"
        "selfHostId"
        "gapCompose"
        "compose-product-plan"
        "slake-compose-product-plan"
        "composePlanApplyBodyAtRoot"
        "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY"
        "FREESTANDING-PERFORM-GAP-COMPOSE"
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
    {
      # COMPOSE-PLAN theorems + smoke split (same namespace ProductPathComposePlan).
      rel = "src/systems/SystemsLean/ProductPathComposePlanTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ProductPathComposePlanTheorems"
        "SystemsLean.ProductPathComposePlanTheorems"
        "import SystemsLean.ProductPathComposePlan"
        "COMPOSE-PLAN-THEOREM"
        "HOST-COMPOSE-PLAN-THEOREM"
        "COMPOSE-PLAN-SMOKE"
        "HOST-COMPOSE-PLAN-SMOKE"
        "example"
        "stageId_eq"
        "hostId_eq"
        "selfHostId_eq"
        "productPathPerformComposeOk_true"
        "productPathPerformComposePartialReady_true"
        "theorem productPathPerformComposeOk_true"
        "theorem productPathPerformComposePartialReady_true"
        "theorem productPathPerformComposeDependsOnLake_true"
        "theorem productPathPerformComposeEntrypointClaimed_true"
        "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE"
        "FREESTANDING-PERFORM-GAP-COMPOSE"
        "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
  ];
}
