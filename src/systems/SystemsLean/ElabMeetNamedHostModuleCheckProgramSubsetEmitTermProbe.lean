/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckProgramSubsetEmitTerm named
  closed subset probe (plus-one after the TypesSubsetEmitTerm closed set).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. ProgramSubsetEmitTerm wrappers live in
  ElabMeetNamedWalkHostModuleCheckProgramSubsetEmitTerm. Shared helpers stay in
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
  ElabMeetNamedWalkHostModuleCheckLinearSubsetEmitTerm, or
  ElabMeetNamedWalkHostModuleCheckTypesSubsetEmitTerm.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - Named HostModuleCheckProgramSubsetEmitTerm subset:
    prior TypesSubsetEmitTerm closed set plus
    SystemsLean.HostModuleCheckProgramSubsetEmitTerm last.
    Membership list is barrel order among that closed set; skip
    Linear, skip IrGraph, skip HostGraphMain, skip HostCompose. Compile order is
    the TypesSubsetEmitTerm compile order, then HostModuleCheckProgramSubsetEmitTerm last.
    EmitPlanTerm is a compile dependency only, not a named plus-one.
    Dispatcher-split honesty (same as TypesSubsetEmitTerm): ProgramSubsetEmitTerm
    imports HostModuleCheckSurface and HostModuleCheckEmitPlanTerm;
    EmitPlanTerm is not a barrel member and is not a named plus-one.
    RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
    named members of the closed set, not extra plus-ones.
    ProgramSubsetEmitTerm walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckProgramSubsetEmitTerm.
    HostModuleCheckProgramSubsetEmitTerm probe lives here.
  - tryCompileNamedHostModuleCheckProgramSubsetEmitTermSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    HostModuleCheckProgramSubsetEmitTerm bad writes a temp
    HostModuleCheckProgramSubsetEmitTerm copy and compiles it after Mult and the
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
    HostModuleCheckTypesSubsetEmitTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior TypesSubsetEmitTerm walker
    tryCompileNamedHostModuleCheckTypesSubsetEmitTermSubset, and that this walk
    is not an alias of the TypesSubsetEmitTerm closed set. Linear skipped. IrGraph
    skipped as a grow-tip Name. HostCompose skipped. Do not plant live
    HostModuleCheckProgramSubsetEmitTerm.lean. Do not skip to
    HostModuleCheckGraphSubsetEmitTerm.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckProgramSubsetEmitTermPath,
  namedClosedHostModuleCheckProgramSubsetEmitTermSubsetNames,
  namedClosedHostModuleCheckProgramSubsetEmitTermCompileOrder,
  barrelListsNamedHostModuleCheckProgramSubsetEmitTermSubset,
  tryCompileNamedHostModuleCheckProgramSubsetEmitTermSubset,
  tryCompileAfterHostModuleCheckProgramSubsetEmitTermDeps,
  elabMeetDrivesNamedHostModuleCheckProgramSubsetEmitTermSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckProgramSubsetEmitTermSubset,
  elabMeetRejectsBadNamedHostModuleCheckProgramSubsetEmitTermSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckProgramSubsetEmitTermSubset,
  #elabMeetNamedHostModuleCheckProgramSubsetEmitTermSubsetProbe,
  elabMeetNamedHostModuleCheckProgramSubsetEmitTermSubsetProbe,
  SystemsLean.HostModuleCheckProgramSubsetEmitTerm,
  ElabMeetNamedHostModuleCheckProgramSubsetEmitTermProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckProgramSubsetEmitTermProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckProgramSubsetEmitTermProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckProgramSubsetEmitTermProbe;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckProgramSubsetEmitTerm named subset.
    Good compiles live Mult through HostModuleCheckTypesSubsetEmitTerm plus the
    subset-surface compile closure and HostModuleCheckProgramSubsetEmitTerm after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckProgramSubsetEmitTerm copy with a planted type error after Mult
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
    HostModuleCheckTypesSubsetEmitTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior TypesSubsetEmitTerm walker
    tryCompileNamedHostModuleCheckTypesSubsetEmitTermSubset still works; this
    walker is not an alias of the TypesSubsetEmitTerm closed set. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. HostCompose skipped.
    Do not plant live HostModuleCheckProgramSubsetEmitTerm.lean. Do not skip to
    HostModuleCheckGraphSubsetEmitTerm. -/
elab "#elabMeetNamedHostModuleCheckProgramSubsetEmitTermSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckProgramSubsetEmitTerm? <-
    liftIO findLiveHostModuleCheckProgramSubsetEmitTermPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckProgramSubsetEmitTermSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckProgramSubsetEmitTerm? with
    | none =>
      pure true
    | some liveHostModuleCheckProgramSubsetEmitTerm => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckProgramSubsetEmitTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckProgramSubsetEmitTermSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckProgramSubsetEmitTermDeps
        badPath badDir `ElabMeetNamedHostModuleCheckProgramSubsetEmitTermSubsetBad
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
      tryCompileNamedHostModuleCheckTypesSubsetEmitTermSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckProgramSubsetEmitTermSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckProgramSubsetEmitTermSubset fakeLake fakeDir
  let notAliasOfTypesSubsetEmitTerm :=
    namedClosedHostModuleCheckProgramSubsetEmitTermSubsetNames
      != namedClosedHostModuleCheckTypesSubsetEmitTermSubsetNames
      && namedClosedHostModuleCheckProgramSubsetEmitTermCompileOrder
           != namedClosedHostModuleCheckTypesSubsetEmitTermCompileOrder
      && namedClosedHostModuleCheckProgramSubsetEmitTermSubsetNames.contains
           "SystemsLean.HostModuleCheckProgramSubsetEmitTerm"
      && !namedClosedHostModuleCheckTypesSubsetEmitTermSubsetNames.contains
           "SystemsLean.HostModuleCheckProgramSubsetEmitTerm"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfTypesSubsetEmitTerm
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckProgramSubsetEmitTermSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckProgramSubsetEmitTermSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckProgramSubsetEmitTermSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckProgramSubsetEmitTermSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckProgramSubsetEmitTermSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckProgramSubsetEmitTermSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckProgramSubsetEmitTermSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckProgramSubsetEmitTermSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckProgramSubsetEmitTermSubset = true := rfl

end SystemsLean.ElabMeet
