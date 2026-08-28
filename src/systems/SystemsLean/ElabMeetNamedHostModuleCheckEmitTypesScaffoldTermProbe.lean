/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckEmitTypesScaffoldTerm named
  closed subset probe (plus-one after the EmitLinearScaffoldTerm closed set).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. EmitTypesScaffoldTerm wrappers live in
  ElabMeetNamedWalkHostModuleCheckEmitTypesScaffoldTerm. Shared helpers stay in
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
  ElabMeetNamedHostModuleCheckParityProgramTermProbe,
  ElabMeetNamedHostModuleCheckParityEmitTermProbe,
  ElabMeetNamedHostModuleCheckEmitMultScaffoldTermProbe,
  ElabMeetNamedHostModuleCheckEmitLinearScaffoldTermProbe,
  ElabMeetNamedWalkHostImportGraphWalkLater,
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit,
  ElabMeetNamedWalkHostModuleCheckCheckersLater,
  ElabMeetNamedWalkHostModuleCheckKernelMultTerm,
  ElabMeetNamedWalkHostModuleCheckKernelLinearTerm,
  ElabMeetNamedWalkHostModuleCheckKernelTypesTerm,
  ElabMeetNamedWalkHostModuleCheckKernelProgramTerm,
  ElabMeetNamedWalkHostModuleCheckKernelEmitTerm,
  ElabMeetNamedWalkHostModuleCheckParityMultTerm,
  ElabMeetNamedWalkHostModuleCheckParityLinearTerm,
  ElabMeetNamedWalkHostModuleCheckParityTypesTerm,
  ElabMeetNamedWalkHostModuleCheckParityProgramTerm,
  ElabMeetNamedWalkHostModuleCheckParityEmitTerm,
  ElabMeetNamedWalkHostModuleCheckEmitMultScaffoldTerm, or
  ElabMeetNamedWalkHostModuleCheckEmitLinearScaffoldTerm.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - Named HostModuleCheckEmitTypesScaffoldTerm subset:
    prior EmitLinearScaffoldTerm closed set plus
    SystemsLean.HostModuleCheckEmitTypesScaffoldTerm last.
    Membership list is barrel order among that closed set; skip
    Linear, skip IrGraph, skip HostGraphMain, skip HostCompose. Compile order is
    the EmitLinearScaffoldTerm compile order, then HostModuleCheckEmitTypesScaffoldTerm last.
    EmitPlanTerm is a compile dependency only, not a named plus-one.
    Dispatcher-split honesty (same as EmitLinearScaffoldTerm): EmitTypesScaffoldTerm
    imports HostModuleCheckSurface and HostModuleCheckEmitPlanTerm;
    EmitPlanTerm is not a barrel member and is not a named plus-one.
    EmitTypesScaffoldTerm walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckEmitTypesScaffoldTerm.
    HostModuleCheckEmitTypesScaffoldTerm probe lives here.
  - tryCompileNamedHostModuleCheckEmitTypesScaffoldTermSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    HostModuleCheckEmitTypesScaffoldTerm bad writes a temp
    HostModuleCheckEmitTypesScaffoldTerm copy and compiles it after Mult and the
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
    HostModuleCheckParityTypesTerm /
    HostModuleCheckParityProgramTerm /
    HostModuleCheckParityEmitTerm /
    HostModuleCheckEmitMultScaffoldTerm /
    HostModuleCheckEmitLinearScaffoldTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior EmitLinearScaffoldTerm walker
    tryCompileNamedHostModuleCheckEmitLinearScaffoldTermSubset, and that this walk
    is not an alias of the EmitLinearScaffoldTerm closed set. Linear skipped. IrGraph
    skipped as a grow-tip Name. HostCompose skipped. Do not plant live
    HostModuleCheckEmitTypesScaffoldTerm.lean. Do not skip to
    HostModuleCheckEmitProgramScaffoldTerm.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47. Living tip stays 46 of about 206 until ParityMult fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckEmitTypesScaffoldTermPath,
  namedClosedHostModuleCheckEmitTypesScaffoldTermSubsetNames,
  namedClosedHostModuleCheckEmitTypesScaffoldTermCompileOrder,
  barrelListsNamedHostModuleCheckEmitTypesScaffoldTermSubset,
  tryCompileNamedHostModuleCheckEmitTypesScaffoldTermSubset,
  tryCompileAfterHostModuleCheckEmitTypesScaffoldTermDeps,
  elabMeetDrivesNamedHostModuleCheckEmitTypesScaffoldTermSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckEmitTypesScaffoldTermSubset,
  elabMeetRejectsBadNamedHostModuleCheckEmitTypesScaffoldTermSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitTypesScaffoldTermSubset,
  #elabMeetNamedHostModuleCheckEmitTypesScaffoldTermSubsetProbe,
  elabMeetNamedHostModuleCheckEmitTypesScaffoldTermSubsetProbe,
  SystemsLean.HostModuleCheckEmitTypesScaffoldTerm,
  ElabMeetNamedHostModuleCheckEmitTypesScaffoldTermProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckEmitTypesScaffoldTermProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckEmitTypesScaffoldTermProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckEmitTypesScaffoldTermProbe;
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
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitMultScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitLinearScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitTypesScaffoldTerm

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckEmitTypesScaffoldTerm named subset.
    Good compiles live Mult through HostModuleCheckEmitLinearScaffoldTerm plus the
    subset-surface compile closure and HostModuleCheckEmitTypesScaffoldTerm after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckEmitTypesScaffoldTerm copy with a planted type error after Mult
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
    HostModuleCheckParityTypesTerm /
    HostModuleCheckParityProgramTerm /
    HostModuleCheckParityEmitTerm /
    HostModuleCheckEmitMultScaffoldTerm /
    HostModuleCheckEmitLinearScaffoldTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior EmitLinearScaffoldTerm walker
    tryCompileNamedHostModuleCheckEmitLinearScaffoldTermSubset still works; this
    walker is not an alias of the EmitLinearScaffoldTerm closed set. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. HostCompose skipped.
    Do not plant live HostModuleCheckEmitTypesScaffoldTerm.lean. Do not skip to
    HostModuleCheckEmitProgramScaffoldTerm. -/
elab "#elabMeetNamedHostModuleCheckEmitTypesScaffoldTermSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckEmitTypesScaffoldTerm? <-
    liftIO findLiveHostModuleCheckEmitTypesScaffoldTermPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckEmitTypesScaffoldTermSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckEmitTypesScaffoldTerm? with
    | none =>
      pure true
    | some liveHostModuleCheckEmitTypesScaffoldTerm => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckEmitTypesScaffoldTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckEmitTypesScaffoldTermSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckEmitTypesScaffoldTermDeps
        badPath badDir `ElabMeetNamedHostModuleCheckEmitTypesScaffoldTermSubsetBad
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
      tryCompileNamedHostModuleCheckEmitLinearScaffoldTermSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckEmitTypesScaffoldTermSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckEmitTypesScaffoldTermSubset fakeLake fakeDir
  let notAliasOfEmitLinearScaffoldTerm :=
    namedClosedHostModuleCheckEmitTypesScaffoldTermSubsetNames
      != namedClosedHostModuleCheckEmitLinearScaffoldTermSubsetNames
      && namedClosedHostModuleCheckEmitTypesScaffoldTermCompileOrder
           != namedClosedHostModuleCheckEmitLinearScaffoldTermCompileOrder
      && namedClosedHostModuleCheckEmitTypesScaffoldTermSubsetNames.contains
           "SystemsLean.HostModuleCheckEmitTypesScaffoldTerm"
      && !namedClosedHostModuleCheckEmitLinearScaffoldTermSubsetNames.contains
           "SystemsLean.HostModuleCheckEmitTypesScaffoldTerm"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfEmitLinearScaffoldTerm
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckEmitTypesScaffoldTermSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckEmitTypesScaffoldTermSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitTypesScaffoldTermSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckEmitTypesScaffoldTermSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckEmitTypesScaffoldTermSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckEmitTypesScaffoldTermSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckEmitTypesScaffoldTermSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckEmitTypesScaffoldTermSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckEmitTypesScaffoldTermSubset = true := rfl

end SystemsLean.ElabMeet
