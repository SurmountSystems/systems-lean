/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckDriver.lean bytes, second half.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckDriverSource01. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckDriver.lean only, second half.
  Do not steal a neighbor checker.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKDRIVER,
  liveHostModuleCheckDriverSource1, HOST-FRONT-LIVE-HOSTMODULECHECKDRIVER,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckDriverSource01
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckDriver

/-- Dual-pinned live HostModuleCheckDriver.lean bytes, second half.
    Concatenate liveHostModuleCheckDriverSource0 then
    liveHostModuleCheckDriverSource1 before parse.
    Greppable: liveHostModuleCheckDriverSource1,
    PARSE-LIVE-HOSTMODULECHECKDRIVER. -/
def liveHostModuleCheckDriverSource1 : String := r#"    IO.eprintln s!"error: {stageId} ParityMult good fixture must accept"
    throw (IO.userError "ParityMult good")
  unless hostModuleCheckGoodParityMultTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ParityMultTheorems good fixture must accept"
    throw (IO.userError "ParityMultTheorems good")
  unless hostModuleCheckGoodParityLinear.isAccept do
    IO.eprintln s!"error: {stageId} ParityLinear good fixture must accept"
    throw (IO.userError "ParityLinear good")
  unless hostModuleCheckGoodParityLinearTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ParityLinearTheorems good fixture must accept"
    throw (IO.userError "ParityLinearTheorems good")
  unless hostModuleCheckGoodParityTypes.isAccept do
    IO.eprintln s!"error: {stageId} ParityTypes good fixture must accept"
    throw (IO.userError "ParityTypes good")
  unless hostModuleCheckGoodParityTypesTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ParityTypesTheorems good fixture must accept"
    throw (IO.userError "ParityTypesTheorems good")
  unless hostModuleCheckGoodParityProgram.isAccept do
    IO.eprintln s!"error: {stageId} ParityProgram good fixture must accept"
    throw (IO.userError "ParityProgram good")
  unless hostModuleCheckGoodParityProgramTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ParityProgramTheorems good fixture must accept"
    throw (IO.userError "ParityProgramTheorems good")
  unless hostModuleCheckGoodParityEmit.isAccept do
    IO.eprintln s!"error: {stageId} ParityEmit good fixture must accept"
    throw (IO.userError "ParityEmit good")
  unless hostModuleCheckGoodParityEmitTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ParityEmitTheorems good fixture must accept"
    throw (IO.userError "ParityEmitTheorems good")
  unless hostModuleCheckGoodSelfApply.isAccept do
    IO.eprintln s!"error: {stageId} SelfApply good fixture must accept"
    throw (IO.userError "SelfApply good")
  unless hostModuleCheckGoodSelfApplyTheorems.isAccept do
    IO.eprintln s!"error: {stageId} SelfApplyTheorems good fixture must accept"
    throw (IO.userError "SelfApplyTheorems good")
  unless hostModuleCheckGoodEmitLinear.isAccept do
    IO.eprintln s!"error: {stageId} EmitLinear good fixture must accept"
    throw (IO.userError "EmitLinear good")
  unless hostModuleCheckGoodEmitTypes.isAccept do
    IO.eprintln s!"error: {stageId} EmitTypes good fixture must accept"
    throw (IO.userError "EmitTypes good")
  unless hostModuleCheckGoodEmitProgram.isAccept do
    IO.eprintln s!"error: {stageId} EmitProgram good fixture must accept"
    throw (IO.userError "EmitProgram good")
  unless hostModuleCheckGoodEmitGraph.isAccept do
    IO.eprintln s!"error: {stageId} EmitGraph good fixture must accept"
    throw (IO.userError "EmitGraph good")
  unless hostModuleCheckGoodEmitCompose.isAccept do
    IO.eprintln s!"error: {stageId} EmitCompose good fixture must accept"
    throw (IO.userError "EmitCompose good")
  unless hostModuleCheckGoodEmitErasure.isAccept do
    IO.eprintln s!"error: {stageId} EmitErasure good fixture must accept"
    throw (IO.userError "EmitErasure good")
  unless hostModuleCheckGoodEmitExtract.isAccept do
    IO.eprintln s!"error: {stageId} EmitExtract good fixture must accept"
    throw (IO.userError "EmitExtract good")
  unless hostModuleCheckGoodEmitBanner.isAccept do
    IO.eprintln s!"error: {stageId} EmitBanner good fixture must accept"
    throw (IO.userError "EmitBanner good")
  unless hostModuleCheckGoodProductOutKernel.isAccept do
    IO.eprintln s!"error: {stageId} ProductOutKernel good fixture must accept"
    throw (IO.userError "ProductOutKernel good")
  unless hostModuleCheckGoodProductOutKernelTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductOutKernelTheorems good fixture must accept"
    throw (IO.userError "ProductOutKernelTheorems good")
  unless hostModuleCheckGoodBootstrapHonesty.isAccept do
    IO.eprintln s!"error: {stageId} BootstrapHonesty good fixture must accept"
    throw (IO.userError "BootstrapHonesty good")
  unless hostModuleCheckGoodBootstrapHonestyTheorems.isAccept do
    IO.eprintln s!"error: {stageId} BootstrapHonestyTheorems good fixture must accept"
    throw (IO.userError "BootstrapHonestyTheorems good")
  unless hostModuleCheckGoodProductPathWriterSurface.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathWriterSurface good fixture must accept"
    throw (IO.userError "ProductPathWriterSurface good")
  unless hostModuleCheckGoodProductPathWriterSurfaceTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathWriterSurfaceTheorems good fixture must accept"
    throw (IO.userError "ProductPathWriterSurfaceTheorems good")
  unless hostModuleCheckGoodProductPathWriterPathPlan.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathWriterPathPlan good fixture must accept"
    throw (IO.userError "ProductPathWriterPathPlan good")
  unless hostModuleCheckGoodProductPathWriterPathPlanTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathWriterPathPlanTheorems good fixture must accept"
    throw (IO.userError "ProductPathWriterPathPlanTheorems good")
  unless hostModuleCheckGoodProductPathWriterPathExec.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathWriterPathExec good fixture must accept"
    throw (IO.userError "ProductPathWriterPathExec good")
  unless hostModuleCheckGoodProductPathWriterPathExecTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathWriterPathExecTheorems good fixture must accept"
    throw (IO.userError "ProductPathWriterPathExecTheorems good")
  unless hostModuleCheckGoodProductPathOwnershipInputs.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathOwnershipInputs good fixture must accept"
    throw (IO.userError "ProductPathOwnershipInputs good")
  unless hostModuleCheckGoodProductPathOwnershipInputsTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathOwnershipInputsTheorems good fixture must accept"
    throw (IO.userError "ProductPathOwnershipInputsTheorems good")
  unless hostModuleCheckGoodProductPathPerform.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathPerform good fixture must accept"
    throw (IO.userError "ProductPathPerform good")
  unless hostModuleCheckGoodProductPathPerformTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathPerformTheorems good fixture must accept"
    throw (IO.userError "ProductPathPerformTheorems good")
  unless hostModuleCheckGoodProductPathPerformStep.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathPerformStep good fixture must accept"
    throw (IO.userError "ProductPathPerformStep good")
  unless hostModuleCheckGoodProductPathPerformStepTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathPerformStepTheorems good fixture must accept"
    throw (IO.userError "ProductPathPerformStepTheorems good")
  unless hostModuleCheckGoodProductPathReadSsot.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathReadSsot good fixture must accept"
    throw (IO.userError "ProductPathReadSsot good")
  unless hostModuleCheckGoodProductPathReadSsotTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathReadSsotTheorems good fixture must accept"
    throw (IO.userError "ProductPathReadSsotTheorems good")
  unless hostModuleCheckGoodProductPathComposePlan.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathComposePlan good fixture must accept"
    throw (IO.userError "ProductPathComposePlan good")
  unless hostModuleCheckGoodProductPathComposePlanTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathComposePlanTheorems good fixture must accept"
    throw (IO.userError "ProductPathComposePlanTheorems good")
  unless hostModuleCheckGoodCapable.isAccept do
    IO.eprintln s!"error: {stageId} Capable good fixture must accept"
    throw (IO.userError "Capable good")
  unless hostModuleCheckGoodCapableTheorems.isAccept do
    IO.eprintln s!"error: {stageId} CapableTheorems good fixture must accept"
    throw (IO.userError "CapableTheorems good")
  unless hostModuleCheckGoodCapableStepContract.isAccept do
    IO.eprintln s!"error: {stageId} CapableStepContract good fixture must accept"
    throw (IO.userError "CapableStepContract good")
  unless hostModuleCheckGoodCapableStepContractTheorems.isAccept do
    IO.eprintln s!"error: {stageId} CapableStepContractTheorems good fixture must accept"
    throw (IO.userError "CapableStepContractTheorems good")
  unless hostModuleCheckGoodInstallOut.isAccept do
    IO.eprintln s!"error: {stageId} InstallOut good fixture must accept"
    throw (IO.userError "InstallOut good")
  unless hostModuleCheckGoodInstallOutTheorems.isAccept do
    IO.eprintln s!"error: {stageId} InstallOutTheorems good fixture must accept"
    throw (IO.userError "InstallOutTheorems good")
  unless hostModuleCheckGoodOfficialPath.isAccept do
    IO.eprintln s!"error: {stageId} OfficialPath good fixture must accept"
    throw (IO.userError "OfficialPath good")
  unless hostModuleCheckGoodOfficialPathTheorems.isAccept do
    IO.eprintln s!"error: {stageId} OfficialPathTheorems good fixture must accept"
    throw (IO.userError "OfficialPathTheorems good")
  unless hostModuleCheckGoodPerformEvidence.isAccept do
    IO.eprintln s!"error: {stageId} PerformEvidence good fixture must accept"
    throw (IO.userError "PerformEvidence good")
  unless hostModuleCheckGoodPerformEvidenceTheorems.isAccept do
    IO.eprintln s!"error: {stageId} PerformEvidenceTheorems good fixture must accept"
    throw (IO.userError "PerformEvidenceTheorems good")
  unless hostModuleCheckGoodCapableRead.isAccept do
    IO.eprintln s!"error: {stageId} CapableRead good fixture must accept"
    throw (IO.userError "CapableRead good")
  unless hostModuleCheckGoodCapableReadTheorems.isAccept do
    IO.eprintln s!"error: {stageId} CapableReadTheorems good fixture must accept"
    throw (IO.userError "CapableReadTheorems good")
  unless hostModuleCheckGoodCapableCompose.isAccept do
    IO.eprintln s!"error: {stageId} CapableCompose good fixture must accept"
    throw (IO.userError "CapableCompose good")
  unless hostModuleCheckGoodCapableComposeTheorems.isAccept do
    IO.eprintln s!"error: {stageId} CapableComposeTheorems good fixture must accept"
    throw (IO.userError "CapableComposeTheorems good")
  unless hostModuleCheckGoodCapableFullBar.isAccept do
    IO.eprintln s!"error: {stageId} CapableFullBar good fixture must accept"
    throw (IO.userError "CapableFullBar good")
  unless hostModuleCheckGoodCapableFullBarTheorems.isAccept do
    IO.eprintln s!"error: {stageId} CapableFullBarTheorems good fixture must accept"
    throw (IO.userError "CapableFullBarTheorems good")
  unless hostModuleCheckGoodDualEqWriteCapableGap.isAccept do
    IO.eprintln s!"error: {stageId} DualEqWriteCapableGap good fixture must accept"
    throw (IO.userError "DualEqWriteCapableGap good")
  unless hostModuleCheckGoodDualEqWriteCapableGapTheorems.isAccept do
    IO.eprintln s!"error: {stageId} DualEqWriteCapableGapTheorems good fixture must accept"
    throw (IO.userError "DualEqWriteCapableGapTheorems good")
  unless hostModuleCheckGoodDualEqWriteClosePath.isAccept do
    IO.eprintln s!"error: {stageId} DualEqWriteClosePath good fixture must accept"
    throw (IO.userError "DualEqWriteClosePath good")
  unless hostModuleCheckGoodDualEqWriteClosePathTheorems.isAccept do
    IO.eprintln s!"error: {stageId} DualEqWriteClosePathTheorems good fixture must accept"
    throw (IO.userError "DualEqWriteClosePathTheorems good")
  unless hostModuleCheckGoodDualEqWriteParity.isAccept do
    IO.eprintln s!"error: {stageId} DualEqWriteParity good fixture must accept"
    throw (IO.userError "DualEqWriteParity good")
  unless hostModuleCheckGoodDualEqWriteParityTheorems.isAccept do
    IO.eprintln s!"error: {stageId} DualEqWriteParityTheorems good fixture must accept"
    throw (IO.userError "DualEqWriteParityTheorems good")
  unless hostModuleCheckGoodOfficialRetire.isAccept do
    IO.eprintln s!"error: {stageId} OfficialRetire good fixture must accept"
    throw (IO.userError "OfficialRetire good")
  unless hostModuleCheckGoodOfficialRetireTheorems.isAccept do
    IO.eprintln s!"error: {stageId} OfficialRetireTheorems good fixture must accept"
    throw (IO.userError "OfficialRetireTheorems good")
  unless hostModuleCheckGoodOwnershipClaimed.isAccept do
    IO.eprintln s!"error: {stageId} OwnershipClaimed good fixture must accept"
    throw (IO.userError "OwnershipClaimed good")
  unless hostModuleCheckGoodOwnershipClaimedTheorems.isAccept do
    IO.eprintln s!"error: {stageId} OwnershipClaimedTheorems good fixture must accept"
    throw (IO.userError "OwnershipClaimedTheorems good")
  unless hostModuleCheckGoodPerformClaimed.isAccept do
    IO.eprintln s!"error: {stageId} PerformClaimed good fixture must accept"
    throw (IO.userError "PerformClaimed good")
  unless hostModuleCheckGoodPerformClaimedTheorems.isAccept do
    IO.eprintln s!"error: {stageId} PerformClaimedTheorems good fixture must accept"
    throw (IO.userError "PerformClaimedTheorems good")
  unless hostModuleCheckGoodStepContractFull.isAccept do
    IO.eprintln s!"error: {stageId} StepContractFull good fixture must accept"
    throw (IO.userError "StepContractFull good")
  unless hostModuleCheckGoodStepContractFullTheorems.isAccept do
    IO.eprintln s!"error: {stageId} StepContractFullTheorems good fixture must accept"
    throw (IO.userError "StepContractFullTheorems good")
  unless hostModuleCheckGoodSelfHostComplete.isAccept do
    IO.eprintln s!"error: {stageId} SelfHostComplete good fixture must accept"
    throw (IO.userError "SelfHostComplete good")
  unless hostModuleCheckGoodSelfHostCompleteTheorems.isAccept do
    IO.eprintln s!"error: {stageId} SelfHostCompleteTheorems good fixture must accept"
    throw (IO.userError "SelfHostCompleteTheorems good")
  unless hostModuleCheckGoodOfficialPathAlternate.isAccept do
    IO.eprintln s!"error: {stageId} OfficialPathAlternate good fixture must accept"
    throw (IO.userError "OfficialPathAlternate good")
  unless hostModuleCheckGoodOfficialPathAlternateTheorems.isAccept do
    IO.eprintln s!"error: {stageId} OfficialPathAlternateTheorems good fixture must accept"
    throw (IO.userError "OfficialPathAlternateTheorems good")
  unless hostModuleCheckGoodProductPathOwnershipRegenerate.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathOwnershipRegenerate good fixture must accept"
    throw (IO.userError "ProductPathOwnershipRegenerate good")
  unless hostModuleCheckGoodProductPathOwnershipRegenerateTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathOwnershipRegenerateTheorems good fixture must accept"
    throw (IO.userError "ProductPathOwnershipRegenerateTheorems good")
  unless hostModuleCheckGoodCapableWriteHcLoad.isAccept do
    IO.eprintln s!"error: {stageId} CapableWriteHcLoad good fixture must accept"
    throw (IO.userError "CapableWriteHcLoad good")
  unless hostModuleCheckGoodDualEqWriteLoad.isAccept do
    IO.eprintln s!"error: {stageId} DualEqWriteLoad good fixture must accept"
    throw (IO.userError "DualEqWriteLoad good")
  unless hostModuleCheckGoodCapableWriteHc.isAccept do
    IO.eprintln s!"error: {stageId} CapableWriteHc good fixture must accept"
    throw (IO.userError "CapableWriteHc good")
  unless hostModuleCheckGoodDualEqWriteApi.isAccept do
    IO.eprintln s!"error: {stageId} DualEqWriteApi good fixture must accept"
    throw (IO.userError "DualEqWriteApi good")
  unless hostModuleCheckGoodLlvmHold.isAccept do
    IO.eprintln s!"error: {stageId} LlvmHold good fixture must accept"
    throw (IO.userError "LlvmHold good")
  unless hostModuleCheckGoodLlvmHoldTheorems.isAccept do
    IO.eprintln s!"error: {stageId} LlvmHoldTheorems good fixture must accept"
    throw (IO.userError "LlvmHoldTheorems good")
  unless hostModuleCheckGoodCapableRegenerate.isAccept do
    IO.eprintln s!"error: {stageId} CapableRegenerate good fixture must accept"
    throw (IO.userError "CapableRegenerate good")
  unless hostModuleCheckGoodCapableRegenerateTheorems.isAccept do
    IO.eprintln s!"error: {stageId} CapableRegenerateTheorems good fixture must accept"
    throw (IO.userError "CapableRegenerateTheorems good")
  unless hostModuleCheckGoodFreestandingEmitLoad.isAccept do
    IO.eprintln s!"error: {stageId} FreestandingEmitLoad good fixture must accept"
    throw (IO.userError "FreestandingEmitLoad good")
  unless hostModuleCheckGoodFreestandingEmitLoadScaffold.isAccept do
    IO.eprintln s!"error: {stageId} FreestandingEmitLoadScaffold good fixture must accept"
    throw (IO.userError "FreestandingEmitLoadScaffold good")
  unless hostModuleCheckGoodLakeRetireInventory.isAccept do
    IO.eprintln s!"error: {stageId} LakeRetireInventory good fixture must accept"
    throw (IO.userError "LakeRetireInventory good")
  unless hostModuleCheckGoodHostPackageRoots.isAccept do
    IO.eprintln s!"error: {stageId} HostPackageRoots good fixture must accept"
    throw (IO.userError "HostPackageRoots good")
  unless hostModuleCheckGoodFreestandingEmit.isAccept do
    IO.eprintln s!"error: {stageId} FreestandingEmit good fixture must accept"
    throw (IO.userError "FreestandingEmit good")
  unless hostModuleCheckGoodProductPathWriteHc.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathWriteHc good fixture must accept"
    throw (IO.userError "ProductPathWriteHc good")
  unless hostModuleCheckGoodProductPathWriteHcTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathWriteHcTheorems good fixture must accept"
    throw (IO.userError "ProductPathWriteHcTheorems good")
  unless hostModuleCheckGoodCompilePathMult.isAccept do
    IO.eprintln s!"error: {stageId} CompilePathMult good fixture must accept"
    throw (IO.userError "CompilePathMult good")
  unless hostModuleCheckGoodCompilePathLinear.isAccept do
    IO.eprintln s!"error: {stageId} CompilePathLinear good fixture must accept"
    throw (IO.userError "CompilePathLinear good")
  unless hostModuleCheckGoodCompilePathTypes.isAccept do
    IO.eprintln s!"error: {stageId} CompilePathTypes good fixture must accept"
    throw (IO.userError "CompilePathTypes good")
  unless hostModuleCheckGoodCompilePathProgram.isAccept do
    IO.eprintln s!"error: {stageId} CompilePathProgram good fixture must accept"
    throw (IO.userError "CompilePathProgram good")
  unless hostModuleCheckGoodCompilePathGraph.isAccept do
    IO.eprintln s!"error: {stageId} CompilePathGraph good fixture must accept"
    throw (IO.userError "CompilePathGraph good")
  unless hostModuleCheckGoodCompilePathCompose.isAccept do
    IO.eprintln s!"error: {stageId} CompilePathCompose good fixture must accept"
    throw (IO.userError "CompilePathCompose good")
  unless hostModuleCheckGoodCompilePathPlan.isAccept do
    IO.eprintln s!"error: {stageId} CompilePathPlan good fixture must accept"
    throw (IO.userError "CompilePathPlan good")
  unless hostModuleCheckGoodCompilePathApply.isAccept do
    IO.eprintln s!"error: {stageId} CompilePathApply good fixture must accept"
    throw (IO.userError "CompilePathApply good")
  unless hostModuleCheckGoodCompilePathBody.isAccept do
    IO.eprintln s!"error: {stageId} CompilePathBody good fixture must accept"
    throw (IO.userError "CompilePathBody good")
  unless hostModuleCheckGoodCompilePathErasure.isAccept do
    IO.eprintln s!"error: {stageId} CompilePathErasure good fixture must accept"
    throw (IO.userError "CompilePathErasure good")
  unless hostModuleCheckGoodCompilePathExtract.isAccept do
    IO.eprintln s!"error: {stageId} CompilePathExtract good fixture must accept"
    throw (IO.userError "CompilePathExtract good")
  unless hostModuleCheckGoodProductWireWriteTool.isAccept do
    IO.eprintln s!"error: {stageId} ProductWireWriteTool good fixture must accept"
    throw (IO.userError "ProductWireWriteTool good")
  unless hostModuleCheckGoodHostTerm.isAccept do
    IO.eprintln s!"error: {stageId} HostTerm good fixture must accept"
    throw (IO.userError "HostTerm good")
  unless hostModuleCheckGoodLlvmEmitPath.isAccept do
    IO.eprintln s!"error: {stageId} LlvmEmitPath good fixture must accept"
    throw (IO.userError "LlvmEmitPath good")
  unless hostModuleCheckGoodSubsetFront.isAccept do
    IO.eprintln s!"error: {stageId} SubsetFront good fixture must accept"
    throw (IO.userError "SubsetFront good")
  unless hostModuleCheckGoodFirstSurface.isAccept do
    IO.eprintln s!"error: {stageId} FirstSurface good fixture must accept"
    throw (IO.userError "FirstSurface good")
  unless hostModuleCheckGoodLinearSubsetEmit.isAccept do
    IO.eprintln s!"error: {stageId} LinearSubsetEmit good fixture must accept"
    throw (IO.userError "LinearSubsetEmit good")
  unless hostModuleCheckGoodTypesSubsetEmit.isAccept do
    IO.eprintln s!"error: {stageId} TypesSubsetEmit good fixture must accept"
    throw (IO.userError "TypesSubsetEmit good")
  unless hostModuleCheckGoodProgramSubsetEmit.isAccept do
    IO.eprintln s!"error: {stageId} ProgramSubsetEmit good fixture must accept"
    throw (IO.userError "ProgramSubsetEmit good")
  unless hostModuleCheckGoodGraphSubsetEmit.isAccept do
    IO.eprintln s!"error: {stageId} GraphSubsetEmit good fixture must accept"
    throw (IO.userError "GraphSubsetEmit good")
  unless hostModuleCheckGoodComposeSubsetEmit.isAccept do
    IO.eprintln s!"error: {stageId} ComposeSubsetEmit good fixture must accept"
    throw (IO.userError "ComposeSubsetEmit good")
  unless hostModuleCheckGoodErasureSubsetEmit.isAccept do
    IO.eprintln s!"error: {stageId} ErasureSubsetEmit good fixture must accept"
    throw (IO.userError "ErasureSubsetEmit good")
  unless hostModuleCheckGoodExtractSubsetEmit.isAccept do
    IO.eprintln s!"error: {stageId} ExtractSubsetEmit good fixture must accept"
    throw (IO.userError "ExtractSubsetEmit good")
  unless hostModuleCheckGoodMultSubsetEmit.isAccept do
    IO.eprintln s!"error: {stageId} MultSubsetEmit good fixture must accept"
    throw (IO.userError "MultSubsetEmit good")
  unless hostModuleCheckGoodMultSubsetRebuild.isAccept do
    IO.eprintln s!"error: {stageId} MultSubsetRebuild good fixture must accept"
    throw (IO.userError "MultSubsetRebuild good")
  unless hostModuleCheckGoodLinearSubsetRebuild.isAccept do
    IO.eprintln s!"error: {stageId} LinearSubsetRebuild good fixture must accept"
    throw (IO.userError "LinearSubsetRebuild good")
  unless hostModuleCheckGoodTypesSubsetRebuild.isAccept do
    IO.eprintln s!"error: {stageId} TypesSubsetRebuild good fixture must accept"
    throw (IO.userError "TypesSubsetRebuild good")
  unless hostModuleCheckGoodProgramSubsetRebuild.isAccept do
    IO.eprintln s!"error: {stageId} ProgramSubsetRebuild good fixture must accept"
    throw (IO.userError "ProgramSubsetRebuild good")
  unless hostModuleCheckGoodGraphSubsetRebuild.isAccept do
    IO.eprintln s!"error: {stageId} GraphSubsetRebuild good fixture must accept"
    throw (IO.userError "GraphSubsetRebuild good")
  unless hostModuleCheckGoodComposeSubsetRebuild.isAccept do
    IO.eprintln s!"error: {stageId} ComposeSubsetRebuild good fixture must accept"
    throw (IO.userError "ComposeSubsetRebuild good")
  unless hostModuleCheckGoodErasureSubsetRebuild.isAccept do
    IO.eprintln s!"error: {stageId} ErasureSubsetRebuild good fixture must accept"
    throw (IO.userError "ErasureSubsetRebuild good")
  unless hostModuleCheckGoodExtractSubsetRebuild.isAccept do
    IO.eprintln s!"error: {stageId} ExtractSubsetRebuild good fixture must accept"
    throw (IO.userError "ExtractSubsetRebuild good")
  unless hostModuleCheckGoodHostFront.isAccept do
    IO.eprintln s!"error: {stageId} HostFront good fixture must accept"
    throw (IO.userError "HostFront good")
  unless hostModuleCheckGoodLlvmMultText.isAccept do
    IO.eprintln s!"error: {stageId} LlvmMultText good fixture must accept"
    throw (IO.userError "LlvmMultText good")
  unless hostModuleCheckGoodHostFrontTheorems.isAccept do
    IO.eprintln s!"error: {stageId} HostFrontTheorems good fixture must accept"
    throw (IO.userError "HostFrontTheorems good")
  unless hostModuleCheckGoodHostCheck.isAccept do
    IO.eprintln s!"error: {stageId} HostCheck good fixture must accept"
    throw (IO.userError "HostCheck good")
  unless hostModuleCheckGoodHostGraph.isAccept do
    IO.eprintln s!"error: {stageId} HostGraph good fixture must accept"
    throw (IO.userError "HostGraph good")
  unless hostModuleCheckGoodLlvmLinearText.isAccept do
    IO.eprintln s!"error: {stageId} LlvmLinearText good fixture must accept"
    throw (IO.userError "LlvmLinearText good")
  unless hostModuleCheckGoodMultFsWriteTool.isAccept do
    IO.eprintln s!"error: {stageId} MultFsWriteTool good fixture must accept"
    throw (IO.userError "MultFsWriteTool good")
  unless hostModuleCheckGoodFrontMultPackage.isAccept do
    IO.eprintln s!"error: {stageId} FrontMultPackage good fixture must accept"
    throw (IO.userError "FrontMultPackage good")
  unless hostModuleCheckGoodSubsetPackageJoin.isAccept do
    IO.eprintln s!"error: {stageId} SubsetPackageJoin good fixture must accept"
    throw (IO.userError "SubsetPackageJoin good")
  unless hostModuleCheckGoodHostGraphTheorems.isAccept do
    IO.eprintln s!"error: {stageId} HostGraphTheorems good fixture must accept"
    throw (IO.userError "HostGraphTheorems good")
  unless hostModuleCheckGoodLlvmTypesText.isAccept do
    IO.eprintln s!"error: {stageId} LlvmTypesText good fixture must accept"
    throw (IO.userError "LlvmTypesText good")
  unless hostModuleCheckGoodMultFsDeepen.isAccept do
    IO.eprintln s!"error: {stageId} MultFsDeepen good fixture must accept"
    throw (IO.userError "MultFsDeepen good")
  unless hostModuleCheckGoodHostPackageWrite.isAccept do
    IO.eprintln s!"error: {stageId} HostPackageWrite good fixture must accept"
    throw (IO.userError "HostPackageWrite good")
  unless hostModuleCheckGoodHostPackageWriteTheorems.isAccept do
    IO.eprintln s!"error: {stageId} HostPackageWriteTheorems good fixture must accept"
    throw (IO.userError "HostPackageWriteTheorems good")
  unless hostModuleCheckGoodLlvmProgramText.isAccept do
    IO.eprintln s!"error: {stageId} LlvmProgramText good fixture must accept"
    throw (IO.userError "LlvmProgramText good")
  unless hostModuleCheckGoodLlvmGraphText.isAccept do
    IO.eprintln s!"error: {stageId} LlvmGraphText good fixture must accept"
    throw (IO.userError "LlvmGraphText good")
  unless hostModuleCheckGoodLlvmComposeText.isAccept do
    IO.eprintln s!"error: {stageId} LlvmComposeText good fixture must accept"
    throw (IO.userError "LlvmComposeText good")
  unless hostModuleCheckGoodSelfApplyFs.isAccept do
    IO.eprintln s!"error: {stageId} SelfApplyFs good fixture must accept"
    throw (IO.userError "SelfApplyFs good")
  unless hostModuleCheckGoodSelfApplyFsTheorems.isAccept do
    IO.eprintln s!"error: {stageId} SelfApplyFsTheorems good fixture must accept"
    throw (IO.userError "SelfApplyFsTheorems good")
  unless hostModuleCheckGoodInventoryClose.isAccept do
    IO.eprintln s!"error: {stageId} InventoryClose good fixture must accept"
    throw (IO.userError "InventoryClose good")
  unless hostModuleCheckGoodProductPathBars.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathBars good fixture must accept"
    throw (IO.userError "ProductPathBars good")
  unless hostModuleCheckGoodInventoryCloseTheorems.isAccept do
    IO.eprintln s!"error: {stageId} InventoryCloseTheorems good fixture must accept"
    throw (IO.userError "InventoryCloseTheorems good")
  unless hostModuleCheckGoodProductPath.isAccept do
    IO.eprintln s!"error: {stageId} ProductPath good fixture must accept"
    throw (IO.userError "ProductPath good")
  unless hostModuleCheckGoodProductPathTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathTheorems good fixture must accept"
    throw (IO.userError "ProductPathTheorems good")
  unless hostModuleCheckGoodDualResidual.isAccept do
    IO.eprintln s!"error: {stageId} DualResidual good fixture must accept"
    throw (IO.userError "DualResidual good")
  unless hostModuleCheckGoodDualResidualTheorems.isAccept do
    IO.eprintln s!"error: {stageId} DualResidualTheorems good fixture must accept"
    throw (IO.userError "DualResidualTheorems good")
  unless hostModuleCheckGoodProbeWire.isAccept do
    IO.eprintln s!"error: {stageId} ProbeWire good fixture must accept"
    throw (IO.userError "ProbeWire good")
  unless hostModuleCheckGoodSelfHostBody.isAccept do
    IO.eprintln s!"error: {stageId} SelfHostBody good fixture must accept"
    throw (IO.userError "SelfHostBody good")
  unless hostModuleCheckGoodProbeWireTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProbeWireTheorems good fixture must accept"
    throw (IO.userError "ProbeWireTheorems good")
  unless hostModuleCheckGoodSelfHostBodyTheorems.isAccept do
    IO.eprintln s!"error: {stageId} SelfHostBodyTheorems good fixture must accept"
    throw (IO.userError "SelfHostBodyTheorems good")
  unless hostModuleCheckGoodSpecProof.isAccept do
    IO.eprintln s!"error: {stageId} SpecProof good fixture must accept"
    throw (IO.userError "SpecProof good")
  unless hostModuleCheckGoodSpecProofTheorems.isAccept do
    IO.eprintln s!"error: {stageId} SpecProofTheorems good fixture must accept"
    throw (IO.userError "SpecProofTheorems good")
  IO.println s!"  failClosed: {reasonMissingDecl} + {reasonMissingNamespace} + {reasonEmptyModule} ok"
  -- On-disk Mult..Compose+Erasure/Extract+CompilePath/Kernel+*Theorems seed walk.
  IO.println "  modules:"
  let surfs <- loadMultModuleCheck root
  for surf in surfs do
    printSurface surf
  unless surfs.length == hostModuleCheckSeedModules.length do
    IO.eprintln s!"error: {stageId} expected {hostModuleCheckSeedModules.length} modules got {surfs.length}"
    throw (IO.userError "seed count")
  IO.println s!"GREEN {stageId}: seed {seedLabel} modules={surfs.length}; expand={hostModuleCheckExpandSliceName}; depth={checkDepthPartial}; deepen={checkDepthDeepenSliceName} bar={checkDepthDeepenBar}; withoutLake finished; host residual remains"

/-- CLI: first real host module check. Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runModuleCheck root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckDriver
