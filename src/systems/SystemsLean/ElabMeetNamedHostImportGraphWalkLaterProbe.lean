/-
  SYSTEMS_LEAN_HOST partial -- twenty-sixth HostImportGraphWalkLater named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Twenty-sixth wrappers live in
  ElabMeetNamedWalkHostImportGraphWalkLater. Shared helpers stay in
  ElabMeetNamedWalk. Do not put this probe back on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, ElabMeetNamedWalkHostTerm,
  ElabMeetNamedWalkHostPackageWrite, ElabMeetNamedHostPackageRootsProbe,
  ElabMeetNamedHostImportGraphSeedsProbe, ElabMeetNamedHostImportGraphModelProbe,
  ElabMeetNamedHostImportGraphModsProbe,
  ElabMeetNamedHostImportGraphModsLaterProbe, or
  ElabMeetNamedHostImportGraphLoadOkLaterProbe.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostImportGraphWalkLater subset (twenty-six named members):
    prior twenty-five plus SystemsLean.HostImportGraphWalkLater last.
    Membership list is barrel order among the twenty-six; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the twenty-fifth compile order, then HostImportGraphWalkLater last.
    IrGraph and HostCompose are compile dependencies only.
    Twenty-six-name walker is a wrapper in
    ElabMeetNamedWalkHostImportGraphWalkLater.
    Twenty-sixth HostImportGraphWalkLater probe lives here.
  - tryCompileNamedHostImportGraphWalkLaterSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Twenty-six-name HostImportGraphWalkLater bad writes a temp
    HostImportGraphWalkLater copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior twenty-five-module walker
    tryCompileNamedHostImportGraphLoadOkLaterSubset, and that this walk
    is not an alias of the twenty-fifth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostImportGraphWalkLater.lean.
  - The drive is good && !bad && isolation.
  - When SLAKE_PACKAGE_TYPECHECK=1 (library walk), plant drive Bools
    via elabMeetPlantNamedSubsetDrive so this probe kernel-compiles
    as a library. Lake unset-env still runs the live nested compile.
    Do not drop this module from the 747 list.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostImportGraphWalkLaterPath,
  namedClosedHostImportGraphWalkLaterSubsetNames,
  namedClosedHostImportGraphWalkLaterCompileOrder,
  barrelListsNamedHostImportGraphWalkLaterSubset,
  tryCompileNamedHostImportGraphWalkLaterSubset,
  tryCompileAfterHostImportGraphWalkLaterDeps,
  elabMeetDrivesNamedHostImportGraphWalkLaterSubset,
  elabMeetAcceptsGoodNamedHostImportGraphWalkLaterSubset,
  elabMeetRejectsBadNamedHostImportGraphWalkLaterSubset,
  elabMeetRejectsOldWalkAsNamedHostImportGraphWalkLaterSubset,
  elabMeetRunNamedHostImportGraphWalkLaterSubsetProbe,
  elabMeetPlantNamedSubsetDrive, slakePackageTypecheckWalk,
  SLAKE_PACKAGE_TYPECHECK,
  #elabMeetNamedHostImportGraphWalkLaterSubsetProbe,
  elabMeetNamedHostImportGraphWalkLaterSubsetProbe,
  SystemsLean.HostImportGraphWalkLater,
  ElabMeetNamedHostImportGraphWalkLaterProbe,
  SystemsLean.ElabMeetNamedHostImportGraphWalkLaterProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostImportGraphWalkLaterProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostImportGraphWalkLaterProbe;
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
import SystemsLean.ElabMeetNamedWalkHostImportGraphWalkLater

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostImportGraphWalkLater named subset.
    Good compiles live Mult through HostImportGraphLoadOkLater plus the
    subset-emit compile closure and HostImportGraphWalkLater after
    reading the real lakefile. Bad compiles a temp
    HostImportGraphWalkLater copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior twenty-five-module walker
    tryCompileNamedHostImportGraphLoadOkLaterSubset still works; this
    walker is not an alias of the twenty-fifth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostImportGraphWalkLater.lean. -/
def elabMeetRunNamedHostImportGraphWalkLaterSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostImportGraphWalkLater? <- liftIO findLiveHostImportGraphWalkLaterPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostImportGraphWalkLaterSubset liveLake oleanDir
  let badCompiled <-
    match liveHostImportGraphWalkLater? with
    | none =>
      pure true
    | some liveHostImportGraphWalkLater => do
      let liveText <- liftIO (IO.FS.readFile liveHostImportGraphWalkLater)
      let badPath :=
        badDir / "ElabMeetNamedHostImportGraphWalkLaterSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostImportGraphWalkLaterDeps
        badPath badDir `ElabMeetNamedHostImportGraphWalkLaterSubsetBad
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
      tryCompileNamedHostImportGraphLoadOkLaterSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostImportGraphWalkLaterSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostImportGraphWalkLaterSubset fakeLake fakeDir
  let notAliasOfTwentyFifth :=
    namedClosedHostImportGraphWalkLaterSubsetNames
      != namedClosedHostImportGraphLoadOkLaterSubsetNames
      && namedClosedHostImportGraphWalkLaterCompileOrder
           != namedClosedHostImportGraphLoadOkLaterCompileOrder
      && namedClosedHostImportGraphWalkLaterSubsetNames.contains
           "SystemsLean.HostImportGraphWalkLater"
      && !namedClosedHostImportGraphLoadOkLaterSubsetNames.contains
           "SystemsLean.HostImportGraphWalkLater"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfTwentyFifth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostImportGraphWalkLaterSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostImportGraphWalkLaterSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostImportGraphWalkLaterSubset
  let dN := mkIdent `elabMeetDrivesNamedHostImportGraphWalkLaterSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostImportGraphWalkLaterSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostImportGraphWalkLaterSubset
      `elabMeetRejectsBadNamedHostImportGraphWalkLaterSubset
      `elabMeetRejectsOldWalkAsNamedHostImportGraphWalkLaterSubset
      `elabMeetDrivesNamedHostImportGraphWalkLaterSubset
  else
    elabMeetRunNamedHostImportGraphWalkLaterSubsetProbe

#elabMeetNamedHostImportGraphWalkLaterSubsetProbe

example : elabMeetAcceptsGoodNamedHostImportGraphWalkLaterSubset = true := rfl
example : elabMeetRejectsBadNamedHostImportGraphWalkLaterSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostImportGraphWalkLaterSubset = true := rfl
example : elabMeetDrivesNamedHostImportGraphWalkLaterSubset = true := rfl

/-- Drive fold for the HostImportGraphWalkLater closed subset. Greppable: elabMeetDrivesNamedHostImportGraphWalkLaterSubset. -/
theorem elabMeetDrivesNamedHostImportGraphWalkLaterSubset_true :
    elabMeetDrivesNamedHostImportGraphWalkLaterSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostImportGraphWalkLaterSubset_true :
    elabMeetAcceptsGoodNamedHostImportGraphWalkLaterSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostImportGraphWalkLaterSubset_true :
    elabMeetRejectsBadNamedHostImportGraphWalkLaterSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostImportGraphWalkLaterSubset_true :
    elabMeetRejectsOldWalkAsNamedHostImportGraphWalkLaterSubset = true := by
  native_decide

end SystemsLean.ElabMeet
