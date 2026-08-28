/-
  SYSTEMS_LEAN_HOST partial -- thirty-sixth HostModuleCheckFixtures named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Thirty-sixth wrappers live in
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
  ElabMeetNamedHostModuleCheckFixtureTextsEmitProbe, or
  ElabMeetNamedWalkHostImportGraphWalkLater.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostModuleCheckFixtures subset (thirty-six named members):
    prior thirty-five plus SystemsLean.HostModuleCheckFixtures last.
    Membership list is barrel order among the thirty-six; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the thirty-fifth compile order, then HostModuleCheckFixtures last.
    IrGraph and HostCompose are compile dependencies only.
    Thirty-six-name walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit.
    Thirty-sixth HostModuleCheckFixtures probe lives here.
  - tryCompileNamedHostModuleCheckFixturesSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Thirty-six-name HostModuleCheckFixtures bad writes a temp
    HostModuleCheckFixtures copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater / HostModuleCheckFixtureTexts /
    HostModuleCheckFixtureTextsProduct / HostModuleCheckFixtureTextsLater /
    HostModuleCheckFixtureTextsSelfHost /
    HostModuleCheckFixtureTextsEmit oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior thirty-five-module walker
    tryCompileNamedHostModuleCheckFixtureTextsEmitSubset, and that this walk
    is not an alias of the thirty-fifth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckFixtures.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckFixturesPath,
  namedClosedHostModuleCheckFixturesSubsetNames,
  namedClosedHostModuleCheckFixturesCompileOrder,
  barrelListsNamedHostModuleCheckFixturesSubset,
  tryCompileNamedHostModuleCheckFixturesSubset,
  tryCompileAfterHostModuleCheckFixturesDeps,
  elabMeetDrivesNamedHostModuleCheckFixturesSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckFixturesSubset,
  elabMeetRejectsBadNamedHostModuleCheckFixturesSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckFixturesSubset,
  #elabMeetNamedHostModuleCheckFixturesSubsetProbe,
  elabMeetNamedHostModuleCheckFixturesSubsetProbe,
  SystemsLean.HostModuleCheckFixtures,
  ElabMeetNamedHostModuleCheckFixturesProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckFixturesProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckFixturesProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckFixturesProbe;
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

/-- Record accept / reject for the HostModuleCheckFixtures named subset.
    Good compiles live Mult through HostModuleCheckFixtureTextsEmit plus the
    subset-fixtures compile closure and HostModuleCheckFixtures after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckFixtures copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater / HostModuleCheckFixtureTexts /
    HostModuleCheckFixtureTextsProduct / HostModuleCheckFixtureTextsLater /
    HostModuleCheckFixtureTextsSelfHost /
    HostModuleCheckFixtureTextsEmit oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior thirty-five-module walker
    tryCompileNamedHostModuleCheckFixtureTextsEmitSubset still works; this
    walker is not an alias of the thirty-fifth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckFixtures.lean. -/
elab "#elabMeetNamedHostModuleCheckFixturesSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckFixtures? <-
    liftIO findLiveHostModuleCheckFixturesPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckFixturesSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckFixtures? with
    | none =>
      pure true
    | some liveHostModuleCheckFixtures => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckFixtures)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckFixturesSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckFixturesDeps
        badPath badDir `ElabMeetNamedHostModuleCheckFixturesSubsetBad
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
      tryCompileNamedHostModuleCheckFixtureTextsEmitSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckFixturesSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckFixturesSubset fakeLake fakeDir
  let notAliasOfThirtyFifth :=
    namedClosedHostModuleCheckFixturesSubsetNames
      != namedClosedHostModuleCheckFixtureTextsEmitSubsetNames
      && namedClosedHostModuleCheckFixturesCompileOrder
           != namedClosedHostModuleCheckFixtureTextsEmitCompileOrder
      && namedClosedHostModuleCheckFixturesSubsetNames.contains
           "SystemsLean.HostModuleCheckFixtures"
      && !namedClosedHostModuleCheckFixtureTextsEmitSubsetNames.contains
           "SystemsLean.HostModuleCheckFixtures"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfThirtyFifth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckFixturesSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckFixturesSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckFixturesSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckFixturesSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckFixturesSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckFixturesSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckFixturesSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckFixturesSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckFixturesSubset = true := rfl

end SystemsLean.ElabMeet
