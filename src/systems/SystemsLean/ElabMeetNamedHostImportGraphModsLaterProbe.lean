/-
  SYSTEMS_LEAN_HOST partial -- twenty-fourth HostImportGraphModsLater named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Twenty-fourth wrappers live in
  ElabMeetNamedWalkHostImportGraphSeeds. Shared helpers stay in
  ElabMeetNamedWalk. Do not put this probe back on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, ElabMeetNamedWalkHostTerm,
  ElabMeetNamedWalkHostPackageWrite, ElabMeetNamedHostPackageRootsProbe,
  ElabMeetNamedHostImportGraphSeedsProbe, ElabMeetNamedHostImportGraphModelProbe,
  or ElabMeetNamedHostImportGraphModsProbe.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostImportGraphModsLater subset (twenty-four named members):
    prior twenty-three plus SystemsLean.HostImportGraphModsLater last.
    Membership list is barrel order among the twenty-four; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the twenty-third compile order, then HostImportGraphModsLater last.
    IrGraph and HostCompose are compile dependencies only.
    Twenty-four-name walker is a wrapper in
    ElabMeetNamedWalkHostImportGraphSeeds.
    Twenty-fourth HostImportGraphModsLater probe lives here.
  - tryCompileNamedHostImportGraphModsLaterSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Twenty-four-name HostImportGraphModsLater bad writes a temp
    HostImportGraphModsLater copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior twenty-three-module walker
    tryCompileNamedHostImportGraphModsSubset, and that this walk
    is not an alias of the twenty-third. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostImportGraphModsLater.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostImportGraphModsLaterPath,
  namedClosedHostImportGraphModsLaterSubsetNames,
  namedClosedHostImportGraphModsLaterCompileOrder,
  barrelListsNamedHostImportGraphModsLaterSubset,
  tryCompileNamedHostImportGraphModsLaterSubset,
  tryCompileAfterHostImportGraphModsLaterDeps,
  elabMeetDrivesNamedHostImportGraphModsLaterSubset,
  elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset,
  elabMeetRejectsBadNamedHostImportGraphModsLaterSubset,
  elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset,
  #elabMeetNamedHostImportGraphModsLaterSubsetProbe,
  elabMeetNamedHostImportGraphModsLaterSubsetProbe,
  SystemsLean.HostImportGraphModsLater,
  ElabMeetNamedHostImportGraphModsLaterProbe,
  SystemsLean.ElabMeetNamedHostImportGraphModsLaterProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostImportGraphModsLaterProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostImportGraphModsLaterProbe;
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

/-- Record accept / reject for the HostImportGraphModsLater named subset.
    Good compiles live Mult through HostImportGraphMods plus the
    subset-emit compile closure and HostImportGraphModsLater after
    reading the real lakefile. Bad compiles a temp
    HostImportGraphModsLater copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior twenty-three-module walker
    tryCompileNamedHostImportGraphModsSubset still works; this
    walker is not an alias of the twenty-third. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostImportGraphModsLater.lean. -/
elab "#elabMeetNamedHostImportGraphModsLaterSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostImportGraphModsLater? <- liftIO findLiveHostImportGraphModsLaterPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostImportGraphModsLaterSubset liveLake oleanDir
  let badCompiled <-
    match liveHostImportGraphModsLater? with
    | none =>
      pure true
    | some liveHostImportGraphModsLater => do
      let liveText <- liftIO (IO.FS.readFile liveHostImportGraphModsLater)
      let badPath :=
        badDir / "ElabMeetNamedHostImportGraphModsLaterSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostImportGraphModsLaterDeps
        badPath badDir `ElabMeetNamedHostImportGraphModsLaterSubsetBad
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
      tryCompileNamedHostImportGraphModsSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostImportGraphModsLaterSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostImportGraphModsLaterSubset fakeLake fakeDir
  let notAliasOfTwentyThird :=
    namedClosedHostImportGraphModsLaterSubsetNames
      != namedClosedHostImportGraphModsSubsetNames
      && namedClosedHostImportGraphModsLaterCompileOrder
           != namedClosedHostImportGraphModsCompileOrder
      && namedClosedHostImportGraphModsLaterSubsetNames.contains
           "SystemsLean.HostImportGraphModsLater"
      && !namedClosedHostImportGraphModsSubsetNames.contains
           "SystemsLean.HostImportGraphModsLater"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfTwentyThird
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostImportGraphModsLaterSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset
  let dN := mkIdent `elabMeetDrivesNamedHostImportGraphModsLaterSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostImportGraphModsLaterSubsetProbe

example : elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset = true := rfl
example : elabMeetRejectsBadNamedHostImportGraphModsLaterSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset = true := rfl
example : elabMeetDrivesNamedHostImportGraphModsLaterSubset = true := rfl

/-- Drive fold for the HostImportGraphModsLater closed subset. Greppable: elabMeetDrivesNamedHostImportGraphModsLaterSubset. -/
theorem elabMeetDrivesNamedHostImportGraphModsLaterSubset_true :
    elabMeetDrivesNamedHostImportGraphModsLaterSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset_true :
    elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostImportGraphModsLaterSubset_true :
    elabMeetRejectsBadNamedHostImportGraphModsLaterSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset_true :
    elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset = true := by
  native_decide

end SystemsLean.ElabMeet
