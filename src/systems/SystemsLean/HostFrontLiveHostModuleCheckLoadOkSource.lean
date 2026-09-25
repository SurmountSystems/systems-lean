/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckLoadOk.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckLoadOkSource.
  Not occupancy name 50. Host tools stay 69 of 69. Not FullHost.
  Not an LLVM backend. Not Lake-gone. Not PROVABLY.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-LOADOK,
  liveHostModuleCheckLoadOkSource, liveRel,
  HOST-FRONT-LIVE-LOADOK, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckLoadOkSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostModuleCheckLoadOkSourceA
import SystemsLean.HostFrontLiveHostModuleCheckLoadOkSourceB

namespace SystemsLean.HostFrontLiveHostModuleCheckLoadOk

/-- Bare basename. Not a path. -/
def liveRel : String := "HostModuleCheckLoadOk.lean"

/-- Repo-relative path for the disk read. Not liveRel. -/
def liveHostModuleCheckLoadOkRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Dual-pinned slice of HostModuleCheckLoadOk.lean. -/
def liveHostModuleCheckLoadOkSource0 : String := r#"/-
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
"#

/-- Full live bytes. Concatenation of the three slices. -/
def liveHostModuleCheckLoadOkSource : String :=
  liveHostModuleCheckLoadOkSource0
    ++ liveHostModuleCheckLoadOkSourceA
    ++ liveHostModuleCheckLoadOkSourceB

end SystemsLean.HostFrontLiveHostModuleCheckLoadOk

