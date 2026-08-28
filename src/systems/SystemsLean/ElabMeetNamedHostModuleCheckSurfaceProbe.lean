/-
  SYSTEMS_LEAN_HOST partial -- thirty-seventh HostModuleCheckSurface named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Thirty-seventh wrappers live in
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit. Shared helpers stay in
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
  ElabMeetNamedHostModuleCheckFixturesProbe, or
  ElabMeetNamedWalkHostImportGraphWalkLater.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostModuleCheckSurface subset (thirty-seven named members):
    prior thirty-six plus SystemsLean.HostModuleCheckSurface last.
    Membership list is barrel order among the thirty-seven; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the thirty-sixth compile order, then HostModuleCheckSurface last.
    IrGraph and HostCompose are compile dependencies only.
    Thirty-seven-name walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit.
    Thirty-seventh HostModuleCheckSurface probe lives here.
  - tryCompileNamedHostModuleCheckSurfaceSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Thirty-seven-name HostModuleCheckSurface bad writes a temp
    HostModuleCheckSurface copy and compiles it after Mult and the
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
    HostModuleCheckFixtures oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior thirty-six-module walker
    tryCompileNamedHostModuleCheckFixturesSubset, and that this walk
    is not an alias of the thirty-sixth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckSurface.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckSurfacePath,
  namedClosedHostModuleCheckSurfaceSubsetNames,
  namedClosedHostModuleCheckSurfaceCompileOrder,
  barrelListsNamedHostModuleCheckSurfaceSubset,
  tryCompileNamedHostModuleCheckSurfaceSubset,
  tryCompileAfterHostModuleCheckSurfaceDeps,
  elabMeetDrivesNamedHostModuleCheckSurfaceSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckSurfaceSubset,
  elabMeetRejectsBadNamedHostModuleCheckSurfaceSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckSurfaceSubset,
  #elabMeetNamedHostModuleCheckSurfaceSubsetProbe,
  elabMeetNamedHostModuleCheckSurfaceSubsetProbe,
  SystemsLean.HostModuleCheckSurface,
  ElabMeetNamedHostModuleCheckSurfaceProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckSurfaceProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckSurfaceProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckSurfaceProbe;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckSurface named subset.
    Good compiles live Mult through HostModuleCheckFixtures plus the
    subset-surface compile closure and HostModuleCheckSurface after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckSurface copy with a planted type error after Mult
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
    HostModuleCheckFixtures oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior thirty-six-module walker
    tryCompileNamedHostModuleCheckFixturesSubset still works; this
    walker is not an alias of the thirty-sixth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckSurface.lean. -/
elab "#elabMeetNamedHostModuleCheckSurfaceSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckSurface? <-
    liftIO findLiveHostModuleCheckSurfacePath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckSurfaceSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckSurface? with
    | none =>
      pure true
    | some liveHostModuleCheckSurface => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckSurface)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckSurfaceSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckSurfaceDeps
        badPath badDir `ElabMeetNamedHostModuleCheckSurfaceSubsetBad
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
      tryCompileNamedHostModuleCheckFixturesSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckSurfaceSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckSurfaceSubset fakeLake fakeDir
  let notAliasOfThirtySixth :=
    namedClosedHostModuleCheckSurfaceSubsetNames
      != namedClosedHostModuleCheckFixturesSubsetNames
      && namedClosedHostModuleCheckSurfaceCompileOrder
           != namedClosedHostModuleCheckFixturesCompileOrder
      && namedClosedHostModuleCheckSurfaceSubsetNames.contains
           "SystemsLean.HostModuleCheckSurface"
      && !namedClosedHostModuleCheckFixturesSubsetNames.contains
           "SystemsLean.HostModuleCheckSurface"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfThirtySixth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckSurfaceSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckSurfaceSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckSurfaceSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckSurfaceSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckSurfaceSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckSurfaceSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckSurfaceSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckSurfaceSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckSurfaceSubset = true := rfl

end SystemsLean.ElabMeet
