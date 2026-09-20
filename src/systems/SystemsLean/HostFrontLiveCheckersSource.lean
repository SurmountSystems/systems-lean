/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckCheckers.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCheckersSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-CHECKERS, liveCheckersSource,
  HOST-FRONT-LIVE-CHECKERS, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveCheckersSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveCheckers

/-- Dual-pinned live HostModuleCheckCheckers.lean bytes (must match on-disk file).
    Greppable: liveCheckersSource, PARSE-LIVE-CHECKERS. -/
def liveCheckersSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck per-seed check*Surface (foundation..HostPackageRoots).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split: checkMultSurface through checkHostPackageRootsSurface from HostModuleCheckSurface.
  Same namespace SystemsLean.HostModuleCheck so names stay unqualified.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckCheckers,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, Host library seed expand continue,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckCheckers
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckCheckers;
  lake build SystemsLean.HostModuleCheck.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckFixtures
import SystemsLean.HostModuleCheckSurface

namespace SystemsLean.HostModuleCheck

/-- Check Mult surface. Greppable: checkMultSurface. -/
def checkMultSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf multExpectedNamespace multRequiredDecls none

/-- Check MultTheorems surface. Greppable: checkMultTheoremsSurface. -/
def checkMultTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf multExpectedNamespace multTheoremsRequiredDecls
    (some "SystemsLean.Mult")

/-- Check Linear surface. Greppable: checkLinearSurface. -/
def checkLinearSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf linearExpectedNamespace linearRequiredDecls none

/-- Check LinearTheorems surface. Greppable: checkLinearTheoremsSurface. -/
def checkLinearTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf linearExpectedNamespace linearTheoremsRequiredDecls
    (some "SystemsLean.Linear")

/-- Check Types surface. Greppable: checkTypesSurface. -/
def checkTypesSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf typesExpectedNamespace typesRequiredDecls
    (some "SystemsLean.Mult")

/-- Check TypesTheorems surface. Greppable: checkTypesTheoremsSurface. -/
def checkTypesTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf typesExpectedNamespace typesTheoremsRequiredDecls
    (some "SystemsLean.Types")

/-- Check IrProgram surface (Program unit). Greppable: checkIrProgramSurface. -/
def checkIrProgramSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf irProgramExpectedNamespace irProgramRequiredDecls
    (some "SystemsLean.Types")

/-- Check IrProgramTheorems surface. Greppable: checkIrProgramTheoremsSurface. -/
def checkIrProgramTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf irProgramExpectedNamespace irProgramTheoremsRequiredDecls
    (some "SystemsLean.IrProgram")

/-- Check IrGraph surface (Graph unit). Greppable: checkIrGraphSurface. -/
def checkIrGraphSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf irGraphExpectedNamespace irGraphRequiredDecls
    (some "SystemsLean.IrProgram")

/-- Check IrGraphTheorems surface. Greppable: checkIrGraphTheoremsSurface. -/
def checkIrGraphTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf irGraphExpectedNamespace irGraphTheoremsRequiredDecls
    (some "SystemsLean.IrGraph")

/-- Check HostCompose surface (Compose unit). Greppable: checkHostComposeSurface. -/
def checkHostComposeSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf hostComposeExpectedNamespace hostComposeRequiredDecls
    (some "SystemsLean.IrGraph")

/-- Check HostComposeTheorems surface.
    Greppable: checkHostComposeTheoremsSurface. -/
def checkHostComposeTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf hostComposeExpectedNamespace
    hostComposeTheoremsRequiredDecls (some "SystemsLean.HostCompose")

/-- Check Erasure surface. Greppable: checkErasureSurface. -/
def checkErasureSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf erasureExpectedNamespace erasureRequiredDecls
    (some "SystemsLean.Mult")

/-- Check ErasureTheorems surface. Greppable: checkErasureTheoremsSurface. -/
def checkErasureTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf erasureExpectedNamespace erasureTheoremsRequiredDecls
    (some "SystemsLean.Erasure")

/-- Check Extract surface. Greppable: checkExtractSurface. -/
def checkExtractSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf extractExpectedNamespace extractRequiredDecls
    (some "SystemsLean.Erasure")

/-- Check ExtractTheorems surface. Greppable: checkExtractTheoremsSurface. -/
def checkExtractTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf extractExpectedNamespace extractTheoremsRequiredDecls
    (some "SystemsLean.Extract")

/-- Check CompilePath surface. Greppable: checkCompilePathSurface. -/
def checkCompilePathSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf compilePathExpectedNamespace compilePathRequiredDecls
    (some "SystemsLean.Mult")

/-- Check KernelMult surface. Greppable: checkKernelMultSurface. -/
def checkKernelMultSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf kernelMultExpectedNamespace kernelMultRequiredDecls
    (some "SystemsLean.CompilePath")

/-- Check KernelLinear surface. Greppable: checkKernelLinearSurface. -/
def checkKernelLinearSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf kernelLinearExpectedNamespace kernelLinearRequiredDecls
    (some "SystemsLean.CompilePath")

/-- Check KernelTypes surface. Greppable: checkKernelTypesSurface. -/
def checkKernelTypesSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf kernelTypesExpectedNamespace kernelTypesRequiredDecls
    (some "SystemsLean.CompilePath")

/-- Check KernelProgram surface. Greppable: checkKernelProgramSurface. -/
def checkKernelProgramSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf kernelProgramExpectedNamespace kernelProgramRequiredDecls
    (some "SystemsLean.CompilePath")

/-- Check KernelMultTheorems surface (parent namespace KernelMult).
    Greppable: checkKernelMultTheoremsSurface. -/
def checkKernelMultTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf kernelMultExpectedNamespace
    kernelMultTheoremsRequiredDecls (some "SystemsLean.KernelMult")

/-- Check KernelLinearTheorems surface (parent namespace KernelLinear).
    Greppable: checkKernelLinearTheoremsSurface. -/
def checkKernelLinearTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf kernelLinearExpectedNamespace
    kernelLinearTheoremsRequiredDecls (some "SystemsLean.KernelLinear")

/-- Check KernelTypesTheorems surface (parent namespace KernelTypes).
    Greppable: checkKernelTypesTheoremsSurface. -/
def checkKernelTypesTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf kernelTypesExpectedNamespace
    kernelTypesTheoremsRequiredDecls (some "SystemsLean.KernelTypes")

/-- Check KernelProgramTheorems surface (parent namespace KernelProgram).
    Greppable: checkKernelProgramTheoremsSurface. -/
def checkKernelProgramTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf kernelProgramExpectedNamespace
    kernelProgramTheoremsRequiredDecls (some "SystemsLean.KernelProgram")

/-- Check JoinMap surface. Greppable: checkJoinMapSurface. -/
def checkJoinMapSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf joinMapExpectedNamespace joinMapRequiredDecls
    (some "SystemsLean.CompilePath")

/-- Check JoinMapTheorems surface (parent namespace JoinMap).
    Greppable: checkJoinMapTheoremsSurface. -/
def checkJoinMapTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf joinMapExpectedNamespace joinMapTheoremsRequiredDecls
    (some "SystemsLean.JoinMap")

/-- Check SelfHost surface. Greppable: checkSelfHostSurface. -/
def checkSelfHostSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf selfHostExpectedNamespace selfHostRequiredDecls
    (some "SystemsLean.JoinMap")

/-- Check SelfHostTheorems surface (parent namespace SelfHost).
    Greppable: checkSelfHostTheoremsSurface. -/
def checkSelfHostTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf selfHostExpectedNamespace selfHostTheoremsRequiredDecls
    (some "SystemsLean.SelfHost")

/-- Check SurfaceMatrix surface. Greppable: checkSurfaceMatrixSurface. -/
def checkSurfaceMatrixSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf surfaceMatrixExpectedNamespace surfaceMatrixRequiredDecls
    (some "SystemsLean.SelfHost")

/-- Check SurfaceMatrixTheorems surface (parent namespace SurfaceMatrix).
    Greppable: checkSurfaceMatrixTheoremsSurface. -/
def checkSurfaceMatrixTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf surfaceMatrixExpectedNamespace
    surfaceMatrixTheoremsRequiredDecls (some "SystemsLean.SurfaceMatrix")

/-- Check EmitMultScaffold surface (ns EmitMult; imports Mult).
    Greppable: checkEmitMultScaffoldSurface. -/
def checkEmitMultScaffoldSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitMultExpectedNamespace emitMultScaffoldRequiredDecls
    (some "SystemsLean.Mult")

/-- Check EmitLinearScaffold surface (ns EmitLinear; leaf).
    Greppable: checkEmitLinearScaffoldSurface. -/
def checkEmitLinearScaffoldSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitLinearExpectedNamespace
    emitLinearScaffoldRequiredDecls none

/-- Check EmitTypesScaffold surface. Greppable: checkEmitTypesScaffoldSurface. -/
def checkEmitTypesScaffoldSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitTypesExpectedNamespace emitTypesScaffoldRequiredDecls
    none

/-- Check EmitProgramScaffold surface.
    Greppable: checkEmitProgramScaffoldSurface. -/
def checkEmitProgramScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitProgramExpectedNamespace
    emitProgramScaffoldRequiredDecls none

/-- Check EmitGraphScaffold surface. Greppable: checkEmitGraphScaffoldSurface. -/
def checkEmitGraphScaffoldSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitGraphExpectedNamespace emitGraphScaffoldRequiredDecls
    none

/-- Check EmitComposeScaffold surface.
    Greppable: checkEmitComposeScaffoldSurface. -/
def checkEmitComposeScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitComposeExpectedNamespace
    emitComposeScaffoldRequiredDecls none

/-- Check EmitPlanScaffold surface (ns EmitPlan; leaf).
    Greppable: checkEmitPlanScaffoldSurface. -/
def checkEmitPlanScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitPlanExpectedNamespace emitPlanScaffoldRequiredDecls
    none

/-- Check EmitApplyScaffold surface (ns EmitApply; leaf).
    Greppable: checkEmitApplyScaffoldSurface. -/
def checkEmitApplyScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitApplyExpectedNamespace
    emitApplyScaffoldRequiredDecls none

/-- Check EmitBodyScaffold surface (ns EmitBody; leaf).
    Greppable: checkEmitBodyScaffoldSurface. -/
def checkEmitBodyScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitBodyExpectedNamespace emitBodyScaffoldRequiredDecls
    none

/-- Check EmitErasureScaffold surface (ns EmitErasure; leaf).
    Greppable: checkEmitErasureScaffoldSurface. -/
def checkEmitErasureScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitErasureExpectedNamespace
    emitErasureScaffoldRequiredDecls none

/-- Check EmitExtractScaffold surface (ns EmitExtract; leaf).
    Greppable: checkEmitExtractScaffoldSurface. -/
def checkEmitExtractScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitExtractExpectedNamespace
    emitExtractScaffoldRequiredDecls none

/-- Check EmitBannerScaffold surface (ns EmitBanner; leaf).
    Greppable: checkEmitBannerScaffoldSurface. -/
def checkEmitBannerScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitBannerExpectedNamespace
    emitBannerScaffoldRequiredDecls none

/-- Check KernelSelfApply surface (leaf).
    Greppable: checkKernelSelfApplySurface. -/
def checkKernelSelfApplySurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf kernelSelfApplyExpectedNamespace
    kernelSelfApplyRequiredDecls none

/-- Check KernelSelfApplyTheorems surface (parent namespace KernelSelfApply).
    Greppable: checkKernelSelfApplyTheoremsSurface. -/
def checkKernelSelfApplyTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf kernelSelfApplyExpectedNamespace
    kernelSelfApplyTheoremsRequiredDecls (some "SystemsLean.KernelSelfApply")

/-- Check EmitMult product shell (ns EmitMult; imports EmitMultScaffold).
    Product module is scaffold import shell (no key product defs on disk).
    Greppable: checkEmitMultSurface. -/
def checkEmitMultSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitMultExpectedNamespace emitMultRequiredDecls
    (some "SystemsLean.EmitMultScaffold")

/-- Check EmitLinear product shell (ns EmitLinear; imports EmitLinearScaffold).
    Scaffold-import shell (defs live on EmitLinearScaffold).
    Greppable: checkEmitLinearSurface. -/
def checkEmitLinearSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitLinearExpectedNamespace emitLinearRequiredDecls
    (some "SystemsLean.EmitLinearScaffold")

/-- Check EmitTypes product shell (ns EmitTypes; imports EmitTypesScaffold).
    Scaffold-import shell (defs live on EmitTypesScaffold).
    Greppable: checkEmitTypesSurface. -/
def checkEmitTypesSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitTypesExpectedNamespace emitTypesRequiredDecls
    (some "SystemsLean.EmitTypesScaffold")

/-- Check EmitProgram product shell (ns EmitProgram; imports EmitProgramScaffold).
    Scaffold-import shell (defs live on EmitProgramScaffold).
    Greppable: checkEmitProgramSurface. -/
def checkEmitProgramSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitProgramExpectedNamespace emitProgramRequiredDecls
    (some "SystemsLean.EmitProgramScaffold")

/-- Check EmitGraph product shell (ns EmitGraph; imports EmitGraphScaffold).
    Scaffold-import shell (defs live on EmitGraphScaffold).
    Greppable: checkEmitGraphSurface. -/
def checkEmitGraphSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitGraphExpectedNamespace emitGraphRequiredDecls
    (some "SystemsLean.EmitGraphScaffold")

/-- Check EmitCompose product shell (ns EmitCompose; imports EmitComposeScaffold).
    Scaffold-import shell (defs live on EmitComposeScaffold).
    Greppable: checkEmitComposeSurface. -/
def checkEmitComposeSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitComposeExpectedNamespace emitComposeRequiredDecls
    (some "SystemsLean.EmitComposeScaffold")

/-- Check EmitErasure product shell (ns EmitErasure; imports EmitErasureScaffold).
    Scaffold-import shell (defs live on EmitErasureScaffold).
    Greppable: checkEmitErasureSurface. -/
def checkEmitErasureSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitErasureExpectedNamespace emitErasureRequiredDecls
    (some "SystemsLean.EmitErasureScaffold")

/-- Check EmitExtract product shell (ns EmitExtract; imports EmitExtractScaffold).
    Scaffold-import shell (defs live on EmitExtractScaffold).
    Greppable: checkEmitExtractSurface. -/
def checkEmitExtractSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitExtractExpectedNamespace emitExtractRequiredDecls
    (some "SystemsLean.EmitExtractScaffold")

/-- Check EmitBanner product shell (ns EmitBanner; imports EmitBannerScaffold).
    Scaffold-import shell (defs live on EmitBannerScaffold).
    Greppable: checkEmitBannerSurface. -/
def checkEmitBannerSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitBannerExpectedNamespace emitBannerRequiredDecls
    (some "SystemsLean.EmitBannerScaffold")

/-- Check ProductOutKernel leaf (SelfApplyFs dep; no package import).
    Greppable: checkProductOutKernelSurface. -/
def checkProductOutKernelSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productOutKernelExpectedNamespace
    productOutKernelRequiredDecls none

/-- Check ProductOutKernelTheorems (parent ns ProductOutKernel).
    Greppable: checkProductOutKernelTheoremsSurface. -/
def checkProductOutKernelTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productOutKernelExpectedNamespace
    productOutKernelTheoremsRequiredDecls (some "SystemsLean.ProductOutKernel")

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

/-- Check HostPackageRoots pure leaf.
    Greppable: checkHostPackageRootsSurface. -/
def checkHostPackageRootsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf hostPackageRootsExpectedNamespace
    hostPackageRootsRequiredDecls none
end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveCheckers
