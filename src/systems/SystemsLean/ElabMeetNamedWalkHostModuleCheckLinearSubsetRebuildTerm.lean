/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckLinearSubsetRebuildTerm named-walk
  wrappers (CheckersLater-role walk; MultSubsetRebuildTerm walk is the prior
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
  ExtractSubsetEmitTerm walk, MultSubsetEmitTerm walk, and
  MultSubsetRebuildTerm walk stay as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior MultSubsetRebuildTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckMultSubsetRebuildTerm. Do not grow that walk.
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
  MultSubsetEmitTermProbe, or MultSubsetRebuildTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckLinearSubsetRebuildTerm.lean.
  Do not skip to HostModuleCheckTypesSubsetRebuildTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckLinearSubsetRebuildTerm wrappers live here:
    findLiveHostModuleCheckLinearSubsetRebuildTermPath,
    namedClosedHostModuleCheckLinearSubsetRebuildTermSubsetNames,
    namedClosedHostModuleCheckLinearSubsetRebuildTermCompileOrder,
    barrelListsNamedHostModuleCheckLinearSubsetRebuildTermSubset,
    tryCompileNamedHostModuleCheckLinearSubsetRebuildTermSubset,
    tryCompileAfterHostModuleCheckLinearSubsetRebuildTermDeps.
    Named membership is the prior MultSubsetRebuildTerm closed set plus
    HostModuleCheckLinearSubsetRebuildTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Compile order is the MultSubsetRebuildTerm compile
    order, then HostModuleCheckLinearSubsetRebuildTerm last. EmitPlanTerm
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
    MultSubsetRebuildTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the MultSubsetRebuildTerm compile order.
    HostModuleCheckLinearSubsetRebuildTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckMultSubsetRebuildTerm; EmitPlanTerm is compile-dep only).
    RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
    named members of the closed set, not extra plus-ones.
    Do not plant live HostModuleCheckLinearSubsetRebuildTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckLinearSubsetRebuildTermPath,
  namedClosedHostModuleCheckLinearSubsetRebuildTermSubsetNames,
  namedClosedHostModuleCheckLinearSubsetRebuildTermCompileOrder,
  barrelListsNamedHostModuleCheckLinearSubsetRebuildTermSubset,
  tryCompileNamedHostModuleCheckLinearSubsetRebuildTermSubset,
  tryCompileAfterHostModuleCheckLinearSubsetRebuildTermDeps,
  SystemsLean.HostModuleCheckLinearSubsetRebuildTerm,
  ElabMeetNamedWalkHostModuleCheckLinearSubsetRebuildTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckLinearSubsetRebuildTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckLinearSubsetRebuildTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckLinearSubsetRebuildTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckLinearSubsetRebuildTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckLinearSubsetRebuildTermPath. -/
def findLiveHostModuleCheckLinearSubsetRebuildTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckLinearSubsetRebuildTerm"

/-- Named HostModuleCheckLinearSubsetRebuildTerm subset of the live SystemsLean library.
    Membership is the prior MultSubsetRebuildTerm closed set plus
    HostModuleCheckLinearSubsetRebuildTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckLinearSubsetRebuildTermSubsetNames.
    SystemsLean.HostModuleCheckLinearSubsetRebuildTerm. -/
def namedClosedHostModuleCheckLinearSubsetRebuildTermSubsetNames : List String :=
  namedClosedHostModuleCheckMultSubsetRebuildTermSubsetNames ++
    ["SystemsLean.HostModuleCheckLinearSubsetRebuildTerm"]

/-- Compile order honors imports: MultSubsetRebuildTerm compile order, then
    HostModuleCheckLinearSubsetRebuildTerm last. IrGraph and HostCompose are
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
    MultSubsetRebuildTerm order), not a named plus-one. RequiredDecls /
    RequiredDeclsProduct / RequiredDeclsLater are already named members
    of the closed set.
    Greppable: namedClosedHostModuleCheckLinearSubsetRebuildTermCompileOrder. -/
def namedClosedHostModuleCheckLinearSubsetRebuildTermCompileOrder : List String :=
  namedClosedHostModuleCheckMultSubsetRebuildTermCompileOrder ++
    ["SystemsLean.HostModuleCheckLinearSubsetRebuildTerm"]

/-- True when the barrel lists each HostModuleCheckLinearSubsetRebuildTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckLinearSubsetRebuildTermSubset. -/
def barrelListsNamedHostModuleCheckLinearSubsetRebuildTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckLinearSubsetRebuildTermSubsetNames

/-- Compile the named HostModuleCheckLinearSubsetRebuildTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the MultSubsetRebuildTerm
    compile order, then HostModuleCheckLinearSubsetRebuildTerm last.
    Greppable: tryCompileNamedHostModuleCheckLinearSubsetRebuildTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckLinearSubsetRebuildTerm. -/
unsafe def tryCompileNamedHostModuleCheckLinearSubsetRebuildTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckLinearSubsetRebuildTermSubsetNames
    namedClosedHostModuleCheckLinearSubsetRebuildTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckLinearSubsetRebuildTermSubsetIO]
opaque tryCompileNamedHostModuleCheckLinearSubsetRebuildTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckLinearSubsetRebuildTerm subset.
    Greppable: tryCompileNamedHostModuleCheckLinearSubsetRebuildTermSubset. -/
def tryCompileNamedHostModuleCheckLinearSubsetRebuildTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckLinearSubsetRebuildTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the MultSubsetRebuildTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckLinearSubsetRebuildTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater
    are already named members. IrGraph and HostCompose are compile
    dependencies only. Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckLinearSubsetRebuildTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckLinearSubsetRebuildTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckMultSubsetRebuildTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckLinearSubsetRebuildTermDepsIO]
opaque tryCompileAfterHostModuleCheckLinearSubsetRebuildTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckLinearSubsetRebuildTerm deps.
    Greppable: tryCompileAfterHostModuleCheckLinearSubsetRebuildTermDeps. -/
def tryCompileAfterHostModuleCheckLinearSubsetRebuildTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckLinearSubsetRebuildTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
