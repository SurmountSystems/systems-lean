/-
  SYSTEMS_LEAN_HOST partial -- thirty-fourth HostModuleCheckFixtureTextsSelfHost named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Thirty-fourth wrappers live in
  ElabMeetNamedWalkHostModuleCheckFixtureTexts. Shared helpers stay in
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
  ElabMeetNamedHostModuleCheckFixtureTextsLaterProbe, or
  ElabMeetNamedWalkHostImportGraphWalkLater.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostModuleCheckFixtureTextsSelfHost subset (thirty-four named members):
    prior thirty-three plus SystemsLean.HostModuleCheckFixtureTextsSelfHost last.
    Membership list is barrel order among the thirty-four; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the thirty-third compile order, then HostModuleCheckFixtureTextsSelfHost last.
    IrGraph and HostCompose are compile dependencies only.
    Thirty-four-name walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckFixtureTexts.
    Thirty-fourth HostModuleCheckFixtureTextsSelfHost probe lives here.
  - tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Thirty-four-name HostModuleCheckFixtureTextsSelfHost bad writes a temp
    HostModuleCheckFixtureTextsSelfHost copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater / HostModuleCheckFixtureTexts /
    HostModuleCheckFixtureTextsProduct / HostModuleCheckFixtureTextsLater oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior thirty-three-module walker
    tryCompileNamedHostModuleCheckFixtureTextsLaterSubset, and that this walk
    is not an alias of the thirty-third. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckFixtureTextsSelfHost.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckFixtureTextsSelfHostPath,
  namedClosedHostModuleCheckFixtureTextsSelfHostSubsetNames,
  namedClosedHostModuleCheckFixtureTextsSelfHostCompileOrder,
  barrelListsNamedHostModuleCheckFixtureTextsSelfHostSubset,
  tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubset,
  tryCompileAfterHostModuleCheckFixtureTextsSelfHostDeps,
  elabMeetDrivesNamedHostModuleCheckFixtureTextsSelfHostSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSelfHostSubset,
  elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSelfHostSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSelfHostSubset,
  #elabMeetNamedHostModuleCheckFixtureTextsSelfHostSubsetProbe,
  elabMeetNamedHostModuleCheckFixtureTextsSelfHostSubsetProbe,
  SystemsLean.HostModuleCheckFixtureTextsSelfHost,
  ElabMeetNamedHostModuleCheckFixtureTextsSelfHostProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsSelfHostProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsSelfHostProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsSelfHostProbe;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckFixtureTextsSelfHost named subset.
    Good compiles live Mult through HostModuleCheckFixtureTextsLater plus the
    subset-emit compile closure and HostModuleCheckFixtureTextsSelfHost after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckFixtureTextsSelfHost copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater / HostModuleCheckFixtureTexts /
    HostModuleCheckFixtureTextsProduct / HostModuleCheckFixtureTextsLater oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior thirty-three-module walker
    tryCompileNamedHostModuleCheckFixtureTextsLaterSubset still works; this
    walker is not an alias of the thirty-third. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckFixtureTextsSelfHost.lean. -/
elab "#elabMeetNamedHostModuleCheckFixtureTextsSelfHostSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckFixtureTextsSelfHost? <-
    liftIO findLiveHostModuleCheckFixtureTextsSelfHostPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckFixtureTextsSelfHost? with
    | none =>
      pure true
    | some liveHostModuleCheckFixtureTextsSelfHost => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckFixtureTextsSelfHost)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckFixtureTextsSelfHostSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckFixtureTextsSelfHostDeps
        badPath badDir `ElabMeetNamedHostModuleCheckFixtureTextsSelfHostSubsetBad
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
      tryCompileNamedHostModuleCheckFixtureTextsLaterSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubset fakeLake fakeDir
  let notAliasOfThirtyThird :=
    namedClosedHostModuleCheckFixtureTextsSelfHostSubsetNames
      != namedClosedHostModuleCheckFixtureTextsLaterSubsetNames
      && namedClosedHostModuleCheckFixtureTextsSelfHostCompileOrder
           != namedClosedHostModuleCheckFixtureTextsLaterCompileOrder
      && namedClosedHostModuleCheckFixtureTextsSelfHostSubsetNames.contains
           "SystemsLean.HostModuleCheckFixtureTextsSelfHost"
      && !namedClosedHostModuleCheckFixtureTextsLaterSubsetNames.contains
           "SystemsLean.HostModuleCheckFixtureTextsSelfHost"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfThirtyThird
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSelfHostSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSelfHostSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSelfHostSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckFixtureTextsSelfHostSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckFixtureTextsSelfHostSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSelfHostSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSelfHostSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSelfHostSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckFixtureTextsSelfHostSubset = true := rfl

end SystemsLean.ElabMeet
