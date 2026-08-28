/-
  SYSTEMS_LEAN_HOST partial -- eleventh HostTerm, twelfth
  HostFrontGoldens, thirteenth HostFront, fourteenth
  HostFrontTheorems, fifteenth HostCheck, and sixteenth
  HostGraph named-walk wrappers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkTail stays under about
  880 after leftover probes 3-6 moved there. Same namespace
  SystemsLean.ElabMeet. Shared path, barrel, and name-list compile
  helpers stay in ElabMeetNamedWalk. Leftover 3-6 probes, leftover
  Extract, leftover IrProgram, and the tenth IrProgramTheorems
  wrapper live in ElabMeetNamedWalkTail. Newer IrProgramTheorems,
  HostTerm, HostFrontGoldens, and HostFront probes live in
  ElabMeetSubset. Fourteenth HostFrontTheorems probe lives in
  ElabMeetNamedHostFrontTheoremsProbe so Subset stays under about 880.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Extract-first (about 880): do not add another leftover probe
  or leftover wrapper here, on ElabMeetSubset, on
  ElabMeetNamedWalkLater, or on ElabMeetNamedWalkTail if that
  add would pass about 880. Extract more leftover first.
  NamedWalk may keep shared helpers. Twelfth HostFrontGoldens,
  thirteenth HostFront, fourteenth HostFrontTheorems,
  fifteenth HostCheck, and sixteenth HostGraph wrappers live
  here too (this file stays under 880).

  Spec (readable):
  - Eleventh HostTerm wrapper lives here:
    findLiveHostTermPath,
    namedClosedHostTermSubsetNames,
    namedClosedHostTermCompileOrder,
    barrelListsNamedHostTermSubset,
    tryCompileNamedHostTermSubset,
    tryCompileAfterHostTermDeps.
    Membership list is barrel order among the eleven; skip
    Linear, skip IrGraph. HostTerm after ExtractTheorems.
    Compile order is the prior ten compile order then
    HostTerm last. HostTerm imports only Mult.
  - Twelfth HostFrontGoldens wrapper lives here:
    findLiveHostFrontGoldensPath,
    namedClosedHostFrontGoldensSubsetNames,
    namedClosedHostFrontGoldensCompileOrder,
    barrelListsNamedHostFrontGoldensSubset,
    tryCompileNamedHostFrontGoldensSubset,
    tryCompileAfterHostFrontGoldensDeps.
    Membership list is barrel order among the twelve; skip
    Linear, skip IrGraph. HostFrontGoldens last.
    Compile order is the prior eleven compile order then
    HostFrontGoldens last. HostFrontGoldens has no
    SystemsLean imports; the after-deps helper still
    requires Mult first so a planted sidecar compiles.
  - Thirteenth HostFront wrapper lives here:
    findLiveHostFrontPath,
    namedClosedHostFrontSubsetNames,
    namedClosedHostFrontCompileOrder,
    barrelListsNamedHostFrontSubset,
    tryCompileNamedHostFrontSubset,
    tryCompileAfterHostFrontDeps.
    Membership list is barrel order among the thirteen; skip
    Linear, skip IrGraph. HostFront last after HostFrontGoldens.
    Compile order is the prior twelve compile order then
    HostFront last. HostFront imports HostTerm, Mult, and
    HostFrontGoldens. After-deps lists those three, Mult first.
  - Fourteenth HostFrontTheorems wrapper lives here:
    findLiveHostFrontTheoremsPath,
    namedClosedHostFrontTheoremsSubsetNames,
    namedClosedHostFrontTheoremsCompileOrder,
    barrelListsNamedHostFrontTheoremsSubset,
    tryCompileNamedHostFrontTheoremsSubset,
    tryCompileAfterHostFrontTheoremsDeps.
    Membership list is barrel order among the fourteen; skip
    Linear, skip IrGraph. HostFrontTheorems last after HostFront.
    Compile order is the prior thirteen compile order then
    HostFrontTheorems last. HostFrontTheorems imports HostFront.
    After-deps lists Mult first, then HostTerm, HostFrontGoldens,
    and HostFront so the planted sidecar compiles.
  - Fifteenth HostCheck wrapper lives here:
    findLiveHostCheckPath,
    namedClosedHostCheckSubsetNames,
    namedClosedHostCheckCompileOrder,
    barrelListsNamedHostCheckSubset,
    tryCompileNamedHostCheckSubset,
    tryCompileAfterHostCheckDeps.
    Membership list is barrel order among the fifteen; skip
    Linear, skip IrGraph. HostCheck last after HostFrontTheorems.
    Compile order is the prior fourteen compile order then
    HostCheck last. HostCheck imports HostFront.
    After-deps lists Mult first, then HostTerm, HostFrontGoldens,
    and HostFront so the planted sidecar compiles.
  - Sixteenth HostGraph wrapper lives here:
    findLiveHostGraphPath,
    namedClosedHostGraphSubsetNames,
    namedClosedHostGraphCompileOrder,
    barrelListsNamedHostGraphSubset,
    tryCompileNamedHostGraphSubset,
    tryCompileAfterHostGraphDeps.
    Membership list is barrel order among the sixteen; skip
    Linear, skip IrGraph. HostGraph last after HostCheck.
    Compile order is the prior fifteen compile order then
    HostGraph last. HostGraph imports HostFront and HostTerm.
    After-deps lists Mult first, then HostTerm, HostFrontGoldens,
    and HostFront so the planted sidecar compiles.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostTermPath, namedClosedHostTermSubsetNames,
  namedClosedHostTermCompileOrder,
  barrelListsNamedHostTermSubset,
  tryCompileNamedHostTermSubset, tryCompileAfterHostTermDeps,
  SystemsLean.HostTerm,
  findLiveHostFrontGoldensPath,
  namedClosedHostFrontGoldensSubsetNames,
  namedClosedHostFrontGoldensCompileOrder,
  barrelListsNamedHostFrontGoldensSubset,
  tryCompileNamedHostFrontGoldensSubset,
  tryCompileAfterHostFrontGoldensDeps,
  SystemsLean.HostFrontGoldens,
  findLiveHostFrontPath,
  namedClosedHostFrontSubsetNames,
  namedClosedHostFrontCompileOrder,
  barrelListsNamedHostFrontSubset,
  tryCompileNamedHostFrontSubset, tryCompileAfterHostFrontDeps,
  SystemsLean.HostFront,
  findLiveHostFrontTheoremsPath,
  namedClosedHostFrontTheoremsSubsetNames,
  namedClosedHostFrontTheoremsCompileOrder,
  barrelListsNamedHostFrontTheoremsSubset,
  tryCompileNamedHostFrontTheoremsSubset,
  tryCompileAfterHostFrontTheoremsDeps,
  SystemsLean.HostFrontTheorems,
  findLiveHostCheckPath,
  namedClosedHostCheckSubsetNames,
  namedClosedHostCheckCompileOrder,
  barrelListsNamedHostCheckSubset,
  tryCompileNamedHostCheckSubset,
  tryCompileAfterHostCheckDeps,
  SystemsLean.HostCheck,
  findLiveHostGraphPath,
  namedClosedHostGraphSubsetNames,
  namedClosedHostGraphCompileOrder,
  barrelListsNamedHostGraphSubset,
  tryCompileNamedHostGraphSubset,
  tryCompileAfterHostGraphDeps,
  SystemsLean.HostGraph,
  ElabMeetNamedWalkHostTerm, SystemsLean.ElabMeetNamedWalkHostTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostTerm; just systems-host.
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

/-- Resolve live SystemsLean/HostTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostTermPath. -/
def findLiveHostTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostTerm"

/-- Named closed HostTerm subset of the live SystemsLean
    library. Closed: every import of a member is also in the list.
    Membership list is barrel order among the eleven; skip Linear,
    skip IrGraph. HostTerm after ExtractTheorems.
    Greppable: namedClosedHostTermSubsetNames.
    SystemsLean.HostTerm. -/
def namedClosedHostTermSubsetNames : List String :=
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
  , "SystemsLean.HostTerm"
  ]

/-- Compile order honors imports: prior ten compile order then
    HostTerm last. HostTerm imports only Mult.
    Membership list vs compile order.
    Greppable: namedClosedHostTermCompileOrder. -/
def namedClosedHostTermCompileOrder : List String :=
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
  , "SystemsLean.HostTerm"
  ]

/-- True when the barrel lists each HostTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostTermSubset. -/
def barrelListsNamedHostTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostTermSubsetNames

/-- Compile the named HostTerm closed subset after reading
    the live lakefile. Eleven-module wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then search path, then Types, MultTheorems,
    TypesTheorems, Erasure, ErasureTheorems, Extract,
    ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm last.
    Greppable: tryCompileNamedHostTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostTerm. -/
unsafe def tryCompileNamedHostTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostTermSubsetNames
    namedClosedHostTermCompileOrder

@[implemented_by tryCompileNamedHostTermSubsetIO]
opaque tryCompileNamedHostTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostTerm closed subset.
    Greppable: tryCompileNamedHostTermSubset. -/
def tryCompileNamedHostTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, put that .olean on the search path, then
    compile srcPath as thmMod. HostTerm imports only Mult.
    Do not plant on the live tree.
    Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult"]

@[implemented_by tryCompileAfterHostTermDepsIO]
opaque tryCompileAfterHostTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostTerm deps.
    Greppable: tryCompileAfterHostTermDeps. -/
def tryCompileAfterHostTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostFrontGoldens.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostFrontGoldensPath. -/
def findLiveHostFrontGoldensPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostFrontGoldens"

/-- Named closed HostFrontGoldens subset of the live SystemsLean
    library. Closed: every import of a member is also in the list.
    Membership list is barrel order among the twelve; skip Linear,
    skip IrGraph. HostFrontGoldens last after HostTerm.
    Greppable: namedClosedHostFrontGoldensSubsetNames.
    SystemsLean.HostFrontGoldens. -/
def namedClosedHostFrontGoldensSubsetNames : List String :=
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
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  ]

/-- Compile order honors imports: prior eleven compile order then
    HostFrontGoldens last. HostFrontGoldens has no SystemsLean
    imports.
    Membership list vs compile order.
    Greppable: namedClosedHostFrontGoldensCompileOrder. -/
def namedClosedHostFrontGoldensCompileOrder : List String :=
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
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  ]

/-- True when the barrel lists each HostFrontGoldens subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostFrontGoldensSubset. -/
def barrelListsNamedHostFrontGoldensSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostFrontGoldensSubsetNames

/-- Compile the named HostFrontGoldens closed subset after reading
    the live lakefile. Twelve-module wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then search path, then Types, MultTheorems,
    TypesTheorems, Erasure, ErasureTheorems, Extract,
    ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm,
    HostFrontGoldens last.
    Greppable: tryCompileNamedHostFrontGoldensSubset.
    tryCompileOnDiskModule. SystemsLean.HostFrontGoldens. -/
unsafe def tryCompileNamedHostFrontGoldensSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostFrontGoldensSubsetNames
    namedClosedHostFrontGoldensCompileOrder

@[implemented_by tryCompileNamedHostFrontGoldensSubsetIO]
opaque tryCompileNamedHostFrontGoldensSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostFrontGoldens closed subset.
    Greppable: tryCompileNamedHostFrontGoldensSubset. -/
def tryCompileNamedHostFrontGoldensSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostFrontGoldensSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, put that .olean on the search path, then
    compile srcPath as thmMod. HostFrontGoldens has no SystemsLean
    imports; helper still requires Mult first; sidecar is Goldens
    plus planted error. Do not plant on the live tree.
    Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostFrontGoldensDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostFrontGoldensDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult"]

@[implemented_by tryCompileAfterHostFrontGoldensDepsIO]
opaque tryCompileAfterHostFrontGoldensDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostFrontGoldens deps.
    Greppable: tryCompileAfterHostFrontGoldensDeps. -/
def tryCompileAfterHostFrontGoldensDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostFrontGoldensDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostFront.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostFrontPath. -/
def findLiveHostFrontPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostFront"

/-- Named closed HostFront subset of the live SystemsLean
    library. Closed: every import of a member is also in the list.
    Membership list is barrel order among the thirteen; skip Linear,
    skip IrGraph. HostFront last after HostFrontGoldens.
    Greppable: namedClosedHostFrontSubsetNames.
    SystemsLean.HostFront. -/
def namedClosedHostFrontSubsetNames : List String :=
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
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  , "SystemsLean.HostFront"
  ]

/-- Compile order honors imports: prior twelve compile order then
    HostFront last. HostFront imports HostTerm, Mult, and
    HostFrontGoldens.
    Membership list vs compile order.
    Greppable: namedClosedHostFrontCompileOrder. -/
def namedClosedHostFrontCompileOrder : List String :=
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
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  , "SystemsLean.HostFront"
  ]

/-- True when the barrel lists each HostFront subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostFrontSubset. -/
def barrelListsNamedHostFrontSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostFrontSubsetNames

/-- Compile the named HostFront closed subset after reading
    the live lakefile. Thirteen-module wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then search path, then Types, MultTheorems,
    TypesTheorems, Erasure, ErasureTheorems, Extract,
    ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm,
    HostFrontGoldens, HostFront last.
    Greppable: tryCompileNamedHostFrontSubset.
    tryCompileOnDiskModule. SystemsLean.HostFront. -/
unsafe def tryCompileNamedHostFrontSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostFrontSubsetNames
    namedClosedHostFrontCompileOrder

@[implemented_by tryCompileNamedHostFrontSubsetIO]
opaque tryCompileNamedHostFrontSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostFront closed subset.
    Greppable: tryCompileNamedHostFrontSubset. -/
def tryCompileNamedHostFrontSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostFrontSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, HostTerm, and HostFrontGoldens, put those
    .olean files on the search path, then compile srcPath as
    thmMod. HostFront imports HostTerm, Mult, and
    HostFrontGoldens. Do not plant on the live tree.
    Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostFrontDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostFrontDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.HostTerm",
      "SystemsLean.HostFrontGoldens"]

@[implemented_by tryCompileAfterHostFrontDepsIO]
opaque tryCompileAfterHostFrontDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostFront deps.
    Greppable: tryCompileAfterHostFrontDeps. -/
def tryCompileAfterHostFrontDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostFrontDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostFrontTheorems.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostFrontTheoremsPath. -/
def findLiveHostFrontTheoremsPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostFrontTheorems"

/-- Named closed HostFrontTheorems subset of the live SystemsLean
    library. Closed: every import of a member is also in the list.
    Membership list is barrel order among the fourteen; skip Linear,
    skip IrGraph. HostFrontTheorems last after HostFront.
    Greppable: namedClosedHostFrontTheoremsSubsetNames.
    SystemsLean.HostFrontTheorems. -/
def namedClosedHostFrontTheoremsSubsetNames : List String :=
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
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  , "SystemsLean.HostFront"
  , "SystemsLean.HostFrontTheorems"
  ]

/-- Compile order honors imports: prior thirteen compile order then
    HostFrontTheorems last. HostFrontTheorems imports HostFront.
    Membership list vs compile order.
    Greppable: namedClosedHostFrontTheoremsCompileOrder. -/
def namedClosedHostFrontTheoremsCompileOrder : List String :=
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
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  , "SystemsLean.HostFront"
  , "SystemsLean.HostFrontTheorems"
  ]

/-- True when the barrel lists each HostFrontTheorems subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostFrontTheoremsSubset. -/
def barrelListsNamedHostFrontTheoremsSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostFrontTheoremsSubsetNames

/-- Compile the named HostFrontTheorems closed subset after reading
    the live lakefile. Fourteen-module wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then search path, then Types, MultTheorems,
    TypesTheorems, Erasure, ErasureTheorems, Extract,
    ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm,
    HostFrontGoldens, HostFront, HostFrontTheorems last.
    Greppable: tryCompileNamedHostFrontTheoremsSubset.
    tryCompileOnDiskModule. SystemsLean.HostFrontTheorems. -/
unsafe def tryCompileNamedHostFrontTheoremsSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostFrontTheoremsSubsetNames
    namedClosedHostFrontTheoremsCompileOrder

@[implemented_by tryCompileNamedHostFrontTheoremsSubsetIO]
opaque tryCompileNamedHostFrontTheoremsSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostFrontTheorems closed subset.
    Greppable: tryCompileNamedHostFrontTheoremsSubset. -/
def tryCompileNamedHostFrontTheoremsSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostFrontTheoremsSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, HostTerm, HostFrontGoldens, and HostFront,
    put those .olean files on the search path, then compile srcPath
    as thmMod. HostFrontTheorems imports HostFront. HostFront
    imports HostTerm, Mult, and HostFrontGoldens. Do not plant on
    the live tree.
    Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostFrontTheoremsDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostFrontTheoremsDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.HostTerm",
      "SystemsLean.HostFrontGoldens", "SystemsLean.HostFront"]

@[implemented_by tryCompileAfterHostFrontTheoremsDepsIO]
opaque tryCompileAfterHostFrontTheoremsDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostFrontTheorems deps.
    Greppable: tryCompileAfterHostFrontTheoremsDeps. -/
def tryCompileAfterHostFrontTheoremsDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostFrontTheoremsDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostCheck.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostCheckPath. -/
def findLiveHostCheckPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostCheck"

/-- Named closed HostCheck subset of the live SystemsLean
    library. Closed: every import of a member is also in the list.
    Membership list is barrel order among the fifteen; skip Linear,
    skip IrGraph. HostCheck last after HostFrontTheorems.
    Greppable: namedClosedHostCheckSubsetNames.
    SystemsLean.HostCheck. -/
def namedClosedHostCheckSubsetNames : List String :=
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
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  , "SystemsLean.HostFront"
  , "SystemsLean.HostFrontTheorems"
  , "SystemsLean.HostCheck"
  ]

/-- Compile order honors imports: prior fourteen compile order then
    HostCheck last. HostCheck imports HostFront.
    Membership list vs compile order.
    Greppable: namedClosedHostCheckCompileOrder. -/
def namedClosedHostCheckCompileOrder : List String :=
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
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  , "SystemsLean.HostFront"
  , "SystemsLean.HostFrontTheorems"
  , "SystemsLean.HostCheck"
  ]

/-- True when the barrel lists each HostCheck subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostCheckSubset. -/
def barrelListsNamedHostCheckSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostCheckSubsetNames

/-- Compile the named HostCheck closed subset after reading
    the live lakefile. Fifteen-module wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then search path, then Types, MultTheorems,
    TypesTheorems, Erasure, ErasureTheorems, Extract,
    ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm,
    HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck last.
    Greppable: tryCompileNamedHostCheckSubset.
    tryCompileOnDiskModule. SystemsLean.HostCheck. -/
unsafe def tryCompileNamedHostCheckSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostCheckSubsetNames
    namedClosedHostCheckCompileOrder

@[implemented_by tryCompileNamedHostCheckSubsetIO]
opaque tryCompileNamedHostCheckSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostCheck closed subset.
    Greppable: tryCompileNamedHostCheckSubset. -/
def tryCompileNamedHostCheckSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostCheckSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, HostTerm, HostFrontGoldens, and HostFront,
    put those .olean files on the search path, then compile srcPath
    as thmMod. HostCheck imports HostFront. HostFront
    imports HostTerm, Mult, and HostFrontGoldens. Do not plant on
    the live tree.
    Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostCheckDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostCheckDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.HostTerm",
      "SystemsLean.HostFrontGoldens", "SystemsLean.HostFront"]

@[implemented_by tryCompileAfterHostCheckDepsIO]
opaque tryCompileAfterHostCheckDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostCheck deps.
    Greppable: tryCompileAfterHostCheckDeps. -/
def tryCompileAfterHostCheckDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostCheckDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostGraph.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostGraphPath. -/
def findLiveHostGraphPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostGraph"

/-- Named closed HostGraph subset of the live SystemsLean
    library. Closed: every import of a member is also in the list.
    Membership list is barrel order among the sixteen; skip Linear,
    skip IrGraph. HostGraph last after HostCheck.
    Greppable: namedClosedHostGraphSubsetNames.
    SystemsLean.HostGraph. -/
def namedClosedHostGraphSubsetNames : List String :=
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
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  , "SystemsLean.HostFront"
  , "SystemsLean.HostFrontTheorems"
  , "SystemsLean.HostCheck"
  , "SystemsLean.HostGraph"
  ]

/-- Compile order honors imports: prior fifteen compile order then
    HostGraph last. HostGraph imports HostFront and HostTerm.
    Membership list vs compile order.
    Greppable: namedClosedHostGraphCompileOrder. -/
def namedClosedHostGraphCompileOrder : List String :=
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
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  , "SystemsLean.HostFront"
  , "SystemsLean.HostFrontTheorems"
  , "SystemsLean.HostCheck"
  , "SystemsLean.HostGraph"
  ]

/-- True when the barrel lists each HostGraph subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostGraphSubset. -/
def barrelListsNamedHostGraphSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostGraphSubsetNames

/-- Compile the named HostGraph closed subset after reading
    the live lakefile. Sixteen-module wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then search path, then Types, MultTheorems,
    TypesTheorems, Erasure, ErasureTheorems, Extract,
    ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm,
    HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck,
    HostGraph last.
    Greppable: tryCompileNamedHostGraphSubset.
    tryCompileOnDiskModule. SystemsLean.HostGraph. -/
unsafe def tryCompileNamedHostGraphSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostGraphSubsetNames
    namedClosedHostGraphCompileOrder

@[implemented_by tryCompileNamedHostGraphSubsetIO]
opaque tryCompileNamedHostGraphSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostGraph closed subset.
    Greppable: tryCompileNamedHostGraphSubset. -/
def tryCompileNamedHostGraphSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostGraphSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, HostTerm, HostFrontGoldens, and HostFront,
    put those .olean files on the search path, then compile srcPath
    as thmMod. HostGraph imports HostFront and HostTerm. HostFront
    imports HostTerm, Mult, and HostFrontGoldens. Do not plant on
    the live tree.
    Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostGraphDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostGraphDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.HostTerm",
      "SystemsLean.HostFrontGoldens", "SystemsLean.HostFront"]

@[implemented_by tryCompileAfterHostGraphDepsIO]
opaque tryCompileAfterHostGraphDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostGraph deps.
    Greppable: tryCompileAfterHostGraphDeps. -/
def tryCompileAfterHostGraphDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostGraphDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
