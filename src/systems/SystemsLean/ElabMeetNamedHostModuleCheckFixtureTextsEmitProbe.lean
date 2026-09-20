/-
  SYSTEMS_LEAN_HOST partial -- thirty-fifth HostModuleCheckFixtureTextsEmit named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Thirty-fifth wrappers live in
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit. Shared helpers stay in
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
  ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe,
  ElabMeetNamedHostModuleCheckFixtureTextsProbe,
  ElabMeetNamedHostModuleCheckFixtureTextsProductProbe,
  ElabMeetNamedHostModuleCheckFixtureTextsLaterProbe,
  ElabMeetNamedHostModuleCheckFixtureTextsSelfHostProbe, or
  ElabMeetNamedWalkHostImportGraphWalkLater.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostModuleCheckFixtureTextsEmit subset (thirty-five named members):
    prior thirty-four plus SystemsLean.HostModuleCheckFixtureTextsEmit last.
    Membership list is barrel order among the thirty-five; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the thirty-fourth compile order, then HostModuleCheckFixtureTextsEmit last.
    IrGraph and HostCompose are compile dependencies only.
    Thirty-five-name walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit.
    Thirty-fifth HostModuleCheckFixtureTextsEmit probe lives here.
  - tryCompileNamedHostModuleCheckFixtureTextsEmitSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Thirty-five-name HostModuleCheckFixtureTextsEmit bad writes a temp
    HostModuleCheckFixtureTextsEmit copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater / HostModuleCheckFixtureTexts /
    HostModuleCheckFixtureTextsProduct / HostModuleCheckFixtureTextsLater /
    HostModuleCheckFixtureTextsSelfHost oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior thirty-four-module walker
    tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubset, and that this walk
    is not an alias of the thirty-fourth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckFixtureTextsEmit.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckFixtureTextsEmitPath,
  namedClosedHostModuleCheckFixtureTextsEmitSubsetNames,
  namedClosedHostModuleCheckFixtureTextsEmitCompileOrder,
  barrelListsNamedHostModuleCheckFixtureTextsEmitSubset,
  tryCompileNamedHostModuleCheckFixtureTextsEmitSubset,
  tryCompileAfterHostModuleCheckFixtureTextsEmitDeps,
  elabMeetDrivesNamedHostModuleCheckFixtureTextsEmitSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsEmitSubset,
  elabMeetRejectsBadNamedHostModuleCheckFixtureTextsEmitSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsEmitSubset,
  #elabMeetNamedHostModuleCheckFixtureTextsEmitSubsetProbe,
  elabMeetNamedHostModuleCheckFixtureTextsEmitSubsetProbe,
  SystemsLean.HostModuleCheckFixtureTextsEmit,
  ElabMeetNamedHostModuleCheckFixtureTextsEmitProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsEmitProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsEmitProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsEmitProbe;
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
import SystemsLean.ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckFixtureTextsEmit named subset.
    Good compiles live Mult through HostModuleCheckFixtureTextsSelfHost plus the
    subset-emit compile closure and HostModuleCheckFixtureTextsEmit after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckFixtureTextsEmit copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater / HostModuleCheckFixtureTexts /
    HostModuleCheckFixtureTextsProduct / HostModuleCheckFixtureTextsLater /
    HostModuleCheckFixtureTextsSelfHost oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior thirty-four-module walker
    tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubset still works; this
    walker is not an alias of the thirty-fourth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckFixtureTextsEmit.lean. -/
def elabMeetRunNamedHostModuleCheckFixtureTextsEmitSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckFixtureTextsEmit? <-
    liftIO findLiveHostModuleCheckFixtureTextsEmitPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckFixtureTextsEmitSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckFixtureTextsEmit? with
    | none =>
      pure true
    | some liveHostModuleCheckFixtureTextsEmit => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckFixtureTextsEmit)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckFixtureTextsEmitSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckFixtureTextsEmitDeps
        badPath badDir `ElabMeetNamedHostModuleCheckFixtureTextsEmitSubsetBad
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
      tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckFixtureTextsEmitSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckFixtureTextsEmitSubset fakeLake fakeDir
  let notAliasOfThirtyFourth :=
    namedClosedHostModuleCheckFixtureTextsEmitSubsetNames
      != namedClosedHostModuleCheckFixtureTextsSelfHostSubsetNames
      && namedClosedHostModuleCheckFixtureTextsEmitCompileOrder
           != namedClosedHostModuleCheckFixtureTextsSelfHostCompileOrder
      && namedClosedHostModuleCheckFixtureTextsEmitSubsetNames.contains
           "SystemsLean.HostModuleCheckFixtureTextsEmit"
      && !namedClosedHostModuleCheckFixtureTextsSelfHostSubsetNames.contains
           "SystemsLean.HostModuleCheckFixtureTextsEmit"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfThirtyFourth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsEmitSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckFixtureTextsEmitSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsEmitSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckFixtureTextsEmitSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostModuleCheckFixtureTextsEmitSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsEmitSubset
      `elabMeetRejectsBadNamedHostModuleCheckFixtureTextsEmitSubset
      `elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsEmitSubset
      `elabMeetDrivesNamedHostModuleCheckFixtureTextsEmitSubset
  else
    elabMeetRunNamedHostModuleCheckFixtureTextsEmitSubsetProbe

#elabMeetNamedHostModuleCheckFixtureTextsEmitSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsEmitSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckFixtureTextsEmitSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsEmitSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckFixtureTextsEmitSubset = true := rfl

end SystemsLean.ElabMeet
