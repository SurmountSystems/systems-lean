/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck dual-pinned good accepts (Mult..DualEqWriteParityTheorems).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split: hostModuleCheckGood* ModuleCheckResult dual-pins Mult through DualEqWriteParityTheorems.
  Emit/Kernel/Parity L2 term-surface smoke folds live in HostModuleCheckAcceptsGoodsTerm.
  Same namespace SystemsLean.HostModuleCheck so names stay unqualified.
  Sub-1-KLOC: do not grow past 1000.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckAcceptsGoods,
  HostModuleCheckAcceptsGoodsTerm, PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE,
  Host library seed expand continue, UNIT_SURFACE host surface, MULT-0, MULT-1,
  MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckAcceptsGoods
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckAcceptsGoods;
  lake build SystemsLean.HostModuleCheck.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckFixtures
import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckRealModule
import SystemsLean.HostModuleCheckCompilePathTerm
import SystemsLean.HostModuleCheckJoinMapTerm
import SystemsLean.HostModuleCheckSelfHostTerm
import SystemsLean.HostModuleCheckSurfaceMatrixTerm
import SystemsLean.HostModuleCheckKernelSelfApplyTerm
import SystemsLean.HostModuleCheckProductOutKernelTerm
import SystemsLean.HostModuleCheckEmitMultScaffoldTerm
import SystemsLean.HostModuleCheckEmitLinearScaffoldTerm
import SystemsLean.HostModuleCheckEmitTypesScaffoldTerm
import SystemsLean.HostModuleCheckEmitProgramScaffoldTerm
import SystemsLean.HostModuleCheckEmitGraphScaffoldTerm
import SystemsLean.HostModuleCheckEmitComposeScaffoldTerm
import SystemsLean.HostModuleCheckEmitErasureScaffoldTerm
import SystemsLean.HostModuleCheckEmitExtractScaffoldTerm
import SystemsLean.HostModuleCheckEmitBannerScaffoldTerm
import SystemsLean.HostModuleCheckAcceptsGoodsTerm

namespace SystemsLean.HostModuleCheck

/-! ### Dual-pinned good/bad accept results (fixture texts in HostModuleCheckFixtures) -/

/-- Good Mult accepts. Greppable: hostModuleCheckGoodMult. -/
def hostModuleCheckGoodMult : ModuleCheckResult :=
  checkRealModule "SystemsLean.Mult" hostModuleCheckGoodMultText

/-- Good MultTheorems accepts. Greppable: hostModuleCheckGoodMultTheorems. -/
def hostModuleCheckGoodMultTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.MultTheorems" hostModuleCheckGoodMultTheoremsText

/-- Good Linear accepts. Greppable: hostModuleCheckGoodLinear. -/
def hostModuleCheckGoodLinear : ModuleCheckResult :=
  checkRealModule "SystemsLean.Linear" hostModuleCheckGoodLinearText

/-- Good LinearTheorems accepts. Greppable: hostModuleCheckGoodLinearTheorems. -/
def hostModuleCheckGoodLinearTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.LinearTheorems" hostModuleCheckGoodLinearTheoremsText

/-- Good Types accepts. Greppable: hostModuleCheckGoodTypes. -/
def hostModuleCheckGoodTypes : ModuleCheckResult :=
  checkRealModule "SystemsLean.Types" hostModuleCheckGoodTypesText

/-- Good TypesTheorems accepts. Greppable: hostModuleCheckGoodTypesTheorems. -/
def hostModuleCheckGoodTypesTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.TypesTheorems" hostModuleCheckGoodTypesTheoremsText

/-- Good IrProgram accepts. Greppable: hostModuleCheckGoodIrProgram. -/
def hostModuleCheckGoodIrProgram : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrProgram" hostModuleCheckGoodIrProgramText

/-- Good IrProgramTheorems accepts. Greppable: hostModuleCheckGoodIrProgramTheorems. -/
def hostModuleCheckGoodIrProgramTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrProgramTheorems"
    hostModuleCheckGoodIrProgramTheoremsText

/-- Good IrGraph accepts. Greppable: hostModuleCheckGoodIrGraph. -/
def hostModuleCheckGoodIrGraph : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrGraph" hostModuleCheckGoodIrGraphText

/-- Good IrGraphTheorems accepts. Greppable: hostModuleCheckGoodIrGraphTheorems. -/
def hostModuleCheckGoodIrGraphTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrGraphTheorems"
    hostModuleCheckGoodIrGraphTheoremsText

/-- Good HostCompose accepts. Greppable: hostModuleCheckGoodHostCompose. -/
def hostModuleCheckGoodHostCompose : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostCompose" hostModuleCheckGoodHostComposeText

/-- Good HostComposeTheorems accepts.
    Greppable: hostModuleCheckGoodHostComposeTheorems. -/
def hostModuleCheckGoodHostComposeTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostComposeTheorems"
    hostModuleCheckGoodHostComposeTheoremsText

/-- Good Erasure accepts. Greppable: hostModuleCheckGoodErasure. -/
def hostModuleCheckGoodErasure : ModuleCheckResult :=
  checkRealModule "SystemsLean.Erasure" hostModuleCheckGoodErasureText

/-- Good ErasureTheorems accepts. Greppable: hostModuleCheckGoodErasureTheorems. -/
def hostModuleCheckGoodErasureTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ErasureTheorems"
    hostModuleCheckGoodErasureTheoremsText

/-- Good Extract accepts. Greppable: hostModuleCheckGoodExtract. -/
def hostModuleCheckGoodExtract : ModuleCheckResult :=
  checkRealModule "SystemsLean.Extract" hostModuleCheckGoodExtractText

/-- Good ExtractTheorems accepts. Greppable: hostModuleCheckGoodExtractTheorems. -/
def hostModuleCheckGoodExtractTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ExtractTheorems"
    hostModuleCheckGoodExtractTheoremsText

/-- Good CompilePath accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodCompilePath. -/
def hostModuleCheckGoodCompilePath : ModuleCheckResult :=
  checkRealModule "SystemsLean.CompilePath" hostModuleCheckGoodCompilePathTermText

/-- Good KernelMult accepts. Greppable: hostModuleCheckGoodKernelMult. -/
def hostModuleCheckGoodKernelMult : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelMult" hostModuleCheckGoodKernelMultText

/-- Good KernelLinear accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodKernelLinear. -/
def hostModuleCheckGoodKernelLinear : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelLinear" hostModuleCheckGoodKernelLinearTermText

/-- Good KernelTypes accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodKernelTypes. -/
def hostModuleCheckGoodKernelTypes : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelTypes" hostModuleCheckGoodKernelTypesTermText

/-- Good KernelProgram accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodKernelProgram. -/
def hostModuleCheckGoodKernelProgram : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelProgram" hostModuleCheckGoodKernelProgramTermText

/-- Good KernelMultTheorems accepts.
    Greppable: hostModuleCheckGoodKernelMultTheorems. -/
def hostModuleCheckGoodKernelMultTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelMultTheorems"
    hostModuleCheckGoodKernelMultTheoremsText

/-- Good KernelLinearTheorems accepts.
    Greppable: hostModuleCheckGoodKernelLinearTheorems. -/
def hostModuleCheckGoodKernelLinearTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelLinearTheorems"
    hostModuleCheckGoodKernelLinearTheoremsText

/-- Good KernelTypesTheorems accepts.
    Greppable: hostModuleCheckGoodKernelTypesTheorems. -/
def hostModuleCheckGoodKernelTypesTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelTypesTheorems"
    hostModuleCheckGoodKernelTypesTheoremsText

/-- Good KernelProgramTheorems accepts.
    Greppable: hostModuleCheckGoodKernelProgramTheorems. -/
def hostModuleCheckGoodKernelProgramTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelProgramTheorems"
    hostModuleCheckGoodKernelProgramTheoremsText

/-- Good JoinMap accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodJoinMap. -/
def hostModuleCheckGoodJoinMap : ModuleCheckResult :=
  checkRealModule "SystemsLean.JoinMap" hostModuleCheckGoodJoinMapTermText

/-- Good JoinMapTheorems accepts.
    Greppable: hostModuleCheckGoodJoinMapTheorems. -/
def hostModuleCheckGoodJoinMapTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.JoinMapTheorems"
    hostModuleCheckGoodJoinMapTheoremsText

/-- Good SelfHost accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodSelfHost. -/
def hostModuleCheckGoodSelfHost : ModuleCheckResult :=
  checkRealModule "SystemsLean.SelfHost" hostModuleCheckGoodSelfHostTermText

/-- Good SelfHostTheorems accepts.
    Greppable: hostModuleCheckGoodSelfHostTheorems. -/
def hostModuleCheckGoodSelfHostTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.SelfHostTheorems"
    hostModuleCheckGoodSelfHostTheoremsText

/-- Good SurfaceMatrix accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodSurfaceMatrix. -/
def hostModuleCheckGoodSurfaceMatrix : ModuleCheckResult :=
  checkRealModule "SystemsLean.SurfaceMatrix" hostModuleCheckGoodSurfaceMatrixTermText

/-- Good SurfaceMatrixTheorems accepts.
    Greppable: hostModuleCheckGoodSurfaceMatrixTheorems. -/
def hostModuleCheckGoodSurfaceMatrixTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.SurfaceMatrixTheorems"
    hostModuleCheckGoodSurfaceMatrixTheoremsText

/-- Good EmitMultScaffold accepts (TERM-SURFACE dialect bodies).
    Greppable: hostModuleCheckGoodEmitMultScaffold. -/
def hostModuleCheckGoodEmitMultScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitMultScaffold"
    hostModuleCheckGoodEmitMultScaffoldTermText

/-- Good EmitLinearScaffold accepts (TERM-SURFACE dialect bodies).
    Greppable: hostModuleCheckGoodEmitLinearScaffold. -/
def hostModuleCheckGoodEmitLinearScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitLinearScaffold"
    hostModuleCheckGoodEmitLinearScaffoldTermText

/-- Good EmitTypesScaffold accepts (TERM-SURFACE dialect bodies).
    Greppable: hostModuleCheckGoodEmitTypesScaffold. -/
def hostModuleCheckGoodEmitTypesScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitTypesScaffold"
    hostModuleCheckGoodEmitTypesScaffoldTermText

/-- Good EmitProgramScaffold accepts (TERM-SURFACE dialect bodies).
    Greppable: hostModuleCheckGoodEmitProgramScaffold. -/
def hostModuleCheckGoodEmitProgramScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitProgramScaffold"
    hostModuleCheckGoodEmitProgramScaffoldTermText

/-- Good EmitGraphScaffold accepts (TERM-SURFACE dialect bodies).
    Greppable: hostModuleCheckGoodEmitGraphScaffold. -/
def hostModuleCheckGoodEmitGraphScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitGraphScaffold"
    hostModuleCheckGoodEmitGraphScaffoldTermText

/-- Good EmitComposeScaffold accepts (TERM-SURFACE dialect bodies).
    Greppable: hostModuleCheckGoodEmitComposeScaffold. -/
def hostModuleCheckGoodEmitComposeScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitComposeScaffold"
    hostModuleCheckGoodEmitComposeScaffoldTermText

/-- Good EmitPlanScaffold accepts.
    Greppable: hostModuleCheckGoodEmitPlanScaffold. -/
def hostModuleCheckGoodEmitPlanScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitPlanScaffold"
    hostModuleCheckGoodEmitPlanScaffoldText

/-- Good EmitApplyScaffold accepts.
    Greppable: hostModuleCheckGoodEmitApplyScaffold. -/
def hostModuleCheckGoodEmitApplyScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitApplyScaffold"
    hostModuleCheckGoodEmitApplyScaffoldText

/-- Good EmitBodyScaffold accepts.
    Greppable: hostModuleCheckGoodEmitBodyScaffold. -/
def hostModuleCheckGoodEmitBodyScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitBodyScaffold"
    hostModuleCheckGoodEmitBodyScaffoldText

/-- Good EmitErasureScaffold accepts (TERM-SURFACE dialect bodies).
    Greppable: hostModuleCheckGoodEmitErasureScaffold. -/
def hostModuleCheckGoodEmitErasureScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitErasureScaffold"
    hostModuleCheckGoodEmitErasureScaffoldTermText

/-- Good EmitExtractScaffold accepts (TERM-SURFACE dialect bodies).
    Greppable: hostModuleCheckGoodEmitExtractScaffold. -/
def hostModuleCheckGoodEmitExtractScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitExtractScaffold"
    hostModuleCheckGoodEmitExtractScaffoldTermText

/-- Good EmitBannerScaffold accepts (TERM-SURFACE dialect bodies).
    Greppable: hostModuleCheckGoodEmitBannerScaffold. -/
def hostModuleCheckGoodEmitBannerScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitBannerScaffold"
    hostModuleCheckGoodEmitBannerScaffoldTermText

/-- Good KernelSelfApply accepts.
    Greppable: hostModuleCheckGoodKernelSelfApply. -/
def hostModuleCheckGoodKernelSelfApply : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelSelfApply"
    hostModuleCheckGoodKernelSelfApplyTermText

/-- Good KernelSelfApplyTheorems accepts.
    Greppable: hostModuleCheckGoodKernelSelfApplyTheorems. -/
def hostModuleCheckGoodKernelSelfApplyTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelSelfApplyTheorems"
    hostModuleCheckGoodKernelSelfApplyTheoremsText

/-- Good EmitMult product accepts.
    Greppable: hostModuleCheckGoodEmitMult. -/
def hostModuleCheckGoodEmitMult : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitMult" hostModuleCheckGoodEmitMultText

/-- Good EmitPlan product accepts.
    Greppable: hostModuleCheckGoodEmitPlan. -/
def hostModuleCheckGoodEmitPlan : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitPlan" hostModuleCheckGoodEmitPlanText

/-- Good EmitApply product accepts.
    Greppable: hostModuleCheckGoodEmitApply. -/
def hostModuleCheckGoodEmitApply : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitApply" hostModuleCheckGoodEmitApplyText

/-- Good EmitBody product accepts.
    Greppable: hostModuleCheckGoodEmitBody. -/
def hostModuleCheckGoodEmitBody : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitBody" hostModuleCheckGoodEmitBodyText

/-- Good KernelEmit product accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodKernelEmit. -/
def hostModuleCheckGoodKernelEmit : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelEmit" hostModuleCheckGoodKernelEmitTermText

/-- Good KernelEmitTheorems accepts.
    Greppable: hostModuleCheckGoodKernelEmitTheorems. -/
def hostModuleCheckGoodKernelEmitTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelEmitTheorems"
    hostModuleCheckGoodKernelEmitTheoremsText

/-- Good ParityMult accepts.
    Greppable: hostModuleCheckGoodParityMult. -/
def hostModuleCheckGoodParityMult : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityMult" hostModuleCheckGoodParityMultText

/-- Good ParityMultTheorems accepts.
    Greppable: hostModuleCheckGoodParityMultTheorems. -/
def hostModuleCheckGoodParityMultTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityMultTheorems"
    hostModuleCheckGoodParityMultTheoremsText

/-- Good ParityLinear accepts.
    Greppable: hostModuleCheckGoodParityLinear. -/
def hostModuleCheckGoodParityLinear : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityLinear" hostModuleCheckGoodParityLinearText

/-- Good ParityLinearTheorems accepts.
    Greppable: hostModuleCheckGoodParityLinearTheorems. -/
def hostModuleCheckGoodParityLinearTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityLinearTheorems"
    hostModuleCheckGoodParityLinearTheoremsText

/-- Good ParityTypes accepts.
    Greppable: hostModuleCheckGoodParityTypes. -/
def hostModuleCheckGoodParityTypes : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityTypes" hostModuleCheckGoodParityTypesText

/-- Good ParityTypesTheorems accepts.
    Greppable: hostModuleCheckGoodParityTypesTheorems. -/
def hostModuleCheckGoodParityTypesTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityTypesTheorems"
    hostModuleCheckGoodParityTypesTheoremsText

/-- Good ParityProgram accepts.
    Greppable: hostModuleCheckGoodParityProgram. -/
def hostModuleCheckGoodParityProgram : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityProgram" hostModuleCheckGoodParityProgramText

/-- Good ParityProgramTheorems accepts.
    Greppable: hostModuleCheckGoodParityProgramTheorems. -/
def hostModuleCheckGoodParityProgramTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityProgramTheorems"
    hostModuleCheckGoodParityProgramTheoremsText

/-- Good ParityEmit accepts.
    Greppable: hostModuleCheckGoodParityEmit. -/
def hostModuleCheckGoodParityEmit : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityEmit" hostModuleCheckGoodParityEmitText

/-- Good ParityEmitTheorems accepts.
    Greppable: hostModuleCheckGoodParityEmitTheorems. -/
def hostModuleCheckGoodParityEmitTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityEmitTheorems"
    hostModuleCheckGoodParityEmitTheoremsText

/-- Good SelfApply accepts.
    Greppable: hostModuleCheckGoodSelfApply. -/
def hostModuleCheckGoodSelfApply : ModuleCheckResult :=
  checkRealModule "SystemsLean.SelfApply" hostModuleCheckGoodSelfApplyText

/-- Good SelfApplyTheorems accepts.
    Greppable: hostModuleCheckGoodSelfApplyTheorems. -/
def hostModuleCheckGoodSelfApplyTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.SelfApplyTheorems"
    hostModuleCheckGoodSelfApplyTheoremsText

/-- Good EmitLinear product accepts.
    Greppable: hostModuleCheckGoodEmitLinear. -/
def hostModuleCheckGoodEmitLinear : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitLinear" hostModuleCheckGoodEmitLinearText

/-- Good EmitTypes product accepts.
    Greppable: hostModuleCheckGoodEmitTypes. -/
def hostModuleCheckGoodEmitTypes : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitTypes" hostModuleCheckGoodEmitTypesText

/-- Good EmitProgram product accepts.
    Greppable: hostModuleCheckGoodEmitProgram. -/
def hostModuleCheckGoodEmitProgram : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitProgram" hostModuleCheckGoodEmitProgramText

/-- Good EmitGraph product accepts.
    Greppable: hostModuleCheckGoodEmitGraph. -/
def hostModuleCheckGoodEmitGraph : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitGraph" hostModuleCheckGoodEmitGraphText

/-- Good EmitCompose product accepts.
    Greppable: hostModuleCheckGoodEmitCompose. -/
def hostModuleCheckGoodEmitCompose : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitCompose" hostModuleCheckGoodEmitComposeText

/-- Good EmitErasure product accepts.
    Greppable: hostModuleCheckGoodEmitErasure. -/
def hostModuleCheckGoodEmitErasure : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitErasure" hostModuleCheckGoodEmitErasureText

/-- Good EmitExtract product accepts.
    Greppable: hostModuleCheckGoodEmitExtract. -/
def hostModuleCheckGoodEmitExtract : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitExtract" hostModuleCheckGoodEmitExtractText

/-- Good EmitBanner product accepts.
    Greppable: hostModuleCheckGoodEmitBanner. -/
def hostModuleCheckGoodEmitBanner : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitBanner" hostModuleCheckGoodEmitBannerText

/-- Good ProductOutKernel accepts.
    Greppable: hostModuleCheckGoodProductOutKernel. -/
def hostModuleCheckGoodProductOutKernel : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductOutKernel"
    hostModuleCheckGoodProductOutKernelTermText

/-- Good ProductOutKernelTheorems accepts.
    Greppable: hostModuleCheckGoodProductOutKernelTheorems. -/
def hostModuleCheckGoodProductOutKernelTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductOutKernelTheorems"
    hostModuleCheckGoodProductOutKernelTheoremsText

/-- Good BootstrapHonesty accepts.
    Greppable: hostModuleCheckGoodBootstrapHonesty. -/
def hostModuleCheckGoodBootstrapHonesty : ModuleCheckResult :=
  checkRealModule "SystemsLean.BootstrapHonesty"
    hostModuleCheckGoodBootstrapHonestyText

/-- Good BootstrapHonestyTheorems accepts.
    Greppable: hostModuleCheckGoodBootstrapHonestyTheorems. -/
def hostModuleCheckGoodBootstrapHonestyTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.BootstrapHonestyTheorems"
    hostModuleCheckGoodBootstrapHonestyTheoremsText

/-- Good ProductPathWriterSurface accepts.
    Greppable: hostModuleCheckGoodProductPathWriterSurface. -/
def hostModuleCheckGoodProductPathWriterSurface : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathWriterSurface"
    hostModuleCheckGoodProductPathWriterSurfaceText

/-- Good ProductPathWriterSurfaceTheorems accepts.
    Greppable: hostModuleCheckGoodProductPathWriterSurfaceTheorems. -/
def hostModuleCheckGoodProductPathWriterSurfaceTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathWriterSurfaceTheorems"
    hostModuleCheckGoodProductPathWriterSurfaceTheoremsText

/-- Good ProductPathWriterPathPlan accepts.
    Greppable: hostModuleCheckGoodProductPathWriterPathPlan. -/
def hostModuleCheckGoodProductPathWriterPathPlan : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathWriterPathPlan"
    hostModuleCheckGoodProductPathWriterPathPlanText

/-- Good ProductPathWriterPathPlanTheorems accepts.
    Greppable: hostModuleCheckGoodProductPathWriterPathPlanTheorems. -/
def hostModuleCheckGoodProductPathWriterPathPlanTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathWriterPathPlanTheorems"
    hostModuleCheckGoodProductPathWriterPathPlanTheoremsText

/-- Good ProductPathWriterPathExec accepts.
    Greppable: hostModuleCheckGoodProductPathWriterPathExec. -/
def hostModuleCheckGoodProductPathWriterPathExec : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathWriterPathExec"
    hostModuleCheckGoodProductPathWriterPathExecText

/-- Good ProductPathWriterPathExecTheorems accepts.
    Greppable: hostModuleCheckGoodProductPathWriterPathExecTheorems. -/
def hostModuleCheckGoodProductPathWriterPathExecTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathWriterPathExecTheorems"
    hostModuleCheckGoodProductPathWriterPathExecTheoremsText

/-- Good ProductPathOwnershipInputs accepts.
    Greppable: hostModuleCheckGoodProductPathOwnershipInputs. -/
def hostModuleCheckGoodProductPathOwnershipInputs : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathOwnershipInputs"
    hostModuleCheckGoodProductPathOwnershipInputsText

/-- Good ProductPathOwnershipInputsTheorems accepts.
    Greppable: hostModuleCheckGoodProductPathOwnershipInputsTheorems. -/
def hostModuleCheckGoodProductPathOwnershipInputsTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathOwnershipInputsTheorems"
    hostModuleCheckGoodProductPathOwnershipInputsTheoremsText

/-- Good ProductPathPerform accepts.
    Greppable: hostModuleCheckGoodProductPathPerform. -/
def hostModuleCheckGoodProductPathPerform : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathPerform"
    hostModuleCheckGoodProductPathPerformText

/-- Good ProductPathPerformTheorems accepts.
    Greppable: hostModuleCheckGoodProductPathPerformTheorems. -/
def hostModuleCheckGoodProductPathPerformTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathPerformTheorems"
    hostModuleCheckGoodProductPathPerformTheoremsText

/-- Good ProductPathPerformStep accepts.
    Greppable: hostModuleCheckGoodProductPathPerformStep. -/
def hostModuleCheckGoodProductPathPerformStep : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathPerformStep"
    hostModuleCheckGoodProductPathPerformStepText

/-- Good ProductPathPerformStepTheorems accepts.
    Greppable: hostModuleCheckGoodProductPathPerformStepTheorems. -/
def hostModuleCheckGoodProductPathPerformStepTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathPerformStepTheorems"
    hostModuleCheckGoodProductPathPerformStepTheoremsText

/-- Good ProductPathReadSsot accepts.
    Greppable: hostModuleCheckGoodProductPathReadSsot. -/
def hostModuleCheckGoodProductPathReadSsot : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathReadSsot"
    hostModuleCheckGoodProductPathReadSsotText

/-- Good ProductPathReadSsotTheorems accepts.
    Greppable: hostModuleCheckGoodProductPathReadSsotTheorems. -/
def hostModuleCheckGoodProductPathReadSsotTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathReadSsotTheorems"
    hostModuleCheckGoodProductPathReadSsotTheoremsText

/-- Good ProductPathComposePlan accepts.
    Greppable: hostModuleCheckGoodProductPathComposePlan. -/
def hostModuleCheckGoodProductPathComposePlan : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathComposePlan"
    hostModuleCheckGoodProductPathComposePlanText

/-- Good ProductPathComposePlanTheorems accepts.
    Greppable: hostModuleCheckGoodProductPathComposePlanTheorems. -/
def hostModuleCheckGoodProductPathComposePlanTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathComposePlanTheorems"
    hostModuleCheckGoodProductPathComposePlanTheoremsText

/-- Good Capable accepts.
    Greppable: hostModuleCheckGoodCapable. -/
def hostModuleCheckGoodCapable : ModuleCheckResult :=
  checkRealModule "SystemsLean.Capable"
    hostModuleCheckGoodCapableText

/-- Good CapableTheorems accepts.
    Greppable: hostModuleCheckGoodCapableTheorems. -/
def hostModuleCheckGoodCapableTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.CapableTheorems"
    hostModuleCheckGoodCapableTheoremsText

/-- Good CapableStepContract accepts.
    Greppable: hostModuleCheckGoodCapableStepContract. -/
def hostModuleCheckGoodCapableStepContract : ModuleCheckResult :=
  checkRealModule "SystemsLean.CapableStepContract"
    hostModuleCheckGoodCapableStepContractText

/-- Good CapableStepContractTheorems accepts.
    Greppable: hostModuleCheckGoodCapableStepContractTheorems. -/
def hostModuleCheckGoodCapableStepContractTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.CapableStepContractTheorems"
    hostModuleCheckGoodCapableStepContractTheoremsText

/-- Good InstallOut accepts.
    Greppable: hostModuleCheckGoodInstallOut. -/
def hostModuleCheckGoodInstallOut : ModuleCheckResult :=
  checkRealModule "SystemsLean.InstallOut"
    hostModuleCheckGoodInstallOutText

/-- Good InstallOutTheorems accepts.
    Greppable: hostModuleCheckGoodInstallOutTheorems. -/
def hostModuleCheckGoodInstallOutTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.InstallOutTheorems"
    hostModuleCheckGoodInstallOutTheoremsText

/-- Good OfficialPath accepts.
    Greppable: hostModuleCheckGoodOfficialPath. -/
def hostModuleCheckGoodOfficialPath : ModuleCheckResult :=
  checkRealModule "SystemsLean.OfficialPath"
    hostModuleCheckGoodOfficialPathText

/-- Good OfficialPathTheorems accepts.
    Greppable: hostModuleCheckGoodOfficialPathTheorems. -/
def hostModuleCheckGoodOfficialPathTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.OfficialPathTheorems"
    hostModuleCheckGoodOfficialPathTheoremsText

/-- Good PerformEvidence accepts.
    Greppable: hostModuleCheckGoodPerformEvidence. -/
def hostModuleCheckGoodPerformEvidence : ModuleCheckResult :=
  checkRealModule "SystemsLean.PerformEvidence"
    hostModuleCheckGoodPerformEvidenceText

/-- Good PerformEvidenceTheorems accepts.
    Greppable: hostModuleCheckGoodPerformEvidenceTheorems. -/
def hostModuleCheckGoodPerformEvidenceTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.PerformEvidenceTheorems"
    hostModuleCheckGoodPerformEvidenceTheoremsText

/-- Good CapableRead accepts.
    Greppable: hostModuleCheckGoodCapableRead. -/
def hostModuleCheckGoodCapableRead : ModuleCheckResult :=
  checkRealModule "SystemsLean.CapableRead"
    hostModuleCheckGoodCapableReadText

/-- Good CapableReadTheorems accepts.
    Greppable: hostModuleCheckGoodCapableReadTheorems. -/
def hostModuleCheckGoodCapableReadTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.CapableReadTheorems"
    hostModuleCheckGoodCapableReadTheoremsText

/-- Good CapableCompose accepts.
    Greppable: hostModuleCheckGoodCapableCompose. -/
def hostModuleCheckGoodCapableCompose : ModuleCheckResult :=
  checkRealModule "SystemsLean.CapableCompose"
    hostModuleCheckGoodCapableComposeText

/-- Good CapableComposeTheorems accepts.
    Greppable: hostModuleCheckGoodCapableComposeTheorems. -/
def hostModuleCheckGoodCapableComposeTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.CapableComposeTheorems"
    hostModuleCheckGoodCapableComposeTheoremsText

/-- Good CapableFullBar accepts.
    Greppable: hostModuleCheckGoodCapableFullBar. -/
def hostModuleCheckGoodCapableFullBar : ModuleCheckResult :=
  checkRealModule "SystemsLean.CapableFullBar"
    hostModuleCheckGoodCapableFullBarText

/-- Good CapableFullBarTheorems accepts.
    Greppable: hostModuleCheckGoodCapableFullBarTheorems. -/
def hostModuleCheckGoodCapableFullBarTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.CapableFullBarTheorems"
    hostModuleCheckGoodCapableFullBarTheoremsText

/-- Good DualEqWriteCapableGap accepts.
    Greppable: hostModuleCheckGoodDualEqWriteCapableGap. -/
def hostModuleCheckGoodDualEqWriteCapableGap : ModuleCheckResult :=
  checkRealModule "SystemsLean.DualEqWriteCapableGap"
    hostModuleCheckGoodDualEqWriteCapableGapText

/-- Good DualEqWriteCapableGapTheorems accepts.
    Greppable: hostModuleCheckGoodDualEqWriteCapableGapTheorems. -/
def hostModuleCheckGoodDualEqWriteCapableGapTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.DualEqWriteCapableGapTheorems"
    hostModuleCheckGoodDualEqWriteCapableGapTheoremsText

/-- Good DualEqWriteClosePath accepts.
    Greppable: hostModuleCheckGoodDualEqWriteClosePath. -/
def hostModuleCheckGoodDualEqWriteClosePath : ModuleCheckResult :=
  checkRealModule "SystemsLean.DualEqWriteClosePath"
    hostModuleCheckGoodDualEqWriteClosePathText

/-- Good DualEqWriteClosePathTheorems accepts.
    Greppable: hostModuleCheckGoodDualEqWriteClosePathTheorems. -/
def hostModuleCheckGoodDualEqWriteClosePathTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.DualEqWriteClosePathTheorems"
    hostModuleCheckGoodDualEqWriteClosePathTheoremsText

/-- Good DualEqWriteParity accepts.
    Greppable: hostModuleCheckGoodDualEqWriteParity. -/
def hostModuleCheckGoodDualEqWriteParity : ModuleCheckResult :=
  checkRealModule "SystemsLean.DualEqWriteParity"
    hostModuleCheckGoodDualEqWriteParityText

/-- Good DualEqWriteParityTheorems accepts.
    Greppable: hostModuleCheckGoodDualEqWriteParityTheorems. -/
def hostModuleCheckGoodDualEqWriteParityTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.DualEqWriteParityTheorems"
    hostModuleCheckGoodDualEqWriteParityTheoremsText

/-- Emit/Kernel/Parity L2 term smokes in HostModuleCheckAcceptsGoodsTerm.
    Greppable: HostModuleCheckAcceptsGoodsTerm. -/
def hostModuleCheckAcceptsGoodsTermModuleCite : String :=
  "SystemsLean.HostModuleCheckAcceptsGoodsTerm"

end SystemsLean.HostModuleCheck
