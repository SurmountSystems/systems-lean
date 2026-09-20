/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckMultFsWriteToolTerm named
  closed subset probe (plus-one after the LlvmLinearTextTerm closed set).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. MultFsWriteToolTerm wrappers live in
  ElabMeetNamedWalkHostModuleCheckMultFsWriteToolTerm. Shared helpers stay in
  ElabMeetNamedWalk. Do not put this probe back on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, ElabMeetNamedWalkHostTerm,
  ElabMeetNamedWalkHostPackageWrite, ElabMeetNamedHostPackageRootsProbe,
  ElabMeetNamedHostImportGraphSeedsProbe, ElabMeetNamedHostImportGraphModelProbe,
  ElabMeetNamedHostImportGraphModsProbe,
  ElabMeetNamedHostImportGraphModsLaterProbe,
  ElabMeetNamedHostImportGraphLoadOkLaterProbe,
  ElabMeetNamedHostImportGraphWalkLaterProbe,
  ElabMeetNamedHostImportGraphWalkProbe,
  ElabMeetNamedHostModuleCheckRequiredDeclsProbe,
  ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe,
  ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe,
  ElabMeetNamedHostModuleCheckFixtureTextsProbe,
  ElabMeetNamedHostModuleCheckFixtureTextsProductProbe,
  ElabMeetNamedHostModuleCheckFixtureTextsLaterProbe,
  ElabMeetNamedHostModuleCheckFixtureTextsSelfHostProbe,
  ElabMeetNamedHostModuleCheckFixtureTextsEmitProbe,
  ElabMeetNamedHostModuleCheckFixturesProbe,
  ElabMeetNamedHostModuleCheckSurfaceProbe,
  ElabMeetNamedHostModuleCheckCheckersProbe,
  ElabMeetNamedHostModuleCheckCheckersLaterProbe,
  ElabMeetNamedHostModuleCheckRealModuleProbe,
  ElabMeetNamedHostModuleCheckEmitBodyTermProbe,
  ElabMeetNamedHostModuleCheckKernelMultTermProbe,
  ElabMeetNamedHostModuleCheckKernelLinearTermProbe,
  ElabMeetNamedHostModuleCheckKernelTypesTermProbe,
  ElabMeetNamedHostModuleCheckKernelProgramTermProbe,
  ElabMeetNamedHostModuleCheckKernelEmitTermProbe,
  ElabMeetNamedHostModuleCheckParityMultTermProbe,
  ElabMeetNamedHostModuleCheckParityLinearTermProbe,
  ElabMeetNamedHostModuleCheckParityTypesTermProbe,
  ElabMeetNamedHostModuleCheckParityProgramTermProbe,
  ElabMeetNamedHostModuleCheckParityEmitTermProbe,
  ElabMeetNamedHostModuleCheckEmitMultScaffoldTermProbe,
  ElabMeetNamedHostModuleCheckEmitLinearScaffoldTermProbe,
  ElabMeetNamedHostModuleCheckEmitTypesScaffoldTermProbe,
  ElabMeetNamedHostModuleCheckEmitProgramScaffoldTermProbe,
  ElabMeetNamedHostModuleCheckEmitGraphScaffoldTermProbe,
  ElabMeetNamedHostModuleCheckEmitComposeScaffoldTermProbe,
  ElabMeetNamedHostModuleCheckEmitErasureScaffoldTermProbe,
  ElabMeetNamedHostModuleCheckEmitExtractScaffoldTermProbe,
  ElabMeetNamedHostModuleCheckEmitBannerScaffoldTermProbe,
  ElabMeetNamedHostModuleCheckKernelSelfApplyTermProbe,
  ElabMeetNamedHostModuleCheckProductOutKernelTermProbe,
  ElabMeetNamedHostModuleCheckCompilePathTermProbe,
  ElabMeetNamedHostModuleCheckJoinMapTermProbe,
  ElabMeetNamedHostModuleCheckSelfHostTermProbe,
  ElabMeetNamedHostModuleCheckSurfaceMatrixTermProbe,
  ElabMeetNamedHostModuleCheckSpecProofTermProbe,
  ElabMeetNamedHostModuleCheckDualResidualTermProbe,
  ElabMeetNamedHostModuleCheckCompilePathMultTermProbe,
  ElabMeetNamedHostModuleCheckCompilePathLinearTermProbe,
  ElabMeetNamedHostModuleCheckCompilePathTypesTermProbe,
  ElabMeetNamedHostModuleCheckCompilePathProgramTermProbe,
  ElabMeetNamedHostModuleCheckCompilePathGraphTermProbe,
  ElabMeetNamedHostModuleCheckCompilePathComposeTermProbe,
  ElabMeetNamedHostModuleCheckCompilePathErasureTermProbe,
  ElabMeetNamedHostModuleCheckCompilePathExtractTermProbe,
  ElabMeetNamedHostModuleCheckCompilePathPlanTermProbe,
  ElabMeetNamedHostModuleCheckCompilePathApplyTermProbe,
  ElabMeetNamedHostModuleCheckCompilePathBodyTermProbe,
  ElabMeetNamedHostModuleCheckFirstSurfaceTermProbe,
  ElabMeetNamedHostModuleCheckLinearSubsetEmitTermProbe,
  ElabMeetNamedHostModuleCheckTypesSubsetEmitTermProbe,
  ElabMeetNamedHostModuleCheckProgramSubsetEmitTermProbe,
  ElabMeetNamedHostModuleCheckGraphSubsetEmitTermProbe,
  ElabMeetNamedHostModuleCheckComposeSubsetEmitTermProbe,
  ElabMeetNamedHostModuleCheckErasureSubsetEmitTermProbe,
  ElabMeetNamedHostModuleCheckExtractSubsetEmitTermProbe,
  ElabMeetNamedHostModuleCheckMultSubsetEmitTermProbe,
  ElabMeetNamedHostModuleCheckMultSubsetRebuildTermProbe,
  ElabMeetNamedHostModuleCheckLinearSubsetRebuildTermProbe,
  ElabMeetNamedHostModuleCheckTypesSubsetRebuildTermProbe,
  ElabMeetNamedHostModuleCheckProgramSubsetRebuildTermProbe,
  ElabMeetNamedHostModuleCheckGraphSubsetRebuildTermProbe,
  ElabMeetNamedHostModuleCheckLlvmLinearTextTermProbe,
  ElabMeetNamedWalkHostImportGraphWalkLater,
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit,
  ElabMeetNamedWalkHostModuleCheckCheckersLater,
  ElabMeetNamedWalkHostModuleCheckKernelMultTerm,
  ElabMeetNamedWalkHostModuleCheckKernelLinearTerm,
  ElabMeetNamedWalkHostModuleCheckKernelTypesTerm,
  ElabMeetNamedWalkHostModuleCheckKernelProgramTerm,
  ElabMeetNamedWalkHostModuleCheckKernelEmitTerm,
  ElabMeetNamedWalkHostModuleCheckParityMultTerm,
  ElabMeetNamedWalkHostModuleCheckParityLinearTerm,
  ElabMeetNamedWalkHostModuleCheckParityTypesTerm,
  ElabMeetNamedWalkHostModuleCheckParityProgramTerm,
  ElabMeetNamedWalkHostModuleCheckParityEmitTerm,
  ElabMeetNamedWalkHostModuleCheckEmitMultScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitLinearScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitTypesScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitProgramScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitGraphScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitComposeScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitErasureScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitExtractScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitBannerScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckKernelSelfApplyTerm,
  ElabMeetNamedWalkHostModuleCheckProductOutKernelTerm,
  ElabMeetNamedWalkHostModuleCheckCompilePathTerm,
  ElabMeetNamedWalkHostModuleCheckJoinMapTerm,
  ElabMeetNamedWalkHostModuleCheckSelfHostTerm,
  ElabMeetNamedWalkHostModuleCheckSurfaceMatrixTerm,
  ElabMeetNamedWalkHostModuleCheckSpecProofTerm,
  ElabMeetNamedWalkHostModuleCheckDualResidualTerm,
  ElabMeetNamedWalkHostModuleCheckCompilePathMultTerm,
  ElabMeetNamedWalkHostModuleCheckCompilePathLinearTerm,
  ElabMeetNamedWalkHostModuleCheckCompilePathTypesTerm,
  ElabMeetNamedWalkHostModuleCheckCompilePathProgramTerm,
  ElabMeetNamedWalkHostModuleCheckCompilePathGraphTerm,
  ElabMeetNamedWalkHostModuleCheckCompilePathComposeTerm,
  ElabMeetNamedWalkHostModuleCheckCompilePathErasureTerm,
  ElabMeetNamedWalkHostModuleCheckCompilePathExtractTerm,
  ElabMeetNamedWalkHostModuleCheckCompilePathPlanTerm,
  ElabMeetNamedWalkHostModuleCheckCompilePathApplyTerm,
  ElabMeetNamedWalkHostModuleCheckCompilePathBodyTerm,
  ElabMeetNamedWalkHostModuleCheckFirstSurfaceTerm,
  ElabMeetNamedWalkHostModuleCheckLinearSubsetEmitTerm,
  ElabMeetNamedWalkHostModuleCheckTypesSubsetEmitTerm,
  ElabMeetNamedWalkHostModuleCheckProgramSubsetEmitTerm,
  ElabMeetNamedWalkHostModuleCheckGraphSubsetEmitTerm,
  ElabMeetNamedWalkHostModuleCheckComposeSubsetEmitTerm,
  ElabMeetNamedWalkHostModuleCheckErasureSubsetEmitTerm,
  ElabMeetNamedWalkHostModuleCheckExtractSubsetEmitTerm,
  ElabMeetNamedWalkHostModuleCheckMultSubsetEmitTerm,
  ElabMeetNamedWalkHostModuleCheckMultSubsetRebuildTerm,
  ElabMeetNamedWalkHostModuleCheckLinearSubsetRebuildTerm,
  ElabMeetNamedWalkHostModuleCheckTypesSubsetRebuildTerm,
  ElabMeetNamedWalkHostModuleCheckProgramSubsetRebuildTerm,
  ElabMeetNamedWalkHostModuleCheckGraphSubsetRebuildTerm, or
  ElabMeetNamedWalkHostModuleCheckLlvmLinearTextTerm.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - Named HostModuleCheckMultFsWriteToolTerm subset:
    prior LlvmLinearTextTerm closed set plus
    SystemsLean.HostModuleCheckMultFsWriteToolTerm last.
    Membership list is barrel order among that closed set; skip
    Linear, skip IrGraph, skip HostGraphMain, skip HostCompose. Compile order is
    the LlvmLinearTextTerm compile order, then HostModuleCheckMultFsWriteToolTerm last.
    EmitPlanTerm is a compile dependency only, not a named plus-one.
    Dispatcher-split honesty (same as LlvmLinearTextTerm): MultFsWriteToolTerm
    imports HostModuleCheckSurface and HostModuleCheckEmitPlanTerm;
    EmitPlanTerm is not a barrel member and is not a named plus-one.
    RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
    named members of the closed set, not extra plus-ones.
    MultFsWriteToolTerm walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckMultFsWriteToolTerm.
    HostModuleCheckMultFsWriteToolTerm probe lives here.
  - tryCompileNamedHostModuleCheckMultFsWriteToolTermSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    HostModuleCheckMultFsWriteToolTerm bad writes a temp
    HostModuleCheckMultFsWriteToolTerm copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater / HostModuleCheckFixtureTexts /
    HostModuleCheckFixtureTextsProduct / HostModuleCheckFixtureTextsLater /
    HostModuleCheckFixtureTextsSelfHost /
    HostModuleCheckFixtureTextsEmit /
    HostModuleCheckFixtures /
    HostModuleCheckSurface /
    HostModuleCheckCheckers /
    HostModuleCheckCheckersLater /
    HostModuleCheckRealModule /
    HostModuleCheckEmitBodyTerm /
    HostModuleCheckKernelMultTerm /
    HostModuleCheckKernelLinearTerm /
    HostModuleCheckKernelTypesTerm /
    HostModuleCheckKernelProgramTerm /
    HostModuleCheckKernelEmitTerm /
    HostModuleCheckParityMultTerm /
    HostModuleCheckParityLinearTerm /
    HostModuleCheckParityTypesTerm /
    HostModuleCheckParityProgramTerm /
    HostModuleCheckParityEmitTerm /
    HostModuleCheckEmitMultScaffoldTerm /
    HostModuleCheckEmitLinearScaffoldTerm /
    HostModuleCheckEmitTypesScaffoldTerm /
    HostModuleCheckEmitProgramScaffoldTerm /
    HostModuleCheckEmitGraphScaffoldTerm /
    HostModuleCheckEmitComposeScaffoldTerm /
    HostModuleCheckEmitErasureScaffoldTerm /
    HostModuleCheckEmitExtractScaffoldTerm /
    HostModuleCheckEmitBannerScaffoldTerm /
    HostModuleCheckKernelSelfApplyTerm /
    HostModuleCheckProductOutKernelTerm /
    HostModuleCheckCompilePathTerm /
    HostModuleCheckJoinMapTerm /
    HostModuleCheckSelfHostTerm /
    HostModuleCheckSurfaceMatrixTerm /
    HostModuleCheckSpecProofTerm /
    HostModuleCheckDualResidualTerm /
    HostModuleCheckCompilePathMultTerm /
    HostModuleCheckCompilePathLinearTerm /
    HostModuleCheckCompilePathTypesTerm /
    HostModuleCheckCompilePathProgramTerm /
    HostModuleCheckCompilePathGraphTerm /
    HostModuleCheckCompilePathComposeTerm /
    HostModuleCheckCompilePathErasureTerm /
    HostModuleCheckCompilePathExtractTerm /
    HostModuleCheckCompilePathPlanTerm /
    HostModuleCheckCompilePathApplyTerm /
    HostModuleCheckCompilePathBodyTerm /
    HostModuleCheckFirstSurfaceTerm /
    HostModuleCheckLinearSubsetEmitTerm /
    HostModuleCheckTypesSubsetEmitTerm /
    HostModuleCheckProgramSubsetEmitTerm /
    HostModuleCheckGraphSubsetEmitTerm /
    HostModuleCheckComposeSubsetEmitTerm /
    HostModuleCheckErasureSubsetEmitTerm /
    HostModuleCheckExtractSubsetEmitTerm /
    HostModuleCheckMultSubsetEmitTerm /
    HostModuleCheckMultSubsetRebuildTerm /
    HostModuleCheckLinearSubsetRebuildTerm /
    HostModuleCheckTypesSubsetRebuildTerm /
    HostModuleCheckProgramSubsetRebuildTerm /
    HostModuleCheckGraphSubsetRebuildTerm /
    HostModuleCheckLlvmLinearTextTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior LlvmLinearTextTerm walker
    tryCompileNamedHostModuleCheckLlvmLinearTextTermSubset, and that this walk
    is not an alias of the LlvmLinearTextTerm closed set. Linear skipped. IrGraph
    skipped as a grow-tip Name. HostCompose skipped. Do not plant live
    HostModuleCheckMultFsWriteToolTerm.lean. Do not skip to
    HostModuleCheckFrontMultPackageTerm.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckMultFsWriteToolTermPath,
  namedClosedHostModuleCheckMultFsWriteToolTermSubsetNames,
  namedClosedHostModuleCheckMultFsWriteToolTermCompileOrder,
  barrelListsNamedHostModuleCheckMultFsWriteToolTermSubset,
  tryCompileNamedHostModuleCheckMultFsWriteToolTermSubset,
  tryCompileAfterHostModuleCheckMultFsWriteToolTermDeps,
  elabMeetDrivesNamedHostModuleCheckMultFsWriteToolTermSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckMultFsWriteToolTermSubset,
  elabMeetRejectsBadNamedHostModuleCheckMultFsWriteToolTermSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckMultFsWriteToolTermSubset,
  #elabMeetNamedHostModuleCheckMultFsWriteToolTermSubsetProbe,
  elabMeetNamedHostModuleCheckMultFsWriteToolTermSubsetProbe,
  SystemsLean.HostModuleCheckMultFsWriteToolTerm,
  ElabMeetNamedHostModuleCheckMultFsWriteToolTermProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckMultFsWriteToolTermProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckMultFsWriteToolTermProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckMultFsWriteToolTermProbe;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHost. Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetLive
import SystemsLean.ElabMeetNamedWalk
import SystemsLean.ElabMeetNamedWalkHostPackageWrite
import SystemsLean.ElabMeetNamedWalkHostImportGraphSeeds
import SystemsLean.ElabMeetNamedWalkHostImportGraphWalkLater
import SystemsLean.ElabMeetNamedWalkHostModuleCheckFixtureTexts
import SystemsLean.ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCheckersLater
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelMultTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelLinearTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelTypesTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelProgramTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityMultTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityLinearTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityTypesTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityProgramTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitMultScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitLinearScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitTypesScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitProgramScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitGraphScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitComposeScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitErasureScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitExtractScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitBannerScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelSelfApplyTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckProductOutKernelTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckJoinMapTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckSelfHostTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckSurfaceMatrixTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckSpecProofTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckDualResidualTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathMultTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathLinearTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathTypesTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathProgramTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathGraphTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathComposeTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathErasureTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathExtractTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathPlanTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathApplyTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathBodyTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckFirstSurfaceTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckLinearSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckTypesSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckProgramSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckGraphSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckComposeSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckErasureSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckExtractSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckMultSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckMultSubsetRebuildTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckLinearSubsetRebuildTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckTypesSubsetRebuildTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckGraphSubsetRebuildTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckLlvmLinearTextTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckMultFsWriteToolTerm

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckMultFsWriteToolTerm named subset.
    Good compiles live Mult through HostModuleCheckLlvmLinearTextTerm plus the
    subset-surface compile closure and HostModuleCheckMultFsWriteToolTerm after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckMultFsWriteToolTerm copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater / HostModuleCheckFixtureTexts /
    HostModuleCheckFixtureTextsProduct / HostModuleCheckFixtureTextsLater /
    HostModuleCheckFixtureTextsSelfHost /
    HostModuleCheckFixtureTextsEmit /
    HostModuleCheckFixtures /
    HostModuleCheckSurface /
    HostModuleCheckCheckers /
    HostModuleCheckCheckersLater /
    HostModuleCheckRealModule /
    HostModuleCheckEmitBodyTerm /
    HostModuleCheckKernelMultTerm /
    HostModuleCheckKernelLinearTerm /
    HostModuleCheckKernelTypesTerm /
    HostModuleCheckKernelProgramTerm /
    HostModuleCheckKernelEmitTerm /
    HostModuleCheckParityMultTerm /
    HostModuleCheckParityLinearTerm /
    HostModuleCheckParityTypesTerm /
    HostModuleCheckParityProgramTerm /
    HostModuleCheckParityEmitTerm /
    HostModuleCheckEmitMultScaffoldTerm /
    HostModuleCheckEmitLinearScaffoldTerm /
    HostModuleCheckEmitTypesScaffoldTerm /
    HostModuleCheckEmitProgramScaffoldTerm /
    HostModuleCheckEmitGraphScaffoldTerm /
    HostModuleCheckEmitComposeScaffoldTerm /
    HostModuleCheckEmitErasureScaffoldTerm /
    HostModuleCheckEmitExtractScaffoldTerm /
    HostModuleCheckEmitBannerScaffoldTerm /
    HostModuleCheckKernelSelfApplyTerm /
    HostModuleCheckProductOutKernelTerm /
    HostModuleCheckCompilePathTerm /
    HostModuleCheckJoinMapTerm /
    HostModuleCheckSelfHostTerm /
    HostModuleCheckSurfaceMatrixTerm /
    HostModuleCheckSpecProofTerm /
    HostModuleCheckDualResidualTerm /
    HostModuleCheckCompilePathMultTerm /
    HostModuleCheckCompilePathLinearTerm /
    HostModuleCheckCompilePathTypesTerm /
    HostModuleCheckCompilePathProgramTerm /
    HostModuleCheckCompilePathGraphTerm /
    HostModuleCheckCompilePathComposeTerm /
    HostModuleCheckCompilePathErasureTerm /
    HostModuleCheckCompilePathExtractTerm /
    HostModuleCheckCompilePathPlanTerm /
    HostModuleCheckCompilePathApplyTerm /
    HostModuleCheckCompilePathBodyTerm /
    HostModuleCheckFirstSurfaceTerm /
    HostModuleCheckLinearSubsetEmitTerm /
    HostModuleCheckTypesSubsetEmitTerm /
    HostModuleCheckProgramSubsetEmitTerm /
    HostModuleCheckGraphSubsetEmitTerm /
    HostModuleCheckComposeSubsetEmitTerm /
    HostModuleCheckErasureSubsetEmitTerm /
    HostModuleCheckExtractSubsetEmitTerm /
    HostModuleCheckMultSubsetEmitTerm /
    HostModuleCheckMultSubsetRebuildTerm /
    HostModuleCheckLinearSubsetRebuildTerm /
    HostModuleCheckTypesSubsetRebuildTerm /
    HostModuleCheckProgramSubsetRebuildTerm /
    HostModuleCheckGraphSubsetRebuildTerm /
    HostModuleCheckLlvmLinearTextTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior LlvmLinearTextTerm walker
    tryCompileNamedHostModuleCheckLlvmLinearTextTermSubset still works; this
    walker is not an alias of the LlvmLinearTextTerm closed set. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. HostCompose skipped.
    Do not plant live HostModuleCheckMultFsWriteToolTerm.lean. Do not skip to
    HostModuleCheckFrontMultPackageTerm. -/
def elabMeetRunNamedHostModuleCheckMultFsWriteToolTermSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckMultFsWriteToolTerm? <-
    liftIO findLiveHostModuleCheckMultFsWriteToolTermPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckMultFsWriteToolTermSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckMultFsWriteToolTerm? with
    | none =>
      pure true
    | some liveHostModuleCheckMultFsWriteToolTerm => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckMultFsWriteToolTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckMultFsWriteToolTermSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckMultFsWriteToolTermDeps
        badPath badDir `ElabMeetNamedHostModuleCheckMultFsWriteToolTermSubsetBad
  let liveMultStillOk <-
    match liveMult? with
    | none => pure false
    | some liveMult =>
      tryCompileLiveModule liveMult isoDir
  let thmIsoDir <- liftIO IO.FS.createTempDir
  let liveThmStillOk <-
    match liveThm? with
    | none => pure false
    | some liveThm =>
      tryCompileLiveTheorems liveThm thmIsoDir
  let subsetIsoDir <- liftIO IO.FS.createTempDir
  let priorSubsetStillOk <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckLlvmLinearTextTermSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckMultFsWriteToolTermSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckMultFsWriteToolTermSubset fakeLake fakeDir
  let notAliasOfLlvmLinearTextTerm :=
    namedClosedHostModuleCheckMultFsWriteToolTermSubsetNames
      != namedClosedHostModuleCheckLlvmLinearTextTermSubsetNames
      && namedClosedHostModuleCheckMultFsWriteToolTermCompileOrder
           != namedClosedHostModuleCheckLlvmLinearTextTermCompileOrder
      && namedClosedHostModuleCheckMultFsWriteToolTermSubsetNames.contains
           "SystemsLean.HostModuleCheckMultFsWriteToolTerm"
      && !namedClosedHostModuleCheckLlvmLinearTextTermSubsetNames.contains
           "SystemsLean.HostModuleCheckMultFsWriteToolTerm"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfLlvmLinearTextTerm
  try
    liftIO (IO.FS.removeDirAll oleanDir)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll badDir)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll isoDir)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll thmIsoDir)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll subsetIsoDir)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll fakeDir)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !badCompiled then `(true) else `(false)
  let iStx <- if isolation then `(true) else `(false)
  let dStx <-
    if good && !badCompiled && isolation then
      `(true)
    else
      `(false)
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckMultFsWriteToolTermSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckMultFsWriteToolTermSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckMultFsWriteToolTermSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckMultFsWriteToolTermSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostModuleCheckMultFsWriteToolTermSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostModuleCheckMultFsWriteToolTermSubset
      `elabMeetRejectsBadNamedHostModuleCheckMultFsWriteToolTermSubset
      `elabMeetRejectsOldWalkAsNamedHostModuleCheckMultFsWriteToolTermSubset
      `elabMeetDrivesNamedHostModuleCheckMultFsWriteToolTermSubset
  else
    elabMeetRunNamedHostModuleCheckMultFsWriteToolTermSubsetProbe

#elabMeetNamedHostModuleCheckMultFsWriteToolTermSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckMultFsWriteToolTermSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckMultFsWriteToolTermSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckMultFsWriteToolTermSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckMultFsWriteToolTermSubset = true := rfl

end SystemsLean.ElabMeet
