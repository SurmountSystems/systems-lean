/-
  SYSTEMS_LEAN_HOST partial -- smaller HostModuleCheckParityProgramTerm
  isolation probe. Not the fat ParityProgramTermProbe that rebuilt the
  49-member ParityTypesTerm closed set (Lean 137 twice).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetSubset stays under about 880.
  Same namespace SystemsLean.ElabMeet. Wrappers live in
  OccupancyWalk. Shared helpers
  stay in ElabMeetNamedWalk. Do not import the ParityTypesTerm /
  ParityProgramTerm walk chain. Do not put this probe on ElabMeetSubset,
  Tail, Later, ElabMeetCompile, or ElabMeetTheorems.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - Smaller isolation compiles Mult plus MultTheorems, Types,
    TypesTheorems, Erasure, ErasureTheorems, Extract,
    ExtractTheorems, IrProgram, IrProgramTheorems, then HostFront
    band plus HostGraph, then Program's HostModuleCheck import
    closure, then Checkers through Kernel / Parity term-surface
    members that sit immediately before Program, then
    HostModuleCheckParityProgramTerm last on names. Names length 49.
    Compile order length 164 (eight Proof extras plus seven MultTerm-layer
    unit Terms plus eight Emit*Scaffold Terms plus three Emit apply
    Term extras plus three Kernel compile Term extras plus three
    Join host Surface Term extras plus three Spec Dual
    CompilePathMult Term extras plus three CompilePath Linear
    Types Program Term extras plus three CompilePath Graph
    Compose Erasure Term extras plus three CompilePath Extract
    Plan Apply Term extras plus three CompilePath Body
    FirstSurface LinearSubsetEmit Term extras plus three Types
    Program Graph SubsetEmit Term extras plus three Compose
    Erasure Extract SubsetEmit Term extras plus three Mult
    Rebuild Linear Rebuild Term extras plus three Types
    Program Graph Rebuild Term extras plus three Compose
    Erasure Extract Rebuild Term extras plus three Host Front
    Llvm Mult Host Check Term extras plus three Host Graph
    Llvm Linear Mult Fs Write Term extras plus three Front
    Mult Subset Join Llvm Types Term extras plus three Mult
    Fs Deepen Host Package Llvm Program Term extras plus
    three Llvm Graph Compose Self Apply Term extras plus
    three Inventory Close Product Path Term extras plus
    two Probe Wire Self Host Body Term extras plus
    the one LoadOkCompilePathUnits occupancy extra on
    compile order only plus the one LoadOkLaterTerm occupancy
    extra on compile order only after ParityProgramTerm plus
    the one AcceptsGoodsTerm occupancy extra on compile
    order only after LoadOkLaterTerm).
  - Occupancy grow: MultTheorems, Types, TypesTheorems, Erasure,
    ErasureTheorems, Extract, ExtractTheorems, IrProgram,
    IrProgramTheorems, HostTerm, HostFrontGoldens, HostFront,
    HostFrontTheorems, HostCheck, HostGraph, HostGraphTheorems,
    HostPackageWrite, HostPackageWriteTheorems, HostPackageRoots,
    HostImportGraphSeeds, HostImportGraphModel,
    HostImportGraphMods, HostImportGraphModsLater,
    HostImportGraphLoadOkLater, HostImportGraphWalkLater,
    HostImportGraphWalk, then Checkers through ParityTypesTerm.
    HostFront is honestly in this list. HostPackageRoots and
    import-graph are honestly in this list. HostPackageWrite and
    HostPackageWriteTheorems are honestly in this list. SubsetEmit /
    CompilePath / Emit extras sit on compile order only. RealModule
    stays out. ParityTypesTerm is honestly in this list. Living tip
    stays 49. This is not member 50.
  - tryCompileNamedHostModuleCheckParityProgramTermSmallSubset is false
    unless the path is the live lakefile, the parsed library is
    SystemsLean, and the barrel lists the smaller names.
  - Isolation names leftover temp good.lean, leftover fake lean_lib
    ElabMeetRichLib, live Mult still compiles, and this list is not the
    49-set (HostFront is in; names length is 49; ProgramTerm is in;
    RealModule is not). Compile order length is 164, Mult first,
    AcceptsGoodsTerm last, ParityTypesTerm is in that order, HostFront is
    in, HostPackageRoots is in, import-graph is in, HostPackageWrite
    is in, RealModule is not. Does not recompile the Types 49-set.
  - The drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 50.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveHostModuleCheckParityProgramTermSmallPath,
  namedClosedHostModuleCheckParityProgramTermSmallSubsetNames,
  namedClosedHostModuleCheckParityProgramTermSmallCompileOrder,
  barrelListsNamedHostModuleCheckParityProgramTermSmallSubset,
  tryCompileNamedHostModuleCheckParityProgramTermSmallSubset,
  tryCompileAfterHostModuleCheckParityProgramTermSmallDeps,
  elabMeetDrivesNamedHostModuleCheckParityProgramTermSmallSubset,
  elabMeetAcceptsGoodNamedHostModuleCheckParityProgramTermSmallSubset,
  elabMeetRejectsBadNamedHostModuleCheckParityProgramTermSmallSubset,
  elabMeetRejectsOldWalkAsNamedHostModuleCheckParityProgramTermSmallSubset,
  #elabMeetNamedHostModuleCheckParityProgramTermSmallSubsetProbe,
  elabMeetNamedHostModuleCheckParityProgramTermSmallSubsetProbe,
  SystemsLean.HostModuleCheckParityProgramTerm,
  OccupancyProbe,
  SystemsLean.OccupancyProbe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.OccupancyProbe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build
  SystemsLean.OccupancyProbe;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHost. Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false. leakEnv stays false.
-/

import Lean
import SystemsLean.ElabMeetLive
import SystemsLean.ElabMeetNamedWalk
import SystemsLean.OccupancyWalk

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Record accept / reject for the smaller Program isolation.
    Good compiles Mult plus Program's HostModuleCheck import closure,
    Checkers through Kernel / Parity occupancy members, and
    HostModuleCheckParityProgramTerm after reading the real lakefile.
    Bad compiles a temp HostModuleCheckParityProgramTerm copy with a
    planted type error after that reduced dep order.
    Isolation: leftover temp good.lean and leftover fake lean_lib
    ElabMeetRichLib stay false; live Mult still compiles; this list is
    not the 49-set. Compile order length is 164, Mult first,
    AcceptsGoodsTerm last. ParityTypesTerm is honestly in that order.
    HostFront is in.
    HostPackageRoots is in. Import-graph is in. HostPackageWrite is
    in. RealModule is not. TypesTheorems, ErasureTheorems,
    ExtractTheorems, and IrProgramTheorems are in. Drive is
    good && !bad && isolation.
    Linear skipped. IrGraph skipped as a grow-tip Name. Do not plant
    live HostModuleCheckParityProgramTerm.lean. Do not claim 50. -/
elab "#elabMeetNamedHostModuleCheckParityProgramTermSmallSubsetProbe" :
    command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveHostModuleCheckParityProgramTerm? <-
    liftIO findLiveHostModuleCheckParityProgramTermSmallPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostModuleCheckParityProgramTermSmallSubset
        liveLake oleanDir
  let badCompiled <-
    match liveHostModuleCheckParityProgramTerm? with
    | none =>
      pure true
    | some liveHostModuleCheckParityProgramTerm => do
      let liveText <-
        liftIO (IO.FS.readFile liveHostModuleCheckParityProgramTerm)
      let badPath :=
        badDir / "ElabMeetNamedHostModuleCheckParityProgramTermSmallSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostModuleCheckParityProgramTermSmallDeps
        badPath badDir
        `ElabMeetNamedHostModuleCheckParityProgramTermSmallSubsetBad
  let liveMultStillOk <-
    match liveMult? with
    | none => pure false
    | some liveMult =>
      tryCompileLiveModule liveMult isoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostModuleCheckParityProgramTermSmallSubset
      goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostModuleCheckParityProgramTermSmallSubset
      fakeLake fakeDir
  let notAliasOfFortyNine :=
    namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.length == 49
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckParityProgramTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.Mult"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.MultTheorems"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.Types"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.TypesTheorems"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.Erasure"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.ErasureTheorems"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.Extract"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.ExtractTheorems"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.IrProgram"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.IrProgramTheorems"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckParityTypesTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostFront"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostPackageRoots"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostImportGraphSeeds"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostImportGraphWalk"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckRealModule"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostPackageWrite"
      && namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostPackageWriteTheorems"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.length
           == 164
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.head?
           == some "SystemsLean.Mult"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.getLast?
           == some "SystemsLean.HostModuleCheckAcceptsGoodsTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckParityTypesTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.Types"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.TypesTheorems"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.ErasureTheorems"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.ExtractTheorems"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.IrProgram"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.IrProgramTheorems"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostFront"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostPackageRoots"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostImportGraphWalk"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostPackageWrite"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostPackageWriteTheorems"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.MultSubsetEmit"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.CompilePath"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.IrGraph"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckMultProof"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckLinearProof"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckTypesProof"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckKernelMultProof"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckKernelLinearProof"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckKernelTypesProof"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckKernelProgramProof"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckKernelEmitProof"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckLinearTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckTypesTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckIrProgramTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckIrGraphTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckHostComposeTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckErasureTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckExtractTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckEmitPlanTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckEmitMultScaffoldTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckEmitLinearScaffoldTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckEmitTypesScaffoldTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckEmitProgramScaffoldTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckEmitGraphScaffoldTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckEmitComposeScaffoldTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckEmitErasureScaffoldTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckEmitExtractScaffoldTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckEmitApplyTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckParityEmitTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckEmitBannerScaffoldTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckKernelSelfApplyTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckProductOutKernelTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckCompilePathTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckJoinMapTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckSelfHostTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckSurfaceMatrixTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckSpecProofTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckDualResidualTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckCompilePathMultTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckCompilePathLinearTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckCompilePathTypesTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckCompilePathProgramTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckCompilePathGraphTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckCompilePathComposeTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckCompilePathErasureTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckCompilePathExtractTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckCompilePathPlanTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckCompilePathApplyTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckCompilePathBodyTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckFirstSurfaceTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckLinearSubsetEmitTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckTypesSubsetEmitTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckProgramSubsetEmitTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckGraphSubsetEmitTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckComposeSubsetEmitTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckErasureSubsetEmitTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckExtractSubsetEmitTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckMultSubsetEmitTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckMultSubsetRebuildTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckLinearSubsetRebuildTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckTypesSubsetRebuildTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckProgramSubsetRebuildTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckGraphSubsetRebuildTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckComposeSubsetRebuildTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckErasureSubsetRebuildTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckExtractSubsetRebuildTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckHostFrontTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckLlvmMultTextTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckHostCheckTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckHostGraphTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckLlvmLinearTextTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckMultFsWriteToolTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckFrontMultPackageTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckSubsetPackageJoinTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckLlvmTypesTextTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckMultFsDeepenTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckHostPackageWriteTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckLlvmProgramTextTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckLlvmGraphTextTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckLlvmComposeTextTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckSelfApplyFsTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckInventoryCloseTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckProductPathBarsTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckProductPathTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckProbeWireTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckSelfHostBodyTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckLoadOkCompilePathUnits"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckLoadOkLaterTerm"
      && namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckAcceptsGoodsTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckMultProof"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckLinearTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckEmitMultScaffoldTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckEmitApplyTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckParityEmitTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckEmitBannerScaffoldTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckKernelSelfApplyTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckProductOutKernelTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckCompilePathTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckJoinMapTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckSelfHostTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckSurfaceMatrixTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckSpecProofTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckDualResidualTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckCompilePathMultTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckCompilePathLinearTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckCompilePathTypesTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckCompilePathProgramTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckCompilePathGraphTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckCompilePathComposeTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckCompilePathErasureTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckCompilePathExtractTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckCompilePathPlanTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckCompilePathApplyTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckCompilePathBodyTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckFirstSurfaceTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckLinearSubsetEmitTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckTypesSubsetEmitTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckProgramSubsetEmitTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckGraphSubsetEmitTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckComposeSubsetEmitTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckErasureSubsetEmitTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckExtractSubsetEmitTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckMultSubsetEmitTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckMultSubsetRebuildTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckLinearSubsetRebuildTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckTypesSubsetRebuildTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckProgramSubsetRebuildTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckGraphSubsetRebuildTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckComposeSubsetRebuildTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckErasureSubsetRebuildTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckExtractSubsetRebuildTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckHostFrontTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckLlvmMultTextTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckHostCheckTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckHostGraphTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckLlvmLinearTextTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckMultFsWriteToolTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckFrontMultPackageTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckSubsetPackageJoinTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckLlvmTypesTextTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckMultFsDeepenTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckHostPackageWriteTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckLlvmProgramTextTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckLlvmGraphTextTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckLlvmComposeTextTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckSelfApplyFsTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckInventoryCloseTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckProductPathBarsTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckProductPathTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckProbeWireTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckSelfHostBodyTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckLoadOkCompilePathUnits"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckLoadOkLaterTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.HostModuleCheckAcceptsGoodsTerm"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.Linear"
      && !namedClosedHostModuleCheckParityProgramTermSmallSubsetNames.contains
           "SystemsLean.IrGraph"
      && !namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.HostModuleCheckRealModule"
      && !namedClosedHostModuleCheckParityProgramTermSmallCompileOrder.contains
           "SystemsLean.Linear"
  let isolation :=
    liveMultStillOk && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfFortyNine
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
  let gN :=
    mkIdent `elabMeetAcceptsGoodNamedHostModuleCheckParityProgramTermSmallSubset
  let rN :=
    mkIdent `elabMeetRejectsBadNamedHostModuleCheckParityProgramTermSmallSubset
  let iN :=
    mkIdent
      `elabMeetRejectsOldWalkAsNamedHostModuleCheckParityProgramTermSmallSubset
  let dN :=
    mkIdent `elabMeetDrivesNamedHostModuleCheckParityProgramTermSmallSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedHostModuleCheckParityProgramTermSmallSubsetProbe

example :
    elabMeetAcceptsGoodNamedHostModuleCheckParityProgramTermSmallSubset =
      true :=
  rfl
example :
    elabMeetRejectsBadNamedHostModuleCheckParityProgramTermSmallSubset =
      true :=
  rfl
example :
    elabMeetRejectsOldWalkAsNamedHostModuleCheckParityProgramTermSmallSubset =
      true :=
  rfl
example :
    elabMeetDrivesNamedHostModuleCheckParityProgramTermSmallSubset = true :=
  rfl

end SystemsLean.ElabMeet
