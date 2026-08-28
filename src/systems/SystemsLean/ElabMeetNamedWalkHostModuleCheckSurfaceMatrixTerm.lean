/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckSurfaceMatrixTerm named-walk
  wrappers (CheckersLater-role walk; SelfHostTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, EmitMultScaffoldTerm
  walk, EmitLinearScaffoldTerm walk, EmitTypesScaffoldTerm walk,
  EmitProgramScaffoldTerm walk, EmitGraphScaffoldTerm walk,
  EmitComposeScaffoldTerm walk, EmitErasureScaffoldTerm walk,
  EmitExtractScaffoldTerm walk, EmitBannerScaffoldTerm walk,
  KernelSelfApplyTerm walk, ProductOutKernelTerm walk,
  CompilePathTerm walk, JoinMapTerm walk, and SelfHostTerm walk stay
  as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior SelfHostTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckSelfHostTerm. Do not grow that walk.
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
  or SelfHostTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckSurfaceMatrixTerm.lean.
  Do not skip to HostModuleCheckSpecProofTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckSurfaceMatrixTerm wrappers live here:
    findLiveHostModuleCheckSurfaceMatrixTermPath,
    namedClosedHostModuleCheckSurfaceMatrixTermSubsetNames,
    namedClosedHostModuleCheckSurfaceMatrixTermCompileOrder,
    barrelListsNamedHostModuleCheckSurfaceMatrixTermSubset,
    tryCompileNamedHostModuleCheckSurfaceMatrixTermSubset,
    tryCompileAfterHostModuleCheckSurfaceMatrixTermDeps.
    Named membership is the prior SelfHostTerm closed set plus
    HostModuleCheckSurfaceMatrixTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Compile order is the SelfHostTerm compile
    order, then HostModuleCheckSurfaceMatrixTerm last. EmitPlanTerm
    is a compile dependency only (already on the KernelEmitTerm /
    ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm / EmitGraphScaffoldTerm /
    EmitComposeScaffoldTerm / EmitErasureScaffoldTerm /
    EmitExtractScaffoldTerm / EmitBannerScaffoldTerm /
    KernelSelfApplyTerm / ProductOutKernelTerm / CompilePathTerm /
    JoinMapTerm / SelfHostTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the SelfHostTerm compile order.
    HostModuleCheckSurfaceMatrixTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckSelfHostTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckSurfaceMatrixTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckSurfaceMatrixTermPath,
  namedClosedHostModuleCheckSurfaceMatrixTermSubsetNames,
  namedClosedHostModuleCheckSurfaceMatrixTermCompileOrder,
  barrelListsNamedHostModuleCheckSurfaceMatrixTermSubset,
  tryCompileNamedHostModuleCheckSurfaceMatrixTermSubset,
  tryCompileAfterHostModuleCheckSurfaceMatrixTermDeps,
  SystemsLean.HostModuleCheckSurfaceMatrixTerm,
  ElabMeetNamedWalkHostModuleCheckSurfaceMatrixTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckSurfaceMatrixTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckSurfaceMatrixTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckSurfaceMatrixTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckSurfaceMatrixTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckSurfaceMatrixTermPath. -/
def findLiveHostModuleCheckSurfaceMatrixTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckSurfaceMatrixTerm"

/-- Named HostModuleCheckSurfaceMatrixTerm subset of the live SystemsLean library.
    Membership is the prior SelfHostTerm closed set plus
    HostModuleCheckSurfaceMatrixTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckSurfaceMatrixTermSubsetNames.
    SystemsLean.HostModuleCheckSurfaceMatrixTerm. -/
def namedClosedHostModuleCheckSurfaceMatrixTermSubsetNames : List String :=
  namedClosedHostModuleCheckSelfHostTermSubsetNames ++
    ["SystemsLean.HostModuleCheckSurfaceMatrixTerm"]

/-- Compile order honors imports: SelfHostTerm compile order, then
    HostModuleCheckSurfaceMatrixTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm / EmitGraphScaffoldTerm /
    EmitComposeScaffoldTerm / EmitErasureScaffoldTerm /
    EmitExtractScaffoldTerm / EmitBannerScaffoldTerm /
    KernelSelfApplyTerm / ProductOutKernelTerm / CompilePathTerm /
    JoinMapTerm / SelfHostTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckSurfaceMatrixTermCompileOrder. -/
def namedClosedHostModuleCheckSurfaceMatrixTermCompileOrder : List String :=
  namedClosedHostModuleCheckSelfHostTermCompileOrder ++
    ["SystemsLean.HostModuleCheckSurfaceMatrixTerm"]

/-- True when the barrel lists each HostModuleCheckSurfaceMatrixTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckSurfaceMatrixTermSubset. -/
def barrelListsNamedHostModuleCheckSurfaceMatrixTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckSurfaceMatrixTermSubsetNames

/-- Compile the named HostModuleCheckSurfaceMatrixTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the SelfHostTerm
    compile order, then HostModuleCheckSurfaceMatrixTerm last.
    Greppable: tryCompileNamedHostModuleCheckSurfaceMatrixTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckSurfaceMatrixTerm. -/
unsafe def tryCompileNamedHostModuleCheckSurfaceMatrixTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckSurfaceMatrixTermSubsetNames
    namedClosedHostModuleCheckSurfaceMatrixTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckSurfaceMatrixTermSubsetIO]
opaque tryCompileNamedHostModuleCheckSurfaceMatrixTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckSurfaceMatrixTerm subset.
    Greppable: tryCompileNamedHostModuleCheckSurfaceMatrixTermSubset. -/
def tryCompileNamedHostModuleCheckSurfaceMatrixTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckSurfaceMatrixTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the SelfHostTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckSurfaceMatrixTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckSurfaceMatrixTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckSurfaceMatrixTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckSelfHostTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckSurfaceMatrixTermDepsIO]
opaque tryCompileAfterHostModuleCheckSurfaceMatrixTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckSurfaceMatrixTerm deps.
    Greppable: tryCompileAfterHostModuleCheckSurfaceMatrixTermDeps. -/
def tryCompileAfterHostModuleCheckSurfaceMatrixTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckSurfaceMatrixTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
