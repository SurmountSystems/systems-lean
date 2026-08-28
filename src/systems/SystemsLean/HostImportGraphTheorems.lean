/-
  SYSTEMS_LEAN_HOST partial -- HostImportGraph theorems + smoke examples.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel companion. Namespace SystemsLean.HostImportGraph.
  Non-claims: PARTIAL-STRUCTURAL; Not freestanding residual free; Not PROVABLY;
  Host elaborator residual remains.
  Greppable: SYSTEMS_LEAN_HOST, HOST-IMPORT-GRAPH, HostImportGraphTheorems,
  HOST-IMPORT-GRAPH-THEOREM, HOST-IMPORT-GRAPH-SMOKE, hostImportGraphReady_true,
  hostImportGraphLoadOk_true.
  Module: SystemsLean.HostImportGraphTheorems
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Red/green: lake build SystemsLean.HostImportGraphTheorems; just systems-host.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY. Host elaborator residual remains.
-/
import SystemsLean.HostImportGraphLoadOk
namespace SystemsLean.HostImportGraph

/-- Mult seed dual-pin + fail-closed holds.
    Greppable: hostImportGraphLoadOk_true, HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphLoadOk_true : hostImportGraphLoadOk = true := by
  native_decide

/-- Structural ready.
    Greppable: hostImportGraphReady_true, HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphReady_true : hostImportGraphReady = true := by
  native_decide

/-- Without-Lake ready.
    Greppable: hostImportGraphWithoutLakeReady_true,
    HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphWithoutLakeReady_true :
    hostImportGraphWithoutLakeReady = true := by
  native_decide

/-- Finished claimed.
    Greppable: hostImportGraphFinishedClaimed_true,
    HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphFinishedClaimed_true :
    hostImportGraphFinishedClaimed = true :=
  rfl

/-- Host residual remains (local mirror).
    Greppable: hostImportGraphHostElaboratorResidualRemains_true,
    HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphHostElaboratorResidualRemains_true :
    hostImportGraphHostElaboratorResidualRemains = true :=
  rfl

/-- Host free not claimed.
    Greppable: hostImportGraphHostFreeClaimed_false,
    HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphHostFreeClaimed_false :
    hostImportGraphHostFreeClaimed = false :=
  rfl

/-- Without-Lake finished.
    Greppable: hostImportGraphWithoutLakeFinished_true,
    HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphWithoutLakeFinished_true :
    hostImportGraphWithoutLakeFinished = true :=
  rfl

/-- Good Mult seed accepts with count 2.
    Greppable: hostImportGraphGoodMultSeed_accept,
    HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphGoodMultSeed_accept :
    hostImportGraphGoodMultSeed.isAccept = true
      && hostImportGraphGoodMultSeed.acceptCount = 2 := by
  native_decide

/-- Good expand seed accepts with count 87 (Mult..Compose+Erasure/Extract+
    CompilePath/Kernel+Kernel *Theorems+JoinMap/SelfHost+SurfaceMatrix+
    Emit Mult..Compose scaffolds+Emit Plan/Apply/Body scaffolds+
    Emit Erasure/Extract/Banner scaffolds+KernelSelfApply+
    KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+
    KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+
    ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+
    ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+
    SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+
    EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+
    ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+
    BootstrapHonestyTheorems+ProductPathWriterSurface+
    ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+
    ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+
    ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+
    ProductPathOwnershipInputsTheorems+ProductPathPerform+
    ProductPathPerformTheorems+ProductPathPerformStep+
    ProductPathPerformStepTheorems+ProductPathReadSsot+
    ProductPathReadSsotTheorems+ProductPathComposePlan+
    ProductPathComposePlanTheorems+Capable+CapableTheorems+
    CapableStepContract+CapableStepContractTheorems+InstallOut+
    InstallOutTheorems+OfficialPath+OfficialPathTheorems+
    PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText).
    Greppable: hostImportGraphGoodExpandSeed_accept, HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphGoodExpandSeed_accept :
    hostImportGraphGoodExpandSeed.isAccept = true
      && hostImportGraphGoodExpandSeed.acceptCount = 206 := by
  native_decide

/-- Missing Mult fails closed.
    Greppable: hostImportGraphBadMissing_missing,
    HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphBadMissing_missing :
    hostImportGraphBadMissing.isRejectWith reasonMissingImport = true := by
  native_decide

/-- Cycle fails closed.
    Greppable: hostImportGraphBadCycle_cycle, HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphBadCycle_cycle :
    hostImportGraphBadCycle.isRejectWith reasonImportCycle = true := by
  native_decide

/-- Stage / host / recipe ids.
    Greppable: hostImportGraph_ids_eq, HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraph_ids_eq :
    stageId = "SLAKE_HOST_IMPORT_GRAPH_V0"
      && hostId = "HOST-IMPORT-GRAPH"
      && lakeExeName = "slake-host-import-graph"
      && justRecipe = "host-import-graph"
      && justRecipeWithoutLake = "host-import-graph-without-lake"
      && prebuiltHostImportGraphRel
        = ".lake/build/bin/slake-host-import-graph"
      && residualName = "Real Mult import graph" :=
  rfl

/-- Local free/complete/proof/llvm/PROVABLY/host-free non-claims false.
    Greppable: hostImportGraph_claims_false, HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraph_claims_false :
    hostImportGraphResidualFreeClaimed = false
      && hostImportGraphProductSelfHostCompleteClaimed = false
      && hostImportGraphProofCompleteClaimed = false
      && hostImportGraphLlvmUnlocked = false
      && hostImportGraphProvablyUnlocked = false
      && hostImportGraphHostFreeClaimed = false
      && stillUsesLake = true
      && dependsOnLake = true :=
  rfl

/-! ### HOST-IMPORT-GRAPH-SMOKE (quick examples) -/

example : hostImportGraphLoadOk = true := by native_decide
example : hostImportGraphReady = true := by native_decide
example : hostImportGraphWithoutLakeReady = true := by native_decide
example : hostImportGraphFinishedClaimed = true := rfl
example : hostImportGraphWithoutLakeFinished = true := rfl
example : hostImportGraphHostElaboratorResidualRemains = true := rfl
example : hostImportGraphHostFreeClaimed = false := rfl
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : lakeExeName = "slake-host-import-graph" := rfl
example : justRecipe = "host-import-graph" := rfl
example : justRecipeWithoutLake = "host-import-graph-without-lake" := rfl
example :
    prebuiltHostImportGraphRel =
      ".lake/build/bin/slake-host-import-graph" :=
  rfl
example : residualName = "Real Mult import graph" := rfl
example : hostImportGraphExpandSliceName = "Host library seed expand continue" :=
  rfl
example :
    hostImportGraphSeedUnitsLabel =
      "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText+SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars+InventoryCloseTheorems+ProductPath+ProductPathTheorems+DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems" :=
  rfl
example : hostImportGraphGoodMultSeed.isAccept = true := by native_decide
example : hostImportGraphGoodExpandSeed.isAccept = true := by native_decide
example :
    hostImportGraphBadMissing.isRejectWith reasonMissingImport = true := by
  native_decide
example :
    hostImportGraphBadCycle.isRejectWith reasonImportCycle = true := by
  native_decide
end SystemsLean.HostImportGraph
