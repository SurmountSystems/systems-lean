# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# No bash, no Python.
{
  hostSpecsCompilePath3 = [
    {
      # Thin Lake main for slake-host-package-write (SKELETON).
      rel = "src/systems/SystemsLean/HostPackageWriteMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostPackageWriteMain"
        "slake-host-package-write"
        "HostPackageWriteMain"
        "SKELETON"
        "import SystemsLean.HostPackageWrite"
      ];
    }
    {
      # HOST-PACKAGE-ROOTS: A3 package load without Lake on measured step (S1).
      rel = "src/systems/SystemsLean/HostPackageRoots.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostPackageRoots"
        "HOST-PACKAGE-ROOTS"
        "SLAKE_HOST_PACKAGE_ROOTS"
        "SLAKE_HOST_PACKAGE_ROOTS_V0"
        "HOST-HOST-PACKAGE-ROOTS"
        "hostPackageRootsReady"
        "hostPackageRootsFinishedClaimed"
        "hostPackageRootsLoadOk"
        "hostPackageRootsWithoutLakeFinished"
        "hostPackageRootsWithoutLakeReady"
        "hostPackageRootsWithoutLakeKeepsHostLake"
        "justRecipeWithoutLake"
        "prebuiltHostPackageRootsRel"
        "host-package-roots-without-lake"
        "HOST-PACKAGE-ROOTS-WITHOUT-LAKE"
        "hostPackageRootsHostElaboratorResidualRemains"
        "hostPackageRootsPackageName"
        "hostPackageRootsLibraryRoot"
        "hostPackageRootsConfigRel"
        "hostPackageRootsLibraryDirRel"
        "hostPackageRootsModuleCountFloor"
        "loadPackageRoots"
        "runPackageRoots"
        "HOST-PACKAGE-ROOTS-SMOKE"
        "HOST-PACKAGE-ROOTS-THEOREM"
        "hostPackageRootsReady_true"
        "slake-host-package-roots"
        "just host-package-roots"
        "Package roots without Lake"
        "def hostPackageRootsWithoutLakeFinished : Bool := true"
        "def hostPackageRootsFinishedClaimed : Bool := true"
        "def hostPackageRootsHostElaboratorResidualRemains : Bool := true"
        "def hostPackageRootsHostFreeClaimed : Bool := false"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Host elaborator residual remains"
      ];
    }
    {
      # Thin Lake main for slake-host-package-roots (SKELETON).
      rel = "src/systems/SystemsLean/HostPackageRootsMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostPackageRootsMain"
        "slake-host-package-roots"
        "HostPackageRootsMain"
        "SKELETON"
        "import SystemsLean.HostPackageRoots"
      ];
    }
    {
      # HOST-IMPORT-GRAPH hub: long-file peel import shell (S2).
      rel = "src/systems/SystemsLean/HostImportGraph.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostImportGraph"
        "HOST-IMPORT-GRAPH"
        "HostImportGraphSeeds"
        "HostImportGraphModel"
        "HostImportGraphMods"
        "HostImportGraphModsLater"
        "HostImportGraphLoadOk"
        "HostImportGraphTheorems"
        "HostImportGraphWalkLater"
        "HostImportGraphWalk"
        "HostImportGraphDriver"
        "import SystemsLean.HostImportGraphSeeds"
        "import SystemsLean.HostImportGraphModel"
        "import SystemsLean.HostImportGraphMods"
        "import SystemsLean.HostImportGraphModsLater"
        "import SystemsLean.HostImportGraphLoadOk"
        "import SystemsLean.HostImportGraphTheorems"
        "import SystemsLean.HostImportGraphWalkLater"
        "import SystemsLean.HostImportGraphWalk"
        "import SystemsLean.HostImportGraphDriver"
        "SLAKE_HOST_IMPORT_GRAPH_V0"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Host elaborator residual remains"
      ];
    }
    {
      # HOST-IMPORT-GRAPH seeds + honesty pins.
      rel = "src/systems/SystemsLean/HostImportGraphSeeds.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostImportGraphSeeds"
        "HOST-IMPORT-GRAPH"
        "SLAKE_HOST_IMPORT_GRAPH_V0"
        "HOST-HOST-IMPORT-GRAPH"
        "hostImportGraphSeedModules"
        "hostImportGraphExpandSliceName"
        "hostImportGraphFinishedClaimed"
        "hostImportGraphWithoutLakeFinished"
        "hostImportGraphHostElaboratorResidualRemains"
        "hostImportGraphHostFreeClaimed"
        "justRecipeWithoutLake"
        "prebuiltHostImportGraphRel"
        "host-import-graph-without-lake"
        "HOST-IMPORT-GRAPH-WITHOUT-LAKE"
        "Real Mult import graph"
        "Host library seed expand continue"
        "def hostImportGraphWithoutLakeFinished : Bool := true"
        "def hostImportGraphFinishedClaimed : Bool := true"
        "def hostImportGraphHostElaboratorResidualRemains : Bool := true"
        "def hostImportGraphHostFreeClaimed : Bool := false"
        "MISSING-IMPORT"
        "IMPORT-CYCLE"
        "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText+SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars+InventoryCloseTheorems+ProductPath+ProductPathTheorems+DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Host elaborator residual remains"
      ];
    }
    {
      # HOST-IMPORT-GRAPH RealMod model + resolve.
      rel = "src/systems/SystemsLean/HostImportGraphModel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostImportGraphModel"
        "RealMod"
        "ImportGraphResult"
        "resolveImportGraph"
        "extractImports"
        "filterSeedImports"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Host elaborator residual remains"
      ];
    }
    {
      # HOST-IMPORT-GRAPH early RealMod fixtures.
      rel = "src/systems/SystemsLean/HostImportGraphMods.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostImportGraphMods"
        "multLeafMod"
        "hostComposeMod"
        "emitMultMod"
        "parityMultMod"
        "stepContractFullTheoremsMod"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Host elaborator residual remains"
      ];
    }
    {
      # HOST-IMPORT-GRAPH later RealMod fixtures + good/bad seeds.
      rel = "src/systems/SystemsLean/HostImportGraphModsLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostImportGraphModsLater"
        "selfHostCompleteMod"
        "selfApplyFsMod"
        "specProofTheoremsMod"
        "hostImportGraphGoodMultSeed"
        "hostImportGraphGoodExpandSeed"
        "hostImportGraphBadMissing"
        "hostImportGraphBadCycle"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Host elaborator residual remains"
      ];
    }
    {
      # HOST-IMPORT-GRAPH LoadOk fold + readiness.
      rel = "src/systems/SystemsLean/HostImportGraphLoadOk.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostImportGraphLoadOk"
        "hostImportGraphLoadOk"
        "hostImportGraphLoadOkImportEdges"
        "HostImportGraphLoadOkLater"
        "hostImportGraphReady"
        "hostImportGraphWithoutLakeReady"
        "hostImportGraphWithoutLakeKeepsHostLake"
        "HOST-IMPORT-GRAPH-WITHOUT-LAKE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Host elaborator residual remains"
      ];
    }
    {
      # HOST-IMPORT-GRAPH LoadOk import-edge dual-pins companion (S1 peel).
      rel = "src/systems/SystemsLean/HostImportGraphLoadOkLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostImportGraphLoadOkLater"
        "hostImportGraphLoadOkImportEdges"
        "HostImportGraphLoadOkLater"
        "namespace SystemsLean.HostImportGraph"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Host elaborator residual remains"
      ];
    }
    {
      # HOST-IMPORT-GRAPH theorems + smoke.
      rel = "src/systems/SystemsLean/HostImportGraphTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostImportGraphTheorems"
        "HOST-IMPORT-GRAPH-THEOREM"
        "HOST-IMPORT-GRAPH-SMOKE"
        "hostImportGraphReady_true"
        "hostImportGraphLoadOk_true"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Host elaborator residual remains"
      ];
    }
    {
      # HOST-IMPORT-GRAPH on-disk order edge walk (early + call later).
      rel = "src/systems/SystemsLean/HostImportGraphWalk.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostImportGraphWalk"
        "import SystemsLean.HostImportGraphWalkLater"
        "checkImportOrderEdges"
        "checkImportOrderEdgesLater"
        "HostImportGraphWalkLater"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Host elaborator residual remains"
      ];
    }
    {
      # HOST-IMPORT-GRAPH later order edge walk peel.
      rel = "src/systems/SystemsLean/HostImportGraphWalkLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostImportGraphWalkLater"
        "checkImportOrderEdgesLater"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Host elaborator residual remains"
      ];
    }
    {
      # HOST-IMPORT-GRAPH driver IO.
      rel = "src/systems/SystemsLean/HostImportGraphDriver.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostImportGraphDriver"
        "loadMultImportGraph"
        "runImportGraph"
        "filterArgs"
        "printOrder"
        "slake-host-import-graph"
        "just host-import-graph"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Host elaborator residual remains"
      ];
    }
    {
      # Thin Lake main for slake-host-import-graph (SKELETON).
      rel = "src/systems/SystemsLean/HostImportGraphMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostImportGraphMain"
        "slake-host-import-graph"
        "HostImportGraphMain"
        "SKELETON"
        "import SystemsLean.HostImportGraph"
      ];
    }
    {
      # HOST-MODULE-CHECK: A5 first real host module check without Lake (S3).
      rel = "src/systems/SystemsLean/HostModuleCheck.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheck"
        "HOST-MODULE-CHECK"
        "HostModuleCheckSeeds"
        "HostModuleCheckLoadOk"
        "HostModuleCheckDriver"
        "HostModuleCheckCheckers"
        "HostModuleCheckCheckersLater"
        "HostModuleCheckAcceptsGoods"
        "HostModuleCheckAcceptsProof"
        "HostModuleCheckAccepts"
        "HostModuleCheckSurface"
        "HostModuleCheckFixtures"
        "import SystemsLean.HostModuleCheckSeeds"
        "import SystemsLean.HostModuleCheckLoadOk"
        "import SystemsLean.HostModuleCheckDriverIO"
        "import SystemsLean.HostModuleCheckDriver"
        "import SystemsLean.HostModuleCheckAcceptsProof"
        "import SystemsLean.HostModuleCheckAccepts"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Host elaborator residual remains"
      ];
    }
    {
      # HOST-MODULE-CHECK fixture corpus + bad texts long-file tip.
      rel = "src/systems/SystemsLean/HostModuleCheckFixtures.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckFixtures"
        "hostModuleCheckTheoremCorpusOk"
        "hostModuleCheckBadMissingInductiveText"
        "hostModuleCheckBadMissingAxiomText"
        "hostModuleCheckBadMissingStructureText"
        "hostModuleCheckBadMissingProgramStructureText"
        "hostModuleCheckBadMissingErasedStructureText"
        "HostModuleCheckFixtures"
        "import SystemsLean.HostModuleCheckRequiredDecls"
        "import SystemsLean.HostModuleCheckFixtureTexts"
        "Host library seed expand continue"
        "Check depth deepen continue"
        "FOUNDATION-KIND-SURFACE"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK required key-decl lists foundation companion.
      rel = "src/systems/SystemsLean/HostModuleCheckRequiredDecls.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckRequiredDecls"
        "namespace SystemsLean.HostModuleCheck"
        "multRequiredDecls"
        "linearRequiredDecls"
        "hostComposeRequiredDecls"
        "emitBannerScaffoldRequiredDecls"
        "HostModuleCheckRequiredDecls"
        "Host library seed expand continue"
        "FOUNDATION-KIND-SURFACE"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK required key-decl lists product companion.
      rel = "src/systems/SystemsLean/HostModuleCheckRequiredDeclsProduct.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckRequiredDeclsProduct"
        "namespace SystemsLean.HostModuleCheck"
        "productOutKernelRequiredDecls"
        "capableRequiredDecls"
        "compilePathGraphRequiredDecls"
        "HostModuleCheckRequiredDeclsProduct"
        "Host library seed expand continue"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK required key-decl lists later companion.
      rel = "src/systems/SystemsLean/HostModuleCheckRequiredDeclsLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckRequiredDeclsLater"
        "namespace SystemsLean.HostModuleCheck"
        "compilePathComposeRequiredDecls"
        "selfApplyRequiredDecls"
        "selfApplyTheoremsRequiredDecls"
        "HostModuleCheckRequiredDeclsLater"
        "Host library seed expand continue"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK good fixture texts foundation companion.
      rel = "src/systems/SystemsLean/HostModuleCheckFixtureTexts.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckFixtureTexts"
        "namespace SystemsLean.HostModuleCheck"
        "hostModuleCheckGoodMultText"
        "hostModuleCheckGoodIrProgramText"
        "hostModuleCheckGoodHostComposeText"
        "hostModuleCheckGoodSurfaceMatrixTheoremsText"
        "HostModuleCheckFixtureTextsEmit"
        "HostModuleCheckFixtureTexts"
        "Host library seed expand continue"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK good fixture texts product companion.
      rel = "src/systems/SystemsLean/HostModuleCheckFixtureTextsProduct.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckFixtureTextsProduct"
        "namespace SystemsLean.HostModuleCheck"
        "hostModuleCheckGoodProductPathPerformText"
        "hostModuleCheckGoodProductPathPerformTheoremsText"
        "hostModuleCheckGoodTypesSubsetEmitText"
        "HostModuleCheckFixtureTextsProduct"
        "Host library seed expand continue"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK good fixture texts later companion.
      rel = "src/systems/SystemsLean/HostModuleCheckFixtureTextsLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckFixtureTextsLater"
        "namespace SystemsLean.HostModuleCheck"
        "hostModuleCheckGoodProgramSubsetEmitText"
        "hostModuleCheckGoodLlvmComposeTextText"
        "HostModuleCheckFixtureTextsLater"
        "Host library seed expand continue"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK good fixture texts self-host companion.
      rel = "src/systems/SystemsLean/HostModuleCheckFixtureTextsSelfHost.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckFixtureTextsSelfHost"
        "namespace SystemsLean.HostModuleCheck"
        "hostModuleCheckGoodSelfApplyFsText"
        "hostModuleCheckGoodSelfApplyTheoremsText"
        "HostModuleCheckFixtureTextsSelfHost"
        "Host library seed expand continue"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK good fixture texts Emit scaffold companion (S1 peel).
      rel = "src/systems/SystemsLean/HostModuleCheckFixtureTextsEmit.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckFixtureTextsEmit"
        "namespace SystemsLean.HostModuleCheck"
        "hostModuleCheckGoodEmitMultScaffoldText"
        "hostModuleCheckGoodProductPathOwnershipInputsText"
        "HostModuleCheckFixtureTextsEmit"
        "Host library seed expand continue"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK structural surface checkers long-file split companion.
      rel = "src/systems/SystemsLean/HostModuleCheckSurface.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckSurface"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "RealModuleSurface"
        "ModuleCheckResult"
        "checkNamedSurface"
        "extractImports"
        "extractKeyDecls"
        "reasonMissingDecl"
        "HostModuleCheckSurface"
        "import SystemsLean.HostModuleCheckFixtures"
        "PARTIAL-STRUCTURAL"
        "FOUNDATION-KIND-SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Mult L2 term-surface companion (J5+J6 Mult pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckMultTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckMultTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "Mult-only"
        "ILL-TYPED-TERM"
        "checkMultTermDialect"
        "hostModuleCheckTermSurfaceDualOk"
        "hostModuleCheckMultTermSurfaceOk"
        "hostModuleCheckBadMultNameReturnTypeText"
        "hostModuleCheckBadMultIsValidAppText"
        "hostModuleCheckBadMultIsValidArmText"
        "HostModuleCheckMultTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Linear L2 term-surface companion (def-shape pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckLinearTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckLinearTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "Linear-only"
        "ILL-TYPED-TERM"
        "checkLinearTermDialect"
        "hostModuleCheckLinearTermSurfaceDualOk"
        "hostModuleCheckLinearTermSurfaceOk"
        "hostModuleCheckBadLinearShareNatReturnTypeText"
        "hostModuleCheckBadLinearPolyIdBodyText"
        "hostModuleCheckBadLinearMult0ClassIdText"
        "hostModuleCheckBadLinearRoundTripBodyText"
        "hostModuleCheckLinearTermSurfaceOk"
        "HostModuleCheckLinearTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Types L2 term-surface companion (def-shape pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckTypesTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckTypesTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "Types-only"
        "ILL-TYPED-TERM"
        "checkTypesTermDialect"
        "hostModuleCheckTypesTermSurfaceDualOk"
        "hostModuleCheckTypesTermSurfaceOk"
        "hostModuleCheckBadTypesNameArmText"
        "hostModuleCheckBadTypesExpectedMultArmText"
        "hostModuleCheckBadTypesKindMultOkBodyText"
        "hostModuleCheckBadTypesOfKindTagArmText"
        "hostModuleCheckTypesTermSurfaceOk"
        "HostModuleCheckTypesTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK IrProgram L2 term-surface companion (def-shape pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckIrProgramTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckIrProgramTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "IrProgram-only"
        "ILL-TYPED-TERM"
        "checkIrProgramTermDialect"
        "hostModuleCheckIrProgramTermSurfaceDualOk"
        "hostModuleCheckIrProgramTermSurfaceOk"
        "hostModuleCheckBadIrProgramCapText"
        "hostModuleCheckBadIrProgramCheckFailClosedText"
        "hostModuleCheckBadIrProgramIsWellTypedText"
        "hostModuleCheckBadIrProgramPushText"
        "hostModuleCheckIrProgramTermSurfaceOk"
        "HostModuleCheckIrProgramTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK IrGraph L2 term-surface companion (def-shape pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckIrGraphTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckIrGraphTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "IrGraph-only"
        "ILL-TYPED-TERM"
        "checkIrGraphTermDialect"
        "hostModuleCheckIrGraphTermSurfaceDualOk"
        "hostModuleCheckIrGraphTermSurfaceOk"
        "hostModuleCheckBadIrGraphEdgeMaxText"
        "hostModuleCheckBadIrGraphCheckFailClosedText"
        "hostModuleCheckBadIrGraphIsWellTypedText"
        "hostModuleCheckBadIrGraphPushNodeText"
        "hostModuleCheckIrGraphTermSurfaceOk"
        "HostModuleCheckIrGraphTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK HostCompose L2 term-surface companion (def-shape pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckHostComposeTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckHostComposeTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "HostCompose-only"
        "ILL-TYPED-TERM"
        "checkHostComposeTermDialect"
        "hostModuleCheckHostComposeTermSurfaceDualOk"
        "hostModuleCheckHostComposeTermSurfaceOk"
        "hostModuleCheckBadHostComposeEmptyText"
        "hostModuleCheckBadHostComposeCheckFailClosedText"
        "hostModuleCheckBadHostComposeMintText"
        "hostModuleCheckBadHostComposePushHostNodeText"
        "hostModuleCheckHostComposeTermSurfaceOk"
        "HostModuleCheckHostComposeTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Erasure L2 term-surface companion (def-shape pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckErasureTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckErasureTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "Erasure-only"
        "ILL-TYPED-TERM"
        "checkErasureTermDialect"
        "hostModuleCheckErasureTermSurfaceDualOk"
        "hostModuleCheckErasureTermSurfaceOk"
        "hostModuleCheckBadErasureCheckFailClosedText"
        "hostModuleCheckBadErasureIsErasureGradeText"
        "hostModuleCheckBadErasureMarkForGradeText"
        "hostModuleCheckBadErasureIsRuntimeAbsentText"
        "hostModuleCheckErasureTermSurfaceOk"
        "HostModuleCheckErasureTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Extract L2 term-surface companion (def-shape pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckExtractTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckExtractTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "Extract-only"
        "ILL-TYPED-TERM"
        "checkExtractTermDialect"
        "hostModuleCheckExtractTermSurfaceDualOk"
        "hostModuleCheckExtractTermSurfaceOk"
        "hostModuleCheckBadExtractCheckFailClosedText"
        "hostModuleCheckBadExtractIsFreestandingGoalText"
        "hostModuleCheckBadExtractExtractOkText"
        "hostModuleCheckBadExtractIsValidRuntimeTagText"
        "hostModuleCheckExtractTermSurfaceOk"
        "HostModuleCheckExtractTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK EmitPlan L2 term-surface companion (Plan dialect pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckEmitPlanTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckEmitPlanTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "EmitPlan-only"
        "ILL-TYPED-TERM"
        "checkEmitPlanTermDialect"
        "hostModuleCheckEmitPlanTermSurfaceDualOk"
        "hostModuleCheckEmitPlanTermSurfaceOk"
        "hostModuleCheckBadEmitPlanFailClosedText"
        "hostModuleCheckBadEmitPlanIsRuntimeMultText"
        "hostModuleCheckBadEmitPlanFromComposeText"
        "hostModuleCheckBadEmitPlanIsReadyText"
        "hostModuleCheckEmitPlanTermSurfaceOk"
        "HostModuleCheckEmitPlanTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK EmitApply L2 term-surface companion (Apply dialect pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckEmitApplyTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckEmitApplyTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "EmitApply-only"
        "ILL-TYPED-TERM"
        "checkEmitApplyTermDialect"
        "hostModuleCheckEmitApplyTermSurfaceDualOk"
        "hostModuleCheckEmitApplyTermSurfaceOk"
        "hostModuleCheckBadEmitApplyFailClosedText"
        "hostModuleCheckBadEmitApplyCapText"
        "hostModuleCheckBadEmitApplyMultCodeText"
        "hostModuleCheckBadEmitApplyFromComposeText"
        "hostModuleCheckEmitApplyTermSurfaceOk"
        "HostModuleCheckEmitApplyTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK EmitBody L2 term-surface companion (Body dialect pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckEmitBodyTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckEmitBodyTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "EmitBody-only"
        "ILL-TYPED-TERM"
        "checkEmitBodyTermDialect"
        "hostModuleCheckEmitBodyTermSurfaceDualOk"
        "hostModuleCheckEmitBodyTermSurfaceOk"
        "hostModuleCheckBadEmitBodyFailClosedText"
        "hostModuleCheckBadEmitBodyCapText"
        "hostModuleCheckBadEmitBodyFromComposeText"
        "hostModuleCheckBadEmitBodyIsValidText"
        "hostModuleCheckEmitBodyTermSurfaceOk"
        "HostModuleCheckEmitBodyTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelMult L2 term-surface companion (C2a KernelMult dialect pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckKernelMultTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelMultTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "KernelMult-only"
        "ILL-TYPED-TERM"
        "checkKernelMultTermDialect"
        "hostModuleCheckKernelMultTermSurfaceDualOk"
        "hostModuleCheckKernelMultTermSurfaceOk"
        "hostModuleCheckBadKernelMultStageIdText"
        "hostModuleCheckBadKernelMultLowerText"
        "hostModuleCheckBadKernelMultReadyText"
        "hostModuleCheckBadKernelMultUnknownTagText"
        "hostModuleCheckKernelMultTermSurfaceOk"
        "HostModuleCheckKernelMultTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelLinear L2 term-surface companion (C2 KernelLinear dialect pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckKernelLinearTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelLinearTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "KernelLinear-only"
        "ILL-TYPED-TERM"
        "checkKernelLinearTermDialect"
        "hostModuleCheckKernelLinearTermSurfaceDualOk"
        "hostModuleCheckKernelLinearTermSurfaceOk"
        "hostModuleCheckBadKernelLinearStageIdText"
        "hostModuleCheckBadKernelLinearLowerText"
        "hostModuleCheckBadKernelLinearReadyText"
        "hostModuleCheckBadKernelLinearMismatchText"
        "hostModuleCheckKernelLinearTermSurfaceOk"
        "HostModuleCheckKernelLinearTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelTypes L2 term-surface companion (C2 KernelTypes dialect pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckKernelTypesTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelTypesTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "KernelTypes-only"
        "ILL-TYPED-TERM"
        "checkKernelTypesTermDialect"
        "hostModuleCheckKernelTypesTermSurfaceDualOk"
        "hostModuleCheckKernelTypesTermSurfaceOk"
        "hostModuleCheckBadKernelTypesStageIdText"
        "hostModuleCheckBadKernelTypesLowerText"
        "hostModuleCheckBadKernelTypesReadyText"
        "hostModuleCheckBadKernelTypesUnknownKindText"
        "hostModuleCheckKernelTypesTermSurfaceOk"
        "HostModuleCheckKernelTypesTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelProgram L2 term-surface companion (C2 KernelProgram dialect pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckKernelProgramTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelProgramTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "KernelProgram-only"
        "ILL-TYPED-TERM"
        "checkKernelProgramTermDialect"
        "hostModuleCheckKernelProgramTermSurfaceDualOk"
        "hostModuleCheckKernelProgramTermSurfaceOk"
        "hostModuleCheckBadKernelProgramStageIdText"
        "hostModuleCheckBadKernelProgramLowerText"
        "hostModuleCheckBadKernelProgramReadyText"
        "hostModuleCheckBadKernelProgramOkText"
        "hostModuleCheckKernelProgramTermSurfaceOk"
        "HostModuleCheckKernelProgramTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelEmit L2 term-surface companion (C2 KernelEmit dialect pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckKernelEmitTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelEmitTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "KernelEmit-only"
        "ILL-TYPED-TERM"
        "checkKernelEmitTermDialect"
        "hostModuleCheckKernelEmitTermSurfaceDualOk"
        "hostModuleCheckKernelEmitTermSurfaceOk"
        "hostModuleCheckBadKernelEmitStageIdText"
        "hostModuleCheckBadKernelEmitLowerText"
        "hostModuleCheckBadKernelEmitReadyText"
        "hostModuleCheckBadKernelEmitOkText"
        "hostModuleCheckKernelEmitTermSurfaceOk"
        "HostModuleCheckKernelEmitTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ParityMult L2 term-surface companion (first post-Kernel unit).
      rel = "src/systems/SystemsLean/HostModuleCheckParityMultTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckParityMultTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "ParityMult-only"
        "ILL-TYPED-TERM"
        "checkParityMultTermDialect"
        "hostModuleCheckParityMultTermSurfaceDualOk"
        "hostModuleCheckParityMultTermSurfaceOk"
        "hostModuleCheckBadParityMultStageIdText"
        "hostModuleCheckBadParityMultReadyText"
        "hostModuleCheckBadParityMultOkText"
        "hostModuleCheckBadParityMultGradeText"
        "hostModuleCheckParityMultTermSurfaceOk"
        "HostModuleCheckParityMultTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ParityLinear L2 term-surface companion (second post-Kernel unit).
      rel = "src/systems/SystemsLean/HostModuleCheckParityLinearTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckParityLinearTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "ParityLinear-only"
        "ILL-TYPED-TERM"
        "checkParityLinearTermDialect"
        "hostModuleCheckParityLinearTermSurfaceDualOk"
        "hostModuleCheckParityLinearTermSurfaceOk"
        "hostModuleCheckBadParityLinearStageIdText"
        "hostModuleCheckBadParityLinearReadyText"
        "hostModuleCheckBadParityLinearOkText"
        "hostModuleCheckBadParityLinearContractText"
        "hostModuleCheckParityLinearTermSurfaceOk"
        "HostModuleCheckParityLinearTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ParityTypes L2 term-surface companion (third post-Kernel unit).
      rel = "src/systems/SystemsLean/HostModuleCheckParityTypesTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckParityTypesTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "ParityTypes-only"
        "ILL-TYPED-TERM"
        "checkParityTypesTermDialect"
        "hostModuleCheckParityTypesTermSurfaceDualOk"
        "hostModuleCheckParityTypesTermSurfaceOk"
        "hostModuleCheckBadParityTypesStageIdText"
        "hostModuleCheckBadParityTypesReadyText"
        "hostModuleCheckBadParityTypesOkText"
        "hostModuleCheckBadParityTypesContractText"
        "hostModuleCheckParityTypesTermSurfaceOk"
        "HostModuleCheckParityTypesTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ParityProgram L2 term-surface companion (fourth post-Kernel unit).
      rel = "src/systems/SystemsLean/HostModuleCheckParityProgramTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckParityProgramTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "ParityProgram-only"
        "ILL-TYPED-TERM"
        "checkParityProgramTermDialect"
        "hostModuleCheckParityProgramTermSurfaceDualOk"
        "hostModuleCheckParityProgramTermSurfaceOk"
        "hostModuleCheckBadParityProgramStageIdText"
        "hostModuleCheckBadParityProgramReadyText"
        "hostModuleCheckBadParityProgramOkText"
        "hostModuleCheckBadParityProgramContractText"
        "hostModuleCheckParityProgramTermSurfaceOk"
        "HostModuleCheckParityProgramTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ParityEmit L2 term-surface companion (fifth post-Kernel unit).
      rel = "src/systems/SystemsLean/HostModuleCheckParityEmitTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckParityEmitTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "ParityEmit-only"
        "ILL-TYPED-TERM"
        "checkParityEmitTermDialect"
        "hostModuleCheckParityEmitTermSurfaceDualOk"
        "hostModuleCheckParityEmitTermSurfaceOk"
        "hostModuleCheckBadParityEmitStageIdText"
        "hostModuleCheckBadParityEmitReadyText"
        "hostModuleCheckBadParityEmitOkText"
        "hostModuleCheckBadParityEmitContractText"
        "hostModuleCheckParityEmitTermSurfaceOk"
        "HostModuleCheckParityEmitTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK EmitMultScaffold L2 term-surface companion (U1).
      rel = "src/systems/SystemsLean/HostModuleCheckEmitMultScaffoldTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckEmitMultScaffoldTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "EmitMultScaffold-only"
        "ILL-TYPED-TERM"
        "checkEmitMultScaffoldTermDialect"
        "hostModuleCheckEmitMultScaffoldTermSurfaceDualOk"
        "hostModuleCheckEmitMultScaffoldTermSurfaceOk"
        "hostModuleCheckBadEmitMultScaffoldStageIdText"
        "hostModuleCheckBadEmitMultScaffoldReadyText"
        "hostModuleCheckBadEmitMultScaffoldOkText"
        "hostModuleCheckBadEmitMultScaffoldContractText"
        "hostModuleCheckEmitMultScaffoldTermSurfaceOk"
        "HostModuleCheckEmitMultScaffoldTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK EmitLinearScaffold L2 term-surface companion (U1).
      rel = "src/systems/SystemsLean/HostModuleCheckEmitLinearScaffoldTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckEmitLinearScaffoldTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "EmitLinearScaffold-only"
        "ILL-TYPED-TERM"
        "checkEmitLinearScaffoldTermDialect"
        "hostModuleCheckEmitLinearScaffoldTermSurfaceDualOk"
        "hostModuleCheckEmitLinearScaffoldTermSurfaceOk"
        "hostModuleCheckBadEmitLinearScaffoldStageIdText"
        "hostModuleCheckBadEmitLinearScaffoldReadyText"
        "hostModuleCheckBadEmitLinearScaffoldOkText"
        "hostModuleCheckBadEmitLinearScaffoldContractText"
        "hostModuleCheckEmitLinearScaffoldTermSurfaceOk"
        "HostModuleCheckEmitLinearScaffoldTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK EmitTypesScaffold L2 term-surface companion (U1).
      rel = "src/systems/SystemsLean/HostModuleCheckEmitTypesScaffoldTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckEmitTypesScaffoldTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "EmitTypesScaffold-only"
        "ILL-TYPED-TERM"
        "checkEmitTypesScaffoldTermDialect"
        "hostModuleCheckEmitTypesScaffoldTermSurfaceDualOk"
        "hostModuleCheckEmitTypesScaffoldTermSurfaceOk"
        "hostModuleCheckBadEmitTypesScaffoldStageIdText"
        "hostModuleCheckBadEmitTypesScaffoldReadyText"
        "hostModuleCheckBadEmitTypesScaffoldOkText"
        "hostModuleCheckBadEmitTypesScaffoldContractText"
        "hostModuleCheckEmitTypesScaffoldTermSurfaceOk"
        "HostModuleCheckEmitTypesScaffoldTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK EmitProgramScaffold L2 term-surface companion (U1).
      rel = "src/systems/SystemsLean/HostModuleCheckEmitProgramScaffoldTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckEmitProgramScaffoldTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "EmitProgramScaffold-only"
        "ILL-TYPED-TERM"
        "checkEmitProgramScaffoldTermDialect"
        "hostModuleCheckEmitProgramScaffoldTermSurfaceDualOk"
        "hostModuleCheckEmitProgramScaffoldTermSurfaceOk"
        "hostModuleCheckBadEmitProgramScaffoldStageIdText"
        "hostModuleCheckBadEmitProgramScaffoldReadyText"
        "hostModuleCheckBadEmitProgramScaffoldOkText"
        "hostModuleCheckBadEmitProgramScaffoldContractText"
        "hostModuleCheckEmitProgramScaffoldTermSurfaceOk"
        "HostModuleCheckEmitProgramScaffoldTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK EmitGraphScaffold L2 term-surface companion (U1).
      rel = "src/systems/SystemsLean/HostModuleCheckEmitGraphScaffoldTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckEmitGraphScaffoldTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "EmitGraphScaffold-only"
        "ILL-TYPED-TERM"
        "checkEmitGraphScaffoldTermDialect"
        "hostModuleCheckEmitGraphScaffoldTermSurfaceDualOk"
        "hostModuleCheckEmitGraphScaffoldTermSurfaceOk"
        "hostModuleCheckBadEmitGraphScaffoldStageIdText"
        "hostModuleCheckBadEmitGraphScaffoldReadyText"
        "hostModuleCheckBadEmitGraphScaffoldOkText"
        "hostModuleCheckBadEmitGraphScaffoldContractText"
        "hostModuleCheckEmitGraphScaffoldTermSurfaceOk"
        "HostModuleCheckEmitGraphScaffoldTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK EmitComposeScaffold L2 term-surface companion (U1).
      rel = "src/systems/SystemsLean/HostModuleCheckEmitComposeScaffoldTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckEmitComposeScaffoldTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "EmitComposeScaffold-only"
        "ILL-TYPED-TERM"
        "checkEmitComposeScaffoldTermDialect"
        "hostModuleCheckEmitComposeScaffoldTermSurfaceDualOk"
        "hostModuleCheckEmitComposeScaffoldTermSurfaceOk"
        "hostModuleCheckBadEmitComposeScaffoldStageIdText"
        "hostModuleCheckBadEmitComposeScaffoldReadyText"
        "hostModuleCheckBadEmitComposeScaffoldOkText"
        "hostModuleCheckBadEmitComposeScaffoldContractText"
        "hostModuleCheckEmitComposeScaffoldTermSurfaceOk"
        "HostModuleCheckEmitComposeScaffoldTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK EmitErasureScaffold L2 term-surface companion (U1).
      rel = "src/systems/SystemsLean/HostModuleCheckEmitErasureScaffoldTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckEmitErasureScaffoldTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "EmitErasureScaffold-only"
        "ILL-TYPED-TERM"
        "checkEmitErasureScaffoldTermDialect"
        "hostModuleCheckEmitErasureScaffoldTermSurfaceDualOk"
        "hostModuleCheckEmitErasureScaffoldTermSurfaceOk"
        "hostModuleCheckBadEmitErasureScaffoldStageIdText"
        "hostModuleCheckBadEmitErasureScaffoldReadyText"
        "hostModuleCheckBadEmitErasureScaffoldOkText"
        "hostModuleCheckBadEmitErasureScaffoldContractText"
        "hostModuleCheckEmitErasureScaffoldTermSurfaceOk"
        "HostModuleCheckEmitErasureScaffoldTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK EmitExtractScaffold L2 term-surface companion (U1).
      rel = "src/systems/SystemsLean/HostModuleCheckEmitExtractScaffoldTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckEmitExtractScaffoldTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "EmitExtractScaffold-only"
        "ILL-TYPED-TERM"
        "checkEmitExtractScaffoldTermDialect"
        "hostModuleCheckEmitExtractScaffoldTermSurfaceDualOk"
        "hostModuleCheckEmitExtractScaffoldTermSurfaceOk"
        "hostModuleCheckBadEmitExtractScaffoldStageIdText"
        "hostModuleCheckBadEmitExtractScaffoldReadyText"
        "hostModuleCheckBadEmitExtractScaffoldOkText"
        "hostModuleCheckBadEmitExtractScaffoldContractText"
        "hostModuleCheckEmitExtractScaffoldTermSurfaceOk"
        "HostModuleCheckEmitExtractScaffoldTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK EmitBannerScaffold L2 term-surface companion (U1).
      rel = "src/systems/SystemsLean/HostModuleCheckEmitBannerScaffoldTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckEmitBannerScaffoldTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "EmitBannerScaffold-only"
        "ILL-TYPED-TERM"
        "checkEmitBannerScaffoldTermDialect"
        "hostModuleCheckEmitBannerScaffoldTermSurfaceDualOk"
        "hostModuleCheckEmitBannerScaffoldTermSurfaceOk"
        "hostModuleCheckBadEmitBannerScaffoldStageIdText"
        "hostModuleCheckBadEmitBannerScaffoldReadyText"
        "hostModuleCheckBadEmitBannerScaffoldOkText"
        "hostModuleCheckBadEmitBannerScaffoldContractText"
        "hostModuleCheckEmitBannerScaffoldTermSurfaceOk"
        "HostModuleCheckEmitBannerScaffoldTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelSelfApply L2 term-surface companion (U1).
      rel = "src/systems/SystemsLean/HostModuleCheckKernelSelfApplyTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelSelfApplyTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "KernelSelfApply-only"
        "ILL-TYPED-TERM"
        "checkKernelSelfApplyTermDialect"
        "hostModuleCheckKernelSelfApplyTermSurfaceDualOk"
        "hostModuleCheckKernelSelfApplyTermSurfaceOk"
        "hostModuleCheckBadKernelSelfApplyStageIdText"
        "hostModuleCheckBadKernelSelfApplyReadyText"
        "hostModuleCheckBadKernelSelfApplyOkText"
        "hostModuleCheckBadKernelSelfApplyCiteText"
        "hostModuleCheckKernelSelfApplyTermSurfaceOk"
        "HostModuleCheckKernelSelfApplyTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ProductOutKernel L2 term-surface companion (U1).
      rel = "src/systems/SystemsLean/HostModuleCheckProductOutKernelTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckProductOutKernelTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "ProductOutKernel-only"
        "ILL-TYPED-TERM"
        "checkProductOutKernelTermDialect"
        "hostModuleCheckProductOutKernelTermSurfaceDualOk"
        "hostModuleCheckProductOutKernelTermSurfaceOk"
        "hostModuleCheckBadProductOutKernelStageIdText"
        "hostModuleCheckBadProductOutKernelReadyText"
        "hostModuleCheckBadProductOutKernelOkText"
        "hostModuleCheckBadProductOutKernelCiteText"
        "hostModuleCheckProductOutKernelTermSurfaceOk"
        "HostModuleCheckProductOutKernelTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }

    {
      # HOST-MODULE-CHECK CompilePath L2 term-surface companion (S2).
      rel = "src/systems/SystemsLean/HostModuleCheckCompilePathTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCompilePathTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "CompilePath-only"
        "ILL-TYPED-TERM"
        "checkCompilePathTermDialect"
        "hostModuleCheckCompilePathTermSurfaceDualOk"
        "hostModuleCheckCompilePathTermSurfaceOk"
        "hostModuleCheckBadCompilePathStageIdText"
        "hostModuleCheckBadCompilePathHostIdText"
        "hostModuleCheckBadCompilePathCompileReadyText"
        "hostModuleCheckBadCompilePathExtractFsText"
        "hostModuleCheckCompilePathTermSurfaceOk"
        "HostModuleCheckCompilePathTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }

    {
      # HOST-MODULE-CHECK JoinMap L2 term-surface companion (S3).
      rel = "src/systems/SystemsLean/HostModuleCheckJoinMapTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckJoinMapTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "JoinMap-only"
        "ILL-TYPED-TERM"
        "checkJoinMapTermDialect"
        "hostModuleCheckJoinMapTermSurfaceDualOk"
        "hostModuleCheckJoinMapTermSurfaceOk"
        "hostModuleCheckBadJoinMapStageIdText"
        "hostModuleCheckBadJoinMapHostIdText"
        "hostModuleCheckBadJoinMapMapIdText"
        "hostModuleCheckBadJoinMapAlgIdText"
        "hostModuleCheckJoinMapTermSurfaceOk"
        "HostModuleCheckJoinMapTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK SelfHost L2 term-surface companion (S4).
      rel = "src/systems/SystemsLean/HostModuleCheckSelfHostTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckSelfHostTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "SelfHost-only"
        "ILL-TYPED-TERM"
        "checkSelfHostTermDialect"
        "hostModuleCheckSelfHostTermSurfaceDualOk"
        "hostModuleCheckSelfHostTermSurfaceOk"
        "hostModuleCheckBadSelfHostStageIdText"
        "hostModuleCheckBadSelfHostHostIdText"
        "hostModuleCheckBadSelfHostMapIdText"
        "hostModuleCheckBadSelfHostPathText"
        "hostModuleCheckSelfHostTermSurfaceOk"
        "HostModuleCheckSelfHostTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK SurfaceMatrix L2 term-surface companion (S4).
      rel = "src/systems/SystemsLean/HostModuleCheckSurfaceMatrixTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckSurfaceMatrixTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "SurfaceMatrix-only"
        "ILL-TYPED-TERM"
        "checkSurfaceMatrixTermDialect"
        "hostModuleCheckSurfaceMatrixTermSurfaceDualOk"
        "hostModuleCheckSurfaceMatrixTermSurfaceOk"
        "hostModuleCheckBadSurfaceMatrixStageIdText"
        "hostModuleCheckBadSurfaceMatrixHostIdText"
        "hostModuleCheckBadSurfaceMatrixMapIdText"
        "hostModuleCheckBadSurfaceMatrixPathText"
        "hostModuleCheckSurfaceMatrixTermSurfaceOk"
        "HostModuleCheckSurfaceMatrixTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK SpecProof leftover L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckSpecProofTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckSpecProofTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "SpecProof-only"
        "ILL-TYPED-TERM"
        "checkSpecProofTermDialect"
        "hostModuleCheckSpecProofTermSurfaceDualOk"
        "hostModuleCheckSpecProofTermSurfaceOk"
        "specProofReady"
        "HostModuleCheckSpecProofTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK DualResidual leftover L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckDualResidualTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckDualResidualTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "DualResidual-only"
        "ILL-TYPED-TERM"
        "checkDualResidualTermDialect"
        "hostModuleCheckDualResidualTermSurfaceDualOk"
        "hostModuleCheckDualResidualTermSurfaceOk"
        "dualResidualReady"
        "HostModuleCheckDualResidualTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK CompilePathMult L2 term-surface companion (S8).
      rel = "src/systems/SystemsLean/HostModuleCheckCompilePathMultTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCompilePathMultTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "CompilePathMult-only"
        "ILL-TYPED-TERM"
        "checkCompilePathMultTermDialect"
        "hostModuleCheckCompilePathMultTermSurfaceDualOk"
        "hostModuleCheckCompilePathMultTermSurfaceOk"
        "hostModuleCheckCompilePathMultTermSurfaceOk"
        "HostModuleCheckCompilePathMultTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK CompilePathLinear L2 term-surface companion (S8).
      rel = "src/systems/SystemsLean/HostModuleCheckCompilePathLinearTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCompilePathLinearTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "CompilePathLinear-only"
        "ILL-TYPED-TERM"
        "checkCompilePathLinearTermDialect"
        "hostModuleCheckCompilePathLinearTermSurfaceDualOk"
        "hostModuleCheckCompilePathLinearTermSurfaceOk"
        "hostModuleCheckCompilePathLinearTermSurfaceOk"
        "HostModuleCheckCompilePathLinearTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK CompilePathTypes L2 term-surface companion (S8).
      rel = "src/systems/SystemsLean/HostModuleCheckCompilePathTypesTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCompilePathTypesTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "CompilePathTypes-only"
        "ILL-TYPED-TERM"
        "checkCompilePathTypesTermDialect"
        "hostModuleCheckCompilePathTypesTermSurfaceDualOk"
        "hostModuleCheckCompilePathTypesTermSurfaceOk"
        "hostModuleCheckCompilePathTypesTermSurfaceOk"
        "HostModuleCheckCompilePathTypesTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK CompilePathProgram L2 term-surface companion (S8).
      rel = "src/systems/SystemsLean/HostModuleCheckCompilePathProgramTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCompilePathProgramTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "CompilePathProgram-only"
        "ILL-TYPED-TERM"
        "checkCompilePathProgramTermDialect"
        "hostModuleCheckCompilePathProgramTermSurfaceDualOk"
        "hostModuleCheckCompilePathProgramTermSurfaceOk"
        "hostModuleCheckCompilePathProgramTermSurfaceOk"
        "HostModuleCheckCompilePathProgramTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK CompilePathGraph L2 term-surface companion (S8).
      rel = "src/systems/SystemsLean/HostModuleCheckCompilePathGraphTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCompilePathGraphTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "CompilePathGraph-only"
        "ILL-TYPED-TERM"
        "checkCompilePathGraphTermDialect"
        "hostModuleCheckCompilePathGraphTermSurfaceDualOk"
        "hostModuleCheckCompilePathGraphTermSurfaceOk"
        "hostModuleCheckCompilePathGraphTermSurfaceOk"
        "HostModuleCheckCompilePathGraphTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK CompilePathCompose L2 term-surface companion (S8).
      rel = "src/systems/SystemsLean/HostModuleCheckCompilePathComposeTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCompilePathComposeTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "CompilePathCompose-only"
        "ILL-TYPED-TERM"
        "checkCompilePathComposeTermDialect"
        "hostModuleCheckCompilePathComposeTermSurfaceDualOk"
        "hostModuleCheckCompilePathComposeTermSurfaceOk"
        "hostModuleCheckCompilePathComposeTermSurfaceOk"
        "HostModuleCheckCompilePathComposeTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK CompilePathErasure L2 term-surface companion (S8).
      rel = "src/systems/SystemsLean/HostModuleCheckCompilePathErasureTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCompilePathErasureTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "CompilePathErasure-only"
        "ILL-TYPED-TERM"
        "checkCompilePathErasureTermDialect"
        "hostModuleCheckCompilePathErasureTermSurfaceDualOk"
        "hostModuleCheckCompilePathErasureTermSurfaceOk"
        "hostModuleCheckCompilePathErasureTermSurfaceOk"
        "HostModuleCheckCompilePathErasureTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK CompilePathExtract L2 term-surface companion (S8).
      rel = "src/systems/SystemsLean/HostModuleCheckCompilePathExtractTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCompilePathExtractTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "CompilePathExtract-only"
        "ILL-TYPED-TERM"
        "checkCompilePathExtractTermDialect"
        "hostModuleCheckCompilePathExtractTermSurfaceDualOk"
        "hostModuleCheckCompilePathExtractTermSurfaceOk"
        "hostModuleCheckCompilePathExtractTermSurfaceOk"
        "HostModuleCheckCompilePathExtractTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK CompilePathPlan L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckCompilePathPlanTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCompilePathPlanTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "CompilePathPlan-only"
        "ILL-TYPED-TERM"
        "checkCompilePathPlanTermDialect"
        "hostModuleCheckCompilePathPlanTermSurfaceDualOk"
        "hostModuleCheckCompilePathPlanTermSurfaceOk"
        "hostModuleCheckCompilePathPlanTermSurfaceOk"
        "HostModuleCheckCompilePathPlanTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK CompilePathApply L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckCompilePathApplyTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCompilePathApplyTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "CompilePathApply-only"
        "ILL-TYPED-TERM"
        "checkCompilePathApplyTermDialect"
        "hostModuleCheckCompilePathApplyTermSurfaceDualOk"
        "hostModuleCheckCompilePathApplyTermSurfaceOk"
        "hostModuleCheckCompilePathApplyTermSurfaceOk"
        "HostModuleCheckCompilePathApplyTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK CompilePathBody L2 term-surface companion.
      rel = "src/systems/SystemsLean/HostModuleCheckCompilePathBodyTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCompilePathBodyTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "TERM-SURFACE"
        "CompilePathBody-only"
        "ILL-TYPED-TERM"
        "checkCompilePathBodyTermDialect"
        "hostModuleCheckCompilePathBodyTermSurfaceDualOk"
        "hostModuleCheckCompilePathBodyTermSurfaceOk"
        "hostModuleCheckCompilePathBodyTermSurfaceOk"
        "HostModuleCheckCompilePathBodyTerm"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK LoadOk S8 CompilePath unit TERM aggregate fold.
      rel = "src/systems/SystemsLean/HostModuleCheckLoadOkCompilePathUnits.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckLoadOkCompilePathUnits"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "hostModuleCheckCompilePathUnitsTermSurfaceOk"
        "HostModuleCheckLoadOkCompilePathUnits"
        "TERM-SURFACE"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK LoadOk later TERM SurfaceOk aggregate fold.
      rel = "src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckLoadOkLaterTerm"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "hostModuleCheckLaterTermSurfaceOk"
        "HostModuleCheckLoadOkLaterTerm"
        "TERM-SURFACE"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK RealModule checkRealModule dispatcher (peel from CheckersLater).
      rel = "src/systems/SystemsLean/HostModuleCheckRealModule.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckRealModule"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "checkRealModule"
        "surfaceFromContent"
        "refineEmitBodyWithTermSurface"
        "refineKernelMultWithTermSurface"
        "refineKernelLinearWithTermSurface"
        "refineKernelTypesWithTermSurface"
        "refineKernelProgramWithTermSurface"
        "refineCompilePathMultWithTermSurface"
        "refineCompilePathExtractWithTermSurface"
        "refineKernelEmitWithTermSurface"
        "refineEmitMultScaffoldWithTermSurface"
        "refineKernelSelfApplyWithTermSurface"
        "refineProductOutKernelWithTermSurface"
        "refineSelfHostWithTermSurface"
        "refineSurfaceMatrixWithTermSurface"
        "refineSpecProofWithTermSurface"
        "refineDualResidualWithTermSurface"
        "refineParityMultWithTermSurface"
        "refineParityLinearWithTermSurface"
        "refineParityTypesWithTermSurface"
        "refineParityProgramWithTermSurface"
        "refineKernelMultTheoremsWithProofSurface"
        "HostModuleCheckRealModule"
        "import SystemsLean.HostModuleCheckCheckersLater"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK MultTheorems L3 proof-surface companion (J7 pilot).
      rel = "src/systems/SystemsLean/HostModuleCheckMultProof.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckMultProof"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PROOF-SURFACE"
        "MultTheorems-only"
        "ILL-TYPED-PROOF"
        "checkMultTheoremsProofDialect"
        "hostModuleCheckProofSurfaceDualOk"
        "hostModuleCheckMultProofSurfaceOk"
        "hostModuleCheckBadMultThmWrongStmtText"
        "hostModuleCheckBadMultThmSorryText"
        "HostModuleCheckMultProof"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK LinearTheorems L3 proof-surface companion pilot.
      rel = "src/systems/SystemsLean/HostModuleCheckLinearProof.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckLinearProof"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PROOF-SURFACE"
        "LinearTheorems-only"
        "ILL-TYPED-PROOF"
        "checkLinearTheoremsProofDialect"
        "hostModuleCheckLinearProofSurfaceDualOk"
        "hostModuleCheckLinearProofSurfaceOk"
        "hostModuleCheckBadLinearThmWrongStmtText"
        "hostModuleCheckBadLinearThmSorryText"
        "HostModuleCheckLinearProof"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK TypesTheorems L3 proof-surface companion pilot.
      rel = "src/systems/SystemsLean/HostModuleCheckTypesProof.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckTypesProof"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PROOF-SURFACE"
        "TypesTheorems-only"
        "ILL-TYPED-PROOF"
        "checkTypesTheoremsProofDialect"
        "hostModuleCheckTypesProofSurfaceDualOk"
        "hostModuleCheckTypesProofSurfaceOk"
        "hostModuleCheckBadTypesThmWrongStmtText"
        "hostModuleCheckBadTypesThmSorryText"
        "HostModuleCheckTypesProof"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelMultTheorems L3 proof-surface companion pilot.
      rel = "src/systems/SystemsLean/HostModuleCheckKernelMultProof.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelMultProof"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PROOF-SURFACE"
        "KernelMultTheorems-only"
        "ILL-TYPED-PROOF"
        "checkKernelMultTheoremsProofDialect"
        "hostModuleCheckKernelMultProofSurfaceDualOk"
        "hostModuleCheckKernelMultProofSurfaceOk"
        "hostModuleCheckBadKernelMultThmWrongStmtText"
        "hostModuleCheckBadKernelMultThmSorryText"
        "HostModuleCheckKernelMultProof"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelLinearTheorems L3 proof-surface companion pilot.
      rel = "src/systems/SystemsLean/HostModuleCheckKernelLinearProof.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelLinearProof"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PROOF-SURFACE"
        "KernelLinearTheorems-only"
        "ILL-TYPED-PROOF"
        "checkKernelLinearTheoremsProofDialect"
        "hostModuleCheckKernelLinearProofSurfaceDualOk"
        "hostModuleCheckKernelLinearProofSurfaceOk"
        "hostModuleCheckBadKernelLinearThmWrongStmtText"
        "hostModuleCheckBadKernelLinearThmSorryText"
        "HostModuleCheckKernelLinearProof"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelTypesTheorems L3 proof-surface companion pilot.
      rel = "src/systems/SystemsLean/HostModuleCheckKernelTypesProof.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelTypesProof"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PROOF-SURFACE"
        "KernelTypesTheorems-only"
        "ILL-TYPED-PROOF"
        "checkKernelTypesTheoremsProofDialect"
        "hostModuleCheckKernelTypesProofSurfaceDualOk"
        "hostModuleCheckKernelTypesProofSurfaceOk"
        "hostModuleCheckBadKernelTypesThmWrongStmtText"
        "hostModuleCheckBadKernelTypesThmSorryText"
        "HostModuleCheckKernelTypesProof"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelProgramTheorems L3 proof-surface companion pilot.
      rel = "src/systems/SystemsLean/HostModuleCheckKernelProgramProof.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelProgramProof"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PROOF-SURFACE"
        "KernelProgramTheorems-only"
        "ILL-TYPED-PROOF"
        "checkKernelProgramTheoremsProofDialect"
        "hostModuleCheckKernelProgramProofSurfaceDualOk"
        "hostModuleCheckKernelProgramProofSurfaceOk"
        "hostModuleCheckBadKernelProgramThmWrongStmtText"
        "hostModuleCheckBadKernelProgramThmSorryText"
        "HostModuleCheckKernelProgramProof"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelEmitTheorems L3 proof-surface companion pilot.
      rel = "src/systems/SystemsLean/HostModuleCheckKernelEmitProof.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelEmitProof"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PROOF-SURFACE"
        "KernelEmitTheorems-only"
        "ILL-TYPED-PROOF"
        "checkKernelEmitTheoremsProofDialect"
        "hostModuleCheckKernelEmitProofSurfaceDualOk"
        "hostModuleCheckKernelEmitProofSurfaceOk"
        "hostModuleCheckBadKernelEmitThmWrongStmtText"
        "hostModuleCheckBadKernelEmitThmSorryText"
        "HostModuleCheckKernelEmitProof"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Package elaborate L4 inventory + MultLinear env companion.
      rel = "src/systems/SystemsLean/HostModuleCheckPackageElab.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageElab"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PACKAGE-ELABORATE"
        "MultExtractFoundation-only"
        "MultLinearTypesProof-only"
        "KernelEmitParity-only"
        "PACKAGE-BAND-INCOMPLETE"
        "checkPackageFoundationDialect"
        "checkPackageProofDialect"
        "checkPackageKernelDialect"
        "hostModuleCheckPackageElaborateFirstBandDualOk"
        "hostModuleCheckPackageElaborateFirstBandOk"
        "hostModuleCheckPackageElaborateProofBandDualOk"
        "hostModuleCheckPackageElaborateProofBandOk"
        "hostModuleCheckPackageElaborateKernelBandDualOk"
        "hostModuleCheckPackageElaborateKernelBandOk"
        "hostModuleCheckGoodPackageFoundationText"
        "hostModuleCheckBadPackageMissingExtractText"
        "hostModuleCheckBadPackageNotReadyText"
        "hostModuleCheckGoodPackageProofText"
        "hostModuleCheckBadPackageMissingTypesProofText"
        "hostModuleCheckBadPackageProofNotReadyText"
        "hostModuleCheckGoodPackageKernelText"
        "hostModuleCheckBadPackageMissingParityEmitText"
        "hostModuleCheckBadPackageKernelNotReadyText"
        "packageInventoryHas"
        "HostModuleCheckPackageElab"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }

    {
      # HOST-MODULE-CHECK Package elaborate L4 multi-module env fixtures (H2 ParityTypes seed).
      rel = "src/systems/SystemsLean/HostModuleCheckPackageEnvFixtures.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageEnvFixtures"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PACKAGE-ELABORATE"
        "MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only"
        "hostModuleCheckGoodPackageEnvText"
        "hostModuleCheckBadPackageEnvIllTypedKernelMultText"
        "hostModuleCheckBadPackageEnvIllTypedKernelLinearText"
        "hostModuleCheckBadPackageEnvIllTypedKernelTypesText"
        "hostModuleCheckBadPackageEnvIllTypedKernelProgramText"
        "hostModuleCheckBadPackageEnvIllTypedKernelEmitText"
        "hostModuleCheckBadPackageEnvIllTypedParityMultText"
        "hostModuleCheckBadPackageEnvIllTypedParityMultReadyText"
        "hostModuleCheckBadPackageEnvIllTypedParityLinearText"
        "hostModuleCheckBadPackageEnvIllTypedParityLinearReadyText"
        "hostModuleCheckBadPackageEnvIllTypedParityTypesText"
        "hostModuleCheckBadPackageEnvIllTypedParityTypesReadyText"
        "hostModuleCheckBadPackageEnvIllTypedParityProgramText"
        "hostModuleCheckBadPackageEnvIllTypedParityProgramReadyText"
        "hostModuleCheckBadPackageEnvIllTypedParityEmitText"
        "hostModuleCheckBadPackageEnvIllTypedParityEmitReadyText"
        "HostModuleCheckPackageEnvFixtures"
        "import SystemsLean.HostModuleCheckPackageElab"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }

    {
      # HOST-MODULE-CHECK Package elaborate L4 multi-module env dialect (H2 U2).
      rel = "src/systems/SystemsLean/HostModuleCheckPackageEnv.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageEnv"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PACKAGE-ELABORATE"
        "MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only"
        "PACKAGE-ENV-INCOMPLETE"
        "checkPackageEnvDialect"
        "checkPackageEnvDialectU2"
        "checkPackageEnvDialectS5"
        "hostModuleCheckPackageElaborateEnvDualOk"
        "hostModuleCheckPackageEnvDialectOk"
        "hostModuleCheckGoodPackageEnvS5Text"
        "packageEnvTermSurfaceOk"
        "HostModuleCheckPackageEnv"
        "import SystemsLean.HostModuleCheckPackageEnvImports"
        "import SystemsLean.HostModuleCheckPackageEnvDialectTail"
        "import SystemsLean.HostModuleCheckPackageEnvFixtures"
        "import SystemsLean.HostModuleCheckPackageEnvFixturesU2"
        "import SystemsLean.HostModuleCheckPackageEnvFixturesS5"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }

    {
      # HOST-MODULE-CHECK Package elaborate L4 U2 fixtures (Emit*Scaffold + kernels).
      rel = "src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesU2.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageEnvFixturesU2"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PACKAGE-ELABORATE"
        "packageEnvU2ModulesGood"
        "hostModuleCheckGoodPackageEnvU2Text"
        "hostModuleCheckBadPackageEnvIllTypedEmitMultScaffoldText"
        "hostModuleCheckBadPackageEnvIllTypedEmitLinearScaffoldText"
        "hostModuleCheckBadPackageEnvIllTypedEmitTypesScaffoldText"
        "hostModuleCheckBadPackageEnvIllTypedEmitProgramScaffoldText"
        "hostModuleCheckBadPackageEnvIllTypedEmitGraphScaffoldText"
        "hostModuleCheckBadPackageEnvIllTypedEmitComposeScaffoldText"
        "hostModuleCheckBadPackageEnvIllTypedEmitErasureScaffoldText"
        "hostModuleCheckBadPackageEnvIllTypedEmitExtractScaffoldText"
        "hostModuleCheckBadPackageEnvIllTypedEmitBannerScaffoldText"
        "hostModuleCheckBadPackageEnvIllTypedKernelSelfApplyText"
        "hostModuleCheckBadPackageEnvIllTypedProductOutKernelText"
        "HostModuleCheckPackageEnvFixturesU2"
        "import SystemsLean.HostModuleCheckPackageEnvFixtures"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }

    {
      # HOST-MODULE-CHECK Package elaborate L4 S5 fixtures (CompilePath+maps).
      rel = "src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesS5.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageEnvFixturesS5"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PACKAGE-ELABORATE"
        "packageEnvS5MapsModulesGood"
        "hostModuleCheckGoodPackageEnvS5Text"
        "hostModuleCheckBadPackageEnvIllTypedCompilePathText"
        "hostModuleCheckBadPackageEnvIllTypedJoinMapText"
        "hostModuleCheckBadPackageEnvIllTypedSelfHostText"
        "hostModuleCheckBadPackageEnvIllTypedSurfaceMatrixText"
        "HostModuleCheckPackageEnvFixturesS5"
        "import SystemsLean.HostModuleCheckPackageEnvFixturesU2"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }

    {
      # HOST-MODULE-CHECK Package elaborate L4 env evidence folds (PE1..PE42 Ok).
      rel = "src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageEnvEvidence"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "PACKAGE-ELABORATE"
        "MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only"
        "hostModuleCheckPackageElaborateEnvOk"
        "packageEnvDialectRejectsOk"
        "packageEnvL0AcceptsOk"
        "hostModuleCheckBadPackageEnvIllTypedEmitMultScaffoldDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedProductOutKernelDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedCompilePathDialectReject"
        "hostModuleCheckBadPackageEnvIllTypedSurfaceMatrixDialectReject"
        "HostModuleCheckPackageEnvEvidence"
        "import SystemsLean.HostModuleCheckPackageEnv"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }

    {
      # HOST-MODULE-CHECK dual-pinned accept results long-file split companion.
      rel = "src/systems/SystemsLean/HostModuleCheckAccepts.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckAccepts"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "hostModuleCheckGoodOfficialRetire"
        "hostModuleCheckGoodHostCheck"
        "HostModuleCheckAccepts"
        "HostModuleCheckAcceptsLater"
        "import SystemsLean.HostModuleCheckFixtures"
        "import SystemsLean.HostModuleCheckSurface"
        "import SystemsLean.HostModuleCheckAcceptsGoods"
        "import SystemsLean.HostModuleCheckAcceptsLater"
        "PARTIAL-STRUCTURAL"
        "FOUNDATION-KIND-SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK fail-closed bads + Mult..Extract twins (long-file split).
      rel = "src/systems/SystemsLean/HostModuleCheckAcceptsLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckAcceptsLater"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "hostModuleCheckBadMissingInductive"
        "hostModuleCheckBadMissingAxiom"
        "hostModuleCheckBadMissingStructure"
        "hostModuleCheckBadMissingProgramStructure"
        "hostModuleCheckBadMissingErasedStructure"
        "HostModuleCheckAcceptsLater"
        "TERM-SURFACE"
        "ILL-TYPED-TERM"
        "PROOF-SURFACE"
        "import SystemsLean.HostModuleCheckRealModule"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }

    {
      # HOST-MODULE-CHECK per-seed surface checkers companion.
      rel = "src/systems/SystemsLean/HostModuleCheckCheckers.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCheckers"
        "namespace SystemsLean.HostModuleCheck"
        "checkMultSurface"
        "checkHostPackageRootsSurface"
        "HostModuleCheckCheckers"
        "import SystemsLean.HostModuleCheckSurface"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK later checkers surface companion (dispatcher peeled).
      rel = "src/systems/SystemsLean/HostModuleCheckCheckersLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCheckersLater"
        "namespace SystemsLean.HostModuleCheck"
        "checkFreestandingEmitSurface"
        "checkEmitBodySurface"
        "HostModuleCheckCheckersLater"
        "import SystemsLean.HostModuleCheckCheckers"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK early good accepts companion.
      rel = "src/systems/SystemsLean/HostModuleCheckAcceptsGoods.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckAcceptsGoods"
        "namespace SystemsLean.HostModuleCheck"
        "hostModuleCheckGoodMult"
        "hostModuleCheckGoodHostCompose"
        "hostModuleCheckGoodDualEqWriteParityTheorems"
        "HostModuleCheckAcceptsGoods"
        "HostModuleCheckAcceptsGoodsTerm"
        "import SystemsLean.HostModuleCheckRealModule"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Emit/Kernel/Parity L2 term smoke accepts (S1 peel).
      rel = "src/systems/SystemsLean/HostModuleCheckAcceptsGoodsTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckAcceptsGoodsTerm"
        "namespace SystemsLean.HostModuleCheck"
        "hostModuleCheckGoodEmitPlanTerm"
        "hostModuleCheckEmitBodyTermSmokeOk"
        "hostModuleCheckKernelMultTermSmokeOk"
        "hostModuleCheckParityEmitTermSmokeOk"
        "HostModuleCheckAcceptsGoodsTerm"
        "TERM-SURFACE"
        "import SystemsLean.HostModuleCheckRealModule"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Kernel Mult..Emit L3 proof accepts companion.
      rel = "src/systems/SystemsLean/HostModuleCheckAcceptsProof.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckAcceptsProof"
        "namespace SystemsLean.HostModuleCheck"
        "hostModuleCheckKernelMultProofSmokeOk"
        "hostModuleCheckKernelEmitProofSmokeOk"
        "HostModuleCheckAcceptsProof"
        "PROOF-SURFACE"
        "import SystemsLean.HostModuleCheckKernelEmitProof"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK seed lists + honesty pins companion.
      rel = "src/systems/SystemsLean/HostModuleCheckSeeds.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckSeeds"
        "namespace SystemsLean.HostModuleCheck"
        "SLAKE_HOST_MODULE_CHECK_V0"
        "HOST-MODULE-CHECK"
        "def stageId"
        "hostModuleCheckSeedModules"
        "hostModuleCheckSeedRelPaths"
        "hostModuleCheckFinishedClaimed"
        "hostModuleCheckWithoutLakeFinished"
        "hostModuleCheckHostElaboratorResidualRemains"
        "prebuiltHostModuleCheckRel"
        "justRecipeWithoutLake"
        "HostModuleCheckSeeds"
        "Host library seed expand continue"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK LoadOk dual-pin fold companion.
      rel = "src/systems/SystemsLean/HostModuleCheckLoadOk.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckLoadOk"
        "namespace SystemsLean.HostModuleCheck"
        "hostModuleCheckLoadOk"
        "hostModuleCheckReady"
        "hostModuleCheckWithoutLakeReady"
        "hostModuleCheckWithoutLakeKeepsHostLake"
        "set_option maxRecDepth 16384"
        "HostModuleCheckLoadOk"
        "import SystemsLean.HostModuleCheckAccepts"
        "import SystemsLean.HostModuleCheckSeeds"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK driver IO helpers long-file companion.
      rel = "src/systems/SystemsLean/HostModuleCheckDriverIO.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckDriverIO"
        "namespace SystemsLean.HostModuleCheck"
        "loadAndCheckRealModule"
        "loadMultModuleCheck"
        "filterArgs"
        "HostModuleCheckDriverIO"
        "import SystemsLean.HostModuleCheckSeeds"
        "import SystemsLean.HostModuleCheckRealModule"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK driver runModuleCheck / main companion.
      rel = "src/systems/SystemsLean/HostModuleCheckDriver.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckDriver"
        "namespace SystemsLean.HostModuleCheck"
        "runModuleCheck"
        "HostModuleCheckDriver"
        "import SystemsLean.HostModuleCheckSeeds"
        "import SystemsLean.HostModuleCheckDriverIO"
        "import SystemsLean.HostModuleCheckAcceptsProof"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK-THEOREM long-file tip (smoke peeled to HostModuleCheckSmoke).
      rel = "src/systems/SystemsLean/HostModuleCheckTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckTheorems"
        "HOST-MODULE-CHECK-THEOREM"
        "HostModuleCheckSmoke"
        "hostModuleCheckReady_true"
        "hostModuleCheckLoadOk_true"
        "hostModuleCheckGoodLinear_accept"
        "hostModuleCheckGoodTypes_accept"
        "hostModuleCheckGoodIrProgram_accept"
        "hostModuleCheckGoodIrGraph_accept"
        "hostModuleCheckGoodHostCompose_accept"
        "Check depth deepen continue"
        "FOUNDATION-KIND-SURFACE"
        "Host library seed expand continue"
        "Host compose module expand"
        "Host program module expand"
        "Host module set expand"
        "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText+SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars+InventoryCloseTheorems+ProductPath+ProductPathTheorems+DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems"
        "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems"
        "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems"
        "import SystemsLean.HostModuleCheck"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK-SMOKE long-file companion peeled from Theorems.
      rel = "src/systems/SystemsLean/HostModuleCheckSmoke.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckSmoke"
        "HOST-MODULE-CHECK-SMOKE"
        "HostModuleCheckSmoke"
        "hostModuleCheckLoadOk"
        "hostModuleCheckReady"
        "TERM-SURFACE"
        "PROOF-SURFACE"
        "import SystemsLean.HostModuleCheck"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Thin Lake main for slake-host-module-check (SKELETON).
      rel = "src/systems/SystemsLean/HostModuleCheckMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckMain"
        "slake-host-module-check"
        "HostModuleCheckMain"
        "SKELETON"
        "import SystemsLean.HostModuleCheck"
      ];
    }
    {
      # HOST-RESIDUAL-SHRINK: peer elaborator step 10 partial host residual inventory.
      rel = "src/systems/SystemsLean/HostResidualShrink.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostResidualShrink"
        "HOST-RESIDUAL-SHRINK"
        "SLAKE_HOST_RESIDUAL_SHRINK"
        "SLAKE_HOST_RESIDUAL_SHRINK_V0"
        "HOST-HOST-RESIDUAL-SHRINK"
        "hostResidualShrinkReady"
        "hostResidualShrinkFinishedClaimed"
        "hostResidualPartialShrinkClaimed"
        "hostDevelopMeasuredPathsLakeFreeEvidence"
        "hostResidualShrinkHostElaborateRemains"
        "hostResidualShrinkHostFreeClaimed"
        "hostResidualShrinkKeepsHostResidual"
        "hostResidualShrinkDoesNotMeanHostFree"
        "hostResidualShrinkFreeIsNotLakeGone"
        "justRecipeHostResidualShrink"
        "host-residual-shrink"
        "hostResidualShrinkBootstrapPrebuildRemains"
        "hostResidualShrinkFullHostElaborateRemains"
        "hostResidualShrinkDiagnosticLakeRecipesRemain"
        "measuredHostFoundationToolsCleanBootstrap"
        "host-foundation-tools-clean-bootstrap"
        "measuredHostFoundationToolsInventory"
        "fragment-check+graph+package-write+package-roots+import-graph+module-check"
        "hostFoundationToolsBinLinkWithoutLakeDualOk"
        "justRecipeHostFoundationToolsCleanBootstrap"
        "Foundation tools without Lake bootstrap"
        "Host tool build expand"
        "measuredHostToolBuildExpand"
        "measuredHostDevelopToolsCleanBootstrap"
        "host-develop-tools-clean-bootstrap"
        "measuredHostDevelopToolsInventory"
        "host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface"
        "hostDevelopToolsBinLinkWithoutLakeDualOk"
        "measuredHostLakeFreeHostFront"
        "host-front-without-lake"
        "hostFrontWithoutLakeDualOk"
        "measuredHostLakeFreeSubsetFront"
        "subset-front-without-lake"
        "subsetFrontWithoutLakeDualOk"
        "measuredHostLakeFreeFrontMultPackage"
        "front-mult-package-without-lake"
        "frontMultPackageWithoutLakeDualOk"
        "measuredHostLakeFreeMultSubsetRebuild"
        "mult-subset-rebuild-without-lake"
        "multSubsetRebuildWithoutLakeDualOk"
        "measuredHostLakeFreeFirstSurface"
        "first-surface-without-lake"
        "firstSurfaceWithoutLakeDualOk"
        "measuredHostToolInventoryCleanBootstrapOwned"
        "fragment-check+graph+package-write+package-roots+import-graph+module-check+host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface"
        "measuredHostToolInventoryDayToDayCandidatesRemain"
        "empty"
        "measuredHostToolInventoryClaimDiagnosticLakeOnly"
        "claim-capable-perform-self-host+llvm-text-writers"
        "measuredHostLakeFreeFragmentCheck"
        "measuredHostLakeFreeGraph"
        "measuredHostLakeFreePackageWrite"
        "measuredHostLakeFreePackageRoots"
        "hostPackageRootsLoadDualOk"
        "measuredHostLakeFreeImportGraph"
        "hostImportGraphMultSeedDualOk"
        "measuredHostLakeFreeModuleCheck"
        "hostModuleCheckMultSeedDualOk"
        "measuredHostRealModuleSeedUnits"
        "hostImportGraphExpandSeedDualOk"
        "hostModuleCheckExpandSeedDualOk"
        "measuredHostTheoremCorpusExpand"
        "hostModuleCheckTheoremCorpusExpandDualOk"
        "measuredHostTheoremCorpusRequiredCounts"
        "measuredHostLibraryBandComplete"
        "Host library band complete"
        "hostLibraryBandCompleteDualOk"
        "measuredHostLibraryProductSeedCount"
        "measuredHostLibraryLeftoverProductModules"
        "measuredHostLibraryOutOfScopeMains"
        "measuredHostLibraryOutOfScopeHarness"
        "measuredHostLibraryDiskPartition"
        "seed=206+Main=59+harness=141"
        "*Main lake exe entrypoints"
        "HostImportGraph+HostImportGraphSeeds+HostImportGraphModel+HostImportGraphMods+HostImportGraphModsLater+HostImportGraphLoadOk+HostImportGraphLoadOkLater+HostImportGraphTheorems+HostImportGraphWalk+HostImportGraphWalkLater+HostImportGraphDriver+HostModuleCheck+HostModuleCheckFixtures+HostModuleCheckRequiredDecls+HostModuleCheckRequiredDeclsProduct+HostModuleCheckRequiredDeclsLater+HostModuleCheckFixtureTexts+HostModuleCheckFixtureTextsProduct+HostModuleCheckFixtureTextsLater+HostModuleCheckFixtureTextsSelfHost+HostModuleCheckFixtureTextsEmit+HostModuleCheckSurface+HostModuleCheckMultTerm+HostModuleCheckLinearTerm+HostModuleCheckTypesTerm+HostModuleCheckIrProgramTerm+HostModuleCheckIrGraphTerm+HostModuleCheckHostComposeTerm+HostModuleCheckErasureTerm+HostModuleCheckExtractTerm+HostModuleCheckEmitPlanTerm+HostModuleCheckEmitApplyTerm+HostModuleCheckEmitBodyTerm+HostModuleCheckKernelMultTerm+HostModuleCheckKernelLinearTerm+HostModuleCheckKernelTypesTerm+HostModuleCheckKernelProgramTerm+HostModuleCheckKernelEmitTerm+HostModuleCheckParityMultTerm+HostModuleCheckParityLinearTerm+HostModuleCheckParityTypesTerm+HostModuleCheckParityProgramTerm+HostModuleCheckParityEmitTerm+HostModuleCheckEmitMultScaffoldTerm+HostModuleCheckEmitLinearScaffoldTerm+HostModuleCheckEmitTypesScaffoldTerm+HostModuleCheckEmitProgramScaffoldTerm+HostModuleCheckEmitGraphScaffoldTerm+HostModuleCheckEmitComposeScaffoldTerm+HostModuleCheckEmitErasureScaffoldTerm+HostModuleCheckEmitExtractScaffoldTerm+HostModuleCheckEmitBannerScaffoldTerm+HostModuleCheckKernelSelfApplyTerm+HostModuleCheckProductOutKernelTerm+HostModuleCheckCompilePathTerm+HostModuleCheckJoinMapTerm+HostModuleCheckSelfHostTerm+HostModuleCheckSurfaceMatrixTerm+HostModuleCheckSpecProofTerm+HostModuleCheckDualResidualTerm+HostModuleCheckCompilePathMultTerm+HostModuleCheckCompilePathLinearTerm+HostModuleCheckCompilePathTypesTerm+HostModuleCheckCompilePathProgramTerm+HostModuleCheckCompilePathGraphTerm+HostModuleCheckCompilePathComposeTerm+HostModuleCheckCompilePathErasureTerm+HostModuleCheckCompilePathExtractTerm+HostModuleCheckCompilePathPlanTerm+HostModuleCheckCompilePathApplyTerm+HostModuleCheckCompilePathBodyTerm+HostModuleCheckFirstSurfaceTerm+HostModuleCheckLinearSubsetEmitTerm+HostModuleCheckTypesSubsetEmitTerm+HostModuleCheckProgramSubsetEmitTerm+HostModuleCheckGraphSubsetEmitTerm+HostModuleCheckComposeSubsetEmitTerm+HostModuleCheckErasureSubsetEmitTerm+HostModuleCheckExtractSubsetEmitTerm+HostModuleCheckMultSubsetEmitTerm+HostModuleCheckMultSubsetRebuildTerm+HostModuleCheckLinearSubsetRebuildTerm+HostModuleCheckTypesSubsetRebuildTerm+HostModuleCheckProgramSubsetRebuildTerm+HostModuleCheckGraphSubsetRebuildTerm+HostModuleCheckComposeSubsetRebuildTerm+HostModuleCheckErasureSubsetRebuildTerm+HostModuleCheckExtractSubsetRebuildTerm+HostModuleCheckHostFrontTerm+HostModuleCheckLlvmMultTextTerm+HostModuleCheckHostCheckTerm+HostModuleCheckHostGraphTerm+HostModuleCheckLlvmLinearTextTerm+HostModuleCheckMultFsWriteToolTerm+HostModuleCheckFrontMultPackageTerm+HostModuleCheckSubsetPackageJoinTerm+HostModuleCheckLlvmTypesTextTerm+HostModuleCheckMultFsDeepenTerm+HostModuleCheckHostPackageWriteTerm+HostModuleCheckLlvmProgramTextTerm+HostModuleCheckLlvmGraphTextTerm+HostModuleCheckLlvmComposeTextTerm+HostModuleCheckSelfApplyFsTerm+HostModuleCheckInventoryCloseTerm+HostModuleCheckProductPathBarsTerm+HostModuleCheckProductPathTerm+HostModuleCheckProbeWireTerm+HostModuleCheckSelfHostBodyTerm+HostModuleCheckLoadOkCompilePathUnits+HostModuleCheckLoadOkLaterTerm+HostModuleCheckRealModule+HostModuleCheckMultProof+HostModuleCheckLinearProof+HostModuleCheckTypesProof+HostModuleCheckKernelMultProof+HostModuleCheckKernelLinearProof+HostModuleCheckKernelTypesProof+HostModuleCheckKernelProgramProof+HostModuleCheckKernelEmitProof+HostModuleCheckPackageElab+HostModuleCheckPackageEnv+HostModuleCheckPackageEnvFixtures+HostModuleCheckPackageEnvFixturesU2+HostModuleCheckPackageEnvFixturesS5+HostModuleCheckPackageEnvEvidence+HostModuleCheckCheckers+HostModuleCheckCheckersLater+HostModuleCheckAcceptsGoods+HostModuleCheckAcceptsGoodsTerm+HostModuleCheckAcceptsProof+HostModuleCheckAcceptsLater+HostModuleCheckAccepts+HostModuleCheckSeeds+HostModuleCheckLoadOk+HostModuleCheckDriverIO+HostModuleCheckDriver+HostModuleCheckTheorems+HostModuleCheckSmoke+HostResidualShrink+HostResidualShrinkTermOk+HostResidualShrinkTheorems"
        "HostResidualShrinkTermOk"
        "measuredHostDevelopToolInventoryClosed"
        "Develop tool inventory closed"
        "hostDevelopToolInventoryClosedDualOk"
        "measuredHostToolInventoryClaimDiagnosticHonesty"
        "claim-exes+llvm-text-writers+product-wire-Lake-mains"
        "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText+SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars+InventoryCloseTheorems+ProductPath+ProductPathTheorems+DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems"
        "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems"
        "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems"
        "Host library seed expand continue"
        "Host compose module expand"
        "Host program module expand"
        "Host module set expand"
        "host-fragment-check-without-lake"
        "host-graph-without-lake"
        "host-package-write-without-lake"
        "host-package-roots-without-lake"
        "host-import-graph-without-lake"
        "host-module-check-without-lake"
        "host-foundation-tools-clean-bootstrap"
        "host-develop-tools-clean-bootstrap"
        "host-front-without-lake"
        "subset-front-without-lake"
        "front-mult-package-without-lake"
        "mult-subset-rebuild-without-lake"
        "first-surface-without-lake"
        "HOST-PACKAGE-ROOTS"
        "HOST-IMPORT-GRAPH"
        "HOST-MODULE-CHECK"
        # Theorems/smoke live in HostResidualShrinkTheorems (same namespace;
        # greppable cites stay on tip for dual-ok honesty, like HostGraph).
        "HOST-RESIDUAL-SHRINK-SMOKE"
        "HOST-RESIDUAL-SHRINK-THEOREM"
        "HostResidualShrinkTheorems"
        "hostResidualShrinkReady_true"
        "def hostResidualShrinkFinishedClaimed : Bool := true"
        "def hostResidualPartialShrinkClaimed : Bool := true"
        "def hostResidualShrinkHostElaborateRemains : Bool := false"
        "def hostResidualShrinkHostFreeClaimed : Bool := true"
        "def hostResidualShrinkBootstrapPrebuildRemains : Bool := false"
        "def hostFoundationToolsBinLinkWithoutLakeDualOk : Bool := true"
        "def hostDevelopToolsBinLinkWithoutLakeDualOk : Bool := true"
        "def hostFrontWithoutLakeDualOk : Bool := true"
        "def subsetFrontWithoutLakeDualOk : Bool := true"
        "def frontMultPackageWithoutLakeDualOk : Bool := true"
        "def multSubsetRebuildWithoutLakeDualOk : Bool := true"
        "def hostPackageRootsLoadDualOk : Bool := true"
        "def hostImportGraphMultSeedDualOk : Bool := true"
        "def hostModuleCheckMultSeedDualOk : Bool := true"
        "def hostImportGraphExpandSeedDualOk : Bool := true"
        "def hostModuleCheckExpandSeedDualOk : Bool := true"
        "doc/dev/research/host-residual-shrink-2026-08-02.md"
        "DualResidual"
        "LakeRetireInventory"
        "free true != Lake gone"
        "UNIT_SURFACE"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "Not freestanding residual free re-open"
        "Not freestanding emit"
        "Not PROVABLY re-open"
        "Not llvm unlock rebrand"
        "Host elaborator residual free claimed"
        "Partial shrink only"
      ];
    }
    {
      # HOST-RESIDUAL-SHRINK TERM/PROOF/PACKAGE dual-ok pins companion (S1 peel).
      rel = "src/systems/SystemsLean/HostResidualShrinkTermOk.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostResidualShrinkTermOk"
        "HostResidualShrinkTermOk"
        "namespace SystemsLean.HostResidualShrink"
        "TERM-SURFACE"
        "PROOF-SURFACE"
        "PACKAGE-ELABORATE"
        "hostModuleCheckTermSurfaceDualOk"
        "EmitBody-only"
        "hostModuleCheckEmitBodyTermSurfaceDualOk"
        "KernelMult-only"
        "hostModuleCheckKernelMultTermSurfaceDualOk"
        "KernelLinear-only"
        "hostModuleCheckKernelLinearTermSurfaceDualOk"
        "KernelTypes-only"
        "hostModuleCheckKernelTypesTermSurfaceDualOk"
        "KernelProgram-only"
        "hostModuleCheckKernelProgramTermSurfaceDualOk"
        "KernelEmit-only"
        "hostModuleCheckKernelEmitTermSurfaceDualOk"
        "ParityMult-only"
        "hostModuleCheckParityMultTermSurfaceDualOk"
        "ParityLinear-only"
        "hostModuleCheckParityLinearTermSurfaceDualOk"
        "ParityTypes-only"
        "hostModuleCheckParityTypesTermSurfaceDualOk"
        "ParityProgram-only"
        "hostModuleCheckParityProgramTermSurfaceDualOk"
        "ParityEmit-only"
        "hostModuleCheckParityEmitTermSurfaceDualOk"
        "PROOF-SURFACE"
        "MultTheorems-only"
        "hostModuleCheckProofSurfaceDualOk"
        "LinearTheorems-only"
        "hostModuleCheckLinearProofSurfaceDualOk"
        "TypesTheorems-only"
        "hostModuleCheckTypesProofSurfaceDualOk"
        "KernelMultTheorems-only"
        "hostModuleCheckKernelMultProofSurfaceDualOk"
        "KernelLinearTheorems-only"
        "hostModuleCheckKernelLinearProofSurfaceDualOk"
        "KernelTypesTheorems-only"
        "hostModuleCheckKernelTypesProofSurfaceDualOk"
        "KernelProgramTheorems-only"
        "hostModuleCheckKernelProgramProofSurfaceDualOk"
        "KernelEmitTheorems-only"
        "hostModuleCheckKernelEmitProofSurfaceDualOk"
        "PACKAGE-ELABORATE"
        "MultExtractFoundation-only"
        "hostModuleCheckPackageElaborateFirstBandDualOk"
        "MultLinearTypesProof-only"
        "hostModuleCheckPackageElaborateProofBandDualOk"
        "KernelEmitParity-only"
        "hostModuleCheckPackageElaborateKernelBandDualOk"
        "MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only"
        "hostModuleCheckPackageElaborateEnvDualOk"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HostResidualShrinkTheorems: HOST-RESIDUAL-SHRINK-THEOREM + SMOKE
      # long-file split (same namespace HostResidualShrink).
      rel = "src/systems/SystemsLean/HostResidualShrinkTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "HostResidualShrinkTheorems"
        "SystemsLean.HostResidualShrinkTheorems"
        "import SystemsLean.HostResidualShrink"
        "HOST-RESIDUAL-SHRINK-THEOREM"
        "HOST-RESIDUAL-SHRINK-SMOKE"
        "HOST-RESIDUAL-SHRINK"
        "example"
        "hostResidualShrinkReady_true"
        "hostResidualShrinkFinishedClaimed_true"
        "hostResidualPartialShrinkClaimed_true"
        "hostDevelopMeasuredPathsLakeFreeEvidence_true"
        "hostResidualShrinkHostElaborateRemains_false"
        "hostResidualShrinkHostFreeClaimed_true"
        "hostResidualShrinkFullHostElaborateRemains_false"
        "hostResidualShrinkKeepsHostResidual_true"
        "hostResidualShrinkDoesNotMeanHostFree_true"
        "hostResidualShrinkFreeIsNotLakeGone_true"
        "hostResidualShrink_claims_false"
        "measuredHostLakeFree_recipes_eq"
        "hostPackageRootsLoadDualOk_true"
        "hostImportGraphMultSeedDualOk_true"
        "hostModuleCheckMultSeedDualOk_true"
        "hostImportGraphExpandSeedDualOk_true"
        "hostModuleCheckExpandSeedDualOk_true"
        "hostModuleCheckTheoremCorpusExpandDualOk_true"
        "measuredHostTheoremCorpusExpand_eq"
        "measuredHostRealModuleSeedUnits_eq"
        "hostResidualShrinkBootstrapPrebuildRemains_false"
        "hostFoundationToolsBinLinkWithoutLakeDualOk_true"
        "measuredHostFoundationToolsCleanBootstrap_eq"
        "hostDevelopToolsBinLinkWithoutLakeDualOk_true"
        "hostFrontWithoutLakeDualOk_true"
        "subsetFrontWithoutLakeDualOk_true"
        "frontMultPackageWithoutLakeDualOk_true"
        "multSubsetRebuildWithoutLakeDualOk_true"
        "firstSurfaceWithoutLakeDualOk_true"
        "measuredHostToolBuildExpand_eq"
        "theorem hostResidualShrinkReady_true"
        "UNIT_SURFACE"
        "free true != Lake gone"
        "Not freestanding residual free re-open"
        "Not PROVABLY re-open"
      ];
    }
    {
      # HOST-LLVM-EMIT-PATH: first residual design + measured stub (llvm stays locked).
      rel = "src/systems/SystemsLean/LlvmEmitPath.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.LlvmEmitPath"
        "HOST-LLVM-EMIT-PATH"
        "SLAKE_LLVM_EMIT_PATH"
        "SLAKE_LLVM_EMIT_PATH_V0"
        "HOST-HOST-LLVM-EMIT-PATH"
        "llvmEmitPathReady"
        "llvmEmitPathFinishedClaimed"
        "llvmEmitPathDesignLanded"
        "llvmEmitPathStubLanded"
        "llvmEmitPathKeepsLlvmLocked"
        "llvmEmitPathDoesNotUnlockLlvm"
        "llvmEmitPathLlvmUnlocked"
        "llvmEmitPathLocalUnlockFalse"
        "justRecipeLlvmEmitPath"
        "llvm-emit-path"
        "out/llvm-ir"
        "MEASURED-STUB"
        "designNotePath"
        "llvm-ir-emit-path-2026-08-02"
        "LlvmHold"
        "llvmUnlocked"
        "HOST-LLVM-HOLD"
        "HOST-LLVM-EMIT-PATH-SMOKE"
        "HOST-LLVM-EMIT-PATH-THEOREM"
        "llvmEmitPathReady_true"
        "llvmEmitPathFinishedClaimed_true"
        "llvmEmitPathDesignLanded_true"
        "llvmEmitPathStubLanded_true"
        "llvmEmitPathLlvmUnlocked_false"
        "llvmEmitPathKeepsLlvmLocked_true"
        "llvmEmitPathDoesNotUnlockLlvm_true"
        "llvmEmitPath_claims_false"
        "theorem llvmEmitPathReady_true"
        "def llvmEmitPathFinishedClaimed : Bool := true"
        "def llvmEmitPathDesignLanded : Bool := true"
        "def llvmEmitPathStubLanded : Bool := true"
        "def llvmEmitPathLlvmUnlocked : Bool := false"
        "doc/dev/research/llvm-ir-emit-path-2026-08-02.md"
        "UNIT_SURFACE"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "Not freestanding residual free"
        "Not freestanding emit"
        "Not PROVABLY re-open"
        "Not llvm unlock"
        "Host elaborator residual remains"
        "Design + measured stub only"
      ];
    }
    {
      # HOST-LLVM-MULT-TEXT: Mult unit LLVM IR fragment from Lean Mult SSOT
      # (generator-owned out/llvm-ir/slake_mult.ll; llvm stays locked).
      rel = "src/systems/SystemsLean/LlvmMultText.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.LlvmMultText"
        "HOST-LLVM-MULT-TEXT"
        "SLAKE_LLVM_MULT_TEXT"
        "SLAKE_LLVM_MULT_TEXT_V0"
        "HOST-HOST-LLVM-MULT-TEXT"
        "llvmMultTextReady"
        "llvmMultTextFinishedClaimed"
        "llvmMultTextPackageOk"
        "llvmMultTextWroteExpected"
        "llvmMultTextKeepsLlvmLocked"
        "llvmMultTextDoesNotUnlockLlvm"
        "llvmMultTextLlvmUnlocked"
        "llvmMultTextLocalUnlockFalse"
        "justRecipeLlvmMultText"
        "llvm-mult-text"
        "out/llvm-ir"
        "slake_mult.ll"
        "multIrPackage"
        "llvmMultTextWrite"
        "IO.FS.writeFile"
        "Mult"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "HOST-LLVM-EMIT-PATH"
        "HOST-LLVM-MULT-TEXT-SMOKE"
        "HOST-LLVM-MULT-TEXT-THEOREM"
        "llvmMultTextReady_true"
        "llvmMultTextFinishedClaimed_true"
        "llvmMultTextLlvmUnlocked_false"
        "llvmMultTextKeepsLlvmLocked_true"
        "llvmMultTextDoesNotUnlockLlvm_true"
        "llvmMultText_claims_false"
        "theorem llvmMultTextReady_true"
        "def llvmMultTextFinishedClaimed : Bool := true"
        "def llvmMultTextLlvmUnlocked : Bool := false"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not freestanding emit"
        "Not PROVABLY re-open"
        "Not llvm unlock"
        "Host elaborator residual remains"
        "Mult IR text only"
      ];
    }
    {
      # HOST-LLVM-LINEAR-TEXT: Linear unit LLVM IR fragment from Lean Linear SSOT
      # (generator-owned out/llvm-ir/slake_linear.ll; llvm stays locked).
      rel = "src/systems/SystemsLean/LlvmLinearText.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.LlvmLinearText"
        "HOST-LLVM-LINEAR-TEXT"
        "SLAKE_LLVM_LINEAR_TEXT"
        "SLAKE_LLVM_LINEAR_TEXT_V0"
        "HOST-HOST-LLVM-LINEAR-TEXT"
        "llvmLinearTextReady"
        "llvmLinearTextFinishedClaimed"
        "llvmLinearTextPackageOk"
        "llvmLinearTextWroteExpected"
        "llvmLinearTextKeepsLlvmLocked"
        "llvmLinearTextDoesNotUnlockLlvm"
        "llvmLinearTextLlvmUnlocked"
        "llvmLinearTextLocalUnlockFalse"
        "justRecipeLlvmLinearText"
        "llvm-linear-text"
        "out/llvm-ir"
        "slake_linear.ll"
        "linearIrPackage"
        "llvmLinearTextWrite"
        "IO.FS.writeFile"
        "Linear"
        "LINEAR-EXACT-ONCE"
        "LINEAR-AXIOMS-REMAIN"
        "shareNat"
        "polyId"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmMultText"
        "HOST-LLVM-EMIT-PATH"
        "HOST-LLVM-MULT-TEXT"
        "HOST-LLVM-LINEAR-TEXT-SMOKE"
        "HOST-LLVM-LINEAR-TEXT-THEOREM"
        "llvmLinearTextReady_true"
        "llvmLinearTextFinishedClaimed_true"
        "llvmLinearTextLlvmUnlocked_false"
        "llvmLinearTextKeepsLlvmLocked_true"
        "llvmLinearTextDoesNotUnlockLlvm_true"
        "llvmLinearText_claims_false"
        "theorem llvmLinearTextReady_true"
        "def llvmLinearTextFinishedClaimed : Bool := true"
        "def llvmLinearTextLlvmUnlocked : Bool := false"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not freestanding emit"
        "Not PROVABLY re-open"
        "Not llvm unlock"
        "Host elaborator residual remains"
        "Linear IR text only"
      ];
    }
    {
      # HOST-LLVM-TYPES-TEXT: Types unit LLVM IR fragment from Lean Types SSOT
      # (generator-owned out/llvm-ir/slake_types.ll; llvm stays locked).
      rel = "src/systems/SystemsLean/LlvmTypesText.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.LlvmTypesText"
        "HOST-LLVM-TYPES-TEXT"
        "SLAKE_LLVM_TYPES_TEXT"
        "SLAKE_LLVM_TYPES_TEXT_V0"
        "HOST-HOST-LLVM-TYPES-TEXT"
        "llvmTypesTextReady"
        "llvmTypesTextFinishedClaimed"
        "llvmTypesTextPackageOk"
        "llvmTypesTextWroteExpected"
        "llvmTypesTextKeepsLlvmLocked"
        "llvmTypesTextDoesNotUnlockLlvm"
        "llvmTypesTextLlvmUnlocked"
        "llvmTypesTextLocalUnlockFalse"
        "justRecipeLlvmTypesText"
        "llvm-types-text"
        "out/llvm-ir"
        "slake_types.ll"
        "typesIrPackage"
        "llvmTypesTextWrite"
        "IO.FS.writeFile"
        "Types"
        "TYPED_IR_V0"
        "FAIL-CLOSED-UNKNOWN-KIND"
        "VALUE"
        "LINEAR"
        "ERASED"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "kindMultOk"
        "isValidKindTag"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmMultText"
        "LlvmLinearText"
        "HOST-LLVM-EMIT-PATH"
        "HOST-LLVM-MULT-TEXT"
        "HOST-LLVM-LINEAR-TEXT"
        "HOST-LLVM-TYPES-TEXT-SMOKE"
        "HOST-LLVM-TYPES-TEXT-THEOREM"
        "llvmTypesTextReady_true"
        "llvmTypesTextFinishedClaimed_true"
        "llvmTypesTextLlvmUnlocked_false"
        "llvmTypesTextKeepsLlvmLocked_true"
        "llvmTypesTextDoesNotUnlockLlvm_true"
        "llvmTypesText_claims_false"
        "theorem llvmTypesTextReady_true"
        "def llvmTypesTextFinishedClaimed : Bool := true"
        "def llvmTypesTextLlvmUnlocked : Bool := false"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not freestanding emit"
        "Not PROVABLY re-open"
        "Not llvm unlock"
        "Host elaborator residual remains"
        "Types IR text only"
      ];
    }
    {
      # HOST-LLVM-PROGRAM-TEXT: ordered IR program unit LLVM IR fragment from
      # Lean Program SSOT (generator-owned out/llvm-ir/slake_program.ll; llvm stays locked).
      rel = "src/systems/SystemsLean/LlvmProgramText.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.LlvmProgramText"
        "HOST-LLVM-PROGRAM-TEXT"
        "SLAKE_LLVM_PROGRAM_TEXT"
        "SLAKE_LLVM_PROGRAM_TEXT_V0"
        "HOST-HOST-LLVM-PROGRAM-TEXT"
        "llvmProgramTextReady"
        "llvmProgramTextFinishedClaimed"
        "llvmProgramTextPackageOk"
        "llvmProgramTextWroteExpected"
        "llvmProgramTextKeepsLlvmLocked"
        "llvmProgramTextDoesNotUnlockLlvm"
        "llvmProgramTextLlvmUnlocked"
        "llvmProgramTextLocalUnlockFalse"
        "justRecipeLlvmProgramText"
        "llvm-program-text"
        "out/llvm-ir"
        "slake_program.ll"
        "programIrPackage"
        "llvmProgramTextWrite"
        "IO.FS.writeFile"
        "IrProgram"
        "ORDERED-IR-PROGRAM"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "SLAKE_IR_PROGRAM_CAP"
        "programCap"
        "push"
        "isWellTyped"
        "checkFailClosed"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmMultText"
        "LlvmLinearText"
        "LlvmTypesText"
        "HOST-LLVM-EMIT-PATH"
        "HOST-LLVM-MULT-TEXT"
        "HOST-LLVM-LINEAR-TEXT"
        "HOST-LLVM-TYPES-TEXT"
        "HOST-LLVM-PROGRAM-TEXT-SMOKE"
        "HOST-LLVM-PROGRAM-TEXT-THEOREM"
        "llvmProgramTextReady_true"
        "llvmProgramTextFinishedClaimed_true"
        "llvmProgramTextLlvmUnlocked_false"
        "llvmProgramTextKeepsLlvmLocked_true"
        "llvmProgramTextDoesNotUnlockLlvm_true"
        "llvmProgramText_claims_false"
        "theorem llvmProgramTextReady_true"
        "def llvmProgramTextFinishedClaimed : Bool := true"
        "def llvmProgramTextLlvmUnlocked : Bool := false"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not freestanding emit"
        "Not PROVABLY re-open"
        "Not llvm unlock"
        "Host elaborator residual remains"
        "Program IR text only"
        "Not CFG"
        "Not SSA"
      ];
    }
    {
      # HOST-LLVM-GRAPH-TEXT: IR graph unit LLVM IR fragment from
      # Lean Graph SSOT (generator-owned out/llvm-ir/slake_graph.ll; llvm stays locked).
      rel = "src/systems/SystemsLean/LlvmGraphText.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.LlvmGraphText"
        "HOST-LLVM-GRAPH-TEXT"
        "SLAKE_LLVM_GRAPH_TEXT"
        "SLAKE_LLVM_GRAPH_TEXT_V0"
        "HOST-HOST-LLVM-GRAPH-TEXT"
        "llvmGraphTextReady"
        "llvmGraphTextFinishedClaimed"
        "llvmGraphTextPackageOk"
        "llvmGraphTextWroteExpected"
        "llvmGraphTextKeepsLlvmLocked"
        "llvmGraphTextDoesNotUnlockLlvm"
        "llvmGraphTextLlvmUnlocked"
        "llvmGraphTextLocalUnlockFalse"
        "justRecipeLlvmGraphText"
        "llvm-graph-text"
        "out/llvm-ir"
        "slake_graph.ll"
        "graphIrPackage"
        "llvmGraphTextWrite"
        "IO.FS.writeFile"
        "IrGraph"
        "EMPTY-GRAPH-OK"
        "SLAKE_IR_EDGE_MAX"
        "edgeMax"
        "addEdge"
        "pushNode"
        "isWellTyped"
        "checkFailClosed"
        "edgesSound"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmMultText"
        "LlvmLinearText"
        "LlvmTypesText"
        "LlvmProgramText"
        "HOST-LLVM-EMIT-PATH"
        "HOST-LLVM-MULT-TEXT"
        "HOST-LLVM-LINEAR-TEXT"
        "HOST-LLVM-TYPES-TEXT"
        "HOST-LLVM-PROGRAM-TEXT"
        "HOST-LLVM-GRAPH-TEXT-SMOKE"
        "HOST-LLVM-GRAPH-TEXT-THEOREM"
        "llvmGraphTextReady_true"
        "llvmGraphTextFinishedClaimed_true"
        "llvmGraphTextLlvmUnlocked_false"
        "llvmGraphTextKeepsLlvmLocked_true"
        "llvmGraphTextDoesNotUnlockLlvm_true"
        "llvmGraphText_claims_false"
        "theorem llvmGraphTextReady_true"
        "def llvmGraphTextFinishedClaimed : Bool := true"
        "def llvmGraphTextLlvmUnlocked : Bool := false"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not freestanding emit"
        "Not PROVABLY re-open"
        "Not llvm unlock"
        "Host elaborator residual remains"
        "Graph IR text only"
        "Not full CFG"
        "Not SSA"
      ];
    }
    {
      # LAKE-RETIRE-INVENTORY: M6 inventory + phase 2 product path Lake retired.
      rel = "src/systems/SystemsLean/LakeRetireInventory.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.LakeRetireInventory"
        "LAKE-RETIRE-INVENTORY"
        "SLAKE_LAKE_RETIRE_INVENTORY"
        "SLAKE_LAKE_RETIRE_INVENTORY_V0"
        "HOST-LAKE-RETIRE-INVENTORY"
        "lakeRetireInventoryReady"
        "lakeRetireInventoryFinishedClaimed"
        "productPathMeasuredStepsLakeFreeEvidence"
        "lakeRetireProductPathLakeRetired"
        "lakeRetireKeepsProductStillUsesLake"
        "justRecipeLakeRetireInventory"
        "lake-retire-inventory"
        "lakeRetireHostElaborateRemains"
        "lakeRetireBootstrapPrebuildRemains"
        "lakeRetireDiagnosticLakeRecipesRemain"
        "measuredLakeFreeJustBuild"
        "measuredLakeFreeProductWireWrite"
        "measuredLakeFreeCapableRegenerate"
        "measuredLakeFreeMultRebuild"
        "measuredLakeFreeMultWrite"
        "measuredLakeFreeMultDeepen"
        "measuredLakeFreeSubsetPackageJoin"
        "stillUsesLake"
        "dependsOnLake"
        "LAKE-RETIRE-INVENTORY-SMOKE"
        "LAKE-RETIRE-INVENTORY-THEOREM"
        "lakeRetireInventoryReady_true"
        "lakeRetireInventoryFinishedClaimed_true"
        "productPathMeasuredStepsLakeFreeEvidence_true"
        "lakeRetireProductPathLakeRetired_true"
        "lakeRetireKeepsProductStillUsesLake_true"
        "lakeRetireHostElaborateRemains_true"
        "lakeRetireInventoryDoesNotRetireLake_true"
        "lakeRetireInventoryDoesNotMeanResidualFree_true"
        "lakeRetireFreeIsNotLakeGone_true"
        "lakeRetireInventory_claims_false"
        "theorem lakeRetireInventoryReady_true"
        "def lakeRetireInventoryFinishedClaimed : Bool := true"
        "def stillUsesLake : Bool := false"
        "def dependsOnLake : Bool := false"
        "def lakeRetireHostElaborateRemains : Bool := true"
        "product-wire-freestanding-write"
        "freestanding-capable-regenerate-without-lake"
        "mult-subset-rebuild-without-lake"
        "mult-subset-freestanding-write"
        "mult-subset-freestanding-deepen"
        "subset-packages-rebuild-join-without-lake"
        "free true != Lake gone"
        "UNIT_SURFACE"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not freestanding emit"
        "Not PROVABLY"
      ];
    }
    {
      # COMPILE-PATH-LINEAR: Linear unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathLinear.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathLinear"
        "COMPILE-PATH-LINEAR"
        "LINEAR-FIXTURE"
        "HOST-EMIT-LINEAR"
        "linearFixtureCompilePathReady"
        "linearFixtureProgramReady"
        "linearFixtureComposeReady"
        "linearFixtureEmitPathOk"
        "linearFixtureMintConsumeOk"
        "lowerLinearFixtureProgram"
        "lowerLinearFixtureCompose"
        "COMPILE-PATH-LINEAR-SMOKE"
        "COMPILE-PATH-LINEAR-THEOREM"
        "linearFixtureCompilePathReady_true"
        "linearFixtureDoesNotMeanResidualFree_true"
        "linearFixture_claims_false"
        "LINEAR-EXACT-ONCE"
        "ConsumeToken"
        "theorem linearFixtureCompilePathReady_true"
        "theorem linearFixtureDoesNotMeanResidualFree_true"
        "theorem linearFixture_claims_false"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitLinear"
      ];
    }
    {
      # COMPILE-PATH-TYPES: Types unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathTypes.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathTypes"
        "COMPILE-PATH-TYPES"
        "TYPES-FIXTURE"
        "HOST-EMIT-TYPES"
        "typesFixtureCompilePathReady"
        "typesFixtureProgramReady"
        "typesFixtureComposeReady"
        "typesFixtureEmitPathOk"
        "typesFixtureKindMultOk"
        "lowerTypesFixtureProgram"
        "lowerTypesFixtureCompose"
        "COMPILE-PATH-TYPES-SMOKE"
        "COMPILE-PATH-TYPES-THEOREM"
        "typesFixtureCompilePathReady_true"
        "typesFixtureDoesNotMeanResidualFree_true"
        "typesFixture_claims_false"
        "TYPED_IR_V0"
        "theorem typesFixtureCompilePathReady_true"
        "theorem typesFixtureDoesNotMeanResidualFree_true"
        "theorem typesFixture_claims_false"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitTypes"
      ];
    }
    {
      # COMPILE-PATH-PROGRAM: Program unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathProgram.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathProgram"
        "COMPILE-PATH-PROGRAM"
        "PROGRAM-FIXTURE"
        "HOST-EMIT-PROGRAM"
        "programFixtureCompilePathReady"
        "programFixtureProgramReady"
        "programFixtureComposeReady"
        "programFixtureEmitPathOk"
        "programFixtureFoldOk"
        "lowerProgramFixtureProgram"
        "lowerProgramFixtureCompose"
        "COMPILE-PATH-PROGRAM-SMOKE"
        "COMPILE-PATH-PROGRAM-THEOREM"
        "programFixtureCompilePathReady_true"
        "programFixtureDoesNotMeanResidualFree_true"
        "programFixture_claims_false"
        "theorem programFixtureCompilePathReady_true"
        "theorem programFixtureDoesNotMeanResidualFree_true"
        "theorem programFixture_claims_false"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitProgram"
      ];
    }
    {
      # COMPILE-PATH-EXTRACT: extract RUNTIME-FS gate (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathExtract.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathExtract"
        "COMPILE-PATH-EXTRACT"
        "EXTRACT-RUNTIME-FS"
        "fixtureExtractGateOk"
        "multFixtureExtractGateOk"
        "programFixtureExtractGateOk"
        "multFixtureExtractRawReject"
        "programFixtureExtractRawReject"
        "extractRuntimeFsGateReady"
        "extractRuntimeFsDoesNotMeanResidualFree"
        "COMPILE-PATH-EXTRACT-SMOKE"
        "COMPILE-PATH-EXTRACT-THEOREM"
        "extractRuntimeFsGateReady_true"
        "extractRuntimeFsDoesNotMeanResidualFree_true"
        "extractRuntimeFs_claims_false"
        "multFixtureExtractGateOk_true"
        "programFixtureExtractGateOk_true"
        "extractClaimOk_fs_eq_extractOkFs"
        "theorem multFixtureExtractGateOk_true"
        "theorem programFixtureExtractGateOk_true"
        "theorem extractRuntimeFsGateReady_true"
        "theorem extractRuntimeFsDoesNotMeanResidualFree_true"
        "theorem extractRuntimeFs_claims_false"
        "theorem extractClaimOk_fs_eq_extractOkFs"
        "import SystemsLean.CompilePath"
        "import SystemsLean.CompilePathMult"
        "import SystemsLean.CompilePathProgram"
      ];
    }
    {
      # COMPILE-PATH-GRAPH: Graph unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathGraph.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathGraph"
        "COMPILE-PATH-GRAPH"
        "GRAPH-FIXTURE"
        "HOST-EMIT-GRAPH"
        "graphFixtureCompilePathReady"
        "graphFixtureProgramReady"
        "graphFixtureGraphReady"
        "graphFixtureComposeReady"
        "graphFixtureEmitPathOk"
        "graphFixtureEdgesOk"
        "graphFixtureChainEdgesOk"
        "lowerGraphFixtureProgram"
        "lowerGraphFixtureGraph"
        "lowerGraphFixtureCompose"
        "COMPILE-PATH-GRAPH-SMOKE"
        "COMPILE-PATH-GRAPH-THEOREM"
        "graphFixtureCompilePathReady_true"
        "graphFixtureDoesNotMeanResidualFree_true"
        "graphFixture_claims_false"
        "graphFixtureMintId_eq"
        "IR-GRAPH-EDGES"
        "EMPTY-GRAPH-OK"
        "theorem graphFixtureCompilePathReady_true"
        "theorem graphFixtureDoesNotMeanResidualFree_true"
        "theorem graphFixture_claims_false"
        "theorem graphFixtureGraphReady_true"
        "theorem graphFixtureEdgesOk_true"
        "theorem graphFixtureMintId_eq"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitGraph"
      ];
    }
    {
      # COMPILE-PATH-COMPOSE: Compose unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathCompose.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathCompose"
        "COMPILE-PATH-COMPOSE"
        "COMPOSE-FIXTURE"
        "HOST-EMIT-COMPOSE"
        "composeFixtureCompilePathReady"
        "composeFixtureProgramReady"
        "composeFixtureComposeReady"
        "composeFixtureEmitPathOk"
        "composeFixtureEdgesOk"
        "composeFixtureChainEdgesOk"
        "composeFixtureMintConsumeOk"
        "lowerComposeFixtureProgram"
        "lowerComposeFixtureCompose"
        "COMPILE-PATH-COMPOSE-SMOKE"
        "COMPILE-PATH-COMPOSE-THEOREM"
        "composeFixtureCompilePathReady_true"
        "composeFixtureDoesNotMeanResidualFree_true"
        "composeFixture_claims_false"
        "composeFixtureMintId_eq"
        "ConsumeToken"
        "LINEAR-EXACT-ONCE"
        "theorem composeFixtureCompilePathReady_true"
        "theorem composeFixtureDoesNotMeanResidualFree_true"
        "theorem composeFixture_claims_false"
        "theorem composeFixtureComposeReady_true"
        "theorem composeFixtureEdgesOk_true"
        "theorem composeFixtureMintConsumeOk_true"
        "theorem composeFixtureMintId_eq"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitCompose"
      ];
    }
    {
      # COMPILE-PATH-ERASURE: Erasure unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathErasure.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathErasure"
        "COMPILE-PATH-ERASURE"
        "ERASURE-FIXTURE"
        "HOST-EMIT-ERASURE"
        "erasureFixtureCompilePathReady"
        "erasureFixtureProgramReady"
        "erasureFixtureComposeReady"
        "erasureFixtureEmitPathOk"
        "erasureFixtureMarkedOk"
        "lowerErasureFixtureProgram"
        "lowerErasureFixtureCompose"
        "COMPILE-PATH-ERASURE-SMOKE"
        "COMPILE-PATH-ERASURE-THEOREM"
        "erasureFixtureCompilePathReady_true"
        "erasureFixtureDoesNotMeanResidualFree_true"
        "erasureFixture_claims_false"
        "ERASE-RULE-MULT-0"
        "ERASE-NO-RUNTIME"
        "theorem erasureFixtureCompilePathReady_true"
        "theorem erasureFixtureDoesNotMeanResidualFree_true"
        "theorem erasureFixture_claims_false"
        "theorem erasureFixtureComposeReady_true"
        "theorem erasureFixtureMarkedOk_true"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitErasure"
      ];
    }
    {
      # COMPILE-PATH-PLAN: Plan unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathPlan.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathPlan"
        "COMPILE-PATH-PLAN"
        "PLAN-FIXTURE"
        "HOST-EMIT-PLAN"
        "planFixtureCompilePathReady"
        "planFixtureProgramReady"
        "planFixtureComposeReady"
        "planFixtureEmitPathOk"
        "planFixturePlanOk"
        "lowerPlanFixtureProgram"
        "lowerPlanFixtureCompose"
        "COMPILE-PATH-PLAN-SMOKE"
        "COMPILE-PATH-PLAN-THEOREM"
        "planFixtureCompilePathReady_true"
        "planFixtureDoesNotMeanResidualFree_true"
        "planFixture_claims_false"
        "planFixtureMintId_eq"
        "planFromCompose"
        "planOk"
        "theorem planFixtureCompilePathReady_true"
        "theorem planFixtureDoesNotMeanResidualFree_true"
        "theorem planFixture_claims_false"
        "theorem planFixtureComposeReady_true"
        "theorem planFixturePlanOk_true"
        "theorem planFixtureMintId_eq"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitPlan"
      ];
    }
    {
      # COMPILE-PATH-APPLY: Apply unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathApply.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathApply"
        "COMPILE-PATH-APPLY"
        "APPLY-FIXTURE"
        "HOST-EMIT-APPLY"
        "applyFixtureCompilePathReady"
        "applyFixtureProgramReady"
        "applyFixtureComposeReady"
        "applyFixtureEmitPathOk"
        "applyFixtureApplyOk"
        "lowerApplyFixtureProgram"
        "lowerApplyFixtureCompose"
        "COMPILE-PATH-APPLY-SMOKE"
        "COMPILE-PATH-APPLY-THEOREM"
        "applyFixtureCompilePathReady_true"
        "applyFixtureDoesNotMeanResidualFree_true"
        "applyFixture_claims_false"
        "applyFixtureMintId_eq"
        "applyFromCompose"
        "applyOk"
        "theorem applyFixtureCompilePathReady_true"
        "theorem applyFixtureDoesNotMeanResidualFree_true"
        "theorem applyFixture_claims_false"
        "theorem applyFixtureComposeReady_true"
        "theorem applyFixtureApplyOk_true"
        "theorem applyFixtureMintId_eq"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitApply"
      ];
    }
  ];
}
