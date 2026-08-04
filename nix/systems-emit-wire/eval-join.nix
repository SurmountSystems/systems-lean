# SPDX-License-Identifier: Unlicense
# Final violations fold + summary for systems-emit-wire.
env:
with env;
rec {
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
}
