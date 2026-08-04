# SPDX-License-Identifier: Unlicense
# HostPin / claim-path scanners for systems-emit-wire (Sub-1-KLOC slice).
# env: flattened specs + helpers + prior slice greens. Pure Nix. No bash.
env:
with env;
rec {
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
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathPerformDependsOnLake : Bool := false"
      "PerformEvidence"
      "productPathOwnershipRegeneratePartialReady"
      "def productPathOwnershipRegenerateProductPathAuthorityClaimed : Bool := true"
      "def productPathOwnershipRegenerateWithoutLake : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathPerformDependsOnLake : Bool := false"
      "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
      "def productPathOfficialPathStillUsesLake : Bool := false"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "OfficialPath"
      "productPathFreestandingPerformEvidencePartialReady"
      "def productPathFreestandingPerformEvidenceClaimed : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathPerformDependsOnLake : Bool := false"
      "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
      "def productPathOfficialPathStillUsesLake : Bool := false"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "OfficialPathAlternate"
      "productPathFreestandingPerformOfficialPathPartialReady"
      "def productPathFreestandingPerformOfficialPathGapMeasured : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathPerformDependsOnLake : Bool := false"
      "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
      "def productPathOfficialPathStillUsesLake : Bool := false"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
      "DualEqWriteParity"
      "productPathFreestandingPerformOfficialPathAlternatePartialReady"
      "def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathPerformDependsOnLake : Bool := false"
      "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
      "def productPathOfficialPathStillUsesLake : Bool := false"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
      "DualEqWriteClosePath"
      "productPathFreestandingPerformDualEqualityWriteParityPartialReady"
      "def productPathFreestandingPerformDualEqualityWriteParityMeasured : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathPerformDependsOnLake : Bool := false"
      "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
      "def productPathOfficialPathStillUsesLake : Bool := false"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
      "freestandingDualEqualityWriteFreestandingHc"
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-DUAL-EQUALITY-API"
      "DualEqWriteApi"
      "productPathFreestandingPerformDualEqualityWriteClosePathPartialReady"
      "def productPathFreestandingPerformDualEqualityWriteClosePathMeasured : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathPerformDependsOnLake : Bool := false"
      "def productPathOfficialPathStillUsesFreestandingEmit : Bool := false"
      "def productPathOfficialPathStillUsesLake : Bool := false"
      "def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false"
      "def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false"
      "FREESTANDING-DUAL-EQUALITY-WRITE-CLOSE-STEP-CAPABLE-GAP"
      "DualEqWriteCapableGap"
      "productPathFreestandingPerformDualEqualityWriteApiPartialReady"
      "def productPathFreestandingPerformDualEqualityWriteApiMeasured : Bool := true"
      "def freestandingProductSelfHostComplete : Bool := true"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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

}
