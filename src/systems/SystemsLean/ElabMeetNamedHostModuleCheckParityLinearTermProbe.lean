/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckParityLinearTerm named
  closed subset probe (plus-one after the ParityMultTerm closed set).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. ParityLinearTerm wrappers live in
  ElabMeetNamedWalkHostModuleCheckParityLinearTerm. Shared helpers stay in
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
  ElabMeetNamedHostModuleCheckKernelMultTermProbe,
  ElabMeetNamedHostModuleCheckKernelLinearTermProbe,
  ElabMeetNamedHostModuleCheckKernelTypesTermProbe,
  ElabMeetNamedHostModuleCheckKernelProgramTermProbe,
  ElabMeetNamedHostModuleCheckKernelEmitTermProbe,
  ElabMeetNamedHostModuleCheckParityMultTermProbe,
  ElabMeetNamedWalkHostImportGraphWalkLater,
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit,
  ElabMeetNamedWalkHostModuleCheckCheckersLater,
  ElabMeetNamedWalkHostModuleCheckKernelMultTerm,
  ElabMeetNamedWalkHostModuleCheckKernelLinearTerm,
  ElabMeetNamedWalkHostModuleCheckKernelTypesTerm,
  ElabMeetNamedWalkHostModuleCheckKernelProgramTerm,
  ElabMeetNamedWalkHostModuleCheckKernelEmitTerm, or
  ElabMeetNamedWalkHostModuleCheckParityMultTerm.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Rec-depth 8192 keep on the ElabMeet fold.

  Spec (readable):
  - Named HostModuleCheckParityLinearTerm subset:
    prior ParityMultTerm closed set plus
    SystemsLean.HostModuleCheckParityLinearTerm last.
    Membership list is barrel order among that closed set; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the ParityMultTerm compile order, then HostModuleCheckParityLinearTerm last.
    EmitPlanTerm is a compile dependency only, not a named plus-one.
    Dispatcher-split honesty (same as ParityMultTerm): ParityLinearTerm
    imports HostModuleCheckSurface and HostModuleCheckEmitPlanTerm;
    EmitPlanTerm is not a barrel member and is not a named plus-one.
    ParityLinearTerm walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckParityLinearTerm.
    HostModuleCheckParityLinearTerm probe lives here.
  - tryCompileNamedHostModuleCheckParityLinearTermSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    HostModuleCheckParityLinearTerm bad writes a temp
    HostModuleCheckParityLinearTerm copy and compiles it after Mult and the
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
    HostModuleCheckEmitBodyTerm /
    HostModuleCheckKernelMultTerm /
    HostModuleCheckKernelLinearTerm /
    HostModuleCheckKernelTypesTerm /
    HostModuleCheckKernelProgramTerm /
    HostModuleCheckKernelEmitTerm /
    HostModuleCheckParityMultTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior ParityMultTerm walker
    tryCompileNamedHostModuleCheckParityMultTermSubset, and that this walk
    is not an alias of the ParityMultTerm closed set. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckParityLinearTerm.lean. Do not skip to
    HostModuleCheckParityTypesTerm.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 49. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckParityLinearTermPath,
  namedClosedHostModuleCheckParityLinearTermSubsetNames,
  namedClosedHostModuleCheckParityLinearTermCompileOrder,
  barrelListsNamedHostModuleCheckParityLinearTermSubset,
  tryCompileNamedHostModuleCheckParityLinearTermSubset,
  tryCompileAfterHostModuleCheckParityLinearTermDeps,
  elabMeetDrivesNamedHostModuleCheckParityLinearTermSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckParityLinearTermSubset,
  elabMeetRejectsBadNamedHostModuleCheckParityLinearTermSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckParityLinearTermSubset,
  #elabMeetNamedHostModuleCheckParityLinearTermSubsetProbe,
  elabMeetNamedHostModuleCheckParityLinearTermSubsetProbe,
  SystemsLean.HostModuleCheckParityLinearTerm,
  ElabMeetNamedHostModuleCheckParityLinearTermProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckParityLinearTermProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckParityLinearTermProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckParityLinearTermProbe;
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
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelLinearTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelTypesTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelProgramTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityMultTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityLinearTerm

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckParityLinearTerm named subset.
    Good compiles live Mult through HostModuleCheckParityMultTerm plus the
    subset-surface compile closure and HostModuleCheckParityLinearTerm after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckParityLinearTerm copy with a planted type error after Mult
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
    HostModuleCheckEmitBodyTerm /
    HostModuleCheckKernelMultTerm /
    HostModuleCheckKernelLinearTerm /
    HostModuleCheckKernelTypesTerm /
    HostModuleCheckKernelProgramTerm /
    HostModuleCheckKernelEmitTerm /
    HostModuleCheckParityMultTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior ParityMultTerm walker
    tryCompileNamedHostModuleCheckParityMultTermSubset still works; this
    walker is not an alias of the ParityMultTerm closed set. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckParityLinearTerm.lean. -/
elab "#elabMeetNamedHostModuleCheckParityLinearTermSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckParityLinearTerm? <-
    liftIO findLiveHostModuleCheckParityLinearTermPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckParityLinearTermSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckParityLinearTerm? with
    | none =>
      pure true
    | some liveHostModuleCheckParityLinearTerm => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckParityLinearTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckParityLinearTermSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckParityLinearTermDeps
        badPath badDir `ElabMeetNamedHostModuleCheckParityLinearTermSubsetBad
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
      tryCompileNamedHostModuleCheckParityMultTermSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckParityLinearTermSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckParityLinearTermSubset fakeLake fakeDir
  let notAliasOfParityMultTerm :=
    namedClosedHostModuleCheckParityLinearTermSubsetNames
      != namedClosedHostModuleCheckParityMultTermSubsetNames
      && namedClosedHostModuleCheckParityLinearTermCompileOrder
           != namedClosedHostModuleCheckParityMultTermCompileOrder
      && namedClosedHostModuleCheckParityLinearTermSubsetNames.contains
           "SystemsLean.HostModuleCheckParityLinearTerm"
      && !namedClosedHostModuleCheckParityMultTermSubsetNames.contains
           "SystemsLean.HostModuleCheckParityLinearTerm"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfParityMultTerm
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckParityLinearTermSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckParityLinearTermSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckParityLinearTermSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckParityLinearTermSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckParityLinearTermSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckParityLinearTermSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckParityLinearTermSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckParityLinearTermSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckParityLinearTermSubset = true := rfl

end SystemsLean.ElabMeet
