/-
  SYSTEMS_LEAN_HOST partial -- eighteenth HostPackageWrite named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Eighteenth wrappers live in
  ElabMeetNamedWalkHostPackageWrite. Shared helpers stay in
  ElabMeetNamedWalk. Do not put this probe back on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, ElabMeetNamedWalkHostTerm,
  ElabMeetNamedHostGraphTheoremsProbe, ElabMeetNamedHostGraphProbe,
  ElabMeetNamedHostCheckProbe, or
  ElabMeetNamedHostFrontTheoremsProbe.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostPackageWrite subset (eighteen named members):
    prior seventeen plus SystemsLean.HostPackageWrite last.
    Membership list is barrel order among the eighteen; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the prior seventeen compile order, then the subset-emit
    / CompilePath / Emit / IrGraph / HostCompose closure, then
    HostPackageWrite last. IrGraph and HostCompose are compile
    dependencies only.
    Eighteen-name walker is a wrapper in
    ElabMeetNamedWalkHostPackageWrite.
    Eighteenth HostPackageWrite probe lives here.
  - tryCompileNamedHostPackageWriteSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Eighteen-name HostPackageWrite bad writes a temp
    HostPackageWrite copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior seventeen-module walker
    tryCompileNamedHostGraphTheoremsSubset, and that this walk
    is not an alias of the seventeenth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostPackageWrite.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostPackageWritePath,
  namedClosedHostPackageWriteSubsetNames,
  namedClosedHostPackageWriteCompileOrder,
  barrelListsNamedHostPackageWriteSubset,
  tryCompileNamedHostPackageWriteSubset,
  tryCompileAfterHostPackageWriteDeps,
  elabMeetDrivesNamedHostPackageWriteSubset,
  elabMeetAcceptsGoodNamedHostPackageWriteSubset,
  elabMeetRejectsBadNamedHostPackageWriteSubset,
  elabMeetRejectsOldWalkAsNamedHostPackageWriteSubset,
  #elabMeetNamedHostPackageWriteSubsetProbe,
  elabMeetNamedHostPackageWriteSubsetProbe,
  SystemsLean.HostPackageWrite,
  ElabMeetNamedHostPackageWriteProbe,
  SystemsLean.ElabMeetNamedHostPackageWriteProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostPackageWriteProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostPackageWriteProbe;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHost. Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetLive
import SystemsLean.ElabMeetNamedWalk
import SystemsLean.ElabMeetNamedWalkHostGraphTheorems
import SystemsLean.ElabMeetNamedWalkHostPackageWrite

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostPackageWrite named subset.
    Good compiles live Mult through HostGraphTheorems plus the
    subset-emit compile closure and HostPackageWrite after
    reading the real lakefile. Bad compiles a temp
    HostPackageWrite copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior seventeen-module walker
    tryCompileNamedHostGraphTheoremsSubset still works; this
    walker is not an alias of the seventeenth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostPackageWrite.lean. -/
def elabMeetRunNamedHostPackageWriteSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostPackageWrite? <- liftIO findLiveHostPackageWritePath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostPackageWriteSubset liveLake oleanDir
  let badCompiled <-
    match liveHostPackageWrite? with
    | none =>
      pure true
    | some liveHostPackageWrite => do
      let liveText <- liftIO (IO.FS.readFile liveHostPackageWrite)
      let badPath :=
        badDir / "ElabMeetNamedHostPackageWriteSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostPackageWriteDeps
        badPath badDir `ElabMeetNamedHostPackageWriteSubsetBad
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
      tryCompileNamedHostGraphTheoremsSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostPackageWriteSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostPackageWriteSubset fakeLake fakeDir
  let notAliasOfSeventeenth :=
    namedClosedHostPackageWriteSubsetNames
      != namedClosedHostGraphTheoremsSubsetNames
      && namedClosedHostPackageWriteCompileOrder
           != namedClosedHostGraphTheoremsCompileOrder
      && namedClosedHostPackageWriteSubsetNames.contains
           "SystemsLean.HostPackageWrite"
      && !namedClosedHostGraphTheoremsSubsetNames.contains
           "SystemsLean.HostPackageWrite"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfSeventeenth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostPackageWriteSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostPackageWriteSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostPackageWriteSubset
  let dN := mkIdent `elabMeetDrivesNamedHostPackageWriteSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostPackageWriteSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostPackageWriteSubset
      `elabMeetRejectsBadNamedHostPackageWriteSubset
      `elabMeetRejectsOldWalkAsNamedHostPackageWriteSubset
      `elabMeetDrivesNamedHostPackageWriteSubset
  else
    elabMeetRunNamedHostPackageWriteSubsetProbe

#elabMeetNamedHostPackageWriteSubsetProbe

example : elabMeetAcceptsGoodNamedHostPackageWriteSubset = true := rfl
example : elabMeetRejectsBadNamedHostPackageWriteSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostPackageWriteSubset = true := rfl
example : elabMeetDrivesNamedHostPackageWriteSubset = true := rfl

/-- Drive fold for the HostPackageWrite closed subset. Greppable: elabMeetDrivesNamedHostPackageWriteSubset. -/
theorem elabMeetDrivesNamedHostPackageWriteSubset_true :
    elabMeetDrivesNamedHostPackageWriteSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostPackageWriteSubset_true :
    elabMeetAcceptsGoodNamedHostPackageWriteSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostPackageWriteSubset_true :
    elabMeetRejectsBadNamedHostPackageWriteSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostPackageWriteSubset_true :
    elabMeetRejectsOldWalkAsNamedHostPackageWriteSubset = true := by
  native_decide

end SystemsLean.ElabMeet
