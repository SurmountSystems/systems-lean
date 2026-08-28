/-
  SYSTEMS_LEAN_HOST partial -- forty-second HostModuleCheckKernelMultTerm named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Forty-second wrappers live in
  ElabMeetNamedWalkHostModuleCheckKernelMultTerm. Shared helpers stay in
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
  ElabMeetNamedHostModuleCheckEmitBodyTermProbe,
  ElabMeetNamedWalkHostImportGraphWalkLater,
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit, or
  ElabMeetNamedWalkHostModuleCheckCheckersLater.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostModuleCheckKernelMultTerm subset (forty-two named members):
    prior forty-one plus SystemsLean.HostModuleCheckKernelMultTerm last.
    Membership list is barrel order among the forty-two; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the forty-first compile order, then HostModuleCheckKernelMultTerm last.
    EmitPlanTerm is a compile dependency only, not a named plus-one.
    Forty-two-name walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckKernelMultTerm.
    Forty-second HostModuleCheckKernelMultTerm probe lives here.
  - tryCompileNamedHostModuleCheckKernelMultTermSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Forty-two-name HostModuleCheckKernelMultTerm bad writes a temp
    HostModuleCheckKernelMultTerm copy and compiles it after Mult and the
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
    HostModuleCheckRealModule /
    HostModuleCheckEmitBodyTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior forty-one-module walker
    tryCompileNamedHostModuleCheckEmitBodyTermSubset, and that this walk
    is not an alias of the forty-first. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckKernelMultTerm.lean. Do not skip to
    HostModuleCheckKernelLinearTerm.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckKernelMultTermPath,
  namedClosedHostModuleCheckKernelMultTermSubsetNames,
  namedClosedHostModuleCheckKernelMultTermCompileOrder,
  barrelListsNamedHostModuleCheckKernelMultTermSubset,
  tryCompileNamedHostModuleCheckKernelMultTermSubset,
  tryCompileAfterHostModuleCheckKernelMultTermDeps,
  elabMeetDrivesNamedHostModuleCheckKernelMultTermSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckKernelMultTermSubset,
  elabMeetRejectsBadNamedHostModuleCheckKernelMultTermSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelMultTermSubset,
  #elabMeetNamedHostModuleCheckKernelMultTermSubsetProbe,
  elabMeetNamedHostModuleCheckKernelMultTermSubsetProbe,
  SystemsLean.HostModuleCheckKernelMultTerm,
  ElabMeetNamedHostModuleCheckKernelMultTermProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckKernelMultTermProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckKernelMultTermProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckKernelMultTermProbe;
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
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelMultTerm

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckKernelMultTerm named subset.
    Good compiles live Mult through HostModuleCheckEmitBodyTerm plus the
    subset-surface compile closure and HostModuleCheckKernelMultTerm after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckKernelMultTerm copy with a planted type error after Mult
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
    HostModuleCheckRealModule /
    HostModuleCheckEmitBodyTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior forty-one-module walker
    tryCompileNamedHostModuleCheckEmitBodyTermSubset still works; this
    walker is not an alias of the forty-first. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckKernelMultTerm.lean. -/
elab "#elabMeetNamedHostModuleCheckKernelMultTermSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckKernelMultTerm? <-
    liftIO findLiveHostModuleCheckKernelMultTermPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckKernelMultTermSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckKernelMultTerm? with
    | none =>
      pure true
    | some liveHostModuleCheckKernelMultTerm => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckKernelMultTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckKernelMultTermSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckKernelMultTermDeps
        badPath badDir `ElabMeetNamedHostModuleCheckKernelMultTermSubsetBad
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
      tryCompileNamedHostModuleCheckEmitBodyTermSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckKernelMultTermSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckKernelMultTermSubset fakeLake fakeDir
  let notAliasOfFortyFirst :=
    namedClosedHostModuleCheckKernelMultTermSubsetNames
      != namedClosedHostModuleCheckEmitBodyTermSubsetNames
      && namedClosedHostModuleCheckKernelMultTermCompileOrder
           != namedClosedHostModuleCheckEmitBodyTermCompileOrder
      && namedClosedHostModuleCheckKernelMultTermSubsetNames.contains
           "SystemsLean.HostModuleCheckKernelMultTerm"
      && !namedClosedHostModuleCheckEmitBodyTermSubsetNames.contains
           "SystemsLean.HostModuleCheckKernelMultTerm"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfFortyFirst
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckKernelMultTermSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckKernelMultTermSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelMultTermSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckKernelMultTermSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckKernelMultTermSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckKernelMultTermSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckKernelMultTermSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelMultTermSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckKernelMultTermSubset = true := rfl

end SystemsLean.ElabMeet
