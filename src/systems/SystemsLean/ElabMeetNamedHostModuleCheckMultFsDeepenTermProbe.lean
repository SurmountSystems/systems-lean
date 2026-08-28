/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckMultFsDeepenTerm named
  closed subset probe (plus-one after the LlvmTypesTextTerm closed set).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. MultFsDeepenTerm wrappers live in
  ElabMeetNamedWalkHostModuleCheckMultFsDeepenTerm. Shared helpers stay in
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
  ElabMeetNamedHostModuleCheckLlvmTypesTextTermProbe,
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
  ElabMeetNamedWalkHostModuleCheckLlvmTypesTextTerm.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - Named HostModuleCheckMultFsDeepenTerm subset:
    prior LlvmTypesTextTerm closed set plus
    SystemsLean.HostModuleCheckMultFsDeepenTerm last.
    Membership list is barrel order among that closed set; skip
    Linear, skip IrGraph, skip HostGraphMain, skip HostCompose. Compile order is
    the LlvmTypesTextTerm compile order, then HostModuleCheckMultFsDeepenTerm last.
    EmitPlanTerm is a compile dependency only, not a named plus-one.
    Dispatcher-split honesty (same as LlvmTypesTextTerm): MultFsDeepenTerm
    imports HostModuleCheckSurface and HostModuleCheckEmitPlanTerm;
    EmitPlanTerm is not a barrel member and is not a named plus-one.
    RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
    named members of the closed set, not extra plus-ones.
    MultFsDeepenTerm walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckMultFsDeepenTerm.
    HostModuleCheckMultFsDeepenTerm probe lives here.
  - tryCompileNamedHostModuleCheckMultFsDeepenTermSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    HostModuleCheckMultFsDeepenTerm bad writes a temp
    HostModuleCheckMultFsDeepenTerm copy and compiles it after Mult and the
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
    HostModuleCheckLlvmTypesTextTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior LlvmTypesTextTerm walker
    tryCompileNamedHostModuleCheckLlvmTypesTextTermSubset, and that this walk
    is not an alias of the LlvmTypesTextTerm closed set. Linear skipped. IrGraph
    skipped as a grow-tip Name. HostCompose skipped. Do not plant live
    HostModuleCheckMultFsDeepenTerm.lean. Do not skip to
    HostModuleCheckHostPackageWriteTerm.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckMultFsDeepenTermPath,
  namedClosedHostModuleCheckMultFsDeepenTermSubsetNames,
  namedClosedHostModuleCheckMultFsDeepenTermCompileOrder,
  barrelListsNamedHostModuleCheckMultFsDeepenTermSubset,
  tryCompileNamedHostModuleCheckMultFsDeepenTermSubset,
  tryCompileAfterHostModuleCheckMultFsDeepenTermDeps,
  elabMeetDrivesNamedHostModuleCheckMultFsDeepenTermSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckMultFsDeepenTermSubset,
  elabMeetRejectsBadNamedHostModuleCheckMultFsDeepenTermSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckMultFsDeepenTermSubset,
  #elabMeetNamedHostModuleCheckMultFsDeepenTermSubsetProbe,
  elabMeetNamedHostModuleCheckMultFsDeepenTermSubsetProbe,
  SystemsLean.HostModuleCheckMultFsDeepenTerm,
  ElabMeetNamedHostModuleCheckMultFsDeepenTermProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckMultFsDeepenTermProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckMultFsDeepenTermProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckMultFsDeepenTermProbe;
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
import SystemsLean.ElabMeetNamedWalkHostModuleCheckLlvmTypesTextTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckMultFsDeepenTerm

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckMultFsDeepenTerm named subset.
    Good compiles live Mult through HostModuleCheckLlvmTypesTextTerm plus the
    subset-surface compile closure and HostModuleCheckMultFsDeepenTerm after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckMultFsDeepenTerm copy with a planted type error after Mult
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
    HostModuleCheckLlvmTypesTextTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior LlvmTypesTextTerm walker
    tryCompileNamedHostModuleCheckLlvmTypesTextTermSubset still works; this
    walker is not an alias of the LlvmTypesTextTerm closed set. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. HostCompose skipped.
    Do not plant live HostModuleCheckMultFsDeepenTerm.lean. Do not skip to
    HostModuleCheckHostPackageWriteTerm. -/
elab "#elabMeetNamedHostModuleCheckMultFsDeepenTermSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckMultFsDeepenTerm? <-
    liftIO findLiveHostModuleCheckMultFsDeepenTermPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckMultFsDeepenTermSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckMultFsDeepenTerm? with
    | none =>
      pure true
    | some liveHostModuleCheckMultFsDeepenTerm => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckMultFsDeepenTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckMultFsDeepenTermSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckMultFsDeepenTermDeps
        badPath badDir `ElabMeetNamedHostModuleCheckMultFsDeepenTermSubsetBad
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
      tryCompileNamedHostModuleCheckLlvmTypesTextTermSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckMultFsDeepenTermSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckMultFsDeepenTermSubset fakeLake fakeDir
  let notAliasOfLlvmTypesTextTerm :=
    namedClosedHostModuleCheckMultFsDeepenTermSubsetNames
      != namedClosedHostModuleCheckLlvmTypesTextTermSubsetNames
      && namedClosedHostModuleCheckMultFsDeepenTermCompileOrder
           != namedClosedHostModuleCheckLlvmTypesTextTermCompileOrder
      && namedClosedHostModuleCheckMultFsDeepenTermSubsetNames.contains
           "SystemsLean.HostModuleCheckMultFsDeepenTerm"
      && !namedClosedHostModuleCheckLlvmTypesTextTermSubsetNames.contains
           "SystemsLean.HostModuleCheckMultFsDeepenTerm"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfLlvmTypesTextTerm
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckMultFsDeepenTermSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckMultFsDeepenTermSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckMultFsDeepenTermSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckMultFsDeepenTermSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckMultFsDeepenTermSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckMultFsDeepenTermSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckMultFsDeepenTermSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckMultFsDeepenTermSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckMultFsDeepenTermSubset = true := rfl

end SystemsLean.ElabMeet
