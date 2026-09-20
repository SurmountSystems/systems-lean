/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck structural LoadOk dual-pin fold.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split: hostModuleCheckLoadOk good/bad dual-pin fold (maxRecDepth) from HostModuleCheck tip.
  Later TERM SurfaceOk (EmitPlan through Host fragment check) lives in
  HostModuleCheckLoadOkLaterTerm.
  Same namespace SystemsLean.HostModuleCheck so names stay unqualified.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckLoadOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, Host library seed expand continue,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckLoadOk
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckLoadOk;
  lake build SystemsLean.HostModuleCheck.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSeeds
import SystemsLean.HostModuleCheckAccepts
import SystemsLean.HostModuleCheckMultKernel
import SystemsLean.HostModuleCheckPackageElab
import SystemsLean.HostModuleCheckPackageEnv
import SystemsLean.HostModuleCheckPackageEnvEvidence
import SystemsLean.HostModuleCheckLoadOkLaterTerm
import SystemsLean.HostModuleCheckKernelMultProof
import SystemsLean.HostModuleCheckKernelLinearProof
import SystemsLean.HostModuleCheckKernelTypesProof
import SystemsLean.HostModuleCheckKernelProgramProof
import SystemsLean.HostModuleCheckKernelEmitProof

namespace SystemsLean.HostModuleCheck

set_option maxRecDepth 16384
set_option maxHeartbeats 800000

/-- Structural expand seed dual-pin holds (good accept + fail-closed bads).
    Greppable: hostModuleCheckLoadOk. -/
def hostModuleCheckLoadOk : Bool :=
  hostModuleCheckGoodMult.isAccept
    && hostModuleCheckGoodMultTheorems.isAccept
    && hostModuleCheckGoodLinear.isAccept
    && hostModuleCheckGoodLinearTheorems.isAccept
    && hostModuleCheckGoodTypes.isAccept
    && hostModuleCheckGoodTypesTheorems.isAccept
    && hostModuleCheckGoodIrProgram.isAccept
    && hostModuleCheckGoodIrProgramTheorems.isAccept
    && hostModuleCheckGoodIrGraph.isAccept
    && hostModuleCheckGoodIrGraphTheorems.isAccept
    && hostModuleCheckGoodHostCompose.isAccept
    && hostModuleCheckGoodHostComposeTheorems.isAccept
    && hostModuleCheckGoodErasure.isAccept
    && hostModuleCheckGoodErasureTheorems.isAccept
    && hostModuleCheckGoodExtract.isAccept
    && hostModuleCheckGoodExtractTheorems.isAccept
    && hostModuleCheckGoodCompilePath.isAccept
    && hostModuleCheckGoodKernelMult.isAccept
    && hostModuleCheckGoodKernelLinear.isAccept
    && hostModuleCheckGoodKernelTypes.isAccept
    && hostModuleCheckGoodKernelProgram.isAccept
    && hostModuleCheckGoodKernelMultTheorems.isAccept
    && hostModuleCheckGoodKernelLinearTheorems.isAccept
    && hostModuleCheckGoodKernelTypesTheorems.isAccept
    && hostModuleCheckGoodKernelProgramTheorems.isAccept
    && hostModuleCheckGoodJoinMap.isAccept
    && hostModuleCheckGoodJoinMapTheorems.isAccept
    && hostModuleCheckGoodSelfHost.isAccept
    && hostModuleCheckGoodSelfHostTheorems.isAccept
    && hostModuleCheckGoodSurfaceMatrix.isAccept
    && hostModuleCheckGoodSurfaceMatrixTheorems.isAccept
    && hostModuleCheckGoodEmitMultScaffold.isAccept
    && hostModuleCheckGoodEmitLinearScaffold.isAccept
    && hostModuleCheckGoodEmitTypesScaffold.isAccept
    && hostModuleCheckGoodEmitProgramScaffold.isAccept
    && hostModuleCheckGoodEmitGraphScaffold.isAccept
    && hostModuleCheckGoodEmitComposeScaffold.isAccept
    && hostModuleCheckGoodEmitPlanScaffold.isAccept
    && hostModuleCheckGoodEmitApplyScaffold.isAccept
    && hostModuleCheckGoodEmitBodyScaffold.isAccept
    && hostModuleCheckGoodEmitErasureScaffold.isAccept
    && hostModuleCheckGoodEmitExtractScaffold.isAccept
    && hostModuleCheckGoodEmitBannerScaffold.isAccept
    && hostModuleCheckGoodKernelSelfApply.isAccept
    && hostModuleCheckGoodKernelSelfApplyTheorems.isAccept
    && hostModuleCheckGoodEmitMult.isAccept
    && hostModuleCheckGoodEmitPlan.isAccept
    && hostModuleCheckGoodEmitApply.isAccept
    && hostModuleCheckGoodEmitBody.isAccept
    && hostModuleCheckGoodKernelEmit.isAccept
    && hostModuleCheckGoodKernelEmitTheorems.isAccept
    && hostModuleCheckGoodParityMult.isAccept
    && hostModuleCheckGoodParityMultTheorems.isAccept
    && hostModuleCheckGoodParityLinear.isAccept
    && hostModuleCheckGoodParityLinearTheorems.isAccept
    && hostModuleCheckGoodParityTypes.isAccept
    && hostModuleCheckGoodParityTypesTheorems.isAccept
    && hostModuleCheckGoodParityProgram.isAccept
    && hostModuleCheckGoodParityProgramTheorems.isAccept
    && hostModuleCheckGoodParityEmit.isAccept
    && hostModuleCheckGoodParityEmitTheorems.isAccept
    && hostModuleCheckGoodSelfApply.isAccept
    && hostModuleCheckGoodSelfApplyTheorems.isAccept
    && hostModuleCheckGoodEmitLinear.isAccept
    && hostModuleCheckGoodEmitTypes.isAccept
    && hostModuleCheckGoodEmitProgram.isAccept
    && hostModuleCheckGoodEmitGraph.isAccept
    && hostModuleCheckGoodEmitCompose.isAccept
    && hostModuleCheckGoodEmitErasure.isAccept
    && hostModuleCheckGoodEmitExtract.isAccept
    && hostModuleCheckGoodEmitBanner.isAccept
    && hostModuleCheckGoodProductOutKernel.isAccept
    && hostModuleCheckGoodProductOutKernelTheorems.isAccept
    && hostModuleCheckGoodBootstrapHonesty.isAccept
    && hostModuleCheckGoodBootstrapHonestyTheorems.isAccept
    && hostModuleCheckGoodProductPathWriterSurface.isAccept
    && hostModuleCheckGoodProductPathWriterSurfaceTheorems.isAccept
    && hostModuleCheckGoodProductPathWriterPathPlan.isAccept
    && hostModuleCheckGoodProductPathWriterPathPlanTheorems.isAccept
    && hostModuleCheckGoodProductPathWriterPathExec.isAccept
    && hostModuleCheckGoodProductPathWriterPathExecTheorems.isAccept
    && hostModuleCheckGoodProductPathOwnershipInputs.isAccept
    && hostModuleCheckGoodProductPathOwnershipInputsTheorems.isAccept
    && hostModuleCheckGoodProductPathPerform.isAccept
    && hostModuleCheckGoodProductPathPerformTheorems.isAccept
    && hostModuleCheckGoodProductPathPerformStep.isAccept
    && hostModuleCheckGoodProductPathPerformStepTheorems.isAccept
    && hostModuleCheckGoodProductPathReadSsot.isAccept
    && hostModuleCheckGoodProductPathReadSsotTheorems.isAccept
    && hostModuleCheckGoodProductPathComposePlan.isAccept
    && hostModuleCheckGoodProductPathComposePlanTheorems.isAccept
    && hostModuleCheckGoodCapable.isAccept
    && hostModuleCheckGoodCapableTheorems.isAccept
    && hostModuleCheckGoodCapableStepContract.isAccept
    && hostModuleCheckGoodCapableStepContractTheorems.isAccept
    && hostModuleCheckGoodInstallOut.isAccept
    && hostModuleCheckGoodInstallOutTheorems.isAccept
    && hostModuleCheckGoodOfficialPath.isAccept
    && hostModuleCheckGoodOfficialPathTheorems.isAccept
    && hostModuleCheckGoodPerformEvidence.isAccept
    && hostModuleCheckGoodPerformEvidenceTheorems.isAccept
    && hostModuleCheckGoodCapableRead.isAccept
    && hostModuleCheckGoodCapableReadTheorems.isAccept
    && hostModuleCheckGoodCapableCompose.isAccept
    && hostModuleCheckGoodCapableComposeTheorems.isAccept
    && hostModuleCheckGoodCapableFullBar.isAccept
    && hostModuleCheckGoodCapableFullBarTheorems.isAccept
    && hostModuleCheckGoodDualEqWriteCapableGap.isAccept
    && hostModuleCheckGoodDualEqWriteCapableGapTheorems.isAccept
    && hostModuleCheckGoodDualEqWriteClosePath.isAccept
    && hostModuleCheckGoodDualEqWriteClosePathTheorems.isAccept
    && hostModuleCheckGoodDualEqWriteParity.isAccept
    && hostModuleCheckGoodDualEqWriteParityTheorems.isAccept
    && hostModuleCheckGoodOfficialRetire.isAccept
    && hostModuleCheckGoodOfficialRetireTheorems.isAccept
    && hostModuleCheckGoodOwnershipClaimed.isAccept
    && hostModuleCheckGoodOwnershipClaimedTheorems.isAccept
    && hostModuleCheckGoodPerformClaimed.isAccept
    && hostModuleCheckGoodPerformClaimedTheorems.isAccept
    && hostModuleCheckGoodStepContractFull.isAccept
    && hostModuleCheckGoodStepContractFullTheorems.isAccept
    && hostModuleCheckGoodSelfHostComplete.isAccept
    && hostModuleCheckGoodSelfHostCompleteTheorems.isAccept
    && hostModuleCheckGoodOfficialPathAlternate.isAccept
    && hostModuleCheckGoodOfficialPathAlternateTheorems.isAccept
    && hostModuleCheckGoodProductPathOwnershipRegenerate.isAccept
    && hostModuleCheckGoodProductPathOwnershipRegenerateTheorems.isAccept
    && hostModuleCheckGoodCapableWriteHcLoad.isAccept
    && hostModuleCheckGoodDualEqWriteLoad.isAccept
    && hostModuleCheckGoodCapableWriteHc.isAccept
    && hostModuleCheckGoodDualEqWriteApi.isAccept
    && hostModuleCheckGoodLlvmHold.isAccept
    && hostModuleCheckGoodLlvmHoldTheorems.isAccept
    && hostModuleCheckGoodCapableRegenerate.isAccept
    && hostModuleCheckGoodCapableRegenerateTheorems.isAccept
    && hostModuleCheckGoodFreestandingEmitLoad.isAccept
    && hostModuleCheckGoodFreestandingEmitLoadScaffold.isAccept
    && hostModuleCheckGoodLakeRetireInventory.isAccept
    && hostModuleCheckGoodHostPackageRoots.isAccept
    && hostModuleCheckGoodFreestandingEmit.isAccept
    && hostModuleCheckGoodProductPathWriteHc.isAccept
    && hostModuleCheckGoodProductPathWriteHcTheorems.isAccept
    && hostModuleCheckGoodCompilePathMult.isAccept
    && hostModuleCheckGoodCompilePathLinear.isAccept
    && hostModuleCheckGoodCompilePathTypes.isAccept
    && hostModuleCheckGoodCompilePathProgram.isAccept
    && hostModuleCheckGoodCompilePathGraph.isAccept
    && hostModuleCheckGoodCompilePathCompose.isAccept
    && hostModuleCheckGoodCompilePathPlan.isAccept
    && hostModuleCheckGoodCompilePathApply.isAccept
    && hostModuleCheckGoodCompilePathBody.isAccept
    && hostModuleCheckGoodCompilePathErasure.isAccept
    && hostModuleCheckGoodCompilePathExtract.isAccept
    && hostModuleCheckGoodProductWireWriteTool.isAccept
    && hostModuleCheckGoodHostTerm.isAccept
    && hostModuleCheckGoodLlvmEmitPath.isAccept
    && hostModuleCheckGoodSubsetFront.isAccept
    && hostModuleCheckGoodFirstSurface.isAccept
    && hostModuleCheckGoodLinearSubsetEmit.isAccept
    && hostModuleCheckGoodTypesSubsetEmit.isAccept
    && hostModuleCheckGoodProgramSubsetEmit.isAccept
    && hostModuleCheckGoodGraphSubsetEmit.isAccept
    && hostModuleCheckGoodComposeSubsetEmit.isAccept
    && hostModuleCheckGoodErasureSubsetEmit.isAccept
    && hostModuleCheckGoodExtractSubsetEmit.isAccept
    && hostModuleCheckGoodMultSubsetEmit.isAccept
    && hostModuleCheckGoodMultSubsetRebuild.isAccept
    && hostModuleCheckGoodLinearSubsetRebuild.isAccept
    && hostModuleCheckGoodTypesSubsetRebuild.isAccept
    && hostModuleCheckGoodProgramSubsetRebuild.isAccept
    && hostModuleCheckGoodGraphSubsetRebuild.isAccept
    && hostModuleCheckGoodComposeSubsetRebuild.isAccept
    && hostModuleCheckGoodErasureSubsetRebuild.isAccept
    && hostModuleCheckGoodExtractSubsetRebuild.isAccept
    && hostModuleCheckGoodHostFront.isAccept
    && hostModuleCheckGoodLlvmMultText.isAccept
    && hostModuleCheckGoodHostFrontTheorems.isAccept
    && hostModuleCheckGoodHostCheck.isAccept
    && hostModuleCheckGoodHostGraph.isAccept
    && hostModuleCheckGoodLlvmLinearText.isAccept
    && hostModuleCheckGoodMultFsWriteTool.isAccept
    && hostModuleCheckGoodFrontMultPackage.isAccept
    && hostModuleCheckGoodSubsetPackageJoin.isAccept
    && hostModuleCheckGoodHostGraphTheorems.isAccept
    && hostModuleCheckGoodLlvmTypesText.isAccept
    && hostModuleCheckGoodMultFsDeepen.isAccept
    && hostModuleCheckGoodHostPackageWrite.isAccept
    && hostModuleCheckGoodHostPackageWriteTheorems.isAccept
    && hostModuleCheckGoodLlvmProgramText.isAccept
    && hostModuleCheckGoodLlvmGraphText.isAccept
    && hostModuleCheckGoodLlvmComposeText.isAccept
    && hostModuleCheckGoodSelfApplyFs.isAccept
    && hostModuleCheckGoodSelfApplyFsTheorems.isAccept
    && hostModuleCheckGoodInventoryClose.isAccept
    && hostModuleCheckGoodProductPathBars.isAccept
    && hostModuleCheckGoodInventoryCloseTheorems.isAccept
    && hostModuleCheckGoodProductPath.isAccept
    && hostModuleCheckGoodProductPathTheorems.isAccept
    && hostModuleCheckGoodDualResidual.isAccept
    && hostModuleCheckGoodDualResidualTheorems.isAccept
    && hostModuleCheckGoodProbeWire.isAccept
    && hostModuleCheckGoodSelfHostBody.isAccept
    && hostModuleCheckGoodProbeWireTheorems.isAccept
    && hostModuleCheckGoodSelfHostBodyTheorems.isAccept
    && hostModuleCheckGoodSpecProof.isAccept
    && hostModuleCheckGoodSpecProofTheorems.isAccept
    && hostModuleCheckBadMissingInductive.isRejectWith reasonMissingDecl
    && hostModuleCheckBadMissingNamespace.isRejectWith reasonMissingNamespace
    && hostModuleCheckBadEmpty.isRejectWith reasonEmptyModule
    && hostModuleCheckBadMissingTheorem.isRejectWith reasonMissingDecl
    && hostModuleCheckBadMissingAxiom.isRejectWith reasonMissingDecl
    && hostModuleCheckBadMissingStructure.isRejectWith reasonMissingDecl
    && hostModuleCheckBadMissingProgramStructure.isRejectWith reasonMissingDecl
    && hostModuleCheckBadMissingErasedStructure.isRejectWith reasonMissingDecl
    && hostModuleCheckBadMissingKernelReady.isRejectWith reasonMissingDecl
    && hostModuleCheckBadMissingPlanStructure.isRejectWith reasonMissingDecl
    && hostModuleCheckBadMissingParityReady.isRejectWith reasonMissingDecl
    && hostModuleCheckGoodMultTerm.isAccept
    && hostModuleCheckBadMultNameReturnType.isRejectWith reasonIllTypedTerm
    && hostModuleCheckBadMultIsValidApp.isRejectWith reasonIllTypedTerm
    && hostModuleCheckBadMultIsValidArm.isRejectWith reasonIllTypedTerm
    && hostModuleCheckMultTermSurfaceOk
    && hostModuleCheckMultKernelOk
    -- Linear L2 dual-pin fold (full checkRealModule twins live in Driver smoke).
    && hostModuleCheckLinearTermSurfaceOk
    -- Types L2 dual-pin fold (full checkRealModule twins live in Driver smoke).
    && hostModuleCheckTypesTermSurfaceOk
    -- IrProgram L2 dual-pin fold (full checkRealModule twins live in Driver smoke).
    && hostModuleCheckIrProgramTermSurfaceOk
    -- IrGraph L2 dual-pin fold (full checkRealModule twins live in Driver smoke).
    && hostModuleCheckIrGraphTermSurfaceOk
    -- HostCompose L2 dual-pin fold (full checkRealModule twins live in Driver smoke).
    && hostModuleCheckHostComposeTermSurfaceOk
    -- Erasure L2 dual-pin fold (full checkRealModule twins live in Driver smoke).
    && hostModuleCheckErasureTermSurfaceOk
    -- Extract L2 dual-pin fold (full checkRealModule twins live in Driver smoke).
    && hostModuleCheckExtractTermSurfaceOk
    -- Later TERM SurfaceOk aggregate (EmitPlan through LLVM Mult text).
    && hostModuleCheckLaterTermSurfaceOk
    -- KernelMultTheorems L3 dual-pin fold (SurfaceOk; not bare dualOk).
    && hostModuleCheckKernelMultProofSurfaceOk
    -- KernelLinearTheorems L3 dual-pin fold (SurfaceOk; not bare dualOk).
    && hostModuleCheckKernelLinearProofSurfaceOk
    -- KernelTypesTheorems L3 dual-pin fold (SurfaceOk; not bare dualOk).
    && hostModuleCheckKernelTypesProofSurfaceOk
    -- KernelProgramTheorems L3 dual-pin fold (SurfaceOk; not bare dualOk).
    && hostModuleCheckKernelProgramProofSurfaceOk
    -- KernelEmitTheorems L3 dual-pin fold (SurfaceOk; not bare dualOk).
    && hostModuleCheckKernelEmitProofSurfaceOk
    -- Package L4 first + PROOF + Kernel inventory + package-env dual-pins.
    && hostModuleCheckPackageElaborateFirstBandOk
    && hostModuleCheckPackageElaborateProofBandOk
    && hostModuleCheckPackageElaborateKernelBandOk
    && hostModuleCheckPackageElaborateEnvOk
    && (hostModuleCheckSeedModules
      == ["SystemsLean.Mult",
          "SystemsLean.MultTheorems",
          "SystemsLean.Linear",
          "SystemsLean.LinearTheorems",
          "SystemsLean.Types",
          "SystemsLean.TypesTheorems",
          "SystemsLean.IrProgram",
          "SystemsLean.IrProgramTheorems",
          "SystemsLean.IrGraph",
          "SystemsLean.IrGraphTheorems",
          "SystemsLean.HostCompose",
          "SystemsLean.HostComposeTheorems",
          "SystemsLean.Erasure",
          "SystemsLean.ErasureTheorems",
          "SystemsLean.Extract",
          "SystemsLean.ExtractTheorems",
          "SystemsLean.CompilePath",
          "SystemsLean.KernelMult",
          "SystemsLean.KernelLinear",
          "SystemsLean.KernelTypes",
          "SystemsLean.KernelProgram",
          "SystemsLean.KernelMultTheorems",
          "SystemsLean.KernelLinearTheorems",
          "SystemsLean.KernelTypesTheorems",
          "SystemsLean.KernelProgramTheorems",
          "SystemsLean.JoinMap",
          "SystemsLean.JoinMapTheorems",
          "SystemsLean.SelfHost",
          "SystemsLean.SelfHostTheorems",
          "SystemsLean.SurfaceMatrix",
          "SystemsLean.SurfaceMatrixTheorems",
          "SystemsLean.EmitMultScaffold",
          "SystemsLean.EmitLinearScaffold",
          "SystemsLean.EmitTypesScaffold",
          "SystemsLean.EmitProgramScaffold",
          "SystemsLean.EmitGraphScaffold",
          "SystemsLean.EmitComposeScaffold",
          "SystemsLean.EmitPlanScaffold",
          "SystemsLean.EmitApplyScaffold",
          "SystemsLean.EmitBodyScaffold",
          "SystemsLean.EmitErasureScaffold",
          "SystemsLean.EmitExtractScaffold",
          "SystemsLean.EmitBannerScaffold",
          "SystemsLean.KernelSelfApply",
          "SystemsLean.KernelSelfApplyTheorems",
          "SystemsLean.EmitMult",
          "SystemsLean.EmitPlan",
          "SystemsLean.EmitApply",
          "SystemsLean.EmitBody",
          "SystemsLean.KernelEmit",
          "SystemsLean.KernelEmitTheorems",
          "SystemsLean.ParityMult",
          "SystemsLean.ParityMultTheorems",
          "SystemsLean.ParityLinear",
          "SystemsLean.ParityLinearTheorems",
          "SystemsLean.ParityTypes",
          "SystemsLean.ParityTypesTheorems",
          "SystemsLean.ParityProgram",
          "SystemsLean.ParityProgramTheorems",
          "SystemsLean.ParityEmit",
          "SystemsLean.ParityEmitTheorems",
          "SystemsLean.SelfApply",
          "SystemsLean.SelfApplyTheorems",
          "SystemsLean.EmitLinear",
          "SystemsLean.EmitTypes",
          "SystemsLean.EmitProgram",
          "SystemsLean.EmitGraph",
          "SystemsLean.EmitCompose",
          "SystemsLean.EmitErasure",
          "SystemsLean.EmitExtract",
          "SystemsLean.EmitBanner",
          "SystemsLean.ProductOutKernel",
          "SystemsLean.ProductOutKernelTheorems",
          "SystemsLean.BootstrapHonesty",
          "SystemsLean.BootstrapHonestyTheorems",
          "SystemsLean.ProductPathWriterSurface",
          "SystemsLean.ProductPathWriterSurfaceTheorems",
          "SystemsLean.ProductPathWriterPathPlan",
          "SystemsLean.ProductPathWriterPathPlanTheorems",
          "SystemsLean.ProductPathWriterPathExec",
          "SystemsLean.ProductPathWriterPathExecTheorems",
   "SystemsLean.ProductPathOwnershipInputs",
   "SystemsLean.ProductPathOwnershipInputsTheorems",
   "SystemsLean.ProductPathPerform",
   "SystemsLean.ProductPathPerformTheorems",
   "SystemsLean.ProductPathPerformStep",
   "SystemsLean.ProductPathPerformStepTheorems",
   "SystemsLean.ProductPathReadSsot",
   "SystemsLean.ProductPathReadSsotTheorems",
   "SystemsLean.ProductPathComposePlan",
   "SystemsLean.ProductPathComposePlanTheorems",
   "SystemsLean.Capable",
   "SystemsLean.CapableTheorems",
   "SystemsLean.CapableStepContract",
   "SystemsLean.CapableStepContractTheorems",
   "SystemsLean.InstallOut",
   "SystemsLean.InstallOutTheorems",
   "SystemsLean.OfficialPath",
   "SystemsLean.OfficialPathTheorems",
   "SystemsLean.PerformEvidence",
   "SystemsLean.PerformEvidenceTheorems",
   "SystemsLean.CapableRead",
   "SystemsLean.CapableReadTheorems",
   "SystemsLean.CapableCompose",
   "SystemsLean.CapableComposeTheorems",
   "SystemsLean.CapableFullBar",
   "SystemsLean.CapableFullBarTheorems",
   "SystemsLean.DualEqWriteCapableGap",
   "SystemsLean.DualEqWriteCapableGapTheorems",
   "SystemsLean.DualEqWriteClosePath",
   "SystemsLean.DualEqWriteClosePathTheorems",
   "SystemsLean.DualEqWriteParity",
   "SystemsLean.DualEqWriteParityTheorems",
   "SystemsLean.OfficialRetire",
   "SystemsLean.OfficialRetireTheorems",
   "SystemsLean.OwnershipClaimed",
   "SystemsLean.OwnershipClaimedTheorems",
   "SystemsLean.PerformClaimed",
   "SystemsLean.PerformClaimedTheorems",
   "SystemsLean.StepContractFull",
   "SystemsLean.StepContractFullTheorems",
   "SystemsLean.SelfHostComplete",
   "SystemsLean.SelfHostCompleteTheorems",
   "SystemsLean.OfficialPathAlternate",
   "SystemsLean.OfficialPathAlternateTheorems",
   "SystemsLean.ProductPathOwnershipRegenerate",
   "SystemsLean.ProductPathOwnershipRegenerateTheorems",
   "SystemsLean.CapableWriteHcLoad",
   "SystemsLean.DualEqWriteLoad",
   "SystemsLean.CapableWriteHc",
   "SystemsLean.DualEqWriteApi",
   "SystemsLean.LlvmHold",
   "SystemsLean.LlvmHoldTheorems",
   "SystemsLean.CapableRegenerate",
   "SystemsLean.CapableRegenerateTheorems",
   "SystemsLean.FreestandingEmitLoad",
   "SystemsLean.FreestandingEmitLoadScaffold",
   "SystemsLean.LakeRetireInventory",
   "SystemsLean.HostPackageRoots",
   "SystemsLean.FreestandingEmit",
   "SystemsLean.ProductPathWriteHc",
   "SystemsLean.ProductPathWriteHcTheorems",
   "SystemsLean.CompilePathMult",
   "SystemsLean.CompilePathLinear",
   "SystemsLean.CompilePathTypes",
   "SystemsLean.CompilePathProgram",
   "SystemsLean.CompilePathGraph",
   "SystemsLean.CompilePathCompose",
   "SystemsLean.CompilePathPlan",
   "SystemsLean.CompilePathApply",
   "SystemsLean.CompilePathBody",
   "SystemsLean.CompilePathErasure",
   "SystemsLean.CompilePathExtract",
   "SystemsLean.ProductWireWriteTool",
   "SystemsLean.HostTerm",
   "SystemsLean.LlvmEmitPath",
   "SystemsLean.SubsetFront",
   "SystemsLean.FirstSurface",
   "SystemsLean.LinearSubsetEmit",
   "SystemsLean.TypesSubsetEmit",
   "SystemsLean.ProgramSubsetEmit",
   "SystemsLean.GraphSubsetEmit",
   "SystemsLean.ComposeSubsetEmit",
   "SystemsLean.ErasureSubsetEmit",
   "SystemsLean.ExtractSubsetEmit",
   "SystemsLean.MultSubsetEmit",
   "SystemsLean.MultSubsetRebuild",
   "SystemsLean.LinearSubsetRebuild",
   "SystemsLean.TypesSubsetRebuild",
   "SystemsLean.ProgramSubsetRebuild",
   "SystemsLean.GraphSubsetRebuild",
   "SystemsLean.ComposeSubsetRebuild",
   "SystemsLean.ErasureSubsetRebuild",
   "SystemsLean.ExtractSubsetRebuild",
   "SystemsLean.HostFront",
   "SystemsLean.LlvmMultText",
   "SystemsLean.HostFrontTheorems",
   "SystemsLean.HostCheck",
   "SystemsLean.HostGraph",
   "SystemsLean.LlvmLinearText",
   "SystemsLean.MultFsWriteTool",
   "SystemsLean.FrontMultPackage",
   "SystemsLean.SubsetPackageJoin",
   "SystemsLean.HostGraphTheorems",
   "SystemsLean.LlvmTypesText",
   "SystemsLean.MultFsDeepen",
   "SystemsLean.HostPackageWrite",
   "SystemsLean.HostPackageWriteTheorems",
   "SystemsLean.LlvmProgramText",
   "SystemsLean.LlvmGraphText",
   "SystemsLean.LlvmComposeText",
   "SystemsLean.SelfApplyFs",
   "SystemsLean.SelfApplyFsTheorems",
   "SystemsLean.InventoryClose",
   "SystemsLean.ProductPathBars",
   "SystemsLean.InventoryCloseTheorems",
   "SystemsLean.ProductPath",
   "SystemsLean.ProductPathTheorems",
   "SystemsLean.DualResidual",
   "SystemsLean.DualResidualTheorems",
   "SystemsLean.ProbeWire",
   "SystemsLean.SelfHostBody",
   "SystemsLean.ProbeWireTheorems",
   "SystemsLean.SelfHostBodyTheorems",
   "SystemsLean.SpecProof",
   "SystemsLean.SpecProofTheorems"])
    && (hostModuleCheckSeedRelPaths
      == ["src/systems/SystemsLean/Mult.lean",
          "src/systems/SystemsLean/MultTheorems.lean",
          "src/systems/SystemsLean/Linear.lean",
          "src/systems/SystemsLean/LinearTheorems.lean",
          "src/systems/SystemsLean/Types.lean",
          "src/systems/SystemsLean/TypesTheorems.lean",
          "src/systems/SystemsLean/IrProgram.lean",
          "src/systems/SystemsLean/IrProgramTheorems.lean",
          "src/systems/SystemsLean/IrGraph.lean",
          "src/systems/SystemsLean/IrGraphTheorems.lean",
          "src/systems/SystemsLean/HostCompose.lean",
          "src/systems/SystemsLean/HostComposeTheorems.lean",
          "src/systems/SystemsLean/Erasure.lean",
          "src/systems/SystemsLean/ErasureTheorems.lean",
          "src/systems/SystemsLean/Extract.lean",
          "src/systems/SystemsLean/ExtractTheorems.lean",
          "src/systems/SystemsLean/CompilePath.lean",
          "src/systems/SystemsLean/KernelMult.lean",
          "src/systems/SystemsLean/KernelLinear.lean",
          "src/systems/SystemsLean/KernelTypes.lean",
          "src/systems/SystemsLean/KernelProgram.lean",
          "src/systems/SystemsLean/KernelMultTheorems.lean",
          "src/systems/SystemsLean/KernelLinearTheorems.lean",
          "src/systems/SystemsLean/KernelTypesTheorems.lean",
          "src/systems/SystemsLean/KernelProgramTheorems.lean",
          "src/systems/SystemsLean/JoinMap.lean",
          "src/systems/SystemsLean/JoinMapTheorems.lean",
          "src/systems/SystemsLean/SelfHost.lean",
          "src/systems/SystemsLean/SelfHostTheorems.lean",
          "src/systems/SystemsLean/SurfaceMatrix.lean",
          "src/systems/SystemsLean/SurfaceMatrixTheorems.lean",
          "src/systems/SystemsLean/EmitMultScaffold.lean",
          "src/systems/SystemsLean/EmitLinearScaffold.lean",
          "src/systems/SystemsLean/EmitTypesScaffold.lean",
          "src/systems/SystemsLean/EmitProgramScaffold.lean",
          "src/systems/SystemsLean/EmitGraphScaffold.lean",
          "src/systems/SystemsLean/EmitComposeScaffold.lean",
          "src/systems/SystemsLean/EmitPlanScaffold.lean",
          "src/systems/SystemsLean/EmitApplyScaffold.lean",
          "src/systems/SystemsLean/EmitBodyScaffold.lean",
          "src/systems/SystemsLean/EmitErasureScaffold.lean",
          "src/systems/SystemsLean/EmitExtractScaffold.lean",
          "src/systems/SystemsLean/EmitBannerScaffold.lean",
          "src/systems/SystemsLean/KernelSelfApply.lean",
          "src/systems/SystemsLean/KernelSelfApplyTheorems.lean",
          "src/systems/SystemsLean/EmitMult.lean",
          "src/systems/SystemsLean/EmitPlan.lean",
          "src/systems/SystemsLean/EmitApply.lean",
          "src/systems/SystemsLean/EmitBody.lean",
          "src/systems/SystemsLean/KernelEmit.lean",
          "src/systems/SystemsLean/KernelEmitTheorems.lean",
          "src/systems/SystemsLean/ParityMult.lean",
          "src/systems/SystemsLean/ParityMultTheorems.lean",
          "src/systems/SystemsLean/ParityLinear.lean",
          "src/systems/SystemsLean/ParityLinearTheorems.lean",
          "src/systems/SystemsLean/ParityTypes.lean",
          "src/systems/SystemsLean/ParityTypesTheorems.lean",
          "src/systems/SystemsLean/ParityProgram.lean",
          "src/systems/SystemsLean/ParityProgramTheorems.lean",
          "src/systems/SystemsLean/ParityEmit.lean",
          "src/systems/SystemsLean/ParityEmitTheorems.lean",
          "src/systems/SystemsLean/SelfApply.lean",
          "src/systems/SystemsLean/SelfApplyTheorems.lean",
          "src/systems/SystemsLean/EmitLinear.lean",
          "src/systems/SystemsLean/EmitTypes.lean",
          "src/systems/SystemsLean/EmitProgram.lean",
          "src/systems/SystemsLean/EmitGraph.lean",
          "src/systems/SystemsLean/EmitCompose.lean",
          "src/systems/SystemsLean/EmitErasure.lean",
          "src/systems/SystemsLean/EmitExtract.lean",
          "src/systems/SystemsLean/EmitBanner.lean",
          "src/systems/SystemsLean/ProductOutKernel.lean",
          "src/systems/SystemsLean/ProductOutKernelTheorems.lean",
          "src/systems/SystemsLean/BootstrapHonesty.lean",
          "src/systems/SystemsLean/BootstrapHonestyTheorems.lean",
          "src/systems/SystemsLean/ProductPathWriterSurface.lean",
          "src/systems/SystemsLean/ProductPathWriterSurfaceTheorems.lean",
          "src/systems/SystemsLean/ProductPathWriterPathPlan.lean",
          "src/systems/SystemsLean/ProductPathWriterPathPlanTheorems.lean",
          "src/systems/SystemsLean/ProductPathWriterPathExec.lean",
          "src/systems/SystemsLean/ProductPathWriterPathExecTheorems.lean",
   "src/systems/SystemsLean/ProductPathOwnershipInputs.lean",
   "src/systems/SystemsLean/ProductPathOwnershipInputsTheorems.lean",
   "src/systems/SystemsLean/ProductPathPerform.lean",
   "src/systems/SystemsLean/ProductPathPerformTheorems.lean",
   "src/systems/SystemsLean/ProductPathPerformStep.lean",
   "src/systems/SystemsLean/ProductPathPerformStepTheorems.lean",
   "src/systems/SystemsLean/ProductPathReadSsot.lean",
   "src/systems/SystemsLean/ProductPathReadSsotTheorems.lean",
   "src/systems/SystemsLean/ProductPathComposePlan.lean",
   "src/systems/SystemsLean/ProductPathComposePlanTheorems.lean",
   "src/systems/SystemsLean/Capable.lean",
   "src/systems/SystemsLean/CapableTheorems.lean",
   "src/systems/SystemsLean/CapableStepContract.lean",
   "src/systems/SystemsLean/CapableStepContractTheorems.lean",
   "src/systems/SystemsLean/InstallOut.lean",
   "src/systems/SystemsLean/InstallOutTheorems.lean",
   "src/systems/SystemsLean/OfficialPath.lean",
   "src/systems/SystemsLean/OfficialPathTheorems.lean",
   "src/systems/SystemsLean/PerformEvidence.lean",
   "src/systems/SystemsLean/PerformEvidenceTheorems.lean",
   "src/systems/SystemsLean/CapableRead.lean",
   "src/systems/SystemsLean/CapableReadTheorems.lean",
   "src/systems/SystemsLean/CapableCompose.lean",
   "src/systems/SystemsLean/CapableComposeTheorems.lean",
   "src/systems/SystemsLean/CapableFullBar.lean",
   "src/systems/SystemsLean/CapableFullBarTheorems.lean",
   "src/systems/SystemsLean/DualEqWriteCapableGap.lean",
   "src/systems/SystemsLean/DualEqWriteCapableGapTheorems.lean",
   "src/systems/SystemsLean/DualEqWriteClosePath.lean",
   "src/systems/SystemsLean/DualEqWriteClosePathTheorems.lean",
   "src/systems/SystemsLean/DualEqWriteParity.lean",
   "src/systems/SystemsLean/DualEqWriteParityTheorems.lean",
   "src/systems/SystemsLean/OfficialRetire.lean",
   "src/systems/SystemsLean/OfficialRetireTheorems.lean",
   "src/systems/SystemsLean/OwnershipClaimed.lean",
   "src/systems/SystemsLean/OwnershipClaimedTheorems.lean",
   "src/systems/SystemsLean/PerformClaimed.lean",
   "src/systems/SystemsLean/PerformClaimedTheorems.lean",
   "src/systems/SystemsLean/StepContractFull.lean",
   "src/systems/SystemsLean/StepContractFullTheorems.lean",
   "src/systems/SystemsLean/SelfHostComplete.lean",
   "src/systems/SystemsLean/SelfHostCompleteTheorems.lean",
   "src/systems/SystemsLean/OfficialPathAlternate.lean",
   "src/systems/SystemsLean/OfficialPathAlternateTheorems.lean",
   "src/systems/SystemsLean/ProductPathOwnershipRegenerate.lean",
   "src/systems/SystemsLean/ProductPathOwnershipRegenerateTheorems.lean",
   "src/systems/SystemsLean/CapableWriteHcLoad.lean",
   "src/systems/SystemsLean/DualEqWriteLoad.lean",
   "src/systems/SystemsLean/CapableWriteHc.lean",
   "src/systems/SystemsLean/DualEqWriteApi.lean",
   "src/systems/SystemsLean/LlvmHold.lean",
   "src/systems/SystemsLean/LlvmHoldTheorems.lean",
   "src/systems/SystemsLean/CapableRegenerate.lean",
   "src/systems/SystemsLean/CapableRegenerateTheorems.lean",
   "src/systems/SystemsLean/FreestandingEmitLoad.lean",
   "src/systems/SystemsLean/FreestandingEmitLoadScaffold.lean",
   "src/systems/SystemsLean/LakeRetireInventory.lean",
   "src/systems/SystemsLean/HostPackageRoots.lean",
   "src/systems/SystemsLean/FreestandingEmit.lean",
   "src/systems/SystemsLean/ProductPathWriteHc.lean",
   "src/systems/SystemsLean/ProductPathWriteHcTheorems.lean",
   "src/systems/SystemsLean/CompilePathMult.lean",
   "src/systems/SystemsLean/CompilePathLinear.lean",
   "src/systems/SystemsLean/CompilePathTypes.lean",
   "src/systems/SystemsLean/CompilePathProgram.lean",
   "src/systems/SystemsLean/CompilePathGraph.lean",
   "src/systems/SystemsLean/CompilePathCompose.lean",
   "src/systems/SystemsLean/CompilePathPlan.lean",
   "src/systems/SystemsLean/CompilePathApply.lean",
   "src/systems/SystemsLean/CompilePathBody.lean",
   "src/systems/SystemsLean/CompilePathErasure.lean",
   "src/systems/SystemsLean/CompilePathExtract.lean",
   "src/systems/SystemsLean/ProductWireWriteTool.lean",
   "src/systems/SystemsLean/HostTerm.lean",
   "src/systems/SystemsLean/LlvmEmitPath.lean",
   "src/systems/SystemsLean/SubsetFront.lean",
   "src/systems/SystemsLean/FirstSurface.lean",
   "src/systems/SystemsLean/LinearSubsetEmit.lean",
   "src/systems/SystemsLean/TypesSubsetEmit.lean",
   "src/systems/SystemsLean/ProgramSubsetEmit.lean",
   "src/systems/SystemsLean/GraphSubsetEmit.lean",
   "src/systems/SystemsLean/ComposeSubsetEmit.lean",
   "src/systems/SystemsLean/ErasureSubsetEmit.lean",
   "src/systems/SystemsLean/ExtractSubsetEmit.lean",
   "src/systems/SystemsLean/MultSubsetEmit.lean",
   "src/systems/SystemsLean/MultSubsetRebuild.lean",
   "src/systems/SystemsLean/LinearSubsetRebuild.lean",
   "src/systems/SystemsLean/TypesSubsetRebuild.lean",
   "src/systems/SystemsLean/ProgramSubsetRebuild.lean",
   "src/systems/SystemsLean/GraphSubsetRebuild.lean",
   "src/systems/SystemsLean/ComposeSubsetRebuild.lean",
   "src/systems/SystemsLean/ErasureSubsetRebuild.lean",
   "src/systems/SystemsLean/ExtractSubsetRebuild.lean",
   "src/systems/SystemsLean/HostFront.lean",
   "src/systems/SystemsLean/LlvmMultText.lean",
   "src/systems/SystemsLean/HostFrontTheorems.lean",
   "src/systems/SystemsLean/HostCheck.lean",
   "src/systems/SystemsLean/HostGraph.lean",
   "src/systems/SystemsLean/LlvmLinearText.lean",
   "src/systems/SystemsLean/MultFsWriteTool.lean",
   "src/systems/SystemsLean/FrontMultPackage.lean",
   "src/systems/SystemsLean/SubsetPackageJoin.lean",
   "src/systems/SystemsLean/HostGraphTheorems.lean",
   "src/systems/SystemsLean/LlvmTypesText.lean",
   "src/systems/SystemsLean/MultFsDeepen.lean",
   "src/systems/SystemsLean/HostPackageWrite.lean",
   "src/systems/SystemsLean/HostPackageWriteTheorems.lean",
   "src/systems/SystemsLean/LlvmProgramText.lean",
   "src/systems/SystemsLean/LlvmGraphText.lean",
   "src/systems/SystemsLean/LlvmComposeText.lean",
   "src/systems/SystemsLean/SelfApplyFs.lean",
   "src/systems/SystemsLean/SelfApplyFsTheorems.lean",
   "src/systems/SystemsLean/InventoryClose.lean",
   "src/systems/SystemsLean/ProductPathBars.lean",
   "src/systems/SystemsLean/InventoryCloseTheorems.lean",
   "src/systems/SystemsLean/ProductPath.lean",
   "src/systems/SystemsLean/ProductPathTheorems.lean",
   "src/systems/SystemsLean/DualResidual.lean",
   "src/systems/SystemsLean/DualResidualTheorems.lean",
   "src/systems/SystemsLean/ProbeWire.lean",
   "src/systems/SystemsLean/SelfHostBody.lean",
   "src/systems/SystemsLean/ProbeWireTheorems.lean",
   "src/systems/SystemsLean/SelfHostBodyTheorems.lean",
   "src/systems/SystemsLean/SpecProof.lean",
   "src/systems/SystemsLean/SpecProofTheorems.lean"])
    && (designNotePath
      == "doc/dev/research/full-host-elaborator-design-2026-08-03.md")
    && (residualName == "First real host module check")
    && (hostModuleCheckExpandSliceName == "Host library seed expand continue")
    && (hostModuleCheckSeedUnitsLabel
      == "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText+SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars+InventoryCloseTheorems+ProductPath+ProductPathTheorems+DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems")
    && (checkDepthPartial == "PARTIAL-STRUCTURAL")
    && (checkDepthDeepenBar == "FOUNDATION-KIND-SURFACE")
    && (checkDepthDeepenBand
      == "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelEmit+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+KernelEmitTheorems+EmitPlan+EmitApply+EmitBody+ParityMult+ParityLinear+ParityTypes+ParityProgram+ParityEmit+ParityMultTheorems+ParityLinearTheorems+ParityTypesTheorems+ParityProgramTheorems+ParityEmitTheorems")
    && (checkDepthDeepenSliceName == "Check depth deepen continue")
    && (multRequiredDecls.length == 6)
    && (multTheoremsRequiredDecls.length == 14)
    && (linearRequiredDecls.length == 12)
    && (linearTheoremsRequiredDecls.length == 12)
    && (typesRequiredDecls.length == 12)
    && (typesTheoremsRequiredDecls.length == 14)
    && (irProgramRequiredDecls.length == 10)
    && (irProgramTheoremsRequiredDecls.length == 12)
    && (irGraphRequiredDecls.length == 12)
    && (irGraphTheoremsRequiredDecls.length == 12)
    && (hostComposeRequiredDecls.length == 12)
    && (hostComposeTheoremsRequiredDecls.length == 14)
    && (erasureRequiredDecls.length == 8)
    && (erasureTheoremsRequiredDecls.length == 14)
    && (extractRequiredDecls.length == 8)
    && (extractTheoremsRequiredDecls.length == 14)
    && (compilePathRequiredDecls.length == 6)
    && (kernelMultRequiredDecls.length == 10)
    && (kernelLinearRequiredDecls.length == 10)
    && (kernelTypesRequiredDecls.length == 10)
    && (kernelProgramRequiredDecls.length == 10)
    && (kernelMultTheoremsRequiredDecls.length == 11)
    && (kernelLinearTheoremsRequiredDecls.length == 12)
    && (kernelTypesTheoremsRequiredDecls.length == 12)
    && (kernelProgramTheoremsRequiredDecls.length == 12)
    && (joinMapRequiredDecls.length == 6)
    && (joinMapTheoremsRequiredDecls.length == 8)
    && (selfHostRequiredDecls.length == 6)
    && (selfHostTheoremsRequiredDecls.length == 8)
    && (surfaceMatrixRequiredDecls.length == 6)
    && (surfaceMatrixTheoremsRequiredDecls.length == 8)
    && (emitMultScaffoldRequiredDecls.length == 6)
    && (emitLinearScaffoldRequiredDecls.length == 6)
    && (emitTypesScaffoldRequiredDecls.length == 6)
    && (emitProgramScaffoldRequiredDecls.length == 6)
    && (emitGraphScaffoldRequiredDecls.length == 6)
    && (emitComposeScaffoldRequiredDecls.length == 6)
    && (emitPlanScaffoldRequiredDecls.length == 6)
    && (emitApplyScaffoldRequiredDecls.length == 6)
    && (emitBodyScaffoldRequiredDecls.length == 6)
    && (emitErasureScaffoldRequiredDecls.length == 6)
    && (emitExtractScaffoldRequiredDecls.length == 6)
    && (emitBannerScaffoldRequiredDecls.length == 6)
    && (kernelSelfApplyRequiredDecls.length == 6)
    && (kernelSelfApplyTheoremsRequiredDecls.length == 1)
    && (emitMultRequiredDecls.length == 0)
    && (emitPlanRequiredDecls.length == 9)
    && (emitApplyRequiredDecls.length == 10)
    && (emitBodyRequiredDecls.length == 8)
    && (kernelEmitRequiredDecls.length == 12)
    && (kernelEmitTheoremsRequiredDecls.length == 12)
    && (parityMultRequiredDecls.length == 12)
    && (parityMultTheoremsRequiredDecls.length == 10)
    && (parityLinearRequiredDecls.length == 12)
    && (parityLinearTheoremsRequiredDecls.length == 8)
    && (parityTypesRequiredDecls.length == 12)
    && (parityTypesTheoremsRequiredDecls.length == 8)
    && (parityProgramRequiredDecls.length == 12)
    && (parityProgramTheoremsRequiredDecls.length == 8)
    && (parityEmitRequiredDecls.length == 12)
    && (parityEmitTheoremsRequiredDecls.length == 8)
    && (selfApplyRequiredDecls.length == 8)
    && (selfApplyTheoremsRequiredDecls.length == 5)
    && (emitLinearRequiredDecls.length == 0)
    && (emitTypesRequiredDecls.length == 0)
    && (emitProgramRequiredDecls.length == 0)
    && (emitGraphRequiredDecls.length == 0)
    && (emitComposeRequiredDecls.length == 0)
    && (emitErasureRequiredDecls.length == 0)
    && (emitExtractRequiredDecls.length == 0)
    && (emitBannerRequiredDecls.length == 0)
    && (productOutKernelRequiredDecls.length == 6)
    && (productOutKernelTheoremsRequiredDecls.length == 1)
    && (bootstrapHonestyRequiredDecls.length == 6)
    && (bootstrapHonestyTheoremsRequiredDecls.length == 2)
    && (productPathWriterSurfaceRequiredDecls.length == 6)
    && (productPathWriterSurfaceTheoremsRequiredDecls.length == 1)
    && (productPathWriterPathPlanRequiredDecls.length == 6)
    && (productPathWriterPathPlanTheoremsRequiredDecls.length == 1)
    && (productPathWriterPathExecRequiredDecls.length == 6)
    && (productPathWriterPathExecTheoremsRequiredDecls.length == 1)
    && (productPathOwnershipInputsRequiredDecls.length == 6)
    && (productPathOwnershipInputsTheoremsRequiredDecls.length == 1)
    && (productPathPerformRequiredDecls.length == 6)
    && (productPathPerformTheoremsRequiredDecls.length == 1)
    && (productPathPerformStepRequiredDecls.length == 6)
    && (productPathPerformStepTheoremsRequiredDecls.length == 1)
    && (productPathReadSsotRequiredDecls.length == 6)
    && (productPathReadSsotTheoremsRequiredDecls.length == 1)
    && (productPathComposePlanRequiredDecls.length == 6)
    && (productPathComposePlanTheoremsRequiredDecls.length == 1)
    && (capableRequiredDecls.length == 6)
    && (capableTheoremsRequiredDecls.length == 1)
    && (capableStepContractRequiredDecls.length == 6)
    && (capableStepContractTheoremsRequiredDecls.length == 1)
    && (installOutRequiredDecls.length == 6)
    && (installOutTheoremsRequiredDecls.length == 1)
    && (officialPathRequiredDecls.length == 6)
    && (officialPathTheoremsRequiredDecls.length == 1)
    && (performEvidenceRequiredDecls.length == 6)
    && (performEvidenceTheoremsRequiredDecls.length == 1)
    && (capableReadRequiredDecls.length == 6)
    && (capableReadTheoremsRequiredDecls.length == 1)
    && (capableComposeRequiredDecls.length == 6)
    && (capableComposeTheoremsRequiredDecls.length == 1)
    && (capableFullBarRequiredDecls.length == 6)
    && (capableFullBarTheoremsRequiredDecls.length == 1)
    && (dualEqWriteCapableGapRequiredDecls.length == 6)
    && (dualEqWriteCapableGapTheoremsRequiredDecls.length == 1)
    && (dualEqWriteClosePathRequiredDecls.length == 6)
    && (dualEqWriteClosePathTheoremsRequiredDecls.length == 1)
    && (dualEqWriteParityRequiredDecls.length == 6)
    && (dualEqWriteParityTheoremsRequiredDecls.length == 1)
    && (officialRetireRequiredDecls.length == 6)
    && (officialRetireTheoremsRequiredDecls.length == 1)
    && (ownershipClaimedRequiredDecls.length == 6)
    && (ownershipClaimedTheoremsRequiredDecls.length == 1)
    && (performClaimedRequiredDecls.length == 6)
    && (performClaimedTheoremsRequiredDecls.length == 1)
    && (stepContractFullRequiredDecls.length == 6)
    && (stepContractFullTheoremsRequiredDecls.length == 1)
    && (selfHostCompleteRequiredDecls.length == 6)
    && (selfHostCompleteTheoremsRequiredDecls.length == 1)
    && (officialPathAlternateRequiredDecls.length == 6)
    && (officialPathAlternateTheoremsRequiredDecls.length == 1)
    && (productPathOwnershipRegenerateRequiredDecls.length == 6)
    && (productPathOwnershipRegenerateTheoremsRequiredDecls.length == 1)
    && (capableWriteHcLoadRequiredDecls.length == 6)
    && (dualEqWriteLoadRequiredDecls.length == 6)
    && (capableWriteHcRequiredDecls.length == 6)
    && (dualEqWriteApiRequiredDecls.length == 6)
    && (llvmHoldRequiredDecls.length == 6)
    && (llvmHoldTheoremsRequiredDecls.length == 1)
    && (capableRegenerateRequiredDecls.length == 6)
    && (capableRegenerateTheoremsRequiredDecls.length == 1)
    && hostModuleCheckTheoremCorpusOk

/-- Without-Lake keeps host Lake bootstrap honesty.
    Greppable: hostModuleCheckWithoutLakeKeepsHostLake,
    HOST-MODULE-CHECK-WITHOUT-LAKE. -/
def hostModuleCheckWithoutLakeKeepsHostLake : Bool :=
  hostModuleCheckWithoutLakeFinished
    && stillUsesLake
    && dependsOnLake
    && hostModuleCheckHostElaboratorResidualRemains
    && !hostModuleCheckHostFreeClaimed

/-- Structural ready for first real host module check surface.
    Greppable: hostModuleCheckReady, HOST-MODULE-CHECK,
    SLAKE_HOST_MODULE_CHECK. -/
def hostModuleCheckReady : Bool :=
  hostModuleCheckFinishedClaimed
    && hostModuleCheckLoadOk
    && hostModuleCheckHostElaboratorResidualRemains
    && !hostModuleCheckHostFreeClaimed
    && stillUsesLake
    && dependsOnLake
    && hostModuleCheckStillUsesLake
    && hostModuleCheckDependsOnLake
    && !hostModuleCheckResidualFreeClaimed
    && !hostModuleCheckProductSelfHostCompleteClaimed
    && !hostModuleCheckProofCompleteClaimed
    && !hostModuleCheckLlvmUnlocked
    && !hostModuleCheckProvablyUnlocked
    && (stageId == "SLAKE_HOST_MODULE_CHECK_V0")
    && (hostId == "HOST-MODULE-CHECK")
    && (surfaceId == "HOST-MODULE-CHECK")
    && (surfaceAlias == "HOST-HOST-MODULE-CHECK")
    && (lakeExeName == "slake-host-module-check")
    && (justRecipe == "host-module-check")
    && (justRecipeWithoutLake == "host-module-check-without-lake")
    && (prebuiltHostModuleCheckRel
      == ".lake/build/bin/slake-host-module-check")
    && (checkDepthPartial == "PARTIAL-STRUCTURAL")
    && (checkDepthDeepenBar == "FOUNDATION-KIND-SURFACE")
    && (checkDepthDeepenSliceName == "Check depth deepen continue")

/-- Without-Lake ready (structural + finished + keeps host Lake).
    Greppable: hostModuleCheckWithoutLakeReady,
    HOST-MODULE-CHECK-WITHOUT-LAKE. -/
def hostModuleCheckWithoutLakeReady : Bool :=
  hostModuleCheckReady
    && hostModuleCheckWithoutLakeFinished
    && hostModuleCheckWithoutLakeKeepsHostLake
    && (justRecipeWithoutLake == "host-module-check-without-lake")
    && (prebuiltHostModuleCheckRel
      == ".lake/build/bin/slake-host-module-check")

/-! ### HOST-MODULE-CHECK-THEOREM + HOST-MODULE-CHECK-SMOKE
    Long-file split to SystemsLean.HostModuleCheckTheorems (same namespace).
    Greppable: HostModuleCheckTheorems, hostModuleCheckReady_true. -/

end SystemsLean.HostModuleCheck
