/-
  SYSTEMS_LEAN_HOST partial -- twentieth HostPackageRoots named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Twentieth wrappers live in
  ElabMeetNamedWalkHostPackageWrite. Shared helpers stay in
  ElabMeetNamedWalk. Do not put this probe back on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, ElabMeetNamedWalkHostTerm,
  ElabMeetNamedHostPackageWriteTheoremsProbe,
  ElabMeetNamedHostPackageWriteProbe, ElabMeetNamedHostGraphTheoremsProbe,
  ElabMeetNamedHostGraphProbe, ElabMeetNamedHostCheckProbe, or
  ElabMeetNamedHostFrontTheoremsProbe.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostPackageRoots subset (twenty named members):
    prior nineteen plus SystemsLean.HostPackageRoots last.
    Membership list is barrel order among the twenty; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the nineteenth compile order, then HostPackageRoots last.
    IrGraph and HostCompose are compile dependencies only.
    Twenty-name walker is a wrapper in
    ElabMeetNamedWalkHostPackageWrite.
    Twentieth HostPackageRoots probe lives here.
  - tryCompileNamedHostPackageRootsSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Twenty-name HostPackageRoots bad writes a temp
    HostPackageRoots copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior nineteen-module walker
    tryCompileNamedHostPackageWriteTheoremsSubset, and that this walk
    is not an alias of the nineteenth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostPackageRoots.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostPackageRootsPath,
  namedClosedHostPackageRootsSubsetNames,
  namedClosedHostPackageRootsCompileOrder,
  barrelListsNamedHostPackageRootsSubset,
  tryCompileNamedHostPackageRootsSubset,
  tryCompileAfterHostPackageRootsDeps,
  elabMeetDrivesNamedHostPackageRootsSubset,
  elabMeetAcceptsGoodNamedHostPackageRootsSubset,
  elabMeetRejectsBadNamedHostPackageRootsSubset,
  elabMeetRejectsOldWalkAsNamedHostPackageRootsSubset,
  #elabMeetNamedHostPackageRootsSubsetProbe,
  elabMeetNamedHostPackageRootsSubsetProbe,
  SystemsLean.HostPackageRoots,
  ElabMeetNamedHostPackageRootsProbe,
  SystemsLean.ElabMeetNamedHostPackageRootsProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostPackageRootsProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostPackageRootsProbe;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostPackageRoots named subset.
    Good compiles live Mult through HostPackageWriteTheorems plus the
    subset-emit compile closure and HostPackageRoots after
    reading the real lakefile. Bad compiles a temp
    HostPackageRoots copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior nineteen-module walker
    tryCompileNamedHostPackageWriteTheoremsSubset still works; this
    walker is not an alias of the nineteenth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostPackageRoots.lean. -/
elab "#elabMeetNamedHostPackageRootsSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostPackageRoots? <- liftIO findLiveHostPackageRootsPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostPackageRootsSubset liveLake oleanDir
  let badCompiled <-
    match liveHostPackageRoots? with
    | none =>
      pure true
    | some liveHostPackageRoots => do
      let liveText <- liftIO (IO.FS.readFile liveHostPackageRoots)
      let badPath :=
        badDir / "ElabMeetNamedHostPackageRootsSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostPackageRootsDeps
        badPath badDir `ElabMeetNamedHostPackageRootsSubsetBad
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
      tryCompileNamedHostPackageWriteTheoremsSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostPackageRootsSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostPackageRootsSubset fakeLake fakeDir
  let notAliasOfNineteenth :=
    namedClosedHostPackageRootsSubsetNames
      != namedClosedHostPackageWriteTheoremsSubsetNames
      && namedClosedHostPackageRootsCompileOrder
           != namedClosedHostPackageWriteTheoremsCompileOrder
      && namedClosedHostPackageRootsSubsetNames.contains
           "SystemsLean.HostPackageRoots"
      && !namedClosedHostPackageWriteTheoremsSubsetNames.contains
           "SystemsLean.HostPackageRoots"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfNineteenth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostPackageRootsSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostPackageRootsSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostPackageRootsSubset
  let dN := mkIdent `elabMeetDrivesNamedHostPackageRootsSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostPackageRootsSubsetProbe

example : elabMeetAcceptsGoodNamedHostPackageRootsSubset = true := rfl
example : elabMeetRejectsBadNamedHostPackageRootsSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostPackageRootsSubset = true := rfl
example : elabMeetDrivesNamedHostPackageRootsSubset = true := rfl

/-- Drive fold for the HostPackageRoots closed subset. Greppable: elabMeetDrivesNamedHostPackageRootsSubset. -/
theorem elabMeetDrivesNamedHostPackageRootsSubset_true :
    elabMeetDrivesNamedHostPackageRootsSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostPackageRootsSubset_true :
    elabMeetAcceptsGoodNamedHostPackageRootsSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostPackageRootsSubset_true :
    elabMeetRejectsBadNamedHostPackageRootsSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostPackageRootsSubset_true :
    elabMeetRejectsOldWalkAsNamedHostPackageRootsSubset = true := by
  native_decide

end SystemsLean.ElabMeet
