/-
  SYSTEMS_LEAN_HOST partial -- twenty-first HostImportGraphSeeds,
  twenty-second HostImportGraphModel, twenty-third
  HostImportGraphMods, and twenty-fourth HostImportGraphModsLater
  named-walk wrappers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostPackageWrite stays
  622 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior twenty wrappers stay in
  ElabMeetNamedWalkHostPackageWrite. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not add ElabMeetNamedWalkHostImportGraphMods.

  Spec (readable):
  - Twenty-first HostImportGraphSeeds wrapper lives here:
    findLiveHostImportGraphSeedsPath,
    namedClosedHostImportGraphSeedsSubsetNames,
    namedClosedHostImportGraphSeedsCompileOrder,
    barrelListsNamedHostImportGraphSeedsSubset,
    tryCompileNamedHostImportGraphSeedsSubset,
    tryCompileAfterHostImportGraphSeedsDeps.
    Named membership is the prior twenty plus
    HostImportGraphSeeds last. Barrel order among the
    twenty-one; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the twentieth compile order, then
    HostImportGraphSeeds last. IrGraph and HostCompose are
    compile dependencies only. After-deps are the twentieth
    after-deps plus HostPackageRoots. HostImportGraphSeeds
    has no imports (a leaf, not a twenty-one-import closure).
    Do not plant live HostImportGraphSeeds.lean.
  - Twenty-second HostImportGraphModel wrapper lives here:
    findLiveHostImportGraphModelPath,
    namedClosedHostImportGraphModelSubsetNames,
    namedClosedHostImportGraphModelCompileOrder,
    barrelListsNamedHostImportGraphModelSubset,
    tryCompileNamedHostImportGraphModelSubset,
    tryCompileAfterHostImportGraphModelDeps.
    Named membership is the prior twenty-one plus
    HostImportGraphModel last. Barrel order among the
    twenty-two; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the twenty-first compile order, then
    HostImportGraphModel last. IrGraph and HostCompose are
    compile dependencies only. After-deps are the twenty-first
    after-deps plus HostImportGraphSeeds. HostImportGraphModel
    imports HostImportGraphSeeds. Do not plant live
    HostImportGraphModel.lean.
  - Twenty-third HostImportGraphMods wrapper lives here:
    findLiveHostImportGraphModsPath,
    namedClosedHostImportGraphModsSubsetNames,
    namedClosedHostImportGraphModsCompileOrder,
    barrelListsNamedHostImportGraphModsSubset,
    tryCompileNamedHostImportGraphModsSubset,
    tryCompileAfterHostImportGraphModsDeps.
    Named membership is the prior twenty-two plus
    HostImportGraphMods last. Barrel order among the
    twenty-three; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the twenty-second compile order, then
    HostImportGraphMods last. IrGraph and HostCompose are
    compile dependencies only. After-deps are the twenty-second
    after-deps plus HostImportGraphModel. HostImportGraphMods
    imports HostImportGraphModel. Do not plant live
    HostImportGraphMods.lean.
  - Twenty-fourth HostImportGraphModsLater wrapper lives here:
    findLiveHostImportGraphModsLaterPath,
    namedClosedHostImportGraphModsLaterSubsetNames,
    namedClosedHostImportGraphModsLaterCompileOrder,
    barrelListsNamedHostImportGraphModsLaterSubset,
    tryCompileNamedHostImportGraphModsLaterSubset,
    tryCompileAfterHostImportGraphModsLaterDeps.
    Named membership is the prior twenty-three plus
    HostImportGraphModsLater last. Barrel order among the
    twenty-four; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the twenty-third compile order, then
    HostImportGraphModsLater last. IrGraph and HostCompose are
    compile dependencies only. After-deps are the twenty-third
    after-deps plus HostImportGraphMods. HostImportGraphModsLater
    imports HostImportGraphMods. Do not plant live
    HostImportGraphModsLater.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostImportGraphSeedsPath,
  namedClosedHostImportGraphSeedsSubsetNames,
  namedClosedHostImportGraphSeedsCompileOrder,
  barrelListsNamedHostImportGraphSeedsSubset,
  tryCompileNamedHostImportGraphSeedsSubset,
  tryCompileAfterHostImportGraphSeedsDeps,
  SystemsLean.HostImportGraphSeeds,
  findLiveHostImportGraphModelPath,
  namedClosedHostImportGraphModelSubsetNames,
  namedClosedHostImportGraphModelCompileOrder,
  barrelListsNamedHostImportGraphModelSubset,
  tryCompileNamedHostImportGraphModelSubset,
  tryCompileAfterHostImportGraphModelDeps,
  SystemsLean.HostImportGraphModel,
  findLiveHostImportGraphModsPath,
  namedClosedHostImportGraphModsSubsetNames,
  namedClosedHostImportGraphModsCompileOrder,
  barrelListsNamedHostImportGraphModsSubset,
  tryCompileNamedHostImportGraphModsSubset,
  tryCompileAfterHostImportGraphModsDeps,
  SystemsLean.HostImportGraphMods,
  findLiveHostImportGraphModsLaterPath,
  namedClosedHostImportGraphModsLaterSubsetNames,
  namedClosedHostImportGraphModsLaterCompileOrder,
  barrelListsNamedHostImportGraphModsLaterSubset,
  tryCompileNamedHostImportGraphModsLaterSubset,
  tryCompileAfterHostImportGraphModsLaterDeps,
  SystemsLean.HostImportGraphModsLater,
  ElabMeetNamedWalkHostImportGraphSeeds,
  SystemsLean.ElabMeetNamedWalkHostImportGraphSeeds,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostImportGraphSeeds
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostImportGraphSeeds;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostImportGraphSeeds.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostImportGraphSeedsPath. -/
def findLiveHostImportGraphSeedsPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostImportGraphSeeds"

/-- Named HostImportGraphSeeds subset of the live SystemsLean library.
    Membership is the prior twenty plus HostImportGraphSeeds last.
    Barrel order among the twenty-one; skip Linear, skip IrGraph,
    skip HostGraphMain. HostImportGraphSeeds has no imports (a leaf).
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostImportGraphSeedsSubsetNames.
    SystemsLean.HostImportGraphSeeds. -/
def namedClosedHostImportGraphSeedsSubsetNames : List String :=
  namedClosedHostPackageRootsSubsetNames ++
    ["SystemsLean.HostImportGraphSeeds"]

/-- Compile order honors imports: twentieth compile order, then
    HostImportGraphSeeds last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostImportGraphSeedsCompileOrder. -/
def namedClosedHostImportGraphSeedsCompileOrder : List String :=
  namedClosedHostPackageRootsCompileOrder ++
    ["SystemsLean.HostImportGraphSeeds"]

/-- True when the barrel lists each HostImportGraphSeeds subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostImportGraphSeedsSubset. -/
def barrelListsNamedHostImportGraphSeedsSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostImportGraphSeedsSubsetNames

/-- Compile the named HostImportGraphSeeds subset after reading
    the live lakefile. Twenty-one-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the twentieth compile order, then
    HostImportGraphSeeds last.
    Greppable: tryCompileNamedHostImportGraphSeedsSubset.
    tryCompileOnDiskModule. SystemsLean.HostImportGraphSeeds. -/
unsafe def tryCompileNamedHostImportGraphSeedsSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostImportGraphSeedsSubsetNames
    namedClosedHostImportGraphSeedsCompileOrder

@[implemented_by tryCompileNamedHostImportGraphSeedsSubsetIO]
opaque tryCompileNamedHostImportGraphSeedsSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostImportGraphSeeds subset.
    Greppable: tryCompileNamedHostImportGraphSeedsSubset. -/
def tryCompileNamedHostImportGraphSeedsSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostImportGraphSeedsSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, and HostPackageRoots, put those
    .olean files on the search path, then compile srcPath as
    thmMod. HostImportGraphSeeds has no imports (a leaf). IrGraph and
    HostCompose are compile dependencies only. Do not plant on
    the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostImportGraphSeedsDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostImportGraphSeedsDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.Types",
      "SystemsLean.IrProgram", "SystemsLean.IrGraph",
      "SystemsLean.Erasure", "SystemsLean.Extract",
      "SystemsLean.HostCompose", "SystemsLean.CompilePath",
      "SystemsLean.EmitMultScaffold", "SystemsLean.EmitLinearScaffold",
      "SystemsLean.EmitTypesScaffold", "SystemsLean.EmitProgramScaffold",
      "SystemsLean.EmitGraphScaffold", "SystemsLean.EmitComposeScaffold",
      "SystemsLean.EmitMult", "SystemsLean.EmitLinear",
      "SystemsLean.EmitTypes", "SystemsLean.EmitProgram",
      "SystemsLean.EmitGraph", "SystemsLean.EmitCompose",
      "SystemsLean.CompilePathMult", "SystemsLean.CompilePathLinear",
      "SystemsLean.CompilePathTypes", "SystemsLean.CompilePathProgram",
      "SystemsLean.CompilePathGraph", "SystemsLean.CompilePathCompose",
      "SystemsLean.FirstSurface", "SystemsLean.HostTerm",
      "SystemsLean.HostFrontGoldens", "SystemsLean.HostFront",
      "SystemsLean.HostGraph", "SystemsLean.MultSubsetEmit",
      "SystemsLean.LinearSubsetEmit", "SystemsLean.TypesSubsetEmit",
      "SystemsLean.ProgramSubsetEmit", "SystemsLean.GraphSubsetEmit",
      "SystemsLean.ComposeSubsetEmit", "SystemsLean.HostPackageWrite",
      "SystemsLean.HostPackageWriteTheorems",
      "SystemsLean.HostPackageRoots"]

@[implemented_by tryCompileAfterHostImportGraphSeedsDepsIO]
opaque tryCompileAfterHostImportGraphSeedsDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostImportGraphSeeds deps.
    Greppable: tryCompileAfterHostImportGraphSeedsDeps. -/
def tryCompileAfterHostImportGraphSeedsDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostImportGraphSeedsDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostImportGraphModel.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostImportGraphModelPath. -/
def findLiveHostImportGraphModelPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostImportGraphModel"

/-- Named HostImportGraphModel subset of the live SystemsLean library.
    Membership is the prior twenty-one plus HostImportGraphModel last.
    Barrel order among the twenty-two; skip Linear, skip IrGraph,
    skip HostGraphMain. HostImportGraphModel imports HostImportGraphSeeds.
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostImportGraphModelSubsetNames.
    SystemsLean.HostImportGraphModel. -/
def namedClosedHostImportGraphModelSubsetNames : List String :=
  namedClosedHostImportGraphSeedsSubsetNames ++
    ["SystemsLean.HostImportGraphModel"]

/-- Compile order honors imports: twenty-first compile order, then
    HostImportGraphModel last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostImportGraphModelCompileOrder. -/
def namedClosedHostImportGraphModelCompileOrder : List String :=
  namedClosedHostImportGraphSeedsCompileOrder ++
    ["SystemsLean.HostImportGraphModel"]

/-- True when the barrel lists each HostImportGraphModel subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostImportGraphModelSubset. -/
def barrelListsNamedHostImportGraphModelSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostImportGraphModelSubsetNames

/-- Compile the named HostImportGraphModel subset after reading
    the live lakefile. Twenty-two-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the twenty-first compile order, then
    HostImportGraphModel last.
    Greppable: tryCompileNamedHostImportGraphModelSubset.
    tryCompileOnDiskModule. SystemsLean.HostImportGraphModel. -/
unsafe def tryCompileNamedHostImportGraphModelSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostImportGraphModelSubsetNames
    namedClosedHostImportGraphModelCompileOrder

@[implemented_by tryCompileNamedHostImportGraphModelSubsetIO]
opaque tryCompileNamedHostImportGraphModelSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostImportGraphModel subset.
    Greppable: tryCompileNamedHostImportGraphModelSubset. -/
def tryCompileNamedHostImportGraphModelSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostImportGraphModelSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots, and
    HostImportGraphSeeds, put those .olean files on the search
    path, then compile srcPath as thmMod. HostImportGraphModel
    imports HostImportGraphSeeds. IrGraph and HostCompose are
    compile dependencies only. Do not plant on the live tree.
    Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostImportGraphModelDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostImportGraphModelDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.Types",
      "SystemsLean.IrProgram", "SystemsLean.IrGraph",
      "SystemsLean.Erasure", "SystemsLean.Extract",
      "SystemsLean.HostCompose", "SystemsLean.CompilePath",
      "SystemsLean.EmitMultScaffold", "SystemsLean.EmitLinearScaffold",
      "SystemsLean.EmitTypesScaffold", "SystemsLean.EmitProgramScaffold",
      "SystemsLean.EmitGraphScaffold", "SystemsLean.EmitComposeScaffold",
      "SystemsLean.EmitMult", "SystemsLean.EmitLinear",
      "SystemsLean.EmitTypes", "SystemsLean.EmitProgram",
      "SystemsLean.EmitGraph", "SystemsLean.EmitCompose",
      "SystemsLean.CompilePathMult", "SystemsLean.CompilePathLinear",
      "SystemsLean.CompilePathTypes", "SystemsLean.CompilePathProgram",
      "SystemsLean.CompilePathGraph", "SystemsLean.CompilePathCompose",
      "SystemsLean.FirstSurface", "SystemsLean.HostTerm",
      "SystemsLean.HostFrontGoldens", "SystemsLean.HostFront",
      "SystemsLean.HostGraph", "SystemsLean.MultSubsetEmit",
      "SystemsLean.LinearSubsetEmit", "SystemsLean.TypesSubsetEmit",
      "SystemsLean.ProgramSubsetEmit", "SystemsLean.GraphSubsetEmit",
      "SystemsLean.ComposeSubsetEmit", "SystemsLean.HostPackageWrite",
      "SystemsLean.HostPackageWriteTheorems",
      "SystemsLean.HostPackageRoots",
      "SystemsLean.HostImportGraphSeeds"]

@[implemented_by tryCompileAfterHostImportGraphModelDepsIO]
opaque tryCompileAfterHostImportGraphModelDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostImportGraphModel deps.
    Greppable: tryCompileAfterHostImportGraphModelDeps. -/
def tryCompileAfterHostImportGraphModelDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostImportGraphModelDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostImportGraphMods.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostImportGraphModsPath. -/
def findLiveHostImportGraphModsPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostImportGraphMods"

/-- Named HostImportGraphMods subset of the live SystemsLean library.
    Membership is the prior twenty-two plus HostImportGraphMods last.
    Barrel order among the twenty-three; skip Linear, skip IrGraph,
    skip HostGraphMain. HostImportGraphMods imports HostImportGraphModel.
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostImportGraphModsSubsetNames.
    SystemsLean.HostImportGraphMods. -/
def namedClosedHostImportGraphModsSubsetNames : List String :=
  namedClosedHostImportGraphModelSubsetNames ++
    ["SystemsLean.HostImportGraphMods"]

/-- Compile order honors imports: twenty-second compile order, then
    HostImportGraphMods last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostImportGraphModsCompileOrder. -/
def namedClosedHostImportGraphModsCompileOrder : List String :=
  namedClosedHostImportGraphModelCompileOrder ++
    ["SystemsLean.HostImportGraphMods"]

/-- True when the barrel lists each HostImportGraphMods subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostImportGraphModsSubset. -/
def barrelListsNamedHostImportGraphModsSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostImportGraphModsSubsetNames

/-- Compile the named HostImportGraphMods subset after reading
    the live lakefile. Twenty-three-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the twenty-second compile order, then
    HostImportGraphMods last.
    Greppable: tryCompileNamedHostImportGraphModsSubset.
    tryCompileOnDiskModule. SystemsLean.HostImportGraphMods. -/
unsafe def tryCompileNamedHostImportGraphModsSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostImportGraphModsSubsetNames
    namedClosedHostImportGraphModsCompileOrder

@[implemented_by tryCompileNamedHostImportGraphModsSubsetIO]
opaque tryCompileNamedHostImportGraphModsSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostImportGraphMods subset.
    Greppable: tryCompileNamedHostImportGraphModsSubset. -/
def tryCompileNamedHostImportGraphModsSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostImportGraphModsSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, and HostImportGraphModel, put those
    .olean files on the search path, then compile srcPath as
    thmMod. HostImportGraphMods imports HostImportGraphModel.
    IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostImportGraphModsDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostImportGraphModsDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.Types",
      "SystemsLean.IrProgram", "SystemsLean.IrGraph",
      "SystemsLean.Erasure", "SystemsLean.Extract",
      "SystemsLean.HostCompose", "SystemsLean.CompilePath",
      "SystemsLean.EmitMultScaffold", "SystemsLean.EmitLinearScaffold",
      "SystemsLean.EmitTypesScaffold", "SystemsLean.EmitProgramScaffold",
      "SystemsLean.EmitGraphScaffold", "SystemsLean.EmitComposeScaffold",
      "SystemsLean.EmitMult", "SystemsLean.EmitLinear",
      "SystemsLean.EmitTypes", "SystemsLean.EmitProgram",
      "SystemsLean.EmitGraph", "SystemsLean.EmitCompose",
      "SystemsLean.CompilePathMult", "SystemsLean.CompilePathLinear",
      "SystemsLean.CompilePathTypes", "SystemsLean.CompilePathProgram",
      "SystemsLean.CompilePathGraph", "SystemsLean.CompilePathCompose",
      "SystemsLean.FirstSurface", "SystemsLean.HostTerm",
      "SystemsLean.HostFrontGoldens", "SystemsLean.HostFront",
      "SystemsLean.HostGraph", "SystemsLean.MultSubsetEmit",
      "SystemsLean.LinearSubsetEmit", "SystemsLean.TypesSubsetEmit",
      "SystemsLean.ProgramSubsetEmit", "SystemsLean.GraphSubsetEmit",
      "SystemsLean.ComposeSubsetEmit", "SystemsLean.HostPackageWrite",
      "SystemsLean.HostPackageWriteTheorems",
      "SystemsLean.HostPackageRoots",
      "SystemsLean.HostImportGraphSeeds",
      "SystemsLean.HostImportGraphModel"]

@[implemented_by tryCompileAfterHostImportGraphModsDepsIO]
opaque tryCompileAfterHostImportGraphModsDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostImportGraphMods deps.
    Greppable: tryCompileAfterHostImportGraphModsDeps. -/
def tryCompileAfterHostImportGraphModsDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostImportGraphModsDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostImportGraphModsLater.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostImportGraphModsLaterPath. -/
def findLiveHostImportGraphModsLaterPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostImportGraphModsLater"

/-- Named HostImportGraphModsLater subset of the live SystemsLean library.
    Membership is the prior twenty-three plus HostImportGraphModsLater last.
    Barrel order among the twenty-four; skip Linear, skip IrGraph,
    skip HostGraphMain. HostImportGraphModsLater imports HostImportGraphMods.
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostImportGraphModsLaterSubsetNames.
    SystemsLean.HostImportGraphModsLater. -/
def namedClosedHostImportGraphModsLaterSubsetNames : List String :=
  namedClosedHostImportGraphModsSubsetNames ++
    ["SystemsLean.HostImportGraphModsLater"]

/-- Compile order honors imports: twenty-third compile order, then
    HostImportGraphModsLater last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostImportGraphModsLaterCompileOrder. -/
def namedClosedHostImportGraphModsLaterCompileOrder : List String :=
  namedClosedHostImportGraphModsCompileOrder ++
    ["SystemsLean.HostImportGraphModsLater"]

/-- True when the barrel lists each HostImportGraphModsLater subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostImportGraphModsLaterSubset. -/
def barrelListsNamedHostImportGraphModsLaterSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostImportGraphModsLaterSubsetNames

/-- Compile the named HostImportGraphModsLater subset after reading
    the live lakefile. Twenty-four-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the twenty-third compile order, then
    HostImportGraphModsLater last.
    Greppable: tryCompileNamedHostImportGraphModsLaterSubset.
    tryCompileOnDiskModule. SystemsLean.HostImportGraphModsLater. -/
unsafe def tryCompileNamedHostImportGraphModsLaterSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostImportGraphModsLaterSubsetNames
    namedClosedHostImportGraphModsLaterCompileOrder

@[implemented_by tryCompileNamedHostImportGraphModsLaterSubsetIO]
opaque tryCompileNamedHostImportGraphModsLaterSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostImportGraphModsLater subset.
    Greppable: tryCompileNamedHostImportGraphModsLaterSubset. -/
def tryCompileNamedHostImportGraphModsLaterSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostImportGraphModsLaterSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, HostImportGraphModel, and
    HostImportGraphMods, put those .olean files on the search
    path, then compile srcPath as thmMod. HostImportGraphModsLater
    imports HostImportGraphMods. IrGraph and HostCompose are
    compile dependencies only. Do not plant on the live tree.
    Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostImportGraphModsLaterDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostImportGraphModsLaterDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.Types",
      "SystemsLean.IrProgram", "SystemsLean.IrGraph",
      "SystemsLean.Erasure", "SystemsLean.Extract",
      "SystemsLean.HostCompose", "SystemsLean.CompilePath",
      "SystemsLean.EmitMultScaffold", "SystemsLean.EmitLinearScaffold",
      "SystemsLean.EmitTypesScaffold", "SystemsLean.EmitProgramScaffold",
      "SystemsLean.EmitGraphScaffold", "SystemsLean.EmitComposeScaffold",
      "SystemsLean.EmitMult", "SystemsLean.EmitLinear",
      "SystemsLean.EmitTypes", "SystemsLean.EmitProgram",
      "SystemsLean.EmitGraph", "SystemsLean.EmitCompose",
      "SystemsLean.CompilePathMult", "SystemsLean.CompilePathLinear",
      "SystemsLean.CompilePathTypes", "SystemsLean.CompilePathProgram",
      "SystemsLean.CompilePathGraph", "SystemsLean.CompilePathCompose",
      "SystemsLean.FirstSurface", "SystemsLean.HostTerm",
      "SystemsLean.HostFrontGoldens", "SystemsLean.HostFront",
      "SystemsLean.HostGraph", "SystemsLean.MultSubsetEmit",
      "SystemsLean.LinearSubsetEmit", "SystemsLean.TypesSubsetEmit",
      "SystemsLean.ProgramSubsetEmit", "SystemsLean.GraphSubsetEmit",
      "SystemsLean.ComposeSubsetEmit", "SystemsLean.HostPackageWrite",
      "SystemsLean.HostPackageWriteTheorems",
      "SystemsLean.HostPackageRoots",
      "SystemsLean.HostImportGraphSeeds",
      "SystemsLean.HostImportGraphModel",
      "SystemsLean.HostImportGraphMods"]

@[implemented_by tryCompileAfterHostImportGraphModsLaterDepsIO]
opaque tryCompileAfterHostImportGraphModsLaterDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostImportGraphModsLater deps.
    Greppable: tryCompileAfterHostImportGraphModsLaterDeps. -/
def tryCompileAfterHostImportGraphModsLaterDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostImportGraphModsLaterDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostImportGraphLoadOkLater.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostImportGraphLoadOkLaterPath. -/
def findLiveHostImportGraphLoadOkLaterPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostImportGraphLoadOkLater"

/-- Named HostImportGraphLoadOkLater subset of the live SystemsLean library.
    Membership is the prior twenty-four plus HostImportGraphLoadOkLater last.
    Barrel order among the twenty-five; skip Linear, skip IrGraph,
    skip HostGraphMain. HostImportGraphLoadOkLater imports
    HostImportGraphModsLater. Compile order holds the subset-emit closure.
    Greppable: namedClosedHostImportGraphLoadOkLaterSubsetNames.
    SystemsLean.HostImportGraphLoadOkLater. -/
def namedClosedHostImportGraphLoadOkLaterSubsetNames : List String :=
  namedClosedHostImportGraphModsLaterSubsetNames ++
    ["SystemsLean.HostImportGraphLoadOkLater"]

/-- Compile order honors imports: twenty-fourth compile order, then
    HostImportGraphLoadOkLater last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostImportGraphLoadOkLaterCompileOrder. -/
def namedClosedHostImportGraphLoadOkLaterCompileOrder : List String :=
  namedClosedHostImportGraphModsLaterCompileOrder ++
    ["SystemsLean.HostImportGraphLoadOkLater"]

/-- True when the barrel lists each HostImportGraphLoadOkLater subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostImportGraphLoadOkLaterSubset. -/
def barrelListsNamedHostImportGraphLoadOkLaterSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostImportGraphLoadOkLaterSubsetNames

/-- Compile the named HostImportGraphLoadOkLater subset after reading
    the live lakefile. Twenty-five-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the twenty-fourth compile order, then
    HostImportGraphLoadOkLater last.
    Greppable: tryCompileNamedHostImportGraphLoadOkLaterSubset.
    tryCompileOnDiskModule. SystemsLean.HostImportGraphLoadOkLater. -/
unsafe def tryCompileNamedHostImportGraphLoadOkLaterSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostImportGraphLoadOkLaterSubsetNames
    namedClosedHostImportGraphLoadOkLaterCompileOrder

@[implemented_by tryCompileNamedHostImportGraphLoadOkLaterSubsetIO]
opaque tryCompileNamedHostImportGraphLoadOkLaterSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostImportGraphLoadOkLater subset.
    Greppable: tryCompileNamedHostImportGraphLoadOkLaterSubset. -/
def tryCompileNamedHostImportGraphLoadOkLaterSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostImportGraphLoadOkLaterSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, HostImportGraphModel,
    HostImportGraphMods, and HostImportGraphModsLater, put those
    .olean files on the search path, then compile srcPath as thmMod.
    HostImportGraphLoadOkLater imports HostImportGraphModsLater.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostImportGraphLoadOkLaterDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostImportGraphLoadOkLaterDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.Types",
      "SystemsLean.IrProgram", "SystemsLean.IrGraph",
      "SystemsLean.Erasure", "SystemsLean.Extract",
      "SystemsLean.HostCompose", "SystemsLean.CompilePath",
      "SystemsLean.EmitMultScaffold", "SystemsLean.EmitLinearScaffold",
      "SystemsLean.EmitTypesScaffold", "SystemsLean.EmitProgramScaffold",
      "SystemsLean.EmitGraphScaffold", "SystemsLean.EmitComposeScaffold",
      "SystemsLean.EmitMult", "SystemsLean.EmitLinear",
      "SystemsLean.EmitTypes", "SystemsLean.EmitProgram",
      "SystemsLean.EmitGraph", "SystemsLean.EmitCompose",
      "SystemsLean.CompilePathMult", "SystemsLean.CompilePathLinear",
      "SystemsLean.CompilePathTypes", "SystemsLean.CompilePathProgram",
      "SystemsLean.CompilePathGraph", "SystemsLean.CompilePathCompose",
      "SystemsLean.FirstSurface", "SystemsLean.HostTerm",
      "SystemsLean.HostFrontGoldens", "SystemsLean.HostFront",
      "SystemsLean.HostGraph", "SystemsLean.MultSubsetEmit",
      "SystemsLean.LinearSubsetEmit", "SystemsLean.TypesSubsetEmit",
      "SystemsLean.ProgramSubsetEmit", "SystemsLean.GraphSubsetEmit",
      "SystemsLean.ComposeSubsetEmit", "SystemsLean.HostPackageWrite",
      "SystemsLean.HostPackageWriteTheorems",
      "SystemsLean.HostPackageRoots",
      "SystemsLean.HostImportGraphSeeds",
      "SystemsLean.HostImportGraphModel",
      "SystemsLean.HostImportGraphMods",
      "SystemsLean.HostImportGraphModsLater"]

@[implemented_by tryCompileAfterHostImportGraphLoadOkLaterDepsIO]
opaque tryCompileAfterHostImportGraphLoadOkLaterDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostImportGraphLoadOkLater deps.
    Greppable: tryCompileAfterHostImportGraphLoadOkLaterDeps. -/
def tryCompileAfterHostImportGraphLoadOkLaterDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostImportGraphLoadOkLaterDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet

