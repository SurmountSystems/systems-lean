# Modular just: just/host.just -- host residual + front-mult recipes.
host-residual-shrink:
    #!/usr/bin/env bash
    set -euo pipefail
    root="$(pwd)"
    systems_dir="$root/src/systems"
    lean_dir="$systems_dir/SystemsLean"
    just_sources=("$root/justfile" "$root"/just/*.just)
    mod="$lean_dir/HostResidualShrink.lean"
    # TERM/PROOF/PACKAGE dual-ok pins live in TermOk companion (S1 long-file peel).
    mod_term="$lean_dir/HostResidualShrinkTermOk.lean"
    dual_residual="$lean_dir/DualResidual.lean"
    echo "== host-residual-shrink (peer step 10; partial shrink inventory) =="
    if [[ ! -f "$mod" ]]; then
      echo "error: missing $mod" >&2
      exit 1
    fi
    if [[ ! -f "$mod_term" ]]; then
      echo "error: missing $mod_term" >&2
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
      if ! grep -qF "$tok" "$mod" "$mod_term"; then
        echo "error: missing $tok in $mod or $mod_term" >&2
        exit 1
      fi
    done
    if ! grep -qE 'def hostResidualShrinkFinishedClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostResidualShrinkFinishedClaimed must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostResidualPartialShrinkClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostResidualPartialShrinkClaimed must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostResidualShrinkHostElaborateRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod" "$mod_term"; then
      echo "error: hostResidualShrinkHostElaborateRemains must be false (F1 free tip)" >&2
      exit 1
    fi
    if ! grep -qE 'def hostResidualShrinkHostFreeClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostResidualShrinkHostFreeClaimed must be true (F1 free dual-ok)" >&2
      exit 1
    fi
    if ! grep -qE 'def hostResidualShrinkInventoryReseeded[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostResidualShrinkInventoryReseeded must be true after 3b-N reseed" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageWriteMultLinearDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostPackageWriteMultLinearDualOk must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageWriteMultLinearTypesDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostPackageWriteMultLinearTypesDualOk must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageWriteProgramPackageDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostPackageWriteProgramPackageDualOk must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageWriteGraphPackageDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostPackageWriteGraphPackageDualOk must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageWriteComposePackageDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostPackageWriteComposePackageDualOk must be true" >&2
      exit 1
    fi
    if ! grep -qE 'def hostPackageRootsLoadDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostPackageRootsLoadDualOk must be true (A3 package roots)" >&2
      exit 1
    fi
    if ! grep -qF 'host-package-roots-without-lake' "$mod" "$mod_term"; then
      echo "error: measuredHostLakeFreePackageRoots must cite host-package-roots-without-lake" >&2
      exit 1
    fi
    if ! grep -qE 'def hostImportGraphMultSeedDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostImportGraphMultSeedDualOk must be true (A4 real Mult import graph)" >&2
      exit 1
    fi
    if ! grep -qF 'host-import-graph-without-lake' "$mod" "$mod_term"; then
      echo "error: measuredHostLakeFreeImportGraph must cite host-import-graph-without-lake" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckMultSeedDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckMultSeedDualOk must be true (A5 first real host module check)" >&2
      exit 1
    fi
    if ! grep -qF 'host-module-check-without-lake' "$mod" "$mod_term"; then
      echo "error: measuredHostLakeFreeModuleCheck must cite host-module-check-without-lake" >&2
      exit 1
    fi
    if ! grep -qE 'def hostImportGraphExpandSeedDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostImportGraphExpandSeedDualOk must be true (A6 host module set expand)" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckExpandSeedDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckExpandSeedDualOk must be true (A6 host module set expand)" >&2
      exit 1
    fi
    if ! grep -qF 'Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText+SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars+InventoryCloseTheorems+ProductPath+ProductPathTheorems+DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems' "$mod" "$mod_term"; then
      echo "error: measuredHostRealModuleSeedUnits must cite Mult+...+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText seed" >&2
      exit 1
    fi
    if ! grep -qF 'Check depth deepen continue' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite Check depth deepen continue (A58)" >&2
      exit 1
    fi
    if ! grep -qF 'FOUNDATION-KIND-SURFACE' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite FOUNDATION-KIND-SURFACE (A58)" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckTheoremCorpusExpandDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckTheoremCorpusExpandDualOk must be true (A7 theorem corpus expand)" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckDepthDeepenDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckDepthDeepenDualOk must be true (A58 Check depth deepen continue)" >&2
      exit 1
    fi
    if ! grep -qF 'MultTheorems=14+LinearTheorems=12+TypesTheorems=14+IrProgramTheorems=12+IrGraphTheorems=12+HostComposeTheorems=14+ErasureTheorems=14+ExtractTheorems=14+KernelMultTheorems=11+KernelLinearTheorems=12+KernelTypesTheorems=12+KernelProgramTheorems=12+KernelEmitTheorems=12+JoinMapTheorems=8+SelfHostTheorems=8+SurfaceMatrixTheorems=8' "$mod" "$mod_term"; then
      echo "error: measuredHostTheoremCorpusRequiredCounts must cite Mult..Extract + Kernel band expand corpus sizes" >&2
      exit 1
    fi
    if ! grep -qF 'Host library band complete' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite Host library band complete (A59)" >&2
      exit 1
    fi
    if ! grep -qE 'def measuredHostLibraryProductSeedCount[[:space:]]*:[[:space:]]*String[[:space:]]*:=[[:space:]]*"206"' "$mod" "$mod_term"; then
      echo "error: measuredHostLibraryProductSeedCount must be 206 (A59 L-band)" >&2
      exit 1
    fi
    if ! grep -qE 'def measuredHostLibraryLeftoverProductModules[[:space:]]*:[[:space:]]*String[[:space:]]*:=[[:space:]]*"empty"' "$mod" "$mod_term"; then
      echo "error: measuredHostLibraryLeftoverProductModules must be empty (A59 L-band)" >&2
      exit 1
    fi
    if ! grep -qF '*Main lake exe entrypoints' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must carve out *Main lake exe entrypoints (A59)" >&2
      exit 1
    fi
    if ! grep -qF 'HostImportGraph+HostImportGraphSeeds+HostImportGraphModel+HostImportGraphMods+HostImportGraphModsLater+HostImportGraphLoadOk+HostImportGraphLoadOkLater+HostImportGraphTheorems+HostImportGraphWalk+HostImportGraphWalkLater+HostImportGraphDriver+HostModuleCheck+HostModuleCheckFixtures+HostModuleCheckRequiredDecls+HostModuleCheckRequiredDeclsProduct+HostModuleCheckRequiredDeclsLater+HostModuleCheckFixtureTexts+HostModuleCheckFixtureTextsProduct+HostModuleCheckFixtureTextsLater+HostModuleCheckFixtureTextsSelfHost+HostModuleCheckFixtureTextsEmit+HostModuleCheckSurface+HostModuleCheckMultTerm+HostModuleCheckLinearTerm+HostModuleCheckTypesTerm+HostModuleCheckIrProgramTerm+HostModuleCheckIrGraphTerm+HostModuleCheckHostComposeTerm+HostModuleCheckErasureTerm+HostModuleCheckExtractTerm+HostModuleCheckEmitPlanTerm+HostModuleCheckEmitApplyTerm+HostModuleCheckEmitBodyTerm+HostModuleCheckKernelMultTerm+HostModuleCheckKernelLinearTerm+HostModuleCheckKernelTypesTerm+HostModuleCheckKernelProgramTerm+HostModuleCheckKernelEmitTerm+HostModuleCheckParityMultTerm+HostModuleCheckParityLinearTerm+HostModuleCheckParityTypesTerm+HostModuleCheckParityProgramTerm+HostModuleCheckParityEmitTerm+HostModuleCheckEmitMultScaffoldTerm+HostModuleCheckEmitLinearScaffoldTerm+HostModuleCheckEmitTypesScaffoldTerm+HostModuleCheckEmitProgramScaffoldTerm+HostModuleCheckEmitGraphScaffoldTerm+HostModuleCheckEmitComposeScaffoldTerm+HostModuleCheckEmitErasureScaffoldTerm+HostModuleCheckEmitExtractScaffoldTerm+HostModuleCheckEmitBannerScaffoldTerm+HostModuleCheckKernelSelfApplyTerm+HostModuleCheckProductOutKernelTerm+HostModuleCheckCompilePathTerm+HostModuleCheckJoinMapTerm+HostModuleCheckSelfHostTerm+HostModuleCheckSurfaceMatrixTerm+HostModuleCheckSpecProofTerm+HostModuleCheckDualResidualTerm+HostModuleCheckCompilePathMultTerm+HostModuleCheckCompilePathLinearTerm+HostModuleCheckCompilePathTypesTerm+HostModuleCheckCompilePathProgramTerm+HostModuleCheckCompilePathGraphTerm+HostModuleCheckCompilePathComposeTerm+HostModuleCheckCompilePathErasureTerm+HostModuleCheckCompilePathExtractTerm+HostModuleCheckCompilePathPlanTerm+HostModuleCheckCompilePathApplyTerm+HostModuleCheckCompilePathBodyTerm+HostModuleCheckFirstSurfaceTerm+HostModuleCheckLinearSubsetEmitTerm+HostModuleCheckTypesSubsetEmitTerm+HostModuleCheckProgramSubsetEmitTerm+HostModuleCheckGraphSubsetEmitTerm+HostModuleCheckComposeSubsetEmitTerm+HostModuleCheckErasureSubsetEmitTerm+HostModuleCheckExtractSubsetEmitTerm+HostModuleCheckMultSubsetEmitTerm+HostModuleCheckMultSubsetRebuildTerm+HostModuleCheckLinearSubsetRebuildTerm+HostModuleCheckTypesSubsetRebuildTerm+HostModuleCheckProgramSubsetRebuildTerm+HostModuleCheckGraphSubsetRebuildTerm+HostModuleCheckComposeSubsetRebuildTerm+HostModuleCheckErasureSubsetRebuildTerm+HostModuleCheckExtractSubsetRebuildTerm+HostModuleCheckHostFrontTerm+HostModuleCheckLlvmMultTextTerm+HostModuleCheckHostCheckTerm+HostModuleCheckHostGraphTerm+HostModuleCheckLlvmLinearTextTerm+HostModuleCheckMultFsWriteToolTerm+HostModuleCheckFrontMultPackageTerm+HostModuleCheckSubsetPackageJoinTerm+HostModuleCheckLlvmTypesTextTerm+HostModuleCheckMultFsDeepenTerm+HostModuleCheckHostPackageWriteTerm+HostModuleCheckLlvmProgramTextTerm+HostModuleCheckLlvmGraphTextTerm+HostModuleCheckLlvmComposeTextTerm+HostModuleCheckSelfApplyFsTerm+HostModuleCheckInventoryCloseTerm+HostModuleCheckProductPathBarsTerm+HostModuleCheckProductPathTerm+HostModuleCheckProbeWireTerm+HostModuleCheckSelfHostBodyTerm+HostModuleCheckLoadOkCompilePathUnits+HostModuleCheckLoadOkLaterTerm+HostModuleCheckRealModule+HostModuleCheckMultProof+HostModuleCheckLinearProof+HostModuleCheckTypesProof+HostModuleCheckKernelMultProof+HostModuleCheckKernelLinearProof+HostModuleCheckKernelTypesProof+HostModuleCheckKernelProgramProof+HostModuleCheckKernelEmitProof+HostModuleCheckPackageElab+HostModuleCheckPackageEnv+HostModuleCheckPackageEnvFixtures+HostModuleCheckPackageEnvFixturesU2+HostModuleCheckPackageEnvFixturesS5+HostModuleCheckPackageEnvEvidence+HostModuleCheckCheckers+HostModuleCheckCheckersLater+HostModuleCheckAcceptsGoods+HostModuleCheckAcceptsGoodsTerm+HostModuleCheckAcceptsProof+HostModuleCheckAcceptsLater+HostModuleCheckAccepts+HostModuleCheckSeeds+HostModuleCheckLoadOk+HostModuleCheckDriverIO+HostModuleCheckDriver+HostModuleCheckTheorems+HostModuleCheckSmoke+HostResidualShrink+HostResidualShrinkTermOk+HostResidualShrinkTheorems' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must carve out host harness out-of-scope (A59)" >&2
      exit 1
    fi
    if ! grep -qF 'seed=206+Main=59+harness=141' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite seed=206+Main=59+harness=141 disk partition (A59)" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckTermSurfaceDualOk must be true (Mult L2 TERM-SURFACE Mult-only)" >&2
      exit 1
    fi
    if ! grep -qF 'TERM-SURFACE' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite TERM-SURFACE (Mult L2 pilot)" >&2
      exit 1
    fi
    if ! grep -qF 'Mult-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite Mult-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckLinearTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckLinearTermSurfaceDualOk must be true (Linear L2 TERM-SURFACE Linear-only)" >&2
      exit 1
    fi
    if ! grep -qF 'Linear-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite Linear-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckTypesTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckTypesTermSurfaceDualOk must be true (Types L2 TERM-SURFACE Types-only)" >&2
      exit 1
    fi
    if ! grep -qF 'Types-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite Types-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckIrProgramTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckIrProgramTermSurfaceDualOk must be true (IrProgram L2 TERM-SURFACE IrProgram-only)" >&2
      exit 1
    fi
    if ! grep -qF 'IrProgram-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite IrProgram-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckIrGraphTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckIrGraphTermSurfaceDualOk must be true (IrGraph L2 TERM-SURFACE IrGraph-only)" >&2
      exit 1
    fi
    if ! grep -qF 'IrGraph-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite IrGraph-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckHostComposeTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckHostComposeTermSurfaceDualOk must be true (HostCompose L2 TERM-SURFACE HostCompose-only)" >&2
      exit 1
    fi
    if ! grep -qF 'HostCompose-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite HostCompose-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckErasureTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckErasureTermSurfaceDualOk must be true (Erasure L2 TERM-SURFACE Erasure-only)" >&2
      exit 1
    fi
    if ! grep -qF 'Erasure-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite Erasure-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckExtractTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckExtractTermSurfaceDualOk must be true (Extract L2 TERM-SURFACE Extract-only)" >&2
      exit 1
    fi
    if ! grep -qF 'Extract-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite Extract-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckEmitPlanTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckEmitPlanTermSurfaceDualOk must be true (EmitPlan L2 TERM-SURFACE EmitPlan-only)" >&2
      exit 1
    fi
    if ! grep -qF 'EmitPlan-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite EmitPlan-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckEmitApplyTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckEmitApplyTermSurfaceDualOk must be true (EmitApply L2 TERM-SURFACE EmitApply-only)" >&2
      exit 1
    fi
    if ! grep -qF 'EmitApply-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite EmitApply-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckEmitBodyTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckEmitBodyTermSurfaceDualOk must be true (EmitBody L2 TERM-SURFACE EmitBody-only)" >&2
      exit 1
    fi
    if ! grep -qF 'EmitBody-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite EmitBody-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckKernelMultTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckKernelMultTermSurfaceDualOk must be true (KernelMult L2 TERM-SURFACE KernelMult-only)" >&2
      exit 1
    fi
    if ! grep -qF 'KernelMult-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite KernelMult-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckKernelLinearTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckKernelLinearTermSurfaceDualOk must be true (KernelLinear L2 TERM-SURFACE KernelLinear-only)" >&2
      exit 1
    fi
    if ! grep -qF 'KernelLinear-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite KernelLinear-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckKernelTypesTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckKernelTypesTermSurfaceDualOk must be true (KernelTypes L2 TERM-SURFACE KernelTypes-only)" >&2
      exit 1
    fi
    if ! grep -qF 'KernelTypes-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite KernelTypes-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckKernelProgramTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckKernelProgramTermSurfaceDualOk must be true (KernelProgram L2 TERM-SURFACE KernelProgram-only)" >&2
      exit 1
    fi
    if ! grep -qF 'KernelProgram-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite KernelProgram-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckKernelEmitTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckKernelEmitTermSurfaceDualOk must be true (KernelEmit L2 TERM-SURFACE KernelEmit-only)" >&2
      exit 1
    fi
    if ! grep -qF 'KernelEmit-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite KernelEmit-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckParityMultTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckParityMultTermSurfaceDualOk must be true (ParityMult L2 TERM-SURFACE ParityMult-only)" >&2
      exit 1
    fi
    if ! grep -qF 'ParityMult-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite ParityMult-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckParityLinearTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckParityLinearTermSurfaceDualOk must be true (ParityLinear L2 TERM-SURFACE ParityLinear-only)" >&2
      exit 1
    fi
    if ! grep -qF 'ParityLinear-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite ParityLinear-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckParityTypesTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckParityTypesTermSurfaceDualOk must be true (ParityTypes L2 TERM-SURFACE ParityTypes-only)" >&2
      exit 1
    fi
    if ! grep -qF 'ParityTypes-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite ParityTypes-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckParityProgramTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckParityProgramTermSurfaceDualOk must be true (ParityProgram L2 TERM-SURFACE ParityProgram-only)" >&2
      exit 1
    fi
    if ! grep -qF 'ParityProgram-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite ParityProgram-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckParityEmitTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckParityEmitTermSurfaceDualOk must be true (ParityEmit L2 TERM-SURFACE ParityEmit-only)" >&2
      exit 1
    fi
    if ! grep -qF 'ParityEmit-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite ParityEmit-only TERM-SURFACE scope" >&2
      exit 1
    fi
    # U1 Emit*Scaffold + KernelSelfApply + ProductOutKernel TERM dual-ok mirrors
    for u1dual in \
      hostModuleCheckEmitMultScaffoldTermSurfaceDualOk \
      hostModuleCheckEmitLinearScaffoldTermSurfaceDualOk \
      hostModuleCheckEmitTypesScaffoldTermSurfaceDualOk \
      hostModuleCheckEmitProgramScaffoldTermSurfaceDualOk \
      hostModuleCheckEmitGraphScaffoldTermSurfaceDualOk \
      hostModuleCheckEmitComposeScaffoldTermSurfaceDualOk \
      hostModuleCheckEmitErasureScaffoldTermSurfaceDualOk \
      hostModuleCheckEmitExtractScaffoldTermSurfaceDualOk \
      hostModuleCheckEmitBannerScaffoldTermSurfaceDualOk \
      hostModuleCheckKernelSelfApplyTermSurfaceDualOk \
      hostModuleCheckProductOutKernelTermSurfaceDualOk \
      hostModuleCheckCompilePathTermSurfaceDualOk
    do
      if ! grep -qE "def ${u1dual}[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true" "$mod" "$mod_term"; then
        echo "error: ${u1dual} must be true (U1 TERM-SURFACE dual-ok)" >&2
        exit 1
      fi
    done
    for u1scope in \
      EmitMultScaffold-only EmitLinearScaffold-only EmitTypesScaffold-only \
      EmitProgramScaffold-only EmitGraphScaffold-only EmitComposeScaffold-only \
      EmitErasureScaffold-only EmitExtractScaffold-only EmitBannerScaffold-only \
      KernelSelfApply-only ProductOutKernel-only CompilePath-only
    do
      if ! grep -qF "$u1scope" "$mod" "$mod_term"; then
        echo "error: HostResidualShrink must cite ${u1scope} TERM-SURFACE scope" >&2
        exit 1
      fi
    done
    # S3 JoinMap TERM dual-ok mirror
    if ! grep -qE 'def hostModuleCheckJoinMapTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckJoinMapTermSurfaceDualOk must be true (JoinMap L2 TERM-SURFACE JoinMap-only)" >&2
      exit 1
    fi
    if ! grep -qF 'JoinMap-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite JoinMap-only TERM-SURFACE scope" >&2
      exit 1
    fi
    # S4 SelfHost + SurfaceMatrix TERM dual-ok mirrors
    if ! grep -qE 'def hostModuleCheckSelfHostTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckSelfHostTermSurfaceDualOk must be true (SelfHost L2 TERM-SURFACE SelfHost-only)" >&2
      exit 1
    fi
    if ! grep -qF 'SelfHost-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite SelfHost-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckSurfaceMatrixTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckSurfaceMatrixTermSurfaceDualOk must be true (SurfaceMatrix L2 TERM-SURFACE SurfaceMatrix-only)" >&2
      exit 1
    fi
    if ! grep -qF 'SurfaceMatrix-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite SurfaceMatrix-only TERM-SURFACE scope" >&2
      exit 1
    fi
    # S6 SpecProof + DualResidual TERM dual-ok mirrors
    if ! grep -qE 'def hostModuleCheckSpecProofTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckSpecProofTermSurfaceDualOk must be true (SpecProof L2 TERM-SURFACE SpecProof-only)" >&2
      exit 1
    fi
    if ! grep -qF 'SpecProof-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite SpecProof-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckDualResidualTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckDualResidualTermSurfaceDualOk must be true (DualResidual L2 TERM-SURFACE DualResidual-only)" >&2
      exit 1
    fi
    if ! grep -qF 'DualResidual-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite DualResidual-only TERM-SURFACE scope" >&2
      exit 1
    fi

    # S8 CompilePath unit modules TERM dual-ok mirrors
    for s8dual in \
      hostModuleCheckCompilePathMultTermSurfaceDualOk \
      hostModuleCheckCompilePathLinearTermSurfaceDualOk \
      hostModuleCheckCompilePathTypesTermSurfaceDualOk \
      hostModuleCheckCompilePathProgramTermSurfaceDualOk \
      hostModuleCheckCompilePathGraphTermSurfaceDualOk \
      hostModuleCheckCompilePathComposeTermSurfaceDualOk \
      hostModuleCheckCompilePathErasureTermSurfaceDualOk \
      hostModuleCheckCompilePathExtractTermSurfaceDualOk \
      hostModuleCheckCompilePathPlanTermSurfaceDualOk \
      hostModuleCheckCompilePathApplyTermSurfaceDualOk \
      hostModuleCheckCompilePathBodyTermSurfaceDualOk
    do
      if ! grep -qE "def ${s8dual}[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true" "$mod" "$mod_term"; then
        echo "error: ${s8dual} must be true (S8 CompilePath unit TERM-SURFACE dual-ok)" >&2
        exit 1
      fi
    done
    for s8scope in \
      CompilePathMult-only CompilePathLinear-only CompilePathTypes-only \
      CompilePathProgram-only CompilePathGraph-only CompilePathCompose-only \
      CompilePathErasure-only CompilePathExtract-only \
      CompilePathPlan-only CompilePathApply-only CompilePathBody-only
    do
      if ! grep -qF "$s8scope" "$mod" "$mod_term"; then
        echo "error: HostResidualShrink must cite ${s8scope} TERM-SURFACE scope" >&2
        exit 1
      fi
    done
    if ! grep -qE 'def hostModuleCheckFirstSurfaceTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckFirstSurfaceTermSurfaceDualOk must be true (FirstSurface L2 TERM-SURFACE FirstSurface-only)" >&2
      exit 1
    fi
    if ! grep -qF 'FirstSurface-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite FirstSurface-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckLinearSubsetEmitTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckLinearSubsetEmitTermSurfaceDualOk must be true (LinearSubsetEmit L2 TERM-SURFACE LinearSubsetEmit-only)" >&2
      exit 1
    fi
    if ! grep -qF 'LinearSubsetEmit-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite LinearSubsetEmit-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckTypesSubsetEmitTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckTypesSubsetEmitTermSurfaceDualOk must be true (TypesSubsetEmit L2 TERM-SURFACE TypesSubsetEmit-only)" >&2
      exit 1
    fi
    if ! grep -qF 'TypesSubsetEmit-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite TypesSubsetEmit-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckProgramSubsetEmitTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckProgramSubsetEmitTermSurfaceDualOk must be true (ProgramSubsetEmit L2 TERM-SURFACE ProgramSubsetEmit-only)" >&2
      exit 1
    fi
    if ! grep -qF 'ProgramSubsetEmit-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite ProgramSubsetEmit-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckGraphSubsetEmitTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckGraphSubsetEmitTermSurfaceDualOk must be true (GraphSubsetEmit L2 TERM-SURFACE GraphSubsetEmit-only)" >&2
      exit 1
    fi
    if ! grep -qF 'GraphSubsetEmit-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite GraphSubsetEmit-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckComposeSubsetEmitTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckComposeSubsetEmitTermSurfaceDualOk must be true (ComposeSubsetEmit L2 TERM-SURFACE ComposeSubsetEmit-only)" >&2
      exit 1
    fi
    if ! grep -qF 'ComposeSubsetEmit-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite ComposeSubsetEmit-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckErasureSubsetEmitTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckErasureSubsetEmitTermSurfaceDualOk must be true (ErasureSubsetEmit L2 TERM-SURFACE ErasureSubsetEmit-only)" >&2
      exit 1
    fi
    if ! grep -qF 'ErasureSubsetEmit-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite ErasureSubsetEmit-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckExtractSubsetEmitTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckExtractSubsetEmitTermSurfaceDualOk must be true (ExtractSubsetEmit L2 TERM-SURFACE ExtractSubsetEmit-only)" >&2
      exit 1
    fi
    if ! grep -qF 'ExtractSubsetEmit-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite ExtractSubsetEmit-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckMultSubsetEmitTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckMultSubsetEmitTermSurfaceDualOk must be true (MultSubsetEmit L2 TERM-SURFACE MultSubsetEmit-only)" >&2
      exit 1
    fi
    if ! grep -qF 'MultSubsetEmit-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite MultSubsetEmit-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckMultSubsetRebuildTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckMultSubsetRebuildTermSurfaceDualOk must be true (MultSubsetRebuild L2 TERM-SURFACE MultSubsetRebuild-only)" >&2
      exit 1
    fi
    if ! grep -qF 'MultSubsetRebuild-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite MultSubsetRebuild-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckLinearSubsetRebuildTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckLinearSubsetRebuildTermSurfaceDualOk must be true (LinearSubsetRebuild L2 TERM-SURFACE LinearSubsetRebuild-only)" >&2
      exit 1
    fi
    if ! grep -qF 'LinearSubsetRebuild-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite LinearSubsetRebuild-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckTypesSubsetRebuildTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckTypesSubsetRebuildTermSurfaceDualOk must be true (TypesSubsetRebuild L2 TERM-SURFACE TypesSubsetRebuild-only)" >&2
      exit 1
    fi
    if ! grep -qF 'TypesSubsetRebuild-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite TypesSubsetRebuild-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckProgramSubsetRebuildTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckProgramSubsetRebuildTermSurfaceDualOk must be true (ProgramSubsetRebuild L2 TERM-SURFACE ProgramSubsetRebuild-only)" >&2
      exit 1
    fi
    if ! grep -qF 'ProgramSubsetRebuild-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite ProgramSubsetRebuild-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk must be true (GraphSubsetRebuild L2 TERM-SURFACE GraphSubsetRebuild-only)" >&2
      exit 1
    fi
    if ! grep -qF 'GraphSubsetRebuild-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite GraphSubsetRebuild-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckComposeSubsetRebuildTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckComposeSubsetRebuildTermSurfaceDualOk must be true (ComposeSubsetRebuild L2 TERM-SURFACE ComposeSubsetRebuild-only)" >&2
      exit 1
    fi
    if ! grep -qF 'ComposeSubsetRebuild-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite ComposeSubsetRebuild-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckErasureSubsetRebuildTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckErasureSubsetRebuildTermSurfaceDualOk must be true (ErasureSubsetRebuild L2 TERM-SURFACE ErasureSubsetRebuild-only)" >&2
      exit 1
    fi
    if ! grep -qF 'ErasureSubsetRebuild-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite ErasureSubsetRebuild-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckExtractSubsetRebuildTermSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckExtractSubsetRebuildTermSurfaceDualOk must be true (ExtractSubsetRebuild L2 TERM-SURFACE ExtractSubsetRebuild-only)" >&2
      exit 1
    fi
    if ! grep -qF 'ExtractSubsetRebuild-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite ExtractSubsetRebuild-only TERM-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckProofSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckProofSurfaceDualOk must be true (MultTheorems L3 PROOF-SURFACE MultTheorems-only)" >&2
      exit 1
    fi
    if ! grep -qF 'PROOF-SURFACE' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite PROOF-SURFACE (MultTheorems L3 pilot)" >&2
      exit 1
    fi
    if ! grep -qF 'MultTheorems-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite MultTheorems-only PROOF-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckLinearProofSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckLinearProofSurfaceDualOk must be true (LinearTheorems L3 PROOF-SURFACE LinearTheorems-only)" >&2
      exit 1
    fi
    if ! grep -qF 'LinearTheorems-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite LinearTheorems-only PROOF-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckTypesProofSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckTypesProofSurfaceDualOk must be true (TypesTheorems L3 PROOF-SURFACE TypesTheorems-only)" >&2
      exit 1
    fi
    if ! grep -qF 'TypesTheorems-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite TypesTheorems-only PROOF-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckKernelMultProofSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckKernelMultProofSurfaceDualOk must be true (KernelMultTheorems L3 PROOF-SURFACE KernelMultTheorems-only)" >&2
      exit 1
    fi
    if ! grep -qF 'KernelMultTheorems-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite KernelMultTheorems-only PROOF-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckKernelLinearProofSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckKernelLinearProofSurfaceDualOk must be true (KernelLinearTheorems L3 PROOF-SURFACE KernelLinearTheorems-only)" >&2
      exit 1
    fi
    if ! grep -qF 'KernelLinearTheorems-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite KernelLinearTheorems-only PROOF-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckKernelTypesProofSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckKernelTypesProofSurfaceDualOk must be true (KernelTypesTheorems L3 PROOF-SURFACE KernelTypesTheorems-only)" >&2
      exit 1
    fi
    if ! grep -qF 'KernelTypesTheorems-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite KernelTypesTheorems-only PROOF-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckKernelProgramProofSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckKernelProgramProofSurfaceDualOk must be true (KernelProgramTheorems L3 PROOF-SURFACE KernelProgramTheorems-only)" >&2
      exit 1
    fi
    if ! grep -qF 'KernelProgramTheorems-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite KernelProgramTheorems-only PROOF-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckKernelEmitProofSurfaceDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckKernelEmitProofSurfaceDualOk must be true (KernelEmitTheorems L3 PROOF-SURFACE KernelEmitTheorems-only)" >&2
      exit 1
    fi
    if ! grep -qF 'KernelEmitTheorems-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite KernelEmitTheorems-only PROOF-SURFACE scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckPackageElaborateFirstBandDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckPackageElaborateFirstBandDualOk must be true (PACKAGE-ELABORATE MultExtractFoundation-only)" >&2
      exit 1
    fi
    if ! grep -qF 'PACKAGE-ELABORATE' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite PACKAGE-ELABORATE depth bar" >&2
      exit 1
    fi
    if ! grep -qF 'MultExtractFoundation-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite MultExtractFoundation-only package L4 scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckPackageElaborateProofBandDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckPackageElaborateProofBandDualOk must be true (PACKAGE-ELABORATE MultLinearTypesProof-only)" >&2
      exit 1
    fi
    if ! grep -qF 'MultLinearTypesProof-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite MultLinearTypesProof-only package L4 PROOF scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckPackageElaborateKernelBandDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckPackageElaborateKernelBandDualOk must be true (PACKAGE-ELABORATE KernelEmitParity-only)" >&2
      exit 1
    fi
    if ! grep -qF 'KernelEmitParity-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite KernelEmitParity-only package L4 Kernel scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostModuleCheckPackageElaborateEnvDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: hostModuleCheckPackageElaborateEnvDualOk must be true (PACKAGE-ELABORATE MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only)" >&2
      exit 1
    fi
    if ! grep -qF 'MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only package L4 Mult..ParityEmit+U2+S5 env scope" >&2
      exit 1
    fi
    if ! grep -qE 'def hostLibraryBandCompleteDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=' "$mod" "$mod_term"; then
      echo "error: hostLibraryBandCompleteDualOk must be defined (A59)" >&2
      exit 1
    fi
    if ! grep -qF 'Develop tool inventory closed' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite Develop tool inventory closed (A60)" >&2
      exit 1
    fi
    if ! grep -A2 'def measuredHostToolInventoryDayToDayCandidatesRemain' "$mod" "$mod_term" | grep -qF '"empty"'; then
      echo "error: day-to-day candidates remain must be empty (A60)" >&2
      exit 1
    fi
    if ! grep -qF 'claim-capable-perform-self-host+llvm-text-writers' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite claim/diagnostic Lake-only compact list (A60)" >&2
      exit 1
    fi
    if ! grep -qF 'claim-exes+llvm-text-writers+product-wire-Lake-mains' "$mod" "$mod_term"; then
      echo "error: HostResidualShrink must cite claim/diagnostic honesty classes (A60)" >&2
      exit 1
    fi
    if ! grep -qE 'def hostDevelopToolInventoryClosedDualOk[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=' "$mod" "$mod_term"; then
      echo "error: hostDevelopToolInventoryClosedDualOk must be defined (A60)" >&2
      exit 1
    fi
    if ! grep -qE 'def hostResidualShrinkFullHostElaborateRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod" "$mod_term"; then
      echo "error: FullHostElaborateRemains must be false after B2 cold-elaborate evidence (A66)" >&2
      exit 1
    fi
    if grep -qE 'def hostResidualShrinkFullHostElaborateRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: forge ban: FullHostElaborateRemains true after A66 B2 pin false" >&2
      exit 1
    fi
    if ! grep -qE 'def hostResidualShrinkBootstrapPrebuildRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod" "$mod_term"; then
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
      if ! grep -qE "def ${dual_ok}[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true" "$mod" "$mod_term"; then
        echo "error: ${dual_ok} must be true" >&2
        exit 1
      fi
    done
    # DualResidual: host residual remains false; host free claimed true (F1).
    if ! grep -qE 'def hostElaboratorResidualRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$dual_residual"; then
      echo "error: DualResidual hostElaboratorResidualRemains must be false (F1 free tip)" >&2
      exit 1
    fi
    if grep -qE 'def hostElaboratorResidualRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$dual_residual"; then
      echo "error: forge ban: hostElaboratorResidualRemains true after free claim" >&2
      exit 1
    fi
    if ! grep -qE 'def hostElaboratorResidualFreeClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$dual_residual"; then
      echo "error: DualResidual hostElaboratorResidualFreeClaimed must be true (F1)" >&2
      exit 1
    fi
    if grep -qE 'def hostElaboratorResidualFreeClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$dual_residual"; then
      echo "error: forge ban: hostElaboratorResidualFreeClaimed false after free claim" >&2
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
    # Ban forge: host free claimed false after F1 free dual-ok; remains true wrong.
    if grep -qE 'def hostResidualShrinkHostFreeClaimed[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*false' "$mod" "$mod_term"; then
      echo "error: forge ban: hostResidualShrinkHostFreeClaimed false after free claim" >&2
      exit 1
    fi
    if grep -qE 'def hostResidualShrinkHostElaborateRemains[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: forge ban: hostResidualShrinkHostElaborateRemains true after free claim" >&2
      exit 1
    fi
    if grep -qE 'def hostResidualShrinkLlvmUnlocked[[:space:]]*:[[:space:]]*Bool[[:space:]]*:=[[:space:]]*true' "$mod" "$mod_term"; then
      echo "error: forge ban: hostResidualShrinkLlvmUnlocked true" >&2
      exit 1
    fi
    echo "host-residual-shrink: GREEN (A3-A10+++ A59 L-band A60 tool inventory dual-ok; A66 FullHostElaborateRemains false; host free dual-ok F1; remains false; free true; not PROVABLY/llvm rebrand)"

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
