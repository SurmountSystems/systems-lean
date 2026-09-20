/-
  SYSTEMS_LEAN_HOST partial -- LoadOk later TERM SurfaceOk aggregate fold.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: later TERM SurfaceOk gates (EmitPlan through
  Host fragment check, including CompilePath unit aggregate) so
  HostModuleCheckLoadOk stays under Sub-1-KLOC with room for the next fold.
  Same namespace SystemsLean.HostModuleCheck.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only. Not FullHost re-true. Not package elaborate.
  - Mult..Extract prior TERM dual-ok unchanged (still folded on LoadOk tip).
  - ExtractSubsetEmit TERM-SURFACE dual-ok unchanged.
  - Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckLoadOkLaterTerm, hostModuleCheckLaterTermSurfaceOk,
  hostModuleCheckParityMultTermSmokeOk, hostModuleCheckParityLinearTermSmokeOk,
  hostModuleCheckParityTypesTermSmokeOk, hostModuleCheckParityProgramTermSmokeOk,
  hostModuleCheckParityEmitTermSmokeOk,
  TERM-SURFACE, FirstSurface-only, LinearSubsetEmit-only, TypesSubsetEmit-only,
  ProgramSubsetEmit-only, GraphSubsetEmit-only, ComposeSubsetEmit-only,
  ErasureSubsetEmit-only, ExtractSubsetEmit-only, MultSubsetEmit-only,
  MultSubsetRebuild-only, LinearSubsetRebuild-only, TypesSubsetRebuild-only,
  ProgramSubsetRebuild-only, GraphSubsetRebuild-only, ComposeSubsetRebuild-only,
  ErasureSubsetRebuild-only, ExtractSubsetRebuild-only, HostFront-only,
  LlvmMultText-only, HostCheck-only, HostGraph-only, LlvmLinearText-only,
  MultFsWriteTool-only, FrontMultPackage-only, SubsetPackageJoin-only,
  LlvmTypesText-only, MultFsDeepen-only, HostPackageWrite-only, LlvmProgramText-only,
  LlvmGraphText-only, LlvmComposeText-only, SelfApplyFs-only, InventoryClose-only,
  ProductPathBars-only, ProductPath-only, ProbeWire-only, SelfHostBody-only,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface,
  MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckLoadOkLaterTerm
  Red/green: lake build SystemsLean.HostModuleCheckLoadOkLaterTerm;
  lake build SystemsLean.HostModuleCheckLoadOk;
  just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm
import SystemsLean.HostModuleCheckEmitApplyTerm
import SystemsLean.HostModuleCheckEmitBodyTerm
import SystemsLean.HostModuleCheckKernelMultTerm
import SystemsLean.HostModuleCheckKernelLinearTerm
import SystemsLean.HostModuleCheckKernelTypesTerm
import SystemsLean.HostModuleCheckKernelProgramTerm
import SystemsLean.HostModuleCheckKernelEmitTerm
import SystemsLean.HostModuleCheckParityMultTerm
import SystemsLean.HostModuleCheckParityLinearTerm
import SystemsLean.HostModuleCheckParityTypesTerm
import SystemsLean.HostModuleCheckParityProgramTerm
import SystemsLean.HostModuleCheckParityEmitTerm
import SystemsLean.HostModuleCheckEmitMultScaffoldTerm
import SystemsLean.HostModuleCheckEmitLinearScaffoldTerm
import SystemsLean.HostModuleCheckEmitTypesScaffoldTerm
import SystemsLean.HostModuleCheckEmitProgramScaffoldTerm
import SystemsLean.HostModuleCheckEmitGraphScaffoldTerm
import SystemsLean.HostModuleCheckEmitComposeScaffoldTerm
import SystemsLean.HostModuleCheckEmitErasureScaffoldTerm
import SystemsLean.HostModuleCheckEmitExtractScaffoldTerm
import SystemsLean.HostModuleCheckEmitBannerScaffoldTerm
import SystemsLean.HostModuleCheckKernelSelfApplyTerm
import SystemsLean.HostModuleCheckProductOutKernelTerm
import SystemsLean.HostModuleCheckCompilePathTerm
import SystemsLean.HostModuleCheckJoinMapTerm
import SystemsLean.HostModuleCheckSelfHostTerm
import SystemsLean.HostModuleCheckSurfaceMatrixTerm
import SystemsLean.HostModuleCheckSpecProofTerm
import SystemsLean.HostModuleCheckDualResidualTerm
import SystemsLean.HostModuleCheckLoadOkCompilePathUnits
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

/-- Structural then ParityMult L2 refine (no checkRealModule).
    Greppable: parityMultTermSmokeResult, TERM-SURFACE, ParityMult-only. -/
def parityMultTermSmokeResult (content : String) : ModuleCheckResult :=
  refineParityMultWithTermSurface
    (checkNamedSurface (parityMultTermSurfaceFrom content)
      parityMultExpectedNamespace parityMultRequiredDecls
      (some "SystemsLean.KernelMult"))
    content

/-- Compact full-path smoke (good + PM1..PM4 + SurfaceOk). RealModule-free.
    Greppable: hostModuleCheckParityMultTermSmokeOk, TERM-SURFACE,
    ParityMult-only. -/
def hostModuleCheckParityMultTermSmokeOk : Bool :=
  (parityMultTermSmokeResult
      hostModuleCheckGoodParityMultTermText).isAccept
    && (parityMultTermSmokeResult
      hostModuleCheckBadParityMultStageIdText).isRejectWith reasonIllTypedTerm
    && (parityMultTermSmokeResult
      hostModuleCheckBadParityMultReadyText).isRejectWith reasonIllTypedTerm
    && (parityMultTermSmokeResult
      hostModuleCheckBadParityMultOkText).isRejectWith reasonIllTypedTerm
    && (parityMultTermSmokeResult
      hostModuleCheckBadParityMultGradeText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckParityMultTermSurfaceOk

/-- Structural then ParityLinear L2 refine (no checkRealModule).
    Greppable: parityLinearTermSmokeResult, TERM-SURFACE, ParityLinear-only. -/
def parityLinearTermSmokeResult (content : String) : ModuleCheckResult :=
  refineParityLinearWithTermSurface
    (checkNamedSurface (parityLinearTermSurfaceFrom content)
      parityLinearExpectedNamespace parityLinearRequiredDecls
      (some "SystemsLean.KernelLinear"))
    content

/-- Compact full-path smoke (good + PL1..PL4 + SurfaceOk). RealModule-free.
    Greppable: hostModuleCheckParityLinearTermSmokeOk, TERM-SURFACE,
    ParityLinear-only. -/
def hostModuleCheckParityLinearTermSmokeOk : Bool :=
  (parityLinearTermSmokeResult
      hostModuleCheckGoodParityLinearTermText).isAccept
    && (parityLinearTermSmokeResult
      hostModuleCheckBadParityLinearStageIdText).isRejectWith reasonIllTypedTerm
    && (parityLinearTermSmokeResult
      hostModuleCheckBadParityLinearReadyText).isRejectWith reasonIllTypedTerm
    && (parityLinearTermSmokeResult
      hostModuleCheckBadParityLinearOkText).isRejectWith reasonIllTypedTerm
    && (parityLinearTermSmokeResult
      hostModuleCheckBadParityLinearContractText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckParityLinearTermSurfaceOk

/-- Structural then ParityTypes L2 refine (no checkRealModule).
    Greppable: parityTypesTermSmokeResult, TERM-SURFACE, ParityTypes-only. -/
def parityTypesTermSmokeResult (content : String) : ModuleCheckResult :=
  refineParityTypesWithTermSurface
    (checkNamedSurface (parityTypesTermSurfaceFrom content)
      parityTypesExpectedNamespace parityTypesRequiredDecls
      (some "SystemsLean.KernelTypes"))
    content

/-- Compact full-path smoke (good + PT1..PT4 + SurfaceOk). RealModule-free.
    Greppable: hostModuleCheckParityTypesTermSmokeOk, TERM-SURFACE,
    ParityTypes-only. -/
def hostModuleCheckParityTypesTermSmokeOk : Bool :=
  (parityTypesTermSmokeResult
      hostModuleCheckGoodParityTypesTermText).isAccept
    && (parityTypesTermSmokeResult
      hostModuleCheckBadParityTypesStageIdText).isRejectWith reasonIllTypedTerm
    && (parityTypesTermSmokeResult
      hostModuleCheckBadParityTypesReadyText).isRejectWith reasonIllTypedTerm
    && (parityTypesTermSmokeResult
      hostModuleCheckBadParityTypesOkText).isRejectWith reasonIllTypedTerm
    && (parityTypesTermSmokeResult
      hostModuleCheckBadParityTypesContractText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckParityTypesTermSurfaceOk

/-- Structural then ParityProgram L2 refine (no checkRealModule).
    Greppable: parityProgramTermSmokeResult, TERM-SURFACE,
    ParityProgram-only. -/
def parityProgramTermSmokeResult (content : String) : ModuleCheckResult :=
  refineParityProgramWithTermSurface
    (checkNamedSurface (parityProgramTermSurfaceFrom content)
      parityProgramExpectedNamespace parityProgramRequiredDecls
      (some "SystemsLean.KernelProgram"))
    content

/-- Compact full-path smoke (good + PP1..PP4 + SurfaceOk). RealModule-free.
    Greppable: hostModuleCheckParityProgramTermSmokeOk, TERM-SURFACE,
    ParityProgram-only. -/
def hostModuleCheckParityProgramTermSmokeOk : Bool :=
  (parityProgramTermSmokeResult
      hostModuleCheckGoodParityProgramTermText).isAccept
    && (parityProgramTermSmokeResult
      hostModuleCheckBadParityProgramStageIdText).isRejectWith reasonIllTypedTerm
    && (parityProgramTermSmokeResult
      hostModuleCheckBadParityProgramReadyText).isRejectWith reasonIllTypedTerm
    && (parityProgramTermSmokeResult
      hostModuleCheckBadParityProgramOkText).isRejectWith reasonIllTypedTerm
    && (parityProgramTermSmokeResult
      hostModuleCheckBadParityProgramContractText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckParityProgramTermSurfaceOk

/-- Structural then ParityEmit L2 refine (no checkRealModule).
    Greppable: parityEmitTermSmokeResult, TERM-SURFACE, ParityEmit-only. -/
def parityEmitTermSmokeResult (content : String) : ModuleCheckResult :=
  refineParityEmitWithTermSurface
    (checkNamedSurface (parityEmitTermSurfaceFrom content)
      parityEmitExpectedNamespace parityEmitRequiredDecls
      (some "SystemsLean.KernelEmit"))
    content

/-- Compact full-path smoke (good + PE1..PE4 + SurfaceOk). RealModule-free.
    Greppable: hostModuleCheckParityEmitTermSmokeOk, TERM-SURFACE,
    ParityEmit-only. -/
def hostModuleCheckParityEmitTermSmokeOk : Bool :=
  (parityEmitTermSmokeResult
      hostModuleCheckGoodParityEmitTermText).isAccept
    && (parityEmitTermSmokeResult
      hostModuleCheckBadParityEmitStageIdText).isRejectWith reasonIllTypedTerm
    && (parityEmitTermSmokeResult
      hostModuleCheckBadParityEmitReadyText).isRejectWith reasonIllTypedTerm
    && (parityEmitTermSmokeResult
      hostModuleCheckBadParityEmitOkText).isRejectWith reasonIllTypedTerm
    && (parityEmitTermSmokeResult
      hostModuleCheckBadParityEmitContractText).isRejectWith reasonIllTypedTerm
    && hostModuleCheckParityEmitTermSurfaceOk

/-- Later TERM SurfaceOk aggregate (LoadOk fold). EmitPlan through SelfHostBody.
    Greppable: hostModuleCheckLaterTermSurfaceOk, TERM-SURFACE. -/
def hostModuleCheckLaterTermSurfaceOk : Bool :=
  hostModuleCheckEmitPlanTermSurfaceOk
    && hostModuleCheckEmitApplyTermSurfaceOk
    && hostModuleCheckEmitBodyTermSurfaceOk
    && hostModuleCheckKernelMultTermSurfaceOk
    && hostModuleCheckKernelLinearTermSurfaceOk
    && hostModuleCheckKernelTypesTermSurfaceOk
    && hostModuleCheckKernelProgramTermSurfaceOk
    && hostModuleCheckKernelEmitTermSurfaceOk
    && hostModuleCheckParityMultTermSurfaceOk
    && hostModuleCheckParityMultTermSmokeOk
    && hostModuleCheckParityLinearTermSurfaceOk
    && hostModuleCheckParityLinearTermSmokeOk
    && hostModuleCheckParityTypesTermSurfaceOk
    && hostModuleCheckParityTypesTermSmokeOk
    && hostModuleCheckParityProgramTermSurfaceOk
    && hostModuleCheckParityProgramTermSmokeOk
    && hostModuleCheckParityEmitTermSurfaceOk
    && hostModuleCheckParityEmitTermSmokeOk
    && hostModuleCheckEmitMultScaffoldTermSurfaceOk
    && hostModuleCheckEmitLinearScaffoldTermSurfaceOk
    && hostModuleCheckEmitTypesScaffoldTermSurfaceOk
    && hostModuleCheckEmitProgramScaffoldTermSurfaceOk
    && hostModuleCheckEmitGraphScaffoldTermSurfaceOk
    && hostModuleCheckEmitComposeScaffoldTermSurfaceOk
    && hostModuleCheckEmitErasureScaffoldTermSurfaceOk
    && hostModuleCheckEmitExtractScaffoldTermSurfaceOk
    && hostModuleCheckEmitBannerScaffoldTermSurfaceOk
    && hostModuleCheckKernelSelfApplyTermSurfaceOk
    && hostModuleCheckProductOutKernelTermSurfaceOk
    && hostModuleCheckCompilePathTermSurfaceOk
    && hostModuleCheckJoinMapTermSurfaceOk
    && hostModuleCheckSelfHostTermSurfaceOk
    && hostModuleCheckSurfaceMatrixTermSurfaceOk
    && hostModuleCheckSpecProofTermSurfaceOk
    && hostModuleCheckDualResidualTermSurfaceOk
    && hostModuleCheckCompilePathUnitsTermSurfaceOk
    && hostModuleCheckFirstSurfaceTermSurfaceOk
    && hostModuleCheckLinearSubsetEmitTermSurfaceOk
    && hostModuleCheckTypesSubsetEmitTermSurfaceOk
    && hostModuleCheckProgramSubsetEmitTermSurfaceOk
    && hostModuleCheckGraphSubsetEmitTermSurfaceOk
    && hostModuleCheckComposeSubsetEmitTermSurfaceOk
    && hostModuleCheckErasureSubsetEmitTermSurfaceOk
    && hostModuleCheckExtractSubsetEmitTermSurfaceOk
    && hostModuleCheckMultSubsetEmitTermSurfaceOk
    && hostModuleCheckMultSubsetRebuildTermSurfaceOk
    && hostModuleCheckLinearSubsetRebuildTermSurfaceOk
    && hostModuleCheckTypesSubsetRebuildTermSurfaceOk
    && hostModuleCheckProgramSubsetRebuildTermSurfaceOk
    && hostModuleCheckGraphSubsetRebuildTermSurfaceOk
    && hostModuleCheckComposeSubsetRebuildTermSurfaceOk
    && hostModuleCheckErasureSubsetRebuildTermSurfaceOk
    && hostModuleCheckExtractSubsetRebuildTermSurfaceOk
    && hostModuleCheckHostFrontTermSurfaceOk
    && hostModuleCheckLlvmMultTextTermSurfaceOk
    && hostModuleCheckHostCheckTermSurfaceOk
    && hostModuleCheckHostGraphTermSurfaceOk
    && hostModuleCheckLlvmLinearTextTermSurfaceOk
    && hostModuleCheckMultFsWriteToolTermSurfaceOk
    && hostModuleCheckFrontMultPackageTermSurfaceOk
    && hostModuleCheckSubsetPackageJoinTermSurfaceOk
    && hostModuleCheckLlvmTypesTextTermSurfaceOk
    && hostModuleCheckMultFsDeepenTermSurfaceOk
    && hostModuleCheckHostPackageWriteTermSurfaceOk
    && hostModuleCheckLlvmProgramTextTermSurfaceOk
    && hostModuleCheckLlvmGraphTextTermSurfaceOk
    && hostModuleCheckLlvmComposeTextTermSurfaceOk
    && hostModuleCheckSelfApplyFsTermSurfaceOk
    && hostModuleCheckInventoryCloseTermSurfaceOk
    && hostModuleCheckProductPathBarsTermSurfaceOk
    && hostModuleCheckProductPathTermSurfaceOk
    && hostModuleCheckProbeWireTermSurfaceOk
    && hostModuleCheckSelfHostBodyTermSurfaceOk

theorem hostModuleCheckLaterTermSurfaceOk_true :
    hostModuleCheckLaterTermSurfaceOk = true := by native_decide

end SystemsLean.HostModuleCheck
