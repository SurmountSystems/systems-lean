/-
  SYSTEMS_LEAN_HOST partial -- forty-first HostModuleCheckEmitBodyTerm named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Forty-first wrappers live in
  ElabMeetNamedWalkHostModuleCheckCheckersLater. Shared helpers stay in
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
  ElabMeetNamedHostModuleCheckFixtureTextsSelfHostProbe,
  ElabMeetNamedHostModuleCheckFixtureTextsEmitProbe,
  ElabMeetNamedHostModuleCheckFixturesProbe,
  ElabMeetNamedHostModuleCheckSurfaceProbe,
  ElabMeetNamedHostModuleCheckCheckersProbe,
  ElabMeetNamedHostModuleCheckCheckersLaterProbe,
  ElabMeetNamedHostModuleCheckRealModuleProbe,
  ElabMeetNamedWalkHostImportGraphWalkLater, or
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostModuleCheckEmitBodyTerm subset (forty-one named members):
    prior forty plus SystemsLean.HostModuleCheckEmitBodyTerm last.
    Membership list is barrel order among the forty-one; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the fortieth compile order, then HostModuleCheckEmitBodyTerm last.
    EmitPlanTerm and MultTerm are compile dependencies only.
    Forty-one-name walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckCheckersLater.
    Forty-first HostModuleCheckEmitBodyTerm probe lives here.
  - tryCompileNamedHostModuleCheckEmitBodyTermSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Forty-one-name HostModuleCheckEmitBodyTerm bad writes a temp
    HostModuleCheckEmitBodyTerm copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater / HostModuleCheckFixtureTexts /
    HostModuleCheckFixtureTextsProduct / HostModuleCheckFixtureTextsLater /
    HostModuleCheckFixtureTextsSelfHost /
    HostModuleCheckFixtureTextsEmit /
    HostModuleCheckFixtures /
    HostModuleCheckSurface /
    HostModuleCheckCheckers /
    HostModuleCheckCheckersLater /
    HostModuleCheckRealModule oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior forty-module walker
    tryCompileNamedHostModuleCheckRealModuleSubset, and that this walk
    is not an alias of the fortieth. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckEmitBodyTerm.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckEmitBodyTermPath,
  namedClosedHostModuleCheckEmitBodyTermSubsetNames,
  namedClosedHostModuleCheckEmitBodyTermCompileOrder,
  barrelListsNamedHostModuleCheckEmitBodyTermSubset,
  tryCompileNamedHostModuleCheckEmitBodyTermSubset,
  tryCompileAfterHostModuleCheckEmitBodyTermDeps,
  elabMeetDrivesNamedHostModuleCheckEmitBodyTermSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckEmitBodyTermSubset,
  elabMeetRejectsBadNamedHostModuleCheckEmitBodyTermSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitBodyTermSubset,
  #elabMeetNamedHostModuleCheckEmitBodyTermSubsetProbe,
  elabMeetNamedHostModuleCheckEmitBodyTermSubsetProbe,
  SystemsLean.HostModuleCheckEmitBodyTerm,
  ElabMeetNamedHostModuleCheckEmitBodyTermProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckEmitBodyTermProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckEmitBodyTermProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckEmitBodyTermProbe;
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
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCheckersLater

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckEmitBodyTerm named subset.
    Good compiles live Mult through HostModuleCheckRealModule plus the
    subset-surface compile closure and HostModuleCheckEmitBodyTerm after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckEmitBodyTerm copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater / HostModuleCheckFixtureTexts /
    HostModuleCheckFixtureTextsProduct / HostModuleCheckFixtureTextsLater /
    HostModuleCheckFixtureTextsSelfHost /
    HostModuleCheckFixtureTextsEmit /
    HostModuleCheckFixtures /
    HostModuleCheckSurface /
    HostModuleCheckCheckers /
    HostModuleCheckCheckersLater /
    HostModuleCheckRealModule oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior forty-module walker
    tryCompileNamedHostModuleCheckRealModuleSubset still works; this
    walker is not an alias of the fortieth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckEmitBodyTerm.lean. -/
elab "#elabMeetNamedHostModuleCheckEmitBodyTermSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckEmitBodyTerm? <-
    liftIO findLiveHostModuleCheckEmitBodyTermPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckEmitBodyTermSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckEmitBodyTerm? with
    | none =>
      pure true
    | some liveHostModuleCheckEmitBodyTerm => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckEmitBodyTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckEmitBodyTermSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckEmitBodyTermDeps
        badPath badDir `ElabMeetNamedHostModuleCheckEmitBodyTermSubsetBad
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
      tryCompileNamedHostModuleCheckRealModuleSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckEmitBodyTermSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckEmitBodyTermSubset fakeLake fakeDir
  let notAliasOfFortieth :=
    namedClosedHostModuleCheckEmitBodyTermSubsetNames
      != namedClosedHostModuleCheckRealModuleSubsetNames
      && namedClosedHostModuleCheckEmitBodyTermCompileOrder
           != namedClosedHostModuleCheckRealModuleCompileOrder
      && namedClosedHostModuleCheckEmitBodyTermSubsetNames.contains
           "SystemsLean.HostModuleCheckEmitBodyTerm"
      && !namedClosedHostModuleCheckRealModuleSubsetNames.contains
           "SystemsLean.HostModuleCheckEmitBodyTerm"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfFortieth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckEmitBodyTermSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckEmitBodyTermSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitBodyTermSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckEmitBodyTermSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckEmitBodyTermSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckEmitBodyTermSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckEmitBodyTermSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitBodyTermSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckEmitBodyTermSubset = true := rfl

end SystemsLean.ElabMeet
