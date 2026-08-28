/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckGraphSubsetEmitTerm named-walk
  wrappers (CheckersLater-role walk; ProgramSubsetEmitTerm walk is the prior
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
  LinearSubsetEmitTerm walk, TypesSubsetEmitTerm walk, and
  ProgramSubsetEmitTerm walk stay as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior ProgramSubsetEmitTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckProgramSubsetEmitTerm. Do not grow that walk.
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
  TypesSubsetEmitTermProbe, or ProgramSubsetEmitTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckGraphSubsetEmitTerm.lean.
  Do not skip to HostModuleCheckComposeSubsetEmitTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckGraphSubsetEmitTerm wrappers live here:
    findLiveHostModuleCheckGraphSubsetEmitTermPath,
    namedClosedHostModuleCheckGraphSubsetEmitTermSubsetNames,
    namedClosedHostModuleCheckGraphSubsetEmitTermCompileOrder,
    barrelListsNamedHostModuleCheckGraphSubsetEmitTermSubset,
    tryCompileNamedHostModuleCheckGraphSubsetEmitTermSubset,
    tryCompileAfterHostModuleCheckGraphSubsetEmitTermDeps.
    Named membership is the prior ProgramSubsetEmitTerm closed set plus
    HostModuleCheckGraphSubsetEmitTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Compile order is the ProgramSubsetEmitTerm compile
    order, then HostModuleCheckGraphSubsetEmitTerm last. EmitPlanTerm
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
    ProgramSubsetEmitTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the ProgramSubsetEmitTerm compile order.
    HostModuleCheckGraphSubsetEmitTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckProgramSubsetEmitTerm; EmitPlanTerm is compile-dep only).
    RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
    named members of the closed set, not extra plus-ones.
    Do not plant live HostModuleCheckGraphSubsetEmitTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckGraphSubsetEmitTermPath,
  namedClosedHostModuleCheckGraphSubsetEmitTermSubsetNames,
  namedClosedHostModuleCheckGraphSubsetEmitTermCompileOrder,
  barrelListsNamedHostModuleCheckGraphSubsetEmitTermSubset,
  tryCompileNamedHostModuleCheckGraphSubsetEmitTermSubset,
  tryCompileAfterHostModuleCheckGraphSubsetEmitTermDeps,
  SystemsLean.HostModuleCheckGraphSubsetEmitTerm,
  ElabMeetNamedWalkHostModuleCheckGraphSubsetEmitTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckGraphSubsetEmitTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckGraphSubsetEmitTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckGraphSubsetEmitTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckGraphSubsetEmitTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckGraphSubsetEmitTermPath. -/
def findLiveHostModuleCheckGraphSubsetEmitTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckGraphSubsetEmitTerm"

/-- Named HostModuleCheckGraphSubsetEmitTerm subset of the live SystemsLean library.
    Membership is the prior ProgramSubsetEmitTerm closed set plus
    HostModuleCheckGraphSubsetEmitTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckGraphSubsetEmitTermSubsetNames.
    SystemsLean.HostModuleCheckGraphSubsetEmitTerm. -/
def namedClosedHostModuleCheckGraphSubsetEmitTermSubsetNames : List String :=
  namedClosedHostModuleCheckProgramSubsetEmitTermSubsetNames ++
    ["SystemsLean.HostModuleCheckGraphSubsetEmitTerm"]

/-- Compile order honors imports: ProgramSubsetEmitTerm compile order, then
    HostModuleCheckGraphSubsetEmitTerm last. IrGraph and HostCompose are
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
    ProgramSubsetEmitTerm order), not a named plus-one. RequiredDecls /
    RequiredDeclsProduct / RequiredDeclsLater are already named members
    of the closed set.
    Greppable: namedClosedHostModuleCheckGraphSubsetEmitTermCompileOrder. -/
def namedClosedHostModuleCheckGraphSubsetEmitTermCompileOrder : List String :=
  namedClosedHostModuleCheckProgramSubsetEmitTermCompileOrder ++
    ["SystemsLean.HostModuleCheckGraphSubsetEmitTerm"]

/-- True when the barrel lists each HostModuleCheckGraphSubsetEmitTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckGraphSubsetEmitTermSubset. -/
def barrelListsNamedHostModuleCheckGraphSubsetEmitTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckGraphSubsetEmitTermSubsetNames

/-- Compile the named HostModuleCheckGraphSubsetEmitTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the ProgramSubsetEmitTerm
    compile order, then HostModuleCheckGraphSubsetEmitTerm last.
    Greppable: tryCompileNamedHostModuleCheckGraphSubsetEmitTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckGraphSubsetEmitTerm. -/
unsafe def tryCompileNamedHostModuleCheckGraphSubsetEmitTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckGraphSubsetEmitTermSubsetNames
    namedClosedHostModuleCheckGraphSubsetEmitTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckGraphSubsetEmitTermSubsetIO]
opaque tryCompileNamedHostModuleCheckGraphSubsetEmitTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckGraphSubsetEmitTerm subset.
    Greppable: tryCompileNamedHostModuleCheckGraphSubsetEmitTermSubset. -/
def tryCompileNamedHostModuleCheckGraphSubsetEmitTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckGraphSubsetEmitTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the ProgramSubsetEmitTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckGraphSubsetEmitTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater
    are already named members. IrGraph and HostCompose are compile
    dependencies only. Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckGraphSubsetEmitTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckGraphSubsetEmitTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckProgramSubsetEmitTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckGraphSubsetEmitTermDepsIO]
opaque tryCompileAfterHostModuleCheckGraphSubsetEmitTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckGraphSubsetEmitTerm deps.
    Greppable: tryCompileAfterHostModuleCheckGraphSubsetEmitTermDeps. -/
def tryCompileAfterHostModuleCheckGraphSubsetEmitTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckGraphSubsetEmitTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
