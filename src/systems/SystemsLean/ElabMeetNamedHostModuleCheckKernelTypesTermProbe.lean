/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckKernelTypesTerm named
  closed subset probe (plus-one after the KernelLinearTerm closed set).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. KernelTypesTerm wrappers live in
  ElabMeetNamedWalkHostModuleCheckKernelTypesTerm. Shared helpers stay in
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
  ElabMeetNamedWalkHostImportGraphWalkLater,
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit,
  ElabMeetNamedWalkHostModuleCheckCheckersLater,
  ElabMeetNamedWalkHostModuleCheckKernelMultTerm, or
  ElabMeetNamedWalkHostModuleCheckKernelLinearTerm.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - Named HostModuleCheckKernelTypesTerm subset:
    prior KernelLinearTerm closed set plus
    SystemsLean.HostModuleCheckKernelTypesTerm last.
    Membership list is barrel order among that closed set; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the KernelLinearTerm compile order, then HostModuleCheckKernelTypesTerm last.
    EmitPlanTerm is a compile dependency only, not a named plus-one.
    KernelTypesTerm walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckKernelTypesTerm.
    HostModuleCheckKernelTypesTerm probe lives here.
  - tryCompileNamedHostModuleCheckKernelTypesTermSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    HostModuleCheckKernelTypesTerm bad writes a temp
    HostModuleCheckKernelTypesTerm copy and compiles it after Mult and the
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
    HostModuleCheckKernelLinearTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior KernelLinearTerm walker
    tryCompileNamedHostModuleCheckKernelLinearTermSubset, and that this walk
    is not an alias of the KernelLinearTerm closed set. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckKernelTypesTerm.lean. Do not skip to
    HostModuleCheckKernelProgramTerm.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 42 or 43 or 44.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckKernelTypesTermPath,
  namedClosedHostModuleCheckKernelTypesTermSubsetNames,
  namedClosedHostModuleCheckKernelTypesTermCompileOrder,
  barrelListsNamedHostModuleCheckKernelTypesTermSubset,
  tryCompileNamedHostModuleCheckKernelTypesTermSubset,
  tryCompileAfterHostModuleCheckKernelTypesTermDeps,
  elabMeetDrivesNamedHostModuleCheckKernelTypesTermSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckKernelTypesTermSubset,
  elabMeetRejectsBadNamedHostModuleCheckKernelTypesTermSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelTypesTermSubset,
  #elabMeetNamedHostModuleCheckKernelTypesTermSubsetProbe,
  elabMeetNamedHostModuleCheckKernelTypesTermSubsetProbe,
  SystemsLean.HostModuleCheckKernelTypesTerm,
  ElabMeetNamedHostModuleCheckKernelTypesTermProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckKernelTypesTermProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckKernelTypesTermProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckKernelTypesTermProbe;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckKernelTypesTerm named subset.
    Good compiles live Mult through HostModuleCheckKernelLinearTerm plus the
    subset-surface compile closure and HostModuleCheckKernelTypesTerm after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckKernelTypesTerm copy with a planted type error after Mult
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
    HostModuleCheckKernelLinearTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior KernelLinearTerm walker
    tryCompileNamedHostModuleCheckKernelLinearTermSubset still works; this
    walker is not an alias of the KernelLinearTerm closed set. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckKernelTypesTerm.lean. -/
def elabMeetRunNamedHostModuleCheckKernelTypesTermSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckKernelTypesTerm? <-
    liftIO findLiveHostModuleCheckKernelTypesTermPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckKernelTypesTermSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckKernelTypesTerm? with
    | none =>
      pure true
    | some liveHostModuleCheckKernelTypesTerm => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckKernelTypesTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckKernelTypesTermSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckKernelTypesTermDeps
        badPath badDir `ElabMeetNamedHostModuleCheckKernelTypesTermSubsetBad
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
      tryCompileNamedHostModuleCheckKernelLinearTermSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckKernelTypesTermSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckKernelTypesTermSubset fakeLake fakeDir
  let notAliasOfKernelLinearTerm :=
    namedClosedHostModuleCheckKernelTypesTermSubsetNames
      != namedClosedHostModuleCheckKernelLinearTermSubsetNames
      && namedClosedHostModuleCheckKernelTypesTermCompileOrder
           != namedClosedHostModuleCheckKernelLinearTermCompileOrder
      && namedClosedHostModuleCheckKernelTypesTermSubsetNames.contains
           "SystemsLean.HostModuleCheckKernelTypesTerm"
      && !namedClosedHostModuleCheckKernelLinearTermSubsetNames.contains
           "SystemsLean.HostModuleCheckKernelTypesTerm"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfKernelLinearTerm
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckKernelTypesTermSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckKernelTypesTermSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelTypesTermSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckKernelTypesTermSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostModuleCheckKernelTypesTermSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostModuleCheckKernelTypesTermSubset
      `elabMeetRejectsBadNamedHostModuleCheckKernelTypesTermSubset
      `elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelTypesTermSubset
      `elabMeetDrivesNamedHostModuleCheckKernelTypesTermSubset
  else
    elabMeetRunNamedHostModuleCheckKernelTypesTermSubsetProbe

#elabMeetNamedHostModuleCheckKernelTypesTermSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckKernelTypesTermSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckKernelTypesTermSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelTypesTermSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckKernelTypesTermSubset = true := rfl

end SystemsLean.ElabMeet
