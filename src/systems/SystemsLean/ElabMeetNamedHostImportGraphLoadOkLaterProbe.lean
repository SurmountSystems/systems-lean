/-
  SYSTEMS_LEAN_HOST partial -- twenty-fifth HostImportGraphLoadOkLater named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Twenty-fifth wrappers live in
  ElabMeetNamedWalkHostImportGraphSeeds. Shared helpers stay in
  ElabMeetNamedWalk. Do not put this probe back on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, ElabMeetNamedWalkHostTerm,
  ElabMeetNamedWalkHostPackageWrite, ElabMeetNamedHostPackageRootsProbe,
  ElabMeetNamedHostImportGraphSeedsProbe, ElabMeetNamedHostImportGraphModelProbe,
  ElabMeetNamedHostImportGraphModsProbe, or
  ElabMeetNamedHostImportGraphModsLaterProbe.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostImportGraphLoadOkLater subset (twenty-five named members):
    prior twenty-four plus SystemsLean.HostImportGraphLoadOkLater last.
    Membership list is barrel order among the twenty-five; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the twenty-fourth compile order, then HostImportGraphLoadOkLater last.
    IrGraph and HostCompose are compile dependencies only.
    Twenty-five-name walker is a wrapper in
    ElabMeetNamedWalkHostImportGraphSeeds.
    Twenty-fifth HostImportGraphLoadOkLater probe lives here.
  - tryCompileNamedHostImportGraphLoadOkLaterSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Twenty-five-name HostImportGraphLoadOkLater bad writes a temp
    HostImportGraphLoadOkLater copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior twenty-four-module walker
    tryCompileNamedHostImportGraphModsLaterSubset, and that this walk
    is not an alias of the twenty-fourth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostImportGraphLoadOkLater.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostImportGraphLoadOkLaterPath,
  namedClosedHostImportGraphLoadOkLaterSubsetNames,
  namedClosedHostImportGraphLoadOkLaterCompileOrder,
  barrelListsNamedHostImportGraphLoadOkLaterSubset,
  tryCompileNamedHostImportGraphLoadOkLaterSubset,
  tryCompileAfterHostImportGraphLoadOkLaterDeps,
  elabMeetDrivesNamedHostImportGraphLoadOkLaterSubset,
  elabMeetAcceptsGoodNamedHostImportGraphLoadOkLaterSubset,
  elabMeetRejectsBadNamedHostImportGraphLoadOkLaterSubset,
  elabMeetRejectsOldWalkAsNamedHostImportGraphLoadOkLaterSubset,
  #elabMeetNamedHostImportGraphLoadOkLaterSubsetProbe,
  elabMeetNamedHostImportGraphLoadOkLaterSubsetProbe,
  SystemsLean.HostImportGraphLoadOkLater,
  ElabMeetNamedHostImportGraphLoadOkLaterProbe,
  SystemsLean.ElabMeetNamedHostImportGraphLoadOkLaterProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostImportGraphLoadOkLaterProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostImportGraphLoadOkLaterProbe;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostImportGraphLoadOkLater named subset.
    Good compiles live Mult through HostImportGraphModsLater plus the
    subset-emit compile closure and HostImportGraphLoadOkLater after
    reading the real lakefile. Bad compiles a temp
    HostImportGraphLoadOkLater copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior twenty-four-module walker
    tryCompileNamedHostImportGraphModsLaterSubset still works; this
    walker is not an alias of the twenty-fourth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostImportGraphLoadOkLater.lean. -/
elab "#elabMeetNamedHostImportGraphLoadOkLaterSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostImportGraphLoadOkLater? <- liftIO findLiveHostImportGraphLoadOkLaterPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostImportGraphLoadOkLaterSubset liveLake oleanDir
  let badCompiled <-
    match liveHostImportGraphLoadOkLater? with
    | none =>
      pure true
    | some liveHostImportGraphLoadOkLater => do
      let liveText <- liftIO (IO.FS.readFile liveHostImportGraphLoadOkLater)
      let badPath :=
        badDir / "ElabMeetNamedHostImportGraphLoadOkLaterSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostImportGraphLoadOkLaterDeps
        badPath badDir `ElabMeetNamedHostImportGraphLoadOkLaterSubsetBad
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
      tryCompileNamedHostImportGraphModsLaterSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostImportGraphLoadOkLaterSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostImportGraphLoadOkLaterSubset fakeLake fakeDir
  let notAliasOfTwentyFourth :=
    namedClosedHostImportGraphLoadOkLaterSubsetNames
      != namedClosedHostImportGraphModsLaterSubsetNames
      && namedClosedHostImportGraphLoadOkLaterCompileOrder
           != namedClosedHostImportGraphModsLaterCompileOrder
      && namedClosedHostImportGraphLoadOkLaterSubsetNames.contains
           "SystemsLean.HostImportGraphLoadOkLater"
      && !namedClosedHostImportGraphModsLaterSubsetNames.contains
           "SystemsLean.HostImportGraphLoadOkLater"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfTwentyFourth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostImportGraphLoadOkLaterSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostImportGraphLoadOkLaterSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostImportGraphLoadOkLaterSubset
  let dN := mkIdent `elabMeetDrivesNamedHostImportGraphLoadOkLaterSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostImportGraphLoadOkLaterSubsetProbe

example : elabMeetAcceptsGoodNamedHostImportGraphLoadOkLaterSubset = true := rfl
example : elabMeetRejectsBadNamedHostImportGraphLoadOkLaterSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostImportGraphLoadOkLaterSubset = true := rfl
example : elabMeetDrivesNamedHostImportGraphLoadOkLaterSubset = true := rfl

/-- Drive fold for the HostImportGraphLoadOkLater closed subset. Greppable: elabMeetDrivesNamedHostImportGraphLoadOkLaterSubset. -/
theorem elabMeetDrivesNamedHostImportGraphLoadOkLaterSubset_true :
    elabMeetDrivesNamedHostImportGraphLoadOkLaterSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostImportGraphLoadOkLaterSubset_true :
    elabMeetAcceptsGoodNamedHostImportGraphLoadOkLaterSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostImportGraphLoadOkLaterSubset_true :
    elabMeetRejectsBadNamedHostImportGraphLoadOkLaterSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostImportGraphLoadOkLaterSubset_true :
    elabMeetRejectsOldWalkAsNamedHostImportGraphLoadOkLaterSubset = true := by
  native_decide

end SystemsLean.ElabMeet
