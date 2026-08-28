/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckCompilePathErasureTerm named-walk
  wrappers (CheckersLater-role walk; CompilePathComposeTerm walk is the prior
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
  CompilePathGraphTerm walk, and CompilePathComposeTerm walk stay
  as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior CompilePathComposeTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckCompilePathComposeTerm. Do not grow that walk.
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
  CompilePathProgramTermProbe, CompilePathGraphTermProbe, or
  CompilePathComposeTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckCompilePathErasureTerm.lean.
  Do not skip to HostModuleCheckCompilePathExtractTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckCompilePathErasureTerm wrappers live here:
    findLiveHostModuleCheckCompilePathErasureTermPath,
    namedClosedHostModuleCheckCompilePathErasureTermSubsetNames,
    namedClosedHostModuleCheckCompilePathErasureTermCompileOrder,
    barrelListsNamedHostModuleCheckCompilePathErasureTermSubset,
    tryCompileNamedHostModuleCheckCompilePathErasureTermSubset,
    tryCompileAfterHostModuleCheckCompilePathErasureTermDeps.
    Named membership is the prior CompilePathComposeTerm closed set plus
    HostModuleCheckCompilePathErasureTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Compile order is the CompilePathComposeTerm compile
    order, then HostModuleCheckCompilePathErasureTerm last. EmitPlanTerm
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
    CompilePathComposeTerm
    order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the CompilePathComposeTerm compile order.
    HostModuleCheckCompilePathErasureTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckCompilePathComposeTerm; EmitPlanTerm is compile-dep only).
    RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
    named members of the closed set, not extra plus-ones.
    Do not plant live HostModuleCheckCompilePathErasureTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckCompilePathErasureTermPath,
  namedClosedHostModuleCheckCompilePathErasureTermSubsetNames,
  namedClosedHostModuleCheckCompilePathErasureTermCompileOrder,
  barrelListsNamedHostModuleCheckCompilePathErasureTermSubset,
  tryCompileNamedHostModuleCheckCompilePathErasureTermSubset,
  tryCompileAfterHostModuleCheckCompilePathErasureTermDeps,
  SystemsLean.HostModuleCheckCompilePathErasureTerm,
  ElabMeetNamedWalkHostModuleCheckCompilePathErasureTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathErasureTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathErasureTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathErasureTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckCompilePathErasureTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckCompilePathErasureTermPath. -/
def findLiveHostModuleCheckCompilePathErasureTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckCompilePathErasureTerm"

/-- Named HostModuleCheckCompilePathErasureTerm subset of the live SystemsLean library.
    Membership is the prior CompilePathComposeTerm closed set plus
    HostModuleCheckCompilePathErasureTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckCompilePathErasureTermSubsetNames.
    SystemsLean.HostModuleCheckCompilePathErasureTerm. -/
def namedClosedHostModuleCheckCompilePathErasureTermSubsetNames : List String :=
  namedClosedHostModuleCheckCompilePathComposeTermSubsetNames ++
    ["SystemsLean.HostModuleCheckCompilePathErasureTerm"]

/-- Compile order honors imports: CompilePathComposeTerm compile order, then
    HostModuleCheckCompilePathErasureTerm last. IrGraph and HostCompose are
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
    CompilePathComposeTerm
    order), not a named plus-one. RequiredDecls / RequiredDeclsProduct /
    RequiredDeclsLater are already named members of the closed set.
    Greppable: namedClosedHostModuleCheckCompilePathErasureTermCompileOrder. -/
def namedClosedHostModuleCheckCompilePathErasureTermCompileOrder : List String :=
  namedClosedHostModuleCheckCompilePathComposeTermCompileOrder ++
    ["SystemsLean.HostModuleCheckCompilePathErasureTerm"]

/-- True when the barrel lists each HostModuleCheckCompilePathErasureTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckCompilePathErasureTermSubset. -/
def barrelListsNamedHostModuleCheckCompilePathErasureTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckCompilePathErasureTermSubsetNames

/-- Compile the named HostModuleCheckCompilePathErasureTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the CompilePathComposeTerm
    compile order, then HostModuleCheckCompilePathErasureTerm last.
    Greppable: tryCompileNamedHostModuleCheckCompilePathErasureTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckCompilePathErasureTerm. -/
unsafe def tryCompileNamedHostModuleCheckCompilePathErasureTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckCompilePathErasureTermSubsetNames
    namedClosedHostModuleCheckCompilePathErasureTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckCompilePathErasureTermSubsetIO]
opaque tryCompileNamedHostModuleCheckCompilePathErasureTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckCompilePathErasureTerm subset.
    Greppable: tryCompileNamedHostModuleCheckCompilePathErasureTermSubset. -/
def tryCompileNamedHostModuleCheckCompilePathErasureTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckCompilePathErasureTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the CompilePathComposeTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckCompilePathErasureTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater
    are already named members. IrGraph and HostCompose are compile
    dependencies only. Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckCompilePathErasureTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckCompilePathErasureTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckCompilePathComposeTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckCompilePathErasureTermDepsIO]
opaque tryCompileAfterHostModuleCheckCompilePathErasureTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckCompilePathErasureTerm deps.
    Greppable: tryCompileAfterHostModuleCheckCompilePathErasureTermDeps. -/
def tryCompileAfterHostModuleCheckCompilePathErasureTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckCompilePathErasureTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
