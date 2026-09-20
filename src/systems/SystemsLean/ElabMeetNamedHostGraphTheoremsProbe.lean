/-
  SYSTEMS_LEAN_HOST partial -- seventeenth HostGraphTheorems named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Seventeenth wrappers live in
  ElabMeetNamedWalkHostGraphTheorems. Shared helpers stay in
  ElabMeetNamedWalk. Do not put this probe back on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, ElabMeetNamedHostGraphProbe,
  ElabMeetNamedHostCheckProbe, or ElabMeetNamedHostFrontTheoremsProbe.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostGraphTheorems closed subset (import-closed):
    prior sixteen plus SystemsLean.HostGraphTheorems last.
    Membership list is barrel order among the seventeen; skip
    Linear, skip IrGraph. Compile order is the prior sixteen
    compile order then HostGraphTheorems last.
    HostGraphTheorems imports HostGraph.
    Seventeen-module walker is a wrapper in
    ElabMeetNamedWalkHostGraphTheorems.
    Seventeenth HostGraphTheorems probe lives here.
  - tryCompileNamedHostGraphTheoremsSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Seventeen-module HostGraphTheorems bad writes a temp
    HostGraphTheorems copy and compiles it after Mult, HostGraph,
    HostTerm, HostFrontGoldens, and HostFront oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior sixteen-module walker
    tryCompileNamedHostGraphSubset, and that this walk is not
    an alias of the sixteenth. Linear skipped. IrGraph skipped.
    Do not plant live HostGraphTheorems.lean.
  - The drive is good && !bad && isolation.
  - When SLAKE_PACKAGE_TYPECHECK=1 (library walk), plant drive Bools
    via elabMeetPlantNamedSubsetDrive so this probe kernel-compiles
    as a library. Lake unset-env still runs the live nested compile.
    Do not drop this module from the 747 list.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostGraphTheoremsPath,
  namedClosedHostGraphTheoremsSubsetNames,
  namedClosedHostGraphTheoremsCompileOrder,
  barrelListsNamedHostGraphTheoremsSubset,
  tryCompileNamedHostGraphTheoremsSubset,
  tryCompileAfterHostGraphTheoremsDeps,
  elabMeetDrivesNamedHostGraphTheoremsSubset,
  elabMeetAcceptsGoodNamedHostGraphTheoremsSubset,
  elabMeetRejectsBadNamedHostGraphTheoremsSubset,
  elabMeetRejectsOldWalkAsNamedHostGraphTheoremsSubset,
  elabMeetRunNamedHostGraphTheoremsSubsetProbe,
  elabMeetPlantNamedSubsetDrive, slakePackageTypecheckWalk,
  SLAKE_PACKAGE_TYPECHECK,
  #elabMeetNamedHostGraphTheoremsSubsetProbe,
  elabMeetNamedHostGraphTheoremsSubsetProbe,
  SystemsLean.HostGraphTheorems,
  ElabMeetNamedHostGraphTheoremsProbe,
  SystemsLean.ElabMeetNamedHostGraphTheoremsProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostGraphTheoremsProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostGraphTheoremsProbe;
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
import SystemsLean.ElabMeetNamedWalkHostGraphTheorems

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostGraphTheorems closed subset.
    Good compiles live Mult, Types, MultTheorems, TypesTheorems,
    Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram,
    IrProgramTheorems, HostTerm, HostFrontGoldens, HostFront,
    HostFrontTheorems, HostCheck, HostGraph, and HostGraphTheorems
    after reading the real lakefile. Bad compiles a temp
    HostGraphTheorems copy with a planted type error after Mult,
    HostGraph, HostTerm, HostFrontGoldens, and HostFront oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior sixteen-module walker
    tryCompileNamedHostGraphSubset still works; this walker is not
    an alias of the sixteenth. Drive is good && !bad && isolation.
    Linear skipped. IrGraph skipped. Do not plant live
    HostGraphTheorems.lean. -/
def elabMeetRunNamedHostGraphTheoremsSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostGraphTheorems? <- liftIO findLiveHostGraphTheoremsPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostGraphTheoremsSubset liveLake oleanDir
  let badCompiled <-
    match liveHostGraphTheorems? with
    | none =>
      pure true
    | some liveHostGraphTheorems => do
      let liveText <- liftIO (IO.FS.readFile liveHostGraphTheorems)
      let badPath :=
        badDir / "ElabMeetNamedHostGraphTheoremsSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostGraphTheoremsDeps
        badPath badDir `ElabMeetNamedHostGraphTheoremsSubsetBad
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
      tryCompileNamedHostGraphSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostGraphTheoremsSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostGraphTheoremsSubset fakeLake fakeDir
  let notAliasOfSixteenth :=
    namedClosedHostGraphTheoremsSubsetNames
      != namedClosedHostGraphSubsetNames
      && namedClosedHostGraphTheoremsCompileOrder
           != namedClosedHostGraphCompileOrder
      && namedClosedHostGraphTheoremsSubsetNames.contains
           "SystemsLean.HostGraphTheorems"
      && !namedClosedHostGraphSubsetNames.contains
           "SystemsLean.HostGraphTheorems"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfSixteenth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostGraphTheoremsSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostGraphTheoremsSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostGraphTheoremsSubset
  let dN := mkIdent `elabMeetDrivesNamedHostGraphTheoremsSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostGraphTheoremsSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostGraphTheoremsSubset
      `elabMeetRejectsBadNamedHostGraphTheoremsSubset
      `elabMeetRejectsOldWalkAsNamedHostGraphTheoremsSubset
      `elabMeetDrivesNamedHostGraphTheoremsSubset
  else
    elabMeetRunNamedHostGraphTheoremsSubsetProbe

#elabMeetNamedHostGraphTheoremsSubsetProbe

example : elabMeetAcceptsGoodNamedHostGraphTheoremsSubset = true := rfl
example : elabMeetRejectsBadNamedHostGraphTheoremsSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostGraphTheoremsSubset = true := rfl
example : elabMeetDrivesNamedHostGraphTheoremsSubset = true := rfl

/-- Drive fold for the HostGraphTheorems closed subset. Greppable: elabMeetDrivesNamedHostGraphTheoremsSubset. -/
theorem elabMeetDrivesNamedHostGraphTheoremsSubset_true :
    elabMeetDrivesNamedHostGraphTheoremsSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostGraphTheoremsSubset_true :
    elabMeetAcceptsGoodNamedHostGraphTheoremsSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostGraphTheoremsSubset_true :
    elabMeetRejectsBadNamedHostGraphTheoremsSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostGraphTheoremsSubset_true :
    elabMeetRejectsOldWalkAsNamedHostGraphTheoremsSubset = true := by
  native_decide

end SystemsLean.ElabMeet
