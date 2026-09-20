# SPDX-License-Identifier: Unlicense
# SYSTEMS_LEAN_HOST Lean path list (parallel to requiredFiles host ladder).
# Imported by ./specs.nix thin join. No bash.
{
hostLeans = [
  "src/systems/SystemsLean/Mult.lean"
  # Long-file split: MULT-THEOREM + HOST-MULT-THEOREM (same namespace Mult).
  "src/systems/SystemsLean/MultTheorems.lean"
  "src/systems/SystemsLean/Linear.lean"
  "src/systems/SystemsLean/LinearTheorems.lean"
  # QTT use-check: ConsumeToken exact-once then UnrestrictedShare omega (not all types).
  "src/systems/SystemsLean/UseCheck.lean"
  # Indexed MULT-1 OnceRes: illegal second consume fails to check (not a usage log).
  "src/systems/SystemsLean/LinearUseFail.lean"
  "src/systems/SystemsLean/LinearUseFailTheorems.lean"
  # LinearUseFail role helpers (same namespace LinearUseFail).
  "src/systems/SystemsLean/LinearUseFail/CanSeq.lean"
  "src/systems/SystemsLean/LinearUseFail/Keep.lean"
  "src/systems/SystemsLean/LinearUseFail/Consume.lean"
  "src/systems/SystemsLean/LinearUseFail/Decide.lean"
  "src/systems/SystemsLean/Types.lean"
  # Long-file split: TYPES-THEOREM + HOST-TYPES-THEOREM (same namespace Types).
  "src/systems/SystemsLean/TypesTheorems.lean"
  "src/systems/SystemsLean/IrProgram.lean"
  # Long-file split: IR-PROGRAM-THEOREM (same namespace IrProgram).
  "src/systems/SystemsLean/IrProgramTheorems.lean"
  "src/systems/SystemsLean/Erasure.lean"
  # Long-file split: ERASURE-THEOREM + HOST-ERASURE-THEOREM (same namespace Erasure).
  "src/systems/SystemsLean/ErasureTheorems.lean"
  "src/systems/SystemsLean/Extract.lean"
  # Long-file split: EXTRACT-THEOREM + HOST-EXTRACT-THEOREM (same namespace Extract).
  "src/systems/SystemsLean/ExtractTheorems.lean"
  "src/systems/SystemsLean/IrGraph.lean"
  # Long-file peel: IR-GRAPH-THEOREM + IR-GRAPH-SMOKE (same namespace IrGraph).
  "src/systems/SystemsLean/IrGraphTheorems.lean"
  "src/systems/SystemsLean/HostCompose.lean"
  # Long-file peel: COMPOSE-THEOREM + HOST-SMOKE (same namespace HostCompose).
  "src/systems/SystemsLean/HostComposeTheorems.lean"
  # HOST-COST Nat step accounting (Track L L1; not wall-clock / not PROVABLY speed).
  "src/systems/SystemsLean/HostCost.lean"
  # Long-file split: HOST-COST-THEOREM L1-L9 (same namespace HostCost).
  "src/systems/SystemsLean/HostCostTheorems.lean"
  "src/systems/SystemsLean/EmitPlan.lean"
  # Long-file peel: HOST-EMIT-PLAN scaffolding (same namespace EmitPlan).
  "src/systems/SystemsLean/EmitPlanScaffold.lean"
  "src/systems/SystemsLean/EmitApply.lean"
  # Long-file peel: HOST-EMIT-APPLY scaffolding (same namespace EmitApply).
  "src/systems/SystemsLean/EmitApplyScaffold.lean"
  "src/systems/SystemsLean/EmitBody.lean"
  # Long-file peel: HOST-EMIT-BODY scaffolding (same namespace EmitBody).
  "src/systems/SystemsLean/EmitBodyScaffold.lean"
  "src/systems/SystemsLean/EmitBanner.lean"
  # Long-file split: HOST-EMIT-BANNER scaffolding (same namespace EmitBanner).
  "src/systems/SystemsLean/EmitBannerScaffold.lean"
  "src/systems/SystemsLean/CompilePath.lean"
  # Bootstrap S1 first compiler surface (Mult unit path).
  "src/systems/SystemsLean/FirstSurface.lean"
  "src/systems/SystemsLean/FirstSurfaceMain.lean"
  "src/systems/SystemsLean/MultSubsetEmit.lean"
  "src/systems/SystemsLean/MultSubsetEmitMain.lean"
  "src/systems/SystemsLean/MultSubsetRebuild.lean"
  "src/systems/SystemsLean/MultSubsetRebuildMain.lean"
  "src/systems/SystemsLean/MultFsDeepen.lean"
  "src/systems/SystemsLean/MultFsWrite.lean"
  "src/systems/SystemsLean/MultFsWriteMain.lean"
  "src/systems/SystemsLean/MultFsWriteTool.lean"
  "src/systems/SystemsLean/MultFsWriteToolMain.lean"
  "src/systems/SystemsLean/ProductWireWriteTool.lean"
  "src/systems/SystemsLean/ProductWireWriteToolMain.lean"
  "src/systems/SystemsLean/LinearSubsetEmit.lean"
  "src/systems/SystemsLean/LinearSubsetEmitMain.lean"
  "src/systems/SystemsLean/LinearSubsetRebuild.lean"
  "src/systems/SystemsLean/LinearSubsetRebuildMain.lean"
  "src/systems/SystemsLean/TypesSubsetEmit.lean"
  "src/systems/SystemsLean/TypesSubsetEmitMain.lean"
  "src/systems/SystemsLean/TypesSubsetRebuild.lean"
  "src/systems/SystemsLean/TypesSubsetRebuildMain.lean"
  "src/systems/SystemsLean/ProgramSubsetEmit.lean"
  "src/systems/SystemsLean/ProgramSubsetEmitMain.lean"
  "src/systems/SystemsLean/ProgramSubsetRebuild.lean"
  "src/systems/SystemsLean/ProgramSubsetRebuildMain.lean"
  "src/systems/SystemsLean/ExtractSubsetEmit.lean"
  "src/systems/SystemsLean/ExtractSubsetEmitMain.lean"
  "src/systems/SystemsLean/ExtractSubsetRebuild.lean"
  "src/systems/SystemsLean/ExtractSubsetRebuildMain.lean"
  "src/systems/SystemsLean/ErasureSubsetEmit.lean"
  "src/systems/SystemsLean/ErasureSubsetEmitMain.lean"
  "src/systems/SystemsLean/ErasureSubsetRebuild.lean"
  "src/systems/SystemsLean/ErasureSubsetRebuildMain.lean"
  "src/systems/SystemsLean/GraphSubsetEmit.lean"
  "src/systems/SystemsLean/GraphSubsetEmitMain.lean"
  "src/systems/SystemsLean/GraphSubsetRebuild.lean"
  "src/systems/SystemsLean/GraphSubsetRebuildMain.lean"
  "src/systems/SystemsLean/ComposeSubsetEmit.lean"
  "src/systems/SystemsLean/ComposeSubsetEmitMain.lean"
  "src/systems/SystemsLean/ComposeSubsetRebuild.lean"
  "src/systems/SystemsLean/ComposeSubsetRebuildMain.lean"
  "src/systems/SystemsLean/SubsetFront.lean"
  "src/systems/SystemsLean/SubsetFrontMain.lean"
  "src/systems/SystemsLean/SubsetPackageJoin.lean"
  "src/systems/SystemsLean/FrontMultPackage.lean"
  "src/systems/SystemsLean/FrontMultPackageMain.lean"
  "src/systems/SystemsLean/HostTerm.lean"
  "src/systems/SystemsLean/HostKernel.lean"
  "src/systems/SystemsLean/HostFront.lean"
  "src/systems/SystemsLean/HostFrontGoldens.lean"
  # Long-file peel: HOST-FRONT-THEOREM + HOST-FRONT-SMOKE
  # (same namespace HostFront).
  "src/systems/SystemsLean/HostFrontTheorems.lean"
  "src/systems/SystemsLean/HostFrontMain.lean"
  "src/systems/SystemsLean/HostFrontLiveMult.lean"
  "src/systems/SystemsLean/HostFrontLiveMultMain.lean"
  "src/systems/SystemsLean/HostFrontLiveTypes.lean"
  "src/systems/SystemsLean/HostFrontLiveTypesMain.lean"
  "src/systems/SystemsLean/HostFrontLiveErasure.lean"
  "src/systems/SystemsLean/HostFrontLiveErasureMain.lean"
  "src/systems/SystemsLean/HostFrontLiveExtract.lean"
  "src/systems/SystemsLean/HostFrontLiveExtractMain.lean"
  "src/systems/SystemsLean/HostFrontLiveHostTerm.lean"
  "src/systems/SystemsLean/HostFrontLiveHostTermMain.lean"
  "src/systems/SystemsLean/HostFrontLiveHostTermSource.lean"
  "src/systems/SystemsLean/HostFrontLiveIrProgram.lean"
  "src/systems/SystemsLean/HostFrontLiveIrProgramMain.lean"
  "src/systems/SystemsLean/HostFrontLiveGoldens.lean"
  "src/systems/SystemsLean/HostFrontLiveGoldensMain.lean"
  "src/systems/SystemsLean/HostFrontLiveFrontTheorems.lean"
  "src/systems/SystemsLean/HostFrontLiveFrontTheoremsMain.lean"
  "src/systems/SystemsLean/HostFrontLiveFrontTheoremsSource.lean"
  "src/systems/SystemsLean/HostModuleCheckFrontTheoremsKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveGraphTheorems.lean"
  "src/systems/SystemsLean/HostFrontLiveGraphTheoremsMain.lean"
  "src/systems/SystemsLean/HostFrontLiveGraphTheoremsSource.lean"
  "src/systems/SystemsLean/HostModuleCheckGraphTheoremsKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveGraph.lean"
  "src/systems/SystemsLean/HostFrontLiveGraphMain.lean"
  "src/systems/SystemsLean/HostFrontLiveGraphSource.lean"
  "src/systems/SystemsLean/HostModuleCheckHostGraphKernel.lean"
  "src/systems/SystemsLean/HostFrontLivePackageRoots.lean"
  "src/systems/SystemsLean/HostFrontLivePackageRootsMain.lean"
  "src/systems/SystemsLean/HostFrontLivePackageRootsSource.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageRootsKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveImportSeeds.lean"
  "src/systems/SystemsLean/HostFrontLiveImportSeedsMain.lean"
  "src/systems/SystemsLean/HostFrontLiveImportSeedsSource.lean"
  "src/systems/SystemsLean/HostModuleCheckImportSeedsKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveImportLoadOkLater.lean"
  "src/systems/SystemsLean/HostFrontLiveImportLoadOkLaterMain.lean"
  "src/systems/SystemsLean/HostFrontLiveImportLoadOkLaterSource.lean"
  "src/systems/SystemsLean/HostModuleCheckImportLoadOkLaterKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveImportModel.lean"
  "src/systems/SystemsLean/HostFrontLiveImportModelMain.lean"
  "src/systems/SystemsLean/HostFrontLiveImportModelSource.lean"
  "src/systems/SystemsLean/HostModuleCheckImportModelKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveImportMods.lean"
  "src/systems/SystemsLean/HostFrontLiveImportModsMain.lean"
  "src/systems/SystemsLean/HostFrontLiveImportModsSource.lean"
  "src/systems/SystemsLean/HostModuleCheckImportModsKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveImportModsLater.lean"
  "src/systems/SystemsLean/HostFrontLiveImportModsLaterMain.lean"
  "src/systems/SystemsLean/HostFrontLiveImportModsLaterSource.lean"
  "src/systems/SystemsLean/HostModuleCheckImportModsLaterKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveImportWalkLater.lean"
  "src/systems/SystemsLean/HostFrontLiveImportWalkLaterMain.lean"
  "src/systems/SystemsLean/HostFrontLiveImportWalkLaterSource.lean"
  "src/systems/SystemsLean/HostModuleCheckImportWalkLaterKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveImportWalk.lean"
  "src/systems/SystemsLean/HostFrontLiveImportWalkMain.lean"
  "src/systems/SystemsLean/HostFrontLiveImportWalkSource.lean"
  "src/systems/SystemsLean/HostModuleCheckImportWalkKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveCheckers.lean"
  "src/systems/SystemsLean/HostFrontLiveCheckersMain.lean"
  "src/systems/SystemsLean/HostFrontLiveCheckersSource.lean"
  "src/systems/SystemsLean/HostModuleCheckCheckersKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveCheckersLater.lean"
  "src/systems/SystemsLean/HostFrontLiveCheckersLaterMain.lean"
  "src/systems/SystemsLean/HostFrontLiveCheckersLaterSource.lean"
  "src/systems/SystemsLean/HostModuleCheckCheckersLaterKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveSurface.lean"
  "src/systems/SystemsLean/HostFrontLiveSurfaceMain.lean"
  "src/systems/SystemsLean/HostFrontLiveSurfaceSource.lean"
  "src/systems/SystemsLean/HostModuleCheckSurfaceKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveRequiredDecls.lean"
  "src/systems/SystemsLean/HostFrontLiveRequiredDeclsMain.lean"
  "src/systems/SystemsLean/HostFrontLiveRequiredDeclsSource.lean"
  "src/systems/SystemsLean/HostModuleCheckRequiredDeclsKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveFixtures.lean"
  "src/systems/SystemsLean/HostFrontLiveFixturesMain.lean"
  "src/systems/SystemsLean/HostFrontLiveFixturesSource.lean"
  "src/systems/SystemsLean/HostModuleCheckFixturesKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveKernelMultTerm.lean"
  "src/systems/SystemsLean/HostFrontLiveKernelMultTermMain.lean"
  "src/systems/SystemsLean/HostFrontLiveKernelMultTermSource.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelMultTermKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveKernelProgramTerm.lean"
  "src/systems/SystemsLean/HostFrontLiveKernelProgramTermMain.lean"
  "src/systems/SystemsLean/HostFrontLiveKernelProgramTermSource.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelProgramTermKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveKernelTypesTerm.lean"
  "src/systems/SystemsLean/HostFrontLiveKernelTypesTermMain.lean"
  "src/systems/SystemsLean/HostFrontLiveKernelTypesTermSource.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelTypesTermKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveKernelLinearTerm.lean"
  "src/systems/SystemsLean/HostFrontLiveKernelLinearTermMain.lean"
  "src/systems/SystemsLean/HostFrontLiveKernelLinearTermSource.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelLinearTermKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveParityMultTerm.lean"
  "src/systems/SystemsLean/HostFrontLiveParityMultTermMain.lean"
  "src/systems/SystemsLean/HostFrontLiveParityMultTermSource.lean"
  "src/systems/SystemsLean/HostModuleCheckParityMultTermKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveParityLinearTerm.lean"
  "src/systems/SystemsLean/HostFrontLiveParityLinearTermMain.lean"
  "src/systems/SystemsLean/HostFrontLiveParityLinearTermSource.lean"
  "src/systems/SystemsLean/HostModuleCheckParityLinearTermKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveParityTypesTerm.lean"
  "src/systems/SystemsLean/HostFrontLiveParityTypesTermMain.lean"
  "src/systems/SystemsLean/HostFrontLiveParityTypesTermSource.lean"
  "src/systems/SystemsLean/HostModuleCheckParityTypesTermKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveParityProgramTerm.lean"
  "src/systems/SystemsLean/HostFrontLiveParityProgramTermMain.lean"
  "src/systems/SystemsLean/HostFrontLiveParityProgramTermSource.lean"
  "src/systems/SystemsLean/HostModuleCheckParityProgramTermKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveEmitBodyTerm.lean"
  "src/systems/SystemsLean/HostFrontLiveEmitBodyTermMain.lean"
  "src/systems/SystemsLean/HostFrontLiveEmitBodyTermSource.lean"
  "src/systems/SystemsLean/HostModuleCheckEmitBodyTermKernel.lean"
  "src/systems/SystemsLean/HostFrontLivePackageWrite.lean"
  "src/systems/SystemsLean/HostFrontLivePackageWriteMain.lean"
  "src/systems/SystemsLean/HostFrontLivePackageWriteSource.lean"
  "src/systems/SystemsLean/HostFrontLivePackageWriteTheorems.lean"
  "src/systems/SystemsLean/HostFrontLivePackageWriteTheoremsMain.lean"
  "src/systems/SystemsLean/HostFrontLivePackageWriteTheoremsSource.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageWriteTheoremsKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveMultTheorems.lean"
  "src/systems/SystemsLean/HostFrontLiveMultTheoremsMain.lean"
  "src/systems/SystemsLean/HostFrontLiveMultTheoremsSource.lean"
  "src/systems/SystemsLean/HostModuleCheckMultTheoremsKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveTypesTheorems.lean"
  "src/systems/SystemsLean/HostFrontLiveTypesTheoremsMain.lean"
  "src/systems/SystemsLean/HostFrontLiveTypesTheoremsSource.lean"
  "src/systems/SystemsLean/HostModuleCheckTypesTheoremsKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveErasureTheorems.lean"
  "src/systems/SystemsLean/HostFrontLiveErasureTheoremsMain.lean"
  "src/systems/SystemsLean/HostFrontLiveErasureTheoremsSource.lean"
  "src/systems/SystemsLean/HostModuleCheckErasureTheoremsKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveExtractTheorems.lean"
  "src/systems/SystemsLean/HostFrontLiveExtractTheoremsMain.lean"
  "src/systems/SystemsLean/HostFrontLiveExtractTheoremsSource.lean"
  "src/systems/SystemsLean/HostModuleCheckExtractTheoremsKernel.lean"
  "src/systems/SystemsLean/HostFrontLiveIrProgramTheorems.lean"
  "src/systems/SystemsLean/HostFrontLiveIrProgramTheoremsMain.lean"
  "src/systems/SystemsLean/HostFrontLiveIrProgramTheoremsSource.lean"
  "src/systems/SystemsLean/HostModuleCheckIrProgramTheoremsKernel.lean"
  "src/systems/SystemsLean/SlakeProducedElf.lean"
  "src/systems/SystemsLean/HostCheck.lean"
  "src/systems/SystemsLean/HostCheckMain.lean"
  "src/systems/SystemsLean/HostGraph.lean"
  # Long-file split: HOST-GRAPH-THEOREM + HOST-GRAPH-SMOKE
  # (same namespace HostGraph).
  "src/systems/SystemsLean/HostGraphTheorems.lean"
  "src/systems/SystemsLean/HostGraphMain.lean"
  "src/systems/SystemsLean/HostPackageWrite.lean"
  # Long-file peel: HOST-PACKAGE-WRITE-THEOREM + HOST-PACKAGE-WRITE-SMOKE
  # (same namespace HostPackageWrite).
  "src/systems/SystemsLean/HostPackageWriteTheorems.lean"
  "src/systems/SystemsLean/HostPackageWriteMain.lean"
  "src/systems/SystemsLean/HostPackageRoots.lean"
  "src/systems/SystemsLean/HostPackageRootsMain.lean"
  "src/systems/SystemsLean/HostImportGraph.lean"
  # Long-file peel companions (same namespace HostImportGraph).
  "src/systems/SystemsLean/HostImportGraphSeeds.lean"
  "src/systems/SystemsLean/HostImportGraphModel.lean"
  "src/systems/SystemsLean/HostImportGraphMods.lean"
  "src/systems/SystemsLean/HostImportGraphModsLater.lean"
  "src/systems/SystemsLean/HostImportGraphLoadOk.lean"
  "src/systems/SystemsLean/HostImportGraphLoadOkLater.lean"
  "src/systems/SystemsLean/HostImportGraphTheorems.lean"
  "src/systems/SystemsLean/HostImportGraphWalk.lean"
  "src/systems/SystemsLean/HostImportGraphWalkLater.lean"
  "src/systems/SystemsLean/HostImportGraphDriver.lean"
  "src/systems/SystemsLean/HostImportGraphMain.lean"
  "src/systems/SystemsLean/HostModuleCheck.lean"
  "src/systems/SystemsLean/HostModuleCheckFixtures.lean"
  "src/systems/SystemsLean/HostModuleCheckRequiredDecls.lean"
  "src/systems/SystemsLean/HostModuleCheckRequiredDeclsProduct.lean"
  "src/systems/SystemsLean/HostModuleCheckRequiredDeclsLater.lean"
  "src/systems/SystemsLean/HostModuleCheckFixtureTexts.lean"
  "src/systems/SystemsLean/HostModuleCheckFixtureTextsProduct.lean"
  "src/systems/SystemsLean/HostModuleCheckFixtureTextsLater.lean"
  "src/systems/SystemsLean/HostModuleCheckFixtureTextsSelfHost.lean"
  "src/systems/SystemsLean/HostModuleCheckFixtureTextsEmit.lean"
  "src/systems/SystemsLean/HostModuleCheckSurface.lean"
  "src/systems/SystemsLean/HostModuleCheckMultTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckMultKernel.lean"
  "src/systems/SystemsLean/HostModuleCheckTypesKernel.lean"
  "src/systems/SystemsLean/HostModuleCheckErasureKernel.lean"
  "src/systems/SystemsLean/HostModuleCheckExtractKernel.lean"
  "src/systems/SystemsLean/HostModuleCheckHostTermKernel.lean"
  "src/systems/SystemsLean/HostModuleCheckIrProgramKernel.lean"
  "src/systems/SystemsLean/HostModuleCheckGoldensKernel.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageWriteKernel.lean"
  "src/systems/SystemsLean/HostModuleCheckLinearTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckTypesTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckIrProgramTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckIrGraphTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckHostComposeTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckErasureTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckExtractTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckEmitPlanTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckEmitApplyTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckEmitBodyTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelMultTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelLinearTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelTypesTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelProgramTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelEmitTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckParityMultTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckParityLinearTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckParityTypesTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckParityProgramTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckParityEmitTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckEmitMultScaffoldTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckEmitLinearScaffoldTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckEmitTypesScaffoldTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckEmitProgramScaffoldTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckEmitGraphScaffoldTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckEmitComposeScaffoldTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckEmitErasureScaffoldTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckEmitExtractScaffoldTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckEmitBannerScaffoldTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelSelfApplyTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckProductOutKernelTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckCompilePathTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckJoinMapTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckSelfHostTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckSurfaceMatrixTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckSpecProofTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckDualResidualTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckCompilePathMultTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckCompilePathLinearTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckCompilePathTypesTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckCompilePathProgramTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckCompilePathGraphTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckCompilePathComposeTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckCompilePathErasureTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckCompilePathExtractTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckCompilePathPlanTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckCompilePathApplyTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckCompilePathBodyTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckFirstSurfaceTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckLinearSubsetEmitTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckTypesSubsetEmitTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckProgramSubsetEmitTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckGraphSubsetEmitTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckComposeSubsetEmitTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckErasureSubsetEmitTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckExtractSubsetEmitTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckMultSubsetEmitTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckMultSubsetRebuildTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckLinearSubsetRebuildTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckTypesSubsetRebuildTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckProgramSubsetRebuildTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckGraphSubsetRebuildTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckComposeSubsetRebuildTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckErasureSubsetRebuildTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckExtractSubsetRebuildTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckLlvmMultTextTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckHostCheckTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckHostGraphTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckLlvmLinearTextTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckMultFsWriteToolTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckFrontMultPackageTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckSubsetPackageJoinTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckLlvmTypesTextTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckMultFsDeepenTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckHostPackageWriteTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckLlvmProgramTextTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckLlvmGraphTextTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckLlvmComposeTextTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckSelfApplyFsTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckInventoryCloseTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckProductPathBarsTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckProductPathTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckProbeWireTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckSelfHostBodyTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckLoadOkCompilePathUnits.lean"
  "src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckRealModule.lean"
  "src/systems/SystemsLean/HostModuleCheckMultProof.lean"
  "src/systems/SystemsLean/HostModuleCheckLinearProof.lean"
  "src/systems/SystemsLean/HostModuleCheckTypesProof.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelMultProof.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelLinearProof.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelTypesProof.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelProgramProof.lean"
  "src/systems/SystemsLean/HostModuleCheckKernelEmitProof.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageElab.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageEnvFixtures.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesU2.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesS5.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesLater.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesS30.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesTail.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageEnvImports.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageEnvDialectTail.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageEnv.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean"
  "src/systems/SystemsLean/HostModuleCheckPackageEnvEvidenceLater.lean"
  "src/systems/SystemsLean/HostModuleCheckAccepts.lean"
  "src/systems/SystemsLean/HostModuleCheckAcceptsGoods.lean"
  "src/systems/SystemsLean/HostModuleCheckAcceptsGoodsTerm.lean"
  "src/systems/SystemsLean/HostModuleCheckAcceptsProof.lean"
  "src/systems/SystemsLean/HostModuleCheckAcceptsLater.lean"
  "src/systems/SystemsLean/HostModuleCheckCheckersLater.lean"
  "src/systems/SystemsLean/HostModuleCheckCheckers.lean"
  "src/systems/SystemsLean/HostModuleCheckDriverIO.lean"
  "src/systems/SystemsLean/HostModuleCheckDriver.lean"
  "src/systems/SystemsLean/HostModuleCheckLoadOk.lean"
  "src/systems/SystemsLean/HostModuleCheckSeeds.lean"
  "src/systems/SystemsLean/HostModuleCheckTheorems.lean"
  "src/systems/SystemsLean/HostModuleCheckSmoke.lean"
  "src/systems/SystemsLean/HostModuleCheckMain.lean"
  "src/systems/SystemsLean/HostResidualShrink.lean"
  "src/systems/SystemsLean/HostResidualShrinkTermOk.lean"
  # Long-file split: HOST-RESIDUAL-SHRINK-THEOREM + HOST-RESIDUAL-SHRINK-SMOKE
  # (same namespace HostResidualShrink).
  "src/systems/SystemsLean/HostResidualShrinkTheorems.lean"
  "src/systems/SystemsLean/LlvmEmitPath.lean"
  "src/systems/SystemsLean/LlvmMultText.lean"
  "src/systems/SystemsLean/LlvmMultTextMain.lean"
  "src/systems/SystemsLean/LlvmLinearText.lean"
  "src/systems/SystemsLean/LlvmLinearTextMain.lean"
  "src/systems/SystemsLean/LlvmTypesText.lean"
  "src/systems/SystemsLean/LlvmTypesTextMain.lean"
  "src/systems/SystemsLean/LlvmProgramText.lean"
  "src/systems/SystemsLean/LlvmProgramTextMain.lean"
  "src/systems/SystemsLean/LlvmGraphText.lean"
  "src/systems/SystemsLean/LlvmGraphTextMain.lean"
  "src/systems/SystemsLean/LakeRetireInventory.lean"
  "src/systems/SystemsLean/JoinMap.lean"
  # Long-file peel: JOIN-MAP-THEOREM + JOIN-MAP-SMOKE (same namespace JoinMap).
  "src/systems/SystemsLean/JoinMapTheorems.lean"
  "src/systems/SystemsLean/SelfHost.lean"
  # Long-file split: SELF-HOST-THEOREM + SELF-HOST-SMOKE (same namespace SelfHost).
  "src/systems/SystemsLean/SelfHostTheorems.lean"
  "src/systems/SystemsLean/SurfaceMatrix.lean"
  # Long-file peel: SURFACE-MATRIX-THEOREM + SURFACE-MATRIX-SMOKE (same namespace SurfaceMatrix).
  "src/systems/SystemsLean/SurfaceMatrixTheorems.lean"
  "src/systems/SystemsLean/KernelMult.lean"
  # Long-file split: KERNEL-MULT-THEOREM + KERNEL-MULT-SMOKE (same namespace KernelMult).
  "src/systems/SystemsLean/KernelMultTheorems.lean"
  "src/systems/SystemsLean/EmitMult.lean"
  # Long-file split: HOST-EMIT-MULT scaffolding (same namespace EmitMult).
  "src/systems/SystemsLean/EmitMultScaffold.lean"
  "src/systems/SystemsLean/EmitLinear.lean"
  # Long-file peel: HOST-EMIT-LINEAR scaffolding (same namespace EmitLinear).
  "src/systems/SystemsLean/EmitLinearScaffold.lean"
  "src/systems/SystemsLean/EmitErasure.lean"
  # Long-file split: HOST-EMIT-ERASURE scaffolding (same namespace EmitErasure).
  "src/systems/SystemsLean/EmitErasureScaffold.lean"
  "src/systems/SystemsLean/EmitExtract.lean"
  # Long-file peel: HOST-EMIT-EXTRACT scaffolding (same namespace EmitExtract).
  "src/systems/SystemsLean/EmitExtractScaffold.lean"
  "src/systems/SystemsLean/EmitTypes.lean"
  # Long-file peel: HOST-EMIT-TYPES scaffolding (same namespace EmitTypes).
  "src/systems/SystemsLean/EmitTypesScaffold.lean"
  "src/systems/SystemsLean/EmitProgram.lean"
  # Long-file peel: HOST-EMIT-PROGRAM scaffolding (same namespace EmitProgram).
  "src/systems/SystemsLean/EmitProgramScaffold.lean"
  "src/systems/SystemsLean/EmitGraph.lean"
  # Long-file peel: HOST-EMIT-GRAPH scaffolding (same namespace EmitGraph).
  "src/systems/SystemsLean/EmitGraphScaffold.lean"
  "src/systems/SystemsLean/EmitCompose.lean"
  # Long-file peel: HOST-EMIT-COMPOSE scaffolding (same namespace EmitCompose).
  "src/systems/SystemsLean/EmitComposeScaffold.lean"
  "src/systems/SystemsLean/FreestandingEmit.lean"
  "src/systems/SystemsLean/FreestandingEmitLoad.lean"
  # Long-file peel: Mult..Apply unit SSOT loaders (same namespace FreestandingEmit).
  "src/systems/SystemsLean/FreestandingEmitLoadScaffold.lean"
  "src/systems/SystemsLean/DualEqWriteLoad.lean"
  # Long-file peel: Capable WRITE-HC dual SSOT load/assemble (same namespace CapableWriteHc).
  "src/systems/SystemsLean/CapableWriteHcLoad.lean"
  # Long-file split: STEP-CONTRACT-THEOREM + SMOKE (same namespace CapableStepContract).
  "src/systems/SystemsLean/CapableStepContractTheorems.lean"
  # Long-file split: CAPABLE-GAP-THEOREM + SMOKE (same namespace Capable).
  "src/systems/SystemsLean/CapableTheorems.lean"
  # Long-file split: PERFORM-EVIDENCE-THEOREM + SMOKE (same namespace PerformEvidence).
  "src/systems/SystemsLean/PerformEvidenceTheorems.lean"
  # Long-file split: COMPOSE-PLAN-THEOREM + SMOKE (same namespace ProductPathComposePlan).
  "src/systems/SystemsLean/ProductPathComposePlanTheorems.lean"
  # Long-file split: READ-SSOT-THEOREM + SMOKE (same namespace ProductPathReadSsot).
  "src/systems/SystemsLean/ProductPathReadSsotTheorems.lean"
  # Long-file split: WRITE-HC-THEOREM + SMOKE (same namespace ProductPathWriteHc).
  "src/systems/SystemsLean/ProductPathWriteHcTheorems.lean"
  # Long-file split: WRITER-PATH-EXEC-THEOREM + SMOKE (same namespace ProductPathWriterPathExec).
  "src/systems/SystemsLean/ProductPathWriterPathExecTheorems.lean"
  # Long-file split: PERFORM-STEP-THEOREM + SMOKE (same namespace ProductPathPerformStep).
  "src/systems/SystemsLean/ProductPathPerformStepTheorems.lean"
  # Long-file split: PERFORM-THEOREM + SMOKE (same namespace ProductPathPerform).
  "src/systems/SystemsLean/ProductPathPerformTheorems.lean"
  # Long-file split: PRODUCT-OUT-THEOREM + SMOKE (same namespace ProductOutKernel).
  "src/systems/SystemsLean/ProductOutKernelTheorems.lean"
  # Long-file split: KERNEL-SELF-APPLY-THEOREM + SMOKE (same namespace KernelSelfApply).
  "src/systems/SystemsLean/KernelSelfApplyTheorems.lean"
  # Long-file split: WRITER-SURFACE-THEOREM + SMOKE (same namespace ProductPathWriterSurface).
  "src/systems/SystemsLean/ProductPathWriterSurfaceTheorems.lean"
  # Long-file split: FULL-BAR-THEOREM + SMOKE (same namespace CapableFullBar).
  "src/systems/SystemsLean/CapableFullBarTheorems.lean"
  # Long-file split: REGENERATE-THEOREM + SMOKE (same namespace CapableRegenerate).
  "src/systems/SystemsLean/CapableRegenerateTheorems.lean"
  # Long-file split: INSTALL-OUT-THEOREM + SMOKE (same namespace InstallOut).
  "src/systems/SystemsLean/InstallOutTheorems.lean"
  # Long-file split: READ-THEOREM + READ-SMOKE (same namespace CapableRead).
  "src/systems/SystemsLean/CapableReadTheorems.lean"
  # Long-file split: COMPOSE-THEOREM + COMPOSE-SMOKE (same namespace CapableCompose).
  "src/systems/SystemsLean/CapableComposeTheorems.lean"
  "src/systems/SystemsLean/ParityMult.lean"
  # Long-file peel: PARITY-MULT-THEOREM + PARITY-MULT-SMOKE (same namespace ParityMult).
  "src/systems/SystemsLean/ParityMultTheorems.lean"
  "src/systems/SystemsLean/KernelLinear.lean"
  # Long-file split: KERNEL-LINEAR-THEOREM + KERNEL-LINEAR-SMOKE (same namespace KernelLinear).
  "src/systems/SystemsLean/KernelLinearTheorems.lean"
  "src/systems/SystemsLean/ParityLinear.lean"
  # Long-file split: PARITY-LINEAR-THEOREM + PARITY-LINEAR-SMOKE (same namespace ParityLinear).
  "src/systems/SystemsLean/ParityLinearTheorems.lean"
  "src/systems/SystemsLean/KernelTypes.lean"
  # Long-file peel: KERNEL-TYPES-THEOREM + KERNEL-TYPES-SMOKE (same namespace KernelTypes).
  "src/systems/SystemsLean/KernelTypesTheorems.lean"
  "src/systems/SystemsLean/ParityTypes.lean"
  # Long-file split: PARITY-TYPES-THEOREM + PARITY-TYPES-SMOKE (same namespace ParityTypes).
  "src/systems/SystemsLean/ParityTypesTheorems.lean"
  "src/systems/SystemsLean/KernelProgram.lean"
  # Long-file peel: KERNEL-PROGRAM-THEOREM + KERNEL-PROGRAM-SMOKE (same namespace KernelProgram).
  "src/systems/SystemsLean/KernelProgramTheorems.lean"
  "src/systems/SystemsLean/ParityProgram.lean"
  # Long-file peel: PARITY-PROGRAM-THEOREM + PARITY-PROGRAM-SMOKE (same namespace ParityProgram).
  "src/systems/SystemsLean/ParityProgramTheorems.lean"
  "src/systems/SystemsLean/KernelEmit.lean"
  # Long-file peel: KERNEL-EMIT-THEOREM + KERNEL-EMIT-SMOKE (same namespace KernelEmit).
  "src/systems/SystemsLean/KernelEmitTheorems.lean"
  "src/systems/SystemsLean/ParityEmit.lean"
  # Long-file peel: PARITY-EMIT-THEOREM + PARITY-EMIT-SMOKE (same namespace ParityEmit).
  "src/systems/SystemsLean/ParityEmitTheorems.lean"
  "src/systems/SystemsLean/SelfApply.lean"
  # Long-file split: theorems + smoke (same namespace SelfApply).
  "src/systems/SystemsLean/SelfApplyTheorems.lean"
  "src/systems/SystemsLean/SelfApplyFs.lean"
  "src/systems/SystemsLean/SelfApplyFsClose.lean"
  "src/systems/SystemsLean/SelfApplyFsTheorems.lean"
  "src/systems/SystemsLean/SelfHostComplete.lean"
  "src/systems/SystemsLean/LlvmHold.lean"
  # Long-file split: theorems + smoke (same namespace LlvmHold).
  "src/systems/SystemsLean/LlvmHoldTheorems.lean"
  "src/systems/SystemsLean/InventoryClose.lean"
  # Long-file split: theorems + smoke (same namespace InventoryClose).
  "src/systems/SystemsLean/InventoryCloseTheorems.lean"
  "src/systems/SystemsLean/ProductPath.lean"
  # Long-file peel: freestanding path bars (same namespace ProductPath).
  "src/systems/SystemsLean/ProductPathBars.lean"
  # Long-file peel: theorems + smoke (same namespace ProductPath).
  "src/systems/SystemsLean/ProductPathTheorems.lean"
  "src/systems/SystemsLean/DualResidual.lean"
  # Long-file peel: theorems + smoke (same namespace DualResidual).
  "src/systems/SystemsLean/DualResidualTheorems.lean"
  "src/systems/SystemsLean/ProbeWire.lean"
  # Long-file peel: theorems + smoke (same namespace ProbeWire).
  "src/systems/SystemsLean/ProbeWireTheorems.lean"
  "src/systems/SystemsLean/SpecProof.lean"
  # Long-file peel: theorems + smoke (same namespace SpecProof).
  "src/systems/SystemsLean/SpecProofTheorems.lean"
  "src/systems/SystemsLean/SelfHostBody.lean"
  # Long-file peel: theorems + smoke (same namespace SelfHostBody).
  "src/systems/SystemsLean/SelfHostBodyTheorems.lean"
  # Long-file split: older one-command probes (same namespace ElabMeet).
  "src/systems/SystemsLean/ElabMeetEarly.lean"
  # Long-file split: on-disk compile helpers (same namespace ElabMeet).
  "src/systems/SystemsLean/ElabMeetCompile.lean"
  # Long-file split: probe snippets (same namespace ElabMeet).
  "src/systems/SystemsLean/ElabMeetProbe.lean"
  # Long-file split: compiled-olean reuse (same namespace ElabMeet).
  "src/systems/SystemsLean/ElabMeetOlean.lean"
  # Richer library-target package description (same namespace ElabMeet).
  "src/systems/SystemsLean/ElabMeetDesc.lean"
  # Executable-target package description (same namespace ElabMeet).
  "src/systems/SystemsLean/ElabMeetExe.lean"
  # Executable import from a listed source directory.
  "src/systems/SystemsLean/ElabMeetImpSrc.lean"
  # Two-library executable import from a listed source directory.
  "src/systems/SystemsLean/ElabMeetImpSrcTwo.lean"
  # Two executable targets from a listed source directory.
  "src/systems/SystemsLean/ElabMeetExeSrcTwo.lean"
  # Default executable from a listed source directory.
  "src/systems/SystemsLean/ElabMeetDefSrc.lean"
  # Live SystemsLean.Mult typecheck (same namespace ElabMeet).
  "src/systems/SystemsLean/ElabMeetLive.lean"
  # Named-walk compile helper.
  "src/systems/SystemsLean/ElabMeetNamedWalk.lean"
  # Leftover three-through-nine wrappers (through IrProgram), leftover
  # ExtractTheorems probe. Leftover Extract/IrProgram probes live on Tail.
  "src/systems/SystemsLean/ElabMeetNamedWalkLater.lean"
  # Leftover Extract and IrProgram probes plus tenth wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkTail.lean"
  # Eleventh HostTerm named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostTerm.lean"
  # Seventeenth HostGraphTheorems named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostGraphTheorems.lean"
  # Eighteenth HostPackageWrite named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostPackageWrite.lean"
  # Twenty-first HostImportGraphSeeds named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean"
  # Twenty-sixth HostImportGraphWalkLater named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphWalkLater.lean"
  # Thirty-first HostModuleCheckFixtureTexts named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostModuleCheckFixtureTexts.lean"
  # Thirty-fifth HostModuleCheckFixtureTextsEmit named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit.lean"
  # Thirty-ninth HostModuleCheckCheckersLater named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostModuleCheckCheckersLater.lean"
  # Forty-second HostModuleCheckKernelMultTerm named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostModuleCheckKernelMultTerm.lean"
  # Forty-third HostModuleCheckKernelLinearTerm named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostModuleCheckKernelLinearTerm.lean"
  # Forty-fourth HostModuleCheckKernelTypesTerm named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostModuleCheckKernelTypesTerm.lean"
  # Forty-fifth HostModuleCheckKernelProgramTerm named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostModuleCheckKernelProgramTerm.lean"
  # Forty-sixth HostModuleCheckKernelEmitTerm named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostModuleCheckKernelEmitTerm.lean"
  # Forty-seventh HostModuleCheckParityMultTerm named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostModuleCheckParityMultTerm.lean"
  # Forty-eighth HostModuleCheckParityLinearTerm named-walk wrapper.
  "src/systems/SystemsLean/ElabMeetNamedWalkHostModuleCheckParityLinearTerm.lean"
  # Fourteenth HostFrontTheorems named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostFrontTheoremsProbe.lean"
  # Fifteenth HostCheck named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostCheckProbe.lean"
  # Sixteenth HostGraph named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostGraphProbe.lean"
  # Seventeenth HostGraphTheorems named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostGraphTheoremsProbe.lean"
  # Eighteenth HostPackageWrite named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostPackageWriteProbe.lean"
  # Nineteenth HostPackageWriteTheorems named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostPackageWriteTheoremsProbe.lean"
  # Twentieth HostPackageRoots named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostPackageRootsProbe.lean"
  # Twenty-first HostImportGraphSeeds named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostImportGraphSeedsProbe.lean"
  # Twenty-second HostImportGraphModel named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostImportGraphModelProbe.lean"
  # Twenty-third HostImportGraphMods named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsProbe.lean"
  # Twenty-fourth HostImportGraphModsLater named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsLaterProbe.lean"
  # Twenty-fifth HostImportGraphLoadOkLater named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean"
  # Twenty-sixth HostImportGraphWalkLater named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostImportGraphWalkLaterProbe.lean"
  # Twenty-seventh HostImportGraphWalk named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostImportGraphWalkProbe.lean"
  # Twenty-eighth HostModuleCheckRequiredDecls named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckRequiredDeclsProbe.lean"
  # Twenty-ninth HostModuleCheckRequiredDeclsProduct named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe.lean"
  # Thirtieth HostModuleCheckRequiredDeclsLater named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe.lean"
  # Thirty-first HostModuleCheckFixtureTexts named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckFixtureTextsProbe.lean"
  # Thirty-second HostModuleCheckFixtureTextsProduct named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckFixtureTextsProductProbe.lean"
  # Thirty-third HostModuleCheckFixtureTextsLater named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckFixtureTextsLaterProbe.lean"
  # Thirty-fourth HostModuleCheckFixtureTextsSelfHost named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckFixtureTextsSelfHostProbe.lean"
  # Thirty-fifth HostModuleCheckFixtureTextsEmit named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckFixtureTextsEmitProbe.lean"
  # Thirty-sixth HostModuleCheckFixtures named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckFixturesProbe.lean"
  # Thirty-seventh HostModuleCheckSurface named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckSurfaceProbe.lean"
  # Thirty-eighth HostModuleCheckCheckers named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckCheckersProbe.lean"
  # Thirty-ninth HostModuleCheckCheckersLater named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckCheckersLaterProbe.lean"
  # Fortieth HostModuleCheckRealModule named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckRealModuleProbe.lean"
  # Forty-first HostModuleCheckEmitBodyTerm named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckEmitBodyTermProbe.lean"
  # Forty-second HostModuleCheckKernelMultTerm named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckKernelMultTermProbe.lean"
  # Forty-third HostModuleCheckKernelLinearTerm named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckKernelLinearTermProbe.lean"
  # Forty-fourth HostModuleCheckKernelTypesTerm named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckKernelTypesTermProbe.lean"
  # Forty-fifth HostModuleCheckKernelProgramTerm named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckKernelProgramTermProbe.lean"
  # Forty-sixth HostModuleCheckKernelEmitTerm named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckKernelEmitTermProbe.lean"
  # Forty-seventh HostModuleCheckParityMultTerm named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckParityMultTermProbe.lean"
  # Forty-eighth HostModuleCheckParityLinearTerm named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostModuleCheckParityLinearTermProbe.lean"
  # Occupancy living files (walk, probe, theorems). Isolation prove OccupancyProbe.
  "src/systems/SystemsLean/OccupancyWalk.lean"
  "src/systems/SystemsLean/OccupancyProbe.lean"
  "src/systems/SystemsLean/OccupancyTheorems.lean"
  # Named closed subset from the real package description.
  "src/systems/SystemsLean/ElabMeetSubset.lean"
  # Long-file split: HostModuleCheck half of elabMeetReady.
  "src/systems/SystemsLean/ElabMeetReadyHostModuleCheck.lean"

  # Long-file split: older exe and disk-import probes.
  "src/systems/SystemsLean/ElabMeetExeProbe.lean"
  "src/systems/SystemsLean/ElabMeet.lean"
  # Long-file split: FixtureTexts / Product native_decide theorems.
  "src/systems/SystemsLean/ElabMeetTheoremsNamedHostModuleCheckFixtureTexts.lean"
  # Long-file split: HostModuleCheckFixtures named-subset native_decide theorems.
  "src/systems/SystemsLean/ElabMeetTheoremsNamedHostModuleCheckFixtures.lean"
  # Long-file split: HostModuleCheckSurface named-subset native_decide theorems.
  "src/systems/SystemsLean/ElabMeetTheoremsNamedHostModuleCheckSurface.lean"
  # Long-file split: HostModuleCheckCheckers named-subset native_decide theorems.
  "src/systems/SystemsLean/ElabMeetTheoremsNamedHostModuleCheckCheckers.lean"
  # Long-file split: HostModuleCheckCheckersLater named-subset native_decide theorems.
  "src/systems/SystemsLean/ElabMeetTheoremsNamedHostModuleCheckCheckersLater.lean"
  # Long-file split: HostModuleCheckRealModule named-subset native_decide theorems.
  "src/systems/SystemsLean/ElabMeetTheoremsNamedHostModuleCheckRealModule.lean"
  # Long-file split: HostModuleCheckEmitBodyTerm named-subset native_decide theorems.
  "src/systems/SystemsLean/ElabMeetTheoremsNamedHostModuleCheckEmitBodyTerm.lean"
  # Long-file split: HostModuleCheckKernelMultTerm named-subset native_decide theorems.
  "src/systems/SystemsLean/ElabMeetTheoremsNamedHostModuleCheckKernelMultTerm.lean"
  # Long-file split: HostModuleCheckKernelLinearTerm named-subset native_decide theorems.
  "src/systems/SystemsLean/ElabMeetTheoremsNamedHostModuleCheckKernelLinearTerm.lean"
  # Long-file split: HostModuleCheckKernelTypesTerm named-subset native_decide theorems.
  "src/systems/SystemsLean/ElabMeetTheoremsNamedHostModuleCheckKernelTypesTerm.lean"
  # Long-file split: HostModuleCheckKernelProgramTerm named-subset native_decide theorems.
  "src/systems/SystemsLean/ElabMeetTheoremsNamedHostModuleCheckKernelProgramTerm.lean"
  # Long-file split: HostModuleCheckKernelEmitTerm named-subset native_decide theorems.
  "src/systems/SystemsLean/ElabMeetTheoremsNamedHostModuleCheckKernelEmitTerm.lean"
  # Long-file split: HostModuleCheckParityMultTerm named-subset native_decide theorems.
  "src/systems/SystemsLean/ElabMeetTheoremsNamedHostModuleCheckParityMultTerm.lean"
  # Long-file split: HostModuleCheckParityLinearTerm named-subset native_decide theorems.
  "src/systems/SystemsLean/ElabMeetTheoremsNamedHostModuleCheckParityLinearTerm.lean"
  # Long-file split: native_decide drive theorems (same namespace ElabMeet).
  "src/systems/SystemsLean/ElabMeetTheorems.lean"
];
}
