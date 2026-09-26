/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck checkRealModule dispatcher.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from HostModuleCheckCheckersLater: surfaceFromContent +
  checkRealModule (seed role dispatch + L2/L3 refine hooks).
  Same namespace SystemsLean.HostModuleCheck.

  Intentional non-claims: PARTIAL-STRUCTURAL only; not residual free / PROVABLY / llvm.
  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckRealModule,
  checkRealModule, surfaceFromContent, PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckRealModule
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckRealModule.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY. Module must stay ASCII.
-/

-- Early imports live in HostModuleCheckRealModuleImportEarly so kept commands stay within kernel fuel 64.
import SystemsLean.HostModuleCheckRealModuleImportEarly
import SystemsLean.HostModuleCheckDualResidualTerm
import SystemsLean.HostModuleCheckCompilePathMultTerm
import SystemsLean.HostModuleCheckCompilePathLinearTerm
import SystemsLean.HostModuleCheckCompilePathTypesTerm
import SystemsLean.HostModuleCheckCompilePathProgramTerm
import SystemsLean.HostModuleCheckCompilePathGraphTerm
import SystemsLean.HostModuleCheckCompilePathComposeTerm
import SystemsLean.HostModuleCheckCompilePathErasureTerm
import SystemsLean.HostModuleCheckCompilePathExtractTerm
import SystemsLean.HostModuleCheckCompilePathPlanTerm
import SystemsLean.HostModuleCheckCompilePathApplyTerm
import SystemsLean.HostModuleCheckCompilePathBodyTerm
import SystemsLean.HostModuleCheckFirstSurfaceTerm
import SystemsLean.HostModuleCheckLinearSubsetEmitTerm
import SystemsLean.HostModuleCheckTypesSubsetEmitTerm
import SystemsLean.HostModuleCheckProgramSubsetEmitTerm
import SystemsLean.HostModuleCheckGraphSubsetEmitTerm
import SystemsLean.HostModuleCheckComposeSubsetEmitTerm
import SystemsLean.HostModuleCheckErasureSubsetEmitTerm
import SystemsLean.HostModuleCheckExtractSubsetEmitTerm
import SystemsLean.HostModuleCheckMultSubsetEmitTerm
import SystemsLean.HostModuleCheckMultSubsetRebuildTerm
import SystemsLean.HostModuleCheckLinearSubsetRebuildTerm
import SystemsLean.HostModuleCheckTypesSubsetRebuildTerm
import SystemsLean.HostModuleCheckProgramSubsetRebuildTerm
import SystemsLean.HostModuleCheckGraphSubsetRebuildTerm
import SystemsLean.HostModuleCheckComposeSubsetRebuildTerm
import SystemsLean.HostModuleCheckErasureSubsetRebuildTerm
import SystemsLean.HostModuleCheckExtractSubsetRebuildTerm
import SystemsLean.HostModuleCheckHostFrontTerm
import SystemsLean.HostModuleCheckLlvmMultTextTerm
import SystemsLean.HostModuleCheckHostCheckTerm
import SystemsLean.HostModuleCheckHostGraphTerm
import SystemsLean.HostModuleCheckLlvmLinearTextTerm
import SystemsLean.HostModuleCheckMultFsWriteToolTerm
import SystemsLean.HostModuleCheckFrontMultPackageTerm
import SystemsLean.HostModuleCheckSubsetPackageJoinTerm
import SystemsLean.HostModuleCheckLlvmTypesTextTerm
import SystemsLean.HostModuleCheckMultFsDeepenTerm
import SystemsLean.HostModuleCheckHostPackageWriteTerm
import SystemsLean.HostModuleCheckLlvmProgramTextTerm
import SystemsLean.HostModuleCheckLlvmGraphTextTerm
import SystemsLean.HostModuleCheckLlvmComposeTextTerm
import SystemsLean.HostModuleCheckSelfApplyFsTerm
import SystemsLean.HostModuleCheckInventoryCloseTerm
import SystemsLean.HostModuleCheckProductPathBarsTerm
import SystemsLean.HostModuleCheckProductPathTerm
import SystemsLean.HostModuleCheckProbeWireTerm
import SystemsLean.HostModuleCheckSelfHostBodyTerm

namespace SystemsLean.HostModuleCheck

/-- Build surface from content (no accept/reject yet).
    Greppable: surfaceFromContent. -/
def surfaceFromContent (modName : String) (content : String) :
    RealModuleSurface :=
  { name := modName
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

-- Deep if-else ladder over seed modules needs higher elaborator rec depth.
set_option maxRecDepth 16384

/-- Structural check of one real module content against seed role.
    Greppable: checkRealModule. -/
def checkRealModule (modName : String) (content : String) :
    ModuleCheckResult :=
  if isEffectivelyEmpty content then
    ModuleCheckResult.reject reasonEmptyModule
  else
    let surf := surfaceFromContent modName content
    if modName == "SystemsLean.Mult" then
      -- L0/L1 structural then Mult L2 term-surface then KERNEL-CHECK.
      refineMultWithKernel
        (refineMultWithTermSurface (checkMultSurface surf) content) content
    else if modName == "SystemsLean.MultTheorems" then
      -- L0/L1 structural then MultTheorems L3 proof-surface (J7 dialect pilot).
      refineMultTheoremsWithProofSurface (checkMultTheoremsSurface surf) content
    else if modName == "SystemsLean.Linear" then
      -- L0/L1 structural then Linear L2 term-surface (def-shape dialect pilot).
      refineLinearWithTermSurface (checkLinearSurface surf) content
    else if modName == "SystemsLean.LinearTheorems" then
      -- L0/L1 structural then LinearTheorems L3 proof-surface dialect pilot.
      refineLinearTheoremsWithProofSurface
        (checkLinearTheoremsSurface surf) content
    else if modName == "SystemsLean.Types" then
      -- L0/L1 structural then Types L2 term-surface (def-shape dialect pilot).
      refineTypesWithTermSurface (checkTypesSurface surf) content
    else if modName == "SystemsLean.TypesTheorems" then
      -- L0/L1 then TypesTheorems L3 proof-surface.
      refineTypesTheoremsWithProofSurface (checkTypesTheoremsSurface surf) content
    else if modName == "SystemsLean.IrProgram" then
      -- L0/L1 structural then IrProgram L2 term-surface (def-shape dialect pilot).
      refineIrProgramWithTermSurface (checkIrProgramSurface surf) content
    else if modName == "SystemsLean.IrProgramTheorems" then
      checkIrProgramTheoremsSurface surf
    else if modName == "SystemsLean.IrGraph" then
      -- L0/L1 structural then IrGraph L2 term-surface (def-shape dialect pilot).
      refineIrGraphWithTermSurface (checkIrGraphSurface surf) content
    else if modName == "SystemsLean.IrGraphTheorems" then
      checkIrGraphTheoremsSurface surf
    else if modName == "SystemsLean.HostCompose" then
      -- L0/L1 structural then HostCompose L2 term-surface (def-shape dialect pilot).
      refineHostComposeWithTermSurface (checkHostComposeSurface surf) content
    else if modName == "SystemsLean.HostComposeTheorems" then
      checkHostComposeTheoremsSurface surf
    else if modName == "SystemsLean.Erasure" then
      refineErasureWithTermSurface (checkErasureSurface surf) content
    else if modName == "SystemsLean.ErasureTheorems" then
      checkErasureTheoremsSurface surf
    else if modName == "SystemsLean.Extract" then
      refineExtractWithTermSurface (checkExtractSurface surf) content
    else if modName == "SystemsLean.ExtractTheorems" then
      checkExtractTheoremsSurface surf
    else if modName == "SystemsLean.CompilePath" then
      -- L0/L1 structural then CompilePath L2 term-surface (S2 dialect pilot).
      refineCompilePathWithTermSurface (checkCompilePathSurface surf) content
    else if modName == "SystemsLean.KernelMult" then
      -- L0/L1 structural then KernelMult L2 term-surface (def-shape dialect pilot).
      refineKernelMultWithTermSurface (checkKernelMultSurface surf) content
    else if modName == "SystemsLean.KernelLinear" then
      -- L0/L1 structural then KernelLinear L2 term-surface (def-shape dialect pilot).
      refineKernelLinearWithTermSurface (checkKernelLinearSurface surf) content
    else if modName == "SystemsLean.KernelTypes" then
      -- L0/L1 structural then KernelTypes L2 term-surface (def-shape dialect pilot).
      refineKernelTypesWithTermSurface (checkKernelTypesSurface surf) content
    else if modName == "SystemsLean.KernelProgram" then
      -- L0/L1 structural then KernelProgram L2 term-surface (def-shape dialect pilot).
      refineKernelProgramWithTermSurface (checkKernelProgramSurface surf) content
    else if modName == "SystemsLean.KernelMultTheorems" then
      -- L0/L1 structural then KernelMultTheorems L3 proof-surface dialect pilot.
      refineKernelMultTheoremsWithProofSurface
        (checkKernelMultTheoremsSurface surf) content
    else if modName == "SystemsLean.KernelLinearTheorems" then
      -- L0/L1 structural then KernelLinearTheorems L3 proof-surface dialect pilot.
      refineKernelLinearTheoremsWithProofSurface
        (checkKernelLinearTheoremsSurface surf) content
    else if modName == "SystemsLean.KernelTypesTheorems" then
      -- L0/L1 structural then KernelTypesTheorems L3 proof-surface dialect pilot.
      refineKernelTypesTheoremsWithProofSurface
        (checkKernelTypesTheoremsSurface surf) content
    else if modName == "SystemsLean.KernelProgramTheorems" then
      -- L0/L1 structural then KernelProgramTheorems L3 proof-surface dialect pilot.
      refineKernelProgramTheoremsWithProofSurface
        (checkKernelProgramTheoremsSurface surf) content
    else if modName == "SystemsLean.JoinMap" then
      -- L0/L1 structural then JoinMap L2 term-surface (S3).
      refineJoinMapWithTermSurface
        (checkJoinMapSurface surf) content
    else if modName == "SystemsLean.JoinMapTheorems" then
      checkJoinMapTheoremsSurface surf
    else if modName == "SystemsLean.SelfHost" then
      -- L0/L1 structural then SelfHost L2 term-surface (S4).
      refineSelfHostWithTermSurface
        (checkSelfHostSurface surf) content
    else if modName == "SystemsLean.SelfHostTheorems" then
      checkSelfHostTheoremsSurface surf
    else if modName == "SystemsLean.SurfaceMatrix" then
      -- L0/L1 structural then SurfaceMatrix L2 term-surface (S4).
      refineSurfaceMatrixWithTermSurface
        (checkSurfaceMatrixSurface surf) content
    else if modName == "SystemsLean.SurfaceMatrixTheorems" then
      checkSurfaceMatrixTheoremsSurface surf
    else if modName == "SystemsLean.EmitMultScaffold" then
      -- L0/L1 structural then EmitMultScaffold L2 term-surface.
      refineEmitMultScaffoldWithTermSurface
        (checkEmitMultScaffoldSurface surf) content
    else if modName == "SystemsLean.EmitLinearScaffold" then
      refineEmitLinearScaffoldWithTermSurface
        (checkEmitLinearScaffoldSurface surf) content
    else if modName == "SystemsLean.EmitTypesScaffold" then
      refineEmitTypesScaffoldWithTermSurface
        (checkEmitTypesScaffoldSurface surf) content
    else if modName == "SystemsLean.EmitProgramScaffold" then
      refineEmitProgramScaffoldWithTermSurface
        (checkEmitProgramScaffoldSurface surf) content
    else if modName == "SystemsLean.EmitGraphScaffold" then
      refineEmitGraphScaffoldWithTermSurface
        (checkEmitGraphScaffoldSurface surf) content
    else if modName == "SystemsLean.EmitComposeScaffold" then
      refineEmitComposeScaffoldWithTermSurface
        (checkEmitComposeScaffoldSurface surf) content
    else if modName == "SystemsLean.EmitPlanScaffold" then
      checkEmitPlanScaffoldSurface surf
    else if modName == "SystemsLean.EmitApplyScaffold" then
      checkEmitApplyScaffoldSurface surf
    else if modName == "SystemsLean.EmitBodyScaffold" then
      checkEmitBodyScaffoldSurface surf
    else if modName == "SystemsLean.EmitErasureScaffold" then
      refineEmitErasureScaffoldWithTermSurface
        (checkEmitErasureScaffoldSurface surf) content
    else if modName == "SystemsLean.EmitExtractScaffold" then
      refineEmitExtractScaffoldWithTermSurface
        (checkEmitExtractScaffoldSurface surf) content
    else if modName == "SystemsLean.EmitBannerScaffold" then
      refineEmitBannerScaffoldWithTermSurface
        (checkEmitBannerScaffoldSurface surf) content
    else if modName == "SystemsLean.KernelSelfApply" then
      refineKernelSelfApplyWithTermSurface
        (checkKernelSelfApplySurface surf) content
    else if modName == "SystemsLean.KernelSelfApplyTheorems" then
      checkKernelSelfApplyTheoremsSurface surf
    else if modName == "SystemsLean.EmitMult" then
      checkEmitMultSurface surf
    else if modName == "SystemsLean.EmitPlan" then
      refineEmitPlanWithTermSurface (checkEmitPlanSurface surf) content
    else if modName == "SystemsLean.EmitApply" then
      refineEmitApplyWithTermSurface (checkEmitApplySurface surf) content
    else if modName == "SystemsLean.EmitBody" then
      refineEmitBodyWithTermSurface (checkEmitBodySurface surf) content
    else if modName == "SystemsLean.KernelEmit" then
      -- L0/L1 structural then KernelEmit L2 term-surface (def-shape dialect pilot).
      refineKernelEmitWithTermSurface (checkKernelEmitSurface surf) content
    else if modName == "SystemsLean.KernelEmitTheorems" then
      -- L0/L1 structural then KernelEmitTheorems L3 proof-surface dialect pilot.
      refineKernelEmitTheoremsWithProofSurface
        (checkKernelEmitTheoremsSurface surf) content
    else if modName == "SystemsLean.ParityMult" then
      -- L0/L1 structural then ParityMult L2 term-surface (def-shape dialect pilot).
      refineParityMultWithTermSurface (checkParityMultSurface surf) content
    else if modName == "SystemsLean.ParityMultTheorems" then
      checkParityMultTheoremsSurface surf
    else if modName == "SystemsLean.ParityLinear" then
      -- L0/L1 structural then ParityLinear L2 term-surface (def-shape dialect pilot).
      refineParityLinearWithTermSurface (checkParityLinearSurface surf) content
    else if modName == "SystemsLean.ParityLinearTheorems" then
      checkParityLinearTheoremsSurface surf
    else if modName == "SystemsLean.ParityTypes" then
      -- L0/L1 structural then ParityTypes L2 term-surface (def-shape dialect pilot).
      refineParityTypesWithTermSurface (checkParityTypesSurface surf) content
    else if modName == "SystemsLean.ParityTypesTheorems" then
      checkParityTypesTheoremsSurface surf
    else if modName == "SystemsLean.ParityProgram" then
      -- L0/L1 structural then ParityProgram L2 term-surface (def-shape dialect pilot).
      refineParityProgramWithTermSurface (checkParityProgramSurface surf) content
    else if modName == "SystemsLean.ParityProgramTheorems" then
      checkParityProgramTheoremsSurface surf
    else if modName == "SystemsLean.ParityEmit" then
      -- L0/L1 structural then ParityEmit L2 term-surface (def-shape dialect pilot).
      refineParityEmitWithTermSurface (checkParityEmitSurface surf) content
    else if modName == "SystemsLean.ParityEmitTheorems" then
      checkParityEmitTheoremsSurface surf
    else if modName == "SystemsLean.SelfApply" then
      checkSelfApplySurface surf
    else if modName == "SystemsLean.SelfApplyTheorems" then
      checkSelfApplyTheoremsSurface surf
    else if modName == "SystemsLean.EmitLinear" then
      checkEmitLinearSurface surf
    else if modName == "SystemsLean.EmitTypes" then
      checkEmitTypesSurface surf
    else if modName == "SystemsLean.EmitProgram" then
      checkEmitProgramSurface surf
    else if modName == "SystemsLean.EmitGraph" then
      checkEmitGraphSurface surf
    else if modName == "SystemsLean.EmitCompose" then
      checkEmitComposeSurface surf
    else if modName == "SystemsLean.EmitErasure" then
      checkEmitErasureSurface surf
    else if modName == "SystemsLean.EmitExtract" then
      checkEmitExtractSurface surf
    else if modName == "SystemsLean.EmitBanner" then
      checkEmitBannerSurface surf
    else if modName == "SystemsLean.ProductOutKernel" then
      refineProductOutKernelWithTermSurface
        (checkProductOutKernelSurface surf) content
    else if modName == "SystemsLean.ProductOutKernelTheorems" then
      checkProductOutKernelTheoremsSurface surf
    else if modName == "SystemsLean.BootstrapHonesty" then
      checkBootstrapHonestySurface surf
    else if modName == "SystemsLean.BootstrapHonestyTheorems" then
      checkBootstrapHonestyTheoremsSurface surf
    else if modName == "SystemsLean.ProductPathWriterSurface" then
      checkProductPathWriterSurfaceSurface surf
    else if modName == "SystemsLean.ProductPathWriterSurfaceTheorems" then
      checkProductPathWriterSurfaceTheoremsSurface surf
    else if modName == "SystemsLean.ProductPathWriterPathPlan" then
      checkProductPathWriterPathPlanSurface surf
    else if modName == "SystemsLean.ProductPathWriterPathPlanTheorems" then
      checkProductPathWriterPathPlanTheoremsSurface surf
    else if modName == "SystemsLean.ProductPathWriterPathExec" then
      checkProductPathWriterPathExecSurface surf
    else if modName == "SystemsLean.ProductPathWriterPathExecTheorems" then
      checkProductPathWriterPathExecTheoremsSurface surf
    else if modName == "SystemsLean.ProductPathOwnershipInputs" then
      checkProductPathOwnershipInputsSurface surf
    else if modName == "SystemsLean.ProductPathOwnershipInputsTheorems" then
      checkProductPathOwnershipInputsTheoremsSurface surf
    else if modName == "SystemsLean.ProductPathPerform" then
      checkProductPathPerformSurface surf
    else if modName == "SystemsLean.ProductPathPerformTheorems" then
      checkProductPathPerformTheoremsSurface surf
    else if modName == "SystemsLean.ProductPathPerformStep" then
      checkProductPathPerformStepSurface surf
    else if modName == "SystemsLean.ProductPathPerformStepTheorems" then
      checkProductPathPerformStepTheoremsSurface surf
    else if modName == "SystemsLean.ProductPathReadSsot" then
      checkProductPathReadSsotSurface surf
    else if modName == "SystemsLean.ProductPathReadSsotTheorems" then
      checkProductPathReadSsotTheoremsSurface surf
    else if modName == "SystemsLean.ProductPathComposePlan" then
      checkProductPathComposePlanSurface surf
    else if modName == "SystemsLean.ProductPathComposePlanTheorems" then
      checkProductPathComposePlanTheoremsSurface surf
    else if modName == "SystemsLean.Capable" then
      checkCapableSurface surf
    else if modName == "SystemsLean.CapableTheorems" then
      checkCapableTheoremsSurface surf
    else if modName == "SystemsLean.CapableStepContract" then
      checkCapableStepContractSurface surf
    else if modName == "SystemsLean.CapableStepContractTheorems" then
      checkCapableStepContractTheoremsSurface surf
    else if modName == "SystemsLean.InstallOut" then
      checkInstallOutSurface surf
    else if modName == "SystemsLean.InstallOutTheorems" then
      checkInstallOutTheoremsSurface surf
    else if modName == "SystemsLean.OfficialPath" then
      checkOfficialPathSurface surf
    else if modName == "SystemsLean.OfficialPathTheorems" then
      checkOfficialPathTheoremsSurface surf
    else if modName == "SystemsLean.PerformEvidence" then
      checkPerformEvidenceSurface surf
    else if modName == "SystemsLean.PerformEvidenceTheorems" then
      checkPerformEvidenceTheoremsSurface surf
    else if modName == "SystemsLean.CapableRead" then
      checkCapableReadSurface surf
    else if modName == "SystemsLean.CapableReadTheorems" then
      checkCapableReadTheoremsSurface surf
    else if modName == "SystemsLean.CapableCompose" then
      checkCapableComposeSurface surf
    else if modName == "SystemsLean.CapableComposeTheorems" then
      checkCapableComposeTheoremsSurface surf
    else if modName == "SystemsLean.CapableFullBar" then
      checkCapableFullBarSurface surf
    else if modName == "SystemsLean.CapableFullBarTheorems" then
      checkCapableFullBarTheoremsSurface surf
    else if modName == "SystemsLean.DualEqWriteCapableGap" then
      checkDualEqWriteCapableGapSurface surf
    else if modName == "SystemsLean.DualEqWriteCapableGapTheorems" then
      checkDualEqWriteCapableGapTheoremsSurface surf
    else if modName == "SystemsLean.DualEqWriteClosePath" then
      checkDualEqWriteClosePathSurface surf
    else if modName == "SystemsLean.DualEqWriteClosePathTheorems" then
      checkDualEqWriteClosePathTheoremsSurface surf
    else if modName == "SystemsLean.DualEqWriteParity" then
      checkDualEqWriteParitySurface surf
    else if modName == "SystemsLean.DualEqWriteParityTheorems" then
      checkDualEqWriteParityTheoremsSurface surf
    else if modName == "SystemsLean.OfficialRetire" then
      checkOfficialRetireSurface surf
    else if modName == "SystemsLean.OfficialRetireTheorems" then
      checkOfficialRetireTheoremsSurface surf
    else if modName == "SystemsLean.OwnershipClaimed" then
      checkOwnershipClaimedSurface surf
    else if modName == "SystemsLean.OwnershipClaimedTheorems" then
      checkOwnershipClaimedTheoremsSurface surf
    else if modName == "SystemsLean.PerformClaimed" then
      checkPerformClaimedSurface surf
    else if modName == "SystemsLean.PerformClaimedTheorems" then
      checkPerformClaimedTheoremsSurface surf
    else if modName == "SystemsLean.StepContractFull" then
      checkStepContractFullSurface surf
    else if modName == "SystemsLean.StepContractFullTheorems" then
      checkStepContractFullTheoremsSurface surf
    else if modName == "SystemsLean.SelfHostComplete" then
      checkSelfHostCompleteSurface surf
    else if modName == "SystemsLean.SelfHostCompleteTheorems" then
      checkSelfHostCompleteTheoremsSurface surf
    else if modName == "SystemsLean.OfficialPathAlternate" then
      checkOfficialPathAlternateSurface surf
    else if modName == "SystemsLean.OfficialPathAlternateTheorems" then
      checkOfficialPathAlternateTheoremsSurface surf
    else if modName == "SystemsLean.ProductPathOwnershipRegenerate" then
      checkProductPathOwnershipRegenerateSurface surf
    else if modName == "SystemsLean.ProductPathOwnershipRegenerateTheorems" then
      checkProductPathOwnershipRegenerateTheoremsSurface surf
    else if modName == "SystemsLean.CapableWriteHcLoad" then
      checkCapableWriteHcLoadSurface surf
    else if modName == "SystemsLean.DualEqWriteLoad" then
      checkDualEqWriteLoadSurface surf
    else if modName == "SystemsLean.CapableWriteHc" then
      checkCapableWriteHcSurface surf
    else if modName == "SystemsLean.DualEqWriteApi" then
      checkDualEqWriteApiSurface surf
    else if modName == "SystemsLean.LlvmHold" then
      checkLlvmHoldSurface surf
    else if modName == "SystemsLean.LlvmHoldTheorems" then
      checkLlvmHoldTheoremsSurface surf
    else if modName == "SystemsLean.CapableRegenerate" then
      checkCapableRegenerateSurface surf
    else if modName == "SystemsLean.CapableRegenerateTheorems" then
      checkCapableRegenerateTheoremsSurface surf
    else if modName == "SystemsLean.FreestandingEmitLoad" then
      checkFreestandingEmitLoadSurface surf
    else if modName == "SystemsLean.FreestandingEmitLoadScaffold" then
      checkFreestandingEmitLoadScaffoldSurface surf
    else if modName == "SystemsLean.LakeRetireInventory" then
      checkLakeRetireInventorySurface surf
    else if modName == "SystemsLean.HostPackageRoots" then
      checkHostPackageRootsSurface surf
    else if modName == "SystemsLean.FreestandingEmit" then
      checkFreestandingEmitSurface surf
    else if modName == "SystemsLean.ProductPathWriteHc" then
      checkProductPathWriteHcSurface surf
    else if modName == "SystemsLean.ProductPathWriteHcTheorems" then
      checkProductPathWriteHcTheoremsSurface surf
    else if modName == "SystemsLean.CompilePathMult" then
      -- L0/L1 structural then CompilePathMult L2 term-surface (S8).
      refineCompilePathMultWithTermSurface
        (checkCompilePathMultSurface surf) content
    else if modName == "SystemsLean.CompilePathLinear" then
      refineCompilePathLinearWithTermSurface
        (checkCompilePathLinearSurface surf) content
    else if modName == "SystemsLean.CompilePathTypes" then
      refineCompilePathTypesWithTermSurface
        (checkCompilePathTypesSurface surf) content
    else if modName == "SystemsLean.CompilePathProgram" then
      refineCompilePathProgramWithTermSurface
        (checkCompilePathProgramSurface surf) content
    else if modName == "SystemsLean.CompilePathGraph" then
      refineCompilePathGraphWithTermSurface
        (checkCompilePathGraphSurface surf) content
    else if modName == "SystemsLean.CompilePathCompose" then
      refineCompilePathComposeWithTermSurface
        (checkCompilePathComposeSurface surf) content
    else if modName == "SystemsLean.CompilePathPlan" then
      refineCompilePathPlanWithTermSurface
        (checkCompilePathPlanSurface surf) content
    else if modName == "SystemsLean.CompilePathApply" then
      refineCompilePathApplyWithTermSurface
        (checkCompilePathApplySurface surf) content
    else if modName == "SystemsLean.CompilePathBody" then
      refineCompilePathBodyWithTermSurface
        (checkCompilePathBodySurface surf) content
    else if modName == "SystemsLean.CompilePathErasure" then
      refineCompilePathErasureWithTermSurface
        (checkCompilePathErasureSurface surf) content
    else if modName == "SystemsLean.CompilePathExtract" then
      refineCompilePathExtractWithTermSurface
        (checkCompilePathExtractSurface surf) content
    else if modName == "SystemsLean.ProductWireWriteTool" then
      checkProductWireWriteToolSurface surf
    else if modName == "SystemsLean.HostTerm" then
      checkHostTermSurface surf
    else if modName == "SystemsLean.LlvmEmitPath" then
      checkLlvmEmitPathSurface surf
    else if modName == "SystemsLean.SubsetFront" then
      checkSubsetFrontSurface surf
    else if modName == "SystemsLean.FirstSurface" then
      -- L0/L1 structural then FirstSurface L2 term-surface.
      refineFirstSurfaceWithTermSurface
        (checkFirstSurfaceSurface surf) content
    else if modName == "SystemsLean.LinearSubsetEmit" then
      -- L0/L1 structural then LinearSubsetEmit L2 term-surface.
      refineLinearSubsetEmitWithTermSurface
        (checkLinearSubsetEmitSurface surf) content
    else if modName == "SystemsLean.TypesSubsetEmit" then
      -- L0/L1 structural then TypesSubsetEmit L2 term-surface.
      refineTypesSubsetEmitWithTermSurface
        (checkTypesSubsetEmitSurface surf) content
    else if modName == "SystemsLean.ProgramSubsetEmit" then
      -- L0/L1 structural then ProgramSubsetEmit L2 term-surface.
      refineProgramSubsetEmitWithTermSurface
        (checkProgramSubsetEmitSurface surf) content
    else if modName == "SystemsLean.GraphSubsetEmit" then
      -- L0/L1 structural then GraphSubsetEmit L2 term-surface.
      refineGraphSubsetEmitWithTermSurface
        (checkGraphSubsetEmitSurface surf) content
    else if modName == "SystemsLean.ComposeSubsetEmit" then
      -- L0/L1 structural then ComposeSubsetEmit L2 term-surface.
      refineComposeSubsetEmitWithTermSurface
        (checkComposeSubsetEmitSurface surf) content
    else if modName == "SystemsLean.ErasureSubsetEmit" then
      -- L0/L1 structural then ErasureSubsetEmit L2 term-surface.
      refineErasureSubsetEmitWithTermSurface
        (checkErasureSubsetEmitSurface surf) content
    else if modName == "SystemsLean.ExtractSubsetEmit" then
      -- L0/L1 structural then ExtractSubsetEmit L2 term-surface.
      refineExtractSubsetEmitWithTermSurface
        (checkExtractSubsetEmitSurface surf) content
    else if modName == "SystemsLean.MultSubsetEmit" then
      -- L0/L1 structural then MultSubsetEmit L2 term-surface.
      refineMultSubsetEmitWithTermSurface
        (checkMultSubsetEmitSurface surf) content
    else if modName == "SystemsLean.MultSubsetRebuild" then
      -- L0/L1 structural then MultSubsetRebuild L2 term-surface.
      refineMultSubsetRebuildWithTermSurface
        (checkMultSubsetRebuildSurface surf) content
    else if modName == "SystemsLean.LinearSubsetRebuild" then
      -- L0/L1 structural then LinearSubsetRebuild L2 term-surface.
      refineLinearSubsetRebuildWithTermSurface
        (checkLinearSubsetRebuildSurface surf) content
    else if modName == "SystemsLean.TypesSubsetRebuild" then
      -- L0/L1 structural then TypesSubsetRebuild L2 term-surface.
      refineTypesSubsetRebuildWithTermSurface
        (checkTypesSubsetRebuildSurface surf) content
    else if modName == "SystemsLean.ProgramSubsetRebuild" then
      -- L0/L1 structural then ProgramSubsetRebuild L2 term-surface.
      refineProgramSubsetRebuildWithTermSurface
        (checkProgramSubsetRebuildSurface surf) content
    else if modName == "SystemsLean.GraphSubsetRebuild" then
      -- L0/L1 structural then GraphSubsetRebuild L2 term-surface.
      refineGraphSubsetRebuildWithTermSurface
        (checkGraphSubsetRebuildSurface surf) content
    else if modName == "SystemsLean.ComposeSubsetRebuild" then
      -- L0/L1 structural then ComposeSubsetRebuild L2 term-surface.
      refineComposeSubsetRebuildWithTermSurface
        (checkComposeSubsetRebuildSurface surf) content
    else if modName == "SystemsLean.ErasureSubsetRebuild" then
      -- L0/L1 structural then ErasureSubsetRebuild L2 term-surface.
      refineErasureSubsetRebuildWithTermSurface
        (checkErasureSubsetRebuildSurface surf) content
    else if modName == "SystemsLean.ExtractSubsetRebuild" then
      -- L0/L1 structural then ExtractSubsetRebuild L2 term-surface.
      refineExtractSubsetRebuildWithTermSurface
        (checkExtractSubsetRebuildSurface surf) content
    else if modName == "SystemsLean.HostFront" then
      -- L0/L1 structural then HostFront L2 term-surface.
      refineHostFrontWithTermSurface
        (checkHostFrontSurface surf) content
    else if modName == "SystemsLean.LlvmMultText" then
      -- L0/L1 structural then LLVM Mult text L2 term-surface.
      refineLlvmMultTextWithTermSurface
        (checkLlvmMultTextSurface surf) content
    else if modName == "SystemsLean.HostFrontTheorems" then
      checkHostFrontTheoremsSurface surf
    else if modName == "SystemsLean.HostCheck" then
      -- L0/L1 structural then HostCheck L2 term-surface.
      refineHostCheckWithTermSurface
        (checkHostCheckSurface surf) content
    else if modName == "SystemsLean.HostGraph" then
      -- L0/L1 structural then HostGraph L2 term-surface.
      refineHostGraphWithTermSurface
        (checkHostGraphSurface surf) content
    else if modName == "SystemsLean.LlvmLinearText" then
      -- L0/L1 structural then LLVM Linear text L2 term-surface.
      refineLlvmLinearTextWithTermSurface
        (checkLlvmLinearTextSurface surf) content
    else if modName == "SystemsLean.MultFsWriteTool" then
      -- L0/L1 structural then Mult package writer tool L2 term-surface.
      refineMultFsWriteToolWithTermSurface
        (checkMultFsWriteToolSurface surf) content
    else if modName == "SystemsLean.FrontMultPackage" then
      -- L0/L1 structural then FrontMultPackage L2 term-surface.
      refineFrontMultPackageWithTermSurface
        (checkFrontMultPackageSurface surf) content
    else if modName == "SystemsLean.SubsetPackageJoin" then
      -- L0/L1 structural then SubsetPackageJoin L2 term-surface.
      refineSubsetPackageJoinWithTermSurface
        (checkSubsetPackageJoinSurface surf) content
    else if modName == "SystemsLean.HostGraphTheorems" then
      checkHostGraphTheoremsSurface surf
    else if modName == "SystemsLean.LlvmTypesText" then
      -- L0/L1 structural then LLVM Types text L2 term-surface.
      refineLlvmTypesTextWithTermSurface
        (checkLlvmTypesTextSurface surf) content
    else if modName == "SystemsLean.MultFsDeepen" then
      -- L0/L1 structural then Mult freestanding deepen L2 term-surface.
      refineMultFsDeepenWithTermSurface
        (checkMultFsDeepenSurface surf) content
    else if modName == "SystemsLean.HostPackageWrite" then
      -- L0/L1 structural then Host package write L2 term-surface.
      refineHostPackageWriteWithTermSurface
        (checkHostPackageWriteSurface surf) content
    else if modName == "SystemsLean.HostPackageWriteTheorems" then
      checkHostPackageWriteTheoremsSurface surf
    else if modName == "SystemsLean.LlvmProgramText" then
      -- L0/L1 structural then LLVM Program text L2 term-surface.
      refineLlvmProgramTextWithTermSurface
        (checkLlvmProgramTextSurface surf) content
    else if modName == "SystemsLean.LlvmGraphText" then
      -- L0/L1 structural then LLVM Graph text L2 term-surface.
      refineLlvmGraphTextWithTermSurface
        (checkLlvmGraphTextSurface surf) content
    else if modName == "SystemsLean.LlvmComposeText" then
      -- L0/L1 structural then LLVM Compose text L2 term-surface.
      refineLlvmComposeTextWithTermSurface
        (checkLlvmComposeTextSurface surf) content
    else if modName == "SystemsLean.SelfApplyFs" then
      -- L0/L1 structural then SelfApply leftover L2 term-surface.
      refineSelfApplyFsWithTermSurface
        (checkSelfApplyFsSurface surf) content
    else if modName == "SystemsLean.SelfApplyFsTheorems" then
      checkSelfApplyFsTheoremsSurface surf
    else if modName == "SystemsLean.InventoryClose" then
      -- L0/L1 structural then InventoryClose leftover L2 term-surface.
      refineInventoryCloseWithTermSurface
        (checkInventoryCloseSurface surf) content
    else if modName == "SystemsLean.ProductPathBars" then
      -- L0/L1 structural then ProductPathBars leftover L2 term-surface.
      refineProductPathBarsWithTermSurface
        (checkProductPathBarsSurface surf) content
    else if modName == "SystemsLean.InventoryCloseTheorems" then
      checkInventoryCloseTheoremsSurface surf
    else if modName == "SystemsLean.ProductPath" then
      -- L0/L1 structural then ProductPath leftover L2 term-surface.
      refineProductPathWithTermSurface
        (checkProductPathSurface surf) content
    else if modName == "SystemsLean.ProductPathTheorems" then
      checkProductPathTheoremsSurface surf
    else if modName == "SystemsLean.DualResidual" then
      -- L0/L1 structural then DualResidual L2 term-surface (S6).
      refineDualResidualWithTermSurface
        (checkDualResidualSurface surf) content
    else if modName == "SystemsLean.DualResidualTheorems" then
      checkDualResidualTheoremsSurface surf
    else if modName == "SystemsLean.ProbeWire" then
      -- L0/L1 structural then ProbeWire leftover L2 term-surface.
      refineProbeWireWithTermSurface
        (checkProbeWireSurface surf) content
    else if modName == "SystemsLean.SelfHostBody" then
      -- L0/L1 structural then SelfHostBody leftover L2 term-surface.
      refineSelfHostBodyWithTermSurface
        (checkSelfHostBodySurface surf) content
    else if modName == "SystemsLean.ProbeWireTheorems" then
      checkProbeWireTheoremsSurface surf
    else if modName == "SystemsLean.SelfHostBodyTheorems" then
      checkSelfHostBodyTheoremsSurface surf
    else if modName == "SystemsLean.SpecProof" then
      -- L0/L1 structural then SpecProof leftover L2 term-surface.
      refineSpecProofWithTermSurface
        (checkSpecProofSurface surf) content
    else if modName == "SystemsLean.SpecProofTheorems" then
      checkSpecProofTheoremsSurface surf
    else
      match surf.namespaceName with
      | none => ModuleCheckResult.reject reasonMissingNamespace
      | some _ => ModuleCheckResult.accept surf
end SystemsLean.HostModuleCheck
