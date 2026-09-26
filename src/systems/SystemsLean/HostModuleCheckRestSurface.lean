import SystemsLean.HostModuleCheckFixtures
import SystemsLean.HostModuleCheckSurface

namespace SystemsLean.HostModuleCheck

/-- Check InstallOut leaf.
    Greppable: checkInstallOutSurface. -/
def checkInstallOutSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf installOutExpectedNamespace
    installOutRequiredDecls none

/-- Check InstallOutTheorems (parent ns InstallOut).
    Greppable: checkInstallOutTheoremsSurface. -/
def checkInstallOutTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf installOutExpectedNamespace
    installOutTheoremsRequiredDecls (some "SystemsLean.InstallOut")

/-- Check OfficialPath leaf.
    Greppable: checkOfficialPathSurface. -/
def checkOfficialPathSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf officialPathExpectedNamespace
    officialPathRequiredDecls none

/-- Check OfficialPathTheorems (parent ns OfficialPath).
    Greppable: checkOfficialPathTheoremsSurface. -/
def checkOfficialPathTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf officialPathExpectedNamespace
    officialPathTheoremsRequiredDecls (some "SystemsLean.OfficialPath")

/-- Check PerformEvidence leaf.
    Greppable: checkPerformEvidenceSurface. -/
def checkPerformEvidenceSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf performEvidenceExpectedNamespace
    performEvidenceRequiredDecls none

/-- Check PerformEvidenceTheorems (parent ns PerformEvidence).
    Greppable: checkPerformEvidenceTheoremsSurface. -/
def checkPerformEvidenceTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf performEvidenceExpectedNamespace
    performEvidenceTheoremsRequiredDecls (some "SystemsLean.PerformEvidence")

/-- Check CapableRead leaf.
    Greppable: checkCapableReadSurface. -/
def checkCapableReadSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf capableReadExpectedNamespace
    capableReadRequiredDecls none

/-- Check CapableReadTheorems (parent ns CapableRead).
    Greppable: checkCapableReadTheoremsSurface. -/
def checkCapableReadTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf capableReadExpectedNamespace
    capableReadTheoremsRequiredDecls (some "SystemsLean.CapableRead")

/-- Check CapableCompose leaf.
    Greppable: checkCapableComposeSurface. -/
def checkCapableComposeSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf capableComposeExpectedNamespace
    capableComposeRequiredDecls none

/-- Check CapableComposeTheorems (parent ns CapableCompose).
    Greppable: checkCapableComposeTheoremsSurface. -/
def checkCapableComposeTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf capableComposeExpectedNamespace
    capableComposeTheoremsRequiredDecls (some "SystemsLean.CapableCompose")

/-- Check CapableFullBar leaf.
    Greppable: checkCapableFullBarSurface. -/
def checkCapableFullBarSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf capableFullBarExpectedNamespace
    capableFullBarRequiredDecls none

/-- Check CapableFullBarTheorems (parent ns CapableFullBar).
    Greppable: checkCapableFullBarTheoremsSurface. -/
def checkCapableFullBarTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf capableFullBarExpectedNamespace
    capableFullBarTheoremsRequiredDecls (some "SystemsLean.CapableFullBar")

/-- Check DualEqWriteCapableGap leaf.
    Greppable: checkDualEqWriteCapableGapSurface. -/
def checkDualEqWriteCapableGapSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf dualEqWriteCapableGapExpectedNamespace
    dualEqWriteCapableGapRequiredDecls none

/-- Check DualEqWriteCapableGapTheorems (parent ns DualEqWriteCapableGap).
    Greppable: checkDualEqWriteCapableGapTheoremsSurface. -/
def checkDualEqWriteCapableGapTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf dualEqWriteCapableGapExpectedNamespace
    dualEqWriteCapableGapTheoremsRequiredDecls (some "SystemsLean.DualEqWriteCapableGap")

/-- Check DualEqWriteClosePath leaf.
    Greppable: checkDualEqWriteClosePathSurface. -/
def checkDualEqWriteClosePathSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf dualEqWriteClosePathExpectedNamespace
    dualEqWriteClosePathRequiredDecls none

/-- Check DualEqWriteClosePathTheorems (parent ns DualEqWriteClosePath).
    Greppable: checkDualEqWriteClosePathTheoremsSurface. -/
def checkDualEqWriteClosePathTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf dualEqWriteClosePathExpectedNamespace
    dualEqWriteClosePathTheoremsRequiredDecls (some "SystemsLean.DualEqWriteClosePath")

/-- Check DualEqWriteParity leaf.
    Greppable: checkDualEqWriteParitySurface. -/
def checkDualEqWriteParitySurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf dualEqWriteParityExpectedNamespace
    dualEqWriteParityRequiredDecls none

/-- Check DualEqWriteParityTheorems (parent ns DualEqWriteParity).
    Greppable: checkDualEqWriteParityTheoremsSurface. -/
def checkDualEqWriteParityTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf dualEqWriteParityExpectedNamespace
    dualEqWriteParityTheoremsRequiredDecls (some "SystemsLean.DualEqWriteParity")

/-- Check OfficialRetire leaf.
    Greppable: checkOfficialRetireSurface. -/
def checkOfficialRetireSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf officialRetireExpectedNamespace
    officialRetireRequiredDecls none

/-- Check OfficialRetireTheorems (parent ns OfficialRetire).
    Greppable: checkOfficialRetireTheoremsSurface. -/
def checkOfficialRetireTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf officialRetireExpectedNamespace
    officialRetireTheoremsRequiredDecls (some "SystemsLean.OfficialRetire")

/-- Check OwnershipClaimed leaf.
    Greppable: checkOwnershipClaimedSurface. -/
def checkOwnershipClaimedSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf ownershipClaimedExpectedNamespace
    ownershipClaimedRequiredDecls none

/-- Check OwnershipClaimedTheorems (parent ns OwnershipClaimed).
    Greppable: checkOwnershipClaimedTheoremsSurface. -/
def checkOwnershipClaimedTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf ownershipClaimedExpectedNamespace
    ownershipClaimedTheoremsRequiredDecls (some "SystemsLean.OwnershipClaimed")

/-- Check PerformClaimed leaf.
    Greppable: checkPerformClaimedSurface. -/
def checkPerformClaimedSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf performClaimedExpectedNamespace
    performClaimedRequiredDecls none

/-- Check PerformClaimedTheorems (parent ns PerformClaimed).
    Greppable: checkPerformClaimedTheoremsSurface. -/
def checkPerformClaimedTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf performClaimedExpectedNamespace
    performClaimedTheoremsRequiredDecls (some "SystemsLean.PerformClaimed")

/-- Check StepContractFull leaf.
    Greppable: checkStepContractFullSurface. -/
def checkStepContractFullSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf stepContractFullExpectedNamespace
    stepContractFullRequiredDecls none

/-- Check StepContractFullTheorems (parent ns StepContractFull).
    Greppable: checkStepContractFullTheoremsSurface. -/
def checkStepContractFullTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf stepContractFullExpectedNamespace
    stepContractFullTheoremsRequiredDecls (some "SystemsLean.StepContractFull")

/-- Check SelfHostComplete leaf.
    Greppable: checkSelfHostCompleteSurface. -/
def checkSelfHostCompleteSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf selfHostCompleteExpectedNamespace
    selfHostCompleteRequiredDecls none

/-- Check SelfHostCompleteTheorems (parent ns SelfHostComplete).
    Greppable: checkSelfHostCompleteTheoremsSurface. -/
def checkSelfHostCompleteTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf selfHostCompleteExpectedNamespace
    selfHostCompleteTheoremsRequiredDecls (some "SystemsLean.SelfHostComplete")

/-- Check OfficialPathAlternate leaf.
    Greppable: checkOfficialPathAlternateSurface. -/
def checkOfficialPathAlternateSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf officialPathAlternateExpectedNamespace
    officialPathAlternateRequiredDecls none

/-- Check OfficialPathAlternateTheorems (parent ns OfficialPathAlternate).
    Greppable: checkOfficialPathAlternateTheoremsSurface. -/
def checkOfficialPathAlternateTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf officialPathAlternateExpectedNamespace
    officialPathAlternateTheoremsRequiredDecls
    (some "SystemsLean.OfficialPathAlternate")

/-- Check ProductPathOwnershipRegenerate leaf.
    Greppable: checkProductPathOwnershipRegenerateSurface. -/
def checkProductPathOwnershipRegenerateSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathOwnershipRegenerateExpectedNamespace
    productPathOwnershipRegenerateRequiredDecls none

/-- Check ProductPathOwnershipRegenerateTheorems (parent ns ProductPathOwnershipRegenerate).
    Greppable: checkProductPathOwnershipRegenerateTheoremsSurface. -/
def checkProductPathOwnershipRegenerateTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathOwnershipRegenerateExpectedNamespace
    productPathOwnershipRegenerateTheoremsRequiredDecls
    (some "SystemsLean.ProductPathOwnershipRegenerate")

/-- Check CapableWriteHcLoad multi-import surface (ns CapableWriteHc; EmitBanner sample).
    Greppable: checkCapableWriteHcLoadSurface. -/
def checkCapableWriteHcLoadSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf capableWriteHcExpectedNamespace
    capableWriteHcLoadRequiredDecls (some "SystemsLean.EmitBanner")

/-- Check DualEqWriteLoad multi-import surface (ns DualEqWriteApi; EmitBanner sample).
    Greppable: checkDualEqWriteLoadSurface. -/
def checkDualEqWriteLoadSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf dualEqWriteApiExpectedNamespace
    dualEqWriteLoadRequiredDecls (some "SystemsLean.EmitBanner")

/-- Check CapableWriteHc multi-import surface (imports CapableWriteHcLoad).
    Greppable: checkCapableWriteHcSurface. -/
def checkCapableWriteHcSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf capableWriteHcExpectedNamespace
    capableWriteHcRequiredDecls (some "SystemsLean.CapableWriteHcLoad")

/-- Check DualEqWriteApi multi-import surface (imports DualEqWriteLoad).
    Greppable: checkDualEqWriteApiSurface. -/
def checkDualEqWriteApiSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf dualEqWriteApiExpectedNamespace
    dualEqWriteApiRequiredDecls (some "SystemsLean.DualEqWriteLoad")

/-- Check LlvmHold surface (imports SelfApply).
    Greppable: checkLlvmHoldSurface. -/
def checkLlvmHoldSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf llvmHoldExpectedNamespace llvmHoldRequiredDecls
    (some "SystemsLean.SelfApply")

/-- Check LlvmHoldTheorems surface (parent ns LlvmHold).
    Greppable: checkLlvmHoldTheoremsSurface. -/
def checkLlvmHoldTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf llvmHoldExpectedNamespace
    llvmHoldTheoremsRequiredDecls (some "SystemsLean.LlvmHold")

/-- Check CapableRegenerate multi-import surface (sample CapableRead).
    Greppable: checkCapableRegenerateSurface. -/
def checkCapableRegenerateSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf capableRegenerateExpectedNamespace
    capableRegenerateRequiredDecls (some "SystemsLean.CapableRead")

/-- Check CapableRegenerateTheorems surface (parent ns CapableRegenerate).
    Greppable: checkCapableRegenerateTheoremsSurface. -/
def checkCapableRegenerateTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf capableRegenerateExpectedNamespace
    capableRegenerateTheoremsRequiredDecls (some "SystemsLean.CapableRegenerate")

/-- Check FreestandingEmitLoad pure leaf (ns FreestandingEmit; no package import).
    Greppable: checkFreestandingEmitLoadSurface. -/
def checkFreestandingEmitLoadSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf freestandingEmitExpectedNamespace
    freestandingEmitLoadRequiredDecls none

/-- Check FreestandingEmitLoadScaffold surface (imports FreestandingEmitLoad).
    Greppable: checkFreestandingEmitLoadScaffoldSurface. -/
def checkFreestandingEmitLoadScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf freestandingEmitExpectedNamespace
    freestandingEmitLoadScaffoldRequiredDecls (some "SystemsLean.FreestandingEmitLoad")

/-- Check LakeRetireInventory pure leaf.
    Greppable: checkLakeRetireInventorySurface. -/
def checkLakeRetireInventorySurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf lakeRetireInventoryExpectedNamespace
    lakeRetireInventoryRequiredDecls none

end SystemsLean.HostModuleCheck
