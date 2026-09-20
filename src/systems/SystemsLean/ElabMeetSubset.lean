/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet named closed subset from the real
  package description.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  New companion so ElabMeetLive and ElabMeetCompile stay under the line
  cap. Same namespace SystemsLean.ElabMeet. Named-walk helpers live
  in SystemsLean.ElabMeetNamedWalk. Three-through-nine wrappers
  live in ElabMeetNamedWalkLater. Leftover ExtractTheorems probe
  lives in ElabMeetNamedWalkLater. Leftover probes 3-6, leftover
  Extract, leftover IrProgram, and the tenth IrProgramTheorems
  wrapper live in ElabMeetNamedWalkTail. The eleventh HostTerm,
  twelfth HostFrontGoldens, and thirteenth HostFront wrappers
  live in ElabMeetNamedWalkHostTerm. Newer IrProgramTheorems,
  HostTerm, HostFrontGoldens, and HostFront probes live here.
  Reuses tryCompileOnDiskModuleIO (no second elaborator).

  Extract-first (about 880): do not add another leftover probe
  or leftover wrapper here, on ElabMeetNamedWalkLater, or on
  ElabMeetNamedWalkTail if that add would pass about 880.
  Extract more leftover first. NamedWalk may keep shared helpers.

  Spec (readable):
  - findLiveLakefilePath resolves lakefile.lean from Lake cwd
    (src/systems) or repo-root cwd. none if neither exists.
  - parseRealLakeLibraryName reads that live file and takes the
    single lean_lib Name. Two lean_lib lines are none. Comments
    and lean_exe lines are ignored. The real package names
    SystemsLean. A leftover richer temp description that names
    another library is not this accept.
  - findLiveBarrelPath resolves SystemsLean.lean the same way.
    barrelListsNamedSubset requires the barrel to import each
    named subset member.
  - Named closed subset (import-closed; compile Mult first):
    SystemsLean.Mult, SystemsLean.MultTheorems, SystemsLean.Types.
    Mult has no import lines. MultTheorems imports Mult. Types
    imports Mult. Linear does not import Mult; Types is the
    first extra live module that closes with Mult.
  - Named TypesTheorems closed subset (import-closed):
    SystemsLean.Mult, SystemsLean.MultTheorems, SystemsLean.Types,
    SystemsLean.TypesTheorems. TypesTheorems imports Mult,
    MultTheorems, and Types. Linear is not in this close.
    Compile Mult first, then Types, then MultTheorems, then
    TypesTheorems. Search path is pushed after Mult.
  - Named Erasure closed subset (import-closed):
    SystemsLean.Mult, SystemsLean.Types, SystemsLean.MultTheorems,
    SystemsLean.TypesTheorems, SystemsLean.Erasure. Membership
    list order is not compile order. Compile Mult first, then
    Types, MultTheorems, TypesTheorems, Erasure. Erasure
    imports only Mult. Linear and IrProgram are not in this
    close.
  - Named ErasureTheorems closed subset (import-closed):
    SystemsLean.Mult, SystemsLean.MultTheorems, SystemsLean.Types,
    SystemsLean.TypesTheorems, SystemsLean.Erasure,
    SystemsLean.ErasureTheorems. Membership list order is not
    compile order. Compile Mult first, then Types,
    MultTheorems, TypesTheorems, Erasure, ErasureTheorems.
    ErasureTheorems imports Mult and Erasure. Linear and
    IrProgram are not in this close.
  - Named Extract closed subset (import-closed):
    SystemsLean.Mult, SystemsLean.MultTheorems, SystemsLean.Types,
    SystemsLean.TypesTheorems, SystemsLean.Erasure,
    SystemsLean.ErasureTheorems, SystemsLean.Extract. Membership
    list order is not compile order. Compile Mult first, then
    Types, MultTheorems, TypesTheorems, Erasure,
    ErasureTheorems, Extract. Extract imports only Mult and
    Erasure. Linear and IrProgram are not in this close.
  - Named ExtractTheorems closed subset (import-closed):
    SystemsLean.Mult, SystemsLean.MultTheorems, SystemsLean.Types,
    SystemsLean.TypesTheorems, SystemsLean.Erasure,
    SystemsLean.ErasureTheorems, SystemsLean.Extract,
    SystemsLean.ExtractTheorems. Membership list order is not
    compile order. Compile Mult first, then Types,
    MultTheorems, TypesTheorems, Erasure, ErasureTheorems,
    Extract, ExtractTheorems. ExtractTheorems imports Mult,
    Erasure, and Extract. Linear and IrProgram are not in
    this close. Eight-module walker is a wrapper in
    ElabMeetNamedWalkLater. Leftover ExtractTheorems probe lives
    in ElabMeetNamedWalkLater.
  - Named IrProgram closed subset (import-closed):
    SystemsLean.Mult, SystemsLean.MultTheorems, SystemsLean.Types,
    SystemsLean.TypesTheorems, SystemsLean.IrProgram,
    SystemsLean.Erasure, SystemsLean.ErasureTheorems,
    SystemsLean.Extract, SystemsLean.ExtractTheorems.
    Membership list is barrel order among the nine; IrProgram
    after TypesTheorems. Compile Mult first, then Types,
    MultTheorems, TypesTheorems, Erasure, ErasureTheorems,
    Extract, ExtractTheorems, IrProgram last. IrProgram imports
    only Types. Linear is not in this close. Nine-module walker
    is a wrapper in ElabMeetNamedWalkLater. Leftover IrProgram
    probe lives in ElabMeetNamedWalkTail.
  - Named IrProgramTheorems closed subset (import-closed):
    SystemsLean.Mult, SystemsLean.MultTheorems, SystemsLean.Types,
    SystemsLean.TypesTheorems, SystemsLean.IrProgram,
    SystemsLean.IrProgramTheorems, SystemsLean.Erasure,
    SystemsLean.ErasureTheorems, SystemsLean.Extract,
    SystemsLean.ExtractTheorems.
    Membership list is barrel order among the ten; IrProgram
    after TypesTheorems, IrProgramTheorems after IrProgram.
    Compile order is distinct: Mult first, then Types,
    MultTheorems, TypesTheorems, Erasure, ErasureTheorems,
    Extract, ExtractTheorems, IrProgram, IrProgramTheorems last.
    IrProgramTheorems imports Mult, Types, and IrProgram.
    Linear is not in this close. Ten-module walker is a wrapper
    in ElabMeetNamedWalkTail.
  - Named HostTerm closed subset (import-closed):
    SystemsLean.Mult, SystemsLean.MultTheorems, SystemsLean.Types,
    SystemsLean.TypesTheorems, SystemsLean.IrProgram,
    SystemsLean.IrProgramTheorems, SystemsLean.Erasure,
    SystemsLean.ErasureTheorems, SystemsLean.Extract,
    SystemsLean.ExtractTheorems, SystemsLean.HostTerm.
    Membership list is barrel order among the eleven; skip
    Linear, skip IrGraph. HostTerm after ExtractTheorems.
    Compile order is distinct: prior ten compile order then
    HostTerm last. HostTerm imports only Mult. Eleven-module
    walker is a wrapper in ElabMeetNamedWalkHostTerm.
  - Name-list compile helper tryCompileNamedMemberListIO lives
    in ElabMeetNamedWalk. Three-module, four-module, five-module,
    six-module, seven-module, eight-module, and nine-module
    walkers are wrappers in ElabMeetNamedWalkLater. Ten-module
    walker is a wrapper in ElabMeetNamedWalkTail. Eleven-module,
    twelve-module, and thirteen-module walkers are wrappers in
    ElabMeetNamedWalkHostTerm.
    barrelListsNamedMembers checks membership. findLiveModulePath
    resolves each live SystemsLean/Foo.lean.
  - tryCompileNamedClosedSubset / tryCompileNamedTypesTheoremsSubset
    / tryCompileNamedErasureSubset / tryCompileNamedErasureTheoremsSubset
    / tryCompileNamedExtractSubset
    / tryCompileNamedExtractTheoremsSubset
    / tryCompileNamedIrProgramSubset
    / tryCompileNamedIrProgramTheoremsSubset
    / tryCompileNamedHostTermSubset
    / tryCompileNamedHostFrontGoldensSubset
    / tryCompileNamedHostFrontSubset
    are false unless the path is the live lakefile, the parsed
    library is SystemsLean, and the barrel lists the subset.
    Compiles live files only. .olean files go under a temp
    directory, never under src/systems.
  - Good reads the real live files. Three-module bad writes a
    temp Types copy with a planted type error (Mult .olean on
    the path). Four-module bad writes a temp TypesTheorems copy
    and compiles it after Mult, Types, and MultTheorems oleans
    so the reject is the planted error, not a missing import.
    Five-module bad writes a temp Erasure copy and compiles it
    after Mult olean (Erasure imports only Mult). Six-module
    bad writes a temp ErasureTheorems copy and compiles it
    after Mult and Erasure oleans. Seven-module bad writes a
    temp Extract copy and compiles it after Mult and Erasure
    oleans. Eight-module bad writes a temp ExtractTheorems
    copy and compiles it after Mult, Erasure, and Extract
    oleans. Isolation: live Mult, live MultTheorems, and the
    prior seven-module walker tryCompileNamedExtractSubset
    still succeed; this walker is false on a leftover
    temp snippet and on a leftover fake-package lakefile.
    Nine-module IrProgram bad writes a temp IrProgram copy
    and compiles it after Mult and Types oleans. Isolation
    names the prior eight-module walker
    tryCompileNamedExtractTheoremsSubset. Linear skipped.
    Ten-module IrProgramTheorems bad writes a temp
    IrProgramTheorems copy and compiles it after Mult, Types,
    and IrProgram oleans. Isolation names the prior nine-module
    walker tryCompileNamedIrProgramSubset. Linear skipped.
    Eleven-module HostTerm bad writes a temp HostTerm copy
    and compiles it after Mult olean. Isolation names leftover
    temp good.lean, leftover fake lean_lib ElabMeetRichLib,
    the prior ten-module walker
    tryCompileNamedIrProgramTheoremsSubset, and that this
    walk is not an alias of the tenth. Linear skipped.
    IrGraph skipped. Do not plant live HostTerm.lean.
  - Named HostFrontGoldens closed subset (import-closed):
    prior eleven plus SystemsLean.HostFrontGoldens last.
    Membership list is barrel order among the twelve; skip
    Linear, skip IrGraph. Compile order is the prior eleven
    compile order then HostFrontGoldens last.
    HostFrontGoldens has no SystemsLean imports. Twelve-module
    walker is a wrapper in ElabMeetNamedWalkHostTerm.
    Twelfth HostFrontGoldens probe lives here.
  - tryCompileNamedHostFrontGoldensSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Twelve-module HostFrontGoldens bad writes a temp
    HostFrontGoldens copy and compiles it after Mult olean
    (helper still requires Mult first so the sidecar compiles).
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior eleven-module walker
    tryCompileNamedHostTermSubset, and that this walk is not
    an alias of the eleventh. Linear skipped. IrGraph skipped.
    Do not plant live HostFrontGoldens.lean.
  - Named HostFront closed subset (import-closed):
    prior twelve plus SystemsLean.HostFront last.
    Membership list is barrel order among the thirteen; skip
    Linear, skip IrGraph. Compile order is the prior twelve
    compile order then HostFront last.
    HostFront imports HostTerm, Mult, and HostFrontGoldens.
    Thirteen-module walker is a wrapper in
    ElabMeetNamedWalkHostTerm.
    Thirteenth HostFront probe lives here.
  - tryCompileNamedHostFrontSubset is false unless the
    path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the subset.
    Thirteen-module HostFront bad writes a temp HostFront
    copy and compiles it after Mult, HostTerm, and
    HostFrontGoldens oleans.
    Isolation names leftover temp good.lean, leftover fake
    lean_lib ElabMeetRichLib, the prior twelve-module walker
    tryCompileNamedHostFrontGoldensSubset, and that this
    walk is not an alias of the twelfth. Linear skipped.
    IrGraph skipped. Do not plant live HostFront.lean.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveLakefilePath, findLiveBarrelPath,
  parseRealLakeLibraryName, barrelListsNamedSubset,
  namedClosedSubsetNames, findLiveTypesPath,
  tryCompileNamedClosedSubset,
  elabMeetDrivesNamedSubset,
  elabMeetAcceptsGoodNamedSubset,
  elabMeetRejectsBadNamedSubset,
  elabMeetRejectsOldWalkAsNamedSubset,
  #elabMeetNamedSubsetProbe, elabMeetNamedSubsetProbe,
  findLiveTypesTheoremsPath,
  namedClosedTypesTheoremsSubsetNames,
  barrelListsNamedTypesTheoremsSubset,
  tryCompileNamedTypesTheoremsSubset,
  tryCompileAfterTypesTheoremsDeps,
  elabMeetDrivesNamedTypesTheoremsSubset,
  elabMeetAcceptsGoodNamedTypesTheoremsSubset,
  elabMeetRejectsBadNamedTypesTheoremsSubset,
  elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset,
  #elabMeetNamedTypesTheoremsSubsetProbe,
  elabMeetNamedTypesTheoremsSubsetProbe,
  SystemsLean.TypesTheorems,
  findLiveErasurePath,
  namedClosedErasureSubsetNames,
  barrelListsNamedErasureSubset,
  tryCompileNamedErasureSubset,
  tryCompileAfterErasureDeps,
  elabMeetDrivesNamedErasureSubset,
  elabMeetAcceptsGoodNamedErasureSubset,
  elabMeetRejectsBadNamedErasureSubset,
  elabMeetRejectsOldWalkAsNamedErasureSubset,
  #elabMeetNamedErasureSubsetProbe,
  elabMeetNamedErasureSubsetProbe,
  SystemsLean.Erasure,
  findLiveErasureTheoremsPath,
  namedClosedErasureTheoremsSubsetNames,
  namedClosedErasureTheoremsCompileOrder,
  barrelListsNamedErasureTheoremsSubset,
  tryCompileNamedErasureTheoremsSubset,
  tryCompileAfterErasureTheoremsDeps,
  elabMeetDrivesNamedErasureTheoremsSubset,
  elabMeetAcceptsGoodNamedErasureTheoremsSubset,
  elabMeetRejectsBadNamedErasureTheoremsSubset,
  elabMeetRejectsOldWalkAsNamedErasureTheoremsSubset,
  #elabMeetNamedErasureTheoremsSubsetProbe,
  elabMeetNamedErasureTheoremsSubsetProbe,
  SystemsLean.ErasureTheorems,
  findLiveExtractPath,
  namedClosedExtractSubsetNames,
  namedClosedExtractCompileOrder,
  barrelListsNamedExtractSubset,
  tryCompileNamedExtractSubset,
  tryCompileAfterExtractDeps,
  elabMeetDrivesNamedExtractSubset,
  elabMeetAcceptsGoodNamedExtractSubset,
  elabMeetRejectsBadNamedExtractSubset,
  elabMeetRejectsOldWalkAsNamedExtractSubset,
  #elabMeetNamedExtractSubsetProbe,
  elabMeetNamedExtractSubsetProbe,
  SystemsLean.Extract,
  findLiveExtractTheoremsPath,
  namedClosedExtractTheoremsSubsetNames,
  namedClosedExtractTheoremsCompileOrder,
  barrelListsNamedExtractTheoremsSubset,
  tryCompileNamedExtractTheoremsSubset,
  tryCompileAfterExtractTheoremsDeps,
  elabMeetDrivesNamedExtractTheoremsSubset,
  elabMeetAcceptsGoodNamedExtractTheoremsSubset,
  elabMeetRejectsBadNamedExtractTheoremsSubset,
  elabMeetRejectsOldWalkAsNamedExtractTheoremsSubset,
  #elabMeetNamedExtractTheoremsSubsetProbe,
  elabMeetNamedExtractTheoremsSubsetProbe,
  SystemsLean.ExtractTheorems,
  findLiveIrProgramPath,
  namedClosedIrProgramSubsetNames,
  namedClosedIrProgramCompileOrder,
  barrelListsNamedIrProgramSubset,
  tryCompileNamedIrProgramSubset,
  tryCompileAfterIrProgramDeps,
  elabMeetDrivesNamedIrProgramSubset,
  elabMeetAcceptsGoodNamedIrProgramSubset,
  elabMeetRejectsBadNamedIrProgramSubset,
  elabMeetRejectsOldWalkAsNamedIrProgramSubset,
  #elabMeetNamedIrProgramSubsetProbe,
  elabMeetNamedIrProgramSubsetProbe,
  SystemsLean.IrProgram,
  findLiveIrProgramTheoremsPath,
  namedClosedIrProgramTheoremsSubsetNames,
  namedClosedIrProgramTheoremsCompileOrder,
  barrelListsNamedIrProgramTheoremsSubset,
  tryCompileNamedIrProgramTheoremsSubset,
  tryCompileAfterIrProgramTheoremsDeps,
  elabMeetDrivesNamedIrProgramTheoremsSubset,
  elabMeetAcceptsGoodNamedIrProgramTheoremsSubset,
  elabMeetRejectsBadNamedIrProgramTheoremsSubset,
  elabMeetRejectsOldWalkAsNamedIrProgramTheoremsSubset,
  #elabMeetNamedIrProgramTheoremsSubsetProbe,
  elabMeetNamedIrProgramTheoremsSubsetProbe,
  SystemsLean.IrProgramTheorems,
  findLiveHostTermPath,
  namedClosedHostTermSubsetNames,
  namedClosedHostTermCompileOrder,
  barrelListsNamedHostTermSubset,
  tryCompileNamedHostTermSubset,
  tryCompileAfterHostTermDeps,
  elabMeetDrivesNamedHostTermSubset,
  elabMeetAcceptsGoodNamedHostTermSubset,
  elabMeetRejectsBadNamedHostTermSubset,
  elabMeetRejectsOldWalkAsNamedHostTermSubset,
  #elabMeetNamedHostTermSubsetProbe,
  elabMeetNamedHostTermSubsetProbe,
  SystemsLean.HostTerm,
  findLiveHostFrontGoldensPath,
  namedClosedHostFrontGoldensSubsetNames,
  namedClosedHostFrontGoldensCompileOrder,
  barrelListsNamedHostFrontGoldensSubset,
  tryCompileNamedHostFrontGoldensSubset,
  tryCompileAfterHostFrontGoldensDeps,
  elabMeetDrivesNamedHostFrontGoldensSubset,
  elabMeetAcceptsGoodNamedHostFrontGoldensSubset,
  elabMeetRejectsBadNamedHostFrontGoldensSubset,
  elabMeetRejectsOldWalkAsNamedHostFrontGoldensSubset,
  #elabMeetNamedHostFrontGoldensSubsetProbe,
  elabMeetNamedHostFrontGoldensSubsetProbe,
  SystemsLean.HostFrontGoldens,
  findLiveHostFrontPath,
  namedClosedHostFrontSubsetNames,
  namedClosedHostFrontCompileOrder,
  barrelListsNamedHostFrontSubset,
  tryCompileNamedHostFrontSubset,
  tryCompileAfterHostFrontDeps,
  elabMeetDrivesNamedHostFrontSubset,
  elabMeetAcceptsGoodNamedHostFrontSubset,
  elabMeetRejectsBadNamedHostFrontSubset,
  elabMeetRejectsOldWalkAsNamedHostFrontSubset,
  #elabMeetNamedHostFrontSubsetProbe,
  elabMeetNamedHostFrontSubsetProbe,
  SystemsLean.HostFront,
  ElabMeetNamedWalk, SystemsLean.ElabMeetNamedWalk,
  ElabMeetNamedWalkLater, SystemsLean.ElabMeetNamedWalkLater,
  ElabMeetNamedWalkTail, SystemsLean.ElabMeetNamedWalkTail,
  ElabMeetNamedWalkHostTerm, SystemsLean.ElabMeetNamedWalkHostTerm,
  ElabMeetSubset, SystemsLean.ElabMeetSubset,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetSubset
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetSubset; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetLive
import SystemsLean.ElabMeetNamedWalk
import SystemsLean.ElabMeetNamedWalkLater
import SystemsLean.ElabMeetNamedWalkTail
import SystemsLean.ElabMeetNamedWalkHostTerm

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the IrProgramTheorems closed subset.
    Good compiles live Mult, Types, MultTheorems, TypesTheorems,
    Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram,
    and IrProgramTheorems after reading the real lakefile. Bad
    compiles a temp IrProgramTheorems copy with a planted type
    error after Mult, Types, and IrProgram oleans. Isolation:
    live Mult, live MultTheorems, and the prior nine-module
    walker tryCompileNamedIrProgramSubset still work; this
    walker is false on a leftover temp snippet and on a leftover
    fake-package lakefile. Drive is good && !bad && isolation.
    Linear skipped. Do not plant live IrProgramTheorems.lean. -/
def elabMeetRunNamedIrProgramTheoremsSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveIrProgramTheorems? <- liftIO findLiveIrProgramTheoremsPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedIrProgramTheoremsSubset liveLake oleanDir
  let badCompiled <-
    match liveIrProgramTheorems? with
    | none =>
      pure true
    | some liveIrProgramTheorems => do
      let liveText <- liftIO (IO.FS.readFile liveIrProgramTheorems)
      let badPath :=
        badDir / "ElabMeetNamedIrProgramTheoremsSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterIrProgramTheoremsDeps
        badPath badDir `ElabMeetNamedIrProgramTheoremsSubsetBad
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
      tryCompileNamedIrProgramSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedIrProgramTheoremsSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedIrProgramTheoremsSubset fakeLake fakeDir
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedIrProgramTheoremsSubset
  let rN := mkIdent `elabMeetRejectsBadNamedIrProgramTheoremsSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedIrProgramTheoremsSubset
  let dN := mkIdent `elabMeetDrivesNamedIrProgramTheoremsSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedIrProgramTheoremsSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedIrProgramTheoremsSubset
      `elabMeetRejectsBadNamedIrProgramTheoremsSubset
      `elabMeetRejectsOldWalkAsNamedIrProgramTheoremsSubset
      `elabMeetDrivesNamedIrProgramTheoremsSubset
  else
    elabMeetRunNamedIrProgramTheoremsSubsetProbe

#elabMeetNamedIrProgramTheoremsSubsetProbe

example : elabMeetAcceptsGoodNamedIrProgramTheoremsSubset = true := rfl
example : elabMeetRejectsBadNamedIrProgramTheoremsSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedIrProgramTheoremsSubset = true := rfl
example : elabMeetDrivesNamedIrProgramTheoremsSubset = true := rfl

/-- Record accept / reject for the HostTerm closed subset.
    Good compiles live Mult, Types, MultTheorems, TypesTheorems,
    Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram,
    IrProgramTheorems, and HostTerm after reading the real
    lakefile. Bad compiles a temp HostTerm copy with a planted
    type error after Mult olean. Isolation: leftover temp
    good.lean and leftover fake lean_lib ElabMeetRichLib stay
    false; the prior ten-module walker
    tryCompileNamedIrProgramTheoremsSubset still works; this
    walker is not an alias of the tenth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped. Do not plant live
    HostTerm.lean. -/
def elabMeetRunNamedHostTermSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostTerm? <- liftIO findLiveHostTermPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostTermSubset liveLake oleanDir
  let badCompiled <-
    match liveHostTerm? with
    | none =>
      pure true
    | some liveHostTerm => do
      let liveText <- liftIO (IO.FS.readFile liveHostTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostTermSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostTermDeps
        badPath badDir `ElabMeetNamedHostTermSubsetBad
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
      tryCompileNamedIrProgramTheoremsSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostTermSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostTermSubset fakeLake fakeDir
  let notAliasOfTenth :=
    namedClosedHostTermSubsetNames
      != namedClosedIrProgramTheoremsSubsetNames
      && namedClosedHostTermCompileOrder
           != namedClosedIrProgramTheoremsCompileOrder
      && namedClosedHostTermSubsetNames.contains "SystemsLean.HostTerm"
      && !namedClosedIrProgramTheoremsSubsetNames.contains
           "SystemsLean.HostTerm"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfTenth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostTermSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostTermSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostTermSubset
  let dN := mkIdent `elabMeetDrivesNamedHostTermSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostTermSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostTermSubset
      `elabMeetRejectsBadNamedHostTermSubset
      `elabMeetRejectsOldWalkAsNamedHostTermSubset
      `elabMeetDrivesNamedHostTermSubset
  else
    elabMeetRunNamedHostTermSubsetProbe

#elabMeetNamedHostTermSubsetProbe

example : elabMeetAcceptsGoodNamedHostTermSubset = true := rfl
example : elabMeetRejectsBadNamedHostTermSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostTermSubset = true := rfl
example : elabMeetDrivesNamedHostTermSubset = true := rfl

/-- Record accept / reject for the HostFrontGoldens closed subset.
    Good compiles live Mult, Types, MultTheorems, TypesTheorems,
    Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram,
    IrProgramTheorems, HostTerm, and HostFrontGoldens after
    reading the real lakefile. Bad compiles a temp
    HostFrontGoldens copy with a planted type error after Mult
    olean. Isolation: leftover temp good.lean and leftover fake
    lean_lib ElabMeetRichLib stay false; the prior eleven-module
    walker tryCompileNamedHostTermSubset still works; this
    walker is not an alias of the eleventh. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped. Do not plant live
    HostFrontGoldens.lean. -/
def elabMeetRunNamedHostFrontGoldensSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveGoldens? <- liftIO findLiveHostFrontGoldensPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostFrontGoldensSubset liveLake oleanDir
  let badCompiled <-
    match liveGoldens? with
    | none =>
      pure true
    | some liveGoldens => do
      let liveText <- liftIO (IO.FS.readFile liveGoldens)
      let badPath :=
        badDir / "ElabMeetNamedHostFrontGoldensSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostFrontGoldensDeps
        badPath badDir `ElabMeetNamedHostFrontGoldensSubsetBad
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
      tryCompileNamedHostTermSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostFrontGoldensSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostFrontGoldensSubset fakeLake fakeDir
  let notAliasOfEleventh :=
    namedClosedHostFrontGoldensSubsetNames
      != namedClosedHostTermSubsetNames
      && namedClosedHostFrontGoldensCompileOrder
           != namedClosedHostTermCompileOrder
      && namedClosedHostFrontGoldensSubsetNames.contains
           "SystemsLean.HostFrontGoldens"
      && !namedClosedHostTermSubsetNames.contains
           "SystemsLean.HostFrontGoldens"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfEleventh
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostFrontGoldensSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostFrontGoldensSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostFrontGoldensSubset
  let dN := mkIdent `elabMeetDrivesNamedHostFrontGoldensSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostFrontGoldensSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostFrontGoldensSubset
      `elabMeetRejectsBadNamedHostFrontGoldensSubset
      `elabMeetRejectsOldWalkAsNamedHostFrontGoldensSubset
      `elabMeetDrivesNamedHostFrontGoldensSubset
  else
    elabMeetRunNamedHostFrontGoldensSubsetProbe

#elabMeetNamedHostFrontGoldensSubsetProbe

example : elabMeetAcceptsGoodNamedHostFrontGoldensSubset = true := rfl
example : elabMeetRejectsBadNamedHostFrontGoldensSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostFrontGoldensSubset = true := rfl
example : elabMeetDrivesNamedHostFrontGoldensSubset = true := rfl

/-- Record accept / reject for the HostFront closed subset.
    Good compiles live Mult, Types, MultTheorems, TypesTheorems,
    Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram,
    IrProgramTheorems, HostTerm, HostFrontGoldens, and HostFront
    after reading the real lakefile. Bad compiles a temp
    HostFront copy with a planted type error after Mult,
    HostTerm, and HostFrontGoldens oleans. Isolation: leftover
    temp good.lean and leftover fake lean_lib ElabMeetRichLib
    stay false; the prior twelve-module walker
    tryCompileNamedHostFrontGoldensSubset still works; this
    walker is not an alias of the twelfth. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped. Do not plant live
    HostFront.lean. -/
def elabMeetRunNamedHostFrontSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostFront? <- liftIO findLiveHostFrontPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostFrontSubset liveLake oleanDir
  let badCompiled <-
    match liveHostFront? with
    | none =>
      pure true
    | some liveHostFront => do
      let liveText <- liftIO (IO.FS.readFile liveHostFront)
      let badPath :=
        badDir / "ElabMeetNamedHostFrontSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostFrontDeps
        badPath badDir `ElabMeetNamedHostFrontSubsetBad
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
      tryCompileNamedHostFrontGoldensSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostFrontSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostFrontSubset fakeLake fakeDir
  let notAliasOfTwelfth :=
    namedClosedHostFrontSubsetNames
      != namedClosedHostFrontGoldensSubsetNames
      && namedClosedHostFrontCompileOrder
           != namedClosedHostFrontGoldensCompileOrder
      && namedClosedHostFrontSubsetNames.contains
           "SystemsLean.HostFront"
      && !namedClosedHostFrontGoldensSubsetNames.contains
           "SystemsLean.HostFront"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfTwelfth
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostFrontSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostFrontSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostFrontSubset
  let dN := mkIdent `elabMeetDrivesNamedHostFrontSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedHostFrontSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedHostFrontSubset
      `elabMeetRejectsBadNamedHostFrontSubset
      `elabMeetRejectsOldWalkAsNamedHostFrontSubset
      `elabMeetDrivesNamedHostFrontSubset
  else
    elabMeetRunNamedHostFrontSubsetProbe

#elabMeetNamedHostFrontSubsetProbe

example : elabMeetAcceptsGoodNamedHostFrontSubset = true := rfl
example : elabMeetRejectsBadNamedHostFrontSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedHostFrontSubset = true := rfl
example : elabMeetDrivesNamedHostFrontSubset = true := rfl

end SystemsLean.ElabMeet
