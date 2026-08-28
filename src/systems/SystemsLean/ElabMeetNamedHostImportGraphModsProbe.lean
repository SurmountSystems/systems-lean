/-
  SYSTEMS_LEAN_HOST partial -- twenty-third HostImportGraphMods named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Twenty-third wrappers live in
  ElabMeetNamedWalkHostImportGraphSeeds. Shared helpers stay in
  ElabMeetNamedWalk. Do not put this probe back on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, ElabMeetNamedWalkHostTerm,
  ElabMeetNamedWalkHostPackageWrite, ElabMeetNamedHostPackageRootsProbe,
  ElabMeetNamedHostImportGraphSeedsProbe, or
  ElabMeetNamedHostImportGraphModelProbe.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostImportGraphMods subset (twenty-three named members):
    prior twenty-two plus SystemsLean.HostImportGraphMods last.
    Membership list is barrel order among the twenty-three; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the twenty-second compile order, then HostImportGraphMods last.
    IrGraph and HostCompose are compile dependencies only.
    Twenty-three-name walker is a wrapper in
    ElabMeetNamedWalkHostImportGraphSeeds.
    Twenty-third HostImportGraphMods probe lives here.
  - tryCompileNamedHostImportGraphModsSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Twenty-three-name HostImportGraphMods bad writes a temp
    HostImportGraphMods copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior twenty-two-module walker
    tryCompileNamedHostImportGraphModelSubset, and that this walk
    is not an alias of the twenty-second. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostImportGraphMods.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostImportGraphModsPath,
  namedClosedHostImportGraphModsSubsetNames,
  namedClosedHostImportGraphModsCompileOrder,
  barrelListsNamedHostImportGraphModsSubset,
  tryCompileNamedHostImportGraphModsSubset,
  tryCompileAfterHostImportGraphModsDeps,
  elabMeetDrivesNamedHostImportGraphModsSubset,
  elabMeetAcceptsGoodNamedHostImportGraphModsSubset,
  elabMeetRejectsBadNamedHostImportGraphModsSubset,
  elabMeetRejectsOldWalkAsNamedHostImportGraphModsSubset,
  #elabMeetNamedHostImportGraphModsSubsetProbe,
  elabMeetNamedHostImportGraphModsSubsetProbe,
  SystemsLean.HostImportGraphMods,
  ElabMeetNamedHostImportGraphModsProbe,
  SystemsLean.ElabMeetNamedHostImportGraphModsProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostImportGraphModsProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostImportGraphModsProbe;
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

/-- Record accept / reject for the HostImportGraphMods named subset.
    Good compiles live Mult through HostImportGraphModel plus the
    subset-emit compile closure and HostImportGraphMods after
    reading the real lakefile. Bad compiles a temp
    HostImportGraphMods copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior twenty-two-module walker
    tryCompileNamedHostImportGraphModelSubset still works; this
    walker is not an alias of the twenty-second. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostImportGraphMods.lean. -/
elab "#elabMeetNamedHostImportGraphModsSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostImportGraphMods? <- liftIO findLiveHostImportGraphModsPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostImportGraphModsSubset liveLake oleanDir
  let badCompiled <-
    match liveHostImportGraphMods? with
    | none =>
      pure true
    | some liveHostImportGraphMods => do
      let liveText <- liftIO (IO.FS.readFile liveHostImportGraphMods)
      let badPath :=
        badDir / "ElabMeetNamedHostImportGraphModsSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostImportGraphModsDeps
        badPath badDir `ElabMeetNamedHostImportGraphModsSubsetBad
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
      tryCompileNamedHostImportGraphModelSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostImportGraphModsSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostImportGraphModsSubset fakeLake fakeDir
  let notAliasOfTwentySecond :=
    namedClosedHostImportGraphModsSubsetNames
      != namedClosedHostImportGraphModelSubsetNames
      && namedClosedHostImportGraphModsCompileOrder
           != namedClosedHostImportGraphModelCompileOrder
      && namedClosedHostImportGraphModsSubsetNames.contains
           "SystemsLean.HostImportGraphMods"
      && !namedClosedHostImportGraphModelSubsetNames.contains
           "SystemsLean.HostImportGraphMods"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfTwentySecond
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostImportGraphModsSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostImportGraphModsSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostImportGraphModsSubset
  let dN := mkIdent `elabMeetDrivesNamedHostImportGraphModsSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostImportGraphModsSubsetProbe

example : elabMeetAcceptsGoodNamedHostImportGraphModsSubset = true := rfl
example : elabMeetRejectsBadNamedHostImportGraphModsSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostImportGraphModsSubset = true := rfl
example : elabMeetDrivesNamedHostImportGraphModsSubset = true := rfl

/-- Drive fold for the HostImportGraphMods closed subset. Greppable: elabMeetDrivesNamedHostImportGraphModsSubset. -/
theorem elabMeetDrivesNamedHostImportGraphModsSubset_true :
    elabMeetDrivesNamedHostImportGraphModsSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostImportGraphModsSubset_true :
    elabMeetAcceptsGoodNamedHostImportGraphModsSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostImportGraphModsSubset_true :
    elabMeetRejectsBadNamedHostImportGraphModsSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostImportGraphModsSubset_true :
    elabMeetRejectsOldWalkAsNamedHostImportGraphModsSubset = true := by
  native_decide

end SystemsLean.ElabMeet
