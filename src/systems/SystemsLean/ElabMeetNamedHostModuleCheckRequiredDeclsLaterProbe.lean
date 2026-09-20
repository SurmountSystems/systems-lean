/-
  SYSTEMS_LEAN_HOST partial -- thirtieth HostModuleCheckRequiredDeclsLater named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Thirtieth wrappers live in
  ElabMeetNamedWalkHostImportGraphWalkLater. Shared helpers stay in
  ElabMeetNamedWalk. Do not put this probe back on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, ElabMeetNamedWalkHostTerm,
  ElabMeetNamedWalkHostPackageWrite, ElabMeetNamedHostPackageRootsProbe,
  ElabMeetNamedHostImportGraphSeedsProbe, ElabMeetNamedHostImportGraphModelProbe,
  ElabMeetNamedHostImportGraphModsProbe,
  ElabMeetNamedHostImportGraphModsLaterProbe,
  ElabMeetNamedHostImportGraphLoadOkLaterProbe,
  ElabMeetNamedHostImportGraphWalkLaterProbe,
  ElabMeetNamedHostImportGraphWalkProbe,
  ElabMeetNamedHostModuleCheckRequiredDeclsProbe, or
  ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostModuleCheckRequiredDeclsLater subset (thirty named members):
    prior twenty-nine plus SystemsLean.HostModuleCheckRequiredDeclsLater last.
    Membership list is barrel order among the thirty; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the twenty-ninth compile order, then HostModuleCheckRequiredDeclsLater last.
    IrGraph and HostCompose are compile dependencies only.
    Thirty-name walker is a wrapper in
    ElabMeetNamedWalkHostImportGraphWalkLater.
    Thirtieth HostModuleCheckRequiredDeclsLater probe lives here.
  - tryCompileNamedHostModuleCheckRequiredDeclsLaterSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Thirty-name HostModuleCheckRequiredDeclsLater bad writes a temp
    HostModuleCheckRequiredDeclsLater copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior twenty-nine-module walker
    tryCompileNamedHostModuleCheckRequiredDeclsProductSubset, and that this walk
    is not an alias of the twenty-ninth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckRequiredDeclsLater.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckRequiredDeclsLaterPath,
  namedClosedHostModuleCheckRequiredDeclsLaterSubsetNames,
  namedClosedHostModuleCheckRequiredDeclsLaterCompileOrder,
  barrelListsNamedHostModuleCheckRequiredDeclsLaterSubset,
  tryCompileNamedHostModuleCheckRequiredDeclsLaterSubset,
  tryCompileAfterHostModuleCheckRequiredDeclsLaterDeps,
  elabMeetDrivesNamedHostModuleCheckRequiredDeclsLaterSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsLaterSubset,
  elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsLaterSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsLaterSubset,
  #elabMeetNamedHostModuleCheckRequiredDeclsLaterSubsetProbe,
  elabMeetNamedHostModuleCheckRequiredDeclsLaterSubsetProbe,
  SystemsLean.HostModuleCheckRequiredDeclsLater,
  ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe;
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

/-- Record accept / reject for the HostModuleCheckRequiredDeclsLater named subset.
    Good compiles live Mult through HostModuleCheckRequiredDeclsProduct plus the
    subset-emit compile closure and HostModuleCheckRequiredDeclsLater after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckRequiredDeclsLater copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior twenty-nine-module walker
    tryCompileNamedHostModuleCheckRequiredDeclsProductSubset still works; this
    walker is not an alias of the twenty-ninth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckRequiredDeclsLater.lean. -/
def elabMeetRunNamedHostModuleCheckRequiredDeclsLaterSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckRequiredDeclsLater? <-
    liftIO findLiveHostModuleCheckRequiredDeclsLaterPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckRequiredDeclsLaterSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckRequiredDeclsLater? with
    | none =>
      pure true
    | some liveHostModuleCheckRequiredDeclsLater => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckRequiredDeclsLater)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckRequiredDeclsLaterSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckRequiredDeclsLaterDeps
        badPath badDir `ElabMeetNamedHostModuleCheckRequiredDeclsLaterSubsetBad
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
      tryCompileNamedHostModuleCheckRequiredDeclsProductSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckRequiredDeclsLaterSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckRequiredDeclsLaterSubset fakeLake fakeDir
  let notAliasOfTwentyNinth :=
    namedClosedHostModuleCheckRequiredDeclsLaterSubsetNames
      != namedClosedHostModuleCheckRequiredDeclsProductSubsetNames
      && namedClosedHostModuleCheckRequiredDeclsLaterCompileOrder
           != namedClosedHostModuleCheckRequiredDeclsProductCompileOrder
      && namedClosedHostModuleCheckRequiredDeclsLaterSubsetNames.contains
           "SystemsLean.HostModuleCheckRequiredDeclsLater"
      && !namedClosedHostModuleCheckRequiredDeclsProductSubsetNames.contains
           "SystemsLean.HostModuleCheckRequiredDeclsLater"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfTwentyNinth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsLaterSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsLaterSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsLaterSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckRequiredDeclsLaterSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostModuleCheckRequiredDeclsLaterSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsLaterSubset
      `elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsLaterSubset
      `elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsLaterSubset
      `elabMeetDrivesNamedHostModuleCheckRequiredDeclsLaterSubset
  else
    elabMeetRunNamedHostModuleCheckRequiredDeclsLaterSubsetProbe

#elabMeetNamedHostModuleCheckRequiredDeclsLaterSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsLaterSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsLaterSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsLaterSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckRequiredDeclsLaterSubset = true := rfl

/-- Drive fold for the HostModuleCheckRequiredDeclsLater closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckRequiredDeclsLaterSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckRequiredDeclsLaterSubset_true :
    elabMeetDrivesNamedHostModuleCheckRequiredDeclsLaterSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsLaterSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsLaterSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsLaterSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsLaterSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsLaterSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsLaterSubset = true := by
  native_decide

end SystemsLean.ElabMeet
