/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckGraphSubsetRebuildTerm named-walk
  wrappers (CheckersLater-role walk; ProgramSubsetRebuildTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, EmitMultScaffoldTerm
  walk, EmitLinearScaffoldTerm walk, EmitTypesScaffoldTerm walk,
  EmitProgramScaffoldTerm walk, EmitGraphScaffoldTerm walk,
  EmitComposeScaffoldTerm walk, EmitErasureScaffoldTerm walk,
  EmitExtractScaffoldTerm walk, EmitBannerScaffoldTerm walk,
  KernelSelfApplyTerm walk, ProductOutKernelTerm walk,
  CompilePathTerm walk, JoinMapTerm walk, SelfHostTerm walk,
  SurfaceMatrixTerm walk, SpecProofTerm walk, DualResidualTerm
  walk, CompilePathMultTerm walk, CompilePathLinearTerm walk,
  CompilePathTypesTerm walk, CompilePathProgramTerm walk,
  CompilePathGraphTerm walk, CompilePathComposeTerm walk,
  CompilePathErasureTerm walk, CompilePathExtractTerm walk,
  CompilePathPlanTerm walk, CompilePathApplyTerm walk,
  CompilePathBodyTerm walk, FirstSurfaceTerm walk,
  LinearSubsetEmitTerm walk, TypesSubsetEmitTerm walk,
  ProgramSubsetEmitTerm walk, GraphSubsetEmitTerm walk,
  ComposeSubsetEmitTerm walk, ErasureSubsetEmitTerm walk,
  ExtractSubsetEmitTerm walk, MultSubsetEmitTerm walk,
  MultSubsetRebuildTerm walk, LinearSubsetRebuildTerm walk,
  TypesSubsetRebuildTerm walk, and ProgramSubsetRebuildTerm walk
  stay as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior ProgramSubsetRebuildTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckProgramSubsetRebuildTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, ParityMultTermProbe,
  ParityLinearTermProbe, ParityTypesTermProbe, ParityProgramTermProbe,
  ParityEmitTermProbe, EmitMultScaffoldTermProbe, EmitLinearScaffoldTermProbe,
  EmitTypesScaffoldTermProbe, EmitProgramScaffoldTermProbe,
  EmitGraphScaffoldTermProbe, EmitComposeScaffoldTermProbe,
  EmitErasureScaffoldTermProbe, EmitExtractScaffoldTermProbe,
  EmitBannerScaffoldTermProbe, KernelSelfApplyTermProbe,
  ProductOutKernelTermProbe, CompilePathTermProbe, JoinMapTermProbe,
  SelfHostTermProbe, SurfaceMatrixTermProbe, SpecProofTermProbe,
  DualResidualTermProbe, CompilePathMultTermProbe,
  CompilePathLinearTermProbe, CompilePathTypesTermProbe,
  CompilePathProgramTermProbe, CompilePathGraphTermProbe,
  CompilePathComposeTermProbe, CompilePathErasureTermProbe,
  CompilePathExtractTermProbe, CompilePathPlanTermProbe,
  CompilePathApplyTermProbe, CompilePathBodyTermProbe,
  FirstSurfaceTermProbe, LinearSubsetEmitTermProbe,
  TypesSubsetEmitTermProbe, ProgramSubsetEmitTermProbe,
  GraphSubsetEmitTermProbe, ComposeSubsetEmitTermProbe,
  ErasureSubsetEmitTermProbe, ExtractSubsetEmitTermProbe,
  MultSubsetEmitTermProbe, MultSubsetRebuildTermProbe,
  LinearSubsetRebuildTermProbe, TypesSubsetRebuildTermProbe, or
  ProgramSubsetRebuildTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckGraphSubsetRebuildTerm.lean.
  Do not skip to HostModuleCheckComposeSubsetRebuildTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckGraphSubsetRebuildTerm wrappers live here:
    findLiveHostModuleCheckGraphSubsetRebuildTermPath,
    namedClosedHostModuleCheckGraphSubsetRebuildTermSubsetNames,
    namedClosedHostModuleCheckGraphSubsetRebuildTermCompileOrder,
    barrelListsNamedHostModuleCheckGraphSubsetRebuildTermSubset,
    tryCompileNamedHostModuleCheckGraphSubsetRebuildTermSubset,
    tryCompileAfterHostModuleCheckGraphSubsetRebuildTermDeps.
    Named membership is the prior ProgramSubsetRebuildTerm closed set plus
    HostModuleCheckGraphSubsetRebuildTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Compile order is the ProgramSubsetRebuildTerm compile
    order, then HostModuleCheckGraphSubsetRebuildTerm last. EmitPlanTerm
    is a compile dependency only (already on the KernelEmitTerm /
    ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm / EmitGraphScaffoldTerm /
    EmitComposeScaffoldTerm / EmitErasureScaffoldTerm /
    EmitExtractScaffoldTerm / EmitBannerScaffoldTerm /
    KernelSelfApplyTerm / ProductOutKernelTerm / CompilePathTerm /
    JoinMapTerm / SelfHostTerm / SurfaceMatrixTerm /
    SpecProofTerm / DualResidualTerm / CompilePathMultTerm /
    CompilePathLinearTerm / CompilePathTypesTerm /
    CompilePathProgramTerm / CompilePathGraphTerm /
    CompilePathComposeTerm / CompilePathErasureTerm /
    CompilePathExtractTerm / CompilePathPlanTerm /
    CompilePathApplyTerm / CompilePathBodyTerm /
    FirstSurfaceTerm / LinearSubsetEmitTerm / TypesSubsetEmitTerm /
    ProgramSubsetEmitTerm / GraphSubsetEmitTerm /
    ComposeSubsetEmitTerm / ErasureSubsetEmitTerm /
    ExtractSubsetEmitTerm / MultSubsetEmitTerm /
    MultSubsetRebuildTerm / LinearSubsetRebuildTerm /
    TypesSubsetRebuildTerm / ProgramSubsetRebuildTerm order), not a
    named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the ProgramSubsetRebuildTerm compile order.
    HostModuleCheckGraphSubsetRebuildTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckProgramSubsetRebuildTerm; EmitPlanTerm is compile-dep only).
    RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
    named members of the closed set, not extra plus-ones.
    Do not plant live HostModuleCheckGraphSubsetRebuildTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckGraphSubsetRebuildTermPath,
  namedClosedHostModuleCheckGraphSubsetRebuildTermSubsetNames,
  namedClosedHostModuleCheckGraphSubsetRebuildTermCompileOrder,
  barrelListsNamedHostModuleCheckGraphSubsetRebuildTermSubset,
  tryCompileNamedHostModuleCheckGraphSubsetRebuildTermSubset,
  tryCompileAfterHostModuleCheckGraphSubsetRebuildTermDeps,
  SystemsLean.HostModuleCheckGraphSubsetRebuildTerm,
  ElabMeetNamedWalkHostModuleCheckGraphSubsetRebuildTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckGraphSubsetRebuildTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckGraphSubsetRebuildTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckGraphSubsetRebuildTerm;
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
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCheckersLater
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelMultTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelLinearTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelTypesTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelProgramTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityMultTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityLinearTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityTypesTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityProgramTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitMultScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitLinearScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitTypesScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitProgramScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitGraphScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitComposeScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitErasureScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitExtractScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitBannerScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelSelfApplyTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckProductOutKernelTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckJoinMapTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckSelfHostTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckSurfaceMatrixTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckSpecProofTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckDualResidualTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathMultTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathLinearTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathTypesTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathProgramTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathGraphTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathComposeTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathErasureTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathExtractTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathPlanTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathApplyTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathBodyTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckFirstSurfaceTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckLinearSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckTypesSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckProgramSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckGraphSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckComposeSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckErasureSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckExtractSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckMultSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckMultSubsetRebuildTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckLinearSubsetRebuildTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckTypesSubsetRebuildTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckProgramSubsetRebuildTerm

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckGraphSubsetRebuildTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckGraphSubsetRebuildTermPath. -/
def findLiveHostModuleCheckGraphSubsetRebuildTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckGraphSubsetRebuildTerm"

/-- Named HostModuleCheckGraphSubsetRebuildTerm subset of the live SystemsLean library.
    Membership is the prior ProgramSubsetRebuildTerm closed set plus
    HostModuleCheckGraphSubsetRebuildTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckGraphSubsetRebuildTermSubsetNames.
    SystemsLean.HostModuleCheckGraphSubsetRebuildTerm. -/
def namedClosedHostModuleCheckGraphSubsetRebuildTermSubsetNames : List String :=
  namedClosedHostModuleCheckProgramSubsetRebuildTermSubsetNames ++
    ["SystemsLean.HostModuleCheckGraphSubsetRebuildTerm"]

/-- Compile order honors imports: ProgramSubsetRebuildTerm compile order, then
    HostModuleCheckGraphSubsetRebuildTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm / EmitGraphScaffoldTerm /
    EmitComposeScaffoldTerm / EmitErasureScaffoldTerm /
    EmitExtractScaffoldTerm / EmitBannerScaffoldTerm /
    KernelSelfApplyTerm / ProductOutKernelTerm / CompilePathTerm /
    JoinMapTerm / SelfHostTerm / SurfaceMatrixTerm / SpecProofTerm /
    DualResidualTerm / CompilePathMultTerm / CompilePathLinearTerm /
    CompilePathTypesTerm / CompilePathProgramTerm / CompilePathGraphTerm /
    CompilePathComposeTerm / CompilePathErasureTerm /
    CompilePathExtractTerm / CompilePathPlanTerm /
    CompilePathApplyTerm / CompilePathBodyTerm /
    FirstSurfaceTerm / LinearSubsetEmitTerm / TypesSubsetEmitTerm /
    ProgramSubsetEmitTerm / GraphSubsetEmitTerm /
    ComposeSubsetEmitTerm / ErasureSubsetEmitTerm /
    ExtractSubsetEmitTerm / MultSubsetEmitTerm /
    MultSubsetRebuildTerm / LinearSubsetRebuildTerm /
    TypesSubsetRebuildTerm / ProgramSubsetRebuildTerm order), not a named
    plus-one. RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater
    are already named members of the closed set.
    Greppable: namedClosedHostModuleCheckGraphSubsetRebuildTermCompileOrder. -/
def namedClosedHostModuleCheckGraphSubsetRebuildTermCompileOrder : List String :=
  namedClosedHostModuleCheckProgramSubsetRebuildTermCompileOrder ++
    ["SystemsLean.HostModuleCheckGraphSubsetRebuildTerm"]

/-- True when the barrel lists each HostModuleCheckGraphSubsetRebuildTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckGraphSubsetRebuildTermSubset. -/
def barrelListsNamedHostModuleCheckGraphSubsetRebuildTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckGraphSubsetRebuildTermSubsetNames

/-- Compile the named HostModuleCheckGraphSubsetRebuildTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the ProgramSubsetRebuildTerm
    compile order, then HostModuleCheckGraphSubsetRebuildTerm last.
    Greppable: tryCompileNamedHostModuleCheckGraphSubsetRebuildTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckGraphSubsetRebuildTerm. -/
unsafe def tryCompileNamedHostModuleCheckGraphSubsetRebuildTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckGraphSubsetRebuildTermSubsetNames
    namedClosedHostModuleCheckGraphSubsetRebuildTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckGraphSubsetRebuildTermSubsetIO]
opaque tryCompileNamedHostModuleCheckGraphSubsetRebuildTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckGraphSubsetRebuildTerm subset.
    Greppable: tryCompileNamedHostModuleCheckGraphSubsetRebuildTermSubset. -/
def tryCompileNamedHostModuleCheckGraphSubsetRebuildTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckGraphSubsetRebuildTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the ProgramSubsetRebuildTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckGraphSubsetRebuildTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater
    are already named members. IrGraph and HostCompose are compile
    dependencies only. Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckGraphSubsetRebuildTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckGraphSubsetRebuildTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckProgramSubsetRebuildTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckGraphSubsetRebuildTermDepsIO]
opaque tryCompileAfterHostModuleCheckGraphSubsetRebuildTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckGraphSubsetRebuildTerm deps.
    Greppable: tryCompileAfterHostModuleCheckGraphSubsetRebuildTermDeps. -/
def tryCompileAfterHostModuleCheckGraphSubsetRebuildTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckGraphSubsetRebuildTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
