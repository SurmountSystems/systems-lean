/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheck.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckSource. Not occupancy name 50.
  Not a remill. Mill stays 69 of 69.
  This wrap parses HostModuleCheck.lean only.
  Do not import HostModuleCheck. Do not import HostModuleCheckMain.
  Do not elaborate the package walk.
  liveRel is the bare name HostModuleCheck.lean. Do not redefine it
  in the parser.
  Greppable: SYSTEMS_LEAN_HOST, liveHostModuleCheckSource, liveRel,
  UNIT_SURFACE host surface.
  File module: SystemsLean.HostFrontLiveHostModuleCheckSource
  Namespace: SystemsLean.HostFrontLiveHostModuleCheck
  Not FullHost. Not FullBackend. Not freestanding residual free. Not PROVABLY.
  slakeOwnsPackageTypecheck stays false. Occupancy stays 49.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheck

/-- Live file bare name. Not a path. Greppable: liveRel. -/
def liveRel : String := "HostModuleCheck.lean"

/-- Dual-pinned live HostModuleCheck.lean bytes (must match on-disk file).
    Greppable: liveHostModuleCheckSource, PARSE-LIVE-HOST-MODULE-CHECK. -/
def liveHostModuleCheckSource : String := r#"
/-
  SYSTEMS_LEAN_HOST partial -- first real host module check without Lake on
  the measured step (plan-slake-replaces-lake A5 / design S3 Elaborate modules).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split import hub: HostModuleCheckSeeds (stage ids + seeds + honesty);
  HostModuleCheckLoadOk (LoadOk fold + readiness); HostModuleCheckDriverIO + HostModuleCheckDriver (IO);
  HostModuleCheckSurface / HostModuleCheckCheckers / HostModuleCheckCheckersLater;
  HostModuleCheckAcceptsGoods / HostModuleCheckAcceptsProof / HostModuleCheckAcceptsLater / HostModuleCheckAccepts; HostModuleCheckTheorems / HostModuleCheckSmoke; HostModuleCheckFixtures
  (+ RequiredDecls* + FixtureTexts* + SelfHost). Same namespace SystemsLean.HostModuleCheck.

  Intentional non-claims (local to this family; do not misread DualResidual):
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - Local stillUsesLake / host Lake pins on Seeds are host-check residual honesty;
    DualResidual free claimed true / remains false lives on DualResidual (F1),
    not on this hub header.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not full
    elaborator parity.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheck,
  HostModuleCheckSeeds, HostModuleCheckLoadOk, HostModuleCheckDriver,
  HostModuleCheckCheckers, HostModuleCheckCheckersLater, HostModuleCheckAcceptsGoods,
  HostModuleCheckAccepts, HostModuleCheckSurface, HostModuleCheckFixtures,
  HostModuleCheckMultTerm, HostModuleCheckMultKernel, KERNEL-CHECK,
  checkMultKernel, hostModuleCheckMultKernelOk, TERM-SURFACE, Mult-only,
  HostModuleCheckLinearTerm, Linear-only,
  HostModuleCheckTypesTerm, Types-only,
  HostModuleCheckIrProgramTerm, IrProgram-only,
  HostModuleCheckIrGraphTerm, IrGraph-only,
  HostModuleCheckHostComposeTerm, HostCompose-only,
  HostModuleCheckErasureTerm, Erasure-only,
  HostModuleCheckExtractTerm, Extract-only,
  HostModuleCheckEmitPlanTerm, EmitPlan-only,
  HostModuleCheckEmitApplyTerm, EmitApply-only,
  HostModuleCheckEmitBodyTerm, EmitBody-only,
  HostModuleCheckKernelMultTerm, KernelMult-only,
  HostModuleCheckKernelLinearTerm, KernelLinear-only,
  HostModuleCheckKernelTypesTerm, KernelTypes-only,
  HostModuleCheckKernelProgramTerm, KernelProgram-only,
  HostModuleCheckKernelEmitTerm, KernelEmit-only,
  HostModuleCheckParityMultTerm, ParityMult-only,
  HostModuleCheckParityLinearTerm, ParityLinear-only,
  HostModuleCheckParityTypesTerm, ParityTypes-only,
  HostModuleCheckParityProgramTerm, ParityProgram-only,
  HostModuleCheckParityEmitTerm, ParityEmit-only,
  HostModuleCheckEmitMultScaffoldTerm, EmitMultScaffold-only,
  HostModuleCheckEmitLinearScaffoldTerm, EmitLinearScaffold-only,
  HostModuleCheckEmitTypesScaffoldTerm, EmitTypesScaffold-only,
  HostModuleCheckEmitProgramScaffoldTerm, EmitProgramScaffold-only,
  HostModuleCheckEmitGraphScaffoldTerm, EmitGraphScaffold-only,
  HostModuleCheckEmitComposeScaffoldTerm, EmitComposeScaffold-only,
  HostModuleCheckEmitErasureScaffoldTerm, EmitErasureScaffold-only,
  HostModuleCheckEmitExtractScaffoldTerm, EmitExtractScaffold-only,
  HostModuleCheckEmitBannerScaffoldTerm, EmitBannerScaffold-only,
  HostModuleCheckKernelSelfApplyTerm, KernelSelfApply-only,
  HostModuleCheckProductOutKernelTerm, ProductOutKernel-only,
  HostModuleCheckCompilePathTerm, CompilePath-only,
  HostModuleCheckJoinMapTerm, JoinMap-only,
  HostModuleCheckSelfHostTerm, SelfHost-only,
  HostModuleCheckSurfaceMatrixTerm, SurfaceMatrix-only,
  HostModuleCheckSpecProofTerm, SpecProof-only,
  HostModuleCheckDualResidualTerm, DualResidual-only,
  HostModuleCheckFirstSurfaceTerm, FirstSurface-only,
  HostModuleCheckLinearSubsetEmitTerm, LinearSubsetEmit-only,
  HostModuleCheckTypesSubsetEmitTerm, TypesSubsetEmit-only,
  HostModuleCheckProgramSubsetEmitTerm, ProgramSubsetEmit-only,
  HostModuleCheckGraphSubsetEmitTerm, GraphSubsetEmit-only,
  HostModuleCheckComposeSubsetEmitTerm, ComposeSubsetEmit-only,
  HostModuleCheckErasureSubsetEmitTerm, ErasureSubsetEmit-only,
  HostModuleCheckExtractSubsetEmitTerm, ExtractSubsetEmit-only,
  HostModuleCheckMultSubsetEmitTerm, MultSubsetEmit-only,
  HostModuleCheckMultSubsetRebuildTerm, MultSubsetRebuild-only,
  HostModuleCheckLinearSubsetRebuildTerm, LinearSubsetRebuild-only,
  HostModuleCheckTypesSubsetRebuildTerm, TypesSubsetRebuild-only,
  HostModuleCheckProgramSubsetRebuildTerm, ProgramSubsetRebuild-only,
  HostModuleCheckGraphSubsetRebuildTerm, GraphSubsetRebuild-only,
  HostModuleCheckComposeSubsetRebuildTerm, ComposeSubsetRebuild-only,
  HostModuleCheckErasureSubsetRebuildTerm, ErasureSubsetRebuild-only,
  HostModuleCheckExtractSubsetRebuildTerm, ExtractSubsetRebuild-only,
  HostModuleCheckHostFrontTerm, HostFront-only,
  HostModuleCheckLlvmMultTextTerm, LlvmMultText-only,
  HostModuleCheckHostCheckTerm, HostCheck-only,
  HostModuleCheckHostGraphTerm, HostGraph-only,
  HostModuleCheckLlvmLinearTextTerm, LlvmLinearText-only,
  HostModuleCheckMultFsWriteToolTerm, MultFsWriteTool-only,
  HostModuleCheckFrontMultPackageTerm, FrontMultPackage-only,
  HostModuleCheckSubsetPackageJoinTerm, SubsetPackageJoin-only,
  HostModuleCheckLlvmTypesTextTerm, LlvmTypesText-only,
  HostModuleCheckMultFsDeepenTerm, MultFsDeepen-only,
  HostModuleCheckHostPackageWriteTerm, HostPackageWrite-only,
  HostModuleCheckLlvmProgramTextTerm, LlvmProgramText-only,
  HostModuleCheckLlvmGraphTextTerm, LlvmGraphText-only,
  HostModuleCheckLlvmComposeTextTerm, LlvmComposeText-only,
  HostModuleCheckSelfApplyFsTerm, SelfApplyFs-only,
  HostModuleCheckInventoryCloseTerm, InventoryClose-only,
  HostModuleCheckProductPathBarsTerm, ProductPathBars-only,
  HostModuleCheckProductPathTerm, ProductPath-only,
  HostModuleCheckProbeWireTerm, ProbeWire-only,
  HostModuleCheckSelfHostBodyTerm, SelfHostBody-only,
  HostModuleCheckLoadOkLaterTerm, hostModuleCheckLaterTermSurfaceOk,
  HostModuleCheckRealModule, checkRealModule,
  HostModuleCheckMultProof, PROOF-SURFACE, MultTheorems-only,
  HostModuleCheckLinearProof, LinearTheorems-only,
  HostModuleCheckTypesProof, TypesTheorems-only,
  HostModuleCheckKernelMultProof, KernelMultTheorems-only,
  HostModuleCheckKernelLinearProof, KernelLinearTheorems-only,
  HostModuleCheckKernelTypesProof, KernelTypesTheorems-only,
  HostModuleCheckKernelProgramProof, KernelProgramTheorems-only,
  HostModuleCheckKernelEmitProof, KernelEmitTheorems-only,
  HostModuleCheckPackageElab, HostModuleCheckPackageEnv,
  HostModuleCheckPackageEnvFixtures, HostModuleCheckPackageEnvFixturesU2,
  HostModuleCheckPackageEnvEvidence, PACKAGE-ELABORATE,
  MultExtractFoundation-only, MultLinearTypesProof-only, KernelEmitParity-only,
  MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEnv-only,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheck
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheck;
  just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
  PARTIAL-STRUCTURAL only. DualResidual free claimed elsewhere (not this hub).
  Host elaborator residual remains.
-/

import SystemsLean.HostModuleCheckFixtures
import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultTerm
import SystemsLean.HostModuleCheckMultKernel
import SystemsLean.HostModuleCheckLinearTerm
import SystemsLean.HostModuleCheckTypesTerm
import SystemsLean.HostModuleCheckIrProgramTerm
import SystemsLean.HostModuleCheckIrGraphTerm
import SystemsLean.HostModuleCheckHostComposeTerm
import SystemsLean.HostModuleCheckErasureTerm
import SystemsLean.HostModuleCheckExtractTerm
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
import SystemsLean.HostModuleCheckLoadOkCompilePathUnits
import SystemsLean.HostModuleCheckLoadOkLaterTerm
import SystemsLean.HostModuleCheckMultProof
import SystemsLean.HostModuleCheckLinearProof
import SystemsLean.HostModuleCheckTypesProof
import SystemsLean.HostModuleCheckKernelMultProof
import SystemsLean.HostModuleCheckKernelLinearProof
import SystemsLean.HostModuleCheckKernelTypesProof
import SystemsLean.HostModuleCheckKernelProgramProof
import SystemsLean.HostModuleCheckKernelEmitProof
import SystemsLean.HostModuleCheckPackageElab
import SystemsLean.HostModuleCheckPackageEnvFixtures
import SystemsLean.HostModuleCheckPackageEnvFixturesU2
import SystemsLean.HostModuleCheckPackageEnv
import SystemsLean.HostModuleCheckPackageEnvEvidence
import SystemsLean.HostModuleCheckCheckers
import SystemsLean.HostModuleCheckCheckersLater
import SystemsLean.HostModuleCheckRealModule
import SystemsLean.HostModuleCheckAcceptsGoods
import SystemsLean.HostModuleCheckAcceptsProof
import SystemsLean.HostModuleCheckAcceptsLater
import SystemsLean.HostModuleCheckAccepts
import SystemsLean.HostModuleCheckSeeds
import SystemsLean.HostModuleCheckLoadOk
import SystemsLean.HostModuleCheckDriverIO
import SystemsLean.HostModuleCheckDriver

namespace SystemsLean.HostModuleCheck

-- Import hub only (defs live in companions listed above).

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheck
