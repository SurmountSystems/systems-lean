/-
  SYSTEMS_LEAN_HOST partial -- twenty-first HostImportGraphSeeds named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Twenty-first wrappers live in
  ElabMeetNamedWalkHostImportGraphSeeds. Shared helpers stay in
  ElabMeetNamedWalk. Do not put this probe back on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, ElabMeetNamedWalkHostTerm,
  ElabMeetNamedWalkHostPackageWrite, or ElabMeetNamedHostPackageRootsProbe.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostImportGraphSeeds subset (twenty-one named members):
    prior twenty plus SystemsLean.HostImportGraphSeeds last.
    Membership list is barrel order among the twenty-one; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the twentieth compile order, then HostImportGraphSeeds last.
    IrGraph and HostCompose are compile dependencies only.
    Twenty-one-name walker is a wrapper in
    ElabMeetNamedWalkHostImportGraphSeeds.
    Twenty-first HostImportGraphSeeds probe lives here.
  - tryCompileNamedHostImportGraphSeedsSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Twenty-one-name HostImportGraphSeeds bad writes a temp
    HostImportGraphSeeds copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior twenty-module walker
    tryCompileNamedHostPackageRootsSubset, and that this walk
    is not an alias of the twentieth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostImportGraphSeeds.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostImportGraphSeedsPath,
  namedClosedHostImportGraphSeedsSubsetNames,
  namedClosedHostImportGraphSeedsCompileOrder,
  barrelListsNamedHostImportGraphSeedsSubset,
  tryCompileNamedHostImportGraphSeedsSubset,
  tryCompileAfterHostImportGraphSeedsDeps,
  elabMeetDrivesNamedHostImportGraphSeedsSubset,
  elabMeetAcceptsGoodNamedHostImportGraphSeedsSubset,
  elabMeetRejectsBadNamedHostImportGraphSeedsSubset,
  elabMeetRejectsOldWalkAsNamedHostImportGraphSeedsSubset,
  #elabMeetNamedHostImportGraphSeedsSubsetProbe,
  elabMeetNamedHostImportGraphSeedsSubsetProbe,
  SystemsLean.HostImportGraphSeeds,
  ElabMeetNamedHostImportGraphSeedsProbe,
  SystemsLean.ElabMeetNamedHostImportGraphSeedsProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostImportGraphSeedsProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostImportGraphSeedsProbe;
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

/-- Record accept / reject for the HostImportGraphSeeds named subset.
    Good compiles live Mult through HostPackageRoots plus the
    subset-emit compile closure and HostImportGraphSeeds after
    reading the real lakefile. Bad compiles a temp
    HostImportGraphSeeds copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior twenty-module walker
    tryCompileNamedHostPackageRootsSubset still works; this
    walker is not an alias of the twentieth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostImportGraphSeeds.lean. -/
elab "#elabMeetNamedHostImportGraphSeedsSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostImportGraphSeeds? <- liftIO findLiveHostImportGraphSeedsPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostImportGraphSeedsSubset liveLake oleanDir
  let badCompiled <-
    match liveHostImportGraphSeeds? with
    | none =>
      pure true
    | some liveHostImportGraphSeeds => do
      let liveText <- liftIO (IO.FS.readFile liveHostImportGraphSeeds)
      let badPath :=
        badDir / "ElabMeetNamedHostImportGraphSeedsSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostImportGraphSeedsDeps
        badPath badDir `ElabMeetNamedHostImportGraphSeedsSubsetBad
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
      tryCompileNamedHostPackageRootsSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostImportGraphSeedsSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostImportGraphSeedsSubset fakeLake fakeDir
  let notAliasOfTwentieth :=
    namedClosedHostImportGraphSeedsSubsetNames
      != namedClosedHostPackageRootsSubsetNames
      && namedClosedHostImportGraphSeedsCompileOrder
           != namedClosedHostPackageRootsCompileOrder
      && namedClosedHostImportGraphSeedsSubsetNames.contains
           "SystemsLean.HostImportGraphSeeds"
      && !namedClosedHostPackageRootsSubsetNames.contains
           "SystemsLean.HostImportGraphSeeds"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfTwentieth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostImportGraphSeedsSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostImportGraphSeedsSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostImportGraphSeedsSubset
  let dN := mkIdent `elabMeetDrivesNamedHostImportGraphSeedsSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostImportGraphSeedsSubsetProbe

example : elabMeetAcceptsGoodNamedHostImportGraphSeedsSubset = true := rfl
example : elabMeetRejectsBadNamedHostImportGraphSeedsSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostImportGraphSeedsSubset = true := rfl
example : elabMeetDrivesNamedHostImportGraphSeedsSubset = true := rfl

/-- Drive fold for the HostImportGraphSeeds closed subset. Greppable: elabMeetDrivesNamedHostImportGraphSeedsSubset. -/
theorem elabMeetDrivesNamedHostImportGraphSeedsSubset_true :
    elabMeetDrivesNamedHostImportGraphSeedsSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostImportGraphSeedsSubset_true :
    elabMeetAcceptsGoodNamedHostImportGraphSeedsSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostImportGraphSeedsSubset_true :
    elabMeetRejectsBadNamedHostImportGraphSeedsSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostImportGraphSeedsSubset_true :
    elabMeetRejectsOldWalkAsNamedHostImportGraphSeedsSubset = true := by
  native_decide

end SystemsLean.ElabMeet
