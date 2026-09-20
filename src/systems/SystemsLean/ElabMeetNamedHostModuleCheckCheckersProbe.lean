/-
  SYSTEMS_LEAN_HOST partial -- thirty-eighth HostModuleCheckCheckers named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Thirty-eighth wrappers live in
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
  ElabMeetNamedHostModuleCheckFixturesProbe,
  ElabMeetNamedHostModuleCheckSurfaceProbe, or
  ElabMeetNamedWalkHostImportGraphWalkLater.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostModuleCheckCheckers subset (thirty-eight named members):
    prior thirty-seven plus SystemsLean.HostModuleCheckCheckers last.
    Membership list is barrel order among the thirty-eight; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the thirty-seventh compile order, then HostModuleCheckCheckers last.
    IrGraph and HostCompose are compile dependencies only.
    Thirty-eight-name walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit.
    Thirty-eighth HostModuleCheckCheckers probe lives here.
  - tryCompileNamedHostModuleCheckCheckersSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Thirty-eight-name HostModuleCheckCheckers bad writes a temp
    HostModuleCheckCheckers copy and compiles it after Mult and the
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
    HostModuleCheckSurface oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior thirty-seven-module walker
    tryCompileNamedHostModuleCheckSurfaceSubset, and that this walk
    is not an alias of the thirty-seventh. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckCheckers.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckCheckersPath,
  namedClosedHostModuleCheckCheckersSubsetNames,
  namedClosedHostModuleCheckCheckersCompileOrder,
  barrelListsNamedHostModuleCheckCheckersSubset,
  tryCompileNamedHostModuleCheckCheckersSubset,
  tryCompileAfterHostModuleCheckCheckersDeps,
  elabMeetDrivesNamedHostModuleCheckCheckersSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckCheckersSubset,
  elabMeetRejectsBadNamedHostModuleCheckCheckersSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersSubset,
  #elabMeetNamedHostModuleCheckCheckersSubsetProbe,
  elabMeetNamedHostModuleCheckCheckersSubsetProbe,
  SystemsLean.HostModuleCheckCheckers,
  ElabMeetNamedHostModuleCheckCheckersProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckCheckersProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckCheckersProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckCheckersProbe;
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

/-- Record accept / reject for the HostModuleCheckCheckers named subset.
    Good compiles live Mult through HostModuleCheckSurface plus the
    subset-surface compile closure and HostModuleCheckCheckers after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckCheckers copy with a planted type error after Mult
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
    HostModuleCheckSurface oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior thirty-seven-module walker
    tryCompileNamedHostModuleCheckSurfaceSubset still works; this
    walker is not an alias of the thirty-seventh. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckCheckers.lean. -/
def elabMeetRunNamedHostModuleCheckCheckersSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckCheckers? <-
    liftIO findLiveHostModuleCheckCheckersPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckCheckersSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckCheckers? with
    | none =>
      pure true
    | some liveHostModuleCheckCheckers => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckCheckers)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckCheckersSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckCheckersDeps
        badPath badDir `ElabMeetNamedHostModuleCheckCheckersSubsetBad
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
      tryCompileNamedHostModuleCheckSurfaceSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckCheckersSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckCheckersSubset fakeLake fakeDir
  let notAliasOfThirtySeventh :=
    namedClosedHostModuleCheckCheckersSubsetNames
      != namedClosedHostModuleCheckSurfaceSubsetNames
      && namedClosedHostModuleCheckCheckersCompileOrder
           != namedClosedHostModuleCheckSurfaceCompileOrder
      && namedClosedHostModuleCheckCheckersSubsetNames.contains
           "SystemsLean.HostModuleCheckCheckers"
      && !namedClosedHostModuleCheckSurfaceSubsetNames.contains
           "SystemsLean.HostModuleCheckCheckers"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfThirtySeventh
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckCheckersSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckCheckersSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckCheckersSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostModuleCheckCheckersSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostModuleCheckCheckersSubset
      `elabMeetRejectsBadNamedHostModuleCheckCheckersSubset
      `elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersSubset
      `elabMeetDrivesNamedHostModuleCheckCheckersSubset
  else
    elabMeetRunNamedHostModuleCheckCheckersSubsetProbe

#elabMeetNamedHostModuleCheckCheckersSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckCheckersSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckCheckersSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckCheckersSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckCheckersSubset = true := rfl

end SystemsLean.ElabMeet
