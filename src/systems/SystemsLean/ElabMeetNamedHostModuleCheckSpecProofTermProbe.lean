/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckSpecProofTerm named
  closed subset probe (plus-one after the SurfaceMatrixTerm closed set).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. SpecProofTerm wrappers live in
  ElabMeetNamedWalkHostModuleCheckSpecProofTerm. Shared helpers stay in
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
  ElabMeetNamedWalkHostModuleCheckSelfHostTerm, or
  ElabMeetNamedWalkHostModuleCheckSurfaceMatrixTerm.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - Named HostModuleCheckSpecProofTerm subset:
    prior SurfaceMatrixTerm closed set plus
    SystemsLean.HostModuleCheckSpecProofTerm last.
    Membership list is barrel order among that closed set; skip
    Linear, skip IrGraph, skip HostGraphMain, skip HostCompose. Compile order is
    the SurfaceMatrixTerm compile order, then HostModuleCheckSpecProofTerm last.
    EmitPlanTerm is a compile dependency only, not a named plus-one.
    Dispatcher-split honesty (same as SurfaceMatrixTerm): SpecProofTerm
    imports HostModuleCheckSurface and HostModuleCheckEmitPlanTerm;
    EmitPlanTerm is not a barrel member and is not a named plus-one.
    RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
    named members of the closed set, not extra plus-ones.
    SpecProofTerm walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckSpecProofTerm.
    HostModuleCheckSpecProofTerm probe lives here.
  - tryCompileNamedHostModuleCheckSpecProofTermSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    HostModuleCheckSpecProofTerm bad writes a temp
    HostModuleCheckSpecProofTerm copy and compiles it after Mult and the
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
    HostModuleCheckSurfaceMatrixTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior SurfaceMatrixTerm walker
    tryCompileNamedHostModuleCheckSurfaceMatrixTermSubset, and that this walk
    is not an alias of the SurfaceMatrixTerm closed set. Linear skipped. IrGraph
    skipped as a grow-tip Name. HostCompose skipped. Do not plant live
    HostModuleCheckSpecProofTerm.lean. Do not skip to
    HostModuleCheckDualResidualTerm.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckSpecProofTermPath,
  namedClosedHostModuleCheckSpecProofTermSubsetNames,
  namedClosedHostModuleCheckSpecProofTermCompileOrder,
  barrelListsNamedHostModuleCheckSpecProofTermSubset,
  tryCompileNamedHostModuleCheckSpecProofTermSubset,
  tryCompileAfterHostModuleCheckSpecProofTermDeps,
  elabMeetDrivesNamedHostModuleCheckSpecProofTermSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckSpecProofTermSubset,
  elabMeetRejectsBadNamedHostModuleCheckSpecProofTermSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckSpecProofTermSubset,
  #elabMeetNamedHostModuleCheckSpecProofTermSubsetProbe,
  elabMeetNamedHostModuleCheckSpecProofTermSubsetProbe,
  SystemsLean.HostModuleCheckSpecProofTerm,
  ElabMeetNamedHostModuleCheckSpecProofTermProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckSpecProofTermProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckSpecProofTermProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckSpecProofTermProbe;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckSpecProofTerm named subset.
    Good compiles live Mult through HostModuleCheckSurfaceMatrixTerm plus the
    subset-surface compile closure and HostModuleCheckSpecProofTerm after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckSpecProofTerm copy with a planted type error after Mult
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
    HostModuleCheckSurfaceMatrixTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior SurfaceMatrixTerm walker
    tryCompileNamedHostModuleCheckSurfaceMatrixTermSubset still works; this
    walker is not an alias of the SurfaceMatrixTerm closed set. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. HostCompose skipped.
    Do not plant live HostModuleCheckSpecProofTerm.lean. Do not skip to
    HostModuleCheckDualResidualTerm. -/
elab "#elabMeetNamedHostModuleCheckSpecProofTermSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckSpecProofTerm? <-
    liftIO findLiveHostModuleCheckSpecProofTermPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckSpecProofTermSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckSpecProofTerm? with
    | none =>
      pure true
    | some liveHostModuleCheckSpecProofTerm => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckSpecProofTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckSpecProofTermSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckSpecProofTermDeps
        badPath badDir `ElabMeetNamedHostModuleCheckSpecProofTermSubsetBad
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
      tryCompileNamedHostModuleCheckSurfaceMatrixTermSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckSpecProofTermSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckSpecProofTermSubset fakeLake fakeDir
  let notAliasOfSurfaceMatrixTerm :=
    namedClosedHostModuleCheckSpecProofTermSubsetNames
      != namedClosedHostModuleCheckSurfaceMatrixTermSubsetNames
      && namedClosedHostModuleCheckSpecProofTermCompileOrder
           != namedClosedHostModuleCheckSurfaceMatrixTermCompileOrder
      && namedClosedHostModuleCheckSpecProofTermSubsetNames.contains
           "SystemsLean.HostModuleCheckSpecProofTerm"
      && !namedClosedHostModuleCheckSurfaceMatrixTermSubsetNames.contains
           "SystemsLean.HostModuleCheckSpecProofTerm"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfSurfaceMatrixTerm
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckSpecProofTermSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckSpecProofTermSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckSpecProofTermSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckSpecProofTermSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckSpecProofTermSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckSpecProofTermSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckSpecProofTermSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckSpecProofTermSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckSpecProofTermSubset = true := rfl

end SystemsLean.ElabMeet
