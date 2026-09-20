/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck HOST-MODULE-CHECK-SMOKE surface.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.HostModuleCheckTheorems: quick example
  (smoke) dual-pins live here; HOST-MODULE-CHECK-THEOREM readable theorems
  stay in HostModuleCheckTheorems. Same namespace SystemsLean.HostModuleCheck
  so names stay unqualified under that namespace.
  Sub-1-KLOC: do not grow past 1000. Headroom for U1 TERM smoke growth.

  Spec (readable):
  - HOST-MODULE-CHECK-SMOKE: behavioral examples over loadOk / ready /
    without-Lake / Mult.. seed good accept / fail-closed / TERM-SURFACE /
    PROOF-SURFACE / recipe ids / local non-claims.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - FOUNDATION-KIND-SURFACE deepen still not full elaborate.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HOST-MODULE-CHECK-SMOKE,
  HostModuleCheckSmoke, hostModuleCheckLoadOk, hostModuleCheckReady,
  TERM-SURFACE, PROOF-SURFACE, PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostModuleCheckSmoke
  Greppable: MULT-0 (host Mult IR contract cite; smoke surface honesty).
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckSmoke;
  lake build SystemsLean.HostModuleCheckTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
-/

import SystemsLean.HostModuleCheck

-- native_decide over expanded FOUNDATION-KIND-SURFACE fixtures needs room.
set_option maxRecDepth 16384

namespace SystemsLean.HostModuleCheck

/-! ### HOST-MODULE-CHECK-SMOKE (quick examples) -/

example : hostModuleCheckLoadOk = true := by native_decide
example : hostModuleCheckReady = true := by native_decide
example : hostModuleCheckWithoutLakeReady = true := by native_decide
example : hostModuleCheckFinishedClaimed = true := rfl
example : hostModuleCheckWithoutLakeFinished = true := rfl
example : hostModuleCheckHostElaboratorResidualRemains = true := rfl
example : hostModuleCheckHostFreeClaimed = false := rfl
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : lakeExeName = "slake-host-module-check" := rfl
example : justRecipe = "host-module-check" := rfl
example : justRecipeWithoutLake = "host-module-check-without-lake" := rfl
example :
    prebuiltHostModuleCheckRel =
      ".lake/build/bin/slake-host-module-check" :=
  rfl
example : residualName = "First real host module check" := rfl
example : hostModuleCheckExpandSliceName = "Host library seed expand continue" :=
  rfl
example :
    hostModuleCheckSeedUnitsLabel =
      "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText+SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars+InventoryCloseTheorems+ProductPath+ProductPathTheorems+DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems" :=
  rfl
example : checkDepthPartial = "PARTIAL-STRUCTURAL" := rfl
example : checkDepthDeepenBar = "FOUNDATION-KIND-SURFACE" := rfl
example : checkDepthDeepenSliceName = "Check depth deepen continue" := rfl
example :
    checkDepthDeepenBand =
      "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelEmit+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+KernelEmitTheorems+EmitPlan+EmitApply+EmitBody+ParityMult+ParityLinear+ParityTypes+ParityProgram+ParityEmit+ParityMultTheorems+ParityLinearTheorems+ParityTypesTheorems+ParityProgramTheorems+ParityEmitTheorems" :=
  rfl
example : hostModuleCheckGoodMult.isAccept = true := by native_decide
example : hostModuleCheckGoodMultTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodLinear.isAccept = true := by native_decide
example : hostModuleCheckGoodTypes.isAccept = true := by native_decide
example : hostModuleCheckGoodIrProgram.isAccept = true := by native_decide
example : hostModuleCheckGoodIrProgramTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodIrGraph.isAccept = true := by native_decide
example : hostModuleCheckGoodIrGraphTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodHostCompose.isAccept = true := by native_decide
example : hostModuleCheckGoodHostComposeTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodErasure.isAccept = true := by native_decide
example : hostModuleCheckGoodErasureTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodExtract.isAccept = true := by native_decide
example : hostModuleCheckGoodExtractTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodCompilePath.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelMult.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelLinear.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelTypes.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelProgram.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelMultTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelLinearTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelTypesTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelProgramTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodJoinMap.isAccept = true := by native_decide
example : hostModuleCheckGoodJoinMapTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodSelfHost.isAccept = true := by native_decide
example : hostModuleCheckGoodSelfHostTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodSurfaceMatrix.isAccept = true := by native_decide
example : hostModuleCheckGoodSurfaceMatrixTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitMultScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitLinearScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitTypesScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitProgramScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitGraphScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitComposeScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitPlanScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitApplyScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitBodyScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitErasureScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitExtractScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitBannerScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelSelfApply.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelSelfApplyTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitMult.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitPlan.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitApply.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitBody.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelEmit.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelEmitTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodParityMult.isAccept = true := by native_decide
example : hostModuleCheckGoodParityMultTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodParityLinear.isAccept = true := by native_decide
example : hostModuleCheckGoodParityLinearTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodParityTypes.isAccept = true := by native_decide
example : hostModuleCheckGoodParityTypesTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodParityProgram.isAccept = true := by native_decide
example : hostModuleCheckGoodParityProgramTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodParityEmit.isAccept = true := by native_decide
example : hostModuleCheckGoodParityEmitTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodSelfApply.isAccept = true := by native_decide
example : hostModuleCheckGoodSelfApplyTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitLinear.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitTypes.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitProgram.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitGraph.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitCompose.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitErasure.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitExtract.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitBanner.isAccept = true := by native_decide
example : hostModuleCheckGoodProductOutKernel.isAccept = true := by native_decide
example : hostModuleCheckGoodProductOutKernelTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodBootstrapHonesty.isAccept = true := by native_decide
example : hostModuleCheckGoodBootstrapHonestyTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathWriterSurface.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathWriterSurfaceTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathWriterPathPlan.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathWriterPathPlanTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathWriterPathExec.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathWriterPathExecTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathOwnershipInputs.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathOwnershipInputsTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathPerform.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathPerformTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathPerformStep.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathPerformStepTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathReadSsot.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathReadSsotTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathComposePlan.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathComposePlanTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodCapable.isAccept = true := by native_decide
example : hostModuleCheckGoodCapableTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodCapableStepContract.isAccept = true := by native_decide
example : hostModuleCheckGoodCapableStepContractTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodInstallOut.isAccept = true := by native_decide
example : hostModuleCheckGoodInstallOutTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodOfficialPath.isAccept = true := by native_decide
example : hostModuleCheckGoodOfficialPathTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodPerformEvidence.isAccept = true := by native_decide
example : hostModuleCheckGoodPerformEvidenceTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodCapableRead.isAccept = true := by native_decide
example : hostModuleCheckGoodCapableReadTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodCapableCompose.isAccept = true := by native_decide
example : hostModuleCheckGoodCapableComposeTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodCapableFullBar.isAccept = true := by native_decide
example : hostModuleCheckGoodCapableFullBarTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodDualEqWriteCapableGap.isAccept = true := by native_decide
example : hostModuleCheckGoodDualEqWriteCapableGapTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodDualEqWriteClosePath.isAccept = true := by native_decide
example : hostModuleCheckGoodDualEqWriteClosePathTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodDualEqWriteParity.isAccept = true := by native_decide
example : hostModuleCheckGoodDualEqWriteParityTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodOfficialRetire.isAccept = true := by native_decide
example : hostModuleCheckGoodOfficialRetireTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodOwnershipClaimed.isAccept = true := by native_decide
example : hostModuleCheckGoodOwnershipClaimedTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodPerformClaimed.isAccept = true := by native_decide
example : hostModuleCheckGoodPerformClaimedTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodStepContractFull.isAccept = true := by native_decide
example : hostModuleCheckGoodStepContractFullTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodSelfHostComplete.isAccept = true := by native_decide
example : hostModuleCheckGoodSelfHostCompleteTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodOfficialPathAlternate.isAccept = true := by native_decide
example : hostModuleCheckGoodOfficialPathAlternateTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathOwnershipRegenerate.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathOwnershipRegenerateTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodCapableWriteHcLoad.isAccept = true := by native_decide
example : hostModuleCheckGoodDualEqWriteLoad.isAccept = true := by native_decide
example : hostModuleCheckGoodCapableWriteHc.isAccept = true := by native_decide
example : hostModuleCheckGoodDualEqWriteApi.isAccept = true := by native_decide
example : hostModuleCheckGoodLlvmHold.isAccept = true := by native_decide
example : hostModuleCheckGoodLlvmHoldTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodCapableRegenerate.isAccept = true := by native_decide
example : hostModuleCheckGoodCapableRegenerateTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodFreestandingEmitLoad.isAccept = true := by native_decide
example : hostModuleCheckGoodFreestandingEmitLoadScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodLakeRetireInventory.isAccept = true := by native_decide
example : hostModuleCheckGoodHostPackageRoots.isAccept = true := by native_decide
example : hostModuleCheckGoodFreestandingEmit.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathWriteHc.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathWriteHcTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodCompilePathMult.isAccept = true := by native_decide
example : hostModuleCheckGoodCompilePathLinear.isAccept = true := by native_decide
example : hostModuleCheckGoodCompilePathTypes.isAccept = true := by native_decide
example : hostModuleCheckGoodCompilePathProgram.isAccept = true := by native_decide
example : hostModuleCheckGoodCompilePathGraph.isAccept = true := by native_decide
example : hostModuleCheckGoodCompilePathCompose.isAccept = true := by native_decide
example : hostModuleCheckGoodCompilePathPlan.isAccept = true := by native_decide
example : hostModuleCheckGoodCompilePathApply.isAccept = true := by native_decide
example : hostModuleCheckGoodCompilePathBody.isAccept = true := by native_decide
example : hostModuleCheckGoodCompilePathErasure.isAccept = true := by native_decide
example : hostModuleCheckGoodCompilePathExtract.isAccept = true := by native_decide
example : hostModuleCheckGoodProductWireWriteTool.isAccept = true := by native_decide
example : hostModuleCheckGoodHostTerm.isAccept = true := by native_decide
example : hostModuleCheckGoodLlvmEmitPath.isAccept = true := by native_decide
example : hostModuleCheckGoodSubsetFront.isAccept = true := by native_decide
example : hostModuleCheckGoodFirstSurface.isAccept = true := by native_decide
example : hostModuleCheckGoodLinearSubsetEmit.isAccept = true := by native_decide
example : hostModuleCheckGoodTypesSubsetEmit.isAccept = true := by native_decide
example : hostModuleCheckGoodProgramSubsetEmit.isAccept = true := by native_decide
example : hostModuleCheckGoodGraphSubsetEmit.isAccept = true := by native_decide
example : hostModuleCheckGoodComposeSubsetEmit.isAccept = true := by native_decide
example : hostModuleCheckGoodErasureSubsetEmit.isAccept = true := by native_decide
example : hostModuleCheckGoodExtractSubsetEmit.isAccept = true := by native_decide
example : hostModuleCheckGoodMultSubsetEmit.isAccept = true := by native_decide
example : hostModuleCheckGoodMultSubsetRebuild.isAccept = true := by native_decide
example : hostModuleCheckGoodLinearSubsetRebuild.isAccept = true := by native_decide
example : hostModuleCheckGoodTypesSubsetRebuild.isAccept = true := by native_decide
example : hostModuleCheckGoodProgramSubsetRebuild.isAccept = true := by native_decide
example : hostModuleCheckGoodGraphSubsetRebuild.isAccept = true := by native_decide
example : hostModuleCheckGoodComposeSubsetRebuild.isAccept = true := by native_decide
example : hostModuleCheckGoodErasureSubsetRebuild.isAccept = true := by native_decide
example : hostModuleCheckGoodExtractSubsetRebuild.isAccept = true := by native_decide
example : hostModuleCheckGoodHostFront.isAccept = true := by native_decide
example : hostModuleCheckGoodLlvmMultText.isAccept = true := by native_decide
example : hostModuleCheckGoodHostFrontTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodHostCheck.isAccept = true := by native_decide
example : hostModuleCheckGoodHostGraph.isAccept = true := by native_decide
example : hostModuleCheckGoodLlvmLinearText.isAccept = true := by native_decide
example : hostModuleCheckGoodMultFsWriteTool.isAccept = true := by native_decide
example : hostModuleCheckGoodFrontMultPackage.isAccept = true := by native_decide
example : hostModuleCheckGoodSubsetPackageJoin.isAccept = true := by native_decide
example : hostModuleCheckGoodHostGraphTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodLlvmTypesText.isAccept = true := by native_decide
example : hostModuleCheckGoodMultFsDeepen.isAccept = true := by native_decide
example : hostModuleCheckGoodHostPackageWrite.isAccept = true := by native_decide
example : hostModuleCheckGoodHostPackageWriteTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodLlvmProgramText.isAccept = true := by native_decide
example : hostModuleCheckGoodLlvmGraphText.isAccept = true := by native_decide
example : hostModuleCheckGoodLlvmComposeText.isAccept = true := by native_decide
example : hostModuleCheckGoodSelfApplyFs.isAccept = true := by native_decide
example : hostModuleCheckGoodSelfApplyFsTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodInventoryClose.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathBars.isAccept = true := by native_decide
example : hostModuleCheckGoodInventoryCloseTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPath.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodDualResidual.isAccept = true := by native_decide
example : hostModuleCheckGoodDualResidualTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodProbeWire.isAccept = true := by native_decide
example : hostModuleCheckGoodSelfHostBody.isAccept = true := by native_decide
example : hostModuleCheckGoodProbeWireTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodSelfHostBodyTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodSpecProof.isAccept = true := by native_decide
example : hostModuleCheckGoodSpecProofTheorems.isAccept = true := by native_decide
example :
    hostModuleCheckBadMissingInductive.isRejectWith reasonMissingDecl
      = true := by
  native_decide
example :
    hostModuleCheckBadMissingNamespace.isRejectWith reasonMissingNamespace
      = true := by
  native_decide
example :
    hostModuleCheckBadEmpty.isRejectWith reasonEmptyModule = true := by
  native_decide
example :
    hostModuleCheckBadMissingTheorem.isRejectWith reasonMissingDecl
      = true := by
  native_decide
example : hostModuleCheckGoodMultTerm.isAccept = true := by native_decide
example :
    hostModuleCheckBadMultNameReturnType.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide
example :
    hostModuleCheckBadMultIsValidApp.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide
example :
    hostModuleCheckBadMultIsValidArm.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide
example : hostModuleCheckMultTermSurfaceOk = true := by native_decide
example : hostModuleCheckMultKernelOk = true := by native_decide
example : checkDepthTermSurfaceBar = "TERM-SURFACE" := rfl
example : checkDepthTermSurfaceScope = "Mult-only" := rfl
example : hostModuleCheckTermSurfaceDualOk = true := rfl
example : hostModuleCheckGoodMultTheoremsProof.isAccept = true := by native_decide
example :
    hostModuleCheckBadMultThmWrongStmt.isRejectWith reasonIllTypedProof
      = true := by
  native_decide
example :
    hostModuleCheckBadMultThmSorry.isRejectWith reasonIllTypedProof
      = true := by
  native_decide
example : hostModuleCheckMultProofSurfaceOk = true := by native_decide
example : checkDepthProofSurfaceBar = "PROOF-SURFACE" := rfl
example : checkDepthProofSurfaceScope = "MultTheorems-only" := rfl
example : hostModuleCheckProofSurfaceDualOk = true := rfl
example : hostModuleCheckGoodLinearTerm.isAccept = true := by native_decide
example :
    hostModuleCheckBadLinearShareNatReturnType.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide
example :
    hostModuleCheckBadLinearPolyIdBody.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide
example :
    hostModuleCheckBadLinearMult0ClassId.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide
example :
    hostModuleCheckBadLinearRoundTripBody.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide
example : hostModuleCheckBadLinearShareNatReturnTypeL0Accept = true := by
  native_decide
example : hostModuleCheckBadLinearPolyIdBodyL0Accept = true := by native_decide
example : hostModuleCheckBadLinearMult0ClassIdL0Accept = true := by native_decide
example : hostModuleCheckBadLinearRoundTripBodyL0Accept = true := by native_decide
example : hostModuleCheckLinearTermSurfaceOk = true := by native_decide
example : checkDepthLinearTermSurfaceBar = "TERM-SURFACE" := rfl
example : checkDepthLinearTermSurfaceScope = "Linear-only" := rfl
example : hostModuleCheckLinearTermSurfaceDualOk = true := rfl
example : hostModuleCheckGoodTypesTerm.isAccept = true := by native_decide
example :
    hostModuleCheckBadTypesNameArm.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide
example :
    hostModuleCheckBadTypesExpectedMultArm.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide
example :
    hostModuleCheckBadTypesKindMultOkBody.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide
example :
    hostModuleCheckBadTypesOfKindTagArm.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide
example : hostModuleCheckBadTypesNameArmL0Accept = true := by native_decide
example : hostModuleCheckBadTypesExpectedMultArmL0Accept = true := by
  native_decide
example : hostModuleCheckBadTypesKindMultOkBodyL0Accept = true := by
  native_decide
example : hostModuleCheckBadTypesOfKindTagArmL0Accept = true := by native_decide
example : hostModuleCheckTypesTermSurfaceOk = true := by native_decide
example : checkDepthTypesTermSurfaceBar = "TERM-SURFACE" := rfl
example : checkDepthTypesTermSurfaceScope = "Types-only" := rfl
example : hostModuleCheckTypesTermSurfaceDualOk = true := rfl

example : hostModuleCheckGoodIrProgramTerm.isAccept = true := by native_decide
example : hostModuleCheckBadIrProgramCap.isRejectWith reasonIllTypedTerm = true := by native_decide
example : hostModuleCheckIrProgramTermSurfaceOk = true := by native_decide
example : checkDepthIrProgramTermSurfaceBar = "TERM-SURFACE" := rfl
example : checkDepthIrProgramTermSurfaceScope = "IrProgram-only" := rfl
example : hostModuleCheckIrProgramTermSurfaceDualOk = true := rfl


end SystemsLean.HostModuleCheck
