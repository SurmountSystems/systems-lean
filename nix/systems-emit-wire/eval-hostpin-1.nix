# SPDX-License-Identifier: Unlicense
# HostPin / claim-path scanners for systems-emit-wire (Sub-1-KLOC slice).
# env: flattened specs + helpers + prior slice greens. Pure Nix. No bash.
env:
with env;
rec {
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
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathHostLakeBootstrapRemains : Bool := true"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
      "theorem productWriterSurfacePartialReady_true"
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
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathPerformDependsOnLake : Bool := false"
      "productPathOwnershipInputsPartialReady"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "ProductPathPerform"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathPerformDependsOnLake : Bool := false"
      "productPathPerformPartialReady"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "ProductPathPerformStep"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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
      "def productPathPerformDependsOnLake : Bool := false"
      "productPathPerformStepPartialReady"
      "def productPathFreestandingOwnershipClaimed : Bool := true"
      "def productPathHostLakeBootstrapRemains : Bool := true"
      "ProductPathReadSsot"
    ])
    ++ (scan "src/systems/SystemsLean/SelfApplyFsTheorems.lean" (readRel "src/systems/SystemsLean/SelfApplyFsTheorems.lean") [
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

}
