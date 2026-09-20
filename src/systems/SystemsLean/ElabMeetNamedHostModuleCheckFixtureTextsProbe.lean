/-
  SYSTEMS_LEAN_HOST partial -- thirty-first HostModuleCheckFixtureTexts named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Thirty-first wrappers live in
  ElabMeetNamedWalkHostModuleCheckFixtureTexts. Shared helpers stay in
  ElabMeetNamedWalk. Do not put this probe back on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, ElabMeetNamedWalkHostTerm,
  ElabMeetNamedWalkHostPackageWrite, ElabMeetNamedHostPackageRootsProbe,
  ElabMeetNamedHostImportGraphSeedsProbe, ElabMeetNamedHostImportGraphModelProbe,
  ElabMeetNamedHostImportGraphModsProbe,
  ElabMeetNamedHostImportGraphModsLaterProbe,
  ElabMeetNamedHostImportGraphLoadOkLaterProbe,
  ElabMeetNamedHostImportGraphWalkLaterProbe,
  ElabMeetNamedHostImportGraphWalkProbe,
  ElabMeetNamedHostModuleCheckRequiredDeclsProbe,
  ElabMeetNamedHostModuleCheckRequiredDeclsProductProbe,
  ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe, or
  ElabMeetNamedWalkHostImportGraphWalkLater.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostModuleCheckFixtureTexts subset (thirty-one named members):
    prior thirty plus SystemsLean.HostModuleCheckFixtureTexts last.
    Membership list is barrel order among the thirty-one; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the thirtieth compile order, then HostModuleCheckFixtureTexts last.
    IrGraph and HostCompose are compile dependencies only.
    Thirty-one-name walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckFixtureTexts.
    Thirty-first HostModuleCheckFixtureTexts probe lives here.
  - tryCompileNamedHostModuleCheckFixtureTextsSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Thirty-one-name HostModuleCheckFixtureTexts bad writes a temp
    HostModuleCheckFixtureTexts copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior thirty-module walker
    tryCompileNamedHostModuleCheckRequiredDeclsLaterSubset, and that this walk
    is not an alias of the thirtieth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckFixtureTexts.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckFixtureTextsPath,
  namedClosedHostModuleCheckFixtureTextsSubsetNames,
  namedClosedHostModuleCheckFixtureTextsCompileOrder,
  barrelListsNamedHostModuleCheckFixtureTextsSubset,
  tryCompileNamedHostModuleCheckFixtureTextsSubset,
  tryCompileAfterHostModuleCheckFixtureTextsDeps,
  elabMeetDrivesNamedHostModuleCheckFixtureTextsSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSubset,
  elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSubset,
  #elabMeetNamedHostModuleCheckFixtureTextsSubsetProbe,
  elabMeetNamedHostModuleCheckFixtureTextsSubsetProbe,
  SystemsLean.HostModuleCheckFixtureTexts,
  ElabMeetNamedHostModuleCheckFixtureTextsProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsProbe;
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
import SystemsLean.ElabMeetNamedWalkHostModuleCheckFixtureTexts

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckFixtureTexts named subset.
    Good compiles live Mult through HostModuleCheckRequiredDeclsLater plus the
    subset-emit compile closure and HostModuleCheckFixtureTexts after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckFixtureTexts copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior thirty-module walker
    tryCompileNamedHostModuleCheckRequiredDeclsLaterSubset still works; this
    walker is not an alias of the thirtieth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckFixtureTexts.lean. -/
def elabMeetRunNamedHostModuleCheckFixtureTextsSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckFixtureTexts? <-
    liftIO findLiveHostModuleCheckFixtureTextsPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckFixtureTextsSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckFixtureTexts? with
    | none =>
      pure true
    | some liveHostModuleCheckFixtureTexts => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckFixtureTexts)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckFixtureTextsSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckFixtureTextsDeps
        badPath badDir `ElabMeetNamedHostModuleCheckFixtureTextsSubsetBad
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
      tryCompileNamedHostModuleCheckRequiredDeclsLaterSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckFixtureTextsSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckFixtureTextsSubset fakeLake fakeDir
  let notAliasOfThirtieth :=
    namedClosedHostModuleCheckFixtureTextsSubsetNames
      != namedClosedHostModuleCheckRequiredDeclsLaterSubsetNames
      && namedClosedHostModuleCheckFixtureTextsCompileOrder
           != namedClosedHostModuleCheckRequiredDeclsLaterCompileOrder
      && namedClosedHostModuleCheckFixtureTextsSubsetNames.contains
           "SystemsLean.HostModuleCheckFixtureTexts"
      && !namedClosedHostModuleCheckRequiredDeclsLaterSubsetNames.contains
           "SystemsLean.HostModuleCheckFixtureTexts"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfThirtieth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckFixtureTextsSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostModuleCheckFixtureTextsSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSubset
      `elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSubset
      `elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSubset
      `elabMeetDrivesNamedHostModuleCheckFixtureTextsSubset
  else
    elabMeetRunNamedHostModuleCheckFixtureTextsSubsetProbe

#elabMeetNamedHostModuleCheckFixtureTextsSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckFixtureTextsSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckFixtureTextsSubset = true := rfl

end SystemsLean.ElabMeet
