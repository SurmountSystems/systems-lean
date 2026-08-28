/-
  SYSTEMS_LEAN_HOST partial -- twenty-ninth HostModuleCheckRequiredDeclsProduct named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Twenty-ninth wrappers live in
  ElabMeetNamedWalkHostImportGraphWalkLater. Shared helpers stay in
  ElabMeetNamedWalk. Do not put this probe back on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, ElabMeetNamedWalkHostTerm,
  ElabMeetNamedWalkHostPackageWrite, ElabMeetNamedHostPackageRootsProbe,
  ElabMeetNamedHostImportGraphSeedsProbe, ElabMeetNamedHostImportGraphModelProbe,
  ElabMeetNamedHostImportGraphModsProbe,
  ElabMeetNamedHostImportGraphModsLaterProbe,
  ElabMeetNamedHostImportGraphLoadOkLaterProbe,
  ElabMeetNamedHostImportGraphWalkLaterProbe,
  ElabMeetNamedHostImportGraphWalkProbe, or
  ElabMeetNamedHostModuleCheckRequiredDeclsProbe.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostModuleCheckRequiredDeclsProduct subset (twenty-nine named members):
    prior twenty-eight plus SystemsLean.HostModuleCheckRequiredDeclsProduct last.
    Membership list is barrel order among the twenty-nine; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the twenty-eighth compile order, then HostModuleCheckRequiredDeclsProduct last.
    IrGraph and HostCompose are compile dependencies only.
    Twenty-nine-name walker is a wrapper in
    ElabMeetNamedWalkHostImportGraphWalkLater.
    Twenty-ninth HostModuleCheckRequiredDeclsProduct probe lives here.
  - tryCompileNamedHostModuleCheckRequiredDeclsProductSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Twenty-nine-name HostModuleCheckRequiredDeclsProduct bad writes a temp
    HostModuleCheckRequiredDeclsProduct copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior twenty-eight-module walker
    tryCompileNamedHostModuleCheckRequiredDeclsSubset, and that this walk
    is not an alias of the twenty-eighth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckRequiredDeclsProduct.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckRequiredDeclsProductPath,
  namedClosedHostModuleCheckRequiredDeclsProductSubsetNames,
  namedClosedHostModuleCheckRequiredDeclsProductCompileOrder,
  barrelListsNamedHostModuleCheckRequiredDeclsProductSubset,
  tryCompileNamedHostModuleCheckRequiredDeclsProductSubset,
  tryCompileAfterHostModuleCheckRequiredDeclsProductDeps,
  elabMeetDrivesNamedHostModuleCheckRequiredDeclsProductSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsProductSubset,
  elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsProductSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsProductSubset,
  #elabMeetNamedHostModuleCheckRequiredDeclsProductSubsetProbe,
  elabMeetNamedHostModuleCheckRequiredDeclsProductSubsetProbe,
  SystemsLean.HostModuleCheckRequiredDeclsProduct,
  ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe;
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

/-- Record accept / reject for the HostModuleCheckRequiredDeclsProduct named subset.
    Good compiles live Mult through HostModuleCheckRequiredDecls plus the
    subset-emit compile closure and HostModuleCheckRequiredDeclsProduct after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckRequiredDeclsProduct copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior twenty-eight-module walker
    tryCompileNamedHostModuleCheckRequiredDeclsSubset still works; this
    walker is not an alias of the twenty-eighth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckRequiredDeclsProduct.lean. -/
elab "#elabMeetNamedHostModuleCheckRequiredDeclsProductSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckRequiredDeclsProduct? <-
    liftIO findLiveHostModuleCheckRequiredDeclsProductPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckRequiredDeclsProductSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckRequiredDeclsProduct? with
    | none =>
      pure true
    | some liveHostModuleCheckRequiredDeclsProduct => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckRequiredDeclsProduct)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckRequiredDeclsProductSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckRequiredDeclsProductDeps
        badPath badDir `ElabMeetNamedHostModuleCheckRequiredDeclsProductSubsetBad
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
      tryCompileNamedHostModuleCheckRequiredDeclsSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckRequiredDeclsProductSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckRequiredDeclsProductSubset fakeLake fakeDir
  let notAliasOfTwentyEighth :=
    namedClosedHostModuleCheckRequiredDeclsProductSubsetNames
      != namedClosedHostModuleCheckRequiredDeclsSubsetNames
      && namedClosedHostModuleCheckRequiredDeclsProductCompileOrder
           != namedClosedHostModuleCheckRequiredDeclsCompileOrder
      && namedClosedHostModuleCheckRequiredDeclsProductSubsetNames.contains
           "SystemsLean.HostModuleCheckRequiredDeclsProduct"
      && !namedClosedHostModuleCheckRequiredDeclsSubsetNames.contains
           "SystemsLean.HostModuleCheckRequiredDeclsProduct"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfTwentyEighth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsProductSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsProductSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsProductSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckRequiredDeclsProductSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckRequiredDeclsProductSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsProductSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsProductSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsProductSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckRequiredDeclsProductSubset = true := rfl

/-- Drive fold for the HostModuleCheckRequiredDeclsProduct closed subset. Greppable: elabMeetDrivesNamedHostModuleCheckRequiredDeclsProductSubset. -/
theorem elabMeetDrivesNamedHostModuleCheckRequiredDeclsProductSubset_true :
    elabMeetDrivesNamedHostModuleCheckRequiredDeclsProductSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsProductSubset_true :
    elabMeetAcceptsGoodNamedHostModuleCheckRequiredDeclsProductSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsProductSubset_true :
    elabMeetRejectsBadNamedHostModuleCheckRequiredDeclsProductSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsProductSubset_true :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckRequiredDeclsProductSubset = true := by
  native_decide

end SystemsLean.ElabMeet
