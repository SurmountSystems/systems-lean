/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckKernelEmitTerm named
  closed subset probe (plus-one after the KernelProgramTerm closed set).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. KernelEmitTerm wrappers live in
  ElabMeetNamedWalkHostModuleCheckKernelEmitTerm. Shared helpers stay in
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
  ElabMeetNamedWalkHostImportGraphWalkLater,
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit,
  ElabMeetNamedWalkHostModuleCheckCheckersLater,
  ElabMeetNamedWalkHostModuleCheckKernelMultTerm,
  ElabMeetNamedWalkHostModuleCheckKernelLinearTerm,
  ElabMeetNamedWalkHostModuleCheckKernelTypesTerm, or
  ElabMeetNamedWalkHostModuleCheckKernelProgramTerm.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - Named HostModuleCheckKernelEmitTerm subset:
    prior KernelProgramTerm closed set plus
    SystemsLean.HostModuleCheckKernelEmitTerm last.
    Membership list is barrel order among that closed set; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the KernelProgramTerm compile order, then HostModuleCheckKernelEmitTerm last.
    EmitPlanTerm is a compile dependency only, not a named plus-one.
    KernelEmitTerm walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckKernelEmitTerm.
    HostModuleCheckKernelEmitTerm probe lives here.
  - tryCompileNamedHostModuleCheckKernelEmitTermSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    HostModuleCheckKernelEmitTerm bad writes a temp
    HostModuleCheckKernelEmitTerm copy and compiles it after Mult and the
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
    HostModuleCheckKernelProgramTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior KernelProgramTerm walker
    tryCompileNamedHostModuleCheckKernelProgramTermSubset, and that this walk
    is not an alias of the KernelProgramTerm closed set. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckKernelEmitTerm.lean. Do not skip to
    HostModuleCheckParityMultTerm.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 42 or 43 or 44 or 45 or 46.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckKernelEmitTermPath,
  namedClosedHostModuleCheckKernelEmitTermSubsetNames,
  namedClosedHostModuleCheckKernelEmitTermCompileOrder,
  barrelListsNamedHostModuleCheckKernelEmitTermSubset,
  tryCompileNamedHostModuleCheckKernelEmitTermSubset,
  tryCompileAfterHostModuleCheckKernelEmitTermDeps,
  elabMeetDrivesNamedHostModuleCheckKernelEmitTermSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckKernelEmitTermSubset,
  elabMeetRejectsBadNamedHostModuleCheckKernelEmitTermSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelEmitTermSubset,
  #elabMeetNamedHostModuleCheckKernelEmitTermSubsetProbe,
  elabMeetNamedHostModuleCheckKernelEmitTermSubsetProbe,
  SystemsLean.HostModuleCheckKernelEmitTerm,
  ElabMeetNamedHostModuleCheckKernelEmitTermProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckKernelEmitTermProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckKernelEmitTermProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckKernelEmitTermProbe;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckKernelEmitTerm named subset.
    Good compiles live Mult through HostModuleCheckKernelProgramTerm plus the
    subset-surface compile closure and HostModuleCheckKernelEmitTerm after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckKernelEmitTerm copy with a planted type error after Mult
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
    HostModuleCheckKernelProgramTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior KernelProgramTerm walker
    tryCompileNamedHostModuleCheckKernelProgramTermSubset still works; this
    walker is not an alias of the KernelProgramTerm closed set. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckKernelEmitTerm.lean. -/
elab "#elabMeetNamedHostModuleCheckKernelEmitTermSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckKernelEmitTerm? <-
    liftIO findLiveHostModuleCheckKernelEmitTermPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckKernelEmitTermSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckKernelEmitTerm? with
    | none =>
      pure true
    | some liveHostModuleCheckKernelEmitTerm => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckKernelEmitTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckKernelEmitTermSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckKernelEmitTermDeps
        badPath badDir `ElabMeetNamedHostModuleCheckKernelEmitTermSubsetBad
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
      tryCompileNamedHostModuleCheckKernelProgramTermSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckKernelEmitTermSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckKernelEmitTermSubset fakeLake fakeDir
  let notAliasOfKernelProgramTerm :=
    namedClosedHostModuleCheckKernelEmitTermSubsetNames
      != namedClosedHostModuleCheckKernelProgramTermSubsetNames
      && namedClosedHostModuleCheckKernelEmitTermCompileOrder
           != namedClosedHostModuleCheckKernelProgramTermCompileOrder
      && namedClosedHostModuleCheckKernelEmitTermSubsetNames.contains
           "SystemsLean.HostModuleCheckKernelEmitTerm"
      && !namedClosedHostModuleCheckKernelProgramTermSubsetNames.contains
           "SystemsLean.HostModuleCheckKernelEmitTerm"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfKernelProgramTerm
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckKernelEmitTermSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckKernelEmitTermSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelEmitTermSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckKernelEmitTermSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckKernelEmitTermSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckKernelEmitTermSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckKernelEmitTermSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelEmitTermSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckKernelEmitTermSubset = true := rfl

end SystemsLean.ElabMeet
