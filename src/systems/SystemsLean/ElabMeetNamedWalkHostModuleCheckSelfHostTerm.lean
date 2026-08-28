/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckSelfHostTerm named-walk
  wrappers (CheckersLater-role walk; JoinMapTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, EmitMultScaffoldTerm
  walk, EmitLinearScaffoldTerm walk, EmitTypesScaffoldTerm walk,
  EmitProgramScaffoldTerm walk, EmitGraphScaffoldTerm walk,
  EmitComposeScaffoldTerm walk, EmitErasureScaffoldTerm walk,
  EmitExtractScaffoldTerm walk, EmitBannerScaffoldTerm walk,
  KernelSelfApplyTerm walk, ProductOutKernelTerm walk,
  CompilePathTerm walk, and JoinMapTerm walk stay as compile deps.
  Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior JoinMapTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckJoinMapTerm. Do not grow that walk.
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
  ProductOutKernelTermProbe, CompilePathTermProbe, or JoinMapTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckSelfHostTerm.lean.
  Do not skip to HostModuleCheckSurfaceMatrixTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckSelfHostTerm wrappers live here:
    findLiveHostModuleCheckSelfHostTermPath,
    namedClosedHostModuleCheckSelfHostTermSubsetNames,
    namedClosedHostModuleCheckSelfHostTermCompileOrder,
    barrelListsNamedHostModuleCheckSelfHostTermSubset,
    tryCompileNamedHostModuleCheckSelfHostTermSubset,
    tryCompileAfterHostModuleCheckSelfHostTermDeps.
    Named membership is the prior JoinMapTerm closed set plus
    HostModuleCheckSelfHostTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Do not open HostImportGraph as a plus-one.
    Compile order is the JoinMapTerm compile order, then
    HostModuleCheckSelfHostTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm / ParityTypesTerm / ParityProgramTerm /
    ParityEmitTerm / EmitMultScaffoldTerm / EmitLinearScaffoldTerm /
    EmitTypesScaffoldTerm / EmitProgramScaffoldTerm /
    EmitGraphScaffoldTerm / EmitComposeScaffoldTerm /
    EmitErasureScaffoldTerm / EmitExtractScaffoldTerm /
    EmitBannerScaffoldTerm / KernelSelfApplyTerm /
    ProductOutKernelTerm / CompilePathTerm / JoinMapTerm
    order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the JoinMapTerm compile order.
    HostModuleCheckSelfHostTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckJoinMapTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckSelfHostTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckSelfHostTermPath,
  namedClosedHostModuleCheckSelfHostTermSubsetNames,
  namedClosedHostModuleCheckSelfHostTermCompileOrder,
  barrelListsNamedHostModuleCheckSelfHostTermSubset,
  tryCompileNamedHostModuleCheckSelfHostTermSubset,
  tryCompileAfterHostModuleCheckSelfHostTermDeps,
  SystemsLean.HostModuleCheckSelfHostTerm,
  ElabMeetNamedWalkHostModuleCheckSelfHostTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckSelfHostTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckSelfHostTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckSelfHostTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckSelfHostTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckSelfHostTermPath. -/
def findLiveHostModuleCheckSelfHostTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckSelfHostTerm"

/-- Named HostModuleCheckSelfHostTerm subset of the live SystemsLean library.
    Membership is the prior JoinMapTerm closed set plus
    HostModuleCheckSelfHostTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckSelfHostTermSubsetNames.
    SystemsLean.HostModuleCheckSelfHostTerm. -/
def namedClosedHostModuleCheckSelfHostTermSubsetNames : List String :=
  namedClosedHostModuleCheckJoinMapTermSubsetNames ++
    ["SystemsLean.HostModuleCheckSelfHostTerm"]

/-- Compile order honors imports: JoinMapTerm compile order, then
    HostModuleCheckSelfHostTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm / EmitGraphScaffoldTerm /
    EmitComposeScaffoldTerm / EmitErasureScaffoldTerm /
    EmitExtractScaffoldTerm / EmitBannerScaffoldTerm /
    KernelSelfApplyTerm / ProductOutKernelTerm / CompilePathTerm /
    JoinMapTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckSelfHostTermCompileOrder. -/
def namedClosedHostModuleCheckSelfHostTermCompileOrder : List String :=
  namedClosedHostModuleCheckJoinMapTermCompileOrder ++
    ["SystemsLean.HostModuleCheckSelfHostTerm"]

/-- True when the barrel lists each HostModuleCheckSelfHostTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckSelfHostTermSubset. -/
def barrelListsNamedHostModuleCheckSelfHostTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckSelfHostTermSubsetNames

/-- Compile the named HostModuleCheckSelfHostTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the JoinMapTerm
    compile order, then HostModuleCheckSelfHostTerm last.
    Greppable: tryCompileNamedHostModuleCheckSelfHostTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckSelfHostTerm. -/
unsafe def tryCompileNamedHostModuleCheckSelfHostTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckSelfHostTermSubsetNames
    namedClosedHostModuleCheckSelfHostTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckSelfHostTermSubsetIO]
opaque tryCompileNamedHostModuleCheckSelfHostTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckSelfHostTerm subset.
    Greppable: tryCompileNamedHostModuleCheckSelfHostTermSubset. -/
def tryCompileNamedHostModuleCheckSelfHostTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckSelfHostTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the JoinMapTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckSelfHostTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckSelfHostTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckSelfHostTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckJoinMapTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckSelfHostTermDepsIO]
opaque tryCompileAfterHostModuleCheckSelfHostTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckSelfHostTerm deps.
    Greppable: tryCompileAfterHostModuleCheckSelfHostTermDeps. -/
def tryCompileAfterHostModuleCheckSelfHostTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckSelfHostTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
