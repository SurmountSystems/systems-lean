/-
  SYSTEMS_LEAN_HOST partial -- thirty-first HostModuleCheckFixtureTexts,
  thirty-second HostModuleCheckFixtureTextsProduct, thirty-third
  HostModuleCheckFixtureTextsLater, and thirty-fourth
  HostModuleCheckFixtureTextsSelfHost named-walk wrappers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostImportGraphWalkLater stays
  762 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior thirty wrappers stay in
  ElabMeetNamedWalkHostImportGraphWalkLater. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not add ElabMeetNamedWalkHostImportGraphLoadOk.
  Do not dump these wrappers onto WalkLater, Tail, Later,
  HostTerm, HostGraphTheorems, HostPackageWrite, or Seeds.
  Do not plant live HostModuleCheckFixtureTexts.lean.
  Do not plant live HostModuleCheckFixtureTextsProduct.lean.
  Do not plant live HostModuleCheckFixtureTextsLater.lean.
  Do not plant live HostModuleCheckFixtureTextsSelfHost.lean.

  Spec (readable):
  - Thirty-first HostModuleCheckFixtureTexts wrapper lives here:
    findLiveHostModuleCheckFixtureTextsPath,
    namedClosedHostModuleCheckFixtureTextsSubsetNames,
    namedClosedHostModuleCheckFixtureTextsCompileOrder,
    barrelListsNamedHostModuleCheckFixtureTextsSubset,
    tryCompileNamedHostModuleCheckFixtureTextsSubset,
    tryCompileAfterHostModuleCheckFixtureTextsDeps.
    Named membership is the prior thirty plus
    HostModuleCheckFixtureTexts last. Barrel order among the
    thirty-one; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the thirtieth compile order, then
    HostModuleCheckFixtureTexts last. IrGraph and HostCompose are
    compile dependencies only. After-deps are Mult first, then the
    HostModuleCheckRequiredDeclsLater after-deps plus
    HostModuleCheckRequiredDeclsLater.
    HostModuleCheckFixtureTexts has no imports. Do not plant
    live HostModuleCheckFixtureTexts.lean.
  - Thirty-second HostModuleCheckFixtureTextsProduct wrapper lives here:
    findLiveHostModuleCheckFixtureTextsProductPath,
    namedClosedHostModuleCheckFixtureTextsProductSubsetNames,
    namedClosedHostModuleCheckFixtureTextsProductCompileOrder,
    barrelListsNamedHostModuleCheckFixtureTextsProductSubset,
    tryCompileNamedHostModuleCheckFixtureTextsProductSubset,
    tryCompileAfterHostModuleCheckFixtureTextsProductDeps.
    Named membership is the prior thirty-one plus
    HostModuleCheckFixtureTextsProduct last. Barrel order among the
    thirty-two; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the thirty-first compile order, then
    HostModuleCheckFixtureTextsProduct last. IrGraph and HostCompose are
    compile dependencies only. After-deps are Mult first, then the
    HostModuleCheckFixtureTexts after-deps plus
    HostModuleCheckFixtureTexts.
    HostModuleCheckFixtureTextsProduct has no imports. Do not plant
    live HostModuleCheckFixtureTextsProduct.lean.
  - Thirty-third HostModuleCheckFixtureTextsLater wrapper lives here:
    findLiveHostModuleCheckFixtureTextsLaterPath,
    namedClosedHostModuleCheckFixtureTextsLaterSubsetNames,
    namedClosedHostModuleCheckFixtureTextsLaterCompileOrder,
    barrelListsNamedHostModuleCheckFixtureTextsLaterSubset,
    tryCompileNamedHostModuleCheckFixtureTextsLaterSubset,
    tryCompileAfterHostModuleCheckFixtureTextsLaterDeps.
    Named membership is the prior thirty-two plus
    HostModuleCheckFixtureTextsLater last. Barrel order among the
    thirty-three; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the thirty-second compile order, then
    HostModuleCheckFixtureTextsLater last. IrGraph and HostCompose are
    compile dependencies only. After-deps are Mult first, then the
    HostModuleCheckFixtureTextsProduct after-deps plus
    HostModuleCheckFixtureTextsProduct.
    HostModuleCheckFixtureTextsLater has no imports. Do not plant
    live HostModuleCheckFixtureTextsLater.lean.
  - Thirty-fourth HostModuleCheckFixtureTextsSelfHost wrapper lives here:
    findLiveHostModuleCheckFixtureTextsSelfHostPath,
    namedClosedHostModuleCheckFixtureTextsSelfHostSubsetNames,
    namedClosedHostModuleCheckFixtureTextsSelfHostCompileOrder,
    barrelListsNamedHostModuleCheckFixtureTextsSelfHostSubset,
    tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubset,
    tryCompileAfterHostModuleCheckFixtureTextsSelfHostDeps.
    Named membership is the prior thirty-three plus
    HostModuleCheckFixtureTextsSelfHost last. Barrel order among the
    thirty-four; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the thirty-third compile order, then
    HostModuleCheckFixtureTextsSelfHost last. IrGraph and HostCompose are
    compile dependencies only. After-deps are Mult first, then the
    HostModuleCheckFixtureTextsLater after-deps plus
    HostModuleCheckFixtureTextsLater.
    HostModuleCheckFixtureTextsSelfHost has no imports. Do not plant
    live HostModuleCheckFixtureTextsSelfHost.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckFixtureTextsPath,
  namedClosedHostModuleCheckFixtureTextsSubsetNames,
  namedClosedHostModuleCheckFixtureTextsCompileOrder,
  barrelListsNamedHostModuleCheckFixtureTextsSubset,
  tryCompileNamedHostModuleCheckFixtureTextsSubset,
  tryCompileAfterHostModuleCheckFixtureTextsDeps,
  SystemsLean.HostModuleCheckFixtureTexts,
  findLiveHostModuleCheckFixtureTextsProductPath,
  namedClosedHostModuleCheckFixtureTextsProductSubsetNames,
  namedClosedHostModuleCheckFixtureTextsProductCompileOrder,
  barrelListsNamedHostModuleCheckFixtureTextsProductSubset,
  tryCompileNamedHostModuleCheckFixtureTextsProductSubset,
  tryCompileAfterHostModuleCheckFixtureTextsProductDeps,
  SystemsLean.HostModuleCheckFixtureTextsProduct,
  findLiveHostModuleCheckFixtureTextsLaterPath,
  namedClosedHostModuleCheckFixtureTextsLaterSubsetNames,
  namedClosedHostModuleCheckFixtureTextsLaterCompileOrder,
  barrelListsNamedHostModuleCheckFixtureTextsLaterSubset,
  tryCompileNamedHostModuleCheckFixtureTextsLaterSubset,
  tryCompileAfterHostModuleCheckFixtureTextsLaterDeps,
  SystemsLean.HostModuleCheckFixtureTextsLater,
  findLiveHostModuleCheckFixtureTextsSelfHostPath,
  namedClosedHostModuleCheckFixtureTextsSelfHostSubsetNames,
  namedClosedHostModuleCheckFixtureTextsSelfHostCompileOrder,
  barrelListsNamedHostModuleCheckFixtureTextsSelfHostSubset,
  tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubset,
  tryCompileAfterHostModuleCheckFixtureTextsSelfHostDeps,
  SystemsLean.HostModuleCheckFixtureTextsSelfHost,
  ElabMeetNamedWalkHostModuleCheckFixtureTexts,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckFixtureTexts,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckFixtureTexts
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckFixtureTexts;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHost. Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetLive
import SystemsLean.ElabMeetNamedWalk
import SystemsLean.ElabMeetNamedWalkHostImportGraphWalkLater

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckFixtureTexts.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckFixtureTextsPath. -/
def findLiveHostModuleCheckFixtureTextsPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckFixtureTexts"

/-- Named HostModuleCheckFixtureTexts subset of the live SystemsLean library.
    Membership is the prior thirty plus HostModuleCheckFixtureTexts last.
    Barrel order among the thirty-one; skip Linear, skip IrGraph,
    skip HostGraphMain. HostModuleCheckFixtureTexts has no imports.
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostModuleCheckFixtureTextsSubsetNames.
    SystemsLean.HostModuleCheckFixtureTexts. -/
def namedClosedHostModuleCheckFixtureTextsSubsetNames : List String :=
  namedClosedHostModuleCheckRequiredDeclsLaterSubsetNames ++
    ["SystemsLean.HostModuleCheckFixtureTexts"]

/-- Compile order honors imports: thirtieth compile order, then
    HostModuleCheckFixtureTexts last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostModuleCheckFixtureTextsCompileOrder. -/
def namedClosedHostModuleCheckFixtureTextsCompileOrder : List String :=
  namedClosedHostModuleCheckRequiredDeclsLaterCompileOrder ++
    ["SystemsLean.HostModuleCheckFixtureTexts"]

/-- True when the barrel lists each HostModuleCheckFixtureTexts subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckFixtureTextsSubset. -/
def barrelListsNamedHostModuleCheckFixtureTextsSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckFixtureTextsSubsetNames

/-- Compile the named HostModuleCheckFixtureTexts subset after reading
    the live lakefile. Thirty-one-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the thirtieth compile order, then
    HostModuleCheckFixtureTexts last.
    Greppable: tryCompileNamedHostModuleCheckFixtureTextsSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckFixtureTexts. -/
unsafe def tryCompileNamedHostModuleCheckFixtureTextsSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckFixtureTextsSubsetNames
    namedClosedHostModuleCheckFixtureTextsCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckFixtureTextsSubsetIO]
opaque tryCompileNamedHostModuleCheckFixtureTextsSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckFixtureTexts subset.
    Greppable: tryCompileNamedHostModuleCheckFixtureTextsSubset. -/
def tryCompileNamedHostModuleCheckFixtureTextsSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckFixtureTextsSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, HostImportGraphModel,
    HostImportGraphMods, HostImportGraphModsLater,
    HostImportGraphLoadOkLater, HostImportGraphWalkLater,
    HostImportGraphWalk, HostModuleCheckRequiredDecls,
    HostModuleCheckRequiredDeclsProduct, and
    HostModuleCheckRequiredDeclsLater, put
    those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckFixtureTexts has no imports.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckFixtureTextsDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckFixtureTextsDepsIO
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
      "SystemsLean.HostModuleCheckRequiredDeclsLater"]

@[implemented_by tryCompileAfterHostModuleCheckFixtureTextsDepsIO]
opaque tryCompileAfterHostModuleCheckFixtureTextsDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckFixtureTexts deps.
    Greppable: tryCompileAfterHostModuleCheckFixtureTextsDeps. -/
def tryCompileAfterHostModuleCheckFixtureTextsDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckFixtureTextsDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostModuleCheckFixtureTextsProduct.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckFixtureTextsProductPath. -/
def findLiveHostModuleCheckFixtureTextsProductPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckFixtureTextsProduct"

/-- Named HostModuleCheckFixtureTextsProduct subset of the live SystemsLean library.
    Membership is the prior thirty-one plus HostModuleCheckFixtureTextsProduct last.
    Barrel order among the thirty-two; skip Linear, skip IrGraph,
    skip HostGraphMain. HostModuleCheckFixtureTextsProduct has no imports.
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostModuleCheckFixtureTextsProductSubsetNames.
    SystemsLean.HostModuleCheckFixtureTextsProduct. -/
def namedClosedHostModuleCheckFixtureTextsProductSubsetNames : List String :=
  namedClosedHostModuleCheckFixtureTextsSubsetNames ++
    ["SystemsLean.HostModuleCheckFixtureTextsProduct"]

/-- Compile order honors imports: thirty-first compile order, then
    HostModuleCheckFixtureTextsProduct last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostModuleCheckFixtureTextsProductCompileOrder. -/
def namedClosedHostModuleCheckFixtureTextsProductCompileOrder : List String :=
  namedClosedHostModuleCheckFixtureTextsCompileOrder ++
    ["SystemsLean.HostModuleCheckFixtureTextsProduct"]

/-- True when the barrel lists each HostModuleCheckFixtureTextsProduct subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckFixtureTextsProductSubset. -/
def barrelListsNamedHostModuleCheckFixtureTextsProductSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckFixtureTextsProductSubsetNames

/-- Compile the named HostModuleCheckFixtureTextsProduct subset after reading
    the live lakefile. Thirty-two-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the thirty-first compile order, then
    HostModuleCheckFixtureTextsProduct last.
    Greppable: tryCompileNamedHostModuleCheckFixtureTextsProductSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckFixtureTextsProduct. -/
unsafe def tryCompileNamedHostModuleCheckFixtureTextsProductSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckFixtureTextsProductSubsetNames
    namedClosedHostModuleCheckFixtureTextsProductCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckFixtureTextsProductSubsetIO]
opaque tryCompileNamedHostModuleCheckFixtureTextsProductSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckFixtureTextsProduct subset.
    Greppable: tryCompileNamedHostModuleCheckFixtureTextsProductSubset. -/
def tryCompileNamedHostModuleCheckFixtureTextsProductSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckFixtureTextsProductSubsetIOSafe srcPath oleanDir)
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
    HostModuleCheckRequiredDeclsLater, and
    HostModuleCheckFixtureTexts, put
    those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckFixtureTextsProduct has no imports.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckFixtureTextsProductDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckFixtureTextsProductDepsIO
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
      "SystemsLean.HostModuleCheckFixtureTexts"]

@[implemented_by tryCompileAfterHostModuleCheckFixtureTextsProductDepsIO]
opaque tryCompileAfterHostModuleCheckFixtureTextsProductDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckFixtureTextsProduct deps.
    Greppable: tryCompileAfterHostModuleCheckFixtureTextsProductDeps. -/
def tryCompileAfterHostModuleCheckFixtureTextsProductDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckFixtureTextsProductDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostModuleCheckFixtureTextsLater.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckFixtureTextsLaterPath. -/
def findLiveHostModuleCheckFixtureTextsLaterPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckFixtureTextsLater"

/-- Named HostModuleCheckFixtureTextsLater subset of the live SystemsLean library.
    Membership is the prior thirty-two plus HostModuleCheckFixtureTextsLater last.
    Barrel order among the thirty-three; skip Linear, skip IrGraph,
    skip HostGraphMain. HostModuleCheckFixtureTextsLater has no imports.
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostModuleCheckFixtureTextsLaterSubsetNames.
    SystemsLean.HostModuleCheckFixtureTextsLater. -/
def namedClosedHostModuleCheckFixtureTextsLaterSubsetNames : List String :=
  namedClosedHostModuleCheckFixtureTextsProductSubsetNames ++
    ["SystemsLean.HostModuleCheckFixtureTextsLater"]

/-- Compile order honors imports: thirty-second compile order, then
    HostModuleCheckFixtureTextsLater last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostModuleCheckFixtureTextsLaterCompileOrder. -/
def namedClosedHostModuleCheckFixtureTextsLaterCompileOrder : List String :=
  namedClosedHostModuleCheckFixtureTextsProductCompileOrder ++
    ["SystemsLean.HostModuleCheckFixtureTextsLater"]

/-- True when the barrel lists each HostModuleCheckFixtureTextsLater subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckFixtureTextsLaterSubset. -/
def barrelListsNamedHostModuleCheckFixtureTextsLaterSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckFixtureTextsLaterSubsetNames

/-- Compile the named HostModuleCheckFixtureTextsLater subset after reading
    the live lakefile. Thirty-three-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the thirty-second compile order, then
    HostModuleCheckFixtureTextsLater last.
    Greppable: tryCompileNamedHostModuleCheckFixtureTextsLaterSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckFixtureTextsLater. -/
unsafe def tryCompileNamedHostModuleCheckFixtureTextsLaterSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckFixtureTextsLaterSubsetNames
    namedClosedHostModuleCheckFixtureTextsLaterCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckFixtureTextsLaterSubsetIO]
opaque tryCompileNamedHostModuleCheckFixtureTextsLaterSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckFixtureTextsLater subset.
    Greppable: tryCompileNamedHostModuleCheckFixtureTextsLaterSubset. -/
def tryCompileNamedHostModuleCheckFixtureTextsLaterSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckFixtureTextsLaterSubsetIOSafe srcPath oleanDir)
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
    HostModuleCheckFixtureTexts, and
    HostModuleCheckFixtureTextsProduct, put
    those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckFixtureTextsLater has no imports.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckFixtureTextsLaterDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckFixtureTextsLaterDepsIO
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
      "SystemsLean.HostModuleCheckFixtureTextsProduct"]

@[implemented_by tryCompileAfterHostModuleCheckFixtureTextsLaterDepsIO]
opaque tryCompileAfterHostModuleCheckFixtureTextsLaterDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckFixtureTextsLater deps.
    Greppable: tryCompileAfterHostModuleCheckFixtureTextsLaterDeps. -/
def tryCompileAfterHostModuleCheckFixtureTextsLaterDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckFixtureTextsLaterDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostModuleCheckFixtureTextsSelfHost.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckFixtureTextsSelfHostPath. -/
def findLiveHostModuleCheckFixtureTextsSelfHostPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckFixtureTextsSelfHost"

/-- Named HostModuleCheckFixtureTextsSelfHost subset of the live SystemsLean library.
    Membership is the prior thirty-three plus HostModuleCheckFixtureTextsSelfHost last.
    Barrel order among the thirty-four; skip Linear, skip IrGraph,
    skip HostGraphMain. HostModuleCheckFixtureTextsSelfHost has no imports.
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostModuleCheckFixtureTextsSelfHostSubsetNames.
    SystemsLean.HostModuleCheckFixtureTextsSelfHost. -/
def namedClosedHostModuleCheckFixtureTextsSelfHostSubsetNames : List String :=
  namedClosedHostModuleCheckFixtureTextsLaterSubsetNames ++
    ["SystemsLean.HostModuleCheckFixtureTextsSelfHost"]

/-- Compile order honors imports: thirty-third compile order, then
    HostModuleCheckFixtureTextsSelfHost last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostModuleCheckFixtureTextsSelfHostCompileOrder. -/
def namedClosedHostModuleCheckFixtureTextsSelfHostCompileOrder : List String :=
  namedClosedHostModuleCheckFixtureTextsLaterCompileOrder ++
    ["SystemsLean.HostModuleCheckFixtureTextsSelfHost"]

/-- True when the barrel lists each HostModuleCheckFixtureTextsSelfHost subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckFixtureTextsSelfHostSubset. -/
def barrelListsNamedHostModuleCheckFixtureTextsSelfHostSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckFixtureTextsSelfHostSubsetNames

/-- Compile the named HostModuleCheckFixtureTextsSelfHost subset after reading
    the live lakefile. Thirty-four-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the thirty-third compile order, then
    HostModuleCheckFixtureTextsSelfHost last.
    Greppable: tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckFixtureTextsSelfHost. -/
unsafe def tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckFixtureTextsSelfHostSubsetNames
    namedClosedHostModuleCheckFixtureTextsSelfHostCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubsetIO]
opaque tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckFixtureTextsSelfHost subset.
    Greppable: tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubset. -/
def tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckFixtureTextsSelfHostSubsetIOSafe srcPath oleanDir)
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
    HostModuleCheckFixtureTextsProduct, and
    HostModuleCheckFixtureTextsLater, put
    those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckFixtureTextsSelfHost has no imports.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckFixtureTextsSelfHostDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckFixtureTextsSelfHostDepsIO
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
      "SystemsLean.HostModuleCheckFixtureTextsLater"]

@[implemented_by tryCompileAfterHostModuleCheckFixtureTextsSelfHostDepsIO]
opaque tryCompileAfterHostModuleCheckFixtureTextsSelfHostDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckFixtureTextsSelfHost deps.
    Greppable: tryCompileAfterHostModuleCheckFixtureTextsSelfHostDeps. -/
def tryCompileAfterHostModuleCheckFixtureTextsSelfHostDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckFixtureTextsSelfHostDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
