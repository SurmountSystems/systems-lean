/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckKernelLinearTerm named
  closed subset probe (plus-one after the KernelMultTerm closed set).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. KernelLinearTerm wrappers live in
  ElabMeetNamedWalkHostModuleCheckKernelLinearTerm. Shared helpers stay in
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
  ElabMeetNamedWalkHostImportGraphWalkLater,
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit,
  ElabMeetNamedWalkHostModuleCheckCheckersLater, or
  ElabMeetNamedWalkHostModuleCheckKernelMultTerm.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - Named HostModuleCheckKernelLinearTerm subset:
    prior KernelMultTerm closed set plus
    SystemsLean.HostModuleCheckKernelLinearTerm last.
    Membership list is barrel order among that closed set; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the KernelMultTerm compile order, then HostModuleCheckKernelLinearTerm last.
    EmitPlanTerm is a compile dependency only, not a named plus-one.
    KernelLinearTerm walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckKernelLinearTerm.
    HostModuleCheckKernelLinearTerm probe lives here.
  - tryCompileNamedHostModuleCheckKernelLinearTermSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    HostModuleCheckKernelLinearTerm bad writes a temp
    HostModuleCheckKernelLinearTerm copy and compiles it after Mult and the
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
    HostModuleCheckKernelMultTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior KernelMultTerm walker
    tryCompileNamedHostModuleCheckKernelMultTermSubset, and that this walk
    is not an alias of the KernelMultTerm closed set. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckKernelLinearTerm.lean. Do not skip to
    HostModuleCheckKernelTypesTerm.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 42 or 43.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckKernelLinearTermPath,
  namedClosedHostModuleCheckKernelLinearTermSubsetNames,
  namedClosedHostModuleCheckKernelLinearTermCompileOrder,
  barrelListsNamedHostModuleCheckKernelLinearTermSubset,
  tryCompileNamedHostModuleCheckKernelLinearTermSubset,
  tryCompileAfterHostModuleCheckKernelLinearTermDeps,
  elabMeetDrivesNamedHostModuleCheckKernelLinearTermSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckKernelLinearTermSubset,
  elabMeetRejectsBadNamedHostModuleCheckKernelLinearTermSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelLinearTermSubset,
  #elabMeetNamedHostModuleCheckKernelLinearTermSubsetProbe,
  elabMeetNamedHostModuleCheckKernelLinearTermSubsetProbe,
  SystemsLean.HostModuleCheckKernelLinearTerm,
  ElabMeetNamedHostModuleCheckKernelLinearTermProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckKernelLinearTermProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckKernelLinearTermProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckKernelLinearTermProbe;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the HostModuleCheckKernelLinearTerm named subset.
    Good compiles live Mult through HostModuleCheckKernelMultTerm plus the
    subset-surface compile closure and HostModuleCheckKernelLinearTerm after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckKernelLinearTerm copy with a planted type error after Mult
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
    HostModuleCheckKernelMultTerm oleans, plus EmitPlanTerm and
    MultTerm compile deps.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior KernelMultTerm walker
    tryCompileNamedHostModuleCheckKernelMultTermSubset still works; this
    walker is not an alias of the KernelMultTerm closed set. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckKernelLinearTerm.lean. -/
def elabMeetRunNamedHostModuleCheckKernelLinearTermSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckKernelLinearTerm? <-
    liftIO findLiveHostModuleCheckKernelLinearTermPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckKernelLinearTermSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckKernelLinearTerm? with
    | none =>
      pure true
    | some liveHostModuleCheckKernelLinearTerm => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckKernelLinearTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckKernelLinearTermSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckKernelLinearTermDeps
        badPath badDir `ElabMeetNamedHostModuleCheckKernelLinearTermSubsetBad
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
      tryCompileNamedHostModuleCheckKernelMultTermSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckKernelLinearTermSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckKernelLinearTermSubset fakeLake fakeDir
  let notAliasOfKernelMultTerm :=
    namedClosedHostModuleCheckKernelLinearTermSubsetNames
      != namedClosedHostModuleCheckKernelMultTermSubsetNames
      && namedClosedHostModuleCheckKernelLinearTermCompileOrder
           != namedClosedHostModuleCheckKernelMultTermCompileOrder
      && namedClosedHostModuleCheckKernelLinearTermSubsetNames.contains
           "SystemsLean.HostModuleCheckKernelLinearTerm"
      && !namedClosedHostModuleCheckKernelMultTermSubsetNames.contains
           "SystemsLean.HostModuleCheckKernelLinearTerm"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfKernelMultTerm
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckKernelLinearTermSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckKernelLinearTermSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelLinearTermSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckKernelLinearTermSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostModuleCheckKernelLinearTermSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostModuleCheckKernelLinearTermSubset
      `elabMeetRejectsBadNamedHostModuleCheckKernelLinearTermSubset
      `elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelLinearTermSubset
      `elabMeetDrivesNamedHostModuleCheckKernelLinearTermSubset
  else
    elabMeetRunNamedHostModuleCheckKernelLinearTermSubsetProbe

#elabMeetNamedHostModuleCheckKernelLinearTermSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckKernelLinearTermSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckKernelLinearTermSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckKernelLinearTermSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckKernelLinearTermSubset = true := rfl

end SystemsLean.ElabMeet
