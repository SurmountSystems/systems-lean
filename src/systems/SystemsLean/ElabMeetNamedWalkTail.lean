/-
  SYSTEMS_LEAN_HOST partial -- leftover probes 3-6 plus leftover
  Extract and leftover IrProgram named-subset probes plus the
  tenth IrProgramTheorems wrapper.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted from ElabMeetSubset so that file stays under
  the line cap. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Three-through-eight wrappers, leftover
  ExtractTheorems probe, and ninth IrProgram wrapper stay in
  ElabMeetNamedWalkLater. Leftover probes 3-6 live here:
  named-subset, TypesTheorems, Erasure, ErasureTheorems.
  Leftover Extract probe and leftover IrProgram probe live
  here. Tenth IrProgramTheorems wrapper lives here. Eleventh
  HostTerm wrapper lives in ElabMeetNamedWalkHostTerm so this
  file stays under about 880. Newer IrProgramTheorems and
  HostTerm probes live in ElabMeetSubset. Reuses
  tryCompileOnDiskModuleIO (no second elaborator). Next leftover
  probe or wrapper must extract first; do not grow this file or
  Subset or Later past about 880.

  Spec (readable):
  - Leftover probes 3-6 live here:
    #elabMeetNamedSubsetProbe,
    #elabMeetNamedTypesTheoremsSubsetProbe,
    #elabMeetNamedErasureSubsetProbe,
    #elabMeetNamedErasureTheoremsSubsetProbe.
  - Leftover Extract probe lives here:
    #elabMeetNamedExtractSubsetProbe.
  - Leftover IrProgram probe lives here:
    #elabMeetNamedIrProgramSubsetProbe.
  - Tenth IrProgramTheorems wrapper lives here:
    findLiveIrProgramTheoremsPath,
    namedClosedIrProgramTheoremsSubsetNames,
    namedClosedIrProgramTheoremsCompileOrder,
    barrelListsNamedIrProgramTheoremsSubset,
    tryCompileNamedIrProgramTheoremsSubset,
    tryCompileAfterIrProgramTheoremsDeps.
    Membership list is barrel order; IrProgram after
    TypesTheorems, IrProgramTheorems after IrProgram.
    Compile order puts IrProgramTheorems last.
    IrProgramTheorems imports Mult, Types, IrProgram.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  leftoverFakePackageLakefileText,
  findLiveExtractPath, namedClosedExtractSubsetNames,
  namedClosedExtractCompileOrder, barrelListsNamedExtractSubset,
  tryCompileNamedExtractSubset, tryCompileAfterExtractDeps,
  elabMeetDrivesNamedExtractSubset,
  elabMeetAcceptsGoodNamedExtractSubset,
  elabMeetRejectsBadNamedExtractSubset,
  elabMeetRejectsOldWalkAsNamedExtractSubset,
  #elabMeetNamedExtractSubsetProbe,
  elabMeetNamedExtractSubsetProbe,
  SystemsLean.Extract,
  findLiveIrProgramPath, namedClosedIrProgramSubsetNames,
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
  SystemsLean.IrProgramTheorems,
  elabMeetNamedSubsetProbe, elabMeetDrivesNamedSubset,
  elabMeetNamedTypesTheoremsSubsetProbe,
  elabMeetDrivesNamedTypesTheoremsSubset,
  elabMeetNamedErasureSubsetProbe, elabMeetDrivesNamedErasureSubset,
  elabMeetNamedErasureTheoremsSubsetProbe,
  elabMeetDrivesNamedErasureTheoremsSubset,
  ElabMeetNamedWalkTail, SystemsLean.ElabMeetNamedWalkTail,
  ElabMeetNamedWalkHostTerm, SystemsLean.ElabMeetNamedWalkHostTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkTail
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkTail; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHost. Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetLive
import SystemsLean.ElabMeetNamedWalk
import SystemsLean.ElabMeetNamedWalkLater

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/IrProgramTheorems.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveIrProgramTheoremsPath. -/
def findLiveIrProgramTheoremsPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.IrProgramTheorems"

/-- Named closed IrProgramTheorems subset of the live SystemsLean
    library. Closed: every import of a member is also in the list.
    Membership list is barrel order; IrProgram after TypesTheorems,
    IrProgramTheorems after IrProgram.
    Greppable: namedClosedIrProgramTheoremsSubsetNames.
    SystemsLean.IrProgramTheorems. -/
def namedClosedIrProgramTheoremsSubsetNames : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.Types"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.IrProgram"
  , "SystemsLean.IrProgramTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  , "SystemsLean.Extract"
  , "SystemsLean.ExtractTheorems"
  ]

/-- Compile order honors imports: Mult first, then Types,
    MultTheorems, TypesTheorems, Erasure, ErasureTheorems,
    Extract, ExtractTheorems, IrProgram, IrProgramTheorems.
    IrProgramTheorems is last in compile order.
    IrProgramTheorems imports Mult, Types, IrProgram.
    Membership list vs compile order.
    Greppable: namedClosedIrProgramTheoremsCompileOrder. -/
def namedClosedIrProgramTheoremsCompileOrder : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.Types"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  , "SystemsLean.Extract"
  , "SystemsLean.ExtractTheorems"
  , "SystemsLean.IrProgram"
  , "SystemsLean.IrProgramTheorems"
  ]

/-- True when the barrel lists each IrProgramTheorems subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedIrProgramTheoremsSubset. -/
def barrelListsNamedIrProgramTheoremsSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedIrProgramTheoremsSubsetNames

/-- Compile the named IrProgramTheorems closed subset after reading
    the live lakefile. Ten-module wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then search path, then Types, MultTheorems,
    TypesTheorems, Erasure, ErasureTheorems, Extract,
    ExtractTheorems, IrProgram, IrProgramTheorems last.
    Greppable: tryCompileNamedIrProgramTheoremsSubset.
    tryCompileOnDiskModule. SystemsLean.IrProgramTheorems. -/
unsafe def tryCompileNamedIrProgramTheoremsSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedIrProgramTheoremsSubsetNames
    namedClosedIrProgramTheoremsCompileOrder

@[implemented_by tryCompileNamedIrProgramTheoremsSubsetIO]
opaque tryCompileNamedIrProgramTheoremsSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the IrProgramTheorems closed subset.
    Greppable: tryCompileNamedIrProgramTheoremsSubset. -/
def tryCompileNamedIrProgramTheoremsSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedIrProgramTheoremsSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, then Types, then IrProgram, put those
    .oleans on the search path, then compile srcPath as thmMod.
    IrProgramTheorems imports Mult, Types, and IrProgram.
    Do not only pass Types: the reject would be a missing
    IrProgram import, not the planted error.
    Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterIrProgramTheoremsDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterIrProgramTheoremsDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram"]

@[implemented_by tryCompileAfterIrProgramTheoremsDepsIO]
opaque tryCompileAfterIrProgramTheoremsDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after IrProgramTheorems deps.
    Greppable: tryCompileAfterIrProgramTheoremsDeps. -/
def tryCompileAfterIrProgramTheoremsDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterIrProgramTheoremsDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Record accept / reject for the Extract closed subset.
    Good compiles live Mult, Types, MultTheorems, TypesTheorems,
    Erasure, ErasureTheorems, and Extract after reading the real
    lakefile. Bad compiles a temp Extract copy with a planted type
    error after Mult and Erasure oleans. Isolation: live Mult,
    live MultTheorems, and the prior six-module named subset
    still work; this walker is false on a leftover temp snippet
    and on a leftover fake-package lakefile. Drive is
    good && !bad && isolation. -/
def elabMeetRunNamedExtractSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveExtract? <- liftIO findLiveExtractPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedExtractSubset liveLake oleanDir
  let badCompiled <-
    match liveExtract? with
    | none =>
      pure true
    | some liveExtract => do
      let liveText <- liftIO (IO.FS.readFile liveExtract)
      let badPath :=
        badDir / "ElabMeetNamedExtractSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterExtractDeps
        badPath badDir `ElabMeetNamedExtractSubsetBad
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
      tryCompileNamedErasureTheoremsSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedExtractSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedExtractSubset fakeLake fakeDir
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedExtractSubset
  let rN := mkIdent `elabMeetRejectsBadNamedExtractSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedExtractSubset
  let dN := mkIdent `elabMeetDrivesNamedExtractSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedExtractSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedExtractSubset
      `elabMeetRejectsBadNamedExtractSubset
      `elabMeetRejectsOldWalkAsNamedExtractSubset
      `elabMeetDrivesNamedExtractSubset
  else
    elabMeetRunNamedExtractSubsetProbe

#elabMeetNamedExtractSubsetProbe

example : elabMeetAcceptsGoodNamedExtractSubset = true := rfl
example : elabMeetRejectsBadNamedExtractSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedExtractSubset = true := rfl
example : elabMeetDrivesNamedExtractSubset = true := rfl

/-- Record accept / reject for the IrProgram closed subset.
    Good compiles live Mult, Types, MultTheorems, TypesTheorems,
    IrProgram, Erasure, ErasureTheorems, Extract, and
    ExtractTheorems after reading the real lakefile. Bad compiles
    a temp IrProgram copy with a planted type error after Mult
    and Types oleans. Isolation: live Mult, live MultTheorems,
    and the prior eight-module walker
    tryCompileNamedExtractTheoremsSubset still work; this walker
    is false on a leftover temp snippet and on a leftover
    fake-package lakefile. Drive is good && !bad && isolation.
    Linear skipped. Do not plant live IrProgram.lean. -/
def elabMeetRunNamedIrProgramSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveIrProgram? <- liftIO findLiveIrProgramPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedIrProgramSubset liveLake oleanDir
  let badCompiled <-
    match liveIrProgram? with
    | none =>
      pure true
    | some liveIrProgram => do
      let liveText <- liftIO (IO.FS.readFile liveIrProgram)
      let badPath :=
        badDir / "ElabMeetNamedIrProgramSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterIrProgramDeps
        badPath badDir `ElabMeetNamedIrProgramSubsetBad
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
      tryCompileNamedExtractTheoremsSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedIrProgramSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedIrProgramSubset fakeLake fakeDir
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedIrProgramSubset
  let rN := mkIdent `elabMeetRejectsBadNamedIrProgramSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedIrProgramSubset
  let dN := mkIdent `elabMeetDrivesNamedIrProgramSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedIrProgramSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedIrProgramSubset
      `elabMeetRejectsBadNamedIrProgramSubset
      `elabMeetRejectsOldWalkAsNamedIrProgramSubset
      `elabMeetDrivesNamedIrProgramSubset
  else
    elabMeetRunNamedIrProgramSubsetProbe

#elabMeetNamedIrProgramSubsetProbe

example : elabMeetAcceptsGoodNamedIrProgramSubset = true := rfl
example : elabMeetRejectsBadNamedIrProgramSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedIrProgramSubset = true := rfl
example : elabMeetDrivesNamedIrProgramSubset = true := rfl

/-- Record accept / reject for the named closed subset.
    Good compiles live Mult, MultTheorems, and Types after reading
    the real lakefile. Bad compiles a temp Types copy with a planted
    type error. Isolation: live Mult and live MultTheorems walkers
    still work; this walker is false on a leftover temp snippet and
    on a leftover fake-package lakefile. Drive is
    good && !bad && isolation. -/
def elabMeetRunNamedSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveTypes? <- liftIO findLiveTypesPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedClosedSubset liveLake oleanDir
  let badCompiled <-
    match liveTypes? with
    | none =>
      pure true
    | some liveTypes => do
      let liveText <- liftIO (IO.FS.readFile liveTypes)
      let badPath := badDir / "ElabMeetNamedSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileTheoremsAfterLiveMult
        badPath badDir `ElabMeetNamedSubsetBad
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
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <- tryCompileNamedClosedSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <- tryCompileNamedClosedSubset fakeLake fakeDir
  let isolation :=
    liveMultStillOk && liveThmStillOk
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedSubset
  let rN := mkIdent `elabMeetRejectsBadNamedSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedSubset
  let dN := mkIdent `elabMeetDrivesNamedSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedSubset
      `elabMeetRejectsBadNamedSubset
      `elabMeetRejectsOldWalkAsNamedSubset
      `elabMeetDrivesNamedSubset
  else
    elabMeetRunNamedSubsetProbe

#elabMeetNamedSubsetProbe

example : elabMeetAcceptsGoodNamedSubset = true := rfl
example : elabMeetRejectsBadNamedSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedSubset = true := rfl
example : elabMeetDrivesNamedSubset = true := rfl

/-- Record accept / reject for the TypesTheorems closed subset.
    Good compiles live Mult, Types, MultTheorems, and TypesTheorems
    after reading the real lakefile. Bad compiles a temp
    TypesTheorems copy with a planted type error after the three
    dep oleans. Isolation: live Mult, live MultTheorems, and the
    prior three-module named subset still work; this walker is
    false on a leftover temp snippet and on a leftover fake-package
    lakefile. Drive is good && !bad && isolation. -/
def elabMeetRunNamedTypesTheoremsSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveTypesThm? <- liftIO findLiveTypesTheoremsPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedTypesTheoremsSubset liveLake oleanDir
  let badCompiled <-
    match liveTypesThm? with
    | none =>
      pure true
    | some liveTypesThm => do
      let liveText <- liftIO (IO.FS.readFile liveTypesThm)
      let badPath :=
        badDir / "ElabMeetNamedTypesTheoremsSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterTypesTheoremsDeps
        badPath badDir `ElabMeetNamedTypesTheoremsSubsetBad
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
      tryCompileNamedClosedSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedTypesTheoremsSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedTypesTheoremsSubset fakeLake fakeDir
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedTypesTheoremsSubset
  let rN := mkIdent `elabMeetRejectsBadNamedTypesTheoremsSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset
  let dN := mkIdent `elabMeetDrivesNamedTypesTheoremsSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedTypesTheoremsSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedTypesTheoremsSubset
      `elabMeetRejectsBadNamedTypesTheoremsSubset
      `elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset
      `elabMeetDrivesNamedTypesTheoremsSubset
  else
    elabMeetRunNamedTypesTheoremsSubsetProbe

#elabMeetNamedTypesTheoremsSubsetProbe

example : elabMeetAcceptsGoodNamedTypesTheoremsSubset = true := rfl
example : elabMeetRejectsBadNamedTypesTheoremsSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedTypesTheoremsSubset = true := rfl
example : elabMeetDrivesNamedTypesTheoremsSubset = true := rfl

/-- Record accept / reject for the Erasure closed subset.
    Good compiles live Mult, Types, MultTheorems, TypesTheorems,
    and Erasure after reading the real lakefile. Bad compiles a
    temp Erasure copy with a planted type error after Mult olean.
    Isolation: live Mult, live MultTheorems, and the prior
    four-module named subset still work; this walker is false on
    a leftover temp snippet and on a leftover fake-package
    lakefile. Drive is good && !bad && isolation. -/
def elabMeetRunNamedErasureSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveErasure? <- liftIO findLiveErasurePath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedErasureSubset liveLake oleanDir
  let badCompiled <-
    match liveErasure? with
    | none =>
      pure true
    | some liveErasure => do
      let liveText <- liftIO (IO.FS.readFile liveErasure)
      let badPath := badDir / "ElabMeetNamedErasureSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterErasureDeps
        badPath badDir `ElabMeetNamedErasureSubsetBad
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
      tryCompileNamedTypesTheoremsSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedErasureSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedErasureSubset fakeLake fakeDir
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedErasureSubset
  let rN := mkIdent `elabMeetRejectsBadNamedErasureSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedErasureSubset
  let dN := mkIdent `elabMeetDrivesNamedErasureSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedErasureSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedErasureSubset
      `elabMeetRejectsBadNamedErasureSubset
      `elabMeetRejectsOldWalkAsNamedErasureSubset
      `elabMeetDrivesNamedErasureSubset
  else
    elabMeetRunNamedErasureSubsetProbe

#elabMeetNamedErasureSubsetProbe

example : elabMeetAcceptsGoodNamedErasureSubset = true := rfl
example : elabMeetRejectsBadNamedErasureSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedErasureSubset = true := rfl
example : elabMeetDrivesNamedErasureSubset = true := rfl

/-- Record accept / reject for the ErasureTheorems closed subset.
    Good compiles live Mult, Types, MultTheorems, TypesTheorems,
    Erasure, and ErasureTheorems after reading the real lakefile.
    Bad compiles a temp ErasureTheorems copy with a planted type
    error after Mult and Erasure oleans. Isolation: live Mult,
    live MultTheorems, and the prior five-module named subset
    still work; this walker is false on a leftover temp snippet
    and on a leftover fake-package lakefile. Drive is
    good && !bad && isolation. -/
def elabMeetRunNamedErasureTheoremsSubsetProbe : CommandElabM Unit := do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveErasureThm? <- liftIO findLiveErasureTheoremsPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedErasureTheoremsSubset liveLake oleanDir
  let badCompiled <-
    match liveErasureThm? with
    | none =>
      pure true
    | some liveErasureThm => do
      let liveText <- liftIO (IO.FS.readFile liveErasureThm)
      let badPath :=
        badDir / "ElabMeetNamedErasureTheoremsSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterErasureTheoremsDeps
        badPath badDir `ElabMeetNamedErasureTheoremsSubsetBad
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
      tryCompileNamedErasureSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedErasureTheoremsSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedErasureTheoremsSubset fakeLake fakeDir
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedErasureTheoremsSubset
  let rN := mkIdent `elabMeetRejectsBadNamedErasureTheoremsSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedErasureTheoremsSubset
  let dN := mkIdent `elabMeetDrivesNamedErasureTheoremsSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

elab "#elabMeetNamedErasureTheoremsSubsetProbe" : command => do
  if (<- liftIO slakePackageTypecheckWalk) then
    elabMeetPlantNamedSubsetDrive
      `elabMeetAcceptsGoodNamedErasureTheoremsSubset
      `elabMeetRejectsBadNamedErasureTheoremsSubset
      `elabMeetRejectsOldWalkAsNamedErasureTheoremsSubset
      `elabMeetDrivesNamedErasureTheoremsSubset
  else
    elabMeetRunNamedErasureTheoremsSubsetProbe

#elabMeetNamedErasureTheoremsSubsetProbe

example : elabMeetAcceptsGoodNamedErasureTheoremsSubset = true := rfl
example : elabMeetRejectsBadNamedErasureTheoremsSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedErasureTheoremsSubset = true := rfl
example : elabMeetDrivesNamedErasureTheoremsSubset = true := rfl

end SystemsLean.ElabMeet
