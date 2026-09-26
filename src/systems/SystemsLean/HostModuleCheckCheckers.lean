/-
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
end SystemsLean.HostModuleCheck
