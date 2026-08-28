/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckErasureSubsetEmitTerm named-walk
  wrappers (CheckersLater-role walk; ComposeSubsetEmitTerm walk is the prior
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
  ProgramSubsetEmitTerm walk, GraphSubsetEmitTerm walk, and
  ComposeSubsetEmitTerm walk stay as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior ComposeSubsetEmitTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckComposeSubsetEmitTerm. Do not grow that walk.
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
  GraphSubsetEmitTermProbe, or ComposeSubsetEmitTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckErasureSubsetEmitTerm.lean.
  Do not skip to HostModuleCheckExtractSubsetEmitTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckErasureSubsetEmitTerm wrappers live here:
    findLiveHostModuleCheckErasureSubsetEmitTermPath,
    namedClosedHostModuleCheckErasureSubsetEmitTermSubsetNames,
    namedClosedHostModuleCheckErasureSubsetEmitTermCompileOrder,
    barrelListsNamedHostModuleCheckErasureSubsetEmitTermSubset,
    tryCompileNamedHostModuleCheckErasureSubsetEmitTermSubset,
    tryCompileAfterHostModuleCheckErasureSubsetEmitTermDeps.
    Named membership is the prior ComposeSubsetEmitTerm closed set plus
    HostModuleCheckErasureSubsetEmitTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Compile order is the ComposeSubsetEmitTerm compile
    order, then HostModuleCheckErasureSubsetEmitTerm last. EmitPlanTerm
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
    ComposeSubsetEmitTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the ComposeSubsetEmitTerm compile order.
    HostModuleCheckErasureSubsetEmitTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckComposeSubsetEmitTerm; EmitPlanTerm is compile-dep only).
    RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
    named members of the closed set, not extra plus-ones.
    Do not plant live HostModuleCheckErasureSubsetEmitTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckErasureSubsetEmitTermPath,
  namedClosedHostModuleCheckErasureSubsetEmitTermSubsetNames,
  namedClosedHostModuleCheckErasureSubsetEmitTermCompileOrder,
  barrelListsNamedHostModuleCheckErasureSubsetEmitTermSubset,
  tryCompileNamedHostModuleCheckErasureSubsetEmitTermSubset,
  tryCompileAfterHostModuleCheckErasureSubsetEmitTermDeps,
  SystemsLean.HostModuleCheckErasureSubsetEmitTerm,
  ElabMeetNamedWalkHostModuleCheckErasureSubsetEmitTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckErasureSubsetEmitTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckErasureSubsetEmitTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckErasureSubsetEmitTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckErasureSubsetEmitTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckErasureSubsetEmitTermPath. -/
def findLiveHostModuleCheckErasureSubsetEmitTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckErasureSubsetEmitTerm"

/-- Named HostModuleCheckErasureSubsetEmitTerm subset of the live SystemsLean library.
    Membership is the prior ComposeSubsetEmitTerm closed set plus
    HostModuleCheckErasureSubsetEmitTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckErasureSubsetEmitTermSubsetNames.
    SystemsLean.HostModuleCheckErasureSubsetEmitTerm. -/
def namedClosedHostModuleCheckErasureSubsetEmitTermSubsetNames : List String :=
  namedClosedHostModuleCheckComposeSubsetEmitTermSubsetNames ++
    ["SystemsLean.HostModuleCheckErasureSubsetEmitTerm"]

/-- Compile order honors imports: ComposeSubsetEmitTerm compile order, then
    HostModuleCheckErasureSubsetEmitTerm last. IrGraph and HostCompose are
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
    ComposeSubsetEmitTerm order), not a named plus-one. RequiredDecls /
    RequiredDeclsProduct / RequiredDeclsLater are already named members
    of the closed set.
    Greppable: namedClosedHostModuleCheckErasureSubsetEmitTermCompileOrder. -/
def namedClosedHostModuleCheckErasureSubsetEmitTermCompileOrder : List String :=
  namedClosedHostModuleCheckComposeSubsetEmitTermCompileOrder ++
    ["SystemsLean.HostModuleCheckErasureSubsetEmitTerm"]

/-- True when the barrel lists each HostModuleCheckErasureSubsetEmitTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckErasureSubsetEmitTermSubset. -/
def barrelListsNamedHostModuleCheckErasureSubsetEmitTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckErasureSubsetEmitTermSubsetNames

/-- Compile the named HostModuleCheckErasureSubsetEmitTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the ComposeSubsetEmitTerm
    compile order, then HostModuleCheckErasureSubsetEmitTerm last.
    Greppable: tryCompileNamedHostModuleCheckErasureSubsetEmitTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckErasureSubsetEmitTerm. -/
unsafe def tryCompileNamedHostModuleCheckErasureSubsetEmitTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckErasureSubsetEmitTermSubsetNames
    namedClosedHostModuleCheckErasureSubsetEmitTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckErasureSubsetEmitTermSubsetIO]
opaque tryCompileNamedHostModuleCheckErasureSubsetEmitTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckErasureSubsetEmitTerm subset.
    Greppable: tryCompileNamedHostModuleCheckErasureSubsetEmitTermSubset. -/
def tryCompileNamedHostModuleCheckErasureSubsetEmitTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckErasureSubsetEmitTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the ComposeSubsetEmitTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckErasureSubsetEmitTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater
    are already named members. IrGraph and HostCompose are compile
    dependencies only. Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckErasureSubsetEmitTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckErasureSubsetEmitTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckComposeSubsetEmitTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckErasureSubsetEmitTermDepsIO]
opaque tryCompileAfterHostModuleCheckErasureSubsetEmitTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckErasureSubsetEmitTerm deps.
    Greppable: tryCompileAfterHostModuleCheckErasureSubsetEmitTermDeps. -/
def tryCompileAfterHostModuleCheckErasureSubsetEmitTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckErasureSubsetEmitTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
