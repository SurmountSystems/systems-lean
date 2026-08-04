# Modular just: just/host.just -- host residual + front-mult recipes.
host-residual-shrink:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    just_sources=("$root/justfile" "$root"/just/*.just)
    mod="$lean_dir/HostResidualShrink.lean"
    dual_residual="$lean_dir/DualResidual.lean"
    echo "== host-residual-shrink (peer step 10; partial shrink inventory) =="
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$dual_residual" ]]; then
      echo "error: missing $dual_residual" >&2
      exit 1
    fi
    for tok in \
      hostResidualShrinkReady \
      hostResidualShrinkFinishedClaimed \
      hostResidualPartialShrinkClaimed \
      hostDevelopMeasuredPathsLakeFreeEvidence \
      hostResidualShrinkHostElaborateRemains \
      hostResidualShrinkHostFreeClaimed \
      hostResidualShrinkKeepsHostResidual \
      hostResidualShrinkDoesNotMeanHostFree \
      hostResidualShrinkFreeIsNotLakeGone \
      justRecipeHostResidualShrink \
      host-residual-shrink \
      hostResidualShrinkBootstrapPrebuildRemains \
      hostResidualShrinkFullHostElaborateRemains \
      hostResidualShrinkDiagnosticLakeRecipesRemain \
      measuredHostFoundationToolsCleanBootstrap \
      host-foundation-tools-clean-bootstrap \
      measuredHostFoundationToolsInventory \
      fragment-check+graph+package-write+package-roots+import-graph+module-check \
      hostFoundationToolsBinLinkWithoutLakeDualOk \
      justRecipeHostFoundationToolsCleanBootstrap \
      Foundation tools without Lake bootstrap \
      Host tool build expand \
      host-develop-tools-clean-bootstrap \
      host-front-without-lake \
      subset-front-without-lake \
      front-mult-package-without-lake \
      mult-subset-rebuild-without-lake \
      first-surface-without-lake \
      hostDevelopToolsBinLinkWithoutLakeDualOk \
      hostFrontWithoutLakeDualOk \
      subsetFrontWithoutLakeDualOk \
      frontMultPackageWithoutLakeDualOk \
      multSubsetRebuildWithoutLakeDualOk \
      firstSurfaceWithoutLakeDualOk \
      fragment-check+graph+package-write+package-roots+import-graph+module-check+host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface \
      empty \
      measuredHostLakeFreeFragmentCheck \
      measuredHostLakeFreeGraph \
      measuredHostLakeFreePackageWrite \
      measuredHostLakeFreePackageRoots \
      hostPackageRootsLoadDualOk \
      measuredHostLakeFreeImportGraph \
      hostImportGraphMultSeedDualOk \
      measuredHostLakeFreeModuleCheck \
      hostModuleCheckMultSeedDualOk \
      measuredHostRealModuleSeedUnits \
      hostImportGraphExpandSeedDualOk \
      hostModuleCheckExpandSeedDualOk \
      Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems \
      measuredHostPeerFragmentUnits \
      measuredHostLakeFreePackageUnits \
      hostPackageWriteMultLinearDualOk \
      hostPackageWriteMultLinearTypesDualOk \
      hostPackageWriteProgramPackageDualOk \
      hostPackageWriteGraphPackageDualOk \
      hostPackageWriteComposePackageDualOk \
      hostResidualShrinkInventoryReseeded \
      freeDesignNotePath \
      Mult+Linear+Types+Program+Graph+Compose \
      Mult+MultSubsetEmit+Linear+Types+Program+Graph+Compose \
      host-fragment-check-without-lake \
      host-graph-without-lake \
      host-package-write-without-lake \
      host-package-roots-without-lake \
      host-import-graph-without-lake \
      host-module-check-without-lake \
      HOST-PACKAGE-ROOTS \
      HOST-IMPORT-GRAPH \
      HOST-MODULE-CHECK \
      HOST-RESIDUAL-SHRINK \
      SLAKE_HOST_RESIDUAL_SHRINK_V0 \
      HOST-HOST-RESIDUAL-SHRINK
    do
      if ! grep -qF "$tok" "$mod"; then
        echo "error: missing $tok in $mod" >&2
        exit 1
      fi
    done
    if ! grep -qE 'def hostResidualShrinkFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostResidualShrinkFinishedClaimed must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostResidualPartialShrinkClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostResidualPartialShrinkClaimed must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostResidualShrinkHostElaborateRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostResidualShrinkHostElaborateRemains must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostResidualShrinkHostFreeClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod"; then
      echo "error: hostResidualShrinkHostFreeClaimed must be false (do not forge host free)" >&2
      exit 1
    fi
    if ! grep -qE 'def hostResidualShrinkInventoryReseeded[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostResidualShrinkInventoryReseeded must be true after 3b-N reseed" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageWriteMultLinearDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostPackageWriteMultLinearDualOk must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageWriteMultLinearTypesDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostPackageWriteMultLinearTypesDualOk must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageWriteProgramPackageDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostPackageWriteProgramPackageDualOk must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageWriteGraphPackageDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostPackageWriteGraphPackageDualOk must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageWriteComposePackageDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostPackageWriteComposePackageDualOk must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageRootsLoadDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostPackageRootsLoadDualOk must be true (A3 package roots)" >&2
      exit 1
    fi
    if ! grep -qF 'host-package-roots-without-lake' "$mod"; then
      echo "error: measuredHostLakeFreePackageRoots must cite host-package-roots-without-lake" >&2
      exit 1
    fi
    if ! grep -qE 'def hostImportGraphMultSeedDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostImportGraphMultSeedDualOk must be true (A4 real Mult import graph)" >&2
      exit 1
    fi
    if ! grep -qF 'host-import-graph-without-lake' "$mod"; then
      echo "error: measuredHostLakeFreeImportGraph must cite host-import-graph-without-lake" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckMultSeedDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostModuleCheckMultSeedDualOk must be true (A5 first real host module check)" >&2
      exit 1
    fi
    if ! grep -qF 'host-module-check-without-lake' "$mod"; then
      echo "error: measuredHostLakeFreeModuleCheck must cite host-module-check-without-lake" >&2
      exit 1
    fi
    if ! grep -qE 'def hostImportGraphExpandSeedDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostImportGraphExpandSeedDualOk must be true (A6 host module set expand)" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckExpandSeedDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostModuleCheckExpandSeedDualOk must be true (A6 host module set expand)" >&2
      exit 1
    fi
    if ! grep -qF 'Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems' "$mod"; then
      echo "error: measuredHostRealModuleSeedUnits must cite Mult+...+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems seed" >&2
      exit 1
    fi
    if ! grep -qF 'Host library seed expand continue' "$mod"; then
      echo "error: HostResidualShrink must cite Host library seed expand continue" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckTheoremCorpusExpandDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: hostModuleCheckTheoremCorpusExpandDualOk must be true (A7 theorem corpus expand)" >&2
      exit 1
    fi
    if ! grep -qF 'MultTheorems=8+LinearTheorems=8+TypesTheorems=8+IrProgramTheorems=6+IrGraphTheorems=6+HostComposeTheorems=8+ErasureTheorems=8+ExtractTheorems=8+KernelMultTheorems=8+KernelLinearTheorems=8+KernelTypesTheorems=8+KernelProgramTheorems=8+JoinMapTheorems=8+SelfHostTheorems=8+SurfaceMatrixTheorems=8' "$mod"; then
      echo "error: measuredHostTheoremCorpusRequiredCounts must cite A7+Kernel *Theorems corpus sizes" >&2
      exit 1
    fi
    if ! grep -qE 'def hostResidualShrinkBootstrapPrebuildRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod"; then
      echo "error: hostResidualShrinkBootstrapPrebuildRemains must be false (A8 peer exe Lake prebuild retired)" >&2
      exit 1
    fi
    for dual_ok in \
      hostFoundationToolsBinLinkWithoutLakeDualOk \
      hostDevelopToolsBinLinkWithoutLakeDualOk \
      hostFrontWithoutLakeDualOk \
      subsetFrontWithoutLakeDualOk \
      frontMultPackageWithoutLakeDualOk \
      multSubsetRebuildWithoutLakeDualOk \
      firstSurfaceWithoutLakeDualOk
    do
      if ! grep -qE "def ${dual_ok}[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true" "$mod"; then
        echo "error: ${dual_ok} must be true" >&2
        exit 1
      fi
    done
    # DualResidual: host residual remains true; host free false.
    if ! grep -qE 'def hostElaboratorResidualRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$dual_residual"; then
      echo "error: DualResidual hostElaboratorResidualRemains must remain true" >&2
      exit 1
    fi
    if grep -qE 'def hostElaboratorResidualRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$dual_residual"; then
      echo "error: forge ban: hostElaboratorResidualRemains false" >&2
      exit 1
    fi
    if ! grep -qE 'def hostElaboratorResidualFreeClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$dual_residual"; then
      echo "error: DualResidual hostElaboratorResidualFreeClaimed must stay false" >&2
      exit 1
    fi
    # justfile peer without-Lake recipes present.
    for recipe in \
      host-fragment-check-without-lake \
      host-graph-without-lake \
      host-package-write-without-lake \
      host-package-roots-without-lake \
      host-import-graph-without-lake \
      host-module-check-without-lake \
      host-foundation-tools-clean-bootstrap \
      host-develop-tools-clean-bootstrap \
      host-front-without-lake \
      subset-front-without-lake \
      front-mult-package-without-lake \
      mult-subset-rebuild-without-lake \
      first-surface-without-lake \
      host-residual-shrink
    do
      if ! grep -qE "^${recipe}:" "${just_sources[@]}"; then
        echo "error: missing just recipe '${recipe}:' in modular just tree (peer Lake-free dual)" >&2
        exit 1
      fi
    done
    # Ban forge: host free claimed true on inventory module.
    if grep -qE 'def hostResidualShrinkHostFreeClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: forge ban: hostResidualShrinkHostFreeClaimed true" >&2
      exit 1
    fi
    if grep -qE 'def hostResidualShrinkLlvmUnlocked[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: forge ban: hostResidualShrinkLlvmUnlocked true" >&2
      exit 1
    fi
    echo "host-residual-shrink: GREEN (A3-A10+++ dual-ok; residual remains; free false; not PROVABLY/llvm)"

# A8: rebuild foundation host tool ELFs without lake (leanc from IR + .rsp).
# bin-only clean here; total .lake wipe still needs classic Lake once then re-run.
# Greppable: host-foundation-tools-clean-bootstrap, HOST-FOUNDATION-TOOLS-CLEAN-BOOTSTRAP,
# measuredHostFoundationToolsCleanBootstrap, hostFoundationToolsBinLinkWithoutLakeDualOk,
# Foundation tools without Lake bootstrap.
host-foundation-tools-clean-bootstrap:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    bin_dir="$systems_dir/.lake/build/bin"
    mod="$lean_dir/HostResidualShrink.lean"
    echo "== host-foundation-tools-clean-bootstrap (A8; no lake on this step) =="
    echo "  policy: relink foundation host tool ELFs with leanc from existing IR+rsp"
    echo "  inventory: fragment-check+graph+package-write+package-roots+import-graph+module-check"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    for tok in \
      host-foundation-tools-clean-bootstrap \
      measuredHostFoundationToolsCleanBootstrap \
      hostFoundationToolsBinLinkWithoutLakeDualOk \
      hostResidualShrinkBootstrapPrebuildRemains \
      fragment-check+graph+package-write+package-roots+import-graph+module-check
    do
      if ! grep -qF "$tok" "$mod"; then
        echo "error: missing $tok in $mod" >&2
        exit 1
      fi
    done
    if ! grep -qE 'def hostResidualShrinkBootstrapPrebuildRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod"; then
      echo "error: hostResidualShrinkBootstrapPrebuildRemains must be false (A8)" >&2
      exit 1
    fi
    if ! command -v leanc >/dev/null 2>&1; then
      echo "error: leanc not on PATH (need host Lean toolchain; not lake)" >&2
      exit 1
    fi
    tools=(
      slake-host-fragment-check
      slake-host-graph
      slake-host-package-write
      slake-host-package-roots
      slake-host-import-graph
      slake-host-module-check
    )
    mkdir -p "$bin_dir"
    for tool in "${tools[@]}"; do
      bin="$bin_dir/$tool"
      rsp="$bin.rsp"
      if [[ ! -f "$rsp" ]]; then
        echo "error: missing link response file: $rsp" >&2
        echo "  clean-tree policy: total .lake wipe still needs classic Lake once to restore IR+rsp" >&2
        echo "  (FullHostElaborateRemains): (cd src/systems && lake build $tool)" >&2
        echo "  then re-run: just host-foundation-tools-clean-bootstrap" >&2
        exit 1
      fi
      # Fail closed if any object listed in rsp is missing (IR not restored).
      while IFS= read -r line; do
        # rsp object lines are quoted absolute paths ending in .c.o.export
        if [[ "$line" == *".c.o.export"* ]]; then
          obj="${line//\"/}"
          if [[ ! -f "$obj" ]]; then
            echo "error: missing Lake IR object for $tool: $obj" >&2
            echo "  clean-tree policy: restore IR with classic Lake library/exe elaborate once" >&2
            echo "  then re-run: just host-foundation-tools-clean-bootstrap" >&2
            exit 1
          fi
        fi
      done < "$rsp"
      echo "  relink (leanc, no lake): $tool"
      rm -f "$bin"
      # Hot path for this recipe: leanc only. Do not call lake build/exe/env.
      leanc -o "$bin" @"$rsp"
      if [[ ! -x "$bin" ]]; then
        echo "error: leanc did not produce executable $bin" >&2
        exit 1
      fi
    done
    echo "host-foundation-tools-clean-bootstrap: GREEN (6 foundation tools relinked with leanc; no lake; peer exe Lake prebuild retired; FullHostElaborateRemains; host residual remains; not PROVABLY/llvm)"

# M5 Name B: front-end Mult package path (SubsetFront G1 accept then Mult package write).
# Measured: SubsetFront accepts golden G1, Mult unit package write, dual package greps.
# Product StillUsesLake / DependsOnLake stay true. Name A join pin unchanged.
# Greppable: front-mult-package, FRONT-MULT-PACKAGE, frontMultPackageFinishedClaimed,
# frontMultPackageReady, justRecipeFrontMultPackage, SLAKE_FRONT_MULT_PACKAGE_V0.
front-mult-package:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    emit_dir="$systems_dir/emit"
    goldens_dir="$systems_dir/goldens/mult-front"
    mod="$lean_dir/FrontMultPackage.lean"
    main_mod="$lean_dir/FrontMultPackageMain.lean"
    join_mod="$lean_dir/SubsetPackageJoin.lean"
    echo "== front-mult-package (M5 front-end Mult package path) =="
    echo "  path: SubsetFront G1 accept -> Mult package write -> dual greps"
    echo "  dual: Lean frontMultPackageReady + emit/slake_mult_subset stage token"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'frontMultPackageFinishedClaimed' "$mod"; then
      echo "error: missing frontMultPackageFinishedClaimed in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'frontMultPackageReady' "$mod"; then
      echo "error: missing frontMultPackageReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'justRecipeFrontMultPackage' "$mod"; then
      echo "error: missing justRecipeFrontMultPackage in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'front-mult-package' "$mod"; then
      echo "error: missing front-mult-package cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'frontMultPackageG1Ready' "$mod"; then
      echo "error: missing frontMultPackageG1Ready in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetFrontGoodG1' "$mod"; then
      echo "error: missing subsetFrontGoodG1 cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_FRONT_MULT_PACKAGE_V0' "$mod"; then
      echo "error: missing SLAKE_FRONT_MULT_PACKAGE_V0 stage id in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'acceptG1Golden' "$mod"; then
      echo "error: missing acceptG1Golden in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'multSubsetEmitWrite' "$mod"; then
      echo "error: missing multSubsetEmitWrite in $mod" >&2
      exit 1
    fi
    if [[ ! -f "$goldens_dir/good-mult-classic.slake-mult" ]]; then
      echo "error: missing G1 golden $goldens_dir/good-mult-classic.slake-mult" >&2
      exit 1
    fi
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; front-mult-package requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-front-mult-package
      lake exe slake-front-mult-package -- "$root"
    )
    out_h="$emit_dir/slake_mult_subset.h"
    out_c="$emit_dir/slake_mult_subset.c"
    if [[ ! -f "$out_h" ]]; then
      echo "error: missing Mult package header after front path: $out_h" >&2
      exit 1
    fi
    if [[ ! -f "$out_c" ]]; then
      echo "error: missing Mult package source after front path: $out_c" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_MULT_SUBSET_EMIT_V0' "$out_h"; then
      echo "error: $out_h missing greppable token SLAKE_MULT_SUBSET_EMIT_V0" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_MULT_SUBSET_EMIT_V0' "$out_c"; then
      echo "error: $out_c missing greppable token SLAKE_MULT_SUBSET_EMIT_V0" >&2
      exit 1
    fi
    if ! grep -qF 'MULT-0' "$out_h"; then
      echo "error: $out_h missing MULT-0 after front path" >&2
      exit 1
    fi
    if ! grep -qF 'MULT-OMEGA' "$out_c"; then
      echo "error: $out_c missing MULT-OMEGA after front path" >&2
      exit 1
    fi
    # Structural Name B finished pin must stay true.
    if ! grep -qE 'def frontMultPackageFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: frontMultPackageFinishedClaimed must be true for M5 Name B" >&2
      exit 1
    fi
    if ! grep -qE 'def stillUsesLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: stillUsesLake must stay true (product host residual remains)" >&2
      exit 1
    fi
    if ! grep -qE 'def dependsOnLake[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod"; then
      echo "error: dependsOnLake must stay true (product host residual remains)" >&2
      exit 1
    fi
    # Name A join pin and Mult freestanding driver complete stay true (unchanged).
    if [[ -f "$join_mod" ]]; then
      if ! grep -qE 'def subsetPackageJoinFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$join_mod"; then
        echo "error: subsetPackageJoinFinishedClaimed must stay true (Name A unchanged)" >&2
        exit 1
      fi
    fi
    echo "front-mult-package: GREEN"

# Ideal ladder M3 Mult subset language front-end: parse/check good+bad goldens
# under src/systems/goldens/mult-front/ (not only fixed Mult fixtures). Lake host remains.
# Greppable: subset-front, slake-subset-front, SUBSET-FRONT, SLAKE_SUBSET_FRONT,
# subsetFrontReady, goldens/mult-front, FAIL-CLOSED-UNKNOWN-GRADE.
subset-front:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    goldens_dir="$systems_dir/goldens/mult-front"
    echo "== subset-front (M3 Mult subset language front-end) =="
    echo "  input: goldens/mult-front G1/G2 + B1/B2/B3"
    echo "  output: subsetFrontReady (parse+check); Lake host remains"
    mod="$lean_dir/SubsetFront.lean"
    main_mod="$lean_dir/SubsetFrontMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetFrontReady' "$mod"; then
      echo "error: missing subsetFrontReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_SUBSET_FRONT_V0' "$mod"; then
      echo "error: missing SLAKE_SUBSET_FRONT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'parseSource' "$mod"; then
      echo "error: missing parseSource in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetFrontGoodG1' "$mod"; then
      echo "error: missing subsetFrontGoodG1 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'subsetFrontBadB1' "$mod"; then
      echo "error: missing subsetFrontBadB1 in $mod" >&2
      exit 1
    fi
    for f in good-mult-classic.slake-mult good-single-value.slake-mult \
             bad-unknown-grade.slake-mult bad-kind-mult-mismatch.slake-mult \
             bad-empty.slake-mult; do
      if [[ ! -f "$goldens_dir/$f" ]]; then
        echo "error: missing golden $goldens_dir/$f" >&2
        exit 1
      fi
    done
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; subset-front requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-subset-front
      lake exe slake-subset-front -- "$root"
    )
    if ! grep -qF 'MULT-0' "$goldens_dir/good-mult-classic.slake-mult"; then
      echo "error: G1 golden missing MULT-0" >&2
      exit 1
    fi
    if ! grep -qF 'MULT-OMEGA' "$goldens_dir/good-single-value.slake-mult"; then
      echo "error: G2 golden missing MULT-OMEGA" >&2
      exit 1
    fi
    if ! grep -qF 'MULT-9' "$goldens_dir/bad-unknown-grade.slake-mult"; then
      echo "error: B1 golden missing MULT-9" >&2
      exit 1
    fi
    echo "subset-front: GREEN (M3 Mult subset language goldens accept/reject; Lake host remains; not S4; not PROVABLY/llvm)"

# Peer elaborator Mult-first host fragment front-end: parse dialect -> HostTerm IR;
# goldens under src/systems/goldens/host-front/ accept/reject. Lake host remains.
# Greppable: host-front, slake-host-front, HOST-FRONT, SLAKE_HOST_FRONT,
# hostFrontReady, goldens/host-front, EMPTY-MODULE-FAIL-CLOSED.
host-front:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    goldens_dir="$systems_dir/goldens/host-front"
    echo "== host-front (Mult-first host fragment front-end) =="
    echo "  input: goldens/host-front G1/G2/G3 + B1/B2/B3/B4"
    echo "  output: hostFrontReady (parse+isWellFormed); host residual remains"
    mod="$lean_dir/HostFront.lean"
    main_mod="$lean_dir/HostFrontMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFrontReady' "$mod"; then
      echo "error: missing hostFrontReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_HOST_FRONT_V0' "$mod"; then
      echo "error: missing SLAKE_HOST_FRONT_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'HOST-FRONT' "$mod"; then
      echo "error: missing HOST-FRONT in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'parseSource' "$mod"; then
      echo "error: missing parseSource in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFrontGoodG1' "$mod"; then
      echo "error: missing hostFrontGoodG1 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFrontGoodG3' "$mod"; then
      echo "error: missing hostFrontGoodG3 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFrontGoodG4' "$mod"; then
      echo "error: missing hostFrontGoodG4 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFrontGoodG5' "$mod"; then
      echo "error: missing hostFrontGoodG5 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFrontGoodG6' "$mod"; then
      echo "error: missing hostFrontGoodG6 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFrontGoodG7' "$mod"; then
      echo "error: missing hostFrontGoodG7 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFrontBadB1' "$mod"; then
      echo "error: missing hostFrontBadB1 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFrontHostElaboratorResidualRemains' "$mod"; then
      echo "error: missing host residual honesty in $mod" >&2
      exit 1
    fi
    for f in good-mult-fixture.slake-host good-mult-mini.slake-host \
             good-linear-mini.slake-host good-types-mini.slake-host \
             good-program-mini.slake-host good-graph-mini.slake-host \
             good-compose-mini.slake-host \
             bad-empty.slake-host bad-line-shape.slake-host \
             bad-unknown-cmd.slake-host bad-zero-ctor.slake-host; do
      if [[ ! -f "$goldens_dir/$f" ]]; then
        echo "error: missing golden $goldens_dir/$f" >&2
        exit 1
      fi
    done
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; host-front requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-host-front
      lake exe slake-host-front -- "$root"
    )
    if ! grep -qF 'mult0' "$goldens_dir/good-mult-fixture.slake-host"; then
      echo "error: G1 golden missing mult0" >&2
      exit 1
    fi
    if ! grep -qF 'ofNat?' "$goldens_dir/good-mult-fixture.slake-host"; then
      echo "error: G1 golden missing ofNat?" >&2
      exit 1
    fi
    if ! grep -qF 'LINEAR-EXACT-ONCE' "$goldens_dir/good-linear-mini.slake-host"; then
      echo "error: G3 golden missing LINEAR-EXACT-ONCE" >&2
      exit 1
    fi
    if ! grep -qF 'shareNat' "$goldens_dir/good-linear-mini.slake-host"; then
      echo "error: G3 golden missing shareNat" >&2
      exit 1
    fi
    if ! grep -qF 'TYPED_IR_V0' "$goldens_dir/good-types-mini.slake-host"; then
      echo "error: G4 golden missing TYPED_IR_V0" >&2
      exit 1
    fi
    if ! grep -qF 'KIND-MULT-OK' "$goldens_dir/good-types-mini.slake-host"; then
      echo "error: G4 golden missing KIND-MULT-OK" >&2
      exit 1
    fi
    if ! grep -qF 'IR_PROGRAM_V0' "$goldens_dir/good-program-mini.slake-host"; then
      echo "error: G5 golden missing IR_PROGRAM_V0" >&2
      exit 1
    fi
    if ! grep -qF 'ORDERED-IR-PROGRAM' "$goldens_dir/good-program-mini.slake-host"; then
      echo "error: G5 golden missing ORDERED-IR-PROGRAM" >&2
      exit 1
    fi
    if ! grep -qF 'IR_GRAPH_EDGES_V0' "$goldens_dir/good-graph-mini.slake-host"; then
      echo "error: G6 golden missing IR_GRAPH_EDGES_V0" >&2
      exit 1
    fi
    if ! grep -qF 'EMPTY-GRAPH-OK' "$goldens_dir/good-graph-mini.slake-host"; then
      echo "error: G6 golden missing EMPTY-GRAPH-OK" >&2
      exit 1
    fi
    if ! grep -qF 'HOST_COMPOSE_V0' "$goldens_dir/good-compose-mini.slake-host"; then
      echo "error: G7 golden missing HOST_COMPOSE_V0" >&2
      exit 1
    fi
    if ! grep -qF 'HOST-COMPOSE' "$goldens_dir/good-compose-mini.slake-host"; then
      echo "error: G7 golden missing HOST-COMPOSE" >&2
      exit 1
    fi
    if ! grep -qF 'COMPOSE-FIXTURE' "$goldens_dir/good-compose-mini.slake-host"; then
      echo "error: G7 golden missing COMPOSE-FIXTURE" >&2
      exit 1
    fi
    if ! grep -qF 'EMPTY-MODULE-FAIL-CLOSED' "$goldens_dir/bad-empty.slake-host"; then
      echo "error: B1 golden missing EMPTY-MODULE-FAIL-CLOSED comment" >&2
      exit 1
    fi
    echo "host-front: GREEN (Mult-first+Linear+Types+Program+Graph+Compose expand goldens accept/reject; host residual remains; not peer green; not PROVABLY/llvm)"

# Peer elaborator Mult-first host fragment check: measured corpus driver
# (G* accept, B* reject fail-closed). Lake-built host binary OK (step 4).
# Reuses HostFront goldens; named check surface hostFragmentCheckReady.
# Greppable: host-fragment-check, slake-host-fragment-check, HOST-FRAGMENT-CHECK,
# SLAKE_HOST_FRAGMENT_CHECK, hostFragmentCheckReady, hostFragmentCheckFinishedClaimed.
host-fragment-check:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    goldens_dir="$systems_dir/goldens/host-front"
    echo "== host-fragment-check (Mult-first host fragment check) =="
    echo "  input: goldens/host-front G1/G2/G3/G4/G5/G6/G7 + B1/B2/B3/B4"
    echo "  output: hostFragmentCheckReady / finished; host residual remains; Lake OK"
    mod="$lean_dir/HostCheck.lean"
    main_mod="$lean_dir/HostCheckMain.lean"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$main_mod" ]]; then
      echo "error: missing $main_mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckReady' "$mod"; then
      echo "error: missing hostFragmentCheckReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckFinishedClaimed' "$mod"; then
      echo "error: missing hostFragmentCheckFinishedClaimed in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'SLAKE_HOST_FRAGMENT_CHECK_V0' "$mod"; then
      echo "error: missing SLAKE_HOST_FRAGMENT_CHECK_V0 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'HOST-FRAGMENT-CHECK' "$mod"; then
      echo "error: missing HOST-FRAGMENT-CHECK in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckCorpusOk' "$mod"; then
      echo "error: missing hostFragmentCheckCorpusOk in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckGoodG3' "$mod"; then
      echo "error: missing hostFragmentCheckGoodG3 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckGoodG4' "$mod"; then
      echo "error: missing hostFragmentCheckGoodG4 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckGoodG5' "$mod"; then
      echo "error: missing hostFragmentCheckGoodG5 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckGoodG6' "$mod"; then
      echo "error: missing hostFragmentCheckGoodG6 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckGoodG7' "$mod"; then
      echo "error: missing hostFragmentCheckGoodG7 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckWithoutLakeFinished' "$mod"; then
      echo "error: missing without-Lake honesty pin in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckHostElaboratorResidualRemains' "$mod"; then
      echo "error: missing host residual honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'EMPTY-MODULE-FAIL-CLOSED' "$mod"; then
      echo "error: missing EMPTY-MODULE-FAIL-CLOSED in $mod" >&2
      exit 1
    fi
    for f in good-mult-fixture.slake-host good-mult-mini.slake-host \
             good-linear-mini.slake-host good-types-mini.slake-host \
             good-program-mini.slake-host good-graph-mini.slake-host \
             good-compose-mini.slake-host \
             bad-empty.slake-host bad-line-shape.slake-host \
             bad-unknown-cmd.slake-host bad-zero-ctor.slake-host; do
      if [[ ! -f "$goldens_dir/$f" ]]; then
        echo "error: missing golden $goldens_dir/$f" >&2
        exit 1
      fi
    done
    if ! command -v lake >/dev/null 2>&1; then
      echo "error: lake not on PATH; host-fragment-check requires host Lean pin" >&2
      exit 1
    fi
    (
      cd "$systems_dir"
      lake build slake-host-fragment-check
      lake exe slake-host-fragment-check -- "$root"
    )
    if ! grep -qF 'mult0' "$goldens_dir/good-mult-fixture.slake-host"; then
      echo "error: G1 golden missing mult0" >&2
      exit 1
    fi
    if ! grep -qF 'LINEAR-EXACT-ONCE' "$goldens_dir/good-linear-mini.slake-host"; then
      echo "error: G3 golden missing LINEAR-EXACT-ONCE" >&2
      exit 1
    fi
    if ! grep -qF 'TYPED_IR_V0' "$goldens_dir/good-types-mini.slake-host"; then
      echo "error: G4 golden missing TYPED_IR_V0" >&2
      exit 1
    fi
    if ! grep -qF 'IR_PROGRAM_V0' "$goldens_dir/good-program-mini.slake-host"; then
      echo "error: G5 golden missing IR_PROGRAM_V0" >&2
      exit 1
    fi
    if ! grep -qF 'IR_GRAPH_EDGES_V0' "$goldens_dir/good-graph-mini.slake-host"; then
      echo "error: G6 golden missing IR_GRAPH_EDGES_V0" >&2
      exit 1
    fi
    if ! grep -qF 'HOST_COMPOSE_V0' "$goldens_dir/good-compose-mini.slake-host"; then
      echo "error: G7 golden missing HOST_COMPOSE_V0" >&2
      exit 1
    fi
    if ! grep -qF 'COMPOSE-FIXTURE' "$goldens_dir/good-compose-mini.slake-host"; then
      echo "error: G7 golden missing COMPOSE-FIXTURE" >&2
      exit 1
    fi
    if ! grep -qF 'EMPTY-MODULE-FAIL-CLOSED' "$goldens_dir/bad-empty.slake-host"; then
      echo "error: B1 golden missing EMPTY-MODULE-FAIL-CLOSED comment" >&2
      exit 1
    fi
    if ! grep -qF 'LINE-SHAPE' "$goldens_dir/bad-line-shape.slake-host"; then
      echo "error: B2 golden missing LINE-SHAPE comment" >&2
      exit 1
    fi
    if ! grep -qF 'UNKNOWN-CMD' "$goldens_dir/bad-unknown-cmd.slake-host"; then
      echo "error: B3 golden missing UNKNOWN-CMD comment" >&2
      exit 1
    fi
    if ! grep -qF 'ZERO-CTOR-INDUCTIVE' "$goldens_dir/bad-zero-ctor.slake-host"; then
      echo "error: B4 golden missing ZERO-CTOR-INDUCTIVE comment" >&2
      exit 1
    fi
    echo "host-fragment-check: GREEN (corpus G1/G2/G3/G4/G5/G6/G7 accept B1-B4 reject; hostFragmentCheckReady; Lake OK; host residual remains; not PROVABLY/llvm)"

# Peer elaborator Mult-first host fragment check without Lake on hot path
# (plan-peer-elaborator step 5 Name A prebuilt). Same corpus as host-fragment-check.
# Bootstrap once: (cd src/systems && lake build slake-host-fragment-check).
# Hot path: exec prebuilt ELF only. No lake build / lake exe / lake env.
# Host elaborator residual remains (Lake still for host develop bootstrap).
# Product StillUsesLake/DependsOnLake stay false (product tip; not host free).
# Greppable: host-fragment-check-without-lake, HOST-FRAGMENT-CHECK-WITHOUT-LAKE,
# hostFragmentCheckWithoutLakeFinished, hostFragmentCheckWithoutLakeReady,
# justRecipeWithoutLake, prebuiltHostFragmentCheckRel,
# hostFragmentCheckWithoutLakeKeepsHostLake.
host-fragment-check-without-lake:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    goldens_dir="$systems_dir/goldens/host-front"
    prebuilt="$systems_dir/.lake/build/bin/slake-host-fragment-check"
    mod="$lean_dir/HostCheck.lean"
    echo "== host-fragment-check-without-lake (step 5; no lake on hot path) =="
    echo "  prebuilt: $prebuilt"
    echo "  input: goldens/host-front G1/G2/G3/G4/G5/G6/G7 + B1/B2/B3/B4"
    echo "  output: hostFragmentCheckWithoutLakeFinished / Ready; host residual remains"
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckWithoutLakeFinished' "$mod"; then
      echo "error: missing hostFragmentCheckWithoutLakeFinished in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'def hostFragmentCheckWithoutLakeFinished : Bool := true' "$mod"; then
      echo "error: hostFragmentCheckWithoutLakeFinished must be true in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckWithoutLakeReady' "$mod"; then
      echo "error: missing hostFragmentCheckWithoutLakeReady in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckWithoutLakeKeepsHostLake' "$mod"; then
      echo "error: missing hostFragmentCheckWithoutLakeKeepsHostLake in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'justRecipeWithoutLake' "$mod"; then
      echo "error: missing justRecipeWithoutLake pin in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'host-fragment-check-without-lake' "$mod"; then
      echo "error: missing host-fragment-check-without-lake cite in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'prebuiltHostFragmentCheckRel' "$mod"; then
      echo "error: missing prebuiltHostFragmentCheckRel in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'stillUsesLake' "$mod"; then
      echo "error: missing stillUsesLake honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckHostElaboratorResidualRemains' "$mod"; then
      echo "error: missing host residual honesty in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'HOST-FRAGMENT-CHECK-WITHOUT-LAKE' "$mod"; then
      echo "error: missing HOST-FRAGMENT-CHECK-WITHOUT-LAKE in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckGoodG4' "$mod"; then
      echo "error: missing hostFragmentCheckGoodG4 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckGoodG5' "$mod"; then
      echo "error: missing hostFragmentCheckGoodG5 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckGoodG6' "$mod"; then
      echo "error: missing hostFragmentCheckGoodG6 in $mod" >&2
      exit 1
    fi
    if ! grep -qF 'hostFragmentCheckGoodG7' "$mod"; then
      echo "error: missing hostFragmentCheckGoodG7 in $mod" >&2
      exit 1
    fi
    for f in good-mult-fixture.slake-host good-mult-mini.slake-host \
             good-linear-mini.slake-host good-types-mini.slake-host \
             good-program-mini.slake-host good-graph-mini.slake-host \
             good-compose-mini.slake-host \
             bad-empty.slake-host bad-line-shape.slake-host \
             bad-unknown-cmd.slake-host bad-zero-ctor.slake-host; do
      if [[ ! -f "$goldens_dir/$f" ]]; then
        echo "error: missing golden $goldens_dir/$f" >&2
        exit 1
      fi
    done
    if [[ ! -x "$prebuilt" ]]; then
      echo "error: missing prebuilt host fragment check binary: $prebuilt" >&2
      echo "  prefer (no lake): just host-foundation-tools-clean-bootstrap" >&2
      echo "  if IR/rsp missing (total wipe): (cd src/systems && lake build slake-host-fragment-check)" >&2
      echo "  then re-run: just host-fragment-check-without-lake" >&2
      exit 1
    fi
    # Hot path: run prebuilt ELF only. Do not call lake build / lake exe / lake env.
    echo "  hot path: exec prebuilt host fragment check (no lake)"
    "$prebuilt" "$root"
    if ! grep -qF 'mult0' "$goldens_dir/good-mult-fixture.slake-host"; then
      echo "error: G1 golden missing mult0" >&2
      exit 1
    fi
    if ! grep -qF 'LINEAR-EXACT-ONCE' "$goldens_dir/good-linear-mini.slake-host"; then
      echo "error: G3 golden missing LINEAR-EXACT-ONCE" >&2
      exit 1
    fi
    if ! grep -qF 'TYPED_IR_V0' "$goldens_dir/good-types-mini.slake-host"; then
      echo "error: G4 golden missing TYPED_IR_V0" >&2
      exit 1
    fi
    if ! grep -qF 'IR_PROGRAM_V0' "$goldens_dir/good-program-mini.slake-host"; then
      echo "error: G5 golden missing IR_PROGRAM_V0" >&2
      exit 1
    fi
    if ! grep -qF 'IR_GRAPH_EDGES_V0' "$goldens_dir/good-graph-mini.slake-host"; then
      echo "error: G6 golden missing IR_GRAPH_EDGES_V0" >&2
      exit 1
    fi
    if ! grep -qF 'HOST_COMPOSE_V0' "$goldens_dir/good-compose-mini.slake-host"; then
      echo "error: G7 golden missing HOST_COMPOSE_V0" >&2
      exit 1
    fi
    if ! grep -qF 'COMPOSE-FIXTURE' "$goldens_dir/good-compose-mini.slake-host"; then
      echo "error: G7 golden missing COMPOSE-FIXTURE" >&2
      exit 1
    fi
    if ! grep -qF 'EMPTY-MODULE-FAIL-CLOSED' "$goldens_dir/bad-empty.slake-host"; then
      echo "error: B1 golden missing EMPTY-MODULE-FAIL-CLOSED comment" >&2
      exit 1
    fi
    if ! grep -qF 'LINE-SHAPE' "$goldens_dir/bad-line-shape.slake-host"; then
      echo "error: B2 golden missing LINE-SHAPE comment" >&2
      exit 1
    fi
    if ! grep -qF 'UNKNOWN-CMD' "$goldens_dir/bad-unknown-cmd.slake-host"; then
      echo "error: B3 golden missing UNKNOWN-CMD comment" >&2
      exit 1
    fi
    if ! grep -qF 'ZERO-CTOR-INDUCTIVE' "$goldens_dir/bad-zero-ctor.slake-host"; then
      echo "error: B4 golden missing ZERO-CTOR-INDUCTIVE comment" >&2
      exit 1
    fi
    echo "host-fragment-check-without-lake: GREEN (G1-G7 accept B1-B4 reject; prebuilt; no lake hot path; host residual remains; not PROVABLY/llvm)"

# Peer elaborator Mult-first host fragment module graph (plan-peer-elaborator step 6).
# Multi-file Mult + MultSubsetEmit fragment import set; fail closed on
# MISSING-IMPORT / IMPORT-CYCLE. Lake-built host binary OK (bootstrap).
# Greppable: host-graph, slake-host-graph, HOST-GRAPH, SLAKE_HOST_GRAPH,
# hostGraphReady, hostGraphFinishedClaimed, goldens/host-graph, resolveGraph.
