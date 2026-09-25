/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live OccupancyWalk.lean bytes.
  liveOccupancyWalkSourcePart01. Not a compile of OccupancyProbe.
  Greppable: liveOccupancyWalkSourcePart01, PARSE-LIVE-OCCUPANCY-WALK.
  Module: SystemsLean.HostFrontLiveOccupancyWalkPart01
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveOccupancyWalk

/-- Dual-pinned live OccupancyWalk.lean bytes, liveOccupancyWalkSourcePart01. -/
def liveOccupancyWalkSourcePart01 : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- smaller HostModuleCheckParityProgramTerm
  isolation walk. Not the fat ParityProgramTerm plus-one after the
  49-member ParityTypesTerm closed set.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  New role module so the fat Program walk stays untouched. Same namespace
  SystemsLean.ElabMeet. Shared helpers stay in ElabMeetNamedWalk.
  Does not import the ParityTypesTerm / ParityProgramTerm walk chain.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - Smaller named list is Mult plus MultTheorems, Types,
    TypesTheorems, Erasure, ErasureTheorems, Extract,
    ExtractTheorems, IrProgram, IrProgramTheorems, then HostFront
    band plus HostGraph, then HostPackageWrite and
    HostPackageWriteTheorems, then Program's HostModuleCheck import
    closure that the barrel already lists, then Checkers through the
    Kernel / Parity term-surface members that sit immediately before
    Program in the living 49-set, then
    HostModuleCheckParityProgramTerm last on names.
    Occupancy names length is 49. Compile order length is 164
    (plus MultTerm and EmitPlanTerm compile deps, plus the
    HostPackageWrite SubsetEmit / CompilePath / Emit closure,
    plus the closed RealModule compile-dep Proof extras:
    MultProof first, then LinearProof, TypesProof, and the five
    Kernel*Proof, plus the seven MultTerm-layer unit Terms:
    LinearTerm, TypesTerm, IrProgramTerm, IrGraphTerm,
    HostComposeTerm, ErasureTerm, ExtractTerm, plus the eight
    Emit*Scaffold Terms after EmitPlanTerm and before Checkers:
    EmitMultScaffoldTerm, EmitLinearScaffoldTerm,
    EmitTypesScaffoldTerm, EmitProgramScaffoldTerm,
    EmitGraphScaffoldTerm, EmitComposeScaffoldTerm,
    EmitErasureScaffoldTerm, EmitExtractScaffoldTerm, plus the
    three Emit apply Term extras after those eight and before
    Checkers: EmitApplyTerm, ParityEmitTerm,
    EmitBannerScaffoldTerm, plus the three Kernel compile Term
    extras after those three and before Checkers:
    KernelSelfApplyTerm, ProductOutKernelTerm, CompilePathTerm,
    plus the three Join host Surface Term extras after those
    three and before Checkers: JoinMapTerm, SelfHostTerm,
    SurfaceMatrixTerm, plus the three Spec Dual CompilePathMult
    Term extras after those three and before Checkers:
    SpecProofTerm, DualResidualTerm, CompilePathMultTerm, plus
    the three CompilePath Linear Types Program Term extras
    after those three and before Checkers: CompilePathLinearTerm,
    CompilePathTypesTerm, CompilePathProgramTerm, plus the
    three CompilePath Graph Compose Erasure Term extras after
    those three and before Checkers: CompilePathGraphTerm,
    CompilePathComposeTerm, CompilePathErasureTerm, plus the
    three CompilePath Extract Plan Apply Term extras after
    those three and before Checkers: CompilePathExtractTerm,
    CompilePathPlanTerm, CompilePathApplyTerm, plus the three
    CompilePath Body FirstSurface LinearSubsetEmit Term extras
    after those three and before Checkers: CompilePathBodyTerm,
    FirstSurfaceTerm, LinearSubsetEmitTerm, plus the three
    Types Program Graph SubsetEmit Term extras after those
    three and before Checkers: TypesSubsetEmitTerm,
    ProgramSubsetEmitTerm, GraphSubsetEmitTerm, plus the three
    Compose Erasure Extract SubsetEmit Term extras after those
    three and before Checkers: ComposeSubsetEmitTerm,
    ErasureSubsetEmitTerm, ExtractSubsetEmitTerm, plus the
    three Mult Rebuild Linear Rebuild Term extras after those
    three and before Checkers: MultSubsetEmitTerm,
    MultSubsetRebuildTerm, LinearSubsetRebuildTerm, plus the
    three Types Program Graph Rebuild Term extras after those
    three and before Checkers: TypesSubsetRebuildTerm,
    ProgramSubsetRebuildTerm, GraphSubsetRebuildTerm, plus the
    three Compose Erasure Extract Rebuild Term extras after
    those three and before Checkers: ComposeSubsetRebuildTerm,
    ErasureSubsetRebuildTerm, ExtractSubsetRebuildTerm, plus the
    three Host Front Llvm Mult Host Check Term extras after those
    three and before Checkers: HostFrontTerm,
    LlvmMultTextTerm, HostCheckTerm, plus the
    three Host Graph Llvm Linear Mult Fs Write Term extras after
    those three and before Checkers: HostGraphTerm,
    LlvmLinearTextTerm, MultFsWriteToolTerm, plus the
    three Front Mult Subset Join Llvm Types Term extras after
    those three and before Checkers: FrontMultPackageTerm,
    SubsetPackageJoinTerm, LlvmTypesTextTerm, plus the
    three Mult Fs Deepen Host Package Llvm Program Term extras
    after those three and before Checkers: MultFsDeepenTerm,
    HostPackageWriteTerm, LlvmProgramTextTerm, plus the
    three Llvm Graph Compose Self Apply Term extras after
    those three and before Checkers: LlvmGraphTextTerm,
    LlvmComposeTextTerm, SelfApplyFsTerm, plus the
    three Inventory Close Product Path Term extras after
    those three and before Checkers: InventoryCloseTerm,
    ProductPathBarsTerm, ProductPathTerm, plus the
    two Probe Wire Self Host Body Term extras after
    those three and before Checkers: ProbeWireTerm,
    SelfHostBodyTerm, plus the one LoadOkCompilePathUnits
    occupancy extra after those two and before Checkers:
    LoadOkCompilePathUnits, plus the one LoadOkLaterTerm
    occupancy extra after the after-Checkers Kernel / Parity
    extras and ParityProgramTerm: LoadOkLaterTerm, plus the
    one AcceptsGoodsTerm occupancy extra after LoadOkLaterTerm:
    AcceptsGoodsTerm).
  - Occupancy grow (not the 49-set): MultTheorems, Types,
    TypesTheorems, Erasure, ErasureTheorems, Extract,
    ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm,
    HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck,
    HostGraph, HostGraphTheorems, HostPackageWrite,
    HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, HostImportGraphModel,
    HostImportGraphMods, HostImportGraphModsLater,
    HostImportGraphLoadOkLater, HostImportGraphWalkLater,
    HostImportGraphWalk, then Checkers through ParityTypesTerm.
    HostFront is honestly in this occupancy list. HostPackageRoots
    has no package imports. Import-graph compile deps are Seeds
    then Model then Mods / ModsLater / LoadOkLater / WalkLater /
    Walk; that closed band is honest on this occupancy list.
    HostPackageWrite compile deps are IrGraph, HostCompose,
    CompilePath, Emit scaffolds, Emit unit surfaces, CompilePath
    unit surfaces, FirstSurface, and MultSubsetEmit through
    ComposeSubsetEmit; those extras sit on compile order only
    (same role as MultTerm / EmitPlanTerm). The eight Proof
    companions (MultProof hub, then LinearProof, TypesProof,
    KernelMultProof, KernelLinearProof, KernelTypesProof,
    KernelProgramProof, KernelEmitProof) sit on compile order
    only. The seven MultTerm-layer unit Terms (LinearTerm,
    TypesTerm, IrProgramTerm, IrGraphTerm, HostComposeTerm,
    ErasureTerm, ExtractTerm) sit on compile order only.
    The eight Emit*Scaffold Terms sit on compile order only
    after EmitPlanTerm and before Checkers. They are not
    named members. The three Emit apply Term extras
    (EmitApplyTerm, ParityEmitTerm, EmitBannerScaffoldTerm)
    sit on compile order only after those eight and before
    Checkers. They are not named members. The three Kernel
    compile Term extras (KernelSelfApplyTerm,
    ProductOutKernelTerm, CompilePathTerm) sit on compile
    order only after those three and before Checkers. They
    are not named members. The three Join host Surface Term
    extras (JoinMapTerm, SelfHostTerm, SurfaceMatrixTerm)
    sit on compile order only after those three and before
    Checkers. They are not named members. The three Spec Dual
    CompilePathMult Term extras (SpecProofTerm, DualResidualTerm,
    CompilePathMultTerm) sit on compile order only after those
    three and before Checkers. They are not named members.
    The three CompilePath Linear Types Program Term extras
    (CompilePathLinearTerm, CompilePathTypesTerm,
    CompilePathProgramTerm) sit on compile order only after
    those three and before Checkers. They are not named members.
    The three CompilePath Graph Compose Erasure Term extras
    (CompilePathGraphTerm, CompilePathComposeTerm,
    CompilePathErasureTerm) sit on compile order only after
    those three and before Checkers. They are not named members.
    The three CompilePath Extract Plan Apply Term extras
    (CompilePathExtractTerm, CompilePathPlanTerm,
    CompilePathApplyTerm) sit on compile order only after
    those three and before Checkers. They are not named members.
    The three CompilePath Body FirstSurface LinearSubsetEmit
    Term extras (CompilePathBodyTerm, FirstSurfaceTerm,
    LinearSubsetEmitTerm) sit on compile order only after
    those three and before Checkers. They are not named members.
    The three Types Program Graph SubsetEmit Term extras
    (TypesSubsetEmitTerm, ProgramSubsetEmitTerm,
    GraphSubsetEmitTerm) sit on compile order only after
    those three and before Checkers. They are not named members.
    The three Compose Erasure Extract SubsetEmit Term extras
    (ComposeSubsetEmitTerm, ErasureSubsetEmitTerm,
    ExtractSubsetEmitTerm) sit on compile order only after
    those three and before Checkers. They are not named members.
    The three Mult Rebuild Linear Rebuild Term extras
    (MultSubsetEmitTerm, MultSubsetRebuildTerm,
    LinearSubsetRebuildTerm) sit on compile order only after
    those three and before Checkers. They are not named members.
    The three Types Program Graph Rebuild Term extras
    (TypesSubsetRebuildTerm, ProgramSubsetRebuildTerm,
    GraphSubsetRebuildTerm) sit on compile order only after
    those three and before Checkers. They are not named members.
    The three Compose Erasure Extract Rebuild Term extras
    (ComposeSubsetRebuildTerm, ErasureSubsetRebuildTerm,
    ExtractSubsetRebuildTerm) sit on compile order only after
    those three and before Checkers. They are not named members.
    The three Host Front Llvm Mult Host Check Term extras
    (HostFrontTerm, LlvmMultTextTerm, HostCheckTerm) sit on
    compile order only after those three and before Checkers.
    They are not named members.
    The three Host Graph Llvm Linear Mult Fs Write Term extras
    (HostGraphTerm, LlvmLinearTextTerm, MultFsWriteToolTerm) sit
    on compile order only after those three and before Checkers.
    They are not named members.
    The three Front Mult Subset Join Llvm Types Term extras
    (FrontMultPackageTerm, SubsetPackageJoinTerm,
    LlvmTypesTextTerm) sit on compile order only after those
    three and before Checkers. They are not named members.
    The three Mult Fs Deepen Host Package Llvm Program Term extras
    (MultFsDeepenTerm, HostPackageWriteTerm,
    LlvmProgramTextTerm) sit on compile order only after those
    three and before Checkers. They are not named members.
    The three Llvm Graph Compose Self Apply Term extras
    (LlvmGraphTextTerm, LlvmComposeTextTerm, SelfApplyFsTerm)
    sit on compile order only after those three and before
    Checkers. They are not named members.
    The three Inventory Close Product Path Term extras
    (InventoryCloseTerm, ProductPathBarsTerm, ProductPathTerm)
    sit on compile order only after those three and before
    Checkers. They are not named members.
    The two Probe Wire Self Host Body Term extras
    (ProbeWireTerm, SelfHostBodyTerm) sit on
    compile order only after those three and before Checkers.
    They are not named members.
    The one LoadOkCompilePathUnits occupancy extra
    (LoadOkCompilePathUnits) sits on compile order only
    after those two and before Checkers. It is not a
    named member. The one LoadOkLaterTerm occupancy extra
    sits on compile order only after the after-Checkers
    Kernel / Parity extras and ParityProgramTerm. It is
    not a named member. The one AcceptsGoodsTerm occupancy
    extra sits on compile order only after LoadOkLaterTerm.
    It is RealModule-free and not a named member. RealModule
    stays out of occupancy names and compile order
    (import bomb). HostPackageWrite and
    HostPackageWriteTheorems are named members. ParityTypesTerm
    is honestly in this occupancy list. TypesTheorems compile
    deps are Mult,
    MultTheorems, Types. ErasureTheorems compile deps are Mult,
    Erasure. ExtractTheorems compile deps are Mult, Erasure,
    Extract. IrProgramTheorems compile deps are Mult, Types,
    IrProgram. All four stay honest on this occupancy list.
  - Dropped from the 49-set previous list:
    HostModuleCheckRealModule. IrGraph and HostCompose stay
    compile-order extras, not named members.
  - Kept compile deps HostModuleCheckMultTerm and
    HostModuleCheckEmitPlanTerm (Program imports Surface and
    EmitPlanTerm; EmitPlanTerm imports MultTerm). Those two are not
    barrel named members. HostFront compile deps HostTerm and
    HostFrontGoldens are named members. ParityTypesTerm is honestly
    in this occupancy list.
  - This walk is not member 50 of the 49-set. Living tip stays 49 until
    the fat Program plus-one EXIT 0 and ElabMeet fold.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckParityProgramTermSmallPath,
  namedClosedHostModuleCheckParityProgramTermSmallSubsetNames,
  namedClosedHostModuleCheckParityProgramTermSmallCompileOrder,
  barrelListsNamedHostModuleCheckParityProgramTermSmallSubset,
  tryCompileNamedHostModuleCheckParityProgramTermSmallSubset,
  tryCompileAfterHostModuleCheckParityProgramTermSmallDeps,
  SystemsLean.HostModuleCheckParityProgramTerm,
  OccupancyWalk,
  SystemsLean.OccupancyWalk,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.OccupancyWalk
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build
  SystemsLean.OccupancyWalk;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHost. Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false. leakEnv stays false.
-/

import Lean
import SystemsLean.ElabMeetLive
import SystemsLean.ElabMeetNamedWalk

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckParityProgramTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckParityProgramTermSmallPath. -/
def findLiveHostModuleCheckParityProgramTermSmallPath :
    IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckParityProgramTerm"

/-- Smaller HostModuleCheckParityProgramTerm isolation names.
    Barrel members: Mult plus MultTheorems, Types, TypesTheorems,
    Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram,
    IrProgramTheorems, then HostFront band plus HostGraph, then
    HostPackageWrite plus HostPackageWriteTheorems, then
    HostPackageRoots and the HostImportGraph closed band, then the
    HostModuleCheck import closure Program needs, then Checkers
    through the Kernel / Parity term-surface members immediately
    before Program, then HostModuleCheckParityProgramTerm last.
    Length 49. Not the 49-set (HostFront in; RealModule out;
    HostPackageWrite in; HostPackageRoots and import-graph in;
    ProgramTerm in; RealModule still out).
    Greppable: namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.
    SystemsLean.HostModuleCheckParityProgramTerm. -/
def namedClosedHostModuleCheckParityProgramTermSmallSubsetNames :
    List String :=
  ["SystemsLean.Mult",
   "SystemsLean.MultTheorems",
   "SystemsLean.Types",
   "SystemsLean.TypesTheorems",
   "SystemsLean.Erasure",
   "SystemsLean.ErasureTheorems",
   "SystemsLean.Extract",
   "SystemsLean.ExtractTheorems",
   "SystemsLean.IrProgram",
   "SystemsLean.IrProgramTheorems",
   "SystemsLean.HostTerm",
   "SystemsLean.HostFrontGoldens",
   "SystemsLean.HostFront",
   "SystemsLean.HostFrontTheorems",
   "SystemsLean.HostCheck",
   "SystemsLean.HostGraph",
   "SystemsLean.HostGraphTheorems",
   "SystemsLean.HostPackageWrite",
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
   "SystemsLean.HostModuleCheckCheckersLater",
   "SystemsLean.HostModuleCheckEmitBodyTerm",
   "SystemsLean.HostModuleCheckKernelMultTerm",
   "SystemsLean.HostModuleCheckKernelLinearTerm",
   "SystemsLean.HostModuleCheckKernelTypesTerm",
   "SystemsLean.HostModuleCheckKernelProgramTerm",
   "SystemsLean.HostModuleCheckKernelEmitTerm",
   "SystemsLean.HostModuleCheckParityMultTerm",
   "SystemsLean.HostModuleCheckParityLinearTerm",
   "SystemsLean.HostModuleCheckParityTypesTerm",
   "SystemsLean.HostModuleCheckParityProgramTerm"]

/-- Compile order: Mult first (walker API), then MultTheorems, Types,
    TypesTheorems, Erasure, ErasureTheorems, Extract,
    ExtractTheorems, IrProgram, IrProgramTheorems (Types imports
    Mult; TypesTheorems imports Mult, MultTheorems, Types;
    ErasureTheorems imports Mult, Erasure; Extract imports Erasure;
    ExtractTheorems imports Mult, Erasure, Extract; IrProgram
    imports Types; IrProgramTheorems imports Mult, Types,
    IrProgram), then HostFront band plus HostGraph (HostFront
    imports HostTerm, Mult, HostFrontGoldens; HostGraph imports
    HostFront and HostTerm), then HostPackageWrite SubsetEmit /
    CompilePath / Emit closure (IrGraph and HostCompose
    compile-only), then HostPackageWrite and
    HostPackageWriteTheorems, then HostPackageRoots (no package
    imports) and the HostImportGraph closed band, then Program's
    import closure, including MultTerm and EmitPlanTerm as compile
    deps, then the eight Proof extras (MultProof first, then the
    other seven), then the seven MultTerm-layer unit Terms, then
    EmitPlanTerm, then the eight Emit*Scaffold Terms, then the
    three Emit apply Term extras, then the three Kernel
    compile Term extras, then the three Join host Surface
    Term extras, then the three Spec Dual CompilePathMult
    Term extras, then the three CompilePath Linear Types
    Program Term extras, then the three CompilePath Graph
    Compose Erasure Term extras, then the three CompilePath
    Extract Plan Apply Term extras, then the three CompilePath
    Body FirstSurface LinearSubsetEmit Term extras, then
    the three Types Program Graph SubsetEmit Term extras, then
    the three Compose Erasure Extract SubsetEmit Term extras, then
    the three Mult Rebuild Linear Rebuild Term extras, then
    the three Types Program Graph Rebuild Term extras, then
    the three Compose Erasure Extract Rebuild Term extras, then
    the three Host Front Llvm Mult Host Check Term extras, then
    the three Host Graph Llvm Linear Mult Fs Write Term extras,
    then the three Front Mult Subset Join Llvm Types Term extras,
    then the three Mult Fs Deepen Host Package Llvm Program
    Term extras, then the three Llvm Graph Compose Self Apply
    Term extras, then the three Inventory Close Product Path
    Term extras, then the two Probe Wire Self Host Body
    Term extras, then the one LoadOkCompilePathUnits
    occupancy extra, then Checkers through Kernel /
    Parity occupancy members, then
    HostModuleCheckParityProgramTerm, then the one
    LoadOkLaterTerm occupancy extra, then the one
    AcceptsGoodsTerm occupancy extra last. Length 164.
    Greppable: namedClosedHostModuleCheckParityProgramTermSmallCompileOrder. -/
def namedClosedHostModuleCheckParityProgramTermSmallCompileOrder :
"#

end SystemsLean.HostFrontLiveOccupancyWalk
