/-
  SYSTEMS_LEAN_HOST partial -- thirty-ninth HostModuleCheckCheckersLater named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Thirty-ninth wrappers live in
  ElabMeetNamedWalkHostModuleCheckCheckersLater. Shared helpers stay in
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
  ElabMeetNamedWalkHostImportGraphWalkLater, or
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostModuleCheckCheckersLater subset (thirty-nine named members):
    prior thirty-eight plus SystemsLean.HostModuleCheckCheckersLater last.
    Membership list is barrel order among the thirty-nine; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the thirty-eighth compile order, then HostModuleCheckCheckersLater last.
    IrGraph and HostCompose are compile dependencies only.
    Thirty-nine-name walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckCheckersLater.
    Thirty-ninth HostModuleCheckCheckersLater probe lives here.
  - tryCompileNamedHostModuleCheckCheckersLaterSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Thirty-nine-name HostModuleCheckCheckersLater bad writes a temp
    HostModuleCheckCheckersLater copy and compiles it after Mult and the
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
    HostModuleCheckCheckers oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior thirty-eight-module walker
    tryCompileNamedHostModuleCheckCheckersSubset, and that this walk
    is not an alias of the thirty-eighth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckCheckersLater.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckCheckersLaterPath,
  namedClosedHostModuleCheckCheckersLaterSubsetNames,
  namedClosedHostModuleCheckCheckersLaterCompileOrder,
  barrelListsNamedHostModuleCheckCheckersLaterSubset,
  tryCompileNamedHostModuleCheckCheckersLaterSubset,
  tryCompileAfterHostModuleCheckCheckersLaterDeps,
  elabMeetDrivesNamedHostModuleCheckCheckersLaterSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckCheckersLaterSubset,
  elabMeetRejectsBadNamedHostModuleCheckCheckersLaterSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersLaterSubset,
  #elabMeetNamedHostModuleCheckCheckersLaterSubsetProbe,
  elabMeetNamedHostModuleCheckCheckersLaterSubsetProbe,
  SystemsLean.HostModuleCheckCheckersLater,
  ElabMeetNamedHostModuleCheckCheckersLaterProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckCheckersLaterProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckCheckersLaterProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckCheckersLaterProbe;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckCheckersLater named subset.
    Good compiles live Mult through HostModuleCheckCheckers plus the
    subset-surface compile closure and HostModuleCheckCheckersLater after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckCheckersLater copy with a planted type error after Mult
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
    HostModuleCheckCheckers oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior thirty-eight-module walker
    tryCompileNamedHostModuleCheckCheckersSubset still works; this
    walker is not an alias of the thirty-eighth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckCheckersLater.lean. -/
elab "#elabMeetNamedHostModuleCheckCheckersLaterSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckCheckersLater? <-
    liftIO findLiveHostModuleCheckCheckersLaterPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckCheckersLaterSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckCheckersLater? with
    | none =>
      pure true
    | some liveHostModuleCheckCheckersLater => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckCheckersLater)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckCheckersLaterSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckCheckersLaterDeps
        badPath badDir `ElabMeetNamedHostModuleCheckCheckersLaterSubsetBad
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
      tryCompileNamedHostModuleCheckCheckersSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckCheckersLaterSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckCheckersLaterSubset fakeLake fakeDir
  let notAliasOfThirtyEighth :=
    namedClosedHostModuleCheckCheckersLaterSubsetNames
      != namedClosedHostModuleCheckCheckersSubsetNames
      && namedClosedHostModuleCheckCheckersLaterCompileOrder
           != namedClosedHostModuleCheckCheckersCompileOrder
      && namedClosedHostModuleCheckCheckersLaterSubsetNames.contains
           "SystemsLean.HostModuleCheckCheckersLater"
      && !namedClosedHostModuleCheckCheckersSubsetNames.contains
           "SystemsLean.HostModuleCheckCheckersLater"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfThirtyEighth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckCheckersLaterSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckCheckersLaterSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersLaterSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckCheckersLaterSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckCheckersLaterSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckCheckersLaterSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckCheckersLaterSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersLaterSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckCheckersLaterSubset = true := rfl

end SystemsLean.ElabMeet
