# SPDX-License-Identifier: Unlicense
# Join only: import non-tip data slices for systems-host-presence.
# hostSpecsCore (Mult .. FreestandingEmit) lives in host-specs-core.nix.
# hostSpecsCompilePath (CompilePath readiness wall) lives in host-specs-compile-path.nix.
# hostSpecsKernelParity (KernelMult .. ParityEmit cold ladder) lives in
# host-specs-kernel-parity.nix.
# hostSpecsJoinSurface (JoinMap + SelfHost + SurfaceMatrix + self-host.md) lives in
# host-specs-join-surface.nix.
# hostSpecsHoldCloseEarly/Late (LlvmHold .. SelfHostBody) live in
# host-specs-hold-close.nix.
# Remaining hostSpecs (SelfApply .. tip / ProductPath dual-pin / emit SSOT) stay
# INLINE here so dual-pin editors do not race a moved tip host-specs file.
# Edit job-specific files when cold data changes:
#   jargon-walk.nix              -- tree-wide banned-jargon walk
#   required-files.nix           -- skeleton required paths
#   host-leans.nix               -- host Lean path list
#   unit-surface.nix             -- unit-surface honesty token specs
#   host-specs-core.nix          -- Mult .. FreestandingEmit host token specs
#   host-specs-compile-path.nix  -- CompilePath host token wall
#   host-specs-kernel-parity.nix -- KernelMult .. ParityEmit cold ladder
#   host-specs-join-surface.nix  -- JoinMap + SelfHost + SurfaceMatrix + self-host.md
#   host-specs-hold-close.nix    -- LlvmHold .. SelfHostBody hold-close cold ladder
# Edit remaining hostSpecs in this file when SelfApply+ / tip / ProductPath honesty tokens change.
# Imported by ./default.nix. No bash, no competing gate module names.
let
  jargon = import ./jargon-walk.nix;
  required = import ./required-files.nix;
  leans = import ./host-leans.nix;
  unitSurface = import ./unit-surface.nix;
  hostCore = import ./host-specs-core.nix;
  hostCompilePath = import ./host-specs-compile-path.nix;
  hostKernelParity = import ./host-specs-kernel-parity.nix;
  hostJoinSurface = import ./host-specs-join-surface.nix;
  hostHoldClose = import ./host-specs-hold-close.nix;
in
{
  inherit (jargon)
    jargonWalkRoot
    jargonWalkSkipDirs
    jargonWalkExtensions
    jargonForbidden
    ;
  inherit (required) requiredFiles;
  inherit (leans) hostLeans;
  inherit (unitSurface) unitSurfaceSpecs;

  # SYSTEMS_LEAN_HOST modules: marker + theorems + smoke helpers.
  # Core + CompilePath + Kernel/Parity + JoinSurface + HoldClose cold peeled;
  # SelfApply / SelfApplyFs tip / ProductPath dual-pin / emit SSOT stay inline.
  hostSpecs = hostCore.hostSpecsCore ++ hostCompilePath.hostSpecsCompilePath ++ hostKernelParity.hostSpecsKernelParity ++ hostJoinSurface.hostSpecsJoinSurface ++ [
    {
      # Compiler self-application readiness (SH5 partial).
      # Long-file split: theorems + smoke live in SelfApplyTheorems (same namespace).
      rel = "src/systems/SystemsLean/SelfApply.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_SELF_APPLY_V0"
        "HOST-SELF-APPLY"
        "SELF-HOST-SELF-APPLY"
        "SELF-HOST"
        "selfApplyReady"
        "kernelRebuildsKernel"
        "multKernelSideReady"
        "linearKernelSideReady"
        "typesKernelSideReady"
        "programKernelSideReady"
        "emitKernelSideReady"
        "selfApplyOk"
        "SystemsLean.SelfApply"
        "SelfApplyTheorems"
        "SELF-APPLY-SMOKE"
        "HOST-SELF-APPLY-SMOKE"
        "HOST-PARITY-MULT"
        "SELF-HOST-KERNEL-LINEAR"
        "SELF-HOST-KERNEL-TYPES"
        "SELF-HOST-KERNEL-PROGRAM"
        "SELF-HOST-KERNEL-EMIT"
        "multParityReady"
        "linearKernelReady"
        "typesKernelReady"
        "programKernelReady"
        "emitKernelReady"
        "src/systems/self-host.md"
        "src/systems/SystemsLean/SelfApply.lean"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
        "SELF-APPLY-THEOREM"
        "HOST-SELF-APPLY-THEOREM"
        "selfApplyReady_true"
        "kernelRebuildsKernel_true"
        "selfApplySurfaceOk_true"
        "selfApplyOk_eq_ready"
      ];
      anyGroups = [
        [
          "selfApplySurfaceOk"
          "kernelRebuildsKernel"
        ]
      ];
    }
    {
      # SelfApplyTheorems: SELF-APPLY-THEOREM + SELF-APPLY-SMOKE
      # (same namespace SelfApply; long-file split).
      rel = "src/systems/SystemsLean/SelfApplyTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SelfApplyTheorems"
        "SystemsLean.SelfApplyTheorems"
        "import SystemsLean.SelfApply"
        "SELF-APPLY-THEOREM"
        "HOST-SELF-APPLY-THEOREM"
        "SELF-APPLY-SMOKE"
        "HOST-SELF-APPLY-SMOKE"
        "example"
        "selfApplyReady_true"
        "kernelRebuildsKernel_true"
        "selfApplySurfaceOk_true"
        "selfApplyOk_true"
        "selfApplyOk_eq_ready"
        "stageId_eq"
        "hostSelfApplyId_eq"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem selfApplyReady_true"
        "theorem kernelRebuildsKernel_true"
        "theorem selfApplySurfaceOk_true"
        "theorem selfApplyOk_eq_ready"
        "example : selfApplyReady = true"
        "example : selfApplyOk = true"
        "example : kernelRebuildsKernel = true"
      ];
      anyGroups = [ ];
    }
    {
      # Freestanding self-application deepen (SH5 freestanding deepen partial).
      # Living tip: freestandingProductSelfHostComplete true after claim B complete.
      # Composes freestanding Mult..Emit parity ladder (ParityEmit) into readiness.
      rel = "src/systems/SystemsLean/SelfApplyFs.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_SELF_APPLY_FS_V0"
        "HOST-SELF-APPLY-FS"
        "SELF-HOST-SELF-APPLY-FS"
        "SELF-HOST"
        "freestandingExtractPathReady"
        "freestandingBodyPathReady"
        "freestandingSelfApplyPathReady"
        "freestandingParityLadderReady"
        "freestandingEmitParityReady"
        "freestandingSelfApplyReady"
        "freestandingProductSelfHostComplete"
        "selfApplyFsDoesNotComplete"
        "selfApplyFsOk"
        "SystemsLean.SelfApplyFs"
        "SELF-APPLY-FS-SMOKE"
        "HOST-SELF-APPLY-FS-SMOKE"
        "example"
        "HOST-SELF-APPLY"
        "selfApplyReady"
        "HOST-PARITY-EMIT"
        "SELF-HOST-PARITY-EMIT"
        "SLAKE_SELF_HOST_PARITY_EMIT_V0"
        "emitParityReady"
        "multLinearTypesProgramEmitParityReady"
        "RUNTIME-FS"
        "EMIT-BOUNDARY"
        "HOST-EMIT-SSOT"
        "EMIT_BODY_V0"
        "HOST-EMIT-MULT"
        "SELF-HOST-KERNEL-EMIT"
        "lowerEmitCompose"
        "extractOkFs"
        "bodyOk"
        "emitMultReady"
        "import SystemsLean.ParityEmit"
        "src/systems/self-host.md"
        "src/systems/SystemsLean/SelfApplyFs.lean"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding product"
        "Not freestanding emit residual free"
        "Not llvm unlocked"
        # Complete-claim pin (presence fail-closed without Lake): def + smoke.
        "def freestandingProductSelfHostComplete : Bool := true"
        "example : freestandingProductSelfHostComplete = true"
        "example : freestandingSelfApplyReady = true"
        "example : selfApplyFsDoesNotComplete = false"
        "example : freestandingParityLadderReady = true"
        "example : freestandingEmitParityReady = true"
        # Structural compose pin: readiness must fold Mult..Emit parity ladder
        # (name tokens alone can survive if the conjunct is dropped from the def).
        "&& freestandingParityLadderReady"
        "SELF-APPLY-FS-THEOREM"
        "HOST-SELF-APPLY-FS-THEOREM"
        "freestandingSelfApplyReady_true"
        "freestandingProductSelfHostComplete_true"
        "selfApplyFsDoesNotComplete_false"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem freestandingSelfApplyReady_true"
        "theorem freestandingProductSelfHostComplete_true"
        "theorem selfApplyFsDoesNotComplete_false"
        # B2 partial product kernel self-application (not complete flip).
        # Dual-pin thin batch 1: historical stage/bar/module-cite strings
        # live on KernelSelfApply; tip keeps chain fold + theorem only.
        "SELF-HOST-KERNEL-SELF-APPLY"
        "productKernelSelfApplyPartialReady"
        "product kernel self-application"
        "KernelSelfApply"
        "theorem productKernelSelfApplyPartialReady_true"
        "example : productKernelSelfApplyPartialReady = true"
        # B3 partial product Out kernel evidence (not complete flip).
        # Dual-pin thin batch 2: historical stage/path/API/module-cite strings
        # live on ProductOutKernel; tip keeps chain fold + theorem only.
        "SELF-HOST-PRODUCT-OUT"
        "productOutKernelEvidencePartialReady"
        "product Out kernel evidence"
        "ProductOutKernel"
        "theorem productOutKernelEvidencePartialReady_true"
        "example : productOutKernelEvidencePartialReady = true"
        # B4 partial product path Lake bootstrap honesty (not complete flip).
        # Dual-pin thin batch 3: historical stage/writer-path/module-cite strings
        # live on BootstrapHonesty; tip keeps chain fold + remains honesty literal
        # + theorems (later families fold productPathHostLakeBootstrapRemains).
        "SELF-HOST-PRODUCT-PATH-BOOTSTRAP"
        "productPathHostLakeBootstrapRemains"
        "productPathHostLakeBootstrapPartialReady"
        "product path Lake bootstrap"
        "BootstrapHonesty"
        "def productPathHostLakeBootstrapRemains : Bool := true"
        "theorem productPathHostLakeBootstrapPartialReady_true"
        "theorem productPathHostLakeBootstrapRemains_true"
        "example : productPathHostLakeBootstrapPartialReady = true"
        "example : productPathHostLakeBootstrapRemains = true"
        # B5 partial product writer surface substrate (not complete flip).
        # Dual-pin thin batch 4: historical stage/API/ownership/module-cite strings
        # live on ProductPathWriterSurface; tip keeps chain fold + theorem only.
        "SELF-HOST-PRODUCT-WRITER-SURFACE"
        "productWriterSurfacePartialReady"
        "product writer surface"
        "ProductPathWriterSurface"
        "theorem productWriterSurfacePartialReady_true"
        "example : productWriterSurfacePartialReady = true"
        # B6 partial product writer path plan substrate (not complete flip).
        # Dual-pin thin batch 5: historical stage/step/Ok/moduleCite on home only;
        # tip keeps chain fold + theorem + partialReady example.
        "SELF-HOST-PRODUCT-WRITER-PATH-PLAN"
        "productWriterPathPlanPartialReady"
        "product writer path plan"
        "ProductPathWriterPathPlan"
        "theorem productWriterPathPlanPartialReady_true"
        "example : productWriterPathPlanPartialReady = true"
        # B7 partial product writer path execution evidence (not complete flip).
        # Dual-pin thin batch 6: historical stage/fn/Ok/moduleCite on home only;
        # tip keeps chain fold + theorem + partialReady example.
        "SELF-HOST-PRODUCT-WRITER-PATH-EXEC"
        "productWriterPathExecutionPartialReady"
        "product writer path execution"
        "ProductPathWriterPathExec"
        "theorem productWriterPathExecutionPartialReady_true"
        "example : productWriterPathExecutionPartialReady = true"
        # B8 partial freestanding product path ownership inputs (not complete flip).
        # Dual-pin thin batch 7: historical stage/path/Ok/moduleCite on home only;
        # tip keeps chain fold + living ownership claimed SSoT + theorem + examples.
        "SELF-HOST-PRODUCT-PATH-OWNERSHIP"
        "productPathOwnershipInputsPartialReady"
        "productPathFreestandingOwnershipClaimed"
        "def productPathFreestandingOwnershipClaimed : Bool := true"
        "product path ownership inputs"
        "ProductPathOwnershipInputs"
        "theorem productPathOwnershipInputsPartialReady_true"
        "theorem productPathFreestandingOwnershipClaimed_true"
        "example : productPathOwnershipInputsPartialReady = true"
        "example : productPathFreestandingOwnershipClaimed = true"
        # B9 partial freestanding product path perform gap (not complete flip).
        # Dual-pin thin batch 8: historical stage/gap/Ok/moduleCite on home only;
        # tip keeps chain fold + living perform claimed SSoT + DependsOnLake honesty
        # + theorem + examples. InstallLakeFreeEntrypoint is B10 (next block).
        "SELF-HOST-PRODUCT-PATH-PERFORM"
        "productPathPerformPartialReady"
        "productPathFreestandingPerformClaimed"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "productPathPerformDependsOnLake"
        "def productPathPerformDependsOnLake : Bool := true"
        "product path perform"
        "ProductPathPerform"
        "theorem productPathPerformPartialReady_true"
        "theorem productPathFreestandingPerformClaimed_true"
        "theorem productPathPerformDependsOnLake_true"
        "example : productPathPerformPartialReady = true"
        "example : productPathFreestandingPerformClaimed = true"
        # B10 partial first perform step: Lake-free install entrypoint (not complete).
        # Dual-pin thin batch 9: historical stage/Ok/moduleCite/recipe on home only;
        # tip keeps chain fold + InstallLakeFreeEntrypointClaimed honesty + theorem
        # + examples. Living perform claimed stays on tip (B9).
        "SELF-HOST-PRODUCT-PATH-PERFORM-STEP"
        "productPathPerformStepPartialReady"
        "def productPathPerformInstallLakeFreeEntrypointClaimed : Bool := true"
        "ProductPathPerformStep"
        "product path perform step"
        "theorem productPathPerformStepPartialReady_true"
        "theorem productPathPerformInstallLakeFreeEntrypointClaimed_true"
        "example : productPathPerformStepPartialReady = true"
        "example : productPathPerformInstallLakeFreeEntrypointClaimed = true"
        # B11 partial READ-SSOT perform substrate (not freestanding perform claimed).
        # Batch-24 split: PartialReady bulk authority in ProductPathReadSsot.
        # Dual-pin thin batch 10: tip keeps fold + ReadDependsOnLake +
        # ReadEntrypointClaimed honesty only (stage/Ok/recipe/exe home-primary).
        "SELF-HOST-PRODUCT-PATH-PERFORM-READ"
        "productPathPerformReadPartialReady"
        "def productPathPerformReadEntrypointClaimed : Bool := true"
        "def productPathPerformReadDependsOnLake : Bool := true"
        "ProductPathReadSsot"
        "product path perform read"
        "theorem productPathPerformReadPartialReady_true"
        "theorem productPathPerformReadDependsOnLake_true"
        "theorem productPathPerformReadEntrypointClaimed_true"
        "example : productPathPerformReadPartialReady = true"
        "example : productPathPerformReadEntrypointClaimed = true"
        "example : productPathPerformReadDependsOnLake = true"
        # B12 partial COMPOSE plan/apply/body perform substrate (not freestanding perform claimed).
        # Batch-23 split: PartialReady bulk authority in ProductPathComposePlan.
        # Dual-pin thin batch 11: tip keeps fold + ComposeDependsOnLake +
        # ComposeEntrypointClaimed honesty only (stage/Ok/recipe/exe home-primary).
        "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE"
        "productPathPerformComposePartialReady"
        "def productPathPerformComposeEntrypointClaimed : Bool := true"
        "def productPathPerformComposeDependsOnLake : Bool := true"
        "ProductPathComposePlan"
        "product path perform compose"
        "theorem productPathPerformComposePartialReady_true"
        "theorem productPathPerformComposeDependsOnLake_true"
        "theorem productPathPerformComposeEntrypointClaimed_true"
        "example : productPathPerformComposePartialReady = true"
        "example : productPathPerformComposeEntrypointClaimed = true"
        "example : productPathPerformComposeDependsOnLake = true"
        # B13 partial WRITE-HC freestanding .h/.c perform substrate (not freestanding perform claimed).
        # Batch-22 split: PartialReady bulk authority in
        # ProductPathWriteHc; tip re-exports.
        # Dual-pin thin batch 12: tip keeps fold/DependsOnLake/EntrypointClaimed
        # only (stage/Ok/recipe/exe/moduleCite/fnCite home-primary).
        "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC"
        "productPathPerformWriteHcPartialReady"
        "def productPathPerformWriteHcEntrypointClaimed : Bool := true"
        "def productPathPerformWriteHcDependsOnLake : Bool := true"
        "ProductPathWriteHc"
        "product path perform write"
        "theorem productPathPerformWriteHcPartialReady_true"
        "theorem productPathPerformWriteHcDependsOnLake_true"
        "theorem productPathPerformWriteHcEntrypointClaimed_true"
        "example : productPathPerformWriteHcPartialReady = true"
        "example : productPathPerformWriteHcEntrypointClaimed = true"
        "example : productPathPerformWriteHcDependsOnLake = true"
        # B14 partial freestanding-capable gap measure + ordered pipeline join.
        # Dual-pin thin batch 13: historical Ok/stage/recipe/exe/LakeFree on
        # Capable only; tip keeps living honesty bools + chain fold.
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP"
        "productPathFreestandingCapablePartialReady"
        "def productPathFreestandingCapableInstallOnly : Bool := true"
        "def productPathFreestandingCapableRead : Bool := true"
        "def productPathFreestandingCapableCompose : Bool := true"
        "def productPathFreestandingCapableWriteHc : Bool := true"
        "def productPathFreestandingCapableFullPerform : Bool := false"
        "Capable"
        "product path freestanding capable gap"
        "theorem productPathFreestandingCapablePartialReady_true"
        "theorem productPathFreestandingCapableInstallOnly_true"
        "theorem productPathFreestandingCapableFullPerform_false"
        "theorem productPathFreestandingCapableRead_true"
        "theorem productPathFreestandingCapableCompose_true"
        "theorem productPathFreestandingCapableWriteHc_true"
        "example : productPathFreestandingCapablePartialReady = true"
        "example : productPathFreestandingCapableInstallOnly = true"
        "example : productPathFreestandingCapableFullPerform = false"
        "example : productPathFreestandingCapableRead = true"
        "example : productPathFreestandingCapableCompose = true"
        "example : productPathFreestandingCapableWriteHc = true"
        # B15 partial freestanding-capable step contract / interface (evolved B16).
        # Dual-pin thin batch 14: tip keeps AuthorityNotEmit/Read/Compose/WriteHc/
        # FullSatisfied/stepContractFull honesty + chain fold; Ok/stage/recipe/exe
        # home-primary on CapableStepContract.
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT"
        "productPathFreestandingCapableStepContractPartialReady"
        "def productPathFreestandingCapableStepContractAuthorityNotEmit : Bool := true"
        "def productPathFreestandingCapableStepContractReadSatisfied : Bool := true"
        "def productPathFreestandingCapableStepContractComposeSatisfied : Bool := true"
        "def productPathFreestandingCapableStepContractWriteHcSatisfied : Bool := true"
        "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
        "def stepContractFull : Bool := true"
        "CapableStepContract"
        "product path freestanding capable step contract"
        "theorem productPathFreestandingCapableStepContractPartialReady_true"
        "theorem productPathFreestandingCapableStepContractAuthorityNotEmit_true"
        "theorem productPathFreestandingCapableStepContractReadSatisfied_true"
        "theorem productPathFreestandingCapableStepContractComposeSatisfied_true"
        "theorem productPathFreestandingCapableStepContractWriteHcSatisfied_true"
        "theorem productPathFreestandingCapableStepContractFullSatisfied_false"
        "theorem stepContractFull_true"
        "example : productPathFreestandingCapableStepContractPartialReady = true"
        "example : productPathFreestandingCapableStepContractAuthorityNotEmit = true"
        "example : productPathFreestandingCapableStepContractReadSatisfied = true"
        "example : productPathFreestandingCapableStepContractComposeSatisfied = true"
        "example : productPathFreestandingCapableStepContractWriteHcSatisfied = true"
        "example : productPathFreestandingCapableStepContractFullSatisfied = false"
        # B16 partial freestanding-capable READ (no FreestandingEmit authority).
        # Dual-pin thin batch 15: tip keeps EntrypointClaimed/AuthorityNotEmit/
        # DependsOnLake honesty + chain fold; Ok/stage/recipe/exe home-primary
        # on CapableRead.
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ"
        "productPathFreestandingCapableReadPartialReady"
        "def productPathFreestandingCapableReadEntrypointClaimed : Bool := true"
        "def productPathFreestandingCapableReadAuthorityNotEmit : Bool := true"
        "def productPathFreestandingCapableReadDependsOnLake : Bool := true"
        "CapableRead"
        "freestandingCapableReadDualSsot"
        "product path freestanding capable read"
        "theorem productPathFreestandingCapableReadPartialReady_true"
        "theorem productPathFreestandingCapableReadEntrypointClaimed_true"
        "theorem productPathFreestandingCapableReadAuthorityNotEmit_true"
        "theorem productPathFreestandingCapableReadDependsOnLake_true"
        "example : productPathFreestandingCapableReadPartialReady = true"
        "example : productPathFreestandingCapableReadEntrypointClaimed = true"
        "example : productPathFreestandingCapableReadAuthorityNotEmit = true"
        "example : productPathFreestandingCapableReadDependsOnLake = true"
        # B17 partial freestanding-capable COMPOSE (no FreestandingEmit authority).
        # Dual-pin thin batch 16: tip keeps EntrypointClaimed/AuthorityNotEmit/
        # DependsOnLake honesty + chain fold; Ok/stage/recipe/exe home-primary
        # on CapableCompose.
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE"
        "productPathFreestandingCapableComposePartialReady"
        "def productPathFreestandingCapableComposeEntrypointClaimed : Bool := true"
        "def productPathFreestandingCapableComposeAuthorityNotEmit : Bool := true"
        "def productPathFreestandingCapableComposeDependsOnLake : Bool := true"
        "CapableCompose"
        "freestandingCapableComposePlanApplyBody"
        "product path freestanding capable compose"
        "theorem productPathFreestandingCapableComposePartialReady_true"
        "theorem productPathFreestandingCapableComposeEntrypointClaimed_true"
        "theorem productPathFreestandingCapableComposeAuthorityNotEmit_true"
        "theorem productPathFreestandingCapableComposeDependsOnLake_true"
        "example : productPathFreestandingCapableComposePartialReady = true"
        "example : productPathFreestandingCapableComposeEntrypointClaimed = true"
        "example : productPathFreestandingCapableComposeAuthorityNotEmit = true"
        "example : productPathFreestandingCapableComposeDependsOnLake = true"
        # B18 partial freestanding-capable WRITE-HC (no FreestandingEmit authority).
        # Dual-pin thin batch 17: tip keeps EntrypointClaimed/AuthorityNotEmit/
        # DependsOnLake honesty + chain fold; Ok/stage/recipe/exe home-primary
        # on CapableWriteHc.
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC"
        "productPathFreestandingCapableWriteHcPartialReady"
        "def productPathFreestandingCapableWriteHcEntrypointClaimed : Bool := true"
        "def productPathFreestandingCapableWriteHcAuthorityNotEmit : Bool := true"
        "def productPathFreestandingCapableWriteHcDependsOnLake : Bool := true"
        "CapableWriteHc"
        "freestandingCapableWriteFreestandingHc"
        "product path freestanding capable write"
        "theorem productPathFreestandingCapableWriteHcPartialReady_true"
        "theorem productPathFreestandingCapableWriteHcEntrypointClaimed_true"
        "theorem productPathFreestandingCapableWriteHcAuthorityNotEmit_true"
        "theorem productPathFreestandingCapableWriteHcDependsOnLake_true"
        "example : productPathFreestandingCapableWriteHcPartialReady = true"
        "example : productPathFreestandingCapableWriteHcEntrypointClaimed = true"
        "example : productPathFreestandingCapableWriteHcAuthorityNotEmit = true"
        "example : productPathFreestandingCapableWriteHcDependsOnLake = true"
        # B19 partial freestanding-capable ordered regenerate (no FreestandingEmit authority).
        # Batch-16 split: PartialReady bulk authority in
        # CapableRegenerate; tip re-exports.
        # Dual-pin thin batch 18: tip keeps honesty + InstallOutOpen + chain fold;
        # Ok/stage/recipe/exe/pipeline home-primary on CapableRegenerate.
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE"
        "productPathFreestandingCapableRegeneratePartialReady"
        "def productPathFreestandingCapableRegenerateEntrypointClaimed : Bool := true"
        "def productPathFreestandingCapableRegenerateAuthorityNotEmit : Bool := true"
        "def productPathFreestandingCapableRegenerateDependsOnLake : Bool := true"
        "def productPathFreestandingCapableRegenerateInstallOutOpen : Bool := false"
        "CapableRegenerate"
        "freestandingCapableOrderedRegenerate"
        "product path freestanding capable regenerate"
        "theorem productPathFreestandingCapableRegeneratePartialReady_true"
        "theorem productPathFreestandingCapableRegenerateEntrypointClaimed_true"
        "theorem productPathFreestandingCapableRegenerateAuthorityNotEmit_true"
        "theorem productPathFreestandingCapableRegenerateDependsOnLake_true"
        "theorem productPathFreestandingCapableRegenerateInstallOutOpen_false"
        "example : productPathFreestandingCapableRegeneratePartialReady = true"
        "example : productPathFreestandingCapableRegenerateEntrypointClaimed = true"
        "example : productPathFreestandingCapableRegenerateAuthorityNotEmit = true"
        "example : productPathFreestandingCapableRegenerateDependsOnLake = true"
        "example : productPathFreestandingCapableRegenerateInstallOutOpen = false"
        # B20 partial freestanding-capable Install Out (no FreestandingEmit authority).
        # Batch-15 split: PartialReady bulk authority in
        # InstallOut; tip re-exports.
        # Dual-pin thin batch 19: tip keeps honesty + chain fold;
        # Ok/stage/recipe/exe/step home-primary on InstallOut.
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT"
        "productPathFreestandingCapableInstallOutPartialReady"
        "def productPathFreestandingCapableInstallOutEntrypointClaimed : Bool := true"
        "def productPathFreestandingCapableInstallOutAuthorityNotEmit : Bool := true"
        "def productPathFreestandingCapableInstallOutDependsOnLake : Bool := true"
        "InstallOut"
        "freestandingCapableInstallFreestandingOut"
        "product path freestanding capable install out"
        "theorem productPathFreestandingCapableInstallOutPartialReady_true"
        "theorem productPathFreestandingCapableInstallOutEntrypointClaimed_true"
        "theorem productPathFreestandingCapableInstallOutAuthorityNotEmit_true"
        "theorem productPathFreestandingCapableInstallOutDependsOnLake_true"
        "example : productPathFreestandingCapableInstallOutPartialReady = true"
        "example : productPathFreestandingCapableInstallOutEntrypointClaimed = true"
        "example : productPathFreestandingCapableInstallOutAuthorityNotEmit = true"
        "example : productPathFreestandingCapableInstallOutDependsOnLake = true"
        # B21 partial freestanding-capable Full bar / ownership-gap measure.
        # Batch-14 split: PartialReady bulk authority in
        # CapableFullBar; tip re-exports.
        # Dual-pin thin batch 20: tip keeps closed-substrate honesty + chain fold;
        # Ok/stage/recipe/exe/Req* home-primary on CapableFullBar.
        "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR"
        "productPathFreestandingCapableFullBarPartialReady"
        "def productPathFreestandingCapableFullBarStepContractsClosed : Bool := true"
        "def productPathFreestandingCapableFullBarInstallOutClosed : Bool := true"
        "def productPathFreestandingCapableFullBarOrderedPipelineJoined : Bool := true"
        "def productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake : Bool := true"
        "def productPathFreestandingCapableFullBarCapableLakeFree : Bool := true"
        "def productPathFreestandingCapableFullBarDependsOnLake : Bool := true"
        "CapableFullBar"
        "product path freestanding capable full bar"
        "theorem productPathFreestandingCapableFullBarPartialReady_true"
        "theorem productPathFreestandingCapableFullBarStepContractsClosed_true"
        "theorem productPathFreestandingCapableFullBarInstallOutClosed_true"
        "theorem productPathFreestandingCapableFullBarOrderedPipelineJoined_true"
        "theorem productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake_true"
        "theorem productPathFreestandingCapableFullBarCapableLakeFree_true"
        "example : productPathFreestandingCapableFullBarPartialReady = true"
        "example : productPathFreestandingCapableFullBarStepContractsClosed = true"
        "example : productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake"
        # B22..B30 partial product path ownership regenerate substrate.
        # Batch-13 split: PartialReady bulk authority in
        # ProductPathOwnershipRegenerate; tip re-exports.
        # Dual-pin thin batch 21: tip keeps honesty + chain fold;
        # Ok/stage/recipe/exe/step ids home-primary on ProductPathOwnershipRegenerate.
        "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"
        "productPathOwnershipRegeneratePartialReady"
        "def productPathOwnershipRegenerateInstallLakeFree : Bool := true"
        "def productPathOwnershipRegenerateReadLakeFree : Bool := true"
        "def productPathOwnershipRegenerateComposeLakeFree : Bool := true"
        "def productPathOwnershipRegenerateWriteHcLakeFree : Bool := true"
        "def productPathOwnershipRegenerateLakeFreeJoinClaimed : Bool := true"
        "def productPathOwnershipRegenerateProductPathAuthorityClaimed : Bool := true"
        "def productPathOwnershipRegenerateWithoutLake : Bool := true"
        "def productPathOwnershipRegenerateDependsOnLake : Bool := true"
        "def productPathOwnershipRegenerateInstallPathClaimed : Bool := true"
        "def productPathOwnershipRegenerateReadPathClaimed : Bool := true"
        "def productPathOwnershipRegenerateComposePathClaimed : Bool := true"
        "def productPathOwnershipRegenerateWriteHcPathClaimed : Bool := true"
        "ProductPathOwnershipRegenerate"
        "product path ownership regenerate"
        "theorem productPathOwnershipRegeneratePartialReady_true"
        "theorem productPathOwnershipRegenerateInstallLakeFree_true"
        "theorem productPathOwnershipRegenerateReadLakeFree_true"
        "theorem productPathOwnershipRegenerateReadPathClaimed_true"
        "theorem productPathOwnershipRegenerateComposeLakeFree_true"
        "theorem productPathOwnershipRegenerateComposePathClaimed_true"
        "theorem productPathOwnershipRegenerateWriteHcLakeFree_true"
        "theorem productPathOwnershipRegenerateWriteHcPathClaimed_true"
        "theorem productPathOwnershipRegenerateLakeFreeJoinClaimed_true"
        "theorem productPathOwnershipRegenerateProductPathAuthorityClaimed_true"
        "theorem productPathOwnershipRegenerateWithoutLake_true"
        "theorem productPathOwnershipRegenerateDependsOnLake_true"
        "theorem productPathOwnershipRegenerateInstallPathClaimed_true"
        "example : productPathOwnershipRegeneratePartialReady = true"
        "example : productPathOwnershipRegenerateInstallLakeFree = true"
        "example : productPathOwnershipRegenerateWithoutLake = true"
        # B31 partial freestanding perform evidence (beyond B30 authority).
        # Batch-12 split: PartialReady bulk authority in
        # PerformEvidence; tip re-exports.
        # Dual-pin thin batch 22: tip keeps EvidenceClaimed + chain fold;
        # Ok/stage/recipe/exe/step ids home-primary on PerformEvidence.
        "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE"
        "productPathFreestandingPerformEvidencePartialReady"
        "def productPathFreestandingPerformEvidenceClaimed : Bool := true"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "def productPathPerformDependsOnLake : Bool := true"
        "PerformEvidence"
        "product path freestanding perform evidence"
        "theorem productPathFreestandingPerformEvidenceClaimed_true"
        "theorem productPathFreestandingPerformEvidencePartialReady_true"
        "example : productPathFreestandingPerformEvidencePartialReady = true"
        "example : productPathFreestandingPerformEvidenceClaimed = true"
        "example : productPathFreestandingPerformClaimed = true"
        # B32 partial freestanding perform official-path gap (beyond B31 evidence).
        # Batch-11 split: PartialReady bulk authority in
        # OfficialPath; tip re-exports.
        # Dual-pin thin batch 23: tip keeps GapMeasured + living StillUses false /
        # Retire false + chain fold; Ok/stage/recipe/exe home-primary.
        "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH"
        "productPathFreestandingPerformOfficialPathPartialReady"
        "def productPathFreestandingPerformOfficialPathGapMeasured : Bool := true"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "def productPathPerformDependsOnLake : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
        "def productPathOfficialPathStillUsesLake : Bool := true"
        "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
        "OfficialPath"
        "product path freestanding perform official path"
        "theorem productPathFreestandingPerformOfficialPathGapMeasured_true"
        "theorem productPathFreestandingPerformOfficialPathPartialReady_true"
        "example : productPathFreestandingPerformOfficialPathPartialReady = true"
        "example : productPathFreestandingPerformOfficialPathGapMeasured = true"
        "example : productPathFreestandingPerformClaimed = true"
        # B33 partial freestanding perform official-path alternate (beyond B32 gap).
        # Batch-10 split: PartialReady bulk authority in
        # OfficialPathAlternate; tip re-exports.
        # Dual-pin thin batch 24: tip keeps Measured + WriterPresent + living
        # AlternateNotOfficial false / DualEqualityBlocks false + chain fold;
        # Ok/stage/recipe/exe/step ids home-primary.
        "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE"
        "productPathFreestandingPerformOfficialPathAlternatePartialReady"
        "def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := true"
        "def productPathOfficialPathAlternateWriterPresent : Bool := true"
        "def productPathOfficialPathAlternateNotOfficial : Bool := false"
        "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "def productPathPerformDependsOnLake : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
        "def productPathOfficialPathStillUsesLake : Bool := true"
        "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
        "OfficialPathAlternate"
        "product path freestanding perform official path alternate"
        "theorem productPathFreestandingPerformOfficialPathAlternateMeasured_true"
        "theorem productPathFreestandingPerformOfficialPathAlternatePartialReady_true"
        "example : productPathFreestandingPerformOfficialPathAlternatePartialReady = true"
        "example : productPathFreestandingPerformOfficialPathAlternateMeasured = true"
        "example : productPathOfficialPathDualEqualityBlocksRetirement = false"
        "example : productPathFreestandingPerformClaimed = true"
        # B34 partial freestanding perform dual-equality WRITE parity (beyond B33 alternate).
        # Batch-9 split: PartialReady bulk authority in
        # DualEqWriteParity; tip re-exports.
        # Dual-pin thin batch 25: tip keeps Measured + living GapOpen false /
        # StructuralNotDualEq false + chain fold; Ok/stage/recipe/exe/step ids
        # home-primary (land-time GapOpen true / StructuralNotDualEq true).
        "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
        "productPathFreestandingPerformDualEqualityWriteParityPartialReady"
        "def productPathFreestandingPerformDualEqualityWriteParityMeasured : Bool := true"
        "def productPathDualEqualityWriteParityGapOpen : Bool := false"
        "def productPathCapableWriteStructuralNotDualEquality : Bool := false"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "def productPathPerformDependsOnLake : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
        "def productPathOfficialPathStillUsesLake : Bool := true"
        "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
        "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
        "DualEqWriteParity"
        "product path freestanding perform dual equality write parity"
        "theorem productPathFreestandingPerformDualEqualityWriteParityMeasured_true"
        "theorem productPathFreestandingPerformDualEqualityWriteParityPartialReady_true"
        "example : productPathFreestandingPerformDualEqualityWriteParityPartialReady = true"
        "example : productPathFreestandingPerformDualEqualityWriteParityMeasured = true"
        "example : productPathDualEqualityWriteParityGapOpen = false"
        "example : productPathCapableWriteStructuralNotDualEquality = false"
        "example : productPathFreestandingPerformClaimed = true"
        # B35 partial freestanding perform dual-equality WRITE close path (beyond B34 parity).
        # Batch-8 split: PartialReady bulk authority in
        # DualEqWriteClosePath; tip re-exports.
        # Dual-pin thin batch 26: tip keeps Measured + Named + living NotGapClosed
        # false + chain fold; Ok/stage/recipe/exe/step ids home-primary
        # (land-time NotGapClosed true).
        "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
        "productPathFreestandingPerformDualEqualityWriteClosePathPartialReady"
        "def productPathFreestandingPerformDualEqualityWriteClosePathMeasured : Bool := true"
        "def productPathDualEqualityWriteClosePathNamed : Bool := true"
        "def productPathDualEqualityWriteClosePathNotGapClosed : Bool := false"
        "def productPathDualEqualityWriteParityGapOpen : Bool := false"
        "def productPathCapableWriteStructuralNotDualEquality : Bool := false"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "def productPathPerformDependsOnLake : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
        "def productPathOfficialPathStillUsesLake : Bool := true"
        "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
        "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
        "DualEqWriteClosePath"
        "product path freestanding perform dual equality write close path"
        "theorem productPathFreestandingPerformDualEqualityWriteClosePathMeasured_true"
        "theorem productPathFreestandingPerformDualEqualityWriteClosePathPartialReady_true"
        "example : productPathFreestandingPerformDualEqualityWriteClosePathPartialReady = true"
        "example : productPathFreestandingPerformDualEqualityWriteClosePathMeasured = true"
        "example : productPathDualEqualityWriteClosePathNamed = true"
        "example : productPathDualEqualityWriteClosePathNotGapClosed = false"
        "example : productPathDualEqualityWriteParityGapOpen = false"
        "example : productPathCapableWriteStructuralNotDualEquality = false"
        "example : productPathFreestandingPerformClaimed = true"
        # B36 partial freestanding perform dual-equality WRITE API (beyond B35 close path).
        # Batch-7 split: PartialReady bulk authority in
        # DualEqWriteApi; tip re-exports.
        # Dual-pin thin batch 27: tip keeps five API honesty bools + chain fold;
        # Ok/stage/recipe/exe/step ids home-primary.
        "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API"
        "productPathFreestandingPerformDualEqualityWriteApiPartialReady"
        "def productPathFreestandingPerformDualEqualityWriteApiMeasured : Bool := true"
        "def productPathDualEqualityWriteApiPresent : Bool := true"
        "def productPathDualEqualityWriteApiAuthorityNotEmit : Bool := true"
        "def productPathDualEqualityWriteApiNotOfficial : Bool := true"
        "def productPathDualEqualityWriteApiStepAdvanced : Bool := true"
        "def productPathDualEqualityWriteParityGapOpen : Bool := false"
        "def productPathCapableWriteStructuralNotDualEquality : Bool := false"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "def productPathPerformDependsOnLake : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
        "def productPathOfficialPathStillUsesLake : Bool := true"
        "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
        "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
        "freestandingDualEqualityWriteFreestandingHc"
        "DualEqWriteApi"
        "product path freestanding perform dual equality write api"
        "theorem productPathFreestandingPerformDualEqualityWriteApiMeasured_true"
        "theorem productPathFreestandingPerformDualEqualityWriteApiPartialReady_true"
        "example : productPathFreestandingPerformDualEqualityWriteApiPartialReady = true"
        "example : productPathFreestandingPerformDualEqualityWriteApiMeasured = true"
        "example : productPathDualEqualityWriteApiPresent = true"
        "example : productPathDualEqualityWriteApiAuthorityNotEmit = true"
        "example : productPathDualEqualityWriteApiNotOfficial = true"
        "example : productPathDualEqualityWriteApiStepAdvanced = true"
        "example : productPathDualEqualityWriteParityGapOpen = false"
        "example : productPathCapableWriteStructuralNotDualEquality = false"
        "example : productPathFreestandingPerformClaimed = true"
        # B37 partial freestanding perform dual-equality WRITE CAPABLE-GAP (beyond B36 API).
        # Batch-6 split: PartialReady bulk authority in
        # DualEqWriteCapableGap; tip re-exports.
        # Dual-pin thin batch 28: tip keeps four CAPABLE-GAP honesty + chain fold;
        # Ok/stage/recipe/exe/step ids home-primary.
        "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
        "productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady"
        "def productPathFreestandingPerformDualEqualityWriteCapableGapMeasured : Bool := true"
        "def productPathDualEqualityWriteCapableGapClosed : Bool := true"
        "def productPathCapableWriteDualEqualityLive : Bool := true"
        "def productPathDualEqualityWriteCapableGapStepAdvanced : Bool := true"
        "def productPathDualEqualityWriteParityGapOpen : Bool := false"
        "def productPathCapableWriteStructuralNotDualEquality : Bool := false"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "def productPathPerformDependsOnLake : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
        "def productPathOfficialPathStillUsesLake : Bool := true"
        "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
        "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
        "DualEqWriteCapableGap"
        "product path freestanding perform dual equality write capable gap"
        "theorem productPathFreestandingPerformDualEqualityWriteCapableGapMeasured_true"
        "theorem productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady_true"
        "example : productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady = true"
        "example : productPathFreestandingPerformDualEqualityWriteCapableGapMeasured = true"
        "example : productPathDualEqualityWriteCapableGapClosed = true"
        "example : productPathCapableWriteDualEqualityLive = true"
        "example : productPathDualEqualityWriteCapableGapStepAdvanced = true"
        "example : productPathDualEqualityWriteParityGapOpen = false"
        "example : productPathCapableWriteStructuralNotDualEquality = false"
        "example : productPathFreestandingPerformClaimed = true"
        # B38 partial freestanding perform RETIRE-OFFICIAL (beyond B37 CAPABLE-GAP).
        # Batch-5 split: PartialReady bulk authority in OfficialRetire; tip re-exports.
        # Dual-pin thin batch 29: tip keeps RETIRE honesty + chain fold;
        # Ok/stage/recipe/exe/step ids home-primary.
        "SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL"
        "productPathOfficialPathRetireOfficialPartialReady"
        "def productPathOfficialPathRetireOfficialMeasured : Bool := true"
        "def productPathOfficialPathRetireOfficialStepAdvanced : Bool := true"
        "def productPathOfficialPathUsesDualEqualityWrite : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
        "def productPathOfficialPathStillUsesLake : Bool := true"
        "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
        "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "def productPathPerformDependsOnLake : Bool := true"
        "OfficialRetire"
        "product path freestanding perform retire official"
        "theorem productPathOfficialPathRetireOfficialMeasured_true"
        "theorem productPathOfficialPathRetireOfficialPartialReady_true"
        "example : productPathOfficialPathRetireOfficialPartialReady = true"
        "example : productPathOfficialPathRetireOfficialMeasured = true"
        "example : productPathOfficialPathUsesDualEqualityWrite = true"
        "example : productPathOfficialPathStillUsesFreestandingEmit = false"
        "example : productPathOfficialPathDualEqualityBlocksRetirement = false"
        "example : productPathFreestandingPerformClaimed = true"
        # B39 partial freestanding perform PERFORM-CLAIMED (beyond B38 RETIRE-OFFICIAL).
        # Batch-4 split: PartialReady bulk authority in PerformClaimed; tip re-exports.
        # Dual-pin thin batch 30: tip keeps PERFORM-CLAIMED honesty + chain fold;
        # Ok/stage/recipe/exe/FREESTANDING-PERFORM-CLAIMED-* home-primary.
        "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED"
        "productPathFreestandingPerformClaimedPartialReady"
        "def productPathFreestandingPerformClaimedMeasured : Bool := true"
        "def productPathFreestandingPerformClaimedStepAdvanced : Bool := true"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "def productPathOfficialPathUsesDualEqualityWrite : Bool := true"
        "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
        "def productPathOfficialPathStillUsesLake : Bool := true"
        "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
        "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
        "def productPathOfficialPathRetireOfficialMeasured : Bool := true"
        "def productPathPerformDependsOnLake : Bool := true"
        "PerformClaimed"
        "product path freestanding perform claimed"
        "theorem productPathFreestandingPerformClaimedMeasured_true"
        "theorem productPathFreestandingPerformClaimedPartialReady_true"
        "theorem productPathFreestandingPerformClaimed_true"
        "example : productPathFreestandingPerformClaimedPartialReady = true"
        "example : productPathFreestandingPerformClaimedMeasured = true"
        "example : productPathFreestandingPerformClaimed = true"
        "example : productPathOfficialPathUsesDualEqualityWrite = true"
        "example : productPathOfficialPathStillUsesFreestandingEmit = false"
        "example : productPathOfficialPathDualEqualityBlocksRetirement = false"
        "example : productPathFreestandingOwnershipClaimed = true"
        "example : freestandingProductSelfHostComplete = true"
        # B40 partial freestanding ownership OWNERSHIP-CLAIMED (beyond B39 PERFORM-CLAIMED).
        # Batch-3 split: PartialReady bulk authority in OwnershipClaimed; tip re-exports.
        # Dual-pin thin batch 31: tip keeps OWNERSHIP-CLAIMED honesty + chain fold;
        # Ok/stage/recipe/exe/FREESTANDING-OWNERSHIP-CLAIMED-* home-primary.
        "SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED"
        "productPathFreestandingOwnershipClaimedPartialReady"
        "def productPathFreestandingOwnershipClaimedMeasured : Bool := true"
        "def productPathFreestandingOwnershipClaimedStepAdvanced : Bool := true"
        "def productPathFreestandingOwnershipClaimed : Bool := true"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "def productPathFreestandingPerformClaimedMeasured : Bool := true"
        "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED"
        "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
        "OwnershipClaimed"
        "product path freestanding ownership claimed"
        "theorem productPathFreestandingOwnershipClaimedMeasured_true"
        "theorem productPathFreestandingOwnershipClaimedPartialReady_true"
        "theorem productPathFreestandingOwnershipClaimed_true"
        "example : productPathFreestandingOwnershipClaimedPartialReady = true"
        "example : productPathFreestandingOwnershipClaimedMeasured = true"
        "example : productPathFreestandingOwnershipClaimed = true"
        "example : productPathFreestandingPerformClaimed = true"
        "example : stepContractFull = true"
        "example : freestandingProductSelfHostComplete = true"
      ];
      anyGroups = [
        [
          "selfApplyFsSurfaceOk"
          "freestandingSelfApplyPathReady"
          "freestandingParityLadderReady"
        ]
      ];
    }
    {
      # B2 KERNEL-SELF-APPLY module (land-time B-bar HOST-EMIT cites).
      # Batch-33 PartialReady bulk + dual-pin thin batch 1 historical stage/bar
      # string authority. SelfApplyFs tip keeps chain fold only.
      # No living-tip claim true defs on this land-time module.
      # Name KernelSelfApply (not SelfApply) -- SelfApply.lean is host structural.
      # Long-file split: KERNEL-SELF-APPLY-THEOREM + SMOKE in KernelSelfApplyTheorems
      # (same namespace).
      rel = "src/systems/SystemsLean/KernelSelfApply.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0"
        "HOST-SELF-HOST-KERNEL-SELF-APPLY"
        "SELF-HOST-KERNEL-SELF-APPLY"
        "productKernelBarSurfaceOk"
        "productKernelSelfApplyPartialReady"
        "def productKernelSelfApplyPartialReady : Bool :="
        "KERNEL-SELF-APPLY-THEOREM"
        "HOST-KERNEL-SELF-APPLY-THEOREM"
        "KERNEL-SELF-APPLY-SMOKE"
        "HOST-KERNEL-SELF-APPLY-SMOKE"
        "KernelSelfApplyTheorems"
        # Greppable theorem cite (live def in Theorems module; same split pattern
        # as ProductOutKernel / ProductPathPerform).
        "theorem productKernelSelfApplyPartialReady_true"
        "SystemsLean.KernelSelfApply"
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
        "RUNTIME-FS"
        "UNIT_SURFACE"
        "Not freestanding emit residual free"
        "Not residual free"
        "Not PROVABLY"
      ];
    }
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
        "theorem productPathOfficialPathStillUsesLake_true"
        "theorem productPathFreestandingPerformClaimed_false"
        "theorem productPathPerformDependsOnLake_true"
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
      # Full step-contract living tip (after B40 OWNERSHIP-CLAIMED).
      # Batch-2 split: PartialReady bulk authority in StepContractFull; tip re-exports.
      # Dual-pin thin batch 32: tip keeps Full honesty + chain fold;
      # Ok/stage/recipe/exe/FREESTANDING-STEP-CONTRACT-FULL-* home-primary.
      # Short role name stepContractFull; complete true after claim B.
      rel = "src/systems/SystemsLean/SelfApplyFs.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL"
        "stepContractFullPartialReady"
        "def stepContractFullMeasured : Bool := true"
        "def stepContractFullStepAdvanced : Bool := true"
        "def stepContractFull : Bool := true"
        "def productPathFreestandingOwnershipClaimed : Bool := true"
        "def productPathFreestandingPerformClaimed : Bool := true"
        "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL"
        "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
        "StepContractFull"
        "product path freestanding step contract full"
        "theorem stepContractFullMeasured_true"
        "theorem stepContractFullPartialReady_true"
        "theorem stepContractFull_true"
        "example : stepContractFullPartialReady = true"
        "example : stepContractFullMeasured = true"
        "example : stepContractFull = true"
        "example : productPathFreestandingOwnershipClaimed = true"
        "example : productPathFreestandingPerformClaimed = true"
        "example : freestandingProductSelfHostComplete = true"
      ];
      anyGroups = [
        [
          "selfApplyFsSurfaceOk"
          "freestandingSelfApplyPathReady"
          "freestandingParityLadderReady"
        ]
      ];
    }
    {
      # Full step-contract short module (after B40 OWNERSHIP-CLAIMED).
      # Batch-2 split: PartialReady bulk authority lives here; SelfApplyFs re-exports.
      # Long-file peel: STEP-CONTRACT-FULL-THEOREM + SMOKE in
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
        "def provablyUnlocked : Bool := false"
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
        "theorem provablyUnlocked_false"
        "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE"
        "FREESTANDING-PRODUCT-SELF-HOST-COMPLETE"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # SelfApplyFs living tip complete dual-pin (claim B after Full).
      # Dual-pin thin batch 33: tip keeps complete honesty + Full chain fold;
      # Ok/stage/recipe/exe/FREESTANDING-PRODUCT-SELF-HOST-COMPLETE-* home-primary.
      rel = "src/systems/SystemsLean/SelfApplyFs.lean";
      all = [
        "freestandingProductSelfHostCompletePartialReady"
        "def freestandingProductSelfHostCompleteMeasured : Bool := true"
        "def freestandingProductSelfHostCompleteStepAdvanced : Bool := true"
        "def freestandingProductSelfHostComplete : Bool := true"
        "theorem freestandingProductSelfHostComplete_true"
        "theorem freestandingProductSelfHostCompleteMeasured_true"
        "theorem freestandingProductSelfHostCompletePartialReady_true"
        "example : freestandingProductSelfHostComplete = true"
        "example : freestandingProductSelfHostCompletePartialReady = true"
        "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE"
        "SelfHostComplete"
      ];
    }
  ] ++ hostHoldClose.hostSpecsHoldCloseEarly ++ [
    {
      # Freestanding product path readiness (after HOST-INVENTORY-CLOSE).
      # Fail-closed pins: residual free / complete / unlock claims stay false.
      # Structural compose pins: readiness must fold inventoryCloseReady + unit
      # path + program path + emit path + join unit + join program + self-host
      # unit + self-host program + matrix unit + matrix program + surface
      # (name tokens alone can survive if dropped).
      # Long-file peel: path bar defs live in ProductPathBars; theorems + smoke
      # live in ProductPathTheorems (same namespace).
      rel = "src/systems/SystemsLean/ProductPath.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PRODUCT_PATH_V0"
        "HOST-PRODUCT-PATH"
        "SELF-HOST-PRODUCT-PATH"
        "SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0"
        "HOST-PRODUCT-PATH-CLOSE"
        "SELF-HOST-PRODUCT-PATH-CLOSE"
        "SELF-HOST"
        "productPathReady"
        "productPathSurfaceOk"
        "freestandingUnitProductPathReady"
        "freestandingProgramProductPathReady"
        "freestandingEmitProductPathReady"
        "freestandingJoinProductPathReady"
        "freestandingJoinUnitProductPathReady"
        "freestandingJoinProgramProductPathReady"
        "freestandingSelfHostProductPathReady"
        "freestandingSelfHostUnitProductPathReady"
        "freestandingSelfHostProgramProductPathReady"
        "freestandingMatrixUnitProductPathReady"
        "freestandingMatrixProgramProductPathReady"
        "freestandingProductPathReady"
        "productPathDoesNotComplete"
        "productPathDoesNotMeanResidualFree"
        "productPathCloseReady"
        "productPathLadderClosedOk"
        "productPathCloseSurfaceOk"
        "productPathCloseDoesNotMeanResidualFree"
        "productPathFurtherAliasTheaterHeld"
        "productPathCloseOk"
        "structural product path ladder closed"
        "residualFreeClaimed"
        "productSelfHostCompleteClaimed"
        "productPathOk"
        "SystemsLean.ProductPath"
        "ProductPathBars"
        "ProductPathTheorems"
        "import SystemsLean.ProductPathBars"
        "PRODUCT-PATH-SMOKE"
        "HOST-PRODUCT-PATH-SMOKE"
        "PRODUCT-PATH-CLOSE-SMOKE"
        "HOST-PRODUCT-PATH-CLOSE-SMOKE"
        "HOST-INVENTORY-CLOSE"
        "HOST-SELF-APPLY-FS"
        "HOST-COMPILE-PATH"
        "HOST-KERNEL-EMIT"
        "HOST-JOIN-MAP"
        "HOST-SELF-HOST"
        "HOST-SURFACE-MATRIX"
        "SLAKE_SELF_HOST_V0"
        "SLAKE_SURFACE_MATRIX_V0"
        "SURFACE-MATRIX"
        "inventoryCloseReady"
        "unitCompileReady"
        "programCompileReady"
        "extractOkFs"
        "lowerEmitCompose"
        "lowerProgramKernel"
        "emitPlanPathReady"
        "emitApplyPathReady"
        "emitBodyPathReady"
        "emitKernelReady"
        "freestandingBodyPathReady"
        "joinUnitCompileReady"
        "joinProgramCompileReady"
        "selfHostUnitReady"
        "selfHostProgramReady"
        "matrixUnitReady"
        "matrixProgramReady"
        "RUNTIME-FS"
        "EMIT-BOUNDARY"
        "EMIT_BODY_V0"
        "HOST-EMIT-SSOT"
        "HOST-EMIT-MULT"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "freestandingProductSelfHostComplete"
        "llvmUnlocked"
        "provablyUnlocked"
        "import SystemsLean.InventoryClose"
        "import SystemsLean.SelfApplyFs"
        "import SystemsLean.LlvmHold"
        "src/systems/self-host.md"
        "src/systems/host-partial-inventory.md"
        "src/systems/SystemsLean/ProductPath.lean"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding product"
        "Not freestanding emit residual free"
        "Not llvm unlocked"
        # Claim pins (presence fail-closed without Lake): defs on parent.
        "def residualFreeClaimed : Bool := false"
        "def productSelfHostCompleteClaimed : Bool := true"
        # Structural compose pins: readiness must fold inventory close + paths.
        "InventoryClose.inventoryCloseReady"
        "freestandingUnitProductPathReady"
        "freestandingProgramProductPathReady"
        "freestandingEmitProductPathReady"
        "freestandingJoinProductPathReady"
        "freestandingJoinProgramProductPathReady"
        "freestandingSelfHostProductPathReady"
        "freestandingSelfHostProgramProductPathReady"
        "freestandingMatrixUnitProductPathReady"
        "freestandingMatrixProgramProductPathReady"
        "&& productPathSurfaceOk"
        "&& !residualFreeClaimed"
        "&& productSelfHostCompleteClaimed"
        "&& SelfApplyFs.freestandingProductSelfHostComplete"
        "&& !LlvmHold.llvmUnlocked"
        "&& !LlvmHold.provablyUnlocked"
        # Close compose pins: ladder close folds productPathReady + surface
        # (&& -prefixed so presence fails if conjuncts drop from def body while
        # bare def names remain).
        "productPathReady"
        "&& productPathCloseSurfaceOk"
        "&& productPathFurtherAliasTheaterHeld"
        "KernelEmit.lowerEmitCompose"
        "KernelProgram.lowerProgramKernel"
        "KernelEmit.emitPlanPathReady"
        "PRODUCT-PATH-THEOREM"
        "HOST-PRODUCT-PATH-THEOREM"
        "productPathReady_true"
        "productPathCloseReady_true"
        "residualFreeClaimed_false"
        "productPathFurtherAliasTheaterHeld_true"
        "KernelEmit.emitApplyPathReady"
        "KernelEmit.emitBodyPathReady"
        "KernelEmit.emitKernelReady"
        "SelfApplyFs.freestandingBodyPathReady"
      ];
      anyGroups = [
        [
          "productPathSurfaceOk"
          "freestandingUnitProductPathReady"
          "freestandingProgramProductPathReady"
          "freestandingEmitProductPathReady"
          "freestandingJoinProductPathReady"
          "freestandingJoinProgramProductPathReady"
          "freestandingSelfHostProductPathReady"
          "freestandingSelfHostProgramProductPathReady"
          "freestandingMatrixUnitProductPathReady"
          "freestandingMatrixProgramProductPathReady"
          "productPathReady"
          "productPathCloseReady"
          "productPathLadderClosedOk"
        ]
      ];
    }
    {
      # ProductPathBars: freestanding path bar assembly peel (same namespace).
      rel = "src/systems/SystemsLean/ProductPathBars.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ProductPathBars"
        "SystemsLean.ProductPathBars"
        "def freestandingUnitProductPathReady : Bool :="
        "def freestandingProgramProductPathReady : Bool :="
        "def freestandingEmitProductPathReady : Bool :="
        "def freestandingJoinProductPathReady : Bool :="
        "def freestandingJoinUnitProductPathReady : Bool :="
        "def freestandingJoinProgramProductPathReady : Bool :="
        "def freestandingSelfHostProductPathReady : Bool :="
        "def freestandingSelfHostUnitProductPathReady : Bool :="
        "def freestandingSelfHostProgramProductPathReady : Bool :="
        "def freestandingMatrixUnitProductPathReady : Bool :="
        "def freestandingMatrixProgramProductPathReady : Bool :="
        "def freestandingProductPathReady : Bool :="
        "CompilePath.unitCompileReady HostCompose.empty"
        "KernelEmit.unmintedEmitCompose"
        "KernelEmit.lowerEmitCompose"
        "KernelProgram.lowerProgramKernel"
        "JoinMap.joinUnitCompileReady HostCompose.empty"
        "SelfHost.selfHostUnitReady HostCompose.empty"
        "SurfaceMatrix.matrixUnitReady HostCompose.empty"
        "SelfApplyFs.freestandingBodyPathReady"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # ProductPathTheorems: PRODUCT-PATH-THEOREM + smoke peel (same namespace).
      rel = "src/systems/SystemsLean/ProductPathTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ProductPathTheorems"
        "SystemsLean.ProductPathTheorems"
        "import SystemsLean.ProductPath"
        "PRODUCT-PATH-THEOREM"
        "HOST-PRODUCT-PATH-THEOREM"
        "PRODUCT-PATH-SMOKE"
        "HOST-PRODUCT-PATH-SMOKE"
        "PRODUCT-PATH-CLOSE-SMOKE"
        "HOST-PRODUCT-PATH-CLOSE-SMOKE"
        "example"
        "productPathReady_true"
        "productPathCloseReady_true"
        "residualFreeClaimed_false"
        "productPathFurtherAliasTheaterHeld_true"
        "productPathDoesNotMeanResidualFree_true"
        "theorem productPathReady_true"
        "theorem productPathCloseReady_true"
        "theorem residualFreeClaimed_false"
        "theorem productPathFurtherAliasTheaterHeld_true"
        "example : residualFreeClaimed = false"
        "example : productSelfHostCompleteClaimed = true"
        "example : productPathReady = true"
        "example : productPathDoesNotComplete = true"
        "example : productPathDoesNotMeanResidualFree = true"
        "example : freestandingUnitProductPathReady = true"
        "example : freestandingProgramProductPathReady = true"
        "example : freestandingEmitProductPathReady = true"
        "example : freestandingJoinProductPathReady = true"
        "example : freestandingJoinProgramProductPathReady = true"
        "example : freestandingSelfHostProductPathReady = true"
        "example : freestandingSelfHostProgramProductPathReady = true"
        "example : freestandingMatrixUnitProductPathReady = true"
        "example : freestandingMatrixProgramProductPathReady = true"
        "example : productPathLadderClosedOk = true"
        "example : productPathCloseReady = true"
        "example : productPathCloseDoesNotMeanResidualFree = true"
        "example : productPathFurtherAliasTheaterHeld = true"
        "CompilePath.unitCompileReady HostCompose.empty"
        "KernelEmit.unmintedEmitCompose"
        "KernelEmit.lowerEmitCompose"
        "KernelProgram.lowerProgramKernel"
        "CompilePath.programCompileReady IrProgram.empty"
        "KernelEmit.emitPlanPathReady"
        "KernelEmit.emitApplyPathReady"
        "KernelEmit.emitBodyPathReady"
        "KernelEmit.emitKernelReady"
        "SelfApplyFs.freestandingBodyPathReady"
        "JoinMap.joinUnitCompileReady HostCompose.empty"
        "JoinMap.joinProgramCompileReady IrProgram.empty"
        "SelfHost.selfHostUnitReady HostCompose.empty"
        "SelfHost.selfHostProgramReady IrProgram.empty"
        "SurfaceMatrix.matrixUnitReady HostCompose.empty"
        "SurfaceMatrix.matrixProgramReady IrProgram.empty"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
  ] ++ hostHoldClose.hostSpecsHoldCloseLate ++ [
    {
      # HOST-EMIT-SSOT + HOST-EMIT-BODY durable artifact: dialect keys + scaffolding.
      rel = "src/systems/emit/host_emit_body_fragment.ssot.txt";
      all = [
        "HOST-EMIT-SSOT"
        "HOST-EMIT-BODY"
        "SELF-HOST-EMIT-BODY"
        "SLAKE_SELF_HOST_EMIT_BODY_V0"
        "EMPTY_FRAGMENT"
        "HEADER_OPEN"
        "HEADER_E"
        "HEADER_CLOSE"
        "TAG_OPEN"
        "TAG_MULT"
        "TAG_KIND"
        "TAG_CLOSE"
        "/* EMIT_BODY_V0 RUNTIME-FS r=0 e=0 */"
        "NON-SSOT"
        "buildFragment"
        "BODY_C_HEADER_BEGIN"
        "BODY_C_BODY_BEGIN"
        "slake_emit_body_put_char"
        "slake_emit_body_put_u8"
        "slake_emit_body_from_compose"
        "SLAKE_EMIT_BODY_CAP"
        "EmitBody"
      ];
    }
    {
      # HOST-EMIT-MULT durable Mult product text (SH2).
      rel = "src/systems/emit/host_emit_mult.ssot.txt";
      all = [
        "HOST-EMIT-MULT"
        "NON-SSOT"
        "SELF-HOST-EMIT-MULT"
        "SLAKE_SELF_HOST_EMIT_MULT_V0"
        "MULT_NAME_0"
        "MULT_NAME_1"
        "MULT_NAME_OMEGA"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "slake_mult_is_valid"
        "FAIL-CLOSED-UNKNOWN-GRADE"
        "MULT_C_HEADER_BEGIN"
        "MULT_C_BODY_BEGIN"
        "EmitMult"
      ];
    }
    {
      # HOST-EMIT-LINEAR durable Linear product text.
      rel = "src/systems/emit/host_emit_linear.ssot.txt";
      all = [
        "HOST-EMIT-LINEAR"
        "NON-SSOT"
        "SELF-HOST-EMIT-LINEAR"
        "SLAKE_SELF_HOST_EMIT_LINEAR_V0"
        "LINEAR-EXACT-ONCE"
        "CONSUME_TOKEN_HOST_V0"
        "JOIN-ALG"
        "slake_linear_consume"
        "slake_consume_token_consume"
        "LINEAR_C_HEADER_BEGIN"
        "LINEAR_C_BODY_BEGIN"
        "EmitLinear"
      ];
    }
    {
      # HOST-EMIT-ERASURE durable Erasure product text.
      rel = "src/systems/emit/host_emit_erasure.ssot.txt";
      all = [
        "HOST-EMIT-ERASURE"
        "NON-SSOT"
        "SELF-HOST-EMIT-ERASURE"
        "SLAKE_SELF_HOST_EMIT_ERASURE_V0"
        "ERASE-RULE-MULT-0"
        "ERASE-NO-RUNTIME"
        "slake_erased"
        "slake_erased_mark"
        "slake_erasure_is_runtime_absent"
        "ERASURE_C_HEADER_BEGIN"
        "ERASURE_C_BODY_BEGIN"
        "EmitErasure"
      ];
    }
    {
      # HOST-EMIT-EXTRACT durable Extract + FAIL_CLOSED product text.
      rel = "src/systems/emit/host_emit_extract.ssot.txt";
      all = [
        "HOST-EMIT-EXTRACT"
        "NON-SSOT"
        "SELF-HOST-EMIT-EXTRACT"
        "SLAKE_SELF_HOST_EMIT_EXTRACT_V0"
        "FAIL_CLOSED_CHECKER_V1"
        "EMIT-BOUNDARY"
        "RUNTIME-FS"
        "slake_extract_status"
        "slake_check_bundle"
        "slake_check_fail_closed"
        "slake_extract_with_checks"
        "EXTRACT_C_HEADER_BEGIN"
        "EXTRACT_C_BODY_BEGIN"
        "EmitExtract"
      ];
    }
    {
      # HOST-EMIT-TYPES durable Types/TYPED_IR product text.
      rel = "src/systems/emit/host_emit_types.ssot.txt";
      all = [
        "HOST-EMIT-TYPES"
        "NON-SSOT"
        "SELF-HOST-EMIT-TYPES"
        "SLAKE_SELF_HOST_EMIT_TYPES_V0"
        "TYPED_IR_V0"
        "COMMON-UNIVERSE"
        "slake_type_tag"
        "slake_ir_node"
        "slake_ir_node_init"
        "slake_ir_node_is_well_typed"
        "TYPES_C_HEADER_BEGIN"
        "TYPES_C_BODY_BEGIN"
        "EmitTypes"
      ];
    }
    {
      # HOST-EMIT-PROGRAM durable IR program product text.
      rel = "src/systems/emit/host_emit_program.ssot.txt";
      all = [
        "HOST-EMIT-PROGRAM"
        "NON-SSOT"
        "SELF-HOST-EMIT-PROGRAM"
        "SLAKE_SELF_HOST_EMIT_PROGRAM_V0"
        "IR_PROGRAM_V0"
        "SLAKE_IR_PROGRAM_CAP"
        "slake_ir_program"
        "slake_ir_program_init"
        "slake_ir_program_push"
        "slake_ir_program_is_well_typed"
        "PROGRAM_C_HEADER_BEGIN"
        "PROGRAM_C_BODY_BEGIN"
        "EmitProgram"
      ];
    }
    {
      # HOST-EMIT-GRAPH durable IR graph product text.
      rel = "src/systems/emit/host_emit_graph.ssot.txt";
      all = [
        "HOST-EMIT-GRAPH"
        "NON-SSOT"
        "SELF-HOST-EMIT-GRAPH"
        "SLAKE_SELF_HOST_EMIT_GRAPH_V0"
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
        "EmitGraph"
      ];
    }
    {
      # HOST-EMIT-COMPOSE durable host compose product text.
      rel = "src/systems/emit/host_emit_compose.ssot.txt";
      all = [
        "HOST-EMIT-COMPOSE"
        "NON-SSOT"
        "SELF-HOST-EMIT-COMPOSE"
        "SLAKE_SELF_HOST_EMIT_COMPOSE_V0"
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
        "EmitCompose"
      ];
    }
    {
      # HOST-EMIT-PLAN durable emit plan product text.
      rel = "src/systems/emit/host_emit_plan.ssot.txt";
      all = [
        "HOST-EMIT-PLAN"
        "NON-SSOT"
        "SELF-HOST-EMIT-PLAN"
        "SLAKE_SELF_HOST_EMIT_PLAN_V0"
        "EMIT_PLAN_V0"
        "slake_emit_plan"
        "slake_emit_plan_from_compose"
        "slake_emit_plan_is_ready"
        "PLAN_C_HEADER_BEGIN"
        "PLAN_C_BODY_BEGIN"
        "EmitPlan"
      ];
    }
    {
      # HOST-EMIT-APPLY durable emit apply product text.
      rel = "src/systems/emit/host_emit_apply.ssot.txt";
      all = [
        "HOST-EMIT-APPLY"
        "NON-SSOT"
        "SELF-HOST-EMIT-APPLY"
        "SLAKE_SELF_HOST_EMIT_APPLY_V0"
        "EMIT_APPLY_V0"
        "SLAKE_EMIT_APPLY_CAP"
        "slake_emit_apply"
        "slake_emit_apply_from_compose"
        "slake_emit_apply_is_valid"
        "APPLY_C_HEADER_BEGIN"
        "APPLY_C_BODY_BEGIN"
        "EmitApply"
      ];
    }
    {
      # HOST-EMIT-BANNER durable banner / version product text.
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
        "EmitBanner"
      ];
    }
    {
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.Mult"
        "import SystemsLean.MultTheorems"
        "import SystemsLean.Linear"
        "import SystemsLean.LinearTheorems"
        "import SystemsLean.Types"
        "import SystemsLean.IrProgram"
        "import SystemsLean.IrProgramTheorems"
        "import SystemsLean.Erasure"
        "import SystemsLean.ErasureTheorems"
        "import SystemsLean.Extract"
        "import SystemsLean.ExtractTheorems"
        "import SystemsLean.IrGraph"
        "import SystemsLean.IrGraphTheorems"
        "import SystemsLean.HostCompose"
        "import SystemsLean.EmitPlan"
        "import SystemsLean.EmitApply"
        "import SystemsLean.EmitBody"
        "import SystemsLean.EmitBanner"
        "import SystemsLean.CompilePath"
        "import SystemsLean.JoinMap"
        "import SystemsLean.SelfHost"
        "import SystemsLean.SelfHostTheorems"
        "import SystemsLean.SurfaceMatrix"
        "import SystemsLean.KernelMult"
        "import SystemsLean.KernelMultTheorems"
        "import SystemsLean.EmitMult"
        "import SystemsLean.EmitLinear"
        "import SystemsLean.EmitErasure"
        "import SystemsLean.EmitExtract"
        "import SystemsLean.EmitTypes"
        "import SystemsLean.EmitProgram"
        "import SystemsLean.EmitGraph"
        "import SystemsLean.EmitCompose"
        "import SystemsLean.ParityMult"
        "import SystemsLean.ParityMultTheorems"
        "import SystemsLean.KernelLinear"
        "import SystemsLean.KernelLinearTheorems"
        "import SystemsLean.ParityLinear"
        "import SystemsLean.ParityLinearTheorems"
        "import SystemsLean.KernelTypes"
        "import SystemsLean.KernelTypesTheorems"
        "import SystemsLean.ParityTypes"
        "import SystemsLean.ParityTypesTheorems"
        "import SystemsLean.KernelProgram"
        "import SystemsLean.KernelProgramTheorems"
        "import SystemsLean.ParityProgram"
        "import SystemsLean.ParityProgramTheorems"
        "import SystemsLean.KernelEmit"
        "import SystemsLean.KernelEmitTheorems"
        "import SystemsLean.ParityEmit"
        "import SystemsLean.ParityEmitTheorems"
        "import SystemsLean.SelfApply"
        "import SystemsLean.SelfApplyTheorems"
        "import SystemsLean.SelfApplyFs"
        "import SystemsLean.LlvmHold"
        "import SystemsLean.LlvmHoldTheorems"
        "import SystemsLean.InventoryClose"
        "import SystemsLean.InventoryCloseTheorems"
        "import SystemsLean.ProductPath"
        "import SystemsLean.DualResidual"
        "import SystemsLean.DualResidualTheorems"
        "import SystemsLean.ProbeWire"
        "import SystemsLean.ProbeWireTheorems"
        "import SystemsLean.SpecProof"
        "import SystemsLean.SelfHostBody"
        "import SystemsLean.SelfHostBodyTheorems"
      ];
    }
  ];
}
