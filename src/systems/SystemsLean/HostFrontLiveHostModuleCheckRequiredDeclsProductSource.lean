/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckRequiredDeclsProduct.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckRequiredDeclsProductSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckRequiredDeclsProduct.lean.
  It is not HostModuleCheckRequiredDecls.lean.
  It is not HostModuleCheckRequiredDeclsLater.lean.
  It is not HostModuleCheckRequiredDeclsKernel.lean.
  Greppable: SYSTEMS_LEAN_HOST,
  liveHostModuleCheckRequiredDeclsProductSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsProductSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  FullHostElaborateRemains stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsProduct

/-- Dual-pinned live HostModuleCheckRequiredDeclsProduct.lean bytes.
    One raw string. The product is 623 lines, so this file stays under 780.
    Greppable: liveHostModuleCheckRequiredDeclsProductSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT. -/
def liveHostModuleCheckRequiredDeclsProductSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck required key-decl lists (ProductOut..CompilePathGraph).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.HostModuleCheckFixtures: required key-decl list defs for ProductOutKernel through CompilePathGraph leaves.
  Same namespace SystemsLean.HostModuleCheck so names stay unqualified.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckRequiredDeclsProduct,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, Host library seed expand continue,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckRequiredDeclsProduct
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckRequiredDeclsProduct;
  lake build SystemsLean.HostModuleCheck.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

namespace SystemsLean.HostModuleCheck

/-- Required ProductOutKernel key decls (SelfApplyFs leaf foundation).
    Greppable: productOutKernelRequiredDecls, Host library seed expand continue. -/
def productOutKernelRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productOutKernelModuleCite",
   "def:productOutKernelBarSurfaceOk",
   "def:productOutKernelEvidencePartialReady"]

/-- Required ProductOutKernelTheorems key decls.
    Greppable: productOutKernelTheoremsRequiredDecls, Host library seed expand continue. -/
def productOutKernelTheoremsRequiredDecls : List String :=
  ["theorem:productOutKernelEvidencePartialReady_true"]

/-- Required BootstrapHonesty key decls (SelfApplyFs leaf foundation).
    Greppable: bootstrapHonestyRequiredDecls, Host library seed expand continue. -/
def bootstrapHonestyRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:bootstrapHonestyModuleCite",
   "def:productPathBootstrapSurfaceOk",
   "def:productPathHostLakeBootstrapPartialReady"]

/-- Required BootstrapHonestyTheorems key decls.
    Greppable: bootstrapHonestyTheoremsRequiredDecls, Host library seed expand continue. -/
def bootstrapHonestyTheoremsRequiredDecls : List String :=
  ["theorem:productPathHostLakeBootstrapPartialReady_true",
   "theorem:productPathHostLakeBootstrapRemains_true"]

/-- Required ProductPathWriterSurface key decls (SelfApplyFs ProductPath writer pure leaf).
    Greppable: productPathWriterSurfaceRequiredDecls, Host library seed expand continue. -/
def productPathWriterSurfaceRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:writerSurfaceModuleCite",
   "def:productWriterSurfaceOk",
   "def:productWriterSurfacePartialReady"]

/-- Required ProductPathWriterSurfaceTheorems key decls.
    Greppable: productPathWriterSurfaceTheoremsRequiredDecls, Host library seed expand continue. -/
def productPathWriterSurfaceTheoremsRequiredDecls : List String :=
  ["theorem:productWriterSurfacePartialReady_true"]

/-- Required ProductPathWriterPathPlan key decls (SelfApplyFs ProductPath writer pure leaf).
    Greppable: productPathWriterPathPlanRequiredDecls, Host library seed expand continue. -/
def productPathWriterPathPlanRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:writerPathPlanModuleCite",
   "def:productWriterPathPlanOk",
   "def:productWriterPathPlanPartialReady"]

/-- Required ProductPathWriterPathPlanTheorems key decls.
    Greppable: productPathWriterPathPlanTheoremsRequiredDecls, Host library seed expand continue. -/
def productPathWriterPathPlanTheoremsRequiredDecls : List String :=
  ["theorem:productWriterPathPlanPartialReady_true"]

/-- Required ProductPathWriterPathExec key decls (SelfApplyFs ProductPath writer pure leaf).
    Greppable: productPathWriterPathExecRequiredDecls, Host library seed expand continue. -/
def productPathWriterPathExecRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:writerPathExecModuleCite",
   "def:productWriterPathExecutionOk",
   "def:productWriterPathExecutionPartialReady"]

/-- Required ProductPathWriterPathExecTheorems key decls.
    Greppable: productPathWriterPathExecTheoremsRequiredDecls, Host library seed expand continue. -/
def productPathWriterPathExecTheoremsRequiredDecls : List String :=
  ["theorem:productWriterPathExecutionPartialReady_true"]

/-- Required ProductPathOwnershipInputs key decls (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathOwnershipInputsRequiredDecls, Host library seed expand continue. -/
def productPathOwnershipInputsRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:ownershipInputsModuleCite",
   "def:productPathOwnershipInputsOk",
   "def:productPathOwnershipInputsPartialReady"]

/-- Required ProductPathOwnershipInputsTheorems key decls.
    Greppable: productPathOwnershipInputsTheoremsRequiredDecls, Host library seed expand continue. -/
def productPathOwnershipInputsTheoremsRequiredDecls : List String :=
  ["theorem:productPathOwnershipInputsPartialReady_true"]

/-- Required ProductPathPerform key decls (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathPerformRequiredDecls, Host library seed expand continue. -/
def productPathPerformRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:performModuleCite",
   "def:productPathPerformOk",
   "def:productPathPerformPartialReady"]

/-- Required ProductPathPerformTheorems key decls.
    Greppable: productPathPerformTheoremsRequiredDecls, Host library seed expand continue. -/
def productPathPerformTheoremsRequiredDecls : List String :=
  ["theorem:productPathPerformPartialReady_true"]

/-- Required ProductPathPerformStep key decls (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathPerformStepRequiredDecls, Host library seed expand continue. -/
def productPathPerformStepRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:stepModuleCite",
   "def:productPathPerformStepOk",
   "def:productPathPerformStepPartialReady"]

/-- Required ProductPathPerformStepTheorems key decls.
    Greppable: productPathPerformStepTheoremsRequiredDecls, Host library seed expand continue. -/
def productPathPerformStepTheoremsRequiredDecls : List String :=
  ["theorem:productPathPerformStepPartialReady_true"]

/-- Required ProductPathReadSsot key decls (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathReadSsotRequiredDecls, Host library seed expand continue. -/
def productPathReadSsotRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:readModuleCite",
   "def:productPathPerformReadOk",
   "def:productPathPerformReadPartialReady"]

/-- Required ProductPathReadSsotTheorems key decls.
    Greppable: productPathReadSsotTheoremsRequiredDecls, Host library seed expand continue. -/
def productPathReadSsotTheoremsRequiredDecls : List String :=
  ["theorem:productPathPerformReadPartialReady_true"]

/-- Required ProductPathComposePlan key decls (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathComposePlanRequiredDecls, Host library seed expand continue. -/
def productPathComposePlanRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:composeModuleCite",
   "def:productPathPerformComposeOk",
   "def:productPathPerformComposePartialReady"]

/-- Required ProductPathComposePlanTheorems key decls.
    Greppable: productPathComposePlanTheoremsRequiredDecls, Host library seed expand continue. -/
def productPathComposePlanTheoremsRequiredDecls : List String :=
  ["theorem:productPathPerformComposePartialReady_true"]

/-- Required Capable key decls (SelfApplyFs freestanding-capable gap pure leaf).
    Greppable: capableRequiredDecls, Host library seed expand continue. -/
def capableRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathFreestandingCapableOk",
   "def:productPathFreestandingCapablePartialReady",
   "def:productPathFreestandingCapableFullPerform"]

/-- Required CapableTheorems key decls.
    Greppable: capableTheoremsRequiredDecls, Host library seed expand continue. -/
def capableTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingCapablePartialReady_true"]

/-- Required CapableStepContract key decls.
    Greppable: capableStepContractRequiredDecls, Host library seed expand continue. -/
def capableStepContractRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathFreestandingCapableStepContractOk",
   "def:productPathFreestandingCapableStepContractPartialReady",
   "def:productPathFreestandingCapableStepContractFullSatisfied"]

/-- Required CapableStepContractTheorems key decls.
    Greppable: capableStepContractTheoremsRequiredDecls, Host library seed expand continue. -/
def capableStepContractTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingCapableStepContractPartialReady_true"]

/-- Required InstallOut key decls.
    Greppable: installOutRequiredDecls, Host library seed expand continue. -/
def installOutRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathFreestandingCapableInstallOutOk",
   "def:productPathFreestandingCapableInstallOutPartialReady",
   "def:productPathFreestandingCapableInstallOutAuthorityNotEmit"]

/-- Required InstallOutTheorems key decls.
    Greppable: installOutTheoremsRequiredDecls, Host library seed expand continue. -/
def installOutTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingCapableInstallOutPartialReady_true"]

/-- Required OfficialPath key decls.
    Greppable: officialPathRequiredDecls, Host library seed expand continue. -/
def officialPathRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathFreestandingPerformOfficialPathOk",
   "def:productPathFreestandingPerformOfficialPathPartialReady",
   "def:productPathFreestandingPerformOfficialPathGapMeasured"]

/-- Required OfficialPathTheorems key decls.
    Greppable: officialPathTheoremsRequiredDecls, Host library seed expand continue. -/
def officialPathTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingPerformOfficialPathPartialReady_true"]

/-- Required PerformEvidence key decls.
    Greppable: performEvidenceRequiredDecls, Host library seed expand continue. -/
def performEvidenceRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathFreestandingPerformEvidenceOk",
   "def:productPathFreestandingPerformEvidencePartialReady",
   "def:productPathFreestandingPerformEvidenceClaimed"]

/-- Required PerformEvidenceTheorems key decls.
    Greppable: performEvidenceTheoremsRequiredDecls, Host library seed expand continue. -/
def performEvidenceTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingPerformEvidencePartialReady_true"]

/-- Required CapableRead key decls.
    Greppable: capableReadRequiredDecls, Host library seed expand continue. -/
def capableReadRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathFreestandingCapableReadOk",
   "def:productPathFreestandingCapableReadPartialReady",
   "def:productPathFreestandingCapableReadAuthorityNotEmit"]

/-- Required CapableReadTheorems key decls.
    Greppable: capableReadTheoremsRequiredDecls, Host library seed expand continue. -/
def capableReadTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingCapableReadPartialReady_true"]

/-- Required CapableCompose key decls.
    Greppable: capableComposeRequiredDecls, Host library seed expand continue. -/
def capableComposeRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathFreestandingCapableComposeOk",
   "def:productPathFreestandingCapableComposePartialReady",
   "def:productPathFreestandingCapableComposeAuthorityNotEmit"]

/-- Required CapableComposeTheorems key decls.
    Greppable: capableComposeTheoremsRequiredDecls, Host library seed expand continue. -/
def capableComposeTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingCapableComposePartialReady_true"]

/-- Required CapableFullBar key decls.
    Greppable: capableFullBarRequiredDecls, Host library seed expand continue. -/
def capableFullBarRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathFreestandingCapableFullBarOk",
   "def:productPathFreestandingCapableFullBarPartialReady",
   "def:productPathFreestandingCapableFullBarStepContractsClosed"]

/-- Required CapableFullBarTheorems key decls.
    Greppable: capableFullBarTheoremsRequiredDecls, Host library seed expand continue. -/
def capableFullBarTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingCapableFullBarPartialReady_true"]

/-- Required DualEqWriteCapableGap key decls.
    Greppable: dualEqWriteCapableGapRequiredDecls, Host library seed expand continue. -/
def dualEqWriteCapableGapRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathFreestandingPerformDualEqualityWriteCapableGapOk",
   "def:productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady",
   "def:productPathDualEqualityWriteCapableGapClosed"]

/-- Required DualEqWriteCapableGapTheorems key decls.
    Greppable: dualEqWriteCapableGapTheoremsRequiredDecls, Host library seed expand continue. -/
def dualEqWriteCapableGapTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady_true"]

/-- Required DualEqWriteClosePath key decls.
    Greppable: dualEqWriteClosePathRequiredDecls, Host library seed expand continue. -/
def dualEqWriteClosePathRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathFreestandingPerformDualEqualityWriteClosePathOk",
   "def:productPathFreestandingPerformDualEqualityWriteClosePathPartialReady",
   "def:productPathDualEqualityWriteClosePathNamed"]

/-- Required DualEqWriteClosePathTheorems key decls.
    Greppable: dualEqWriteClosePathTheoremsRequiredDecls, Host library seed expand continue. -/
def dualEqWriteClosePathTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingPerformDualEqualityWriteClosePathPartialReady_true"]

/-- Required DualEqWriteParity key decls.
    Greppable: dualEqWriteParityRequiredDecls, Host library seed expand continue. -/
def dualEqWriteParityRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathFreestandingPerformDualEqualityWriteParityOk",
   "def:productPathFreestandingPerformDualEqualityWriteParityPartialReady",
   "def:productPathDualEqualityWriteParityGapOpen"]

/-- Required DualEqWriteParityTheorems key decls.
    Greppable: dualEqWriteParityTheoremsRequiredDecls, Host library seed expand continue. -/
def dualEqWriteParityTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingPerformDualEqualityWriteParityPartialReady_true"]

/-- Required OfficialRetire key decls.
    Greppable: officialRetireRequiredDecls, Host library seed expand continue. -/
def officialRetireRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathOfficialPathRetireOfficialOk",
   "def:productPathOfficialPathRetireOfficialPartialReady",
   "def:productPathOfficialPathRetireOfficialMeasured"]

/-- Required OfficialRetireTheorems key decls.
    Greppable: officialRetireTheoremsRequiredDecls, Host library seed expand continue. -/
def officialRetireTheoremsRequiredDecls : List String :=
  ["theorem:productPathOfficialPathRetireOfficialPartialReady_true"]

/-- Required OwnershipClaimed key decls.
    Greppable: ownershipClaimedRequiredDecls, Host library seed expand continue. -/
def ownershipClaimedRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathFreestandingOwnershipClaimedOk",
   "def:productPathFreestandingOwnershipClaimedPartialReady",
   "def:productPathFreestandingOwnershipClaimedMeasured"]

/-- Required OwnershipClaimedTheorems key decls.
    Greppable: ownershipClaimedTheoremsRequiredDecls, Host library seed expand continue. -/
def ownershipClaimedTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingOwnershipClaimedPartialReady_true"]

/-- Required PerformClaimed key decls.
    Greppable: performClaimedRequiredDecls, Host library seed expand continue. -/
def performClaimedRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathFreestandingPerformClaimedOk",
   "def:productPathFreestandingPerformClaimedPartialReady",
   "def:productPathFreestandingPerformClaimedMeasured"]

/-- Required PerformClaimedTheorems key decls.
    Greppable: performClaimedTheoremsRequiredDecls, Host library seed expand continue. -/
def performClaimedTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingPerformClaimedPartialReady_true"]

/-- Required StepContractFull key decls.
    Greppable: stepContractFullRequiredDecls, Host library seed expand continue. -/
def stepContractFullRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:stepContractFullOk",
   "def:stepContractFullPartialReady",
   "def:stepContractFullMeasured"]

/-- Required StepContractFullTheorems key decls.
    Greppable: stepContractFullTheoremsRequiredDecls, Host library seed expand continue. -/
def stepContractFullTheoremsRequiredDecls : List String :=
  ["theorem:stepContractFullPartialReady_true"]

/-- Required SelfHostComplete key decls.
    Greppable: selfHostCompleteRequiredDecls, Host library seed expand continue. -/
def selfHostCompleteRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:freestandingProductSelfHostCompleteOk",
   "def:freestandingProductSelfHostCompletePartialReady",
   "def:freestandingProductSelfHostCompleteMeasured"]

/-- Required SelfHostCompleteTheorems key decls.
    Greppable: selfHostCompleteTheoremsRequiredDecls, Host library seed expand continue. -/
def selfHostCompleteTheoremsRequiredDecls : List String :=
  ["theorem:freestandingProductSelfHostCompletePartialReady_true"]

/-- Required OfficialPathAlternate key decls.
    Greppable: officialPathAlternateRequiredDecls, Host library seed expand continue. -/
def officialPathAlternateRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathFreestandingPerformOfficialPathAlternateOk",
   "def:productPathFreestandingPerformOfficialPathAlternatePartialReady",
   "def:productPathFreestandingPerformOfficialPathAlternateMeasured"]

/-- Required OfficialPathAlternateTheorems key decls.
    Greppable: officialPathAlternateTheoremsRequiredDecls, Host library seed expand continue. -/
def officialPathAlternateTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingPerformOfficialPathAlternatePartialReady_true"]

/-- Required ProductPathOwnershipRegenerate key decls.
    Greppable: productPathOwnershipRegenerateRequiredDecls, Host library seed expand continue. -/
def productPathOwnershipRegenerateRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productPathOwnershipRegenerateOk",
   "def:productPathOwnershipRegeneratePartialReady",
   "def:productPathOwnershipRegenerateWithoutLake"]

/-- Required ProductPathOwnershipRegenerateTheorems key decls.
    Greppable: productPathOwnershipRegenerateTheoremsRequiredDecls, Host library seed expand continue. -/
def productPathOwnershipRegenerateTheoremsRequiredDecls : List String :=
  ["theorem:productPathOwnershipRegeneratePartialReady_true"]

/-- Required CapableWriteHcLoad key decls (namespace SystemsLean.CapableWriteHc).
    Greppable: capableWriteHcLoadRequiredDecls, Host library seed expand continue. -/
def capableWriteHcLoadRequiredDecls : List String :=
  ["def:stageId",
   "def:dualEqualityGateId",
   "def:freestandingCapableWriteLoadOneSsot",
   "def:assembleHeaderFromSsot",
   "def:assembleSourceFromSsot",
   "def:productWireHonestyTokens"]

/-- Required DualEqWriteLoad key decls (namespace SystemsLean.DualEqWriteApi).
    Greppable: dualEqWriteLoadRequiredDecls, Host library seed expand continue. -/
def dualEqWriteLoadRequiredDecls : List String :=
  ["def:stageId",
   "def:dualEqualityGateId",
   "def:freestandingDualEqualityWriteLoadOne",
   "def:assembleHeaderFromSsot",
   "def:assembleSourceFromSsot",
   "def:productWireHonestyTokens"]

/-- Required CapableWriteHc key decls.
    Greppable: capableWriteHcRequiredDecls, Host library seed expand continue. -/
def capableWriteHcRequiredDecls : List String :=
  ["def:hostId",
   "def:selfHostId",
   "def:freestandingCapableWriteHcApi",
   "def:productPathFreestandingCapableWriteHcOk",
   "def:productPathFreestandingCapableWriteHcPartialReady",
   "def:lakeExeName"]

/-- Required DualEqWriteApi key decls.
    Greppable: dualEqWriteApiRequiredDecls, Host library seed expand continue. -/
def dualEqWriteApiRequiredDecls : List String :=
  ["def:hostId",
   "def:selfHostId",
   "def:freestandingDualEqualityWriteApi",
   "def:productPathDualEqualityWriteApiPresent",
   "def:productPathFreestandingPerformDualEqualityWriteApiMeasured",
   "def:dualEqualityWriteApiId"]

/-- Required LlvmHold key decls.
    Greppable: llvmHoldRequiredDecls, Host library seed expand continue. -/
def llvmHoldRequiredDecls : List String :=
  ["def:stageId",
   "def:hostLlvmHoldId",
   "def:selfHostLlvmHoldId",
   "def:llvmHoldSurfaceOk",
   "def:llvmHoldReady",
   "def:llvmHoldOk"]

/-- Required LlvmHoldTheorems key decls.
    Greppable: llvmHoldTheoremsRequiredDecls, Host library seed expand continue. -/
def llvmHoldTheoremsRequiredDecls : List String :=
  ["theorem:llvmHoldReady_true"]

/-- Required CapableRegenerate key decls (on-disk CapableRegenerate.lean).
    Greppable: capableRegenerateRequiredDecls, Host library seed expand continue. -/
def capableRegenerateRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:freestandingCapableRegenerateApi",
   "def:productPathFreestandingCapableRegenerateOk",
   "def:productPathFreestandingCapableRegeneratePartialReady"]

/-- Required CapableRegenerateTheorems key decls.
    Greppable: capableRegenerateTheoremsRequiredDecls, Host library seed expand continue. -/
def capableRegenerateTheoremsRequiredDecls : List String :=
  ["theorem:productPathFreestandingCapableRegeneratePartialReady_true"]

/-- Required FreestandingEmitLoad key decls (on-disk FreestandingEmitLoad.lean).
    Greppable: freestandingEmitLoadRequiredDecls, Host library seed expand continue. -/
def freestandingEmitLoadRequiredDecls : List String :=
  ["def:stageId",
   "def:dualSsotEqualityGateId",
   "def:dualSsotBlockEqual",
   "def:dualSsotEqualityLive",
   "def:loadBodySsot",
   "def:loadBannerSsot"]

/-- Required FreestandingEmitLoadScaffold key decls.
    Greppable: freestandingEmitLoadScaffoldRequiredDecls, Host library seed expand continue. -/
def freestandingEmitLoadScaffoldRequiredDecls : List String :=
  ["def:loadMultSsot",
   "def:loadLinearSsot",
   "def:loadTypesSsot",
   "def:loadProgramSsot",
   "def:loadApplySsot"]

/-- Required LakeRetireInventory key decls.
    Greppable: lakeRetireInventoryRequiredDecls, Host library seed expand continue. -/
def lakeRetireInventoryRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:surfaceId",
   "def:lakeRetireInventoryFinishedClaimed",
   "def:lakeRetireHostElaborateRemains"]

/-- Required HostPackageRoots key decls.
    Greppable: hostPackageRootsRequiredDecls, Host library seed expand continue. -/
def hostPackageRootsRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:surfaceId",
   "def:hostPackageRootsPackageName",
   "def:hostPackageRootsHostElaboratorResidualRemains"]

/-- Required FreestandingEmit key decls (on-disk FreestandingEmit.lean).
    Greppable: freestandingEmitRequiredDecls, Host library seed expand continue. -/
def freestandingEmitRequiredDecls : List String :=
  ["def:renderHeader",
   "def:renderSource",
   "def:validateProduct",
   "def:emitAtRoot",
   "def:main"]

/-- Required ProductPathWriteHc key decls.
    Greppable: productPathWriteHcRequiredDecls, Host library seed expand continue. -/
def productPathWriteHcRequiredDecls : List String :=
  ["def:stageId",
   "def:productPathPerformWriteHcOk",
   "def:productPathPerformWriteHcPartialReady",
   "def:writeFreestandingHcAtRoot",
   "def:productPathPerformWriteHcDependsOnLake"]

/-- Required ProductPathWriteHcTheorems key decls.
    Greppable: productPathWriteHcTheoremsRequiredDecls, Host library seed expand continue. -/
def productPathWriteHcTheoremsRequiredDecls : List String :=
  ["theorem:productPathPerformWriteHcPartialReady_true",
   "theorem:productPathPerformWriteHcOk_true",
   "theorem:productPathPerformWriteHcDependsOnLake_true"]

/-- Required CompilePathMult key decls (ns SystemsLean.CompilePath).
    Greppable: compilePathMultRequiredDecls, Host library seed expand continue. -/
def compilePathMultRequiredDecls : List String :=
  ["def:multFixtureProgramReady",
   "def:multFixtureComposeReady",
   "def:multFixtureEmitPathOk",
   "def:multFixtureCompilePathReady",
   "def:multFixtureResidualFreeClaimed"]

/-- Required CompilePathLinear key decls.
    Greppable: compilePathLinearRequiredDecls, Host library seed expand continue. -/
def compilePathLinearRequiredDecls : List String :=
  ["def:linearFixtureProgramReady",
   "def:linearFixtureComposeReady",
   "def:linearFixtureEmitPathOk",
   "def:linearFixtureCompilePathReady",
   "def:linearFixtureResidualFreeClaimed"]

/-- Required CompilePathTypes key decls.
    Greppable: compilePathTypesRequiredDecls, Host library seed expand continue. -/
def compilePathTypesRequiredDecls : List String :=
  ["def:typesFixtureProgramReady",
   "def:typesFixtureComposeReady",
   "def:typesFixtureEmitPathOk",
   "def:typesFixtureCompilePathReady",
   "def:typesFixtureResidualFreeClaimed"]

/-- Required CompilePathProgram key decls.
    Greppable: compilePathProgramRequiredDecls, Host library seed expand continue. -/
def compilePathProgramRequiredDecls : List String :=
  ["def:programFixtureProgramReady",
   "def:programFixtureComposeReady",
   "def:programFixtureEmitPathOk",
   "def:programFixtureCompilePathReady",
   "def:programFixtureResidualFreeClaimed"]

/-- Required CompilePathGraph key decls.
    Greppable: compilePathGraphRequiredDecls, Host library seed expand continue. -/
def compilePathGraphRequiredDecls : List String :=
  ["def:graphFixtureProgramReady",
   "def:graphFixtureComposeReady",
   "def:graphFixtureEmitPathOk",
   "def:graphFixtureCompilePathReady",
   "def:graphFixtureResidualFreeClaimed"]


end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsProduct
