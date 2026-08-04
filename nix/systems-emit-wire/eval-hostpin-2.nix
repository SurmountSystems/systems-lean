# SPDX-License-Identifier: Unlicense
# HostPin / claim-path scanners for systems-emit-wire (Sub-1-KLOC slice).
# env: flattened specs + helpers + prior slice greens. Pure Nix. No bash.
env:
with env;
rec {
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
      "def productPathPerformDependsOnLake : Bool := false"
      "productPathPerformReadPartialReady"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "ProductPathComposePlan"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathPerformDependsOnLake : Bool := false"
      "productPathPerformComposePartialReady"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "ProductPathWriteHc"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathPerformDependsOnLake : Bool := false"
      "productPathPerformWriteHcPartialReady"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathPerformDependsOnLake : Bool := false"
      "productPathFreestandingCapablePartialReady"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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

}
