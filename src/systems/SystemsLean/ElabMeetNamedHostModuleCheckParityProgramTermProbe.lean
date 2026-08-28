/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckParityProgramTerm named
  closed subset probe (plus-one after the ParityTypesTerm closed set).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. ParityProgramTerm wrappers live in
  ElabMeetNamedWalkHostModuleCheckParityProgramTerm. Shared helpers stay in
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
  ElabMeetNamedHostModuleCheckParityLinearTermProbe,
  ElabMeetNamedHostModuleCheckParityTypesTermProbe,
  ElabMeetNamedWalkHostImportGraphWalkLater,
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit,
  ElabMeetNamedWalkHostModuleCheckCheckersLater,
  ElabMeetNamedWalkHostModuleCheckKernelMultTerm,
  ElabMeetNamedWalkHostModuleCheckKernelLinearTerm,
  ElabMeetNamedWalkHostModuleCheckKernelTypesTerm,
  ElabMeetNamedWalkHostModuleCheckKernelProgramTerm,
  ElabMeetNamedWalkHostModuleCheckKernelEmitTerm,
  ElabMeetNamedWalkHostModuleCheckParityMultTerm,
  ElabMeetNamedWalkHostModuleCheckParityLinearTerm, or
  ElabMeetNamedWalkHostModuleCheckParityTypesTerm.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - Named HostModuleCheckParityProgramTerm subset:
    prior ParityTypesTerm closed set plus
    SystemsLean.HostModuleCheckParityProgramTerm last.
    Membership list is barrel order among that closed set; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the ParityTypesTerm compile order, then HostModuleCheckParityProgramTerm last.
    EmitPlanTerm is a compile dependency only, not a named plus-one.
    Dispatcher-split honesty (same as ParityTypesTerm): ParityProgramTerm
    imports HostModuleCheckSurface and HostModuleCheckEmitPlanTerm;
    EmitPlanTerm is not a barrel member and is not a named plus-one.
    ParityProgramTerm walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckParityProgramTerm.
    HostModuleCheckParityProgramTerm probe lives here.
  - tryCompileNamedHostModuleCheckParityProgramTermSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    HostModuleCheckParityProgramTerm bad writes a temp
    HostModuleCheckParityProgramTerm copy and compiles it after Mult and the
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
    HostModuleCheckParityMultTerm /
    HostModuleCheckParityLinearTerm /
    HostModuleCheckParityTypesTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior ParityTypesTerm walker
    tryCompileNamedHostModuleCheckParityTypesTermSubset, and that this walk
    is not an alias of the ParityTypesTerm closed set. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckParityProgramTerm.lean. Do not skip to
    HostModuleCheckParityEmitTerm.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47. Living tip stays 46 of about 206 until ParityMult fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckParityProgramTermPath,
  namedClosedHostModuleCheckParityProgramTermSubsetNames,
  namedClosedHostModuleCheckParityProgramTermCompileOrder,
  barrelListsNamedHostModuleCheckParityProgramTermSubset,
  tryCompileNamedHostModuleCheckParityProgramTermSubset,
  tryCompileAfterHostModuleCheckParityProgramTermDeps,
  elabMeetDrivesNamedHostModuleCheckParityProgramTermSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckParityProgramTermSubset,
  elabMeetRejectsBadNamedHostModuleCheckParityProgramTermSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckParityProgramTermSubset,
  #elabMeetNamedHostModuleCheckParityProgramTermSubsetProbe,
  elabMeetNamedHostModuleCheckParityProgramTermSubsetProbe,
  SystemsLean.HostModuleCheckParityProgramTerm,
  ElabMeetNamedHostModuleCheckParityProgramTermProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckParityProgramTermProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckParityProgramTermProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckParityProgramTermProbe;
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
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityTypesTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityProgramTerm

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckParityProgramTerm named subset.
    Good compiles live Mult through HostModuleCheckParityTypesTerm plus the
    subset-surface compile closure and HostModuleCheckParityProgramTerm after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckParityProgramTerm copy with a planted type error after Mult
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
    HostModuleCheckParityMultTerm /
    HostModuleCheckParityLinearTerm /
    HostModuleCheckParityTypesTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior ParityTypesTerm walker
    tryCompileNamedHostModuleCheckParityTypesTermSubset still works; this
    walker is not an alias of the ParityTypesTerm closed set. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckParityProgramTerm.lean. Do not skip to
    HostModuleCheckParityEmitTerm. -/
elab "#elabMeetNamedHostModuleCheckParityProgramTermSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckParityProgramTerm? <-
    liftIO findLiveHostModuleCheckParityProgramTermPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckParityProgramTermSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckParityProgramTerm? with
    | none =>
      pure true
    | some liveHostModuleCheckParityProgramTerm => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckParityProgramTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckParityProgramTermSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckParityProgramTermDeps
        badPath badDir `ElabMeetNamedHostModuleCheckParityProgramTermSubsetBad
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
      tryCompileNamedHostModuleCheckParityTypesTermSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckParityProgramTermSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckParityProgramTermSubset fakeLake fakeDir
  let notAliasOfParityTypesTerm :=
    namedClosedHostModuleCheckParityProgramTermSubsetNames
      != namedClosedHostModuleCheckParityTypesTermSubsetNames
      && namedClosedHostModuleCheckParityProgramTermCompileOrder
           != namedClosedHostModuleCheckParityTypesTermCompileOrder
      && namedClosedHostModuleCheckParityProgramTermSubsetNames.contains
           "SystemsLean.HostModuleCheckParityProgramTerm"
      && !namedClosedHostModuleCheckParityTypesTermSubsetNames.contains
           "SystemsLean.HostModuleCheckParityProgramTerm"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfParityTypesTerm
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckParityProgramTermSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckParityProgramTermSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckParityProgramTermSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckParityProgramTermSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckParityProgramTermSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckParityProgramTermSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckParityProgramTermSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckParityProgramTermSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckParityProgramTermSubset = true := rfl

end SystemsLean.ElabMeet
