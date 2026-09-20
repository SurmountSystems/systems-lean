/-
  SYSTEMS_LEAN_HOST partial -- thirty-second HostModuleCheckFixtureTextsProduct named
  closed subset probe.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Thirty-second wrappers live in
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
  ElabMeetNamedHostModuleCheckRequiredDeclsLaterProbe,
  ElabMeetNamedHostModuleCheckFixtureTextsProbe,
  ElabMeetNamedHostModuleCheckFixtureTextsLaterProbe,
  ElabMeetNamedHostModuleCheckFixtureTextsSelfHostProbe, or
  ElabMeetNamedWalkHostImportGraphWalkLater.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Named HostModuleCheckFixtureTextsProduct subset (thirty-two named members):
    prior thirty-one plus SystemsLean.HostModuleCheckFixtureTextsProduct last.
    Membership list is barrel order among the thirty-two; skip
    Linear, skip IrGraph, skip HostGraphMain. Compile order is
    the thirty-first compile order, then HostModuleCheckFixtureTextsProduct last.
    IrGraph and HostCompose are compile dependencies only.
    Thirty-two-name walker is a wrapper in
    ElabMeetNamedWalkHostModuleCheckFixtureTexts.
    Thirty-second HostModuleCheckFixtureTextsProduct probe lives here.
  - tryCompileNamedHostModuleCheckFixtureTextsProductSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Thirty-two-name HostModuleCheckFixtureTextsProduct bad writes a temp
    HostModuleCheckFixtureTextsProduct copy and compiles it after Mult and the
    HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater / HostModuleCheckFixtureTexts oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior thirty-one-module walker
    tryCompileNamedHostModuleCheckFixtureTextsSubset, and that this walk
    is not an alias of the thirty-first. Linear skipped. IrGraph
    skipped as a grow-tip Name. Do not plant live
    HostModuleCheckFixtureTextsProduct.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckFixtureTextsProductPath,
  namedClosedHostModuleCheckFixtureTextsProductSubsetNames,
  namedClosedHostModuleCheckFixtureTextsProductCompileOrder,
  barrelListsNamedHostModuleCheckFixtureTextsProductSubset,
  tryCompileNamedHostModuleCheckFixtureTextsProductSubset,
  tryCompileAfterHostModuleCheckFixtureTextsProductDeps,
  elabMeetDrivesNamedHostModuleCheckFixtureTextsProductSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsProductSubset,
  elabMeetRejectsBadNamedHostModuleCheckFixtureTextsProductSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsProductSubset,
  #elabMeetNamedHostModuleCheckFixtureTextsProductSubsetProbe,
  elabMeetNamedHostModuleCheckFixtureTextsProductSubsetProbe,
  SystemsLean.HostModuleCheckFixtureTextsProduct,
  ElabMeetNamedHostModuleCheckFixtureTextsProductProbe,
  SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsProductProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsProductProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedHostModuleCheckFixtureTextsProductProbe;
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

/-- Record accept / reject for the HostModuleCheckFixtureTextsProduct named subset.
    Good compiles live Mult through HostModuleCheckFixtureTexts plus the
    subset-emit compile closure and HostModuleCheckFixtureTextsProduct after
    reading the real lakefile. Bad compiles a temp
    HostModuleCheckFixtureTextsProduct copy with a planted type error after Mult
    and the HostFront / HostGraph / SubsetEmit / HostPackageWrite /
    HostPackageWriteTheorems / HostPackageRoots /
    HostImportGraphSeeds / HostImportGraphModel / HostImportGraphMods /
    HostImportGraphModsLater / HostImportGraphLoadOkLater /
    HostImportGraphWalkLater / HostImportGraphWalk /
    HostModuleCheckRequiredDecls / HostModuleCheckRequiredDeclsProduct /
    HostModuleCheckRequiredDeclsLater / HostModuleCheckFixtureTexts oleans.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; the prior thirty-one-module walker
    tryCompileNamedHostModuleCheckFixtureTextsSubset still works; this
    walker is not an alias of the thirty-first. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not
    plant live HostModuleCheckFixtureTextsProduct.lean. -/
def elabMeetRunNamedHostModuleCheckFixtureTextsProductSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostModuleCheckFixtureTextsProduct? <-
    liftIO findLiveHostModuleCheckFixtureTextsProductPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckFixtureTextsProductSubset liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckFixtureTextsProduct? with
    | none =>
      pure true
    | some liveHostModuleCheckFixtureTextsProduct => do
      let liveText <- liftIO (IO.FS.readFile liveHostModuleCheckFixtureTextsProduct)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckFixtureTextsProductSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckFixtureTextsProductDeps
        badPath badDir `ElabMeetNamedHostModuleCheckFixtureTextsProductSubsetBad
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
      tryCompileNamedHostModuleCheckFixtureTextsSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckFixtureTextsProductSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckFixtureTextsProductSubset fakeLake fakeDir
  let notAliasOfThirtyFirst :=
    namedClosedHostModuleCheckFixtureTextsProductSubsetNames
      != namedClosedHostModuleCheckFixtureTextsSubsetNames
      && namedClosedHostModuleCheckFixtureTextsProductCompileOrder
           != namedClosedHostModuleCheckFixtureTextsCompileOrder
      && namedClosedHostModuleCheckFixtureTextsProductSubsetNames.contains
           "SystemsLean.HostModuleCheckFixtureTextsProduct"
      && !namedClosedHostModuleCheckFixtureTextsSubsetNames.contains
           "SystemsLean.HostModuleCheckFixtureTextsProduct"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfThirtyFirst
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsProductSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostModuleCheckFixtureTextsProductSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsProductSubset
  let dN := mkIdent `elabMeetDrivesNamedHostModuleCheckFixtureTextsProductSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostModuleCheckFixtureTextsProductSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsProductSubset
      `elabMeetRejectsBadNamedHostModuleCheckFixtureTextsProductSubset
      `elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsProductSubset
      `elabMeetDrivesNamedHostModuleCheckFixtureTextsProductSubset
  else
    elabMeetRunNamedHostModuleCheckFixtureTextsProductSubsetProbe

#elabMeetNamedHostModuleCheckFixtureTextsProductSubsetProbe

example : elabMeetAcceptsGoodNamedHostModuleCheckFixtureTextsProductSubset = true := rfl
example : elabMeetRejectsBadNamedHostModuleCheckFixtureTextsProductSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostModuleCheckFixtureTextsProductSubset = true := rfl
example : elabMeetDrivesNamedHostModuleCheckFixtureTextsProductSubset = true := rfl

end SystemsLean.ElabMeet
