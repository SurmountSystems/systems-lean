/-
  SYSTEMS_LEAN_HOST partial -- twenty-sixth HostImportGraphWalkLater,
  twenty-seventh HostImportGraphWalk, twenty-eighth
  HostModuleCheckRequiredDecls, twenty-ninth
  HostModuleCheckRequiredDeclsProduct, and thirtieth
  HostModuleCheckRequiredDeclsLater named-walk wrappers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostImportGraphSeeds stays
  693 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior twenty-five wrappers stay in
  ElabMeetNamedWalkHostImportGraphSeeds. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not add ElabMeetNamedWalkHostImportGraphLoadOk.
  Twenty-eighth wrappers stay here (measured 327 plus one
  wrapper family stays under about 780). Do not invent a new
  walk. Do not plant live HostImportGraphWalk.lean. Do not
  plant live HostModuleCheckRequiredDecls.lean. Do not
  plant live HostModuleCheckRequiredDeclsProduct.lean. Do not
  plant live HostModuleCheckRequiredDeclsLater.lean.

  Spec (readable):
  - Twenty-sixth HostImportGraphWalkLater wrapper lives here:
    findLiveHostImportGraphWalkLaterPath,
    namedClosedHostImportGraphWalkLaterSubsetNames,
    namedClosedHostImportGraphWalkLaterCompileOrder,
    barrelListsNamedHostImportGraphWalkLaterSubset,
    tryCompileNamedHostImportGraphWalkLaterSubset,
    tryCompileAfterHostImportGraphWalkLaterDeps.
    Named membership is the prior twenty-five plus
    HostImportGraphWalkLater last. Barrel order among the
    twenty-six; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the twenty-fifth compile order, then
    HostImportGraphWalkLater last. IrGraph and HostCompose are
    compile dependencies only. After-deps are the twenty-fifth
    after-deps plus HostImportGraphLoadOkLater.
    HostImportGraphWalkLater imports HostImportGraphModel.
    Do not plant live HostImportGraphWalkLater.lean.
  - Twenty-seventh HostImportGraphWalk wrapper lives here:
    findLiveHostImportGraphWalkPath,
    namedClosedHostImportGraphWalkSubsetNames,
    namedClosedHostImportGraphWalkCompileOrder,
    barrelListsNamedHostImportGraphWalkSubset,
    tryCompileNamedHostImportGraphWalkSubset,
    tryCompileAfterHostImportGraphWalkDeps.
    Named membership is the prior twenty-six plus
    HostImportGraphWalk last. Barrel order among the
    twenty-seven; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the twenty-sixth compile order, then
    HostImportGraphWalk last. After-deps are the twenty-sixth
    after-deps plus HostImportGraphWalkLater.
    HostImportGraphWalk imports HostImportGraphModel and
    HostImportGraphWalkLater. Do not plant live
    HostImportGraphWalk.lean.
  - Twenty-eighth HostModuleCheckRequiredDecls wrapper lives here:
    findLiveHostModuleCheckRequiredDeclsPath,
    namedClosedHostModuleCheckRequiredDeclsSubsetNames,
    namedClosedHostModuleCheckRequiredDeclsCompileOrder,
    barrelListsNamedHostModuleCheckRequiredDeclsSubset,
    tryCompileNamedHostModuleCheckRequiredDeclsSubset,
    tryCompileAfterHostModuleCheckRequiredDeclsDeps.
    Named membership is the prior twenty-seven plus
    HostModuleCheckRequiredDecls last. Barrel order among the
    twenty-eight; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the twenty-seventh compile order, then
    HostModuleCheckRequiredDecls last. After-deps are the
    twenty-seventh after-deps plus HostImportGraphWalk.
    HostModuleCheckRequiredDecls has no imports. Do not plant
    live HostModuleCheckRequiredDecls.lean.
  - Twenty-ninth HostModuleCheckRequiredDeclsProduct wrapper lives here:
    findLiveHostModuleCheckRequiredDeclsProductPath,
    namedClosedHostModuleCheckRequiredDeclsProductSubsetNames,
    namedClosedHostModuleCheckRequiredDeclsProductCompileOrder,
    barrelListsNamedHostModuleCheckRequiredDeclsProductSubset,
    tryCompileNamedHostModuleCheckRequiredDeclsProductSubset,
    tryCompileAfterHostModuleCheckRequiredDeclsProductDeps.
    Named membership is the prior twenty-eight plus
    HostModuleCheckRequiredDeclsProduct last. Barrel order among the
    twenty-nine; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the twenty-eighth compile order, then
    HostModuleCheckRequiredDeclsProduct last. After-deps are the
    twenty-eighth after-deps plus HostModuleCheckRequiredDecls.
    HostModuleCheckRequiredDeclsProduct has no imports. Do not plant
    live HostModuleCheckRequiredDeclsProduct.lean.
  - Thirtieth HostModuleCheckRequiredDeclsLater wrapper lives here:
    findLiveHostModuleCheckRequiredDeclsLaterPath,
    namedClosedHostModuleCheckRequiredDeclsLaterSubsetNames,
    namedClosedHostModuleCheckRequiredDeclsLaterCompileOrder,
    barrelListsNamedHostModuleCheckRequiredDeclsLaterSubset,
    tryCompileNamedHostModuleCheckRequiredDeclsLaterSubset,
    tryCompileAfterHostModuleCheckRequiredDeclsLaterDeps.
    Named membership is the prior twenty-nine plus
    HostModuleCheckRequiredDeclsLater last. Barrel order among the
    thirty; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the twenty-ninth compile order, then
    HostModuleCheckRequiredDeclsLater last. After-deps are the
    twenty-ninth after-deps plus HostModuleCheckRequiredDeclsProduct.
    HostModuleCheckRequiredDeclsLater has no imports. Do not plant
    live HostModuleCheckRequiredDeclsLater.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostImportGraphWalkLaterPath,
  namedClosedHostImportGraphWalkLaterSubsetNames,
  namedClosedHostImportGraphWalkLaterCompileOrder,
  barrelListsNamedHostImportGraphWalkLaterSubset,
  tryCompileNamedHostImportGraphWalkLaterSubset,
  tryCompileAfterHostImportGraphWalkLaterDeps,
  findLiveHostImportGraphWalkPath,
  namedClosedHostImportGraphWalkSubsetNames,
  namedClosedHostImportGraphWalkCompileOrder,
  barrelListsNamedHostImportGraphWalkSubset,
  tryCompileNamedHostImportGraphWalkSubset,
  tryCompileAfterHostImportGraphWalkDeps,
  findLiveHostModuleCheckRequiredDeclsPath,
  namedClosedHostModuleCheckRequiredDeclsSubsetNames,
  namedClosedHostModuleCheckRequiredDeclsCompileOrder,
  barrelListsNamedHostModuleCheckRequiredDeclsSubset,
  tryCompileNamedHostModuleCheckRequiredDeclsSubset,
  tryCompileAfterHostModuleCheckRequiredDeclsDeps,
  findLiveHostModuleCheckRequiredDeclsProductPath,
  namedClosedHostModuleCheckRequiredDeclsProductSubsetNames,
  namedClosedHostModuleCheckRequiredDeclsProductCompileOrder,
  barrelListsNamedHostModuleCheckRequiredDeclsProductSubset,
  tryCompileNamedHostModuleCheckRequiredDeclsProductSubset,
  tryCompileAfterHostModuleCheckRequiredDeclsProductDeps,
  findLiveHostModuleCheckRequiredDeclsLaterPath,
  namedClosedHostModuleCheckRequiredDeclsLaterSubsetNames,
  namedClosedHostModuleCheckRequiredDeclsLaterCompileOrder,
  barrelListsNamedHostModuleCheckRequiredDeclsLaterSubset,
  tryCompileNamedHostModuleCheckRequiredDeclsLaterSubset,
  tryCompileAfterHostModuleCheckRequiredDeclsLaterDeps,
  SystemsLean.HostImportGraphWalkLater,
  SystemsLean.HostImportGraphWalk,
  SystemsLean.HostModuleCheckRequiredDecls,
  SystemsLean.HostModuleCheckRequiredDeclsProduct,
  SystemsLean.HostModuleCheckRequiredDeclsLater,
  ElabMeetNamedWalkHostImportGraphWalkLater,
  SystemsLean.ElabMeetNamedWalkHostImportGraphWalkLater,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostImportGraphWalkLater
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostImportGraphWalkLater;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostImportGraphWalkLater.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostImportGraphWalkLaterPath. -/
def findLiveHostImportGraphWalkLaterPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostImportGraphWalkLater"

/-- Named HostImportGraphWalkLater subset of the live SystemsLean library.
    Membership is the prior twenty-five plus HostImportGraphWalkLater last.
    Barrel order among the twenty-six; skip Linear, skip IrGraph,
    skip HostGraphMain. HostImportGraphWalkLater imports
    HostImportGraphModel. Compile order holds the subset-emit closure.
    Greppable: namedClosedHostImportGraphWalkLaterSubsetNames.
    SystemsLean.HostImportGraphWalkLater. -/
def namedClosedHostImportGraphWalkLaterSubsetNames : List String :=
  namedClosedHostImportGraphLoadOkLaterSubsetNames ++
    ["SystemsLean.HostImportGraphWalkLater"]

/-- Compile order honors imports: twenty-fifth compile order, then
    HostImportGraphWalkLater last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostImportGraphWalkLaterCompileOrder. -/
def namedClosedHostImportGraphWalkLaterCompileOrder : List String :=
  namedClosedHostImportGraphLoadOkLaterCompileOrder ++
    ["SystemsLean.HostImportGraphWalkLater"]

/-- True when the barrel lists each HostImportGraphWalkLater subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostImportGraphWalkLaterSubset. -/
def barrelListsNamedHostImportGraphWalkLaterSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostImportGraphWalkLaterSubsetNames

/-- Compile the named HostImportGraphWalkLater subset after reading
    the live lakefile. Twenty-six-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the twenty-fifth compile order, then
    HostImportGraphWalkLater last.
    Greppable: tryCompileNamedHostImportGraphWalkLaterSubset.
    tryCompileOnDiskModule. SystemsLean.HostImportGraphWalkLater. -/
unsafe def tryCompileNamedHostImportGraphWalkLaterSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostImportGraphWalkLaterSubsetNames
    namedClosedHostImportGraphWalkLaterCompileOrder

@[implemented_by tryCompileNamedHostImportGraphWalkLaterSubsetIO]
opaque tryCompileNamedHostImportGraphWalkLaterSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostImportGraphWalkLater subset.
    Greppable: tryCompileNamedHostImportGraphWalkLaterSubset. -/
def tryCompileNamedHostImportGraphWalkLaterSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostImportGraphWalkLaterSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, HostImportGraphModel,
    HostImportGraphMods, HostImportGraphModsLater, and
    HostImportGraphLoadOkLater, put those .olean files on the
    search path, then compile srcPath as thmMod.
    HostImportGraphWalkLater imports HostImportGraphModel.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostImportGraphWalkLaterDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostImportGraphWalkLaterDepsIO
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
      "SystemsLean.HostImportGraphModsLater",
      "SystemsLean.HostImportGraphLoadOkLater"]

@[implemented_by tryCompileAfterHostImportGraphWalkLaterDepsIO]
opaque tryCompileAfterHostImportGraphWalkLaterDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostImportGraphWalkLater deps.
    Greppable: tryCompileAfterHostImportGraphWalkLaterDeps. -/
def tryCompileAfterHostImportGraphWalkLaterDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostImportGraphWalkLaterDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostImportGraphWalk.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostImportGraphWalkPath. -/
def findLiveHostImportGraphWalkPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostImportGraphWalk"

/-- Named HostImportGraphWalk subset of the live SystemsLean library.
    Membership is the prior twenty-six plus HostImportGraphWalk last.
    Barrel order among the twenty-seven; skip Linear, skip IrGraph,
    skip HostGraphMain. HostImportGraphWalk imports
    HostImportGraphModel and HostImportGraphWalkLater. Compile
    order holds the subset-emit closure.
    Greppable: namedClosedHostImportGraphWalkSubsetNames.
    SystemsLean.HostImportGraphWalk. -/
def namedClosedHostImportGraphWalkSubsetNames : List String :=
  namedClosedHostImportGraphWalkLaterSubsetNames ++
    ["SystemsLean.HostImportGraphWalk"]

/-- Compile order honors imports: twenty-sixth compile order, then
    HostImportGraphWalk last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostImportGraphWalkCompileOrder. -/
def namedClosedHostImportGraphWalkCompileOrder : List String :=
  namedClosedHostImportGraphWalkLaterCompileOrder ++
    ["SystemsLean.HostImportGraphWalk"]

/-- True when the barrel lists each HostImportGraphWalk subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostImportGraphWalkSubset. -/
def barrelListsNamedHostImportGraphWalkSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostImportGraphWalkSubsetNames

/-- Compile the named HostImportGraphWalk subset after reading
    the live lakefile. Twenty-seven-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the twenty-sixth compile order, then
    HostImportGraphWalk last.
    Greppable: tryCompileNamedHostImportGraphWalkSubset.
    tryCompileOnDiskModule. SystemsLean.HostImportGraphWalk. -/
unsafe def tryCompileNamedHostImportGraphWalkSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostImportGraphWalkSubsetNames
    namedClosedHostImportGraphWalkCompileOrder

@[implemented_by tryCompileNamedHostImportGraphWalkSubsetIO]
opaque tryCompileNamedHostImportGraphWalkSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostImportGraphWalk subset.
    Greppable: tryCompileNamedHostImportGraphWalkSubset. -/
def tryCompileNamedHostImportGraphWalkSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostImportGraphWalkSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, HostImportGraphModel,
    HostImportGraphMods, HostImportGraphModsLater,
    HostImportGraphLoadOkLater, and HostImportGraphWalkLater,
    put those .olean files on the search path, then compile
    srcPath as thmMod.
    HostImportGraphWalk imports HostImportGraphModel and
    HostImportGraphWalkLater.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostImportGraphWalkDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostImportGraphWalkDepsIO
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
      "SystemsLean.HostImportGraphModsLater",
      "SystemsLean.HostImportGraphLoadOkLater",
      "SystemsLean.HostImportGraphWalkLater"]

@[implemented_by tryCompileAfterHostImportGraphWalkDepsIO]
opaque tryCompileAfterHostImportGraphWalkDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostImportGraphWalk deps.
    Greppable: tryCompileAfterHostImportGraphWalkDeps. -/
def tryCompileAfterHostImportGraphWalkDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostImportGraphWalkDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostModuleCheckRequiredDecls.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckRequiredDeclsPath. -/
def findLiveHostModuleCheckRequiredDeclsPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckRequiredDecls"

/-- Named HostModuleCheckRequiredDecls subset of the live SystemsLean library.
    Membership is the prior twenty-seven plus HostModuleCheckRequiredDecls last.
    Barrel order among the twenty-eight; skip Linear, skip IrGraph,
    skip HostGraphMain. HostModuleCheckRequiredDecls has no imports.
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostModuleCheckRequiredDeclsSubsetNames.
    SystemsLean.HostModuleCheckRequiredDecls. -/
def namedClosedHostModuleCheckRequiredDeclsSubsetNames : List String :=
  namedClosedHostImportGraphWalkSubsetNames ++
    ["SystemsLean.HostModuleCheckRequiredDecls"]

/-- Compile order honors imports: twenty-seventh compile order, then
    HostModuleCheckRequiredDecls last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostModuleCheckRequiredDeclsCompileOrder. -/
def namedClosedHostModuleCheckRequiredDeclsCompileOrder : List String :=
  namedClosedHostImportGraphWalkCompileOrder ++
    ["SystemsLean.HostModuleCheckRequiredDecls"]

/-- True when the barrel lists each HostModuleCheckRequiredDecls subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckRequiredDeclsSubset. -/
def barrelListsNamedHostModuleCheckRequiredDeclsSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckRequiredDeclsSubsetNames

/-- Compile the named HostModuleCheckRequiredDecls subset after reading
    the live lakefile. Twenty-eight-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the twenty-seventh compile order, then
    HostModuleCheckRequiredDecls last.
    Greppable: tryCompileNamedHostModuleCheckRequiredDeclsSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckRequiredDecls. -/
unsafe def tryCompileNamedHostModuleCheckRequiredDeclsSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckRequiredDeclsSubsetNames
    namedClosedHostModuleCheckRequiredDeclsCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckRequiredDeclsSubsetIO]
opaque tryCompileNamedHostModuleCheckRequiredDeclsSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckRequiredDecls subset.
    Greppable: tryCompileNamedHostModuleCheckRequiredDeclsSubset. -/
def tryCompileNamedHostModuleCheckRequiredDeclsSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckRequiredDeclsSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, HostImportGraphModel,
    HostImportGraphMods, HostImportGraphModsLater,
    HostImportGraphLoadOkLater, HostImportGraphWalkLater, and
    HostImportGraphWalk, put those .olean files on the search
    path, then compile srcPath as thmMod.
    HostModuleCheckRequiredDecls has no imports.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckRequiredDeclsDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckRequiredDeclsDepsIO
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
      "SystemsLean.HostImportGraphModsLater",
      "SystemsLean.HostImportGraphLoadOkLater",
      "SystemsLean.HostImportGraphWalkLater",
      "SystemsLean.HostImportGraphWalk"]

@[implemented_by tryCompileAfterHostModuleCheckRequiredDeclsDepsIO]
opaque tryCompileAfterHostModuleCheckRequiredDeclsDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckRequiredDecls deps.
    Greppable: tryCompileAfterHostModuleCheckRequiredDeclsDeps. -/
def tryCompileAfterHostModuleCheckRequiredDeclsDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckRequiredDeclsDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostModuleCheckRequiredDeclsProduct.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckRequiredDeclsProductPath. -/
def findLiveHostModuleCheckRequiredDeclsProductPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckRequiredDeclsProduct"

/-- Named HostModuleCheckRequiredDeclsProduct subset of the live SystemsLean library.
    Membership is the prior twenty-eight plus HostModuleCheckRequiredDeclsProduct last.
    Barrel order among the twenty-nine; skip Linear, skip IrGraph,
    skip HostGraphMain. HostModuleCheckRequiredDeclsProduct has no imports.
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostModuleCheckRequiredDeclsProductSubsetNames.
    SystemsLean.HostModuleCheckRequiredDeclsProduct. -/
def namedClosedHostModuleCheckRequiredDeclsProductSubsetNames : List String :=
  namedClosedHostModuleCheckRequiredDeclsSubsetNames ++
    ["SystemsLean.HostModuleCheckRequiredDeclsProduct"]

/-- Compile order honors imports: twenty-eighth compile order, then
    HostModuleCheckRequiredDeclsProduct last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostModuleCheckRequiredDeclsProductCompileOrder. -/
def namedClosedHostModuleCheckRequiredDeclsProductCompileOrder : List String :=
  namedClosedHostModuleCheckRequiredDeclsCompileOrder ++
    ["SystemsLean.HostModuleCheckRequiredDeclsProduct"]

/-- True when the barrel lists each HostModuleCheckRequiredDeclsProduct subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckRequiredDeclsProductSubset. -/
def barrelListsNamedHostModuleCheckRequiredDeclsProductSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckRequiredDeclsProductSubsetNames

/-- Compile the named HostModuleCheckRequiredDeclsProduct subset after reading
    the live lakefile. Twenty-nine-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the twenty-eighth compile order, then
    HostModuleCheckRequiredDeclsProduct last.
    Greppable: tryCompileNamedHostModuleCheckRequiredDeclsProductSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckRequiredDeclsProduct. -/
unsafe def tryCompileNamedHostModuleCheckRequiredDeclsProductSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckRequiredDeclsProductSubsetNames
    namedClosedHostModuleCheckRequiredDeclsProductCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckRequiredDeclsProductSubsetIO]
opaque tryCompileNamedHostModuleCheckRequiredDeclsProductSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckRequiredDeclsProduct subset.
    Greppable: tryCompileNamedHostModuleCheckRequiredDeclsProductSubset. -/
def tryCompileNamedHostModuleCheckRequiredDeclsProductSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckRequiredDeclsProductSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, HostImportGraphModel,
    HostImportGraphMods, HostImportGraphModsLater,
    HostImportGraphLoadOkLater, HostImportGraphWalkLater,
    HostImportGraphWalk, and HostModuleCheckRequiredDecls, put
    those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckRequiredDeclsProduct has no imports.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckRequiredDeclsProductDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckRequiredDeclsProductDepsIO
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
      "SystemsLean.HostImportGraphModsLater",
      "SystemsLean.HostImportGraphLoadOkLater",
      "SystemsLean.HostImportGraphWalkLater",
      "SystemsLean.HostImportGraphWalk",
      "SystemsLean.HostModuleCheckRequiredDecls"]

@[implemented_by tryCompileAfterHostModuleCheckRequiredDeclsProductDepsIO]
opaque tryCompileAfterHostModuleCheckRequiredDeclsProductDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckRequiredDeclsProduct deps.
    Greppable: tryCompileAfterHostModuleCheckRequiredDeclsProductDeps. -/
def tryCompileAfterHostModuleCheckRequiredDeclsProductDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckRequiredDeclsProductDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostModuleCheckRequiredDeclsLater.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckRequiredDeclsLaterPath. -/
def findLiveHostModuleCheckRequiredDeclsLaterPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckRequiredDeclsLater"

/-- Named HostModuleCheckRequiredDeclsLater subset of the live SystemsLean library.
    Membership is the prior twenty-nine plus HostModuleCheckRequiredDeclsLater last.
    Barrel order among the thirty; skip Linear, skip IrGraph,
    skip HostGraphMain. HostModuleCheckRequiredDeclsLater has no imports.
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostModuleCheckRequiredDeclsLaterSubsetNames.
    SystemsLean.HostModuleCheckRequiredDeclsLater. -/
def namedClosedHostModuleCheckRequiredDeclsLaterSubsetNames : List String :=
  namedClosedHostModuleCheckRequiredDeclsProductSubsetNames ++
    ["SystemsLean.HostModuleCheckRequiredDeclsLater"]

/-- Compile order honors imports: twenty-ninth compile order, then
    HostModuleCheckRequiredDeclsLater last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostModuleCheckRequiredDeclsLaterCompileOrder. -/
def namedClosedHostModuleCheckRequiredDeclsLaterCompileOrder : List String :=
  namedClosedHostModuleCheckRequiredDeclsProductCompileOrder ++
    ["SystemsLean.HostModuleCheckRequiredDeclsLater"]

/-- True when the barrel lists each HostModuleCheckRequiredDeclsLater subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckRequiredDeclsLaterSubset. -/
def barrelListsNamedHostModuleCheckRequiredDeclsLaterSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckRequiredDeclsLaterSubsetNames

/-- Compile the named HostModuleCheckRequiredDeclsLater subset after reading
    the live lakefile. Thirty-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the twenty-ninth compile order, then
    HostModuleCheckRequiredDeclsLater last.
    Greppable: tryCompileNamedHostModuleCheckRequiredDeclsLaterSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckRequiredDeclsLater. -/
unsafe def tryCompileNamedHostModuleCheckRequiredDeclsLaterSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckRequiredDeclsLaterSubsetNames
    namedClosedHostModuleCheckRequiredDeclsLaterCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckRequiredDeclsLaterSubsetIO]
opaque tryCompileNamedHostModuleCheckRequiredDeclsLaterSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckRequiredDeclsLater subset.
    Greppable: tryCompileNamedHostModuleCheckRequiredDeclsLaterSubset. -/
def tryCompileNamedHostModuleCheckRequiredDeclsLaterSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckRequiredDeclsLaterSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, HostImportGraphModel,
    HostImportGraphMods, HostImportGraphModsLater,
    HostImportGraphLoadOkLater, HostImportGraphWalkLater,
    HostImportGraphWalk, HostModuleCheckRequiredDecls, and
    HostModuleCheckRequiredDeclsProduct, put
    those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckRequiredDeclsLater has no imports.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckRequiredDeclsLaterDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckRequiredDeclsLaterDepsIO
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
      "SystemsLean.HostImportGraphModsLater",
      "SystemsLean.HostImportGraphLoadOkLater",
      "SystemsLean.HostImportGraphWalkLater",
      "SystemsLean.HostImportGraphWalk",
      "SystemsLean.HostModuleCheckRequiredDecls",
      "SystemsLean.HostModuleCheckRequiredDeclsProduct"]

@[implemented_by tryCompileAfterHostModuleCheckRequiredDeclsLaterDepsIO]
opaque tryCompileAfterHostModuleCheckRequiredDeclsLaterDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckRequiredDeclsLater deps.
    Greppable: tryCompileAfterHostModuleCheckRequiredDeclsLaterDeps. -/
def tryCompileAfterHostModuleCheckRequiredDeclsLaterDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckRequiredDeclsLaterDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
