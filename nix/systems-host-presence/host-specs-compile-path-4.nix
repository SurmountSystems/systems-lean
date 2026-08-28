# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# No bash, no Python.
{
  hostSpecsCompilePath4 = [
    {
      # COMPILE-PATH-BODY: Body unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathBody.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathBody"
        "COMPILE-PATH-BODY"
        "BODY-FIXTURE"
        "HOST-EMIT-BODY"
        "bodyFixtureCompilePathReady"
        "bodyFixtureProgramReady"
        "bodyFixtureComposeReady"
        "bodyFixtureEmitPathOk"
        "bodyFixtureBodyOk"
        "lowerBodyFixtureProgram"
        "lowerBodyFixtureCompose"
        "COMPILE-PATH-BODY-SMOKE"
        "COMPILE-PATH-BODY-THEOREM"
        "bodyFixtureCompilePathReady_true"
        "bodyFixtureDoesNotMeanResidualFree_true"
        "bodyFixture_claims_false"
        "bodyFixtureMintId_eq"
        "bodyFromCompose"
        "bodyOk"
        "theorem bodyFixtureCompilePathReady_true"
        "theorem bodyFixtureDoesNotMeanResidualFree_true"
        "theorem bodyFixture_claims_false"
        "theorem bodyFixtureComposeReady_true"
        "theorem bodyFixtureBodyOk_true"
        "theorem bodyFixtureMintId_eq"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitBody"
      ];
    }
    {
      # HOST-MODULE-CHECK ExtractSubsetEmit L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckExtractSubsetEmitTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckExtractSubsetEmitTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "ExtractSubsetEmit-only"
        "ILL-TYPED-TERM"
        "checkExtractSubsetEmitTermDialect"
        "hostModuleCheckExtractSubsetEmitTermSurfaceDualOk"
        "hostModuleCheckExtractSubsetEmitTermSurfaceOk"
        "HostModuleCheckExtractSubsetEmitTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK MultSubsetEmit L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckMultSubsetEmitTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckMultSubsetEmitTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "MultSubsetEmit-only"
        "ILL-TYPED-TERM"
        "checkMultSubsetEmitTermDialect"
        "hostModuleCheckMultSubsetEmitTermSurfaceDualOk"
        "hostModuleCheckMultSubsetEmitTermSurfaceOk"
        "HostModuleCheckMultSubsetEmitTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK MultSubsetRebuild L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckMultSubsetRebuildTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckMultSubsetRebuildTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "MultSubsetRebuild-only"
        "ILL-TYPED-TERM"
        "checkMultSubsetRebuildTermDialect"
        "hostModuleCheckMultSubsetRebuildTermSurfaceDualOk"
        "hostModuleCheckMultSubsetRebuildTermSurfaceOk"
        "HostModuleCheckMultSubsetRebuildTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK LinearSubsetRebuild L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckLinearSubsetRebuildTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckLinearSubsetRebuildTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "LinearSubsetRebuild-only"
        "ILL-TYPED-TERM"
        "checkLinearSubsetRebuildTermDialect"
        "hostModuleCheckLinearSubsetRebuildTermSurfaceDualOk"
        "hostModuleCheckLinearSubsetRebuildTermSurfaceOk"
        "HostModuleCheckLinearSubsetRebuildTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK TypesSubsetRebuild L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckTypesSubsetRebuildTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckTypesSubsetRebuildTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "TypesSubsetRebuild-only"
        "ILL-TYPED-TERM"
        "checkTypesSubsetRebuildTermDialect"
        "hostModuleCheckTypesSubsetRebuildTermSurfaceDualOk"
        "hostModuleCheckTypesSubsetRebuildTermSurfaceOk"
        "HostModuleCheckTypesSubsetRebuildTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ProgramSubsetRebuild L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckProgramSubsetRebuildTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckProgramSubsetRebuildTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "ProgramSubsetRebuild-only"
        "ILL-TYPED-TERM"
        "checkProgramSubsetRebuildTermDialect"
        "hostModuleCheckProgramSubsetRebuildTermSurfaceDualOk"
        "hostModuleCheckProgramSubsetRebuildTermSurfaceOk"
        "HostModuleCheckProgramSubsetRebuildTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK GraphSubsetRebuild L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckGraphSubsetRebuildTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckGraphSubsetRebuildTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "GraphSubsetRebuild-only"
        "ILL-TYPED-TERM"
        "checkGraphSubsetRebuildTermDialect"
        "hostModuleCheckGraphSubsetRebuildTermSurfaceDualOk"
        "hostModuleCheckGraphSubsetRebuildTermSurfaceOk"
        "HostModuleCheckGraphSubsetRebuildTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ComposeSubsetRebuild L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckComposeSubsetRebuildTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckComposeSubsetRebuildTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "ComposeSubsetRebuild-only"
        "ILL-TYPED-TERM"
        "checkComposeSubsetRebuildTermDialect"
        "hostModuleCheckComposeSubsetRebuildTermSurfaceDualOk"
        "hostModuleCheckComposeSubsetRebuildTermSurfaceOk"
        "HostModuleCheckComposeSubsetRebuildTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ErasureSubsetRebuild L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckErasureSubsetRebuildTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckErasureSubsetRebuildTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "ErasureSubsetRebuild-only"
        "ILL-TYPED-TERM"
        "checkErasureSubsetRebuildTermDialect"
        "hostModuleCheckErasureSubsetRebuildTermSurfaceDualOk"
        "hostModuleCheckErasureSubsetRebuildTermSurfaceOk"
        "HostModuleCheckErasureSubsetRebuildTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ExtractSubsetRebuild L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckExtractSubsetRebuildTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckExtractSubsetRebuildTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "ExtractSubsetRebuild-only"
        "ILL-TYPED-TERM"
        "checkExtractSubsetRebuildTermDialect"
        "hostModuleCheckExtractSubsetRebuildTermSurfaceDualOk"
        "hostModuleCheckExtractSubsetRebuildTermSurfaceOk"
        "HostModuleCheckExtractSubsetRebuildTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK HostFront L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckHostFrontTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckHostFrontTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "HostFront-only"
        "ILL-TYPED-TERM"
        "checkHostFrontTermDialect"
        "hostModuleCheckHostFrontTermSurfaceDualOk"
        "hostModuleCheckHostFrontTermSurfaceOk"
        "HostModuleCheckHostFrontTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK LLVM Mult text L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckLlvmMultTextTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckLlvmMultTextTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "LlvmMultText-only"
        "ILL-TYPED-TERM"
        "checkLlvmMultTextTermDialect"
        "hostModuleCheckLlvmMultTextTermSurfaceDualOk"
        "hostModuleCheckLlvmMultTextTermSurfaceOk"
        "HostModuleCheckLlvmMultTextTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Host fragment check L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckHostCheckTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckHostCheckTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "HostCheck-only"
        "ILL-TYPED-TERM"
        "checkHostCheckTermDialect"
        "hostModuleCheckHostCheckTermSurfaceDualOk"
        "hostModuleCheckHostCheckTermSurfaceOk"
        "hostFragmentCheckReady"
        "HostModuleCheckHostCheckTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Host fragment graph L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckHostGraphTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckHostGraphTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "HostGraph-only"
        "ILL-TYPED-TERM"
        "checkHostGraphTermDialect"
        "hostModuleCheckHostGraphTermSurfaceDualOk"
        "hostModuleCheckHostGraphTermSurfaceOk"
        "hostGraphReady"
        "HostModuleCheckHostGraphTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK LLVM Linear text L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckLlvmLinearTextTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckLlvmLinearTextTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "LlvmLinearText-only"
        "ILL-TYPED-TERM"
        "checkLlvmLinearTextTermDialect"
        "hostModuleCheckLlvmLinearTextTermSurfaceDualOk"
        "hostModuleCheckLlvmLinearTextTermSurfaceOk"
        "llvmLinearTextReady"
        "HostModuleCheckLlvmLinearTextTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Mult package writer tool L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckMultFsWriteToolTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckMultFsWriteToolTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "MultFsWriteTool-only"
        "ILL-TYPED-TERM"
        "checkMultFsWriteToolTermDialect"
        "hostModuleCheckMultFsWriteToolTermSurfaceDualOk"
        "hostModuleCheckMultFsWriteToolTermSurfaceOk"
        "multFsWriteToolReady"
        "HostModuleCheckMultFsWriteToolTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK FrontMultPackage L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckFrontMultPackageTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckFrontMultPackageTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "FrontMultPackage-only"
        "ILL-TYPED-TERM"
        "checkFrontMultPackageTermDialect"
        "hostModuleCheckFrontMultPackageTermSurfaceDualOk"
        "hostModuleCheckFrontMultPackageTermSurfaceOk"
        "frontMultPackageReady"
        "HostModuleCheckFrontMultPackageTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK SubsetPackageJoin L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckSubsetPackageJoinTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckSubsetPackageJoinTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "SubsetPackageJoin-only"
        "ILL-TYPED-TERM"
        "checkSubsetPackageJoinTermDialect"
        "hostModuleCheckSubsetPackageJoinTermSurfaceDualOk"
        "hostModuleCheckSubsetPackageJoinTermSurfaceOk"
        "subsetPackageJoinReady"
        "HostModuleCheckSubsetPackageJoinTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK LLVM Types text L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckLlvmTypesTextTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckLlvmTypesTextTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "LlvmTypesText-only"
        "ILL-TYPED-TERM"
        "checkLlvmTypesTextTermDialect"
        "hostModuleCheckLlvmTypesTextTermSurfaceDualOk"
        "hostModuleCheckLlvmTypesTextTermSurfaceOk"
        "llvmTypesTextReady"
        "HostModuleCheckLlvmTypesTextTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Mult freestanding deepen L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckMultFsDeepenTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckMultFsDeepenTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "MultFsDeepen-only"
        "ILL-TYPED-TERM"
        "checkMultFsDeepenTermDialect"
        "hostModuleCheckMultFsDeepenTermSurfaceDualOk"
        "hostModuleCheckMultFsDeepenTermSurfaceOk"
        "multFsDeepenReady"
        "HostModuleCheckMultFsDeepenTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Host package write L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckHostPackageWriteTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckHostPackageWriteTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "HostPackageWrite-only"
        "ILL-TYPED-TERM"
        "checkHostPackageWriteTermDialect"
        "hostModuleCheckHostPackageWriteTermSurfaceDualOk"
        "hostModuleCheckHostPackageWriteTermSurfaceOk"
        "hostPackageWriteReady"
        "HostModuleCheckHostPackageWriteTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK LLVM Program text L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckLlvmProgramTextTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckLlvmProgramTextTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "LlvmProgramText-only"
        "ILL-TYPED-TERM"
        "checkLlvmProgramTextTermDialect"
        "hostModuleCheckLlvmProgramTextTermSurfaceDualOk"
        "hostModuleCheckLlvmProgramTextTermSurfaceOk"
        "llvmProgramTextReady"
        "HostModuleCheckLlvmProgramTextTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK LLVM Graph text L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckLlvmGraphTextTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckLlvmGraphTextTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "LlvmGraphText-only"
        "ILL-TYPED-TERM"
        "checkLlvmGraphTextTermDialect"
        "hostModuleCheckLlvmGraphTextTermSurfaceDualOk"
        "hostModuleCheckLlvmGraphTextTermSurfaceOk"
        "llvmGraphTextReady"
        "HostModuleCheckLlvmGraphTextTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK LLVM Compose text L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckLlvmComposeTextTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckLlvmComposeTextTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "LlvmComposeText-only"
        "ILL-TYPED-TERM"
        "checkLlvmComposeTextTermDialect"
        "hostModuleCheckLlvmComposeTextTermSurfaceDualOk"
        "hostModuleCheckLlvmComposeTextTermSurfaceOk"
        "llvmComposeTextReady"
        "HostModuleCheckLlvmComposeTextTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK SelfApply leftover L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckSelfApplyFsTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckSelfApplyFsTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "SelfApplyFs-only"
        "ILL-TYPED-TERM"
        "checkSelfApplyFsTermDialect"
        "hostModuleCheckSelfApplyFsTermSurfaceDualOk"
        "hostModuleCheckSelfApplyFsTermSurfaceOk"
        "freestandingSelfApplyReady"
        "HostModuleCheckSelfApplyFsTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK InventoryClose leftover L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckInventoryCloseTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckInventoryCloseTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "InventoryClose-only"
        "ILL-TYPED-TERM"
        "checkInventoryCloseTermDialect"
        "hostModuleCheckInventoryCloseTermSurfaceDualOk"
        "hostModuleCheckInventoryCloseTermSurfaceOk"
        "inventoryCloseReady"
        "HostModuleCheckInventoryCloseTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ProductPathBars leftover L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckProductPathBarsTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckProductPathBarsTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "ProductPathBars-only"
        "ILL-TYPED-TERM"
        "checkProductPathBarsTermDialect"
        "hostModuleCheckProductPathBarsTermSurfaceDualOk"
        "hostModuleCheckProductPathBarsTermSurfaceOk"
        "freestandingProductPathReady"
        "HostModuleCheckProductPathBarsTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ProductPath leftover L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckProductPathTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckProductPathTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "ProductPath-only"
        "ILL-TYPED-TERM"
        "checkProductPathTermDialect"
        "hostModuleCheckProductPathTermSurfaceDualOk"
        "hostModuleCheckProductPathTermSurfaceOk"
        "productPathReady"
        "HostModuleCheckProductPathTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ProbeWire leftover L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckProbeWireTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckProbeWireTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "ProbeWire-only"
        "ILL-TYPED-TERM"
        "checkProbeWireTermDialect"
        "hostModuleCheckProbeWireTermSurfaceDualOk"
        "hostModuleCheckProbeWireTermSurfaceOk"
        "probeWireReady"
        "HostModuleCheckProbeWireTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK SelfHostBody leftover L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckSelfHostBodyTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckSelfHostBodyTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "SelfHostBody-only"
        "ILL-TYPED-TERM"
        "checkSelfHostBodyTermDialect"
        "hostModuleCheckSelfHostBodyTermSurfaceDualOk"
        "hostModuleCheckSelfHostBodyTermSurfaceOk"
        "selfHostBodyReady"
        "HostModuleCheckSelfHostBodyTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Package elaborate L4 later S-level fixtures (S17).
      rel = "src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageEnvFixturesLater"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PACKAGE-ELABORATE"
        "hostModuleCheckGoodPackageEnvS17Text"
        "hostModuleCheckGoodPackageEnvS22Text"
        "hostModuleCheckGoodPackageEnvS23Text"
        "hostModuleCheckGoodPackageEnvS24Text"
        "hostModuleCheckGoodPackageEnvS25Text"
        "hostModuleCheckGoodPackageEnvS26Text"
        "hostModuleCheckGoodPackageEnvS27Text"
        "hostModuleCheckGoodPackageEnvS28Text"
        "hostModuleCheckBadPackageEnvIllTypedExtractSubsetEmitText"
        "hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildText"
        "hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildText"
        "hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildText"
        "hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildText"
        "hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildText"
        "hostModuleCheckBadPackageEnvIllTypedHostFrontText"
        "hostModuleCheckBadPackageEnvIllTypedLlvmMultTextText"
        "packageEnvExtractSubsetEmitTermModuleGood"
        "HostModuleCheckPackageEnvFixturesLater"
        "import SystemsLean.HostModuleCheckPackageEnvFixturesS5"
        "import SystemsLean.HostModuleCheckExtractSubsetEmitTerm"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Package elaborate L4 S30 fixtures (S30 S35).
      rel = "src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesS30.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageEnvFixturesS30"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PACKAGE-ELABORATE"
        "hostModuleCheckGoodPackageEnvS30Text"
        "hostModuleCheckGoodPackageEnvS31Text"
        "hostModuleCheckGoodPackageEnvS32Text"
        "hostModuleCheckGoodPackageEnvS33Text"
        "hostModuleCheckGoodPackageEnvS34Text"
        "hostModuleCheckGoodPackageEnvS35Text"
        "hostModuleCheckBadPackageEnvIllTypedHostGraphText"
        "hostModuleCheckBadPackageEnvIllTypedLlvmLinearTextText"
        "hostModuleCheckBadPackageEnvIllTypedMultFsWriteToolText"
        "hostModuleCheckBadPackageEnvIllTypedFrontMultPackageText"
        "hostModuleCheckBadPackageEnvIllTypedSubsetPackageJoinText"
        "hostModuleCheckBadPackageEnvIllTypedLlvmTypesTextText"
        "packageEnvHostGraphTermModuleGood"
        "packageEnvLlvmLinearTextTermModuleGood"
        "packageEnvMultFsWriteToolTermModuleGood"
        "packageEnvFrontMultPackageTermModuleGood"
        "packageEnvSubsetPackageJoinTermModuleGood"
        "packageEnvLlvmTypesTextTermModuleGood"
        "HostModuleCheckPackageEnvFixturesS30"
        "import SystemsLean.HostModuleCheckPackageEnvFixturesLater"
        "import SystemsLean.HostModuleCheckHostGraphTerm"
        "import SystemsLean.HostModuleCheckLlvmLinearTextTerm"
        "import SystemsLean.HostModuleCheckMultFsWriteToolTerm"
        "import SystemsLean.HostModuleCheckFrontMultPackageTerm"
        "import SystemsLean.HostModuleCheckSubsetPackageJoinTerm"
        "import SystemsLean.HostModuleCheckLlvmTypesTextTerm"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Package elaborate L4 tail S-level fixtures (S36 S46).
      rel = "src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesTail.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageEnvFixturesTail"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PACKAGE-ELABORATE"
        "hostModuleCheckGoodPackageEnvS36Text"
        "hostModuleCheckGoodPackageEnvS37Text"
        "hostModuleCheckGoodPackageEnvS38Text"
        "hostModuleCheckGoodPackageEnvS39Text"
        "hostModuleCheckGoodPackageEnvS40Text"
        "hostModuleCheckGoodPackageEnvS41Text"
        "hostModuleCheckGoodPackageEnvS42Text"
        "hostModuleCheckGoodPackageEnvS43Text"
        "hostModuleCheckGoodPackageEnvS44Text"
        "hostModuleCheckGoodPackageEnvS45Text"
        "hostModuleCheckGoodPackageEnvS46Text"
        "hostModuleCheckBadPackageEnvIllTypedMultFsDeepenText"
        "hostModuleCheckBadPackageEnvIllTypedHostPackageWriteText"
        "hostModuleCheckBadPackageEnvIllTypedLlvmProgramTextText"
        "hostModuleCheckBadPackageEnvIllTypedLlvmGraphTextText"
        "hostModuleCheckBadPackageEnvIllTypedLlvmComposeTextText"
        "hostModuleCheckBadPackageEnvIllTypedSelfApplyFsText"
        "hostModuleCheckBadPackageEnvIllTypedInventoryCloseText"
        "hostModuleCheckBadPackageEnvIllTypedProductPathBarsText"
        "hostModuleCheckBadPackageEnvIllTypedProductPathText"
        "hostModuleCheckBadPackageEnvIllTypedProbeWireText"
        "hostModuleCheckBadPackageEnvIllTypedSelfHostBodyText"
        "packageEnvMultFsDeepenTermModuleGood"
        "packageEnvHostPackageWriteTermModuleGood"
        "packageEnvLlvmProgramTextTermModuleGood"
        "packageEnvLlvmGraphTextTermModuleGood"
        "packageEnvLlvmComposeTextTermModuleGood"
        "packageEnvSelfApplyFsTermModuleGood"
        "packageEnvInventoryCloseTermModuleGood"
        "packageEnvProductPathBarsTermModuleGood"
        "packageEnvProductPathTermModuleGood"
        "packageEnvProbeWireTermModuleGood"
        "packageEnvSelfHostBodyTermModuleGood"
        "packageEnvLlvmHoldResolveScaffold"
        "multFsDeepenReady"
        "hostPackageWriteReady"
        "llvmProgramTextReady"
        "llvmGraphTextReady"
        "llvmComposeTextReady"
        "freestandingSelfApplyReady"
        "inventoryCloseReady"
        "freestandingProductPathReady"
        "productPathReady"
        "probeWireReady"
        "selfHostBodyReady"
        "HostModuleCheckPackageEnvFixturesTail"
        "import SystemsLean.HostModuleCheckPackageEnvFixturesS30"
        "import SystemsLean.HostModuleCheckMultFsDeepenTerm"
        "import SystemsLean.HostModuleCheckHostPackageWriteTerm"
        "import SystemsLean.HostModuleCheckLlvmProgramTextTerm"
        "import SystemsLean.HostModuleCheckLlvmGraphTextTerm"
        "import SystemsLean.HostModuleCheckLlvmComposeTextTerm"
        "import SystemsLean.HostModuleCheckSelfApplyFsTerm"
        "import SystemsLean.HostModuleCheckInventoryCloseTerm"
        "import SystemsLean.HostModuleCheckProductPathBarsTerm"
        "import SystemsLean.HostModuleCheckProductPathTerm"
        "import SystemsLean.HostModuleCheckProbeWireTerm"
        "import SystemsLean.HostModuleCheckSelfHostBodyTerm"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Package elaborate L4 later-fold evidence (PE45..PE92).
      rel = "src/systems/SystemsLean/HostModuleCheckPackageEnvEvidenceLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageEnvEvidenceLater"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PACKAGE-ELABORATE"
        "packageEnvDialectRejectsIllTyped"
        "hostModuleCheckBadPackageEnvIllTypedCompilePathMultDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedHostFrontDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedHostFrontL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedLlvmMultTextDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedLlvmMultTextL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedMultFsDeepenDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedMultFsDeepenL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedHostPackageWriteDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedHostPackageWriteL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedLlvmProgramTextDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedLlvmProgramTextL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedLlvmGraphTextDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedLlvmGraphTextL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedLlvmComposeTextDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedLlvmComposeTextL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedSelfApplyFsDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedSelfApplyFsL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedInventoryCloseDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedInventoryCloseL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedProductPathBarsDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedProductPathBarsL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedProductPathDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedProductPathL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedProbeWireDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedProbeWireL0Accept"
        "hostModuleCheckBadPackageEnvIllTypedSelfHostBodyDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedSelfHostBodyL0Accept"
        "HostModuleCheckPackageEnvEvidenceLater"
        "import SystemsLean.HostModuleCheckPackageEnv"
        "import SystemsLean.HostModuleCheckInventoryCloseTerm"
        "import SystemsLean.HostModuleCheckProductPathBarsTerm"
        "import SystemsLean.HostModuleCheckProductPathTerm"
        "import SystemsLean.HostModuleCheckProbeWireTerm"
        "import SystemsLean.HostModuleCheckSelfHostBodyTerm"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Package elaborate L4 Soft J2 import helpers.
      rel = "src/systems/SystemsLean/HostModuleCheckPackageEnvImports.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageEnvImports"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PACKAGE-ELABORATE"
        "packageBodyImports"
        "packageBodyImportsMult"
        "packageBodyImportsCompilePathExtract"
        "packageBodyImportsOptional"
        "packageBodyImportsSelfApply"
        "packageBodyImportsSelfApplyFs"
        "packageBodyImportsInventoryClose"
        "packageBodyImportsProductPath"
        "packageBodyImportsDualResidual"
        "packageBodyImportsEmitMult"
        "packageBodyImportsProbeWire"
        "packageEnvRequireSection"
        "packageBodyImportsTypes"
        "HostModuleCheckPackageEnvImports"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Package elaborate L4 later S-level dialect tails.
      rel = "src/systems/SystemsLean/HostModuleCheckPackageEnvDialectTail.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageEnvDialectTail"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PACKAGE-ELABORATE"
        "checkPackageEnvDialectS30"
        "checkPackageEnvDialectS35"
        "checkPackageEnvDialectS37"
        "checkPackageEnvDialectS38"
        "checkPackageEnvDialectS39"
        "checkPackageEnvDialectS40"
        "checkPackageEnvDialectS41"
        "checkPackageEnvDialectS42"
        "checkPackageEnvDialectS43"
        "checkPackageEnvDialectS44"
        "checkPackageEnvDialectS45"
        "checkPackageEnvDialectS46"
        "HostModuleCheckPackageEnvDialectTail"
        "import SystemsLean.HostModuleCheckPackageEnvImports"
        "import SystemsLean.HostModuleCheckSelfHostBodyTerm"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
  ];
}
