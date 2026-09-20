/-
  SYSTEMS_LEAN_HOST partial -- fortieth HostModuleCheckRealModule named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Fortieth wrappers live in
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
  ElabMeetNamedHostModuleCheckCheckersLaterProbe,
  ElabMeetNamedWalkHostImportGraphWalkLater, or
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostModuleCheckRealModule subset (forty named members):
    prior thirty-nine plus SystemsLean.HostModuleCheckRealModule last.
    Membership list is barrel order among the forty; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the thirty-ninth compile order, then HostModuleCheckRealModule last.
    IrGraph and HostCompose are compile dependencies only.
    Forty-name walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckCheckersLater.
    Fortieth HostModuleCheckRealModule probe lives here.
  - tryCompileNamedHostModuleCheckRealModuleSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Forty-name HostModuleCheckRealModule bad writes a temp
    HostModuleCheckRealModule copy and compiles it after Mult and the
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
    HostModuleCheckCheckersLater oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior thirty-nine-module walker
    tryCompileNamedHostModuleCheckCheckersLaterSubset, and that this walk
    is not an alias of the thirty-ninth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckRealModule.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckRealModulePath,
  namedClosedHostModuleCheckRealModuleSubsetNames,
  namedClosedHostModuleCheckRealModuleCompileOrder,
  barrelListsNamedHostModuleCheckRealModuleSubset,
  tryCompileNamedHostModuleCheckRealModuleSubset,
  tryCompileAfterHostModuleCheckRealModuleDeps,
  elabMeetDrivesNamedHostModuleCheckRealModuleSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckRealModuleSubset,
  elabMeetRejectsBadNamedHostModuleCheckRealModuleSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckRealModuleSubset,
  #elabMeetNamedHostModuleCheckRealModuleSubsetProbe,
  elabMeetNamedHostModuleCheckRealModuleSubsetProbe,
  SystemsLean.HostModuleCheckRealModule,
  ElabMeetNamedHostModuleCheckRealModuleProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckRealModuleProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckRealModuleProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckRealModuleProbe;
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

/-- Record accept / reject for the HostModuleCheckRealModule named subset.
    Good compiles live Mult through HostModuleCheckCheckersLater plus the
    subset-surface compile closure and HostModuleCheckRealModule after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckRealModule copy with a planted type error after Mult
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
    HostModuleCheckCheckersLater oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior thirty-nine-module walker
    tryCompileNamedHostModuleCheckCheckersLaterSubset still works; this
    walker is not an alias of the thirty-ninth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckRealModule.lean. -/
def elabMeetRunNamedHostModuleCheckRealModuleSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckRealModule? <-
    liftIO findLiveHostModuleCheckRealModulePath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckRealModuleSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckRealModule? with
    | none =>
      pure true
    | some liveHostModuleCheckRealModule => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckRealModule)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckRealModuleSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckRealModuleDeps
        badPath badDir `ElabMeetNamedHostModuleCheckRealModuleSubsetBad
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
      tryCompileNamedHostModuleCheckCheckersLaterSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckRealModuleSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckRealModuleSubset fakeLake fakeDir
  let notAliasOfThirtyNinth :=
    namedClosedHostModuleCheckRealModuleSubsetNames
      != namedClosedHostModuleCheckCheckersLaterSubsetNames
      && namedClosedHostModuleCheckRealModuleCompileOrder
           != namedClosedHostModuleCheckCheckersLaterCompileOrder
      && namedClosedHostModuleCheckRealModuleSubsetNames.contains
           "SystemsLean.HostModuleCheckRealModule"
      && !namedClosedHostModuleCheckCheckersLaterSubsetNames.contains
           "SystemsLean.HostModuleCheckRealModule"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfThirtyNinth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckRealModuleSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckRealModuleSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckRealModuleSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckRealModuleSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostModuleCheckRealModuleSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostModuleCheckRealModuleSubset
      `elabMeetRejectsBadNamedHostModuleCheckRealModuleSubset
      `elabMeetRejectsOldWalkAsNamedHostModuleCheckRealModuleSubset
      `elabMeetDrivesNamedHostModuleCheckRealModuleSubset
  else
    elabMeetRunNamedHostModuleCheckRealModuleSubsetProbe

#elabMeetNamedHostModuleCheckRealModuleSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckRealModuleSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckRealModuleSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckRealModuleSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckRealModuleSubset = true := rfl

end SystemsLean.ElabMeet
