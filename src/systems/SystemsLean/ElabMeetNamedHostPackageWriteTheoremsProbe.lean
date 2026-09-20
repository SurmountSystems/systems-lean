/-
  SYSTEMS_LEAN_HOST partial -- nineteenth HostPackageWriteTheorems named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Nineteenth wrappers live in
  ElabMeetNamedWalkHostPackageWrite. Shared helpers stay in
  ElabMeetNamedWalk. Do not put this probe back on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, ElabMeetNamedWalkHostTerm,
  ElabMeetNamedHostPackageWriteProbe, ElabMeetNamedHostGraphTheoremsProbe,
  ElabMeetNamedHostGraphProbe, ElabMeetNamedHostCheckProbe, or
  ElabMeetNamedHostFrontTheoremsProbe.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostPackageWriteTheorems subset (nineteen named members):
    prior eighteen plus SystemsLean.HostPackageWriteTheorems last.
    Membership list is barrel order among the nineteen; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the eighteenth compile order, then HostPackageWriteTheorems last.
    IrGraph and HostCompose are compile dependencies only.
    Nineteen-name walker is a wrapper in
    ElabMeetNamedWalkHostPackageWrite.
    Nineteenth HostPackageWriteTheorems probe lives here.
  - tryCompileNamedHostPackageWriteTheoremsSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Nineteen-name HostPackageWriteTheorems bad writes a temp
    HostPackageWriteTheorems copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior eighteen-module walker
    tryCompileNamedHostPackageWriteSubset, and that this walk
    is not an alias of the eighteenth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostPackageWriteTheorems.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostPackageWriteTheoremsPath,
  namedClosedHostPackageWriteTheoremsSubsetNames,
  namedClosedHostPackageWriteTheoremsCompileOrder,
  barrelListsNamedHostPackageWriteTheoremsSubset,
  tryCompileNamedHostPackageWriteTheoremsSubset,
  tryCompileAfterHostPackageWriteTheoremsDeps,
  elabMeetDrivesNamedHostPackageWriteTheoremsSubset,
  elabMeetAcceptsGoodNamedHostPackageWriteTheoremsSubset,
  elabMeetRejectsBadNamedHostPackageWriteTheoremsSubset,
  elabMeetRejectsOldWalkAsNamedHostPackageWriteTheoremsSubset,
  #elabMeetNamedHostPackageWriteTheoremsSubsetProbe,
  elabMeetNamedHostPackageWriteTheoremsSubsetProbe,
  SystemsLean.HostPackageWriteTheorems,
  ElabMeetNamedHostPackageWriteTheoremsProbe,
  SystemsLean.ElabMeetNamedHostPackageWriteTheoremsProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostPackageWriteTheoremsProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostPackageWriteTheoremsProbe;
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

/-- Record accept / reject for the HostPackageWriteTheorems named subset.
    Good compiles live Mult through HostPackageWrite plus the
    subset-emit compile closure and HostPackageWriteTheorems after
    reading the real lakefile. Bad compiles a temp
    HostPackageWriteTheorems copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior eighteen-module walker
    tryCompileNamedHostPackageWriteSubset still works; this
    walker is not an alias of the eighteenth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostPackageWriteTheorems.lean. -/
def elabMeetRunNamedHostPackageWriteTheoremsSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostPackageWriteTheorems? <- liftIO findLiveHostPackageWriteTheoremsPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostPackageWriteTheoremsSubset liveLake oleanDir
  let badCompiled <-
    match liveHostPackageWriteTheorems? with
    | none =>
      pure true
    | some liveHostPackageWriteTheorems => do
      let liveText <- liftIO (IO.FS.readFile liveHostPackageWriteTheorems)
      let badPath :=
        badDir / "ElabMeetNamedHostPackageWriteTheoremsSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostPackageWriteTheoremsDeps
        badPath badDir `ElabMeetNamedHostPackageWriteTheoremsSubsetBad
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
      tryCompileNamedHostPackageWriteSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostPackageWriteTheoremsSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostPackageWriteTheoremsSubset fakeLake fakeDir
  let notAliasOfEighteenth :=
    namedClosedHostPackageWriteTheoremsSubsetNames
      != namedClosedHostPackageWriteSubsetNames
      && namedClosedHostPackageWriteTheoremsCompileOrder
           != namedClosedHostPackageWriteCompileOrder
      && namedClosedHostPackageWriteTheoremsSubsetNames.contains
           "SystemsLean.HostPackageWriteTheorems"
      && !namedClosedHostPackageWriteSubsetNames.contains
           "SystemsLean.HostPackageWriteTheorems"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfEighteenth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostPackageWriteTheoremsSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostPackageWriteTheoremsSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostPackageWriteTheoremsSubset
  let dN := mkIdent `elabMeetDrivesNamedHostPackageWriteTheoremsSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostPackageWriteTheoremsSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostPackageWriteTheoremsSubset
      `elabMeetRejectsBadNamedHostPackageWriteTheoremsSubset
      `elabMeetRejectsOldWalkAsNamedHostPackageWriteTheoremsSubset
      `elabMeetDrivesNamedHostPackageWriteTheoremsSubset
  else
    elabMeetRunNamedHostPackageWriteTheoremsSubsetProbe

#elabMeetNamedHostPackageWriteTheoremsSubsetProbe

example : elabMeetAcceptsGoodNamedHostPackageWriteTheoremsSubset = true := rfl
example : elabMeetRejectsBadNamedHostPackageWriteTheoremsSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostPackageWriteTheoremsSubset = true := rfl
example : elabMeetDrivesNamedHostPackageWriteTheoremsSubset = true := rfl

/-- Drive fold for the HostPackageWriteTheorems closed subset. Greppable: elabMeetDrivesNamedHostPackageWriteTheoremsSubset. -/
theorem elabMeetDrivesNamedHostPackageWriteTheoremsSubset_true :
    elabMeetDrivesNamedHostPackageWriteTheoremsSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostPackageWriteTheoremsSubset_true :
    elabMeetAcceptsGoodNamedHostPackageWriteTheoremsSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostPackageWriteTheoremsSubset_true :
    elabMeetRejectsBadNamedHostPackageWriteTheoremsSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostPackageWriteTheoremsSubset_true :
    elabMeetRejectsOldWalkAsNamedHostPackageWriteTheoremsSubset = true := by
  native_decide

end SystemsLean.ElabMeet
