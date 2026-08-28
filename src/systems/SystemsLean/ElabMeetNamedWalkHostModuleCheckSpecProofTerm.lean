/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckSpecProofTerm named-walk
  wrappers (CheckersLater-role walk; SurfaceMatrixTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, EmitMultScaffoldTerm
  walk, EmitLinearScaffoldTerm walk, EmitTypesScaffoldTerm walk,
  EmitProgramScaffoldTerm walk, EmitGraphScaffoldTerm walk,
  EmitComposeScaffoldTerm walk, EmitErasureScaffoldTerm walk,
  EmitExtractScaffoldTerm walk, EmitBannerScaffoldTerm walk,
  KernelSelfApplyTerm walk, ProductOutKernelTerm walk,
  CompilePathTerm walk, JoinMapTerm walk, SelfHostTerm walk, and
  SurfaceMatrixTerm walk stay as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior SurfaceMatrixTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckSurfaceMatrixTerm. Do not grow that walk.
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
  SelfHostTermProbe, or SurfaceMatrixTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckSpecProofTerm.lean.
  Do not skip to HostModuleCheckDualResidualTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckSpecProofTerm wrappers live here:
    findLiveHostModuleCheckSpecProofTermPath,
    namedClosedHostModuleCheckSpecProofTermSubsetNames,
    namedClosedHostModuleCheckSpecProofTermCompileOrder,
    barrelListsNamedHostModuleCheckSpecProofTermSubset,
    tryCompileNamedHostModuleCheckSpecProofTermSubset,
    tryCompileAfterHostModuleCheckSpecProofTermDeps.
    Named membership is the prior SurfaceMatrixTerm closed set plus
    HostModuleCheckSpecProofTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Compile order is the SurfaceMatrixTerm compile
    order, then HostModuleCheckSpecProofTerm last. EmitPlanTerm
    is a compile dependency only (already on the KernelEmitTerm /
    ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm / EmitGraphScaffoldTerm /
    EmitComposeScaffoldTerm / EmitErasureScaffoldTerm /
    EmitExtractScaffoldTerm / EmitBannerScaffoldTerm /
    KernelSelfApplyTerm / ProductOutKernelTerm / CompilePathTerm /
    JoinMapTerm / SelfHostTerm / SurfaceMatrixTerm order), not a
    named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the SurfaceMatrixTerm compile order.
    HostModuleCheckSpecProofTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckSurfaceMatrixTerm; EmitPlanTerm is compile-dep only).
    RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater are already
    named members of the closed set, not extra plus-ones.
    Do not plant live HostModuleCheckSpecProofTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckSpecProofTermPath,
  namedClosedHostModuleCheckSpecProofTermSubsetNames,
  namedClosedHostModuleCheckSpecProofTermCompileOrder,
  barrelListsNamedHostModuleCheckSpecProofTermSubset,
  tryCompileNamedHostModuleCheckSpecProofTermSubset,
  tryCompileAfterHostModuleCheckSpecProofTermDeps,
  SystemsLean.HostModuleCheckSpecProofTerm,
  ElabMeetNamedWalkHostModuleCheckSpecProofTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckSpecProofTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckSpecProofTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckSpecProofTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckSpecProofTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckSpecProofTermPath. -/
def findLiveHostModuleCheckSpecProofTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckSpecProofTerm"

/-- Named HostModuleCheckSpecProofTerm subset of the live SystemsLean library.
    Membership is the prior SurfaceMatrixTerm closed set plus
    HostModuleCheckSpecProofTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckSpecProofTermSubsetNames.
    SystemsLean.HostModuleCheckSpecProofTerm. -/
def namedClosedHostModuleCheckSpecProofTermSubsetNames : List String :=
  namedClosedHostModuleCheckSurfaceMatrixTermSubsetNames ++
    ["SystemsLean.HostModuleCheckSpecProofTerm"]

/-- Compile order honors imports: SurfaceMatrixTerm compile order, then
    HostModuleCheckSpecProofTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm / EmitGraphScaffoldTerm /
    EmitComposeScaffoldTerm / EmitErasureScaffoldTerm /
    EmitExtractScaffoldTerm / EmitBannerScaffoldTerm /
    KernelSelfApplyTerm / ProductOutKernelTerm / CompilePathTerm /
    JoinMapTerm / SelfHostTerm / SurfaceMatrixTerm order), not a named
    plus-one. RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater
    are already named members of the closed set.
    Greppable: namedClosedHostModuleCheckSpecProofTermCompileOrder. -/
def namedClosedHostModuleCheckSpecProofTermCompileOrder : List String :=
  namedClosedHostModuleCheckSurfaceMatrixTermCompileOrder ++
    ["SystemsLean.HostModuleCheckSpecProofTerm"]

/-- True when the barrel lists each HostModuleCheckSpecProofTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckSpecProofTermSubset. -/
def barrelListsNamedHostModuleCheckSpecProofTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckSpecProofTermSubsetNames

/-- Compile the named HostModuleCheckSpecProofTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the SurfaceMatrixTerm
    compile order, then HostModuleCheckSpecProofTerm last.
    Greppable: tryCompileNamedHostModuleCheckSpecProofTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckSpecProofTerm. -/
unsafe def tryCompileNamedHostModuleCheckSpecProofTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckSpecProofTermSubsetNames
    namedClosedHostModuleCheckSpecProofTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckSpecProofTermSubsetIO]
opaque tryCompileNamedHostModuleCheckSpecProofTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckSpecProofTerm subset.
    Greppable: tryCompileNamedHostModuleCheckSpecProofTermSubset. -/
def tryCompileNamedHostModuleCheckSpecProofTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckSpecProofTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the SurfaceMatrixTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckSpecProofTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. RequiredDecls / RequiredDeclsProduct / RequiredDeclsLater
    are already named members. IrGraph and HostCompose are compile
    dependencies only. Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckSpecProofTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckSpecProofTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckSurfaceMatrixTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckSpecProofTermDepsIO]
opaque tryCompileAfterHostModuleCheckSpecProofTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckSpecProofTerm deps.
    Greppable: tryCompileAfterHostModuleCheckSpecProofTermDeps. -/
def tryCompileAfterHostModuleCheckSpecProofTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckSpecProofTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
