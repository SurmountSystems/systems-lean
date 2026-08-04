# SPDX-License-Identifier: Unlicense
# HostPin / claim-path scanners for systems-emit-wire (Sub-1-KLOC slice).
# env: flattened specs + helpers + prior slice greens. Pure Nix. No bash.
env:
with env;
rec {
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
      "def productPathOfficialPathStillUsesLake : Bool := false"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
      "def productPathFreestandingPerformClaimed : Bool := true"
      "def productPathPerformDependsOnLake : Bool := false"
      "def productPathDualEqualityWriteParityGapOpen : Bool := false"
      "def productPathCapableWriteDualEqualityLive : Bool := true"
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-RETIRE-OFFICIAL"
      "OfficialRetire"
      "productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady"
      "def productPathFreestandingPerformDualEqualityWriteCapableGapMeasured : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathOfficialPathStillUsesLake : Bool := false"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
      "def productPathOfficialPathRetireOfficialMeasured : Bool := true"
      "def productPathPerformDependsOnLake : Bool := false"
      "def productPathDualEqualityWriteParityGapOpen : Bool := false"
      "def productPathCapableWriteDualEqualityLive : Bool := true"
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-PERFORM-CLAIMED"
      "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
      "PerformClaimed"
      "productPathOfficialPathRetireOfficialPartialReady"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathOfficialPathStillUsesLake : Bool := false"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
      "def productPathOfficialPathRetireOfficialMeasured : Bool := true"
      "def productPathPerformDependsOnLake : Bool := false"
      "def productPathDualEqualityWriteParityGapOpen : Bool := false"
      "def productPathCapableWriteDualEqualityLive : Bool := true"
      "def stepContractFull : Bool := true"
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-OWNERSHIP-CLAIMED"
      "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
      "OwnershipClaimed"
      "productPathFreestandingPerformClaimedPartialReady"
      "def freestandingProductSelfHostComplete : Bool := true"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathOfficialPathStillUsesLake : Bool := false"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
      "def productPathOfficialPathRetireOfficialMeasured : Bool := true"
      "def productPathPerformDependsOnLake : Bool := false"
      "def productPathDualEqualityWriteParityGapOpen : Bool := false"
      "def productPathCapableWriteDualEqualityLive : Bool := true"
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-FULL"
      "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"
      "StepContractFull"
      "productPathFreestandingOwnershipClaimedPartialReady"
      "def freestandingProductSelfHostComplete : Bool := true"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathOfficialPathStillUsesLake : Bool := false"
      "def productPathPerformDependsOnLake : Bool := false"
      "SelfHostComplete"
      "stepContractFullPartialReady"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
      "theorem freestandingProductSelfHostCompletePartialReady_true"
    ])
    ++ (scan selfHostCompleteModulePath claimedMod selfHostCompleteModuleTokens)
    ++ (forbid selfHostCompleteModulePath claimedMod selfHostCompleteModuleForbiddenTokens)
    ++ (scan selfHostCompleteLakefilePath lakeToml selfHostCompleteLakefileTokens)
    ++ (scan selfHostCompleteJustPath justFile selfHostCompleteJustTokens);

  selfHostCompleteGreen =
    selfHostCompleteViolations == [ ];



}
