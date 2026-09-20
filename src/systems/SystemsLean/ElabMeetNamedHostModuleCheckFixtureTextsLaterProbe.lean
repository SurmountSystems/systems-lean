/-
  SYSTEMS_LEAN_HOST partial -- thirty-third HostModuleCheckFixtureTextsLater named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Thirty-third wrappers live in
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
  ElabMeetNamedHostModuleCheckFixtureTextsSelfHostProbe, or
  ElabMeetNamedWalkHostImportGraphWalkLater.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostModuleCheckFixtureTextsLater subset (thirty-three named members):
    prior thirty-two plus SystemsLean.HostModuleCheckFixtureTextsLater last.
    Membership list is barrel order among the thirty-three; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the thirty-second compile order, then HostModuleCheckFixtureTextsLater last.
    IrGraph and HostCompose are compile dependencies only.
    Thirty-three-name walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckFixtureTexts.
    Thirty-third HostModuleCheckFixtureTextsLater probe lives here.
  - tryCompileNamedHostModuleCheckFixtureTextsLaterSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Thirty-three-name HostModuleCheckFixtureTextsLater bad writes a temp
    HostModuleCheckFixtureTextsLater copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater / HostModuleCheckFixtureTexts /
    HostModuleCheckFixtureTextsProduct oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior thirty-two-module walker
    tryCompileNamedHostModuleCheckFixtureTextsProductSubset, and that this walk
    is not an alias of the thirty-second. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckFixtureTextsLater.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckFixtureTextsLaterPath,
  namedClosedHostModuleCheckFixtureTextsLaterSubsetNames,
  namedClosedHostModuleCheckFixtureTextsLaterCompileOrder,
  barrelListsNamedHostModuleCheckFixtureTextsLaterSubset,
  tryCompileNamedHostModuleCheckFixtureTextsLaterSubset,
  tryCompileAfterHostModuleCheckFixtureTextsLaterDeps,
  elabMeetDrivesNamedHostModuleCheckFixtureTextsLaterSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsLaterSubset,
  elabMeetRejectsBadNamedHostModuleCheckFixtureTextsLaterSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsLaterSubset,
  #elabMeetNamedHostModuleCheckFixtureTextsLaterSubsetProbe,
  elabMeetNamedHostModuleCheckFixtureTextsLaterSubsetProbe,
  SystemsLean.HostModuleCheckFixtureTextsLater,
  ElabMeetNamedHostModuleCheckFixtureTextsLaterProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsLaterProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsLaterProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsLaterProbe;
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

/-- Record accept / reject for the HostModuleCheckFixtureTextsLater named subset.
    Good compiles live Mult through HostModuleCheckFixtureTextsProduct plus the
    subset-emit compile closure and HostModuleCheckFixtureTextsLater after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckFixtureTextsLater copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater / HostModuleCheckFixtureTexts /
    HostModuleCheckFixtureTextsProduct oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior thirty-two-module walker
    tryCompileNamedHostModuleCheckFixtureTextsProductSubset still works; this
    walker is not an alias of the thirty-second. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckFixtureTextsLater.lean. -/
def elabMeetRunNamedHostModuleCheckFixtureTextsLaterSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckFixtureTextsLater? <-
    liftIO findLiveHostModuleCheckFixtureTextsLaterPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckFixtureTextsLaterSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckFixtureTextsLater? with
    | none =>
      pure true
    | some liveHostModuleCheckFixtureTextsLater => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckFixtureTextsLater)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckFixtureTextsLaterSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckFixtureTextsLaterDeps
        badPath badDir `ElabMeetNamedHostModuleCheckFixtureTextsLaterSubsetBad
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
      tryCompileNamedHostModuleCheckFixtureTextsProductSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckFixtureTextsLaterSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckFixtureTextsLaterSubset fakeLake fakeDir
  let notAliasOfThirtySecond :=
    namedClosedHostModuleCheckFixtureTextsLaterSubsetNames
      != namedClosedHostModuleCheckFixtureTextsProductSubsetNames
      && namedClosedHostModuleCheckFixtureTextsLaterCompileOrder
           != namedClosedHostModuleCheckFixtureTextsProductCompileOrder
      && namedClosedHostModuleCheckFixtureTextsLaterSubsetNames.contains
           "SystemsLean.HostModuleCheckFixtureTextsLater"
      && !namedClosedHostModuleCheckFixtureTextsProductSubsetNames.contains
           "SystemsLean.HostModuleCheckFixtureTextsLater"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfThirtySecond
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsLaterSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckFixtureTextsLaterSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsLaterSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckFixtureTextsLaterSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostModuleCheckFixtureTextsLaterSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsLaterSubset
      `elabMeetRejectsBadNamedHostModuleCheckFixtureTextsLaterSubset
      `elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsLaterSubset
      `elabMeetDrivesNamedHostModuleCheckFixtureTextsLaterSubset
  else
    elabMeetRunNamedHostModuleCheckFixtureTextsLaterSubsetProbe

#elabMeetNamedHostModuleCheckFixtureTextsLaterSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsLaterSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckFixtureTextsLaterSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsLaterSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckFixtureTextsLaterSubset = true := rfl

/-- Drive fold for the HostModuleCheckFixtureTextsLater closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckFixtureTextsLaterSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckFixtureTextsLaterSubset_true :
    elabMeetDrivesNamedHostModuleCheckFixtureTextsLaterSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsLaterSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsLaterSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostModuleCheckFixtureTextsLaterSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckFixtureTextsLaterSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsLaterSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsLaterSubset = true := by
  native_decide

end SystemsLean.ElabMeet
