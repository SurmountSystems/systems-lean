/-
  SYSTEMS_LEAN_HOST partial -- thirty-ninth HostModuleCheckCheckersLater
  named-walk wrappers, plus fortieth HostModuleCheckRealModule wrappers,
  plus forty-first HostModuleCheckEmitBodyTerm wrappers
  (stay under about 780; do not mint ElabMeetNamedWalkHostModuleCheckRealModule
  or ElabMeetNamedWalkHostModuleCheckEmitBodyTerm).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit
  stays 693 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior thirty-eight wrappers stay in
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not add ElabMeetNamedWalkHostImportGraphLoadOk.
  Do not dump these wrappers onto WalkLater, Tail, Later,
  HostTerm, HostGraphTheorems, HostPackageWrite, Seeds,
  ElabMeetNamedWalkHostModuleCheckFixtureTexts, or
  ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit.
  Do not plant live HostModuleCheckCheckersLater.lean.
  Do not plant live HostModuleCheckRealModule.lean.
  Do not plant live HostModuleCheckEmitBodyTerm.lean.

  Spec (readable):
  - Thirty-ninth HostModuleCheckCheckersLater wrappers live here:
    findLiveHostModuleCheckCheckersLaterPath,
    namedClosedHostModuleCheckCheckersLaterSubsetNames,
    namedClosedHostModuleCheckCheckersLaterCompileOrder,
    barrelListsNamedHostModuleCheckCheckersLaterSubset,
    tryCompileNamedHostModuleCheckCheckersLaterSubset,
    tryCompileAfterHostModuleCheckCheckersLaterDeps.
    Named membership is the prior thirty-eight plus
    HostModuleCheckCheckersLater last. Barrel order among the
    thirty-nine; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the thirty-eighth compile order, then
    HostModuleCheckCheckersLater last. IrGraph and HostCompose are
    compile dependencies only. After-deps are Mult first, then the
    HostModuleCheckCheckers after-deps plus
    HostModuleCheckCheckers.
    HostModuleCheckCheckersLater imports HostModuleCheckFixtures,
    HostModuleCheckSurface, and HostModuleCheckCheckers.
    Do not plant live HostModuleCheckCheckersLater.lean.
  - Fortieth HostModuleCheckRealModule wrappers live here:
    findLiveHostModuleCheckRealModulePath,
    namedClosedHostModuleCheckRealModuleSubsetNames,
    namedClosedHostModuleCheckRealModuleCompileOrder,
    barrelListsNamedHostModuleCheckRealModuleSubset,
    tryCompileNamedHostModuleCheckRealModuleSubset,
    tryCompileAfterHostModuleCheckRealModuleDeps.
    Named membership is the prior thirty-nine plus
    HostModuleCheckRealModule last. Barrel order among the
    forty; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the thirty-ninth compile order, then
    HostModuleCheckRealModule last. IrGraph and HostCompose are
    compile dependencies only. After-deps are Mult first, then the
    HostModuleCheckCheckersLater after-deps plus
    HostModuleCheckCheckersLater.
    HostModuleCheckRealModule imports HostModuleCheckFixtures,
    HostModuleCheckSurface, HostModuleCheckCheckers,
    HostModuleCheckCheckersLater, plus many HostModuleCheck*Term /
    *Proof modules. Those Term / Proof modules are not named
    members this slice. Do not plant live HostModuleCheckRealModule.lean.
  - Forty-first HostModuleCheckEmitBodyTerm wrappers live here:
    findLiveHostModuleCheckEmitBodyTermPath,
    namedClosedHostModuleCheckEmitBodyTermSubsetNames,
    namedClosedHostModuleCheckEmitBodyTermCompileOrder,
    barrelListsNamedHostModuleCheckEmitBodyTermSubset,
    tryCompileNamedHostModuleCheckEmitBodyTermSubset,
    tryCompileAfterHostModuleCheckEmitBodyTermDeps.
    Named membership is the prior forty plus
    HostModuleCheckEmitBodyTerm last. Barrel order among the
    forty-one; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the fortieth compile order, then EmitPlanTerm
    and MultTerm compile deps, then HostModuleCheckEmitBodyTerm last.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the fortieth compile order plus EmitPlanTerm and MultTerm.
    HostModuleCheckEmitBodyTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm and MultTerm are not
    named members this slice. Do not plant live HostModuleCheckEmitBodyTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckCheckersLaterPath,
  namedClosedHostModuleCheckCheckersLaterSubsetNames,
  namedClosedHostModuleCheckCheckersLaterCompileOrder,
  barrelListsNamedHostModuleCheckCheckersLaterSubset,
  tryCompileNamedHostModuleCheckCheckersLaterSubset,
  tryCompileAfterHostModuleCheckCheckersLaterDeps,
  findLiveHostModuleCheckRealModulePath,
  namedClosedHostModuleCheckRealModuleSubsetNames,
  namedClosedHostModuleCheckRealModuleCompileOrder,
  barrelListsNamedHostModuleCheckRealModuleSubset,
  tryCompileNamedHostModuleCheckRealModuleSubset,
  tryCompileAfterHostModuleCheckRealModuleDeps,
  findLiveHostModuleCheckEmitBodyTermPath,
  namedClosedHostModuleCheckEmitBodyTermSubsetNames,
  namedClosedHostModuleCheckEmitBodyTermCompileOrder,
  barrelListsNamedHostModuleCheckEmitBodyTermSubset,
  tryCompileNamedHostModuleCheckEmitBodyTermSubset,
  tryCompileAfterHostModuleCheckEmitBodyTermDeps,
  hostModuleCheckEmitBodyTermCompileDeps,
  SystemsLean.HostModuleCheckCheckersLater,
  SystemsLean.HostModuleCheckRealModule,
  SystemsLean.HostModuleCheckEmitBodyTerm,
  ElabMeetNamedWalkHostModuleCheckCheckersLater,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckCheckersLater,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckCheckersLater
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckCheckersLater;
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
import SystemsLean.ElabMeetNamedWalkHostModuleCheckFixtureTextsEmit

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckCheckersLater.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckCheckersLaterPath. -/
def findLiveHostModuleCheckCheckersLaterPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckCheckersLater"

/-- Named HostModuleCheckCheckersLater subset of the live SystemsLean library.
    Membership is the prior thirty-eight plus HostModuleCheckCheckersLater last.
    Barrel order among the thirty-nine; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckCheckersLaterSubsetNames.
    SystemsLean.HostModuleCheckCheckersLater. -/
def namedClosedHostModuleCheckCheckersLaterSubsetNames : List String :=
  namedClosedHostModuleCheckCheckersSubsetNames ++
    ["SystemsLean.HostModuleCheckCheckersLater"]

/-- Compile order honors imports: thirty-eighth compile order, then
    HostModuleCheckCheckersLater last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostModuleCheckCheckersLaterCompileOrder. -/
def namedClosedHostModuleCheckCheckersLaterCompileOrder : List String :=
  namedClosedHostModuleCheckCheckersCompileOrder ++
    ["SystemsLean.HostModuleCheckCheckersLater"]

/-- True when the barrel lists each HostModuleCheckCheckersLater subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckCheckersLaterSubset. -/
def barrelListsNamedHostModuleCheckCheckersLaterSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckCheckersLaterSubsetNames

/-- Compile the named HostModuleCheckCheckersLater subset after reading
    the live lakefile. Thirty-nine-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the thirty-eighth compile order, then
    HostModuleCheckCheckersLater last.
    Greppable: tryCompileNamedHostModuleCheckCheckersLaterSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckCheckersLater. -/
unsafe def tryCompileNamedHostModuleCheckCheckersLaterSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckCheckersLaterSubsetNames
    namedClosedHostModuleCheckCheckersLaterCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckCheckersLaterSubsetIO]
opaque tryCompileNamedHostModuleCheckCheckersLaterSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckCheckersLater subset.
    Greppable: tryCompileNamedHostModuleCheckCheckersLaterSubset. -/
def tryCompileNamedHostModuleCheckCheckersLaterSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckCheckersLaterSubsetIOSafe srcPath oleanDir)
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
    HostModuleCheckFixtures,
    HostModuleCheckSurface, and
    HostModuleCheckCheckers, put
    those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckCheckersLater imports HostModuleCheckFixtures,
    HostModuleCheckSurface, and HostModuleCheckCheckers.
    IrGraph and HostCompose are compile dependencies only. Do not
    plant on the live tree. Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckCheckersLaterDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckCheckersLaterDepsIO
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
      "SystemsLean.HostModuleCheckSurface",
      "SystemsLean.HostModuleCheckCheckers"]

@[implemented_by tryCompileAfterHostModuleCheckCheckersLaterDepsIO]
opaque tryCompileAfterHostModuleCheckCheckersLaterDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckCheckersLater deps.
    Greppable: tryCompileAfterHostModuleCheckCheckersLaterDeps. -/
def tryCompileAfterHostModuleCheckCheckersLaterDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckCheckersLaterDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostModuleCheckRealModule.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckRealModulePath. -/
def findLiveHostModuleCheckRealModulePath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckRealModule"

/-- Named HostModuleCheckRealModule subset of the live SystemsLean library.
    Membership is the prior thirty-nine plus HostModuleCheckRealModule last.
    Barrel order among the forty; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckRealModuleSubsetNames.
    SystemsLean.HostModuleCheckRealModule. -/
def namedClosedHostModuleCheckRealModuleSubsetNames : List String :=
  namedClosedHostModuleCheckCheckersLaterSubsetNames ++
    ["SystemsLean.HostModuleCheckRealModule"]

/-- HostModuleCheckRealModule Term and Proof imports. Compile
    dependencies only; not named members this slice.
    Greppable: hostModuleCheckRealModuleTermProofCompileDeps. -/
def hostModuleCheckRealModuleTermProofCompileDeps : List String :=
  ["SystemsLean.HostModuleCheckMultTerm",
    "SystemsLean.HostModuleCheckMultProof",
    "SystemsLean.HostModuleCheckLinearProof",
    "SystemsLean.HostModuleCheckTypesProof",
    "SystemsLean.HostModuleCheckKernelMultProof",
    "SystemsLean.HostModuleCheckKernelLinearProof",
    "SystemsLean.HostModuleCheckKernelTypesProof",
    "SystemsLean.HostModuleCheckKernelProgramProof",
    "SystemsLean.HostModuleCheckKernelEmitProof",
    "SystemsLean.HostModuleCheckLinearTerm",
    "SystemsLean.HostModuleCheckTypesTerm",
    "SystemsLean.HostModuleCheckIrProgramTerm",
    "SystemsLean.HostModuleCheckIrGraphTerm",
    "SystemsLean.HostModuleCheckHostComposeTerm",
    "SystemsLean.HostModuleCheckErasureTerm",
    "SystemsLean.HostModuleCheckExtractTerm",
    "SystemsLean.HostModuleCheckEmitPlanTerm",
    "SystemsLean.HostModuleCheckEmitApplyTerm",
    "SystemsLean.HostModuleCheckEmitBodyTerm",
    "SystemsLean.HostModuleCheckKernelMultTerm",
    "SystemsLean.HostModuleCheckKernelLinearTerm",
    "SystemsLean.HostModuleCheckKernelTypesTerm",
    "SystemsLean.HostModuleCheckKernelProgramTerm",
    "SystemsLean.HostModuleCheckKernelEmitTerm",
    "SystemsLean.HostModuleCheckParityMultTerm",
    "SystemsLean.HostModuleCheckParityLinearTerm",
    "SystemsLean.HostModuleCheckParityTypesTerm",
    "SystemsLean.HostModuleCheckParityProgramTerm",
    "SystemsLean.HostModuleCheckParityEmitTerm",
    "SystemsLean.HostModuleCheckEmitMultScaffoldTerm",
    "SystemsLean.HostModuleCheckEmitLinearScaffoldTerm",
    "SystemsLean.HostModuleCheckEmitTypesScaffoldTerm",
    "SystemsLean.HostModuleCheckEmitProgramScaffoldTerm",
    "SystemsLean.HostModuleCheckEmitGraphScaffoldTerm",
    "SystemsLean.HostModuleCheckEmitComposeScaffoldTerm",
    "SystemsLean.HostModuleCheckEmitErasureScaffoldTerm",
    "SystemsLean.HostModuleCheckEmitExtractScaffoldTerm",
    "SystemsLean.HostModuleCheckEmitBannerScaffoldTerm",
    "SystemsLean.HostModuleCheckKernelSelfApplyTerm",
    "SystemsLean.HostModuleCheckProductOutKernelTerm",
    "SystemsLean.HostModuleCheckCompilePathTerm",
    "SystemsLean.HostModuleCheckJoinMapTerm",
    "SystemsLean.HostModuleCheckSelfHostTerm",
    "SystemsLean.HostModuleCheckSurfaceMatrixTerm",
    "SystemsLean.HostModuleCheckSpecProofTerm",
    "SystemsLean.HostModuleCheckDualResidualTerm",
    "SystemsLean.HostModuleCheckCompilePathMultTerm",
    "SystemsLean.HostModuleCheckCompilePathLinearTerm",
    "SystemsLean.HostModuleCheckCompilePathTypesTerm",
    "SystemsLean.HostModuleCheckCompilePathProgramTerm",
    "SystemsLean.HostModuleCheckCompilePathGraphTerm",
    "SystemsLean.HostModuleCheckCompilePathComposeTerm",
    "SystemsLean.HostModuleCheckCompilePathErasureTerm",
    "SystemsLean.HostModuleCheckCompilePathExtractTerm",
    "SystemsLean.HostModuleCheckCompilePathPlanTerm",
    "SystemsLean.HostModuleCheckCompilePathApplyTerm",
    "SystemsLean.HostModuleCheckCompilePathBodyTerm",
    "SystemsLean.HostModuleCheckFirstSurfaceTerm",
    "SystemsLean.HostModuleCheckLinearSubsetEmitTerm",
    "SystemsLean.HostModuleCheckTypesSubsetEmitTerm",
    "SystemsLean.HostModuleCheckProgramSubsetEmitTerm",
    "SystemsLean.HostModuleCheckGraphSubsetEmitTerm",
    "SystemsLean.HostModuleCheckComposeSubsetEmitTerm",
    "SystemsLean.HostModuleCheckErasureSubsetEmitTerm",
    "SystemsLean.HostModuleCheckExtractSubsetEmitTerm",
    "SystemsLean.HostModuleCheckMultSubsetEmitTerm",
    "SystemsLean.HostModuleCheckMultSubsetRebuildTerm",
    "SystemsLean.HostModuleCheckLinearSubsetRebuildTerm",
    "SystemsLean.HostModuleCheckTypesSubsetRebuildTerm",
    "SystemsLean.HostModuleCheckProgramSubsetRebuildTerm",
    "SystemsLean.HostModuleCheckGraphSubsetRebuildTerm",
    "SystemsLean.HostModuleCheckComposeSubsetRebuildTerm",
    "SystemsLean.HostModuleCheckErasureSubsetRebuildTerm",
    "SystemsLean.HostModuleCheckExtractSubsetRebuildTerm",
    "SystemsLean.HostModuleCheckHostFrontTerm",
    "SystemsLean.HostModuleCheckLlvmMultTextTerm",
    "SystemsLean.HostModuleCheckHostCheckTerm",
    "SystemsLean.HostModuleCheckHostGraphTerm",
    "SystemsLean.HostModuleCheckLlvmLinearTextTerm",
    "SystemsLean.HostModuleCheckMultFsWriteToolTerm",
    "SystemsLean.HostModuleCheckFrontMultPackageTerm",
    "SystemsLean.HostModuleCheckSubsetPackageJoinTerm",
    "SystemsLean.HostModuleCheckLlvmTypesTextTerm",
    "SystemsLean.HostModuleCheckMultFsDeepenTerm",
    "SystemsLean.HostModuleCheckHostPackageWriteTerm",
    "SystemsLean.HostModuleCheckLlvmProgramTextTerm",
    "SystemsLean.HostModuleCheckLlvmGraphTextTerm",
    "SystemsLean.HostModuleCheckLlvmComposeTextTerm",
    "SystemsLean.HostModuleCheckSelfApplyFsTerm",
    "SystemsLean.HostModuleCheckInventoryCloseTerm",
    "SystemsLean.HostModuleCheckProductPathBarsTerm",
    "SystemsLean.HostModuleCheckProductPathTerm",
    "SystemsLean.HostModuleCheckProbeWireTerm",
    "SystemsLean.HostModuleCheckSelfHostBodyTerm"]

/-- Compile order honors imports: thirty-ninth compile order, then
    RealModule Term / Proof compile deps, then HostModuleCheckRealModule
    last. IrGraph and HostCompose are compile dependencies only
    (CompilePath / HostCompose force them). Mult first. Membership
    list vs compile order. Term / Proof companions are not named
    members this slice.
    Greppable: namedClosedHostModuleCheckRealModuleCompileOrder. -/
def namedClosedHostModuleCheckRealModuleCompileOrder : List String :=
  namedClosedHostModuleCheckCheckersLaterCompileOrder ++
    hostModuleCheckRealModuleTermProofCompileDeps ++
    ["SystemsLean.HostModuleCheckRealModule"]

/-- True when the barrel lists each HostModuleCheckRealModule subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckRealModuleSubset. -/
def barrelListsNamedHostModuleCheckRealModuleSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckRealModuleSubsetNames

/-- Compile the named HostModuleCheckRealModule subset after reading
    the live lakefile. Forty-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the thirty-ninth compile order, then
    HostModuleCheckRealModule last.
    Greppable: tryCompileNamedHostModuleCheckRealModuleSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckRealModule. -/
unsafe def tryCompileNamedHostModuleCheckRealModuleSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckRealModuleSubsetNames
    namedClosedHostModuleCheckRealModuleCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckRealModuleSubsetIO]
opaque tryCompileNamedHostModuleCheckRealModuleSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckRealModule subset.
    Greppable: tryCompileNamedHostModuleCheckRealModuleSubset. -/
def tryCompileNamedHostModuleCheckRealModuleSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckRealModuleSubsetIOSafe srcPath oleanDir)
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
    HostModuleCheckFixtures,
    HostModuleCheckSurface,
    HostModuleCheckCheckers, and
    HostModuleCheckCheckersLater, put
    those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckRealModule imports HostModuleCheckFixtures,
    HostModuleCheckSurface, HostModuleCheckCheckers, and
    HostModuleCheckCheckersLater. Term / Proof companions are not
    named members this slice. IrGraph and HostCompose are compile
    dependencies only. Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckRealModuleDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckRealModuleDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    (["SystemsLean.Mult", "SystemsLean.Types",
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
      "SystemsLean.HostModuleCheckSurface",
      "SystemsLean.HostModuleCheckCheckers",
      "SystemsLean.HostModuleCheckCheckersLater"] ++
    hostModuleCheckRealModuleTermProofCompileDeps)

@[implemented_by tryCompileAfterHostModuleCheckRealModuleDepsIO]
opaque tryCompileAfterHostModuleCheckRealModuleDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckRealModule deps.
    Greppable: tryCompileAfterHostModuleCheckRealModuleDeps. -/
def tryCompileAfterHostModuleCheckRealModuleDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckRealModuleDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostModuleCheckEmitBodyTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckEmitBodyTermPath. -/
def findLiveHostModuleCheckEmitBodyTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckEmitBodyTerm"

/-- Named HostModuleCheckEmitBodyTerm subset of the live SystemsLean library.
    Membership is the prior forty plus HostModuleCheckEmitBodyTerm last.
    Barrel order among the forty-one; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckEmitBodyTermSubsetNames.
    SystemsLean.HostModuleCheckEmitBodyTerm. -/
def namedClosedHostModuleCheckEmitBodyTermSubsetNames : List String :=
  namedClosedHostModuleCheckRealModuleSubsetNames ++
    ["SystemsLean.HostModuleCheckEmitBodyTerm"]

/-- HostModuleCheckEmitBodyTerm EmitPlanTerm and MultTerm imports.
    Compile dependencies only; not named members this slice.
    Greppable: hostModuleCheckEmitBodyTermCompileDeps. -/
def hostModuleCheckEmitBodyTermCompileDeps : List String :=
  ["SystemsLean.HostModuleCheckMultTerm",
    "SystemsLean.HostModuleCheckEmitPlanTerm"]

/-- Compile order honors imports: fortieth compile order, then
    EmitPlanTerm / MultTerm compile deps, then HostModuleCheckEmitBodyTerm
    last. IrGraph and HostCompose are compile dependencies only.
    Mult first. Membership list vs compile order. EmitPlanTerm and
    MultTerm companions are not named members this slice.
    Greppable: namedClosedHostModuleCheckEmitBodyTermCompileOrder. -/
def namedClosedHostModuleCheckEmitBodyTermCompileOrder : List String :=
  namedClosedHostModuleCheckRealModuleCompileOrder ++
    hostModuleCheckEmitBodyTermCompileDeps ++
    ["SystemsLean.HostModuleCheckEmitBodyTerm"]

/-- True when the barrel lists each HostModuleCheckEmitBodyTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckEmitBodyTermSubset. -/
def barrelListsNamedHostModuleCheckEmitBodyTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckEmitBodyTermSubsetNames

/-- Compile the named HostModuleCheckEmitBodyTerm subset after reading
    the live lakefile. Forty-one-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the fortieth compile order, then
    HostModuleCheckEmitBodyTerm last.
    Greppable: tryCompileNamedHostModuleCheckEmitBodyTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckEmitBodyTerm. -/
unsafe def tryCompileNamedHostModuleCheckEmitBodyTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckEmitBodyTermSubsetNames
    namedClosedHostModuleCheckEmitBodyTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckEmitBodyTermSubsetIO]
opaque tryCompileNamedHostModuleCheckEmitBodyTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckEmitBodyTerm subset.
    Greppable: tryCompileNamedHostModuleCheckEmitBodyTermSubset. -/
def tryCompileNamedHostModuleCheckEmitBodyTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckEmitBodyTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the fortieth HostModuleCheckRealModule
    compile order (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckEmitBodyTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm and MultTerm are not
    named members this slice. IrGraph and HostCompose are compile
    dependencies only. Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckEmitBodyTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckEmitBodyTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    (namedClosedHostModuleCheckRealModuleCompileOrder ++
      hostModuleCheckEmitBodyTermCompileDeps)

@[implemented_by tryCompileAfterHostModuleCheckEmitBodyTermDepsIO]
opaque tryCompileAfterHostModuleCheckEmitBodyTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckEmitBodyTerm deps.
    Greppable: tryCompileAfterHostModuleCheckEmitBodyTermDeps. -/
def tryCompileAfterHostModuleCheckEmitBodyTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckEmitBodyTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
