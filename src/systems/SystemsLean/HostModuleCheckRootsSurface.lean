import SystemsLean.HostModuleCheckFixtures
import SystemsLean.HostModuleCheckSurface

namespace SystemsLean.HostModuleCheck

/-- Check BootstrapHonesty leaf (SelfApplyFs dep; no package import).
    Greppable: checkBootstrapHonestySurface. -/
def checkBootstrapHonestySurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf bootstrapHonestyExpectedNamespace
    bootstrapHonestyRequiredDecls none

/-- Check BootstrapHonestyTheorems (parent ns BootstrapHonesty).
    Greppable: checkBootstrapHonestyTheoremsSurface. -/
def checkBootstrapHonestyTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf bootstrapHonestyExpectedNamespace
    bootstrapHonestyTheoremsRequiredDecls (some "SystemsLean.BootstrapHonesty")

/-- Check ProductPathWriterSurface leaf (SelfApplyFs ProductPath writer pure leaf).
    Greppable: checkProductPathWriterSurfaceSurface. -/
def checkProductPathWriterSurfaceSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productPathWriterSurfaceExpectedNamespace
    productPathWriterSurfaceRequiredDecls none

/-- Check ProductPathWriterSurfaceTheorems (parent ns ProductPathWriterSurface).
    Greppable: checkProductPathWriterSurfaceTheoremsSurface. -/
def checkProductPathWriterSurfaceTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathWriterSurfaceExpectedNamespace
    productPathWriterSurfaceTheoremsRequiredDecls (some "SystemsLean.ProductPathWriterSurface")

/-- Check ProductPathWriterPathPlan leaf (SelfApplyFs ProductPath writer pure leaf).
    Greppable: checkProductPathWriterPathPlanSurface. -/
def checkProductPathWriterPathPlanSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productPathWriterPathPlanExpectedNamespace
    productPathWriterPathPlanRequiredDecls none

/-- Check ProductPathWriterPathPlanTheorems (parent ns ProductPathWriterPathPlan).
    Greppable: checkProductPathWriterPathPlanTheoremsSurface. -/
def checkProductPathWriterPathPlanTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathWriterPathPlanExpectedNamespace
    productPathWriterPathPlanTheoremsRequiredDecls (some "SystemsLean.ProductPathWriterPathPlan")

/-- Check ProductPathWriterPathExec leaf (SelfApplyFs ProductPath writer pure leaf).
    Greppable: checkProductPathWriterPathExecSurface. -/
def checkProductPathWriterPathExecSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productPathWriterPathExecExpectedNamespace
    productPathWriterPathExecRequiredDecls none

/-- Check ProductPathWriterPathExecTheorems (parent ns ProductPathWriterPathExec).
    Greppable: checkProductPathWriterPathExecTheoremsSurface. -/
def checkProductPathWriterPathExecTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathWriterPathExecExpectedNamespace
    productPathWriterPathExecTheoremsRequiredDecls (some "SystemsLean.ProductPathWriterPathExec")

/-- Check ProductPathOwnershipInputs leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: checkProductPathOwnershipInputsSurface. -/
def checkProductPathOwnershipInputsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productPathOwnershipInputsExpectedNamespace
    productPathOwnershipInputsRequiredDecls none

/-- Check ProductPathOwnershipInputsTheorems (parent ns ProductPathOwnershipInputs).
    Greppable: checkProductPathOwnershipInputsTheoremsSurface. -/
def checkProductPathOwnershipInputsTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathOwnershipInputsExpectedNamespace
    productPathOwnershipInputsTheoremsRequiredDecls (some "SystemsLean.ProductPathOwnershipInputs")

/-- Check ProductPathPerform leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: checkProductPathPerformSurface. -/
def checkProductPathPerformSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productPathPerformExpectedNamespace
    productPathPerformRequiredDecls none

/-- Check ProductPathPerformTheorems (parent ns ProductPathPerform).
    Greppable: checkProductPathPerformTheoremsSurface. -/
def checkProductPathPerformTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathPerformExpectedNamespace
    productPathPerformTheoremsRequiredDecls (some "SystemsLean.ProductPathPerform")

/-- Check ProductPathPerformStep leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: checkProductPathPerformStepSurface. -/
def checkProductPathPerformStepSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productPathPerformStepExpectedNamespace
    productPathPerformStepRequiredDecls none

/-- Check ProductPathPerformStepTheorems (parent ns ProductPathPerformStep).
    Greppable: checkProductPathPerformStepTheoremsSurface. -/
def checkProductPathPerformStepTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathPerformStepExpectedNamespace
    productPathPerformStepTheoremsRequiredDecls (some "SystemsLean.ProductPathPerformStep")

/-- Check ProductPathReadSsot leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: checkProductPathReadSsotSurface. -/
def checkProductPathReadSsotSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productPathReadSsotExpectedNamespace
    productPathReadSsotRequiredDecls none

/-- Check ProductPathReadSsotTheorems (parent ns ProductPathReadSsot).
    Greppable: checkProductPathReadSsotTheoremsSurface. -/
def checkProductPathReadSsotTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathReadSsotExpectedNamespace
    productPathReadSsotTheoremsRequiredDecls (some "SystemsLean.ProductPathReadSsot")

/-- Check ProductPathComposePlan leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: checkProductPathComposePlanSurface. -/
def checkProductPathComposePlanSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productPathComposePlanExpectedNamespace
    productPathComposePlanRequiredDecls none

/-- Check ProductPathComposePlanTheorems (parent ns ProductPathComposePlan).
    Greppable: checkProductPathComposePlanTheoremsSurface. -/
def checkProductPathComposePlanTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathComposePlanExpectedNamespace
    productPathComposePlanTheoremsRequiredDecls (some "SystemsLean.ProductPathComposePlan")

/-- Check Capable leaf (SelfApplyFs freestanding-capable gap pure leaf).
    Greppable: checkCapableSurface. -/
def checkCapableSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf capableExpectedNamespace
    capableRequiredDecls none

/-- Check CapableTheorems (parent ns Capable).
    Greppable: checkCapableTheoremsSurface. -/
def checkCapableTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf capableExpectedNamespace
    capableTheoremsRequiredDecls (some "SystemsLean.Capable")

/-- Check CapableStepContract leaf.
    Greppable: checkCapableStepContractSurface. -/
def checkCapableStepContractSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf capableStepContractExpectedNamespace
    capableStepContractRequiredDecls none

/-- Check CapableStepContractTheorems (parent ns CapableStepContract).
    Greppable: checkCapableStepContractTheoremsSurface. -/
def checkCapableStepContractTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf capableStepContractExpectedNamespace
    capableStepContractTheoremsRequiredDecls (some "SystemsLean.CapableStepContract")

/-- Check HostPackageRoots pure leaf.
    Greppable: checkHostPackageRootsSurface. -/
def checkHostPackageRootsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf hostPackageRootsExpectedNamespace
    hostPackageRootsRequiredDecls none
end SystemsLean.HostModuleCheck
