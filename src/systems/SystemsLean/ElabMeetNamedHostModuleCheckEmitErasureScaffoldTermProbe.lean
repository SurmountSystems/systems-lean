/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckEmitErasureScaffoldTerm named
  closed subset probe (plus-one after the EmitComposeScaffoldTerm closed set).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. EmitErasureScaffoldTerm wrappers live in
  ElabMeetNamedWalkHostModuleCheckEmitErasureScaffoldTerm. Shared helpers stay in
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
  ElabMeetNamedWalkHostModuleCheckEmitGraphScaffoldTerm, or
  ElabMeetNamedWalkHostModuleCheckEmitComposeScaffoldTerm.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - Named HostModuleCheckEmitErasureScaffoldTerm subset:
    prior EmitComposeScaffoldTerm closed set plus
    SystemsLean.HostModuleCheckEmitErasureScaffoldTerm last.
    Membership list is barrel order among that closed set; skip
    Linear, skip IrGraph, skip HostGraphMain, skip HostCompose. Compile order is
    the EmitComposeScaffoldTerm compile order, then HostModuleCheckEmitErasureScaffoldTerm last.
    EmitPlanTerm is a compile dependency only, not a named plus-one.
    Dispatcher-split honesty (same as EmitComposeScaffoldTerm): EmitErasureScaffoldTerm
    imports HostModuleCheckSurface and HostModuleCheckEmitPlanTerm;
    EmitPlanTerm is not a barrel member and is not a named plus-one.
    EmitErasureScaffoldTerm walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckEmitErasureScaffoldTerm.
    HostModuleCheckEmitErasureScaffoldTerm probe lives here.
  - tryCompileNamedHostModuleCheckEmitErasureScaffoldTermSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    HostModuleCheckEmitErasureScaffoldTerm bad writes a temp
    HostModuleCheckEmitErasureScaffoldTerm copy and compiles it after Mult and the
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
    HostModuleCheckEmitComposeScaffoldTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior EmitComposeScaffoldTerm walker
    tryCompileNamedHostModuleCheckEmitComposeScaffoldTermSubset, and that this walk
    is not an alias of the EmitComposeScaffoldTerm closed set. Linear skipped. IrGraph
    skipped as a grow-tip Name. HostCompose skipped. Do not plant live
    HostModuleCheckEmitErasureScaffoldTerm.lean. Do not skip to
    HostModuleCheckEmitExtractScaffoldTerm.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckEmitErasureScaffoldTermPath,
  namedClosedHostModuleCheckEmitErasureScaffoldTermSubsetNames,
  namedClosedHostModuleCheckEmitErasureScaffoldTermCompileOrder,
  barrelListsNamedHostModuleCheckEmitErasureScaffoldTermSubset,
  tryCompileNamedHostModuleCheckEmitErasureScaffoldTermSubset,
  tryCompileAfterHostModuleCheckEmitErasureScaffoldTermDeps,
  elabMeetDrivesNamedHostModuleCheckEmitErasureScaffoldTermSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckEmitErasureScaffoldTermSubset,
  elabMeetRejectsBadNamedHostModuleCheckEmitErasureScaffoldTermSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitErasureScaffoldTermSubset,
  #elabMeetNamedHostModuleCheckEmitErasureScaffoldTermSubsetProbe,
  elabMeetNamedHostModuleCheckEmitErasureScaffoldTermSubsetProbe,
  SystemsLean.HostModuleCheckEmitErasureScaffoldTerm,
  ElabMeetNamedHostModuleCheckEmitErasureScaffoldTermProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckEmitErasureScaffoldTermProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckEmitErasureScaffoldTermProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckEmitErasureScaffoldTermProbe;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckEmitErasureScaffoldTerm named subset.
    Good compiles live Mult through HostModuleCheckEmitComposeScaffoldTerm plus the
    subset-surface compile closure and HostModuleCheckEmitErasureScaffoldTerm after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckEmitErasureScaffoldTerm copy with a planted type error after Mult
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
    HostModuleCheckEmitComposeScaffoldTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior EmitComposeScaffoldTerm walker
    tryCompileNamedHostModuleCheckEmitComposeScaffoldTermSubset still works; this
    walker is not an alias of the EmitComposeScaffoldTerm closed set. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. HostCompose skipped.
    Do not plant live HostModuleCheckEmitErasureScaffoldTerm.lean. Do not skip to
    HostModuleCheckEmitExtractScaffoldTerm. -/
elab "#elabMeetNamedHostModuleCheckEmitErasureScaffoldTermSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckEmitErasureScaffoldTerm? <-
    liftIO findLiveHostModuleCheckEmitErasureScaffoldTermPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckEmitErasureScaffoldTermSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckEmitErasureScaffoldTerm? with
    | none =>
      pure true
    | some liveHostModuleCheckEmitErasureScaffoldTerm => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckEmitErasureScaffoldTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckEmitErasureScaffoldTermSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckEmitErasureScaffoldTermDeps
        badPath badDir `ElabMeetNamedHostModuleCheckEmitErasureScaffoldTermSubsetBad
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
      tryCompileNamedHostModuleCheckEmitComposeScaffoldTermSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckEmitErasureScaffoldTermSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckEmitErasureScaffoldTermSubset fakeLake fakeDir
  let notAliasOfEmitComposeScaffoldTerm :=
    namedClosedHostModuleCheckEmitErasureScaffoldTermSubsetNames
      != namedClosedHostModuleCheckEmitComposeScaffoldTermSubsetNames
      && namedClosedHostModuleCheckEmitErasureScaffoldTermCompileOrder
           != namedClosedHostModuleCheckEmitComposeScaffoldTermCompileOrder
      && namedClosedHostModuleCheckEmitErasureScaffoldTermSubsetNames.contains
           "SystemsLean.HostModuleCheckEmitErasureScaffoldTerm"
      && !namedClosedHostModuleCheckEmitComposeScaffoldTermSubsetNames.contains
           "SystemsLean.HostModuleCheckEmitErasureScaffoldTerm"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfEmitComposeScaffoldTerm
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckEmitErasureScaffoldTermSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckEmitErasureScaffoldTermSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitErasureScaffoldTermSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckEmitErasureScaffoldTermSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckEmitErasureScaffoldTermSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckEmitErasureScaffoldTermSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckEmitErasureScaffoldTermSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitErasureScaffoldTermSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckEmitErasureScaffoldTermSubset = true := rfl

end SystemsLean.ElabMeet
