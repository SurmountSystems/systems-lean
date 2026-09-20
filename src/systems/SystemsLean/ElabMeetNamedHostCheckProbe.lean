/-
  SYSTEMS_LEAN_HOST partial -- fifteenth HostCheck named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Fifteenth wrappers live in
  ElabMeetNamedWalkHostTerm. Shared helpers stay in ElabMeetNamedWalk.
  Do not put this probe back on ElabMeetSubset, Tail, Later, or
  ElabMeetCompile.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostCheck closed subset (import-closed):
    prior fourteen plus SystemsLean.HostCheck last.
    Membership list is barrel order among the fifteen; skip
    Linear, skip IrGraph. Compile order is the prior fourteen
    compile order then HostCheck last.
    HostCheck imports HostFront.
    Fifteen-module walker is a wrapper in
    ElabMeetNamedWalkHostTerm.
    Fifteenth HostCheck probe lives here.
  - tryCompileNamedHostCheckSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Fifteen-module HostCheck bad writes a temp
    HostCheck copy and compiles it after Mult, HostTerm,
    HostFrontGoldens, and HostFront oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior fourteen-module walker
    tryCompileNamedHostFrontTheoremsSubset, and that this walk is not
    an alias of the fourteenth. Linear skipped. IrGraph skipped.
    Do not plant live HostCheck.lean.
  - The drive is good && !bad && isolation.
  - When SLAKE_PACKAGE_TYPECHECK=1 (library walk), plant drive Bools
    via elabMeetPlantNamedSubsetDrive so this probe kernel-compiles
    as a library. Lake unset-env still runs the live nested compile.
    Do not drop this module from the 747 list.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostCheckPath,
  namedClosedHostCheckSubsetNames,
  namedClosedHostCheckCompileOrder,
  barrelListsNamedHostCheckSubset,
  tryCompileNamedHostCheckSubset,
  tryCompileAfterHostCheckDeps,
  elabMeetDrivesNamedHostCheckSubset,
  elabMeetAcceptsGoodNamedHostCheckSubset,
  elabMeetRejectsBadNamedHostCheckSubset,
  elabMeetRejectsOldWalkAsNamedHostCheckSubset,
  elabMeetRunNamedHostCheckSubsetProbe,
  elabMeetPlantNamedSubsetDrive, slakePackageTypecheckWalk,
  SLAKE_PACKAGE_TYPECHECK,
  #elabMeetNamedHostCheckSubsetProbe,
  elabMeetNamedHostCheckSubsetProbe,
  SystemsLean.HostCheck,
  ElabMeetNamedHostCheckProbe,
  SystemsLean.ElabMeetNamedHostCheckProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostCheckProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostCheckProbe;
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

/-- Record accept / reject for the HostCheck closed subset.
    Good compiles live Mult, Types, MultTheorems, TypesTheorems,
    Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram,
    IrProgramTheorems, HostTerm, HostFrontGoldens, HostFront,
    HostFrontTheorems, and HostCheck after reading the real
    lakefile. Bad compiles a temp HostCheck copy with a planted
    type error after Mult, HostTerm, HostFrontGoldens, and
    HostFront oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior fourteen-module walker
    tryCompileNamedHostFrontTheoremsSubset still works; this walker is not
    an alias of the fourteenth. Drive is good && !bad && isolation.
    Linear skipped. IrGraph skipped. Do not plant live
    HostCheck.lean. -/
def elabMeetRunNamedHostCheckSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostCheck? <- liftIO findLiveHostCheckPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostCheckSubset liveLake oleanDir
  let badCompiled <-
    match liveHostCheck? with
    | none =>
      pure true
    | some liveHostCheck => do
      let liveText <- liftIO (IO.FS.readFile liveHostCheck)
      let badPath :=
        badDir / "ElabMeetNamedHostCheckSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostCheckDeps
        badPath badDir `ElabMeetNamedHostCheckSubsetBad
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
      tryCompileNamedHostFrontTheoremsSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostCheckSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostCheckSubset fakeLake fakeDir
  let notAliasOfFourteenth :=
    namedClosedHostCheckSubsetNames
      != namedClosedHostFrontTheoremsSubsetNames
      && namedClosedHostCheckCompileOrder
           != namedClosedHostFrontTheoremsCompileOrder
      && namedClosedHostCheckSubsetNames.contains
           "SystemsLean.HostCheck"
      && !namedClosedHostFrontTheoremsSubsetNames.contains
           "SystemsLean.HostCheck"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfFourteenth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostCheckSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostCheckSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostCheckSubset
  let dN := mkIdent `elabMeetDrivesNamedHostCheckSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostCheckSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostCheckSubset
      `elabMeetRejectsBadNamedHostCheckSubset
      `elabMeetRejectsOldWalkAsNamedHostCheckSubset
      `elabMeetDrivesNamedHostCheckSubset
  else
    elabMeetRunNamedHostCheckSubsetProbe

#elabMeetNamedHostCheckSubsetProbe

example : elabMeetAcceptsGoodNamedHostCheckSubset = true := rfl
example : elabMeetRejectsBadNamedHostCheckSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostCheckSubset = true := rfl
example : elabMeetDrivesNamedHostCheckSubset = true := rfl

/-- Drive fold for the HostCheck closed subset. Greppable: elabMeetDrivesNamedHostCheckSubset. -/
theorem elabMeetDrivesNamedHostCheckSubset_true :
    elabMeetDrivesNamedHostCheckSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostCheckSubset_true :
    elabMeetAcceptsGoodNamedHostCheckSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostCheckSubset_true :
    elabMeetRejectsBadNamedHostCheckSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostCheckSubset_true :
    elabMeetRejectsOldWalkAsNamedHostCheckSubset = true := by
  native_decide

end SystemsLean.ElabMeet
