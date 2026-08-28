/-
  SYSTEMS_LEAN_HOST partial -- sixteenth HostGraph named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Sixteenth wrappers live in
  ElabMeetNamedWalkHostTerm. Shared helpers stay in ElabMeetNamedWalk.
  Do not put this probe back on ElabMeetSubset, Tail, Later,
  ElabMeetCompile, ElabMeetNamedHostCheckProbe, or
  ElabMeetNamedHostFrontTheoremsProbe.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostGraph closed subset (import-closed):
    prior fifteen plus SystemsLean.HostGraph last.
    Membership list is barrel order among the sixteen; skip
    Linear, skip IrGraph. Compile order is the prior fifteen
    compile order then HostGraph last.
    HostGraph imports HostFront and HostTerm.
    Sixteen-module walker is a wrapper in
    ElabMeetNamedWalkHostTerm.
    Sixteenth HostGraph probe lives here.
  - tryCompileNamedHostGraphSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Sixteen-module HostGraph bad writes a temp
    HostGraph copy and compiles it after Mult, HostTerm,
    HostFrontGoldens, and HostFront oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior fifteen-module walker
    tryCompileNamedHostCheckSubset, and that this walk is not
    an alias of the fifteenth. Linear skipped. IrGraph skipped.
    Do not plant live HostGraph.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostGraphPath,
  namedClosedHostGraphSubsetNames,
  namedClosedHostGraphCompileOrder,
  barrelListsNamedHostGraphSubset,
  tryCompileNamedHostGraphSubset,
  tryCompileAfterHostGraphDeps,
  elabMeetDrivesNamedHostGraphSubset,
  elabMeetAcceptsGoodNamedHostGraphSubset,
  elabMeetRejectsBadNamedHostGraphSubset,
  elabMeetRejectsOldWalkAsNamedHostGraphSubset,
  #elabMeetNamedHostGraphSubsetProbe,
  elabMeetNamedHostGraphSubsetProbe,
  SystemsLean.HostGraph,
  ElabMeetNamedHostGraphProbe,
  SystemsLean.ElabMeetNamedHostGraphProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostGraphProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostGraphProbe;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHost. Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetLive
import SystemsLean.ElabMeetNamedWalk
import SystemsLean.ElabMeetNamedWalkHostTerm

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostGraph closed subset.
    Good compiles live Mult, Types, MultTheorems, TypesTheorems,
    Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram,
    IrProgramTheorems, HostTerm, HostFrontGoldens, HostFront,
    HostFrontTheorems, HostCheck, and HostGraph after reading the
    real lakefile. Bad compiles a temp HostGraph copy with a planted
    type error after Mult, HostTerm, HostFrontGoldens, and
    HostFront oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior fifteen-module walker
    tryCompileNamedHostCheckSubset still works; this walker is not
    an alias of the fifteenth. Drive is good && !bad && isolation.
    Linear skipped. IrGraph skipped. Do not plant live
    HostGraph.lean. -/
elab "#elabMeetNamedHostGraphSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostGraph? <- liftIO findLiveHostGraphPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostGraphSubset liveLake oleanDir
  let badCompiled <-
    match liveHostGraph? with
    | none =>
      pure true
    | some liveHostGraph => do
      let liveText <- liftIO (IO.FS.readFile liveHostGraph)
      let badPath :=
        badDir / "ElabMeetNamedHostGraphSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostGraphDeps
        badPath badDir `ElabMeetNamedHostGraphSubsetBad
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
      tryCompileNamedHostCheckSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostGraphSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostGraphSubset fakeLake fakeDir
  let notAliasOfFifteenth :=
    namedClosedHostGraphSubsetNames
      != namedClosedHostCheckSubsetNames
      && namedClosedHostGraphCompileOrder
           != namedClosedHostCheckCompileOrder
      && namedClosedHostGraphSubsetNames.contains
           "SystemsLean.HostGraph"
      && !namedClosedHostCheckSubsetNames.contains
           "SystemsLean.HostGraph"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfFifteenth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostGraphSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostGraphSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostGraphSubset
  let dN := mkIdent `elabMeetDrivesNamedHostGraphSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostGraphSubsetProbe

example : elabMeetAcceptsGoodNamedHostGraphSubset = true := rfl
example : elabMeetRejectsBadNamedHostGraphSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostGraphSubset = true := rfl
example : elabMeetDrivesNamedHostGraphSubset = true := rfl

/-- Drive fold for the HostGraph closed subset. Greppable: elabMeetDrivesNamedHostGraphSubset. -/
theorem elabMeetDrivesNamedHostGraphSubset_true :
    elabMeetDrivesNamedHostGraphSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostGraphSubset_true :
    elabMeetAcceptsGoodNamedHostGraphSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostGraphSubset_true :
    elabMeetRejectsBadNamedHostGraphSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostGraphSubset_true :
    elabMeetRejectsOldWalkAsNamedHostGraphSubset = true := by
  native_decide

end SystemsLean.ElabMeet
