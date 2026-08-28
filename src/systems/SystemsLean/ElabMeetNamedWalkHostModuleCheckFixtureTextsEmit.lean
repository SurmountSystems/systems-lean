/-
  SYSTEMS_LEAN_HOST partial -- thirty-fifth HostModuleCheckFixtureTextsEmit
  named-walk wrappers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckFixtureTexts stays
  657 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior thirty-four wrappers stay in
  ElabMeetNamedWalkHostModuleCheckFixtureTexts. Do not grow that walk.
  Thirty-sixth HostModuleCheckFixtures wrappers also live here
  (walk EXTRACT-FIRST no; stay under about 780). Do not mint
  ElabMeetNamedWalkHostModuleCheckFixtures.
  Thirty-seventh HostModuleCheckSurface wrappers also live here
  (walk EXTRACT-FIRST no; stay under about 780). Do not mint
  ElabMeetNamedWalkHostModuleCheckSurface.
  Thirty-eighth HostModuleCheckCheckers wrappers also live here
  (walk EXTRACT-FIRST no; stay under about 780). Do not mint
  ElabMeetNamedWalkHostModuleCheckCheckers.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not add ElabMeetNamedWalkHostImportGraphLoadOk.
  Do not dump these wrappers onto WalkLater, Tail, Later,
  HostTerm, HostGraphTheorems, HostPackageWrite, Seeds, or
  ElabMeetNamedWalkHostModuleCheckFixtureTexts.
  Do not plant live HostModuleCheckFixtureTextsEmit.lean.
  Do not plant live HostModuleCheckFixtures.lean.
  Do not plant live HostModuleCheckSurface.lean.
  Do not plant live HostModuleCheckCheckers.lean.

  Spec (readable):
  - Thirty-fifth HostModuleCheckFixtureTextsEmit wrapper lives here:
    findLiveHostModuleCheckFixtureTextsEmitPath,
    namedClosedHostModuleCheckFixtureTextsEmitSubsetNames,
    namedClosedHostModuleCheckFixtureTextsEmitCompileOrder,
    barrelListsNamedHostModuleCheckFixtureTextsEmitSubset,
    tryCompileNamedHostModuleCheckFixtureTextsEmitSubset,
    tryCompileAfterHostModuleCheckFixtureTextsEmitDeps.
    Named membership is the prior thirty-four plus
    HostModuleCheckFixtureTextsEmit last. Barrel order among the
    thirty-five; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the thirty-fourth compile order, then
    HostModuleCheckFixtureTextsEmit last. IrGraph and HostCompose are
    compile dependencies only. After-deps are Mult first, then the
    HostModuleCheckFixtureTextsSelfHost after-deps plus
    HostModuleCheckFixtureTextsSelfHost.
    HostModuleCheckFixtureTextsEmit has no imports. Do not plant
    live HostModuleCheckFixtureTextsEmit.lean.
  - Thirty-sixth HostModuleCheckFixtures wrappers live here:
    findLiveHostModuleCheckFixturesPath,
    namedClosedHostModuleCheckFixturesSubsetNames,
    namedClosedHostModuleCheckFixturesCompileOrder,
    barrelListsNamedHostModuleCheckFixturesSubset,
    tryCompileNamedHostModuleCheckFixturesSubset,
    tryCompileAfterHostModuleCheckFixturesDeps.
    Named membership is the prior thirty-five plus
    HostModuleCheckFixtures last. Barrel order among the
    thirty-six; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the thirty-fifth compile order, then
    HostModuleCheckFixtures last. IrGraph and HostCompose are
    compile dependencies only. After-deps are Mult first, then the
    HostModuleCheckFixtureTextsEmit after-deps plus
    HostModuleCheckFixtureTextsEmit.
    Do not plant live HostModuleCheckFixtures.lean.
  - Thirty-seventh HostModuleCheckSurface wrappers live here:
    findLiveHostModuleCheckSurfacePath,
    namedClosedHostModuleCheckSurfaceSubsetNames,
    namedClosedHostModuleCheckSurfaceCompileOrder,
    barrelListsNamedHostModuleCheckSurfaceSubset,
    tryCompileNamedHostModuleCheckSurfaceSubset,
    tryCompileAfterHostModuleCheckSurfaceDeps.
    Named membership is the prior thirty-six plus
    HostModuleCheckSurface last. Barrel order among the
    thirty-seven; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the thirty-sixth compile order, then
    HostModuleCheckSurface last. IrGraph and HostCompose are
    compile dependencies only. After-deps are Mult first, then the
    HostModuleCheckFixtures after-deps plus
    HostModuleCheckFixtures.
    Do not plant live HostModuleCheckSurface.lean.
  - Thirty-eighth HostModuleCheckCheckers wrappers live here:
    findLiveHostModuleCheckCheckersPath,
    namedClosedHostModuleCheckCheckersSubsetNames,
    namedClosedHostModuleCheckCheckersCompileOrder,
    barrelListsNamedHostModuleCheckCheckersSubset,
    tryCompileNamedHostModuleCheckCheckersSubset,
    tryCompileAfterHostModuleCheckCheckersDeps.
    Named membership is the prior thirty-seven plus
    HostModuleCheckCheckers last. Barrel order among the
    thirty-eight; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the thirty-seventh compile order, then
    HostModuleCheckCheckers last. IrGraph and HostCompose are
    compile dependencies only. After-deps are Mult first, then the
    HostModuleCheckSurface after-deps plus
    HostModuleCheckSurface.
    Do not plant live HostModuleCheckCheckers.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckFixtureTextsEmitPath,
  namedClosedHostModuleCheckFixtureTextsEmitSubsetNames,
  namedClosedHostModuleCheckFixtureTextsEmitCompileOrder,
  barrelListsNamedHostModuleCheckFixtureTextsEmitSubset,
  tryCompileNamedHostModuleCheckFixtureTextsEmitSubset,
  tryCompileAfterHostModuleCheckFixtureTextsEmitDeps,
  SystemsLean.HostModuleCheckFixtureTextsEmit,
  findLiveHostModuleCheckFixturesPath,
  namedClosedHostModuleCheckFixturesSubsetNames,
  namedClosedHostModuleCheckFixturesCompileOrder,
  barrelListsNamedHostModuleCheckFixturesSubset,
  tryCompileNamedHostModuleCheckFixturesSubset,
  tryCompileAfterHostModuleCheckFixturesDeps,
  SystemsLean.HostModuleCheckFixtures,
  findLiveHostModuleCheckSurfacePath,
  namedClosedHostModuleCheckSurfaceSubsetNames,
  namedClosedHostModuleCheckSurfaceCompileOrder,
  barrelListsNamedHostModuleCheckSurfaceSubset,
  tryCompileNamedHostModuleCheckSurfaceSubset,
  tryCompileAfterHostModuleCheckSurfaceDeps,
  SystemsLean.HostModuleCheckSurface,
  findLiveHostModuleCheckCheckersPath,
  namedClosedHostModuleCheckCheckersSubsetNames,
  namedClosedHostModuleCheckCheckersCompileOrder,
  barrelListsNamedHostModuleCheckCheckersSubset,
  tryCompileNamedHostModuleCheckCheckersSubset,
  tryCompileAfterHostModuleCheckCheckersDeps,
  SystemsLean.HostModuleCheckCheckers,
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHost. Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetLive
import SystemsLean.ElabMeetNamedWalk
import SystemsLean.ElabMeetNamedWalkHostModuleCheckFixtureTexts

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckFixtureTextsEmit.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckFixtureTextsEmitPath. -/
def findLiveHostModuleCheckFixtureTextsEmitPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckFixtureTextsEmit"

/-- Named HostModuleCheckFixtureTextsEmit subset of the live SystemsLean library.
    Membership is the prior thirty-four plus HostModuleCheckFixtureTextsEmit last.
    Barrel order among the thirty-five; skip Linear, skip IrGraph,
    skip HostGraphMain. HostModuleCheckFixtureTextsEmit has no imports.
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostModuleCheckFixtureTextsEmitSubsetNames.
    SystemsLean.HostModuleCheckFixtureTextsEmit. -/
def namedClosedHostModuleCheckFixtureTextsEmitSubsetNames : List String :=
  namedClosedHostModuleCheckFixtureTextsSelfHostSubsetNames ++
    ["SystemsLean.HostModuleCheckFixtureTextsEmit"]

/-- Compile order honors imports: thirty-fourth compile order, then
    HostModuleCheckFixtureTextsEmit last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostModuleCheckFixtureTextsEmitCompileOrder. -/
def namedClosedHostModuleCheckFixtureTextsEmitCompileOrder : List String :=
  namedClosedHostModuleCheckFixtureTextsSelfHostCompileOrder ++
    ["SystemsLean.HostModuleCheckFixtureTextsEmit"]

/-- True when the barrel lists each HostModuleCheckFixtureTextsEmit subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckFixtureTextsEmitSubset. -/
def barrelListsNamedHostModuleCheckFixtureTextsEmitSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckFixtureTextsEmitSubsetNames

/-- Compile the named HostModuleCheckFixtureTextsEmit subset after reading
    the live lakefile. Thirty-five-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the thirty-fourth compile order, then
    HostModuleCheckFixtureTextsEmit last.
    Greppable: tryCompileNamedHostModuleCheckFixtureTextsEmitSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckFixtureTextsEmit. -/
unsafe def tryCompileNamedHostModuleCheckFixtureTextsEmitSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckFixtureTextsEmitSubsetNames
    namedClosedHostModuleCheckFixtureTextsEmitCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckFixtureTextsEmitSubsetIO]
opaque tryCompileNamedHostModuleCheckFixtureTextsEmitSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckFixtureTextsEmit subset.
    Greppable: tryCompileNamedHostModuleCheckFixtureTextsEmitSubset. -/
def tryCompileNamedHostModuleCheckFixtureTextsEmitSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckFixtureTextsEmitSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, HostImportGraphModel,
    HostImportGraphMods, HostImportGraphModsLater,
    HostImportGraphLoadOkLater, HostImportGraphWalkLater,
    HostImportGraphWalk, HostModuleCheckRequiredDecls,
    HostModuleCheckRequiredDeclsProduct,
    HostModuleCheckRequiredDeclsLater,
    HostModuleCheckFixtureTexts,
    HostModuleCheckFixtureTextsProduct,
    HostModuleCheckFixtureTextsLater, and
    HostModuleCheckFixtureTextsSelfHost, put
    those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckFixtureTextsEmit has no imports.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckFixtureTextsEmitDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckFixtureTextsEmitDepsIO
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
      "SystemsLean.HostModuleCheckRequiredDeclsProduct",
      "SystemsLean.HostModuleCheckRequiredDeclsLater",
      "SystemsLean.HostModuleCheckFixtureTexts",
      "SystemsLean.HostModuleCheckFixtureTextsProduct",
      "SystemsLean.HostModuleCheckFixtureTextsLater",
      "SystemsLean.HostModuleCheckFixtureTextsSelfHost"]

@[implemented_by tryCompileAfterHostModuleCheckFixtureTextsEmitDepsIO]
opaque tryCompileAfterHostModuleCheckFixtureTextsEmitDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckFixtureTextsEmit deps.
    Greppable: tryCompileAfterHostModuleCheckFixtureTextsEmitDeps. -/
def tryCompileAfterHostModuleCheckFixtureTextsEmitDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckFixtureTextsEmitDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostModuleCheckFixtures.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckFixturesPath. -/
def findLiveHostModuleCheckFixturesPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckFixtures"

/-- Named HostModuleCheckFixtures subset of the live SystemsLean library.
    Membership is the prior thirty-five plus HostModuleCheckFixtures last.
    Barrel order among the thirty-six; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-fixtures closure.
    Greppable: namedClosedHostModuleCheckFixturesSubsetNames.
    SystemsLean.HostModuleCheckFixtures. -/
def namedClosedHostModuleCheckFixturesSubsetNames : List String :=
  namedClosedHostModuleCheckFixtureTextsEmitSubsetNames ++
    ["SystemsLean.HostModuleCheckFixtures"]

/-- Compile order honors imports: thirty-fifth compile order, then
    HostModuleCheckFixtures last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostModuleCheckFixturesCompileOrder. -/
def namedClosedHostModuleCheckFixturesCompileOrder : List String :=
  namedClosedHostModuleCheckFixtureTextsEmitCompileOrder ++
    ["SystemsLean.HostModuleCheckFixtures"]

/-- True when the barrel lists each HostModuleCheckFixtures subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckFixturesSubset. -/
def barrelListsNamedHostModuleCheckFixturesSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckFixturesSubsetNames

/-- Compile the named HostModuleCheckFixtures subset after reading
    the live lakefile. Thirty-six-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the thirty-fifth compile order, then
    HostModuleCheckFixtures last.
    Greppable: tryCompileNamedHostModuleCheckFixturesSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckFixtures. -/
unsafe def tryCompileNamedHostModuleCheckFixturesSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckFixturesSubsetNames
    namedClosedHostModuleCheckFixturesCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckFixturesSubsetIO]
opaque tryCompileNamedHostModuleCheckFixturesSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckFixtures subset.
    Greppable: tryCompileNamedHostModuleCheckFixturesSubset. -/
def tryCompileNamedHostModuleCheckFixturesSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckFixturesSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, HostImportGraphModel,
    HostImportGraphMods, HostImportGraphModsLater,
    HostImportGraphLoadOkLater, HostImportGraphWalkLater,
    HostImportGraphWalk, HostModuleCheckRequiredDecls,
    HostModuleCheckRequiredDeclsProduct,
    HostModuleCheckRequiredDeclsLater,
    HostModuleCheckFixtureTexts,
    HostModuleCheckFixtureTextsProduct,
    HostModuleCheckFixtureTextsLater,
    HostModuleCheckFixtureTextsSelfHost, and
    HostModuleCheckFixtureTextsEmit, put
    those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckFixtures imports the RequiredDecls family plus
    the FixtureTexts family including Emit.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckFixturesDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckFixturesDepsIO
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
      "SystemsLean.HostModuleCheckRequiredDeclsProduct",
      "SystemsLean.HostModuleCheckRequiredDeclsLater",
      "SystemsLean.HostModuleCheckFixtureTexts",
      "SystemsLean.HostModuleCheckFixtureTextsProduct",
      "SystemsLean.HostModuleCheckFixtureTextsLater",
      "SystemsLean.HostModuleCheckFixtureTextsSelfHost",
      "SystemsLean.HostModuleCheckFixtureTextsEmit"]

@[implemented_by tryCompileAfterHostModuleCheckFixturesDepsIO]
opaque tryCompileAfterHostModuleCheckFixturesDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckFixtures deps.
    Greppable: tryCompileAfterHostModuleCheckFixturesDeps. -/
def tryCompileAfterHostModuleCheckFixturesDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckFixturesDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostModuleCheckSurface.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckSurfacePath. -/
def findLiveHostModuleCheckSurfacePath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckSurface"

/-- Named HostModuleCheckSurface subset of the live SystemsLean library.
    Membership is the prior thirty-six plus HostModuleCheckSurface last.
    Barrel order among the thirty-seven; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckSurfaceSubsetNames.
    SystemsLean.HostModuleCheckSurface. -/
def namedClosedHostModuleCheckSurfaceSubsetNames : List String :=
  namedClosedHostModuleCheckFixturesSubsetNames ++
    ["SystemsLean.HostModuleCheckSurface"]

/-- Compile order honors imports: thirty-sixth compile order, then
    HostModuleCheckSurface last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostModuleCheckSurfaceCompileOrder. -/
def namedClosedHostModuleCheckSurfaceCompileOrder : List String :=
  namedClosedHostModuleCheckFixturesCompileOrder ++
    ["SystemsLean.HostModuleCheckSurface"]

/-- True when the barrel lists each HostModuleCheckSurface subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckSurfaceSubset. -/
def barrelListsNamedHostModuleCheckSurfaceSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckSurfaceSubsetNames

/-- Compile the named HostModuleCheckSurface subset after reading
    the live lakefile. Thirty-seven-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the thirty-sixth compile order, then
    HostModuleCheckSurface last.
    Greppable: tryCompileNamedHostModuleCheckSurfaceSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckSurface. -/
unsafe def tryCompileNamedHostModuleCheckSurfaceSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckSurfaceSubsetNames
    namedClosedHostModuleCheckSurfaceCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckSurfaceSubsetIO]
opaque tryCompileNamedHostModuleCheckSurfaceSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckSurface subset.
    Greppable: tryCompileNamedHostModuleCheckSurfaceSubset. -/
def tryCompileNamedHostModuleCheckSurfaceSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckSurfaceSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, HostImportGraphModel,
    HostImportGraphMods, HostImportGraphModsLater,
    HostImportGraphLoadOkLater, HostImportGraphWalkLater,
    HostImportGraphWalk, HostModuleCheckRequiredDecls,
    HostModuleCheckRequiredDeclsProduct,
    HostModuleCheckRequiredDeclsLater,
    HostModuleCheckFixtureTexts,
    HostModuleCheckFixtureTextsProduct,
    HostModuleCheckFixtureTextsLater,
    HostModuleCheckFixtureTextsSelfHost,
    HostModuleCheckFixtureTextsEmit, and
    HostModuleCheckFixtures, put
    those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckSurface imports HostModuleCheckFixtures.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckSurfaceDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckSurfaceDepsIO
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
      "SystemsLean.HostModuleCheckRequiredDeclsProduct",
      "SystemsLean.HostModuleCheckRequiredDeclsLater",
      "SystemsLean.HostModuleCheckFixtureTexts",
      "SystemsLean.HostModuleCheckFixtureTextsProduct",
      "SystemsLean.HostModuleCheckFixtureTextsLater",
      "SystemsLean.HostModuleCheckFixtureTextsSelfHost",
      "SystemsLean.HostModuleCheckFixtureTextsEmit",
      "SystemsLean.HostModuleCheckFixtures"]

@[implemented_by tryCompileAfterHostModuleCheckSurfaceDepsIO]
opaque tryCompileAfterHostModuleCheckSurfaceDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckSurface deps.
    Greppable: tryCompileAfterHostModuleCheckSurfaceDeps. -/
def tryCompileAfterHostModuleCheckSurfaceDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckSurfaceDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostModuleCheckCheckers.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckCheckersPath. -/
def findLiveHostModuleCheckCheckersPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckCheckers"

/-- Named HostModuleCheckCheckers subset of the live SystemsLean library.
    Membership is the prior thirty-seven plus HostModuleCheckCheckers last.
    Barrel order among the thirty-eight; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckCheckersSubsetNames.
    SystemsLean.HostModuleCheckCheckers. -/
def namedClosedHostModuleCheckCheckersSubsetNames : List String :=
  namedClosedHostModuleCheckSurfaceSubsetNames ++
    ["SystemsLean.HostModuleCheckCheckers"]

/-- Compile order honors imports: thirty-seventh compile order, then
    HostModuleCheckCheckers last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostModuleCheckCheckersCompileOrder. -/
def namedClosedHostModuleCheckCheckersCompileOrder : List String :=
  namedClosedHostModuleCheckSurfaceCompileOrder ++
    ["SystemsLean.HostModuleCheckCheckers"]

/-- True when the barrel lists each HostModuleCheckCheckers subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckCheckersSubset. -/
def barrelListsNamedHostModuleCheckCheckersSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckCheckersSubsetNames

/-- Compile the named HostModuleCheckCheckers subset after reading
    the live lakefile. Thirty-eight-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the thirty-seventh compile order, then
    HostModuleCheckCheckers last.
    Greppable: tryCompileNamedHostModuleCheckCheckersSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckCheckers. -/
unsafe def tryCompileNamedHostModuleCheckCheckersSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckCheckersSubsetNames
    namedClosedHostModuleCheckCheckersCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckCheckersSubsetIO]
opaque tryCompileNamedHostModuleCheckCheckersSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckCheckers subset.
    Greppable: tryCompileNamedHostModuleCheckCheckersSubset. -/
def tryCompileNamedHostModuleCheckCheckersSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckCheckersSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, HostImportGraphModel,
    HostImportGraphMods, HostImportGraphModsLater,
    HostImportGraphLoadOkLater, HostImportGraphWalkLater,
    HostImportGraphWalk, HostModuleCheckRequiredDecls,
    HostModuleCheckRequiredDeclsProduct,
    HostModuleCheckRequiredDeclsLater,
    HostModuleCheckFixtureTexts,
    HostModuleCheckFixtureTextsProduct,
    HostModuleCheckFixtureTextsLater,
    HostModuleCheckFixtureTextsSelfHost,
    HostModuleCheckFixtureTextsEmit,
    HostModuleCheckFixtures, and
    HostModuleCheckSurface, put
    those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckCheckers imports HostModuleCheckFixtures and
    HostModuleCheckSurface.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckCheckersDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckCheckersDepsIO
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
      "SystemsLean.HostModuleCheckRequiredDeclsProduct",
      "SystemsLean.HostModuleCheckRequiredDeclsLater",
      "SystemsLean.HostModuleCheckFixtureTexts",
      "SystemsLean.HostModuleCheckFixtureTextsProduct",
      "SystemsLean.HostModuleCheckFixtureTextsLater",
      "SystemsLean.HostModuleCheckFixtureTextsSelfHost",
      "SystemsLean.HostModuleCheckFixtureTextsEmit",
      "SystemsLean.HostModuleCheckFixtures",
      "SystemsLean.HostModuleCheckSurface"]

@[implemented_by tryCompileAfterHostModuleCheckCheckersDepsIO]
opaque tryCompileAfterHostModuleCheckCheckersDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckCheckers deps.
    Greppable: tryCompileAfterHostModuleCheckCheckersDeps. -/
def tryCompileAfterHostModuleCheckCheckersDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckCheckersDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
