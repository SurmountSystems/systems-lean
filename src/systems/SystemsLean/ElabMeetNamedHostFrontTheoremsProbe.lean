/-
  SYSTEMS_LEAN_HOST partial -- fourteenth HostFrontTheorems named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Fourteenth wrappers live in
  ElabMeetNamedWalkHostTerm. Shared helpers stay in ElabMeetNamedWalk.
  Do not put this probe back on ElabMeetSubset, Tail, Later, or
  ElabMeetCompile.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostFrontTheorems closed subset (import-closed):
    prior thirteen plus SystemsLean.HostFrontTheorems last.
    Membership list is barrel order among the fourteen; skip
    Linear, skip IrGraph. Compile order is the prior thirteen
    compile order then HostFrontTheorems last.
    HostFrontTheorems imports HostFront.
    Fourteen-module walker is a wrapper in
    ElabMeetNamedWalkHostTerm.
    Fourteenth HostFrontTheorems probe lives here.
  - tryCompileNamedHostFrontTheoremsSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Fourteen-module HostFrontTheorems bad writes a temp
    HostFrontTheorems copy and compiles it after Mult, HostTerm,
    HostFrontGoldens, and HostFront oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior thirteen-module walker
    tryCompileNamedHostFrontSubset, and that this walk is not
    an alias of the thirteenth. Linear skipped. IrGraph skipped.
    Do not plant live HostFrontTheorems.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostFrontTheoremsPath,
  namedClosedHostFrontTheoremsSubsetNames,
  namedClosedHostFrontTheoremsCompileOrder,
  barrelListsNamedHostFrontTheoremsSubset,
  tryCompileNamedHostFrontTheoremsSubset,
  tryCompileAfterHostFrontTheoremsDeps,
  elabMeetDrivesNamedHostFrontTheoremsSubset,
  elabMeetAcceptsGoodNamedHostFrontTheoremsSubset,
  elabMeetRejectsBadNamedHostFrontTheoremsSubset,
  elabMeetRejectsOldWalkAsNamedHostFrontTheoremsSubset,
  #elabMeetNamedHostFrontTheoremsSubsetProbe,
  elabMeetNamedHostFrontTheoremsSubsetProbe,
  SystemsLean.HostFrontTheorems,
  ElabMeetNamedHostFrontTheoremsProbe,
  SystemsLean.ElabMeetNamedHostFrontTheoremsProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostFrontTheoremsProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostFrontTheoremsProbe;
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

/-- Record accept / reject for the HostFrontTheorems closed subset.
    Good compiles live Mult, Types, MultTheorems, TypesTheorems,
    Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram,
    IrProgramTheorems, HostTerm, HostFrontGoldens, HostFront, and
    HostFrontTheorems after reading the real lakefile. Bad compiles
    a temp HostFrontTheorems copy with a planted type error after
    Mult, HostTerm, HostFrontGoldens, and HostFront oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior thirteen-module walker
    tryCompileNamedHostFrontSubset still works; this walker is not
    an alias of the thirteenth. Drive is good && !bad && isolation.
    Linear skipped. IrGraph skipped. Do not plant live
    HostFrontTheorems.lean. -/
elab "#elabMeetNamedHostFrontTheoremsSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostFrontTheorems? <- liftIO findLiveHostFrontTheoremsPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostFrontTheoremsSubset liveLake oleanDir
  let badCompiled <-
    match liveHostFrontTheorems? with
    | none =>
      pure true
    | some liveHostFrontTheorems => do
      let liveText <- liftIO (IO.FS.readFile liveHostFrontTheorems)
      let badPath :=
        badDir / "ElabMeetNamedHostFrontTheoremsSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostFrontTheoremsDeps
        badPath badDir `ElabMeetNamedHostFrontTheoremsSubsetBad
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
      tryCompileNamedHostFrontSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostFrontTheoremsSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostFrontTheoremsSubset fakeLake fakeDir
  let notAliasOfThirteenth :=
    namedClosedHostFrontTheoremsSubsetNames
      != namedClosedHostFrontSubsetNames
      && namedClosedHostFrontTheoremsCompileOrder
           != namedClosedHostFrontCompileOrder
      && namedClosedHostFrontTheoremsSubsetNames.contains
           "SystemsLean.HostFrontTheorems"
      && !namedClosedHostFrontSubsetNames.contains
           "SystemsLean.HostFrontTheorems"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfThirteenth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostFrontTheoremsSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostFrontTheoremsSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostFrontTheoremsSubset
  let dN := mkIdent `elabMeetDrivesNamedHostFrontTheoremsSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostFrontTheoremsSubsetProbe

example : elabMeetAcceptsGoodNamedHostFrontTheoremsSubset = true := rfl
example : elabMeetRejectsBadNamedHostFrontTheoremsSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostFrontTheoremsSubset = true := rfl
example : elabMeetDrivesNamedHostFrontTheoremsSubset = true := rfl

/-- Drive fold for the HostFrontTheorems closed subset. Greppable: elabMeetDrivesNamedHostFrontTheoremsSubset. -/
theorem elabMeetDrivesNamedHostFrontTheoremsSubset_true :
    elabMeetDrivesNamedHostFrontTheoremsSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostFrontTheoremsSubset_true :
    elabMeetAcceptsGoodNamedHostFrontTheoremsSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostFrontTheoremsSubset_true :
    elabMeetRejectsBadNamedHostFrontTheoremsSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostFrontTheoremsSubset_true :
    elabMeetRejectsOldWalkAsNamedHostFrontTheoremsSubset = true := by
  native_decide

end SystemsLean.ElabMeet
