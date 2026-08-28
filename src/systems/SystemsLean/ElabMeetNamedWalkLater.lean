/-
  SYSTEMS_LEAN_HOST partial -- leftover three-through-eight named-walk
  wrappers, leftover ExtractTheorems probe, and ninth IrProgram
  wrapper.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted from ElabMeetNamedWalk / ElabMeetSubset so
  those files stay under the line cap. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Nine-module IrProgram wrapper lives here.
  Leftover ExtractTheorems probe lives here. Leftover Extract,
  leftover IrProgram, and leftover 3-6 probes live in
  ElabMeetNamedWalkTail. Newer IrProgramTheorems and HostTerm
  probes live in ElabMeetSubset. Eleventh HostTerm wrapper
  lives in ElabMeetNamedWalkHostTerm.
  Reuses tryCompileOnDiskModuleIO (no second elaborator).

  Extract-first (about 880): do not add another leftover probe
  or leftover wrapper here, on ElabMeetSubset, or on
  ElabMeetNamedWalkTail if that add would pass about 880.
  Extract more leftover first. NamedWalk may keep shared helpers.

  Spec (readable):
  - Three/four/five/six/seven/eight-module wrappers live here:
    namedClosedSubsetNames, tryCompileNamedClosedSubset,
    namedClosedTypesTheoremsSubsetNames,
    tryCompileNamedTypesTheoremsSubset,
    namedClosedErasureSubsetNames, tryCompileNamedErasureSubset,
    namedClosedErasureTheoremsSubsetNames,
    tryCompileNamedErasureTheoremsSubset,
    namedClosedExtractSubsetNames, tryCompileNamedExtractSubset,
    namedClosedExtractTheoremsSubsetNames,
    tryCompileNamedExtractTheoremsSubset.
  - Nine-module IrProgram wrapper lives here:
    namedClosedIrProgramSubsetNames, tryCompileNamedIrProgramSubset.
    Membership barrel order inserts IrProgram after TypesTheorems.
    Compile order puts IrProgram last (imports only Types).
  - Leftover eighth ExtractTheorems probe lives here.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  namedClosedSubsetNames, namedClosedSubsetCompileOrder,
  findLiveTypesPath, barrelListsNamedSubset,
  tryCompileNamedClosedSubset,
  findLiveTypesTheoremsPath,
  namedClosedTypesTheoremsSubsetNames,
  namedClosedTypesTheoremsCompileOrder,
  barrelListsNamedTypesTheoremsSubset,
  tryCompileNamedTypesTheoremsSubset,
  tryCompileAfterTypesTheoremsDeps,
  findLiveErasurePath, namedClosedErasureSubsetNames,
  namedClosedErasureCompileOrder, barrelListsNamedErasureSubset,
  tryCompileNamedErasureSubset, tryCompileAfterErasureDeps,
  findLiveErasureTheoremsPath,
  namedClosedErasureTheoremsSubsetNames,
  namedClosedErasureTheoremsCompileOrder,
  barrelListsNamedErasureTheoremsSubset,
  tryCompileNamedErasureTheoremsSubset,
  tryCompileAfterErasureTheoremsDeps,
  findLiveExtractPath, namedClosedExtractSubsetNames,
  namedClosedExtractCompileOrder, barrelListsNamedExtractSubset,
  tryCompileNamedExtractSubset, tryCompileAfterExtractDeps,
  SystemsLean.Extract,
  findLiveExtractTheoremsPath, namedClosedExtractTheoremsSubsetNames,
  namedClosedExtractTheoremsCompileOrder,
  barrelListsNamedExtractTheoremsSubset,
  tryCompileNamedExtractTheoremsSubset,
  tryCompileAfterExtractTheoremsDeps,
  SystemsLean.ExtractTheorems,
  elabMeetNamedExtractTheoremsSubsetProbe,
  elabMeetDrivesNamedExtractTheoremsSubset,
  findLiveIrProgramPath, namedClosedIrProgramSubsetNames,
  namedClosedIrProgramCompileOrder,
  barrelListsNamedIrProgramSubset,
  tryCompileNamedIrProgramSubset,
  tryCompileAfterIrProgramDeps,
  SystemsLean.IrProgram,
  ElabMeetNamedWalkLater, SystemsLean.ElabMeetNamedWalkLater,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkLater
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkLater; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHost. Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetLive
import SystemsLean.ElabMeetNamedWalk

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Named closed subset of the live SystemsLean library.
    Closed: every import of a member is also in the list.
    Greppable: namedClosedSubsetNames. -/
def namedClosedSubsetNames : List String :=
  ["SystemsLean.Mult", "SystemsLean.MultTheorems", "SystemsLean.Types"]

/-- Compile order honors imports: Mult first, then Types, then
    MultTheorems. Distinct from namedClosedSubsetNames membership
    order. Greppable: namedClosedSubsetCompileOrder. -/
def namedClosedSubsetCompileOrder : List String :=
  ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.MultTheorems"]

/-- Resolve live SystemsLean/Types.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveTypesPath. -/
def findLiveTypesPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.Types"

/-- True when the barrel lists each three-module subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedSubset. -/
def barrelListsNamedSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedSubsetNames

/-- Compile the named closed subset after reading the live lakefile.
    Three-module wrapper over tryCompileNamedMemberListIO.
    Greppable: tryCompileNamedClosedSubset. tryCompileOnDiskModule. -/
unsafe def tryCompileNamedClosedSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedSubsetNames namedClosedSubsetCompileOrder

@[implemented_by tryCompileNamedClosedSubsetIO]
opaque tryCompileNamedClosedSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the named closed subset.
    Greppable: tryCompileNamedClosedSubset. -/
def tryCompileNamedClosedSubset (srcPath oleanDir : System.FilePath) :
    CommandElabM Bool := do
  try
    liftIO (tryCompileNamedClosedSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/TypesTheorems.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveTypesTheoremsPath. -/
def findLiveTypesTheoremsPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.TypesTheorems"

/-- Named closed TypesTheorems subset of the live SystemsLean library.
    Closed: every import of a member is also in the list.
    Membership order is not compile order.
    Greppable: namedClosedTypesTheoremsSubsetNames. -/
def namedClosedTypesTheoremsSubsetNames : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.Types"
  , "SystemsLean.TypesTheorems"
  ]

/-- Compile order honors imports: Mult first, then Types,
    MultTheorems, TypesTheorems. Distinct from membership order.
    Greppable: namedClosedTypesTheoremsCompileOrder. -/
def namedClosedTypesTheoremsCompileOrder : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.Types"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.TypesTheorems"
  ]

/-- True when the barrel lists each TypesTheorems subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedTypesTheoremsSubset. -/
def barrelListsNamedTypesTheoremsSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedTypesTheoremsSubsetNames

/-- Compile the named TypesTheorems closed subset after reading the
    live lakefile. Four-module wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then search path,
    then Types, MultTheorems, TypesTheorems.
    Greppable: tryCompileNamedTypesTheoremsSubset.
    tryCompileOnDiskModule. SystemsLean.TypesTheorems. -/
unsafe def tryCompileNamedTypesTheoremsSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedTypesTheoremsSubsetNames
    namedClosedTypesTheoremsCompileOrder

@[implemented_by tryCompileNamedTypesTheoremsSubsetIO]
opaque tryCompileNamedTypesTheoremsSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the TypesTheorems closed subset.
    Greppable: tryCompileNamedTypesTheoremsSubset. -/
def tryCompileNamedTypesTheoremsSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileNamedTypesTheoremsSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, then Types, then MultTheorems, put those
    .oleans on the search path, then compile srcPath as thmMod.
    Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterTypesTheoremsDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterTypesTheoremsDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.MultTheorems"]

@[implemented_by tryCompileAfterTypesTheoremsDepsIO]
opaque tryCompileAfterTypesTheoremsDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after TypesTheorems deps.
    Greppable: tryCompileAfterTypesTheoremsDeps. -/
def tryCompileAfterTypesTheoremsDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterTypesTheoremsDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/Erasure.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveErasurePath. -/
def findLiveErasurePath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.Erasure"

/-- Named closed Erasure subset of the live SystemsLean library.
    Closed: every import of a member is also in the list.
    Membership order is not compile order. Erasure imports only Mult.
    Greppable: namedClosedErasureSubsetNames. SystemsLean.Erasure. -/
def namedClosedErasureSubsetNames : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.Types"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.Erasure"
  ]

/-- Compile order honors imports: Mult first, then Types,
    MultTheorems, TypesTheorems, Erasure. Distinct from membership
    order. Greppable: namedClosedErasureCompileOrder. -/
def namedClosedErasureCompileOrder : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.Types"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.Erasure"
  ]

/-- True when the barrel lists each Erasure subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedErasureSubset. -/
def barrelListsNamedErasureSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedErasureSubsetNames

/-- Compile the named Erasure closed subset after reading the live
    lakefile. Five-module wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then search path,
    then Types, MultTheorems, TypesTheorems, Erasure.
    Greppable: tryCompileNamedErasureSubset.
    tryCompileOnDiskModule. SystemsLean.Erasure. -/
unsafe def tryCompileNamedErasureSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedErasureSubsetNames namedClosedErasureCompileOrder

@[implemented_by tryCompileNamedErasureSubsetIO]
opaque tryCompileNamedErasureSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the Erasure closed subset.
    Greppable: tryCompileNamedErasureSubset. -/
def tryCompileNamedErasureSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileNamedErasureSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, put that .olean on the search path, then
    compile srcPath as thmMod. Erasure imports only Mult, so Mult
    is enough. Wrapper over tryCompileTheoremsAfterLiveMult.
    Greppable: tryCompileAfterErasureDeps. tryCompileOnDiskModule. -/
def tryCompileAfterErasureDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool :=
  tryCompileTheoremsAfterLiveMult srcPath oleanDir thmMod

/-- Resolve live SystemsLean/ErasureTheorems.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveErasureTheoremsPath. -/
def findLiveErasureTheoremsPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.ErasureTheorems"

/-- Named closed ErasureTheorems subset of the live SystemsLean library.
    Closed: every import of a member is also in the list.
    Membership order is not compile order.
    Greppable: namedClosedErasureTheoremsSubsetNames.
    SystemsLean.ErasureTheorems. -/
def namedClosedErasureTheoremsSubsetNames : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.Types"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  ]

/-- Compile order honors imports: Mult first, then Types,
    MultTheorems, TypesTheorems, Erasure, ErasureTheorems.
    Distinct from membership order.
    Greppable: namedClosedErasureTheoremsCompileOrder. -/
def namedClosedErasureTheoremsCompileOrder : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.Types"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  ]

/-- True when the barrel lists each ErasureTheorems subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedErasureTheoremsSubset. -/
def barrelListsNamedErasureTheoremsSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedErasureTheoremsSubsetNames

/-- Compile the named ErasureTheorems closed subset after reading the
    live lakefile. Six-module wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then search path,
    then Types, MultTheorems, TypesTheorems, Erasure,
    ErasureTheorems.
    Greppable: tryCompileNamedErasureTheoremsSubset.
    tryCompileOnDiskModule. SystemsLean.ErasureTheorems. -/
unsafe def tryCompileNamedErasureTheoremsSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedErasureTheoremsSubsetNames
    namedClosedErasureTheoremsCompileOrder

@[implemented_by tryCompileNamedErasureTheoremsSubsetIO]
opaque tryCompileNamedErasureTheoremsSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the ErasureTheorems closed subset.
    Greppable: tryCompileNamedErasureTheoremsSubset. -/
def tryCompileNamedErasureTheoremsSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedErasureTheoremsSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, then Erasure, put those .oleans on the
    search path, then compile srcPath as thmMod. ErasureTheorems
    imports Mult and Erasure. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterErasureTheoremsDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterErasureTheoremsDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.Erasure"]

@[implemented_by tryCompileAfterErasureTheoremsDepsIO]
opaque tryCompileAfterErasureTheoremsDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after ErasureTheorems deps.
    Greppable: tryCompileAfterErasureTheoremsDeps. -/
def tryCompileAfterErasureTheoremsDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterErasureTheoremsDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/Extract.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveExtractPath. -/
def findLiveExtractPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.Extract"

/-- Named closed Extract subset of the live SystemsLean library.
    Closed: every import of a member is also in the list.
    Membership order is not compile order.
    Greppable: namedClosedExtractSubsetNames.
    SystemsLean.Extract. -/
def namedClosedExtractSubsetNames : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.Types"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  , "SystemsLean.Extract"
  ]

/-- Compile order honors imports: Mult first, then Types,
    MultTheorems, TypesTheorems, Erasure, ErasureTheorems,
    Extract. Distinct from membership order. Extract last
    after Mult and Erasure.
    Greppable: namedClosedExtractCompileOrder. -/
def namedClosedExtractCompileOrder : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.Types"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  , "SystemsLean.Extract"
  ]

/-- True when the barrel lists each Extract subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedExtractSubset. -/
def barrelListsNamedExtractSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedExtractSubsetNames

/-- Compile the named Extract closed subset after reading the
    live lakefile. Seven-module wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then search path,
    then Types, MultTheorems, TypesTheorems, Erasure,
    ErasureTheorems, Extract.
    Greppable: tryCompileNamedExtractSubset.
    tryCompileOnDiskModule. SystemsLean.Extract. -/
unsafe def tryCompileNamedExtractSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedExtractSubsetNames namedClosedExtractCompileOrder

@[implemented_by tryCompileNamedExtractSubsetIO]
opaque tryCompileNamedExtractSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the Extract closed subset.
    Greppable: tryCompileNamedExtractSubset. -/
def tryCompileNamedExtractSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileNamedExtractSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, then Erasure, put those .oleans on the
    search path, then compile srcPath as thmMod. Extract
    imports Mult and Erasure. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterExtractDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterExtractDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.Erasure"]

@[implemented_by tryCompileAfterExtractDepsIO]
opaque tryCompileAfterExtractDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after Extract deps.
    Greppable: tryCompileAfterExtractDeps. -/
def tryCompileAfterExtractDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterExtractDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/ExtractTheorems.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveExtractTheoremsPath. -/
def findLiveExtractTheoremsPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.ExtractTheorems"

/-- Named closed ExtractTheorems subset of the live SystemsLean library.
    Closed: every import of a member is also in the list.
    Membership order is not compile order.
    Greppable: namedClosedExtractTheoremsSubsetNames.
    SystemsLean.ExtractTheorems. -/
def namedClosedExtractTheoremsSubsetNames : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.Types"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  , "SystemsLean.Extract"
  , "SystemsLean.ExtractTheorems"
  ]

/-- Compile order honors imports: Mult first, then Types,
    MultTheorems, TypesTheorems, Erasure, ErasureTheorems,
    Extract, ExtractTheorems. Distinct from membership order.
    ExtractTheorems last after Mult, Erasure, and Extract.
    Greppable: namedClosedExtractTheoremsCompileOrder. -/
def namedClosedExtractTheoremsCompileOrder : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.Types"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  , "SystemsLean.Extract"
  , "SystemsLean.ExtractTheorems"
  ]

/-- True when the barrel lists each ExtractTheorems subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedExtractTheoremsSubset. -/
def barrelListsNamedExtractTheoremsSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedExtractTheoremsSubsetNames

/-- Compile the named ExtractTheorems closed subset after reading the
    live lakefile. Eight-module wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then search path,
    then Types, MultTheorems, TypesTheorems, Erasure,
    ErasureTheorems, Extract, ExtractTheorems.
    Greppable: tryCompileNamedExtractTheoremsSubset.
    tryCompileOnDiskModule. SystemsLean.ExtractTheorems. -/
unsafe def tryCompileNamedExtractTheoremsSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedExtractTheoremsSubsetNames
    namedClosedExtractTheoremsCompileOrder

@[implemented_by tryCompileNamedExtractTheoremsSubsetIO]
opaque tryCompileNamedExtractTheoremsSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the ExtractTheorems closed subset.
    Greppable: tryCompileNamedExtractTheoremsSubset. -/
def tryCompileNamedExtractTheoremsSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedExtractTheoremsSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, then Erasure, then Extract, put those
    .oleans on the search path, then compile srcPath as thmMod.
    ExtractTheorems imports Mult, Erasure, and Extract. Wrapper
    over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterExtractTheoremsDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterExtractTheoremsDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.Erasure", "SystemsLean.Extract"]

@[implemented_by tryCompileAfterExtractTheoremsDepsIO]
opaque tryCompileAfterExtractTheoremsDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after ExtractTheorems deps.
    Greppable: tryCompileAfterExtractTheoremsDeps. -/
def tryCompileAfterExtractTheoremsDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterExtractTheoremsDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/IrProgram.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveIrProgramPath. -/
def findLiveIrProgramPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.IrProgram"

/-- Named closed IrProgram subset of the live SystemsLean library.
    Closed: every import of a member is also in the list.
    Membership barrel order inserts IrProgram after TypesTheorems.
    Greppable: namedClosedIrProgramSubsetNames.
    SystemsLean.IrProgram. -/
def namedClosedIrProgramSubsetNames : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.Types"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.IrProgram"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  , "SystemsLean.Extract"
  , "SystemsLean.ExtractTheorems"
  ]

/-- Compile order honors imports: Mult first, then Types,
    MultTheorems, TypesTheorems, Erasure, ErasureTheorems,
    Extract, ExtractTheorems, IrProgram. IrProgram last is
    fine because IrProgram imports only Types.
    Greppable: namedClosedIrProgramCompileOrder. -/
def namedClosedIrProgramCompileOrder : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.Types"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  , "SystemsLean.Extract"
  , "SystemsLean.ExtractTheorems"
  , "SystemsLean.IrProgram"
  ]

/-- True when the barrel lists each IrProgram subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedIrProgramSubset. -/
def barrelListsNamedIrProgramSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedIrProgramSubsetNames

/-- Compile the named IrProgram closed subset after reading the
    live lakefile. Nine-module wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then search path,
    then Types, MultTheorems, TypesTheorems, Erasure,
    ErasureTheorems, Extract, ExtractTheorems, IrProgram.
    Greppable: tryCompileNamedIrProgramSubset.
    tryCompileOnDiskModule. SystemsLean.IrProgram. -/
unsafe def tryCompileNamedIrProgramSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedIrProgramSubsetNames
    namedClosedIrProgramCompileOrder

@[implemented_by tryCompileNamedIrProgramSubsetIO]
opaque tryCompileNamedIrProgramSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the IrProgram closed subset.
    Greppable: tryCompileNamedIrProgramSubset. -/
def tryCompileNamedIrProgramSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedIrProgramSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, then Types, put those .oleans on the
    search path, then compile srcPath as thmMod. IrProgram
    imports only Types. tryCompileAfterNamedDepsIO requires
    Mult first. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterIrProgramDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterIrProgramDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.Types"]

@[implemented_by tryCompileAfterIrProgramDepsIO]
opaque tryCompileAfterIrProgramDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after IrProgram deps.
    Greppable: tryCompileAfterIrProgramDeps. -/
def tryCompileAfterIrProgramDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterIrProgramDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Record accept / reject for the ExtractTheorems closed subset.
    Good compiles live Mult, Types, MultTheorems, TypesTheorems,
    Erasure, ErasureTheorems, Extract, and ExtractTheorems after
    reading the real lakefile. Bad compiles a temp ExtractTheorems
    copy with a planted type error after Mult, Erasure, and
    Extract oleans. Isolation: live Mult, live MultTheorems, and
    the prior seven-module named subset still work; this walker
    is false on a leftover temp snippet and on a leftover
    fake-package lakefile. Drive is good && !bad && isolation. -/
elab "#elabMeetNamedExtractTheoremsSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveExtractTheorems? <- liftIO findLiveExtractTheoremsPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedExtractTheoremsSubset liveLake oleanDir
  let badCompiled <-
    match liveExtractTheorems? with
    | none =>
      pure true
    | some liveExtractTheorems => do
      let liveText <- liftIO (IO.FS.readFile liveExtractTheorems)
      let badPath :=
        badDir / "ElabMeetNamedExtractTheoremsSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterExtractTheoremsDeps
        badPath badDir `ElabMeetNamedExtractTheoremsSubsetBad
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
      tryCompileNamedExtractSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedExtractTheoremsSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedExtractTheoremsSubset fakeLake fakeDir
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
  let gN := mkIdent `elabMeetAcceptsGoodNamedExtractTheoremsSubset
  let rN := mkIdent `elabMeetRejectsBadNamedExtractTheoremsSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedExtractTheoremsSubset
  let dN := mkIdent `elabMeetDrivesNamedExtractTheoremsSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedExtractTheoremsSubsetProbe

example : elabMeetAcceptsGoodNamedExtractTheoremsSubset = true := rfl
example : elabMeetRejectsBadNamedExtractTheoremsSubset = true := rfl
example : elabMeetRejectsOldWalkAsNamedExtractTheoremsSubset = true := rfl
example : elabMeetDrivesNamedExtractTheoremsSubset = true := rfl

end SystemsLean.ElabMeet
