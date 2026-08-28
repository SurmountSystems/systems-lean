/-
  SYSTEMS_LEAN_HOST partial -- twenty-second HostImportGraphModel named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Twenty-second wrappers live in
  ElabMeetNamedWalkHostImportGraphSeeds. Shared helpers stay in
  ElabMeetNamedWalk. Do not put this probe back on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, ElabMeetNamedWalkHostTerm,
  ElabMeetNamedWalkHostPackageWrite, ElabMeetNamedHostPackageRootsProbe,
  or ElabMeetNamedHostImportGraphSeedsProbe.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostImportGraphModel subset (twenty-two named members):
    prior twenty-one plus SystemsLean.HostImportGraphModel last.
    Membership list is barrel order among the twenty-two; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the twenty-first compile order, then HostImportGraphModel last.
    IrGraph and HostCompose are compile dependencies only.
    Twenty-two-name walker is a wrapper in
    ElabMeetNamedWalkHostImportGraphSeeds.
    Twenty-second HostImportGraphModel probe lives here.
  - tryCompileNamedHostImportGraphModelSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Twenty-two-name HostImportGraphModel bad writes a temp
    HostImportGraphModel copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior twenty-one-module walker
    tryCompileNamedHostImportGraphSeedsSubset, and that this walk
    is not an alias of the twenty-first. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostImportGraphModel.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostImportGraphModelPath,
  namedClosedHostImportGraphModelSubsetNames,
  namedClosedHostImportGraphModelCompileOrder,
  barrelListsNamedHostImportGraphModelSubset,
  tryCompileNamedHostImportGraphModelSubset,
  tryCompileAfterHostImportGraphModelDeps,
  elabMeetDrivesNamedHostImportGraphModelSubset,
  elabMeetAcceptsGoodNamedHostImportGraphModelSubset,
  elabMeetRejectsBadNamedHostImportGraphModelSubset,
  elabMeetRejectsOldWalkAsNamedHostImportGraphModelSubset,
  #elabMeetNamedHostImportGraphModelSubsetProbe,
  elabMeetNamedHostImportGraphModelSubsetProbe,
  SystemsLean.HostImportGraphModel,
  ElabMeetNamedHostImportGraphModelProbe,
  SystemsLean.ElabMeetNamedHostImportGraphModelProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostImportGraphModelProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostImportGraphModelProbe;
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

/-- Record accept / reject for the HostImportGraphModel named subset.
    Good compiles live Mult through HostImportGraphSeeds plus the
    subset-emit compile closure and HostImportGraphModel after
    reading the real lakefile. Bad compiles a temp
    HostImportGraphModel copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior twenty-one-module walker
    tryCompileNamedHostImportGraphSeedsSubset still works; this
    walker is not an alias of the twenty-first. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostImportGraphModel.lean. -/
elab "#elabMeetNamedHostImportGraphModelSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostImportGraphModel? <- liftIO findLiveHostImportGraphModelPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostImportGraphModelSubset liveLake oleanDir
  let badCompiled <-
    match liveHostImportGraphModel? with
    | none =>
      pure true
    | some liveHostImportGraphModel => do
      let liveText <- liftIO (IO.FS.readFile liveHostImportGraphModel)
      let badPath :=
        badDir / "ElabMeetNamedHostImportGraphModelSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostImportGraphModelDeps
        badPath badDir `ElabMeetNamedHostImportGraphModelSubsetBad
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
      tryCompileNamedHostImportGraphSeedsSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostImportGraphModelSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostImportGraphModelSubset fakeLake fakeDir
  let notAliasOfTwentyFirst :=
    namedClosedHostImportGraphModelSubsetNames
      != namedClosedHostImportGraphSeedsSubsetNames
      && namedClosedHostImportGraphModelCompileOrder
           != namedClosedHostImportGraphSeedsCompileOrder
      && namedClosedHostImportGraphModelSubsetNames.contains
           "SystemsLean.HostImportGraphModel"
      && !namedClosedHostImportGraphSeedsSubsetNames.contains
           "SystemsLean.HostImportGraphModel"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfTwentyFirst
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostImportGraphModelSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostImportGraphModelSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostImportGraphModelSubset
  let dN := mkIdent `elabMeetDrivesNamedHostImportGraphModelSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostImportGraphModelSubsetProbe

example : elabMeetAcceptsGoodNamedHostImportGraphModelSubset = true := rfl
example : elabMeetRejectsBadNamedHostImportGraphModelSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostImportGraphModelSubset = true := rfl
example : elabMeetDrivesNamedHostImportGraphModelSubset = true := rfl

/-- Drive fold for the HostImportGraphModel closed subset. Greppable: elabMeetDrivesNamedHostImportGraphModelSubset. -/
theorem elabMeetDrivesNamedHostImportGraphModelSubset_true :
    elabMeetDrivesNamedHostImportGraphModelSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostImportGraphModelSubset_true :
    elabMeetAcceptsGoodNamedHostImportGraphModelSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostImportGraphModelSubset_true :
    elabMeetRejectsBadNamedHostImportGraphModelSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostImportGraphModelSubset_true :
    elabMeetRejectsOldWalkAsNamedHostImportGraphModelSubset = true := by
  native_decide

end SystemsLean.ElabMeet
