# SPDX-License-Identifier: Unlicense
# Pure Nix systems emit-wire presence: compile/emit drivers, freestanding emit
# product tokens (UNIT_TRANSLATION_V0 through EMIT_BODY_V0), UNIT_DEEPEN_V1
# units + companions, optional release surface, dynamic unit-surface walk, and
# required hosted behavioral probe path (smoke debt under src/systems/smoke/;
# not product emit residual). Fail-closed on missing required paths or honesty
# tokens. No bash, no ripgrep, no Python.
#
#   import ./systems-emit-wire { inherit lib; root = novelSourceOrRepo; }
#   -> { ok, violations, summary }
#
# Specs data: ./specs.nix. Flake: checks.systems-emit-wire.
# Live gate (does not require git-tracked flake store): just systems-emit-wire
# Workspace check.sh deleted; link/run smoke is just systems-cc-probe process glue.
{ lib, root }:
let
  specs = import ./specs.nix;
  inherit (specs)
    requiredFiles
    optionalFiles
    contentSpecs
    optionalContentSpecs
    unitWalkRoot
    unitWalkSkipDirs
    unitWalkExtensions
    unitSurfaceRequiredAny
    unitSurfaceRequiredAll
    unitSurfaceModuleAny
    emitH
    emitC
    releaseH
    releaseC
    residualFreeMeasureStageId
    residualFreeMeasureHostId
    residualFreeMeasureSelfHostId
    forbiddenManagedResidual
    requiredFreestandingHonesty
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

  # Cold eval peels (helpers, file/content, unit walk, emit/out match).
  # HostPin family scanners stay inline below (dual-pin batch race surface).
  evalHelpers = import ./eval-helpers.nix { inherit lib root; };
  inherit (evalHelpers) exists readRel has hasI checkContent;

  evalFileContent = import ./eval-file-content.nix {
    inherit
      lib
      exists
      readRel
      checkContent
      requiredFiles
      contentSpecs
      optionalContentSpecs
      ;
  };
  inherit (evalFileContent) fileViolations contentViolations optionalContentViolations;

  evalUnitWalk = import ./eval-unit-walk.nix {
    inherit
      lib
      root
      readRel
      has
      unitWalkRoot
      unitWalkSkipDirs
      unitWalkExtensions
      unitSurfaceRequiredAny
      unitSurfaceRequiredAll
      unitSurfaceModuleAny
      ;
  };
  inherit (evalUnitWalk)
    hasExt
    walkUnits
    unitPaths
    unitFileViolations
    unitSurfaceCount
    unitCountViolations
    ;

  evalEmitReleaseMatch = import ./eval-emit-release-match.nix {
    inherit
      readRel
      emitH
      emitC
      releaseH
      releaseC
      ;
  };
  inherit (evalEmitReleaseMatch) emitReleaseMatchViolations;

  # SELF-HOST-KERNEL-SELF-APPLY module dual-pin (partial B2 bulk home):
  # Dual-pin thin batch 1: historical stage/bar/module-cite strings live on
  # KernelSelfApply only. Tip hostPin is fold/claim chain only
  # (productKernelSelfApplyPartialReady + import cite + short map id).
  # Emit/out byte match stays in emitReleaseMatchViolations above.
  # Does not flip freestandingProductSelfHostComplete; not residual free.
  productKernelSelfApplyModuleViolations =
    let
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      kernMod = readRel productKernelSelfApplyModulePath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-KERNEL-SELF-APPLY: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-KERNEL-SELF-APPLY: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-KERNEL-SELF-APPLY: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ "SELF-HOST-KERNEL-SELF-APPLY: ${rel}: forbidden ${t}" ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productKernelSelfApplyPartialReady"
      "SELF-HOST-KERNEL-SELF-APPLY"
      "KernelSelfApply"
      "theorem productKernelSelfApplyPartialReady_true"
    ])
    ++ (scan productKernelSelfApplyModulePath kernMod productKernelSelfApplyModuleTokens)
    ++ (forbid productKernelSelfApplyModulePath kernMod productKernelSelfApplyModuleForbiddenTokens);

  productKernelSelfApplyModuleGreen =
    productKernelSelfApplyModuleViolations == [ ];

  # SELF-HOST-PRODUCT-OUT / product Out kernel evidence (partial B3):
  # when release present, require default B-bar HOST-EMIT ownership + freestanding
  # APIs on product Out (both .h and .c). Out-first claim-B path evidence beyond
  # B2 emit/out match alone. Missing out/ is still OK (optional release).
  # Dual-pin thin batch 2: historical stage/path/API/module-cite strings live on
  # ProductOutKernel only. Tip hostPin is fold/claim chain only
  # (productOutKernelEvidencePartialReady + import cite + short map id).
  # Does not flip freestandingProductSelfHostComplete; not residual free.
  productOutKernelEvidenceViolations =
    let
      rh = readRel releaseH;
      rc = readRel releaseC;
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      outMod = readRel productOutKernelModulePath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-OUT: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-OUT: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-OUT: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ "SELF-HOST-PRODUCT-OUT: ${rel}: forbidden ${t}" ]
            else
              [ ]
          ) tokens;
      scanFile =
        rel: content: tokens:
        if content == null then
          [ ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-OUT: ${rel}: missing B-bar ${t}" ]
          ) tokens;
      releaseScan =
        if rh == null || rc == null then
          [ ]
        else
          (scanFile releaseH rh productOutBbarOwnership)
          ++ (scanFile releaseC rc productOutBbarOwnership)
          ++ (scanFile releaseH rh productOutBbarApis)
          ++ (scanFile releaseC rc productOutBbarApis);
    in
    (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productOutKernelEvidencePartialReady"
      "SELF-HOST-PRODUCT-OUT"
      "ProductOutKernel"
      "theorem productOutKernelEvidencePartialReady_true"
    ])
    ++ (scan productOutKernelModulePath outMod productOutKernelModuleTokens)
    ++ (forbid productOutKernelModulePath outMod productOutKernelModuleForbiddenTokens)
    ++ releaseScan;

  # PRODUCT-RESIDUAL-FREE-MEASURE / SELF-HOST-RESIDUAL-FREE-MEASURE (claim A):
  # when release surface is present, pure Nix scans for forbidden managed Lean
  # runtime / GC residual markers and requires freestanding honesty tokens.
  # Missing out/ is still OK (optional release; cannot claim free).
  # Measure green supports DualResidual residualFreeClaimed when honesty agrees.
  # Not host elaborator residual free / llvm / PROVABLY.
  residualFreeMeasureViolations =
    let
      rh = readRel releaseH;
      rc = readRel releaseC;
      scanFile =
        rel: content:
        if content == null then
          [ ]
        else
          (lib.concatMap (
            t:
            if has t content then
              [ "PRODUCT-RESIDUAL-FREE-MEASURE: ${rel}: forbidden managed residual ${t}" ]
            else
              [ ]
          ) forbiddenManagedResidual)
          ++ (lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "PRODUCT-RESIDUAL-FREE-MEASURE: ${rel}: missing freestanding honesty ${t}" ]
          ) requiredFreestandingHonesty);
    in
    (scanFile releaseH rh) ++ (scanFile releaseC rc);

  # True when both release files exist (measure ran on full release surface).
  residualFreeReleasePresent =
    (readRel releaseH != null) && (readRel releaseC != null);

  # Measure green: release present and no residual-free-measure violations.
  # DualResidual residualFreeClaimed may be true when measure + honesty agree.
  residualFreeMeasureGreen =
    residualFreeReleasePresent && residualFreeMeasureViolations == [ ];

  # Product Out kernel evidence green (partial B3): release present and B-bar
  # ownership + APIs present on Out. Does not flip freestandingProductSelfHostComplete.
  productOutKernelEvidenceGreen =
    residualFreeReleasePresent && productOutKernelEvidenceViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-BOOTSTRAP / product path Lake bootstrap (partial B4):
  # FreestandingEmit must still own the product wire writer stage, and acceptance
  # must document bootstrap honesty tokens. Always runs (writer residual remains).
  # When release present, also requires B3 Out B-bar green (consumer evidence).
  # Does not flip freestandingProductSelfHostComplete; not residual free.
  # Dual-pin thin batch 3: historical stage/writer-path/module-cite string defs
  # live on BootstrapHonesty only. Tip hostPin is fold/claim chain + remains
  # honesty literal (later families fold productPathHostLakeBootstrapRemains).
  productPathBootstrapViolations =
    let
      writer = readRel productPathBootstrapWriterPath;
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      bootstrapMod = readRel productPathBootstrapModulePath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-BOOTSTRAP: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-BOOTSTRAP: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-BOOTSTRAP: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ "SELF-HOST-PRODUCT-PATH-BOOTSTRAP: ${rel}: forbidden ${t}" ]
            else
              [ ]
          ) tokens;
    in
    (scan productPathBootstrapWriterPath writer productPathBootstrapWriterTokens)
    ++ (scan freestandingEmitLoadPath (readRel freestandingEmitLoadPath) productPathBootstrapWriterLoadTokens)
    ++ (scan "src/systems/self-host.md" accept productPathBootstrapAcceptanceTokens)
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathHostLakeBootstrapRemains"
      "productPathHostLakeBootstrapPartialReady"
      "SELF-HOST-PRODUCT-PATH-BOOTSTRAP"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "BootstrapHonesty"
      "theorem productPathHostLakeBootstrapPartialReady_true"
      "theorem productPathHostLakeBootstrapRemains_true"
    ])
    ++ (scan productPathBootstrapModulePath bootstrapMod productPathBootstrapModuleTokens)
    ++ (forbid productPathBootstrapModulePath bootstrapMod productPathBootstrapModuleForbiddenTokens)
    ++ (
      if residualFreeReleasePresent && productOutKernelEvidenceViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-BOOTSTRAP: product Out B-bar not green (B3 consumer evidence required when release present)"
        ]
      else
        [ ]
    );

  # Bootstrap honesty green: writer + acceptance + host pin tokens; when Out
  # present, B3 consumer evidence also green. Complete stays false.
  productPathHostLakeBootstrapGreen = productPathBootstrapViolations == [ ];

  # SELF-HOST-PRODUCT-WRITER-SURFACE / product writer surface (partial B5):
  # when release present, require plan/apply/body writer ownership + APIs on Out
  # (beyond B3 B-bar consumer APIs). Always require acceptance + host pin tokens.
  # Folds B4 honesty: when release present, B3 Out B-bar still green and bootstrap
  # remains true on host pin. Does not flip freestandingProductSelfHostComplete.
  # Dual-pin thin batch 4: historical stage/API/ownership/module-cite strings live
  # on ProductPathWriterSurface only. Tip hostPin is fold/claim chain only
  # (productWriterSurfacePartialReady + import cite + short map id + theorem).
  productWriterSurfaceViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      surfaceMod = readRel productWriterSurfaceModulePath;
      rh = readRel releaseH;
      rc = readRel releaseC;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-WRITER-SURFACE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-WRITER-SURFACE: ${rel}: missing ${t}" ]
          ) tokens;
      scanFile =
        rel: content: tokens:
        if content == null then
          [ ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-WRITER-SURFACE: ${rel}: missing writer ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-WRITER-SURFACE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ "SELF-HOST-PRODUCT-WRITER-SURFACE: ${rel}: forbidden ${t}" ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productWriterSurfaceAcceptanceTokens)
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productWriterSurfacePartialReady"
      "SELF-HOST-PRODUCT-WRITER-SURFACE"
      "ProductPathWriterSurface"
      "theorem productWriterSurfacePartialReady_true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
    ])
    ++ (scan productWriterSurfaceModulePath surfaceMod productWriterSurfaceModuleTokens)
    ++ (forbid productWriterSurfaceModulePath surfaceMod productWriterSurfaceModuleForbiddenTokens)
    ++ (
      if residualFreeReleasePresent then
        (scanFile releaseH rh productWriterSurfaceOwnership)
        ++ (scanFile releaseC rc productWriterSurfaceOwnership)
        ++ (scanFile releaseH rh productWriterSurfaceApis)
        ++ (scanFile releaseC rc productWriterSurfaceApis)
        ++ (
          if productOutKernelEvidenceViolations != [ ] then
            [
              "SELF-HOST-PRODUCT-WRITER-SURFACE: product Out B-bar not green (B3 consumer evidence required when release present)"
            ]
          else
            [ ]
        )
      else
        [ ]
    );

  # Writer surface green: acceptance + host pin; when Out present, plan/apply/body
  # + B3 B-bar green. Complete stays false; Lake bootstrap remains (B4).
  productWriterSurfaceGreen = productWriterSurfaceViolations == [ ];

  # SELF-HOST-PRODUCT-WRITER-PATH-PLAN / product writer path plan (partial B6):
  # named ordered freestanding-capable regenerate steps (not B5 surface re-grep).
  # Dual-pin thin batch 5: historical stage/step/Ok/moduleCite strings live
  # on ProductPathWriterPathPlan only. Tip hostPin is fold/claim chain only
  # (productWriterPathPlanPartialReady + import cite + short map id + theorem +
  # B5 surface chain + B4 remains literal).
  # Always require acceptance + host fold pin + B4 FreestandingEmit bootstrap
  # still documented. When release present, require B5 writer surface green.
  # Does not flip freestandingProductSelfHostComplete.
  productWriterPathPlanViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      writer = readRel productPathBootstrapWriterPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-WRITER-PATH-PLAN: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-WRITER-PATH-PLAN: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-WRITER-PATH-PLAN: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-WRITER-PATH-PLAN: ${rel}: forbidden living-tip claim true def present: ${t}"
              ]
            else
              [ ]
          ) tokens;
      planMod = readRel productWriterPathPlanModulePath;
    in
    (scan "src/systems/self-host.md" accept productWriterPathPlanAcceptanceTokens)
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productWriterPathPlanPartialReady"
      "SELF-HOST-PRODUCT-WRITER-PATH-PLAN"
      "productWriterSurfacePartialReady"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "ProductPathWriterPathPlan"
      "theorem productWriterPathPlanPartialReady_true"
    ])
    ++ (scan productPathBootstrapWriterPath writer productPathBootstrapWriterTokens)
    ++ (scan freestandingEmitLoadPath (readRel freestandingEmitLoadPath) productPathBootstrapWriterLoadTokens)
    ++ (scan productWriterPathPlanModulePath planMod productWriterPathPlanModuleTokens)
    ++ (forbid productWriterPathPlanModulePath planMod productWriterPathPlanModuleForbiddenTokens)
    ++ (
      if residualFreeReleasePresent && productWriterSurfaceViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-WRITER-PATH-PLAN: product writer surface not green (B5 surface required when release present)"
        ]
      else
        [ ]
    );

  # Writer path plan green: acceptance + tip fold pin + B4 bootstrap writer +
  # batch-29/batch-5 home module dual-pin; when Out present, B5 surface green.
  # Complete stays false; plan is not complete. Living-tip claim true defs
  # forbidden on home.
  productWriterPathPlanGreen = productWriterPathPlanViolations == [ ];

  # SELF-HOST-PRODUCT-WRITER-PATH-EXEC / product writer path execution (partial B7):
  # host FreestandingEmit + just build greppably **perform** B6 plan
  # steps (function names / write / install path strings -- DISTINCT from mere
  # WRITER-PATH-STEP-* plan ids). Always require acceptance + host pin + writer
  # exec cites + install recipe. When release present, B6 plan gate green.
  # Does not flip freestandingProductSelfHostComplete; B4 bootstrap remains.
  productWriterPathExecutionViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      writer = readRel productPathBootstrapWriterPath;
      install = readRel productWriterPathExecutionInstallPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-WRITER-PATH-EXEC: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-WRITER-PATH-EXEC: ${rel}: missing ${t}" ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productWriterPathExecutionAcceptanceTokens)
    # Dual-pin thin batch 6: historical Ok/moduleCite/fn strings on
    # ProductPathWriterPathExec only. Tip hostPin is fold/claim chain only
    # (productWriterPathExecutionPartialReady + import cite + short map id +
    # theorem + B6 plan chain + B4 remains literal).
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productWriterPathExecutionPartialReady"
      "SELF-HOST-PRODUCT-WRITER-PATH-EXEC"
      "productWriterPathPlanPartialReady"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "ProductPathWriterPathExec"
      "theorem productWriterPathExecutionPartialReady_true"
    ])
    ++ (scan productPathBootstrapWriterPath writer productWriterPathExecutionWriterTokens)
    ++ (scan freestandingEmitLoadPath (readRel freestandingEmitLoadPath) productWriterPathExecutionLoadTokens)
    ++ (scan freestandingEmitLoadScaffoldPath (readRel freestandingEmitLoadScaffoldPath) productWriterPathExecutionLoadScaffoldTokens)
    ++ (scan productWriterPathExecutionInstallPath install productWriterPathExecutionInstallTokens)
    ++ (
      let
        execMod = readRel productWriterPathExecModulePath;
        forbid =
          rel: content: tokens:
          if content == null then
            [ "SELF-HOST-PRODUCT-WRITER-PATH-EXEC: missing ${rel}" ]
          else
            lib.concatMap (
              t:
              if has t content then
                [
                  "SELF-HOST-PRODUCT-WRITER-PATH-EXEC: ${rel}: forbidden living-tip claim token '${t}'"
                ]
              else
                [ ]
            ) tokens;
      in
      (scan productWriterPathExecModulePath execMod productWriterPathExecModuleTokens)
      ++ (forbid productWriterPathExecModulePath execMod productWriterPathExecModuleForbiddenTokens)
    )
    ++ (
      if residualFreeReleasePresent && productWriterPathPlanViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-WRITER-PATH-EXEC: product writer path plan not green (B6 plan required when release present)"
        ]
      else
        [ ]
    );

  # Writer path execution green: acceptance + host exec cites + FreestandingEmit
  # perform tokens + install recipe + batch-28 module dual-pin; when Out present,
  # B6 plan green. Complete false. Living-tip claim true defs forbidden on home.
  productWriterPathExecutionGreen = productWriterPathExecutionViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-OWNERSHIP / product path ownership inputs (partial B8):
  # Mult..Out dual SSOT files present + emit .h/.c present + acceptance + host pin.
  # Living tip after B40: SelfApplyFs productPathFreestandingOwnershipClaimed true
  # (scan requires true). B8 remains Mult..Out inputs substrate (not Full/complete).
  # Batch-27: Ok/PartialReady bulk authority in ProductPathOwnershipInputs
  # (land-time); living-tip claim true defs forbidden on that module.
  # When release present, B7 exec gate green. complete false.
  productPathOwnershipInputsViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      ownershipMod = readRel productPathOwnershipInputsModulePath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-OWNERSHIP: ${rel}: forbidden living-tip claim token '${t}'"
              ]
            else
              [ ]
          ) tokens;
      pathMissing =
        rel:
        if exists rel then
          [ ]
        else
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP: missing required path ${rel}" ];
    in
    (scan "src/systems/self-host.md" accept productPathOwnershipAcceptanceTokens)
    # Dual-pin thin batch 7: historical Ok/moduleCite/ssot/emit path strings on
    # ProductPathOwnershipInputs only. Tip hostPin is fold/claim chain only
    # (productPathOwnershipInputsPartialReady + living ownership claimed true +
    # import cite + short map id + theorem + B7 exec chain + B4 remains literal).
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathOwnershipInputsPartialReady"
      "SELF-HOST-PRODUCT-PATH-OWNERSHIP"
      "productPathFreestandingOwnershipClaimed"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "productWriterPathExecutionPartialReady"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "ProductPathOwnershipInputs"
      "theorem productPathOwnershipInputsPartialReady_true"
    ])
    ++ (scan productPathOwnershipInputsModulePath ownershipMod productPathOwnershipInputsModuleTokens)
    ++ (forbid productPathOwnershipInputsModulePath ownershipMod productPathOwnershipInputsModuleForbiddenTokens)
    ++ (lib.concatMap pathMissing productPathOwnershipSsotPaths)
    ++ (lib.concatMap pathMissing productPathOwnershipEmitPaths)
    ++ (
      if residualFreeReleasePresent && productWriterPathExecutionViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-OWNERSHIP: product writer path execution not green (B7 required when release present)"
        ]
      else
        [ ]
    );

  # Ownership inputs green: Mult..Out SSOT + emit wire present; acceptance + host
  # pin; when Out present, B7 exec green. Living tip ownership claimed true after B40
  # (claim-bool SSoT); B8 gate is inputs substrate, not a living non-claim of the bool.
  productPathOwnershipInputsGreen = productPathOwnershipInputsViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-PERFORM / product path perform gap (partial B9):
  # acceptance + host pin; Lake FreestandingEmit still performs read/compose/write.
  # justfile full path has Lake emit + install cp. Lake-free install-only
  # entrypoint is B10 (separate gate). When release present, B8 ownership inputs
  # green. Complete false.
  # Dual-pin thin batch 8: historical Ok/moduleCite/gap/Lake-writer path strings
  # on ProductPathPerform only. Tip hostPin is fold/claim chain only
  # (productPathPerformPartialReady + living perform claimed true + DependsOnLake
  # honesty + import cite + short map id + theorem + B8 ownership chain + B4 remains).
  productPathPerformViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      lakeWriter = readRel productPathPerformLakeWriterPath;
      installRecipe = readRel productPathPerformInstallPath;
      performMod = readRel productPathPerformModulePath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-PERFORM: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-PERFORM: ${rel}: forbidden living-tip claim token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathPerformAcceptanceTokens)
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathPerformPartialReady"
      "SELF-HOST-PRODUCT-PATH-PERFORM"
      "productPathFreestandingPerformClaimed"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "productPathPerformDependsOnLake"
      "def productPathPerformDependsOnLake : Bool := true"
      "productPathOwnershipInputsPartialReady"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "ProductPathPerform"
      "theorem productPathPerformPartialReady_true"
    ])
    ++ (scan productPathPerformLakeWriterPath lakeWriter productPathPerformLakeWriterTokens)
    ++ (scan productPathPerformLakeLoadPath (readRel productPathPerformLakeLoadPath) productPathPerformLakeLoadTokens)
    ++ (scan productPathPerformInstallPath installRecipe productPathPerformInstallTokens)
    ++ (scan productPathPerformModulePath performMod productPathPerformModuleTokens)
    ++ (forbid productPathPerformModulePath performMod productPathPerformModuleForbiddenTokens)
    ++ (
      if residualFreeReleasePresent && productPathOwnershipInputsViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-PERFORM: product path ownership inputs not green (B8 required when release present)"
        ]
      else
        [ ]
    );

  # Perform gap green: acceptance + host pin non-claim + Lake still writer for
  # read/compose/write + install step mechanism + B8 when release present.
  # freestanding perform claimed stays false.
  productPathPerformGreen = productPathPerformViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-PERFORM-STEP / first perform step (partial B10):
  # Lake-free install-only entrypoint (just install-freestanding-c-out). Host pin
  # productPathPerformInstallLakeFreeEntrypointClaimed true + step partial ready;
  # freestanding perform claimed false; DependsOnLake true for read/compose/write.
  # Structural: extract install-freestanding-c-out recipe body (indented lines) and
  # forbid command lines that start with lake build / lake exe (not prose echo).
  # When release present, B9 perform gap green. Complete false.
  # Dual-pin thin batch 9: historical Ok/stage/moduleCite/recipe/gap path strings
  # on ProductPathPerformStep only. Tip hostPin is fold/claim chain only
  # (productPathPerformStepPartialReady + InstallLakeFreeEntrypointClaimed true +
  # living perform claimed + DependsOnLake + B9 perform + B8 ownership + B4 remains
  # + import cite + theorem).
  productPathPerformStepViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      stepMod = readRel productPathPerformStepModulePath;
      installRecipe = readRel productPathPerformStepInstallPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-STEP: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-PERFORM-STEP: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ "SELF-HOST-PRODUCT-PATH-PERFORM-STEP: ${rel}: forbidden ${t}" ]
            else
              [ ]
          ) tokens;
      # Strip leading ASCII space/tab from a line (pure; no shell).
      stripLeadingWs =
        s:
        if s == "" then
          s
        else if lib.hasPrefix " " s || lib.hasPrefix "\t" s then
          stripLeadingWs (builtins.substring 1 (builtins.stringLength s - 1) s)
        else
          s;
      # Body of a just recipe: lines after "${name}:" that are empty or indented.
      extractJustRecipeBody =
        content: recipeName:
        let
          lines = lib.splitString "\n" content;
          headerExact = recipeName + ":";
          startIdx =
            lib.findFirst (
              i: builtins.elemAt lines i == headerExact
              || lib.hasPrefix (headerExact) (builtins.elemAt lines i)
            ) null (lib.range 0 (builtins.length lines - 1));
          after =
            if startIdx == null then
              null
            else
              lib.drop (startIdx + 1) lines;
          takeBody =
            ls:
            if ls == [ ] then
              [ ]
            else
              let
                h = builtins.head ls;
                t = builtins.tail ls;
              in
              if h == "" || lib.hasPrefix " " h || lib.hasPrefix "\t" h then
                [ h ] ++ takeBody t
              else
                [ ];
        in
        if after == null then null else takeBody after;
      installBodyLines =
        if installRecipe == null then
          null
        else
          extractJustRecipeBody installRecipe "install-freestanding-c-out";
      lakeCmdViolations =
        if installBodyLines == null then
          [
            "SELF-HOST-PRODUCT-PATH-PERFORM-STEP: justfile: missing install-freestanding-c-out recipe body"
          ]
        else
          lib.concatMap (
            line:
            let
              t = stripLeadingWs line;
            in
            lib.concatMap (
              pref:
              if lib.hasPrefix pref t then
                [
                  "SELF-HOST-PRODUCT-PATH-PERFORM-STEP: install-freestanding-c-out body forbids command starting with '${pref}'"
                ]
              else
                [ ]
            ) productPathPerformStepInstallForbiddenCmdPrefixes
          ) installBodyLines;
    in
    (scan "src/systems/self-host.md" accept productPathPerformStepAcceptanceTokens)
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathPerformStepPartialReady"
      "SELF-HOST-PRODUCT-PATH-PERFORM-STEP"
      "productPathPerformInstallLakeFreeEntrypointClaimed"
      "def productPathPerformInstallLakeFreeEntrypointClaimed : Bool := true"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def productPathPerformDependsOnLake : Bool := true"
      "productPathPerformPartialReady"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "ProductPathPerformStep"
      "theorem productPathPerformStepPartialReady_true"
    ])
    ++ (scan productPathPerformStepModulePath stepMod productPathPerformStepModuleTokens)
    ++ (forbid productPathPerformStepModulePath stepMod productPathPerformStepModuleForbiddenTokens)
    ++ (scan productPathPerformStepInstallPath installRecipe productPathPerformStepInstallTokens)
    ++ lakeCmdViolations
    ++ (
      if residualFreeReleasePresent && productPathPerformViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-PERFORM-STEP: product path perform gap not green (B9 required when release present)"
        ]
      else
        [ ]
    );

  productPathPerformStepGreen = productPathPerformStepViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-PERFORM-READ / first READ-SSOT substrate (partial B11):
  # ProductPathReadSsot reads Mult..Out dual SSOT via IO.FS.readFile only.
  # Structural: read module has read tokens; forbids FreestandingEmit write path
  # symbols; lakefile + just entrypoint; host pin read ready; when release
  # present, B10 step green. perform claimed false; ReadDependsOnLake true.
  # Dual-pin thin batch 10: historical Ok/stage/moduleCite/recipe/exe/fn/gap
  # path strings on ProductPathReadSsot only. Tip hostPin is fold/claim chain
  # only (productPathPerformReadPartialReady + ReadEntrypointClaimed true +
  # ReadDependsOnLake true + living perform claimed + DependsOnLake + B10 step
  # + B8 ownership + B4 remains + import cite + theorem).
  productPathPerformReadViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      readMod = readRel productPathPerformReadModulePath;
      lakeToml = readRel productPathPerformReadLakefilePath;
      justFile = readRel productPathPerformReadJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-READ: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-PERFORM-READ: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-READ: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-PERFORM-READ: ${rel}: forbidden product-write token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathPerformReadAcceptanceTokens)
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathPerformReadPartialReady"
      "SELF-HOST-PRODUCT-PATH-PERFORM-READ"
      "productPathPerformReadEntrypointClaimed"
      "def productPathPerformReadEntrypointClaimed : Bool := true"
      "productPathPerformReadDependsOnLake"
      "def productPathPerformReadDependsOnLake : Bool := true"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def productPathPerformDependsOnLake : Bool := true"
      "productPathPerformStepPartialReady"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "ProductPathReadSsot"
      "theorem productPathPerformReadPartialReady_true"
    ])
    ++ (scan productPathPerformReadModulePath readMod productPathPerformReadModuleTokens)
    ++ (forbid productPathPerformReadModulePath readMod productPathPerformReadModuleForbiddenTokens)
    ++ (scan productPathPerformReadLakefilePath lakeToml productPathPerformReadLakefileTokens)
    ++ (scan productPathPerformReadJustPath justFile productPathPerformReadJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathPerformStepViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-PERFORM-READ: product path perform step not green (B10 required when release present)"
        ]
      else
        [ ]
    );

  productPathPerformReadGreen = productPathPerformReadViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE / first COMPOSE substrate (partial B12):
  # ProductPathComposePlan composes plan/apply/body dual SSOT in-memory.
  # Structural: compose module has compose tokens; forbids FreestandingEmit write
  # path symbols; lakefile + just entrypoint; host pin compose ready; when release
  # present, B11 read green. perform claimed false; ComposeDependsOnLake true.
  # Dual-pin thin batch 11: historical Ok/stage/moduleCite/recipe/exe/fn/gap
  # path strings on ProductPathComposePlan only. Tip hostPin is fold/claim chain
  # only (productPathPerformComposePartialReady + ComposeEntrypointClaimed true +
  # ComposeDependsOnLake true + living perform claimed + DependsOnLake + B11 read
  # + B8 ownership + B4 remains + import cite + theorem).
  productPathPerformComposeViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      composeMod = readRel productPathPerformComposeModulePath;
      lakeToml = readRel productPathPerformComposeLakefilePath;
      justFile = readRel productPathPerformComposeJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE: ${rel}: forbidden product-write token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathPerformComposeAcceptanceTokens)
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathPerformComposePartialReady"
      "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE"
      "productPathPerformComposeEntrypointClaimed"
      "def productPathPerformComposeEntrypointClaimed : Bool := true"
      "productPathPerformComposeDependsOnLake"
      "def productPathPerformComposeDependsOnLake : Bool := true"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def productPathPerformDependsOnLake : Bool := true"
      "productPathPerformReadPartialReady"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "ProductPathComposePlan"
      "theorem productPathPerformComposePartialReady_true"
    ])
    ++ (scan productPathPerformComposeModulePath composeMod productPathPerformComposeModuleTokens)
    ++ (forbid productPathPerformComposeModulePath composeMod productPathPerformComposeModuleForbiddenTokens)
    ++ (scan productPathPerformComposeLakefilePath lakeToml productPathPerformComposeLakefileTokens)
    ++ (scan productPathPerformComposeJustPath justFile productPathPerformComposeJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathPerformReadViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE: product path perform READ not green (B11 required when release present)"
        ]
      else
        [ ]
    );

  productPathPerformComposeGreen = productPathPerformComposeViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC / first WRITE-HC substrate (partial B13):
  # ProductPathWriteHc wraps FreestandingEmit.emitAtRoot for emit .h/.c write only.
  # Structural: write module has write tokens + FreestandingEmit import; forbids
  # install-out theater and dishonest complete/perform/ownership true pins;
  # lakefile + just entrypoint; host pin write ready; when release present, B12
  # compose green. perform claimed false; WriteHcDependsOnLake true.
  # Dual-pin thin batch 12: historical Ok/stage/moduleCite/recipe/exe/fn/gap
  # path strings on ProductPathWriteHc only. Tip hostPin is fold/claim chain
  # only (productPathPerformWriteHcPartialReady + WriteHcEntrypointClaimed true +
  # WriteHcDependsOnLake true + living perform claimed + DependsOnLake + B12 compose
  # + B8 ownership + B4 remains + import cite + theorem).
  productPathPerformWriteHcViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      writeMod = readRel productPathPerformWriteHcModulePath;
      lakeToml = readRel productPathPerformWriteHcLakefilePath;
      justFile = readRel productPathPerformWriteHcJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC: ${rel}: forbidden dishonest/install token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathPerformWriteHcAcceptanceTokens)
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathPerformWriteHcPartialReady"
      "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC"
      "productPathPerformWriteHcEntrypointClaimed"
      "def productPathPerformWriteHcEntrypointClaimed : Bool := true"
      "productPathPerformWriteHcDependsOnLake"
      "def productPathPerformWriteHcDependsOnLake : Bool := true"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def productPathPerformDependsOnLake : Bool := true"
      "productPathPerformComposePartialReady"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "ProductPathWriteHc"
      "theorem productPathPerformWriteHcPartialReady_true"
    ])
    ++ (scan productPathPerformWriteHcModulePath writeMod productPathPerformWriteHcModuleTokens)
    ++ (forbid productPathPerformWriteHcModulePath writeMod productPathPerformWriteHcModuleForbiddenTokens)
    ++ (scan productPathPerformWriteHcLakefilePath lakeToml productPathPerformWriteHcLakefileTokens)
    ++ (scan productPathPerformWriteHcJustPath justFile productPathPerformWriteHcJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathPerformComposeViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC: product path perform COMPOSE not green (B12 required when release present)"
        ]
      else
        [ ]
    );

  productPathPerformWriteHcGreen = productPathPerformWriteHcViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP / freestanding-capable measure (partial B14):
  # Capable + SelfApplyFs pins prove install Lake-free true;
  # CapableRead/Compose/WriteHc true after B26..B28; full perform false. just
  # regenerate-product-path + freestanding-capable-gap + Lake-free Capable* recipes;
  # when release present, B13 write-hc green. perform claimed false; complete false.
  # Dual-pin thin batch 13: historical Ok/stage/moduleCite/recipe/exe/LakeFree
  # path strings on Capable only. Tip hostPin is fold/claim chain only
  # (productPathFreestandingCapablePartialReady + InstallOnly/Read/Compose/WriteHc
  # true + FullPerform false + living perform claimed + DependsOnLake + B13 WriteHc
  # + B8 ownership + B4 remains + import cite + theorem).
  productPathFreestandingCapableViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      gapMod = readRel productPathFreestandingCapableModulePath;
      lakeToml = readRel productPathFreestandingCapableLakefilePath;
      justFile = readRel productPathFreestandingCapableJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingCapableAcceptanceTokens)
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingCapablePartialReady"
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP"
      "def productPathFreestandingCapableInstallOnly : Bool := true"
      "def productPathFreestandingCapableRead : Bool := true"
      "def productPathFreestandingCapableCompose : Bool := true"
      "def productPathFreestandingCapableWriteHc : Bool := true"
      "def productPathFreestandingCapableFullPerform : Bool := false"
      "Capable"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def productPathPerformDependsOnLake : Bool := true"
      "productPathPerformWriteHcPartialReady"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "theorem productPathFreestandingCapablePartialReady_true"
    ])
    ++ (scan productPathFreestandingCapableModulePath gapMod productPathFreestandingCapableModuleTokens)
    ++ (forbid productPathFreestandingCapableModulePath gapMod productPathFreestandingCapableModuleForbiddenTokens)
    ++ (scan productPathFreestandingCapableLakefilePath lakeToml productPathFreestandingCapableLakefileTokens)
    ++ (scan productPathFreestandingCapableJustPath justFile productPathFreestandingCapableJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathPerformWriteHcViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP: product path perform WRITE-HC not green (B13 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingCapableGreen = productPathFreestandingCapableViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT / step contract (partial B15;
  # evolved B16..B18: ReadSatisfied + ComposeSatisfied + WriteHcSatisfied true; Full false):
  # Dual-pin thin batch 14: historical Ok/stage/moduleCite/recipe/exe/contract-step/
  # blocker/API path strings on CapableStepContract only. Tip hostPin is fold/claim
  # chain only (PartialReady + AuthorityNotEmit/Read/Compose/WriteHc true +
  # FullSatisfied false + stepContractFull true + living perform claimed +
  # DependsOnLake + B14 Capable + B8 ownership + B4 remains + import cite + theorem).
  # when release present, B14 green.
  productPathFreestandingCapableStepContractViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      contractMod = readRel productPathFreestandingCapableStepContractModulePath;
      lakeToml = readRel productPathFreestandingCapableStepContractLakefilePath;
      justFile = readRel productPathFreestandingCapableStepContractJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingCapableStepContractAcceptanceTokens)
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingCapableStepContractPartialReady"
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT"
      "def productPathFreestandingCapableStepContractAuthorityNotEmit : Bool := true"
      "def productPathFreestandingCapableStepContractReadSatisfied : Bool := true"
      "def productPathFreestandingCapableStepContractComposeSatisfied : Bool := true"
      "def productPathFreestandingCapableStepContractWriteHcSatisfied : Bool := true"
      "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false"
      "def stepContractFull : Bool := true"
      "CapableStepContract"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def productPathPerformDependsOnLake : Bool := true"
      "productPathFreestandingCapablePartialReady"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "theorem productPathFreestandingCapableStepContractPartialReady_true"
    ])
    ++ (scan productPathFreestandingCapableStepContractModulePath contractMod productPathFreestandingCapableStepContractModuleTokens)
    ++ (forbid productPathFreestandingCapableStepContractModulePath contractMod productPathFreestandingCapableStepContractModuleForbiddenTokens)
    ++ (scan productPathFreestandingCapableStepContractLakefilePath lakeToml productPathFreestandingCapableStepContractLakefileTokens)
    ++ (scan productPathFreestandingCapableStepContractJustPath justFile productPathFreestandingCapableStepContractJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingCapableViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT: freestanding-capable gap not green (B14 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingCapableStepContractGreen =
    productPathFreestandingCapableStepContractViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ / freestanding-capable READ
  # (partial B16 + B26 CapableRead Lake-free):
  # Dual-pin thin batch 15: historical Ok/stage/host/recipe/exe/moduleCite/FnCite
  # on CapableRead only. Tip hostPin is fold/claim chain only (PartialReady +
  # EntrypointClaimed/AuthorityNotEmit/DependsOnLake true + ReadSatisfied +
  # B14 CapableRead + living perform/complete/ownership + B15 step-contract fold +
  # import cite + theorem). freestandingCapableReadDualSsot without
  # FreestandingEmit; when release present, B15 green.
  productPathFreestandingCapableReadViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      readMod = readRel productPathFreestandingCapableReadModulePath;
      lakeToml = readRel productPathFreestandingCapableReadLakefilePath;
      justFile = readRel productPathFreestandingCapableReadJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingCapableReadAcceptanceTokens)
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingCapableReadPartialReady"
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ"
      "def productPathFreestandingCapableReadEntrypointClaimed : Bool := true"
      "def productPathFreestandingCapableReadAuthorityNotEmit : Bool := true"
      "def productPathFreestandingCapableReadDependsOnLake : Bool := true"
      "def productPathFreestandingCapableStepContractReadSatisfied : Bool := true"
      "def productPathFreestandingCapableRead : Bool := true"
      "CapableRead"
      "freestandingCapableReadDualSsot"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "productPathFreestandingCapableStepContractPartialReady"
      "theorem productPathFreestandingCapableReadPartialReady_true"
    ])
    ++ (scan productPathFreestandingCapableReadModulePath readMod productPathFreestandingCapableReadModuleTokens)
    ++ (forbid productPathFreestandingCapableReadModulePath readMod productPathFreestandingCapableReadModuleForbiddenTokens)
    ++ (scan productPathFreestandingCapableReadLakefilePath lakeToml productPathFreestandingCapableReadLakefileTokens)
    ++ (scan productPathFreestandingCapableReadJustPath justFile productPathFreestandingCapableReadJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingCapableStepContractViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ: freestanding-capable step contract not green (B15 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingCapableReadGreen =
    productPathFreestandingCapableReadViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE / freestanding-capable COMPOSE
  # (partial B17 + B27 CapableCompose Lake-free): CapableCompose
  # freestandingCapableComposePlanApplyBody without FreestandingEmit; ComposeSatisfied
  # true; B14 CapableCompose true after B27 freestanding-capable-compose-lake-free;
  # when release present, B16 green. perform claimed false; complete false.
  productPathFreestandingCapableComposeViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      composeMod = readRel productPathFreestandingCapableComposeModulePath;
      lakeToml = readRel productPathFreestandingCapableComposeLakefilePath;
      justFile = readRel productPathFreestandingCapableComposeJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingCapableComposeAcceptanceTokens)
    # Dual-pin thin batch 16: tip hostPin is fold/claim chain only (PartialReady +
    # honesty bools + ComposeSatisfied + B14 CapableCompose + living claims +
    # B16 Read fold + import cite + theorem). Ok/stage/recipe/exe home-primary.
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingCapableComposePartialReady"
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE"
      "def productPathFreestandingCapableComposeEntrypointClaimed : Bool := true"
      "def productPathFreestandingCapableComposeAuthorityNotEmit : Bool := true"
      "def productPathFreestandingCapableComposeDependsOnLake : Bool := true"
      "def productPathFreestandingCapableStepContractComposeSatisfied : Bool := true"
      "def productPathFreestandingCapableCompose : Bool := true"
      "CapableCompose"
      "freestandingCapableComposePlanApplyBody"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "productPathFreestandingCapableReadPartialReady"
      "theorem productPathFreestandingCapableComposePartialReady_true"
    ])
    ++ (scan productPathFreestandingCapableComposeModulePath composeMod productPathFreestandingCapableComposeModuleTokens)
    ++ (forbid productPathFreestandingCapableComposeModulePath composeMod productPathFreestandingCapableComposeModuleForbiddenTokens)
    ++ (scan productPathFreestandingCapableComposeLakefilePath lakeToml productPathFreestandingCapableComposeLakefileTokens)
    ++ (scan productPathFreestandingCapableComposeJustPath justFile productPathFreestandingCapableComposeJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingCapableReadViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE: freestanding-capable READ not green (B16 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingCapableComposeGreen =
    productPathFreestandingCapableComposeViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC / freestanding-capable WRITE-HC
  # (partial B18 + B28 CapableWriteHc): CapableWriteHc
  # freestandingCapableWriteFreestandingHc without FreestandingEmit; WriteHcSatisfied
  # true; B14 CapableWriteHc true after freestanding-capable-write-hc-lake-free; when
  # release present, B17 green. perform claimed false; complete false.
  productPathFreestandingCapableWriteHcViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      writeMod = readRel productPathFreestandingCapableWriteHcModulePath;
      writeLoad = readRel productPathFreestandingCapableWriteHcLoadPath;
      lakeToml = readRel productPathFreestandingCapableWriteHcLakefilePath;
      justFile = readRel productPathFreestandingCapableWriteHcJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingCapableWriteHcAcceptanceTokens)
    # Dual-pin thin batch 17: tip hostPin is fold/claim chain only (PartialReady +
    # honesty bools + WriteHcSatisfied + B14 CapableWriteHc + living claims +
    # B17 Compose fold + import cite + theorem). Ok/stage/recipe/exe home-primary.
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingCapableWriteHcPartialReady"
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC"
      "def productPathFreestandingCapableWriteHcEntrypointClaimed : Bool := true"
      "def productPathFreestandingCapableWriteHcAuthorityNotEmit : Bool := true"
      "def productPathFreestandingCapableWriteHcDependsOnLake : Bool := true"
      "def productPathFreestandingCapableStepContractWriteHcSatisfied : Bool := true"
      "def productPathFreestandingCapableWriteHc : Bool := true"
      "CapableWriteHc"
      "freestandingCapableWriteFreestandingHc"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "productPathFreestandingCapableComposePartialReady"
      "theorem productPathFreestandingCapableWriteHcPartialReady_true"
    ])
    ++ (scan productPathFreestandingCapableWriteHcModulePath writeMod productPathFreestandingCapableWriteHcModuleTokens)
    ++ (scan productPathFreestandingCapableWriteHcLoadPath writeLoad productPathFreestandingCapableWriteHcLoadTokens)
    ++ (forbid productPathFreestandingCapableWriteHcModulePath writeMod productPathFreestandingCapableWriteHcModuleForbiddenTokens)
    ++ (scan productPathFreestandingCapableWriteHcLakefilePath lakeToml productPathFreestandingCapableWriteHcLakefileTokens)
    ++ (scan productPathFreestandingCapableWriteHcJustPath justFile productPathFreestandingCapableWriteHcJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingCapableComposeViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC: freestanding-capable COMPOSE not green (B17 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingCapableWriteHcGreen =
    productPathFreestandingCapableWriteHcViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE / freestanding-capable
  # ordered regenerate (partial B19): CapableRegenerate
  # freestandingCapableOrderedRegenerate (READ then COMPOSE then WRITE-HC) without
  # FreestandingEmit; Full false; Install Out open; when release present, B18 green.
  # perform claimed false; complete false.
  productPathFreestandingCapableRegenerateViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      regenMod = readRel productPathFreestandingCapableRegenerateModulePath;
      lakeToml = readRel productPathFreestandingCapableRegenerateLakefilePath;
      justFile = readRel productPathFreestandingCapableRegenerateJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingCapableRegenerateAcceptanceTokens)
    # Dual-pin thin batch 18: tip hostPin is fold/claim chain only (PartialReady +
    # honesty bools + InstallOutOpen false + living claims + B18 WriteHc fold +
    # import cite + theorem). Ok/stage/recipe/exe/pipeline home-primary.
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingCapableRegeneratePartialReady"
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE"
      "def productPathFreestandingCapableRegenerateEntrypointClaimed : Bool := true"
      "def productPathFreestandingCapableRegenerateAuthorityNotEmit : Bool := true"
      "def productPathFreestandingCapableRegenerateDependsOnLake : Bool := true"
      "def productPathFreestandingCapableRegenerateInstallOutOpen : Bool := false"
      "def stepContractFull : Bool := true"
      "CapableRegenerate"
      "freestandingCapableOrderedRegenerate"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "productPathFreestandingCapableWriteHcPartialReady"
      "theorem productPathFreestandingCapableRegeneratePartialReady_true"
    ])
    ++ (scan productPathFreestandingCapableRegenerateModulePath regenMod productPathFreestandingCapableRegenerateModuleTokens)
    ++ (forbid productPathFreestandingCapableRegenerateModulePath regenMod productPathFreestandingCapableRegenerateModuleForbiddenTokens)
    ++ (scan productPathFreestandingCapableRegenerateLakefilePath lakeToml productPathFreestandingCapableRegenerateLakefileTokens)
    ++ (scan productPathFreestandingCapableRegenerateJustPath justFile productPathFreestandingCapableRegenerateJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingCapableWriteHcViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE: freestanding-capable WRITE-HC not green (B18 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingCapableRegenerateGreen =
    productPathFreestandingCapableRegenerateViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT / freestanding-capable
  # Install Out (partial B20): InstallOut
  # freestandingCapableInstallFreestandingOut without FreestandingEmit; Full false;
  # InstallOutOpen false; when release present, B19 green.
  # perform claimed false; complete false.
  productPathFreestandingCapableInstallOutViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      installMod = readRel productPathFreestandingCapableInstallOutModulePath;
      lakeToml = readRel productPathFreestandingCapableInstallOutLakefilePath;
      justFile = readRel productPathFreestandingCapableInstallOutJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingCapableInstallOutAcceptanceTokens)
    # Dual-pin thin batch 19: tip hostPin is fold/claim chain only (PartialReady +
    # honesty bools + InstallOutOpen false (B19 name) + living claims + B19
    # regenerate fold + import cite + theorem). Ok/stage/recipe/exe/step home-primary.
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingCapableInstallOutPartialReady"
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT"
      "def productPathFreestandingCapableInstallOutEntrypointClaimed : Bool := true"
      "def productPathFreestandingCapableInstallOutAuthorityNotEmit : Bool := true"
      "def productPathFreestandingCapableInstallOutDependsOnLake : Bool := true"
      "def productPathFreestandingCapableRegenerateInstallOutOpen : Bool := false"
      "def stepContractFull : Bool := true"
      "InstallOut"
      "freestandingCapableInstallFreestandingOut"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "productPathFreestandingCapableRegeneratePartialReady"
      "theorem productPathFreestandingCapableInstallOutPartialReady_true"
    ])
    ++ (scan productPathFreestandingCapableInstallOutModulePath installMod productPathFreestandingCapableInstallOutModuleTokens)
    ++ (forbid productPathFreestandingCapableInstallOutModulePath installMod productPathFreestandingCapableInstallOutModuleForbiddenTokens)
    ++ (scan productPathFreestandingCapableInstallOutLakefilePath lakeToml productPathFreestandingCapableInstallOutLakefileTokens)
    ++ (scan productPathFreestandingCapableInstallOutJustPath justFile productPathFreestandingCapableInstallOutJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingCapableRegenerateViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT: freestanding-capable ordered regenerate not green (B19 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingCapableInstallOutGreen =
    productPathFreestandingCapableInstallOutViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR / Full bar measure (partial B21):
  # CapableFullBar closed vs open Full-bar pins; Full false;
  # when release present, B20 green. perform claimed false; complete false.
  productPathFreestandingCapableFullBarViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      fullBarMod = readRel productPathFreestandingCapableFullBarModulePath;
      lakeToml = readRel productPathFreestandingCapableFullBarLakefilePath;
      justFile = readRel productPathFreestandingCapableFullBarJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingCapableFullBarAcceptanceTokens)
    # Dual-pin thin batch 20: tip hostPin is fold/claim chain only (PartialReady +
    # closed-substrate honesty + DependsOnLake + living claims + B20 InstallOut
    # fold + import cite + theorem). Ok/stage/recipe/exe/Req* home-primary.
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingCapableFullBarPartialReady"
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR"
      "def productPathFreestandingCapableFullBarStepContractsClosed : Bool := true"
      "def productPathFreestandingCapableFullBarInstallOutClosed : Bool := true"
      "def productPathFreestandingCapableFullBarOrderedPipelineJoined : Bool := true"
      "def productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake : Bool := true"
      "def productPathFreestandingCapableFullBarCapableLakeFree : Bool := true"
      "def productPathFreestandingCapableFullBarDependsOnLake : Bool := true"
      "def stepContractFull : Bool := true"
      "CapableFullBar"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "productPathFreestandingCapableInstallOutPartialReady"
      "theorem productPathFreestandingCapableFullBarPartialReady_true"
    ])
    ++ (scan productPathFreestandingCapableFullBarModulePath fullBarMod productPathFreestandingCapableFullBarModuleTokens)
    ++ (forbid productPathFreestandingCapableFullBarModulePath fullBarMod productPathFreestandingCapableFullBarModuleForbiddenTokens)
    ++ (scan productPathFreestandingCapableFullBarLakefilePath lakeToml productPathFreestandingCapableFullBarLakefileTokens)
    ++ (scan productPathFreestandingCapableFullBarJustPath justFile productPathFreestandingCapableFullBarJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingCapableInstallOutViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR: freestanding-capable Install Out not green (B20 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingCapableFullBarGreen =
    productPathFreestandingCapableFullBarViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE / ownership regenerate (partial B22..B30):
  # ProductPathOwnershipRegenerate install Lake-free true + READ Lake-free true (B23
  # ownership-regenerate-read-only) + COMPOSE Lake-free true (B24
  # ownership-regenerate-compose-only) + WRITE-HC Lake-free true (B25
  # ownership-regenerate-write-hc-only) + B29 ordered Lake-free join claimed
  # (ownership-regenerate-lake-free) + B30 product path authority claimed
  # (ownership-regenerate-product-path-authority); WithoutLake true; freestanding
  # Capable* true after B26..B28 via distinct freestanding-capable-*-lake-free
  # recipes; when release present, B21 green. ownership claimed false.
  productPathOwnershipRegenerateViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      ownMod = readRel productPathOwnershipRegenerateModulePath;
      lakeToml = readRel productPathOwnershipRegenerateLakefilePath;
      justFile = readRel productPathOwnershipRegenerateJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
      # Independent Lake-free dual SSOT presence+token walk (B23 process evidence;
      # pure Nix; does not invoke lake). Pairs match ProductPathReadSsot.dualSsotSpecs.
      dualSsotPairs = [
        { base = "host_emit_mult.ssot.txt"; token = "HOST-EMIT-MULT"; }
        { base = "host_emit_linear.ssot.txt"; token = "HOST-EMIT-LINEAR"; }
        { base = "host_emit_erasure.ssot.txt"; token = "HOST-EMIT-ERASURE"; }
        { base = "host_emit_extract.ssot.txt"; token = "HOST-EMIT-EXTRACT"; }
        { base = "host_emit_types.ssot.txt"; token = "HOST-EMIT-TYPES"; }
        { base = "host_emit_program.ssot.txt"; token = "HOST-EMIT-PROGRAM"; }
        { base = "host_emit_graph.ssot.txt"; token = "HOST-EMIT-GRAPH"; }
        { base = "host_emit_compose.ssot.txt"; token = "HOST-EMIT-COMPOSE"; }
        { base = "host_emit_plan.ssot.txt"; token = "HOST-EMIT-PLAN"; }
        { base = "host_emit_apply.ssot.txt"; token = "HOST-EMIT-APPLY"; }
        { base = "host_emit_body_fragment.ssot.txt"; token = "HOST-EMIT-SSOT"; }
        { base = "host_emit_banner.ssot.txt"; token = "HOST-EMIT-BANNER"; }
      ];
      dualSsotWalkViolations = lib.concatMap (
        p:
        let
          rel = "src/systems/emit/${p.base}";
          content = readRel rel;
        in
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: dual SSOT missing ${rel} (B23 Lake-free READ)" ]
        else if content == "" then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: dual SSOT empty ${rel} (B23 Lake-free READ)" ]
        else if !(has p.token content) then
          [
            "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: dual SSOT ${rel}: missing token ${p.token} (B23 Lake-free READ)"
          ]
        else
          [ ]
      ) dualSsotPairs;
      # Independent Lake-free plan/apply/body compose SSOT walk (B24 process evidence;
      # pure Nix; does not invoke lake). Pairs match ProductPathComposePlan.planApplyBodySpecs.
      composeSsotPairs = [
        { base = "host_emit_plan.ssot.txt"; token = "HOST-EMIT-PLAN"; }
        { base = "host_emit_apply.ssot.txt"; token = "HOST-EMIT-APPLY"; }
        { base = "host_emit_body_fragment.ssot.txt"; token = "HOST-EMIT-BODY"; }
      ];
      composeSsotWalkViolations = lib.concatMap (
        p:
        let
          rel = "src/systems/emit/${p.base}";
          content = readRel rel;
        in
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: compose SSOT missing ${rel} (B24 Lake-free COMPOSE)" ]
        else if content == "" then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: compose SSOT empty ${rel} (B24 Lake-free COMPOSE)" ]
        else if !(has p.token content) then
          [
            "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: compose SSOT ${rel}: missing token ${p.token} (B24 Lake-free COMPOSE)"
          ]
        else
          [ ]
      ) composeSsotPairs;
      # Independent Lake-free freestanding .h/.c write-hc walk (B25 process evidence;
      # pure Nix; does not invoke lake). Basenames match ProductPathWriteHc
      # emitHeaderBase / emitSourceBase; stage token SLAKE_EMIT_FREESTANDING_C_V0.
      writeHcPairs = [
        { base = "slake_freestanding.h"; token = "SLAKE_EMIT_FREESTANDING_C_V0"; }
        { base = "slake_freestanding.c"; token = "SLAKE_EMIT_FREESTANDING_C_V0"; }
      ];
      writeHcWalkViolations = lib.concatMap (
        p:
        let
          rel = "src/systems/emit/${p.base}";
          content = readRel rel;
        in
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: write-hc missing ${rel} (B25 Lake-free WRITE-HC)" ]
        else if content == "" then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: write-hc empty ${rel} (B25 Lake-free WRITE-HC)" ]
        else if !(has p.token content) then
          [
            "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: write-hc ${rel}: missing token ${p.token} (B25 Lake-free WRITE-HC)"
          ]
        else
          [ ]
      ) writeHcPairs;
      # Recipe body must advertise Lake-free (no lake build/exe). Measure recipe
      # may still use lake; these strings are unique to the Lake-free path recipes.
      justReadLakeFreeBanner =
        "Lake-free: no lake build/exe; dual SSOT presence+token only";
      justComposeLakeFreeBanner =
        "Lake-free: no lake build/exe; plan/apply/body dual SSOT presence+token only";
      justWriteHcLakeFreeBanner =
        "Lake-free: no lake build/exe; freestanding .h/.c presence+token only";
      justReadLakeFreeBannerViolations =
        if justFile == null then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: missing justfile" ]
        else if has justReadLakeFreeBanner justFile then
          [ ]
        else
          [
            "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: justfile: missing Lake-free READ banner '${justReadLakeFreeBanner}'"
          ];
      justComposeLakeFreeBannerViolations =
        if justFile == null then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: missing justfile" ]
        else if has justComposeLakeFreeBanner justFile then
          [ ]
        else
          [
            "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: justfile: missing Lake-free COMPOSE banner '${justComposeLakeFreeBanner}'"
          ];
      justWriteHcLakeFreeBannerViolations =
        if justFile == null then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: missing justfile" ]
        else if has justWriteHcLakeFreeBanner justFile then
          [ ]
        else
          [
            "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: justfile: missing Lake-free WRITE-HC banner '${justWriteHcLakeFreeBanner}'"
          ];
    in
    (scan "src/systems/self-host.md" accept productPathOwnershipRegenerateAcceptanceTokens)
    # Dual-pin thin batch 21: tip hostPin is fold/claim chain only (PartialReady +
    # honesty bools + living claims + B21 FullBar fold + import cite + theorem).
    # Ok/stage/recipe/exe/OWNERSHIP-REGENERATE-* step ids home-primary.
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathOwnershipRegeneratePartialReady"
      "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE"
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
      # B26 dual-pin: ownership READ Lake-free coexists with CapableRead true.
      "def productPathFreestandingCapableRead : Bool := true"
      "freestanding-capable-read-lake-free"
      # B27 dual-pin: ownership COMPOSE Lake-free coexists with CapableCompose true.
      "def productPathFreestandingCapableCompose : Bool := true"
      "freestanding-capable-compose-lake-free"
      # B28 dual-pin: ownership WRITE-HC Lake-free coexists with CapableWriteHc true.
      "def productPathFreestandingCapableWriteHc : Bool := true"
      "freestanding-capable-write-hc-lake-free"
      # B30 dual-pin: product path authority + WithoutLake (FullBar dual-pin).
      "def productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake : Bool := true"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "productPathFreestandingCapableFullBarPartialReady"
      "theorem productPathOwnershipRegeneratePartialReady_true"
    ])
    ++ (scan productPathOwnershipRegenerateModulePath ownMod productPathOwnershipRegenerateModuleTokens)
    ++ (forbid productPathOwnershipRegenerateModulePath ownMod productPathOwnershipRegenerateModuleForbiddenTokens)
    ++ (scan productPathOwnershipRegenerateLakefilePath lakeToml productPathOwnershipRegenerateLakefileTokens)
    ++ (scan productPathOwnershipRegenerateJustPath justFile productPathOwnershipRegenerateJustTokens)
    ++ dualSsotWalkViolations
    ++ composeSsotWalkViolations
    ++ writeHcWalkViolations
    ++ justReadLakeFreeBannerViolations
    ++ justComposeLakeFreeBannerViolations
    ++ justWriteHcLakeFreeBannerViolations
    ++ (
      if residualFreeReleasePresent && productPathFreestandingCapableFullBarViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: freestanding-capable Full bar not green (B21 required when release present)"
        ]
      else
        [ ]
    );

  productPathOwnershipRegenerateGreen =
    productPathOwnershipRegenerateViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE / freestanding perform evidence (partial B31):
  # PerformEvidence evidence claimed true; perform claimed
  # false; DependsOnLake true; freestanding-perform-evidence Lake-free recipe;
  # when release present, B30 ownership regenerate green.
  productPathFreestandingPerformEvidenceViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      evMod = readRel productPathFreestandingPerformEvidenceModulePath;
      lakeToml = readRel productPathFreestandingPerformEvidenceLakefilePath;
      justFile = readRel productPathFreestandingPerformEvidenceJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingPerformEvidenceAcceptanceTokens)
    # Dual-pin thin batch 22: tip hostPin is fold/claim chain only (PartialReady +
    # EvidenceClaimed + living perform/DependsOnLake/ownership/complete + B30
    # OwnershipRegenerate fold + import cite + theorem). Ok/stage/recipe/exe/
    # FREESTANDING-PERFORM-EVIDENCE-* step ids home-primary.
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingPerformEvidencePartialReady"
      "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE"
      "def productPathFreestandingPerformEvidenceClaimed : Bool := true"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def productPathPerformDependsOnLake : Bool := true"
      "PerformEvidence"
      "productPathOwnershipRegeneratePartialReady"
      "def productPathOwnershipRegenerateProductPathAuthorityClaimed : Bool := true"
      "def productPathOwnershipRegenerateWithoutLake : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "theorem productPathFreestandingPerformEvidencePartialReady_true"
    ])
    ++ (scan productPathFreestandingPerformEvidenceModulePath evMod productPathFreestandingPerformEvidenceModuleTokens)
    ++ (forbid productPathFreestandingPerformEvidenceModulePath evMod productPathFreestandingPerformEvidenceModuleForbiddenTokens)
    ++ (scan productPathFreestandingPerformEvidenceLakefilePath lakeToml productPathFreestandingPerformEvidenceLakefileTokens)
    ++ (scan productPathFreestandingPerformEvidenceJustPath justFile productPathFreestandingPerformEvidenceJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathOwnershipRegenerateViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE: ownership regenerate not green (B30 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingPerformEvidenceGreen =
    productPathFreestandingPerformEvidenceViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH / official-path gap (partial B32):
  # OfficialPath gap measured true; perform claimed
  # false; DependsOnLake true; land-time B32 FreestandingEmit official pin;
  # living tip B38 FreestandingEmit retired; freestanding-perform-official-path
  # Lake-free recipe; when release present, B31 perform evidence green.
  productPathFreestandingPerformOfficialPathViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      gapMod = readRel productPathFreestandingPerformOfficialPathModulePath;
      lakeToml = readRel productPathFreestandingPerformOfficialPathLakefilePath;
      justFile = readRel productPathFreestandingPerformOfficialPathJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingPerformOfficialPathAcceptanceTokens)
    # Dual-pin thin batch 23: tip hostPin is fold/claim chain only (PartialReady +
    # GapMeasured + living StillUses false / Retire false / StillUsesLake + living
    # claims + B31 Evidence fold + import cite + theorem). Ok/stage/recipe/exe/
    # FREESTANDING-PERFORM-OFFICIAL-PATH-* step ids home-primary (land-time StillUses true).
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingPerformOfficialPathPartialReady"
      "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH"
      "def productPathFreestandingPerformOfficialPathGapMeasured : Bool := true"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def productPathPerformDependsOnLake : Bool := true"
      "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
      "def productPathOfficialPathStillUsesLake : Bool := true"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "OfficialPath"
      "productPathFreestandingPerformEvidencePartialReady"
      "def productPathFreestandingPerformEvidenceClaimed : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "theorem productPathFreestandingPerformOfficialPathPartialReady_true"
    ])
    ++ (scan productPathFreestandingPerformOfficialPathModulePath gapMod productPathFreestandingPerformOfficialPathModuleTokens)
    ++ (forbid productPathFreestandingPerformOfficialPathModulePath gapMod productPathFreestandingPerformOfficialPathModuleForbiddenTokens)
    ++ (scan productPathFreestandingPerformOfficialPathLakefilePath lakeToml productPathFreestandingPerformOfficialPathLakefileTokens)
    ++ (scan productPathFreestandingPerformOfficialPathJustPath justFile productPathFreestandingPerformOfficialPathJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingPerformEvidenceViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH: perform evidence not green (B31 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingPerformOfficialPathGreen =
    productPathFreestandingPerformOfficialPathViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE / official-path alternate
  # (partial B33): OfficialPathAlternate alternate
  # measured true; perform claimed false; DependsOnLake true; dual-equality blocks
  # retirement; freestanding-perform-official-path-alternate Lake-free recipe;
  # when release present, B32 official-path gap green.
  productPathFreestandingPerformOfficialPathAlternateViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      altMod = readRel productPathFreestandingPerformOfficialPathAlternateModulePath;
      lakeToml = readRel productPathFreestandingPerformOfficialPathAlternateLakefilePath;
      justFile = readRel productPathFreestandingPerformOfficialPathAlternateJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingPerformOfficialPathAlternateAcceptanceTokens)
    # Dual-pin thin batch 24: tip hostPin is fold/claim chain only (PartialReady +
    # Measured + WriterPresent + living AlternateNotOfficial false /
    # DualEqualityBlocks false + living claims + B32 OfficialPath fold + import
    # cite + theorem). Ok/stage/recipe/exe/FREESTANDING-PERFORM-OFFICIAL-PATH-
    # ALTERNATE-* step ids home-primary (land-time NotOfficial true / DualBlocks true).
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingPerformOfficialPathAlternatePartialReady"
      "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE"
      "def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := true"
      "def productPathOfficialPathAlternateWriterPresent : Bool := true"
      # Living tip after B38: same Capable regenerate writer is official.
      "def productPathOfficialPathAlternateNotOfficial : Bool := false"
      "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def productPathPerformDependsOnLake : Bool := true"
      "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
      "def productPathOfficialPathStillUsesLake : Bool := true"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "OfficialPathAlternate"
      "productPathFreestandingPerformOfficialPathPartialReady"
      "def productPathFreestandingPerformOfficialPathGapMeasured : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "theorem productPathFreestandingPerformOfficialPathAlternatePartialReady_true"
    ])
    ++ (scan productPathFreestandingPerformOfficialPathAlternateModulePath altMod productPathFreestandingPerformOfficialPathAlternateModuleTokens)
    ++ (forbid productPathFreestandingPerformOfficialPathAlternateModulePath altMod productPathFreestandingPerformOfficialPathAlternateModuleForbiddenTokens)
    ++ (scan productPathFreestandingPerformOfficialPathAlternateLakefilePath lakeToml productPathFreestandingPerformOfficialPathAlternateLakefileTokens)
    ++ (scan productPathFreestandingPerformOfficialPathAlternateJustPath justFile productPathFreestandingPerformOfficialPathAlternateJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingPerformOfficialPathViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE: official-path gap not green (B32 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingPerformOfficialPathAlternateGreen =
    productPathFreestandingPerformOfficialPathAlternateViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY / dual-equality WRITE
  # parity (partial B34): DualEqWriteParity
  # parity measured true; gap open true; Capable structural not dual-equality;
  # perform claimed false; DependsOnLake true; dual-equality blocks retirement;
  # freestanding-perform-dual-equality-write-parity Lake-free recipe;
  # when release present, B33 official-path alternate green.
  productPathFreestandingPerformDualEqualityWriteParityViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      parityMod = readRel productPathFreestandingPerformDualEqualityWriteParityModulePath;
      lakeToml = readRel productPathFreestandingPerformDualEqualityWriteParityLakefilePath;
      justFile = readRel productPathFreestandingPerformDualEqualityWriteParityJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingPerformDualEqualityWriteParityAcceptanceTokens)
    # Dual-pin thin batch 25: tip hostPin is fold/claim chain only (PartialReady +
    # Measured + living GapOpen false / StructuralNotDualEq false + living claims +
    # B33 OfficialPathAlternate fold + import cite + theorem). Ok/stage/recipe/exe/
    # FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-PARITY-* step ids home-primary
    # (land-time GapOpen true / StructuralNotDualEq true).
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingPerformDualEqualityWriteParityPartialReady"
      "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY"
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
      "productPathFreestandingPerformOfficialPathAlternatePartialReady"
      "def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "theorem productPathFreestandingPerformDualEqualityWriteParityPartialReady_true"
    ])
    ++ (scan productPathFreestandingPerformDualEqualityWriteParityModulePath parityMod productPathFreestandingPerformDualEqualityWriteParityModuleTokens)
    ++ (forbid productPathFreestandingPerformDualEqualityWriteParityModulePath parityMod productPathFreestandingPerformDualEqualityWriteParityModuleForbiddenTokens)
    ++ (scan productPathFreestandingPerformDualEqualityWriteParityLakefilePath lakeToml productPathFreestandingPerformDualEqualityWriteParityLakefileTokens)
    ++ (scan productPathFreestandingPerformDualEqualityWriteParityJustPath justFile productPathFreestandingPerformDualEqualityWriteParityJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingPerformOfficialPathAlternateViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY: official-path alternate not green (B33 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingPerformDualEqualityWriteParityGreen =
    productPathFreestandingPerformDualEqualityWriteParityViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH / dual-equality WRITE
  # close path (partial B35): DualEqWriteClosePath
  # close path measured true; named true; not gap closed true; gap open true;
  # Capable structural not dual-equality; perform claimed false; DependsOnLake true;
  # dual-equality blocks retirement; freestanding-perform-dual-equality-write-close-path
  # Lake-free recipe; when release present, B34 dual-equality WRITE parity green.
  productPathFreestandingPerformDualEqualityWriteClosePathViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      closeMod = readRel productPathFreestandingPerformDualEqualityWriteClosePathModulePath;
      lakeToml = readRel productPathFreestandingPerformDualEqualityWriteClosePathLakefilePath;
      justFile = readRel productPathFreestandingPerformDualEqualityWriteClosePathJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingPerformDualEqualityWriteClosePathAcceptanceTokens)
    # Dual-pin thin batch 26: tip hostPin is fold/claim chain only (PartialReady +
    # Measured + Named + living NotGapClosed false + living claims + B34 parity
    # fold + import cite + theorem). Ok/stage/recipe/exe/FREESTANDING-*-CLOSE-*
    # step ids home-primary (land-time NotGapClosed true).
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingPerformDualEqualityWriteClosePathPartialReady"
      "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH"
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
      "productPathFreestandingPerformDualEqualityWriteParityPartialReady"
      "def productPathFreestandingPerformDualEqualityWriteParityMeasured : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "theorem productPathFreestandingPerformDualEqualityWriteClosePathPartialReady_true"
    ])
    ++ (scan productPathFreestandingPerformDualEqualityWriteClosePathModulePath closeMod productPathFreestandingPerformDualEqualityWriteClosePathModuleTokens)
    ++ (forbid productPathFreestandingPerformDualEqualityWriteClosePathModulePath closeMod productPathFreestandingPerformDualEqualityWriteClosePathModuleForbiddenTokens)
    ++ (scan productPathFreestandingPerformDualEqualityWriteClosePathLakefilePath lakeToml productPathFreestandingPerformDualEqualityWriteClosePathLakefileTokens)
    ++ (scan productPathFreestandingPerformDualEqualityWriteClosePathJustPath justFile productPathFreestandingPerformDualEqualityWriteClosePathJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingPerformDualEqualityWriteParityViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH: dual-equality WRITE parity not green (B34 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingPerformDualEqualityWriteClosePathGreen =
    productPathFreestandingPerformDualEqualityWriteClosePathViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API / dual-equality WRITE API
  # (partial B36): DualEqWriteApi API measured
  # true; present true; authority not emit; not official; step advanced; gap open true;
  # Capable structural not dual-equality; perform claimed false; DependsOnLake true;
  # dual-equality blocks retirement; freestanding-perform-dual-equality-write-api
  # Lake-free recipe; when release present, B35 dual-equality WRITE close path green.
  productPathFreestandingPerformDualEqualityWriteApiViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      apiMod = readRel productPathFreestandingPerformDualEqualityWriteApiModulePath;
      apiLoad = readRel productPathFreestandingPerformDualEqualityWriteApiLoadPath;
      lakeToml = readRel productPathFreestandingPerformDualEqualityWriteApiLakefilePath;
      justFile = readRel productPathFreestandingPerformDualEqualityWriteApiJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingPerformDualEqualityWriteApiAcceptanceTokens)
    # Dual-pin thin batch 27: tip hostPin is fold/claim chain only (PartialReady +
    # five API honesty bools + living claims + B35 ClosePath fold + import cite +
    # theorem + freestandingDualEqualityWriteFreestandingHc cite + close-step
    # DUAL-EQUALITY-API ladder). Ok/stage/recipe/exe/FREESTANDING-PERFORM-*-API-*
    # step ids home-primary.
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingPerformDualEqualityWriteApiPartialReady"
      "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API"
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
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API"
      "DualEqWriteApi"
      "productPathFreestandingPerformDualEqualityWriteClosePathPartialReady"
      "def productPathFreestandingPerformDualEqualityWriteClosePathMeasured : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "theorem productPathFreestandingPerformDualEqualityWriteApiPartialReady_true"
    ])
    ++ (scan productPathFreestandingPerformDualEqualityWriteApiModulePath apiMod productPathFreestandingPerformDualEqualityWriteApiModuleTokens)
    ++ (scan productPathFreestandingPerformDualEqualityWriteApiLoadPath apiLoad productPathFreestandingPerformDualEqualityWriteApiLoadTokens)
    ++ (forbid productPathFreestandingPerformDualEqualityWriteApiModulePath apiMod productPathFreestandingPerformDualEqualityWriteApiModuleForbiddenTokens)
    ++ (scan productPathFreestandingPerformDualEqualityWriteApiLakefilePath lakeToml productPathFreestandingPerformDualEqualityWriteApiLakefileTokens)
    ++ (scan productPathFreestandingPerformDualEqualityWriteApiJustPath justFile productPathFreestandingPerformDualEqualityWriteApiJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingPerformDualEqualityWriteClosePathViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API: dual-equality WRITE close path not green (B35 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingPerformDualEqualityWriteApiGreen =
    productPathFreestandingPerformDualEqualityWriteApiViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP / CAPABLE-GAP
  # (partial B37): DualEqWriteCapableGap CAPABLE-GAP
  # measured true; gap closed true; Capable dual-eq live true; step advanced;
  # gap open false; perform claimed false; DependsOnLake true; dual-equality still
  # blocks official retirement; freestanding-perform-dual-equality-write-capable-gap
  # Lake-free recipe; when release present, B36 dual-equality WRITE API green.
  productPathFreestandingPerformDualEqualityWriteCapableGapViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      gapMod = readRel productPathFreestandingPerformDualEqualityWriteCapableGapModulePath;
      lakeToml = readRel productPathFreestandingPerformDualEqualityWriteCapableGapLakefilePath;
      justFile = readRel productPathFreestandingPerformDualEqualityWriteCapableGapJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingPerformDualEqualityWriteCapableGapAcceptanceTokens)
    # Dual-pin thin batch 28: tip hostPin is fold/claim chain only (PartialReady +
    # four CAPABLE-GAP honesty + living claims + B36 API fold + import cite +
    # theorem + CLOSE-STEP-CAPABLE-GAP ladder). Ok/stage/recipe/exe/FREESTANDING-
    # PERFORM-*-CAPABLE-GAP-* home-primary.
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady"
      "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP"
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
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP"
      "DualEqWriteCapableGap"
      "productPathFreestandingPerformDualEqualityWriteApiPartialReady"
      "def productPathFreestandingPerformDualEqualityWriteApiMeasured : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "theorem productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady_true"
    ])
    ++ (scan productPathFreestandingPerformDualEqualityWriteCapableGapModulePath gapMod productPathFreestandingPerformDualEqualityWriteCapableGapModuleTokens)
    ++ (forbid productPathFreestandingPerformDualEqualityWriteCapableGapModulePath gapMod productPathFreestandingPerformDualEqualityWriteCapableGapModuleForbiddenTokens)
    ++ (scan productPathFreestandingPerformDualEqualityWriteCapableGapLakefilePath lakeToml productPathFreestandingPerformDualEqualityWriteCapableGapLakefileTokens)
    ++ (scan productPathFreestandingPerformDualEqualityWriteCapableGapJustPath justFile productPathFreestandingPerformDualEqualityWriteCapableGapJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingPerformDualEqualityWriteApiViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP: dual-equality WRITE API not green (B36 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingPerformDualEqualityWriteCapableGapGreen =
    productPathFreestandingPerformDualEqualityWriteCapableGapViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL / RETIRE-OFFICIAL (partial B38):
  # OfficialRetire + SelfApplyFs pins prove official just build uses
  # freestanding dual-eq WRITE; StillUsesFreestandingEmit false; Blocks false;
  # perform claimed false; CAPABLE-GAP stays closed; when release present, B37 green.
  productPathOfficialPathRetireOfficialViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      retireMod = readRel productPathOfficialPathRetireOfficialModulePath;
      lakeToml = readRel productPathOfficialPathRetireOfficialLakefilePath;
      justFile = readRel productPathOfficialPathRetireOfficialJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathOfficialPathRetireOfficialAcceptanceTokens)
    # Dual-pin thin batch 29: tip hostPin is fold/claim chain only (PartialReady +
    # RETIRE honesty Measured/StepAdvanced/UsesDualEq + living StillUses/Blocks +
    # living claims + B37 CAPABLE-GAP fold + import cite + theorem +
    # CLOSE-STEP-RETIRE-OFFICIAL ladder). Ok/stage/recipe/exe/FREESTANDING-
    # PERFORM-RETIRE-OFFICIAL-* home-primary.
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathOfficialPathRetireOfficialPartialReady"
      "SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL"
      "def productPathOfficialPathRetireOfficialMeasured : Bool := true"
      "def productPathOfficialPathRetireOfficialStepAdvanced : Bool := true"
      "def productPathOfficialPathUsesDualEqualityWrite : Bool := true"
      "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
      "def productPathOfficialPathStillUsesLake : Bool := true"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def productPathPerformDependsOnLake : Bool := true"
      "def productPathDualEqualityWriteParityGapOpen : Bool := false"
      "def productPathCapableWriteDualEqualityLive : Bool := true"
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL"
      "OfficialRetire"
      "productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady"
      "def productPathFreestandingPerformDualEqualityWriteCapableGapMeasured : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "theorem productPathOfficialPathRetireOfficialPartialReady_true"
    ])
    ++ (scan productPathOfficialPathRetireOfficialModulePath retireMod productPathOfficialPathRetireOfficialModuleTokens)
    ++ (forbid productPathOfficialPathRetireOfficialModulePath retireMod productPathOfficialPathRetireOfficialModuleForbiddenTokens)
    ++ (scan productPathOfficialPathRetireOfficialLakefilePath lakeToml productPathOfficialPathRetireOfficialLakefileTokens)
    ++ (scan productPathOfficialPathRetireOfficialJustPath justFile productPathOfficialPathRetireOfficialJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingPerformDualEqualityWriteCapableGapViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL: dual-equality WRITE CAPABLE-GAP not green (B37 required when release present)"
        ]
      else
        [ ]
    );

  productPathOfficialPathRetireOfficialGreen =
    productPathOfficialPathRetireOfficialViolations == [ ];

  # SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED / PERFORM-CLAIMED (partial B39):
  # PerformClaimed + SelfApplyFs pins prove perform claimed true with official
  # freestanding dual-eq WRITE evidence after B38 RETIRE-OFFICIAL; ownership
  # claimed false; complete false; CAPABLE-GAP stays closed; when release present,
  # B38 green.
  productPathFreestandingPerformClaimedViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      claimedMod = readRel productPathFreestandingPerformClaimedModulePath;
      lakeToml = readRel productPathFreestandingPerformClaimedLakefilePath;
      justFile = readRel productPathFreestandingPerformClaimedJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingPerformClaimedAcceptanceTokens)
    # Dual-pin thin batch 30: tip hostPin is fold/claim chain only (PartialReady +
    # PERFORM-CLAIMED honesty Measured/StepAdvanced + living StillUses/Blocks +
    # living claims + B38 RETIRE-OFFICIAL fold + import cite + theorem +
    # CLOSE-STEP-PERFORM-CLAIMED ladder + FULL-BAR). Ok/stage/recipe/exe/
    # FREESTANDING-PERFORM-CLAIMED-* home-primary.
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingPerformClaimedPartialReady"
      "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED"
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
      "def productPathDualEqualityWriteParityGapOpen : Bool := false"
      "def productPathCapableWriteDualEqualityLive : Bool := true"
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED"
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
      "PerformClaimed"
      "productPathOfficialPathRetireOfficialPartialReady"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "theorem productPathFreestandingPerformClaimedPartialReady_true"
    ])
    ++ (scan productPathFreestandingPerformClaimedModulePath claimedMod productPathFreestandingPerformClaimedModuleTokens)
    ++ (forbid productPathFreestandingPerformClaimedModulePath claimedMod productPathFreestandingPerformClaimedModuleForbiddenTokens)
    ++ (scan productPathFreestandingPerformClaimedLakefilePath lakeToml productPathFreestandingPerformClaimedLakefileTokens)
    ++ (scan productPathFreestandingPerformClaimedJustPath justFile productPathFreestandingPerformClaimedJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathOfficialPathRetireOfficialViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED: RETIRE-OFFICIAL not green (B38 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingPerformClaimedGreen =
    productPathFreestandingPerformClaimedViolations == [ ];

  productPathFreestandingOwnershipClaimedViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      claimedMod = readRel productPathFreestandingOwnershipClaimedModulePath;
      lakeToml = readRel productPathFreestandingOwnershipClaimedLakefilePath;
      justFile = readRel productPathFreestandingOwnershipClaimedJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept productPathFreestandingOwnershipClaimedAcceptanceTokens)
    # Dual-pin thin batch 31: tip hostPin is fold/claim chain only (PartialReady +
    # OWNERSHIP-CLAIMED honesty Measured/StepAdvanced + living claims + B39
    # PERFORM-CLAIMED fold + import cite + theorem + CLOSE-STEP-OWNERSHIP +
    # FULL-BAR). Ok/stage/recipe/exe/FREESTANDING-OWNERSHIP-CLAIMED-* home-primary.
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "productPathFreestandingOwnershipClaimedPartialReady"
      "SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED"
      "def productPathFreestandingOwnershipClaimedMeasured : Bool := true"
      "def productPathFreestandingOwnershipClaimedStepAdvanced : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def productPathFreestandingPerformClaimedMeasured : Bool := true"
      "def productPathOfficialPathUsesDualEqualityWrite : Bool := true"
      "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
      "def productPathOfficialPathStillUsesLake : Bool := true"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
      "def productPathOfficialPathRetireOfficialMeasured : Bool := true"
      "def productPathPerformDependsOnLake : Bool := true"
      "def productPathDualEqualityWriteParityGapOpen : Bool := false"
      "def productPathCapableWriteDualEqualityLive : Bool := true"
      "def stepContractFull : Bool := true"
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED"
      "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
      "OwnershipClaimed"
      "productPathFreestandingPerformClaimedPartialReady"
      "def freestandingProductSelfHostComplete : Bool := true"
      "theorem productPathFreestandingOwnershipClaimedPartialReady_true"
    ])
    ++ (scan productPathFreestandingOwnershipClaimedModulePath claimedMod productPathFreestandingOwnershipClaimedModuleTokens)
    ++ (forbid productPathFreestandingOwnershipClaimedModulePath claimedMod productPathFreestandingOwnershipClaimedModuleForbiddenTokens)
    ++ (scan productPathFreestandingOwnershipClaimedLakefilePath lakeToml productPathFreestandingOwnershipClaimedLakefileTokens)
    ++ (scan productPathFreestandingOwnershipClaimedJustPath justFile productPathFreestandingOwnershipClaimedJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingPerformClaimedViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED: PERFORM-CLAIMED not green (B39 required when release present)"
        ]
      else
        [ ]
    );

  productPathFreestandingOwnershipClaimedGreen =
    productPathFreestandingOwnershipClaimedViolations == [ ];

  stepContractFullViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      claimedMod = readRel stepContractFullModulePath;
      lakeToml = readRel stepContractFullLakefilePath;
      justFile = readRel stepContractFullJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept stepContractFullAcceptanceTokens)
    # Dual-pin thin batch 32: tip hostPin is fold/claim chain only (PartialReady +
    # Full honesty Measured/StepAdvanced + living claims + B40 ownership fold +
    # import cite + theorem + CLOSE-STEP-FULL + FULL-BAR). Ok/stage/recipe/exe/
    # FREESTANDING-STEP-CONTRACT-FULL-* home-primary.
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "stepContractFullPartialReady"
      "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL"
      "def stepContractFullMeasured : Bool := true"
      "def stepContractFullStepAdvanced : Bool := true"
      "def stepContractFull : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathFreestandingOwnershipClaimedMeasured : Bool := true"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def productPathFreestandingPerformClaimedMeasured : Bool := true"
      "def productPathOfficialPathUsesDualEqualityWrite : Bool := true"
      "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
      "def productPathOfficialPathStillUsesLake : Bool := true"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
      "def productPathOfficialPathRetireOfficialMeasured : Bool := true"
      "def productPathPerformDependsOnLake : Bool := true"
      "def productPathDualEqualityWriteParityGapOpen : Bool := false"
      "def productPathCapableWriteDualEqualityLive : Bool := true"
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL"
      "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
      "StepContractFull"
      "productPathFreestandingOwnershipClaimedPartialReady"
      "def freestandingProductSelfHostComplete : Bool := true"
      "theorem stepContractFullPartialReady_true"
    ])
    ++ (scan stepContractFullModulePath claimedMod stepContractFullModuleTokens)
    ++ (forbid stepContractFullModulePath claimedMod stepContractFullModuleForbiddenTokens)
    ++ (scan stepContractFullLakefilePath lakeToml stepContractFullLakefileTokens)
    ++ (scan stepContractFullJustPath justFile stepContractFullJustTokens)
    ++ (
      if residualFreeReleasePresent && productPathFreestandingOwnershipClaimedViolations != [ ] then
        [
          "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL: OWNERSHIP-CLAIMED not green (B40 required when release present)"
        ]
      else
        [ ]
    );

  stepContractFullGreen =
    stepContractFullViolations == [ ];

  selfHostCompleteViolations =
    let
      accept = readRel "src/systems/self-host.md";
      hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean";
      claimedMod = readRel selfHostCompleteModulePath;
      lakeToml = readRel selfHostCompleteLakefilePath;
      justFile = readRel selfHostCompleteJustPath;
      scan =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [ ]
            else
              [ "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE: ${rel}: missing ${t}" ]
          ) tokens;
      forbid =
        rel: content: tokens:
        if content == null then
          [ "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE: missing ${rel}" ]
        else
          lib.concatMap (
            t:
            if has t content then
              [
                "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE: ${rel}: forbidden dishonest token '${t}'"
              ]
            else
              [ ]
          ) tokens;
    in
    (scan "src/systems/self-host.md" accept selfHostCompleteAcceptanceTokens)
    # Dual-pin thin batch 33: tip hostPin is fold/claim chain only (PartialReady +
    # complete honesty Measured/StepAdvanced + living claims + Full fold + import
    # cite + theorem). Ok/stage/recipe/exe/FREESTANDING-PRODUCT-SELF-HOST-COMPLETE-*
    # home-primary.
    ++ (scan "src/systems/SystemsLean/SelfApplyFs.lean" hostPin [
      "freestandingProductSelfHostCompletePartialReady"
      "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE"
      "def freestandingProductSelfHostCompleteMeasured : Bool := true"
      "def freestandingProductSelfHostCompleteStepAdvanced : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def stepContractFull : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
      "def productPathOfficialPathUsesDualEqualityWrite : Bool := true"
      "def productPathOfficialPathStillUsesLake : Bool := true"
      "def productPathPerformDependsOnLake : Bool := true"
      "SelfHostComplete"
      "stepContractFullPartialReady"
      "theorem freestandingProductSelfHostCompletePartialReady_true"
    ])
    ++ (scan selfHostCompleteModulePath claimedMod selfHostCompleteModuleTokens)
    ++ (forbid selfHostCompleteModulePath claimedMod selfHostCompleteModuleForbiddenTokens)
    ++ (scan selfHostCompleteLakefilePath lakeToml selfHostCompleteLakefileTokens)
    ++ (scan selfHostCompleteJustPath justFile selfHostCompleteJustTokens);

  selfHostCompleteGreen =
    selfHostCompleteViolations == [ ];



  violations =
    fileViolations
    ++ contentViolations
    ++ optionalContentViolations
    ++ unitFileViolations
    ++ unitCountViolations
    ++ emitReleaseMatchViolations
    ++ productKernelSelfApplyModuleViolations
    ++ productOutKernelEvidenceViolations
    ++ productPathBootstrapViolations
    ++ productWriterSurfaceViolations
    ++ productWriterPathPlanViolations
    ++ productWriterPathExecutionViolations
    ++ productPathOwnershipInputsViolations
    ++ productPathPerformViolations
    ++ productPathPerformStepViolations
    ++ productPathPerformReadViolations
    ++ productPathPerformComposeViolations
    ++ productPathPerformWriteHcViolations
    ++ productPathFreestandingCapableViolations
    ++ productPathFreestandingCapableStepContractViolations
    ++ productPathFreestandingCapableReadViolations
    ++ productPathFreestandingCapableComposeViolations
    ++ productPathFreestandingCapableWriteHcViolations
    ++ productPathFreestandingCapableRegenerateViolations
    ++ productPathFreestandingCapableInstallOutViolations
    ++ productPathFreestandingCapableFullBarViolations
    ++ productPathOwnershipRegenerateViolations
    ++ productPathFreestandingPerformEvidenceViolations
    ++ productPathFreestandingPerformOfficialPathViolations
    ++ productPathFreestandingPerformOfficialPathAlternateViolations
    ++ productPathFreestandingPerformDualEqualityWriteParityViolations
    ++ productPathFreestandingPerformDualEqualityWriteClosePathViolations
    ++ productPathFreestandingPerformDualEqualityWriteApiViolations
    ++ productPathFreestandingPerformDualEqualityWriteCapableGapViolations
    ++ productPathOfficialPathRetireOfficialViolations
    ++ productPathFreestandingPerformClaimedViolations
    ++ productPathFreestandingOwnershipClaimedViolations
    ++ stepContractFullViolations
    ++ selfHostCompleteViolations
    ++ residualFreeMeasureViolations;

  ok = violations == [ ];
  maxShow = 40;
  shown = lib.take maxShow violations;
  more =
    let
      n = builtins.length violations;
    in
    if n > maxShow then "\n... and ${toString (n - maxShow)} more" else "";
  residualFreeMeasureSummary =
    if !residualFreeReleasePresent then
      "PRODUCT-RESIDUAL-FREE-MEASURE skipped (release out/freestanding-c absent; free claim stays false)"
    else if residualFreeMeasureGreen then
      "PRODUCT-RESIDUAL-FREE-MEASURE green (managed residual absent on release; product residual free honesty present)"
    else
      "PRODUCT-RESIDUAL-FREE-MEASURE failed (managed residual or honesty missing)";
  productKernelSelfApplyModuleSummary =
    if productKernelSelfApplyModuleGreen then
      "SELF-HOST-KERNEL-SELF-APPLY module green (KernelSelfApply PartialReady dual-pin; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-KERNEL-SELF-APPLY module failed (tip dual-pin or KernelSelfApply land-time tokens)";
  productOutKernelEvidenceSummary =
    if !residualFreeReleasePresent then
      "SELF-HOST-PRODUCT-OUT skipped (release out/freestanding-c absent; complete stays false)"
    else if productOutKernelEvidenceGreen then
      "SELF-HOST-PRODUCT-OUT green (B-bar ownership+APIs on product Out; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-OUT failed (B-bar ownership or APIs missing on product Out)";
  productPathBootstrapSummary =
    if productPathHostLakeBootstrapGreen then
      "SELF-HOST-PRODUCT-PATH-BOOTSTRAP green (land-time B4: host Lake bootstrap remains; living tip B38 official writer is freestanding dual-eq regenerate; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-BOOTSTRAP failed (writer, acceptance, host pin, or Out B-bar honesty)";
  productWriterSurfaceSummary =
    if !residualFreeReleasePresent then
      (
        if productWriterSurfaceGreen then
          "SELF-HOST-PRODUCT-WRITER-SURFACE green (acceptance+host pin; release absent so Out writer scan skipped; freestandingProductSelfHostComplete true after claim B complete)"
        else
          "SELF-HOST-PRODUCT-WRITER-SURFACE failed (acceptance or host pin)"
      )
    else if productWriterSurfaceGreen then
      "SELF-HOST-PRODUCT-WRITER-SURFACE green (plan/apply/body + ownership on product Out; B4 bootstrap remains; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-WRITER-SURFACE failed (writer APIs, ownership, acceptance, host pin, or B3 B-bar)";
  productWriterPathPlanSummary =
    if productWriterPathPlanGreen then
      "SELF-HOST-PRODUCT-WRITER-PATH-PLAN green (ordered regenerate plan steps + host pin; B4 bootstrap remains; B5 surface when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-WRITER-PATH-PLAN failed (plan steps, acceptance, host pin, B4 writer, or B5 surface)";
  productWriterPathExecutionSummary =
    if productWriterPathExecutionGreen then
      "SELF-HOST-PRODUCT-WRITER-PATH-EXEC green (host FreestandingEmit + just build perform B6 plan steps; B4 bootstrap remains; B6 plan when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-WRITER-PATH-EXEC failed (exec cites, FreestandingEmit perform tokens, install recipe, acceptance, host pin, or B6 plan)";
  productPathOwnershipInputsSummary =
    if productPathOwnershipInputsGreen then
      "SELF-HOST-PRODUCT-PATH-OWNERSHIP green (Mult..Out SSOT + emit + Out ownership inputs; productPathFreestandingOwnershipClaimed true after B40 living tip; B8 inputs substrate; B4 bootstrap remains; B7 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-OWNERSHIP failed (SSOT paths, emit wire, acceptance, host pin, or B7 exec)";
  productPathPerformSummary =
    if productPathPerformGreen then
      "SELF-HOST-PRODUCT-PATH-PERFORM green (perform gap: Lake still read/compose/write; install step mechanism cp capable; land-time stage perform claimed false; living tip SelfApplyFs true after B39; B4 bootstrap remains; B8 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-PERFORM failed (acceptance, host pin non-claim, Lake writer tokens, install recipe Lake+cp, or B8 ownership inputs)";
  productPathPerformStepSummary =
    if productPathPerformStepGreen then
      "SELF-HOST-PRODUCT-PATH-PERFORM-STEP green (Lake-free install entrypoint install-freestanding-c-out; productPathPerformInstallLakeFreeEntrypointClaimed true; land-time stage perform claimed false; living tip SelfApplyFs true after B39; DependsOnLake true for read/compose/write; B9 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-PERFORM-STEP failed (acceptance, host pin entrypoint true, install-only recipe, or B9 perform gap)";
  productPathPerformReadSummary =
    if productPathPerformReadGreen then
      "SELF-HOST-PRODUCT-PATH-PERFORM-READ green (decomposed dual SSOT read ProductPathReadSsot + read-product-ssot; no FreestandingEmit write symbols on read module; productPathPerformReadEntrypointClaimed true; ReadDependsOnLake true; land-time stage perform claimed false; living tip SelfApplyFs true after B39; B10 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-PERFORM-READ failed (acceptance, host pin, read module, lakefile/just entrypoint, forbidden write tokens, or B10 step)";
  productPathPerformComposeSummary =
    if productPathPerformComposeGreen then
      "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE green (decomposed plan/apply/body compose ProductPathComposePlan + compose-product-plan; no FreestandingEmit write symbols on compose module; productPathPerformComposeEntrypointClaimed true; ComposeDependsOnLake true; land-time stage perform claimed false; living tip SelfApplyFs true after B39; B11 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE failed (acceptance, host pin, compose module, lakefile/just entrypoint, forbidden write tokens, or B11 read)";
  productPathPerformWriteHcSummary =
    if productPathPerformWriteHcGreen then
      "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC green (decomposed freestanding .h/.c write ProductPathWriteHc + write-freestanding-hc; honest FreestandingEmit.emitAtRoot; productPathPerformWriteHcEntrypointClaimed true; WriteHcDependsOnLake true; land-time stage perform claimed false; living tip SelfApplyFs true after B39; B12 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC failed (acceptance, host pin, write module, lakefile/just entrypoint, forbidden dishonest tokens, or B12 compose)";
  productPathFreestandingCapableSummary =
    if productPathFreestandingCapableGreen then
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP green (install Lake-free true; CapableRead true after B26 freestanding-capable-read-lake-free; CapableCompose true after B27 freestanding-capable-compose-lake-free; CapableWriteHc true after B28 freestanding-capable-write-hc-lake-free; full perform false; regenerate-product-path + freestanding-capable-gap; B13 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP failed (acceptance, host pin, gap module, lakefile/just, forbidden dishonest tokens, or B13 write-hc)";
  productPathFreestandingCapableStepContractSummary =
    if productPathFreestandingCapableStepContractGreen then
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT green (authority-not-emit true; READ satisfied true B16; Compose satisfied true B17; WriteHc satisfied true B18; stepContractFull true after Full living tip; freestanding-capable-step-contract; B14 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT failed (acceptance, host pin, step contract module, lakefile/just, forbidden dishonest tokens, or B14 gap)";
  productPathFreestandingCapableReadSummary =
    if productPathFreestandingCapableReadGreen then
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ green (freestandingCapableReadDualSsot no FreestandingEmit; ReadSatisfied true; B14 CapableRead true after B26 freestanding-capable-read-lake-free; freestanding-capable-read Lake diagnostic; B15 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ failed (acceptance, host pin, read module, lakefile/just, forbidden FreestandingEmit tokens, or B15 step contract)";
  productPathFreestandingCapableComposeSummary =
    if productPathFreestandingCapableComposeGreen then
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE green (freestandingCapableComposePlanApplyBody no FreestandingEmit; ComposeSatisfied true; B14 CapableCompose true after B27 freestanding-capable-compose-lake-free; freestanding-capable-compose Lake diagnostic; B16 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE failed (acceptance, host pin, compose module, lakefile/just, forbidden FreestandingEmit tokens, or B16 READ)";
  productPathFreestandingCapableWriteHcSummary =
    if productPathFreestandingCapableWriteHcGreen then
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC green (freestandingCapableWriteFreestandingHc no FreestandingEmit; WriteHcSatisfied true; B14 CapableWriteHc true after B28 freestanding-capable-write-hc-lake-free; freestanding-capable-write-hc diagnostic; B17 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC failed (acceptance, host pin, write module, lakefile/just, forbidden FreestandingEmit tokens, or B17 COMPOSE)";
  productPathFreestandingCapableRegenerateSummary =
    if productPathFreestandingCapableRegenerateGreen then
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE green (freestandingCapableOrderedRegenerate READ+COMPOSE+WRITE-HC+INSTALL-OUT no FreestandingEmit; stepContractFull true after Full living tip; InstallOut closed; freestanding-capable-regenerate; B18 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE failed (acceptance, host pin, regenerate module, lakefile/just, forbidden FreestandingEmit/Full true tokens, or B18 WRITE-HC)";
  productPathFreestandingCapableInstallOutSummary =
    if productPathFreestandingCapableInstallOutGreen then
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT green (freestandingCapableInstallFreestandingOut no FreestandingEmit; InstallOutOpen false; stepContractFull true after Full living tip; freestanding-capable-install-out; B19 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT failed (acceptance, host pin, install module, lakefile/just, forbidden FreestandingEmit/Full true tokens, or B19 regenerate)";
  productPathFreestandingCapableFullBarSummary =
    if productPathFreestandingCapableFullBarGreen then
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR green (closed step contracts+InstallOut+ordered regenerate; ownership regenerate WithoutLake true after B30 product path authority; CapableLakeFree true (Read true; Compose true; WriteHc true after B26+B27+B28); stepContractFull true after Full living tip; freestanding-capable-full-bar; B20 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR failed (acceptance, host pin, full-bar module, lakefile/just, forbidden Full true / WithoutLake false tokens, or B20 install)";
  productPathOwnershipRegenerateSummary =
    if productPathOwnershipRegenerateGreen then
      "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE green (install+READ+COMPOSE+WRITE-HC Lake-free true; B29 Lake-free join claimed; B30 product path authority claimed; WithoutLake true; ownership-regenerate + ownership-regenerate-*-only + ownership-regenerate-lake-free + ownership-regenerate-product-path-authority; dual-pin freestanding Capable* true after B26..B28; B21 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE failed (acceptance, host pin, ownership regenerate module, lakefile/just, forbidden WithoutLake false tokens, or B21 Full bar)";
  productPathFreestandingPerformEvidenceSummary =
    if productPathFreestandingPerformEvidenceGreen then
      "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE green (evidence claimed true; land-time stage perform claimed false; living tip SelfApplyFs true after B39; DependsOnLake true; freestanding-perform-evidence Lake-free; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed after B39; B30 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE failed (acceptance, host pin, perform evidence module, lakefile/just, forbidden evidence false / perform claimed true tokens, or B30 ownership regenerate)";
  productPathFreestandingPerformOfficialPathSummary =
    if productPathFreestandingPerformOfficialPathGreen then
      "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH green (gap measured true; land-time stage perform claimed false; living tip SelfApplyFs true after B39; DependsOnLake true; land-time B32 FreestandingEmit official pin; living tip B38 FreestandingEmit retired; freestanding-perform-official-path Lake-free; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed after B39; B31 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH failed (acceptance, host pin, official-path gap module, lakefile/just, forbidden gap false / perform claimed true tokens, or B31 perform evidence)";
  productPathFreestandingPerformOfficialPathAlternateSummary =
    if productPathFreestandingPerformOfficialPathAlternateGreen then
      "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE green (alternate measured true; land-time stage perform claimed false; living tip SelfApplyFs true after B39; DependsOnLake true; land-time B33 not-official + blocks; living tip B38 same writer official + blocks false; freestanding-perform-official-path-alternate Lake-free; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed after B39; B32 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE failed (acceptance, host pin, official-path alternate module, lakefile/just, forbidden alternate false / perform claimed true tokens, or B32 official-path gap)";
  productPathFreestandingPerformDualEqualityWriteParitySummary =
    if productPathFreestandingPerformDualEqualityWriteParityGreen then
      "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY green (parity measured true; gap open true; Capable structural not dual-equality; land-time stage perform claimed false; living tip SelfApplyFs true after B39; DependsOnLake true; freestanding-perform-dual-equality-write-parity Lake-free; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed after B39; B33 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY failed (acceptance, host pin, dual-equality WRITE parity module, lakefile/just, forbidden parity false / gap closed / perform claimed true tokens, or B33 official-path alternate)";
  productPathFreestandingPerformDualEqualityWriteClosePathSummary =
    if productPathFreestandingPerformDualEqualityWriteClosePathGreen then
      "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH green (close path measured true; named true; not gap closed true; gap open true; Capable structural not dual-equality; land-time stage perform claimed false; living tip SelfApplyFs true after B39; DependsOnLake true; freestanding-perform-dual-equality-write-close-path Lake-free; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed after B39; B34 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH failed (acceptance, host pin, dual-equality WRITE close-path module, lakefile/just, forbidden close path false / gap closed / perform claimed true tokens, or B34 dual-equality WRITE parity)";
  productPathFreestandingPerformDualEqualityWriteApiSummary =
    if productPathFreestandingPerformDualEqualityWriteApiGreen then
      "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API green (API measured true; present true; authority not emit; not official; step advanced; gap closed after B37 CAPABLE-GAP; living tip B39 perform claimed true; DependsOnLake true; freestanding-perform-dual-equality-write-api Lake-free; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed after B39; B35 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API failed (acceptance, host pin, dual-equality WRITE API module, lakefile/just, forbidden API false tokens, or B35 dual-equality WRITE close path)";
  productPathFreestandingPerformDualEqualityWriteCapableGapSummary =
    if productPathFreestandingPerformDualEqualityWriteCapableGapGreen then
      "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP green (CAPABLE-GAP measured true; gap closed true; Capable dual-eq live true; step advanced; gap open false; living tip B38 FreestandingEmit retired; living tip B39 perform claimed true; DependsOnLake true; freestanding-perform-dual-equality-write-capable-gap Lake-free; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed after B39; B36 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP failed (acceptance, host pin, dual-equality WRITE CAPABLE-GAP module, lakefile/just, forbidden CAPABLE-GAP false / gap re-open tokens, or B36 dual-equality WRITE API)";
  productPathOfficialPathRetireOfficialSummary =
    if productPathOfficialPathRetireOfficialGreen then
      "SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL green (RETIRE-OFFICIAL measured true; official dual-eq WRITE; StillUsesFreestandingEmit false; Blocks false; land-time OfficialRetire perform claimed false; living tip B39 SelfApplyFs perform claimed true; DependsOnLake true; freestanding-retire-official Lake-free; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed after B39; B37 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-PERFORM-RETIRE-OFFICIAL failed (acceptance, host pin, OfficialRetire module, lakefile/just, forbidden StillUses true tokens, or B37 CAPABLE-GAP)";
  productPathFreestandingPerformClaimedSummary =
    if productPathFreestandingPerformClaimedGreen then
      "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED green (PERFORM-CLAIMED measured true; perform claimed true with official dual-eq WRITE evidence; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; freestanding-perform-claimed Lake-free; FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE closed; land-time PerformClaimed ownership false; SelfApplyFs living tip ownership claimed true after B40; B38 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-PERFORM-CLAIMED failed (acceptance, host pin, PerformClaimed module, lakefile/just, forbidden perform claimed false / complete true tokens, or B38 RETIRE-OFFICIAL)";
  productPathFreestandingOwnershipClaimedSummary =
    if productPathFreestandingOwnershipClaimedGreen then
      "SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED green (OWNERSHIP-CLAIMED measured true; ownership claimed true with perform-claimed + official dual-eq WRITE evidence; StillUsesFreestandingEmit false; Blocks false; DependsOnLake true; freestanding-ownership-claimed Lake-free; FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE closed; living tip stepContractFull true after Full; B39 when release present; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-OWNERSHIP-CLAIMED failed (acceptance, host pin, OwnershipClaimed module, lakefile/just, forbidden ownership claimed false / complete true tokens, or B39 PERFORM-CLAIMED)";
  stepContractFullSummary =
    if stepContractFullGreen then
      "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL green (stepContractFull true; ownership-claimed + perform-claimed + dual-eq WRITE; StillUsesFreestandingEmit false; DependsOnLake true; freestanding-step-contract-full Lake-free; freestandingProductSelfHostComplete true after claim B complete)"
    else
      "SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL failed (acceptance, host pin, StepContractFull module, lakefile/just, or B40 OWNERSHIP-CLAIMED)";
  selfHostCompleteSummary =
    if selfHostCompleteGreen then
      "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE green (claim B complete; freestandingProductSelfHostComplete true; stepContractFull true; ownership claimed true; perform claimed true; dual-eq WRITE; StillUsesFreestandingEmit false; residual free true; llvm/PROVABLY false; freestanding-self-host-complete)"
    else
      "SELF-HOST-FREESTANDING-PRODUCT-COMPLETE failed (acceptance, host pin, SelfHostComplete module, lakefile/just, or stepContractFull)";
  summary =
    if ok then
      "systems-emit-wire OK (${toString (builtins.length requiredFiles)} required paths; "
      + "compile/emit drivers + UNIT_DEEPEN_V1 + emit product UNIT_TRANSLATION..EMIT_BODY; "
      + "unit-surface count=${toString unitSurfaceCount}; optional release checked if present; "
      + "SELF-HOST-KERNEL-SELF-APPLY emit/out match when release present; "
      + productKernelSelfApplyModuleSummary
      + "; "
      + productOutKernelEvidenceSummary
      + "; "
      + productPathBootstrapSummary
      + "; "
      + productWriterSurfaceSummary
      + "; "
      + productWriterPathPlanSummary
      + "; "
      + productWriterPathExecutionSummary
      + "; "
      + productPathOwnershipInputsSummary
      + "; "
      + productPathPerformSummary
      + "; "
      + productPathPerformStepSummary
      + "; "
      + productPathPerformReadSummary
      + "; "
      + productPathPerformComposeSummary
      + "; "
      + productPathPerformWriteHcSummary
      + "; "
      + productPathFreestandingCapableSummary
      + "; "
      + productPathFreestandingCapableStepContractSummary
      + "; "
      + productPathFreestandingCapableReadSummary
      + "; "
      + productPathFreestandingCapableComposeSummary
      + "; "
      + productPathFreestandingCapableWriteHcSummary
      + "; "
      + productPathFreestandingCapableRegenerateSummary
      + "; "
      + productPathFreestandingCapableInstallOutSummary
      + "; "
      + productPathFreestandingCapableFullBarSummary
      + "; "
      + productPathOwnershipRegenerateSummary
      + "; "
      + productPathFreestandingPerformEvidenceSummary
      + "; "
      + productPathFreestandingPerformOfficialPathSummary
      + "; "
      + productPathFreestandingPerformOfficialPathAlternateSummary
      + "; "
      + productPathFreestandingPerformDualEqualityWriteParitySummary
      + "; "
      + productPathFreestandingPerformDualEqualityWriteClosePathSummary
      + "; "
      + productPathFreestandingPerformDualEqualityWriteApiSummary
      + "; "
      + productPathFreestandingPerformDualEqualityWriteCapableGapSummary
      + "; "
      + productPathOfficialPathRetireOfficialSummary
      + "; "
      + productPathFreestandingPerformClaimedSummary
      + "; "
      + productPathFreestandingOwnershipClaimedSummary
      + "; "
      + stepContractFullSummary
      + "; "
      + selfHostCompleteSummary
      + "; "
      + residualFreeMeasureSummary
      + "; stage ${residualFreeMeasureStageId} / ${residualFreeMeasureHostId} / ${residualFreeMeasureSelfHostId}"
      + "; ${productKernelSelfApplyStageId} / ${productKernelSelfApplyHostId} / ${productKernelSelfApplySelfHostId}"
      + "; ${productOutKernelStageId} / ${productOutKernelHostId} / ${productOutKernelSelfHostId}"
      + "; ${productPathBootstrapStageId} / ${productPathBootstrapHostId} / ${productPathBootstrapSelfHostId}"
      + "; ${productWriterSurfaceStageId} / ${productWriterSurfaceHostId} / ${productWriterSurfaceSelfHostId}"
      + "; ${productWriterPathPlanStageId} / ${productWriterPathPlanHostId} / ${productWriterPathPlanSelfHostId}"
      + "; ${productWriterPathExecutionStageId} / ${productWriterPathExecutionHostId} / ${productWriterPathExecutionSelfHostId}"
      + "; ${productPathOwnershipStageId} / ${productPathOwnershipHostId} / ${productPathOwnershipSelfHostId}"
      + "; ${productPathPerformStageId} / ${productPathPerformHostId} / ${productPathPerformSelfHostId}"
      + "; ${productPathPerformStepStageId} / ${productPathPerformStepHostId} / ${productPathPerformStepSelfHostId}"
      + "; ${productPathPerformReadStageId} / ${productPathPerformReadHostId} / ${productPathPerformReadSelfHostId}"
      + "; ${productPathPerformComposeStageId} / ${productPathPerformComposeHostId} / ${productPathPerformComposeSelfHostId}"
      + "; ${productPathPerformWriteHcStageId} / ${productPathPerformWriteHcHostId} / ${productPathPerformWriteHcSelfHostId}"
      + "; ${productPathFreestandingCapableStageId} / ${productPathFreestandingCapableHostId} / ${productPathFreestandingCapableSelfHostId}"
      + "; ${productPathFreestandingCapableStepContractStageId} / ${productPathFreestandingCapableStepContractHostId} / ${productPathFreestandingCapableStepContractSelfHostId}"
      + "; ${productPathFreestandingCapableReadStageId} / ${productPathFreestandingCapableReadHostId} / ${productPathFreestandingCapableReadSelfHostId}"
      + "; ${productPathFreestandingCapableComposeStageId} / ${productPathFreestandingCapableComposeHostId} / ${productPathFreestandingCapableComposeSelfHostId}"
      + "; ${productPathFreestandingCapableWriteHcStageId} / ${productPathFreestandingCapableWriteHcHostId} / ${productPathFreestandingCapableWriteHcSelfHostId}"
      + "; ${productPathFreestandingCapableRegenerateStageId} / ${productPathFreestandingCapableRegenerateHostId} / ${productPathFreestandingCapableRegenerateSelfHostId}"
      + "; ${productPathFreestandingCapableInstallOutStageId} / ${productPathFreestandingCapableInstallOutHostId} / ${productPathFreestandingCapableInstallOutSelfHostId}"
      + "; ${productPathFreestandingCapableFullBarStageId} / ${productPathFreestandingCapableFullBarHostId} / ${productPathFreestandingCapableFullBarSelfHostId}"
      + "; ${productPathOwnershipRegenerateStageId} / ${productPathOwnershipRegenerateHostId} / ${productPathOwnershipRegenerateSelfHostId}"
      + "; ${productPathFreestandingPerformEvidenceStageId} / ${productPathFreestandingPerformEvidenceHostId} / ${productPathFreestandingPerformEvidenceSelfHostId}"
      + "; ${productPathFreestandingPerformOfficialPathStageId} / ${productPathFreestandingPerformOfficialPathHostId} / ${productPathFreestandingPerformOfficialPathSelfHostId}"
      + "; ${productPathFreestandingPerformOfficialPathAlternateStageId} / ${productPathFreestandingPerformOfficialPathAlternateHostId} / ${productPathFreestandingPerformOfficialPathAlternateSelfHostId}"
      + "; ${productPathFreestandingPerformDualEqualityWriteParityStageId} / ${productPathFreestandingPerformDualEqualityWriteParityHostId} / ${productPathFreestandingPerformDualEqualityWriteParitySelfHostId}"
      + "; ${productPathFreestandingPerformDualEqualityWriteClosePathStageId} / ${productPathFreestandingPerformDualEqualityWriteClosePathHostId} / ${productPathFreestandingPerformDualEqualityWriteClosePathSelfHostId}"
      + "; ${productPathFreestandingPerformDualEqualityWriteApiStageId} / ${productPathFreestandingPerformDualEqualityWriteApiHostId} / ${productPathFreestandingPerformDualEqualityWriteApiSelfHostId}"
      + "; ${productPathFreestandingPerformDualEqualityWriteCapableGapStageId} / ${productPathFreestandingPerformDualEqualityWriteCapableGapHostId} / ${productPathFreestandingPerformDualEqualityWriteCapableGapSelfHostId}"
      + "; ${productPathOfficialPathRetireOfficialStageId} / ${productPathOfficialPathRetireOfficialHostId} / ${productPathOfficialPathRetireOfficialSelfHostId}"
      + "; ${productPathFreestandingPerformClaimedStageId} / ${productPathFreestandingPerformClaimedHostId} / ${productPathFreestandingPerformClaimedSelfHostId}"
      + "; ${productPathFreestandingOwnershipClaimedStageId} / ${productPathFreestandingOwnershipClaimedHostId} / ${productPathFreestandingOwnershipClaimedSelfHostId})"
    else
      "systems-emit-wire FAILED:\n" + lib.concatStringsSep "\n" shown + more;
in
{
  inherit
    ok
    violations
    summary
    requiredFiles
    optionalFiles
    unitPaths
    unitSurfaceCount
    residualFreeMeasureGreen
    residualFreeReleasePresent
    residualFreeMeasureSummary
    residualFreeMeasureStageId
    residualFreeMeasureHostId
    residualFreeMeasureSelfHostId
    productKernelSelfApplyModuleGreen
    productKernelSelfApplyModuleSummary
    productKernelSelfApplyStageId
    productKernelSelfApplyHostId
    productKernelSelfApplySelfHostId
    productOutKernelEvidenceGreen
    productOutKernelEvidenceSummary
    productOutKernelStageId
    productOutKernelHostId
    productOutKernelSelfHostId
    productPathHostLakeBootstrapGreen
    productPathBootstrapSummary
    productPathBootstrapStageId
    productPathBootstrapHostId
    productPathBootstrapSelfHostId
    productWriterSurfaceGreen
    productWriterSurfaceSummary
    productWriterSurfaceStageId
    productWriterSurfaceHostId
    productWriterSurfaceSelfHostId
    productWriterPathPlanGreen
    productWriterPathPlanSummary
    productWriterPathPlanStageId
    productWriterPathPlanHostId
    productWriterPathPlanSelfHostId
    productWriterPathExecutionGreen
    productWriterPathExecutionSummary
    productWriterPathExecutionStageId
    productWriterPathExecutionHostId
    productWriterPathExecutionSelfHostId
    productPathOwnershipInputsGreen
    productPathOwnershipInputsSummary
    productPathOwnershipStageId
    productPathOwnershipHostId
    productPathOwnershipSelfHostId
    productPathPerformGreen
    productPathPerformSummary
    productPathPerformStageId
    productPathPerformHostId
    productPathPerformSelfHostId
    productPathPerformStepGreen
    productPathPerformStepSummary
    productPathPerformStepStageId
    productPathPerformStepHostId
    productPathPerformStepSelfHostId
    productPathPerformReadGreen
    productPathPerformReadSummary
    productPathPerformReadStageId
    productPathPerformReadHostId
    productPathPerformReadSelfHostId
    productPathPerformComposeGreen
    productPathPerformComposeSummary
    productPathPerformComposeStageId
    productPathPerformComposeHostId
    productPathPerformComposeSelfHostId
    productPathFreestandingCapableWriteHcGreen
    productPathFreestandingCapableWriteHcSummary
    productPathFreestandingCapableWriteHcStageId
    productPathFreestandingCapableWriteHcHostId
    productPathFreestandingCapableWriteHcSelfHostId
    productPathFreestandingCapableRegenerateGreen
    productPathFreestandingCapableRegenerateSummary
    productPathFreestandingCapableRegenerateStageId
    productPathFreestandingCapableRegenerateHostId
    productPathFreestandingCapableRegenerateSelfHostId
    productPathFreestandingCapableInstallOutGreen
    productPathFreestandingCapableInstallOutSummary
    productPathFreestandingCapableInstallOutStageId
    productPathFreestandingCapableInstallOutHostId
    productPathFreestandingCapableInstallOutSelfHostId
    productPathFreestandingCapableFullBarGreen
    productPathFreestandingCapableFullBarSummary
    productPathFreestandingCapableFullBarStageId
    productPathFreestandingCapableFullBarHostId
    productPathFreestandingCapableFullBarSelfHostId
    productPathOwnershipRegenerateGreen
    productPathOwnershipRegenerateSummary
    productPathOwnershipRegenerateStageId
    productPathOwnershipRegenerateHostId
    productPathOwnershipRegenerateSelfHostId
    productPathFreestandingPerformEvidenceGreen
    productPathFreestandingPerformEvidenceSummary
    productPathFreestandingPerformEvidenceStageId
    productPathFreestandingPerformEvidenceHostId
    productPathFreestandingPerformEvidenceSelfHostId
    productPathFreestandingPerformOfficialPathGreen
    productPathFreestandingPerformOfficialPathSummary
    productPathFreestandingPerformOfficialPathStageId
    productPathFreestandingPerformOfficialPathHostId
    productPathFreestandingPerformOfficialPathSelfHostId
    productPathFreestandingPerformOfficialPathAlternateGreen
    productPathFreestandingPerformOfficialPathAlternateSummary
    productPathFreestandingPerformOfficialPathAlternateStageId
    productPathFreestandingPerformOfficialPathAlternateHostId
    productPathFreestandingPerformOfficialPathAlternateSelfHostId
    productPathFreestandingPerformDualEqualityWriteParityGreen
    productPathFreestandingPerformDualEqualityWriteParitySummary
    productPathFreestandingPerformDualEqualityWriteParityStageId
    productPathFreestandingPerformDualEqualityWriteParityHostId
    productPathFreestandingPerformDualEqualityWriteParitySelfHostId
    productPathFreestandingPerformDualEqualityWriteClosePathGreen
    productPathFreestandingPerformDualEqualityWriteClosePathSummary
    productPathFreestandingPerformDualEqualityWriteClosePathStageId
    productPathFreestandingPerformDualEqualityWriteClosePathHostId
    productPathFreestandingPerformDualEqualityWriteClosePathSelfHostId
    productPathFreestandingPerformDualEqualityWriteApiGreen
    productPathFreestandingPerformDualEqualityWriteApiSummary
    productPathFreestandingPerformDualEqualityWriteApiStageId
    productPathFreestandingPerformDualEqualityWriteApiHostId
    productPathFreestandingPerformDualEqualityWriteApiSelfHostId
    productPathFreestandingPerformDualEqualityWriteCapableGapGreen
    productPathFreestandingPerformDualEqualityWriteCapableGapSummary
    productPathFreestandingPerformDualEqualityWriteCapableGapStageId
    productPathFreestandingPerformDualEqualityWriteCapableGapHostId
    productPathFreestandingPerformDualEqualityWriteCapableGapSelfHostId
    productPathOfficialPathRetireOfficialGreen
    productPathOfficialPathRetireOfficialSummary
    productPathOfficialPathRetireOfficialStageId
    productPathOfficialPathRetireOfficialHostId
    productPathOfficialPathRetireOfficialSelfHostId
    productPathFreestandingPerformClaimedGreen
    productPathFreestandingPerformClaimedSummary
    productPathFreestandingPerformClaimedStageId
    productPathFreestandingPerformClaimedHostId
    productPathFreestandingPerformClaimedSelfHostId
    productPathFreestandingOwnershipClaimedGreen
    productPathFreestandingOwnershipClaimedSummary
    productPathFreestandingOwnershipClaimedStageId
    productPathFreestandingOwnershipClaimedHostId
    productPathFreestandingOwnershipClaimedSelfHostId
    stepContractFullGreen
    stepContractFullSummary
    stepContractFullStageId
    stepContractFullHostId
    stepContractFullSelfHostId
    selfHostCompleteGreen
    selfHostCompleteSummary
    selfHostCompleteStageId
    selfHostCompleteHostId
    selfHostCompleteSelfHostId
    ;
}
