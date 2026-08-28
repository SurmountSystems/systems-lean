/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckJoinMapTerm named-walk
  wrappers (CheckersLater-role walk; CompilePathTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, EmitMultScaffoldTerm
  walk, EmitLinearScaffoldTerm walk, EmitTypesScaffoldTerm walk,
  EmitProgramScaffoldTerm walk, EmitGraphScaffoldTerm walk,
  EmitComposeScaffoldTerm walk, EmitErasureScaffoldTerm walk,
  EmitExtractScaffoldTerm walk, EmitBannerScaffoldTerm walk,
  KernelSelfApplyTerm walk, ProductOutKernelTerm walk, and
  CompilePathTerm walk stay as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior CompilePathTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckCompilePathTerm. Do not grow that walk.
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
  ProductOutKernelTermProbe, or CompilePathTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckJoinMapTerm.lean.
  Do not skip to HostModuleCheckSelfHostTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckJoinMapTerm wrappers live here:
    findLiveHostModuleCheckJoinMapTermPath,
    namedClosedHostModuleCheckJoinMapTermSubsetNames,
    namedClosedHostModuleCheckJoinMapTermCompileOrder,
    barrelListsNamedHostModuleCheckJoinMapTermSubset,
    tryCompileNamedHostModuleCheckJoinMapTermSubset,
    tryCompileAfterHostModuleCheckJoinMapTermDeps.
    Named membership is the prior CompilePathTerm closed set plus
    HostModuleCheckJoinMapTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Do not open HostImportGraph as a plus-one.
    Compile order is the CompilePathTerm compile order, then
    HostModuleCheckJoinMapTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm / ParityTypesTerm / ParityProgramTerm /
    ParityEmitTerm / EmitMultScaffoldTerm / EmitLinearScaffoldTerm /
    EmitTypesScaffoldTerm / EmitProgramScaffoldTerm /
    EmitGraphScaffoldTerm / EmitComposeScaffoldTerm /
    EmitErasureScaffoldTerm / EmitExtractScaffoldTerm /
    EmitBannerScaffoldTerm / KernelSelfApplyTerm /
    ProductOutKernelTerm / CompilePathTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the CompilePathTerm compile order.
    HostModuleCheckJoinMapTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckCompilePathTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckJoinMapTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckJoinMapTermPath,
  namedClosedHostModuleCheckJoinMapTermSubsetNames,
  namedClosedHostModuleCheckJoinMapTermCompileOrder,
  barrelListsNamedHostModuleCheckJoinMapTermSubset,
  tryCompileNamedHostModuleCheckJoinMapTermSubset,
  tryCompileAfterHostModuleCheckJoinMapTermDeps,
  SystemsLean.HostModuleCheckJoinMapTerm,
  ElabMeetNamedWalkHostModuleCheckJoinMapTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckJoinMapTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckJoinMapTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckJoinMapTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckJoinMapTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckJoinMapTermPath. -/
def findLiveHostModuleCheckJoinMapTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckJoinMapTerm"

/-- Named HostModuleCheckJoinMapTerm subset of the live SystemsLean library.
    Membership is the prior CompilePathTerm closed set plus
    HostModuleCheckJoinMapTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckJoinMapTermSubsetNames.
    SystemsLean.HostModuleCheckJoinMapTerm. -/
def namedClosedHostModuleCheckJoinMapTermSubsetNames : List String :=
  namedClosedHostModuleCheckCompilePathTermSubsetNames ++
    ["SystemsLean.HostModuleCheckJoinMapTerm"]

/-- Compile order honors imports: CompilePathTerm compile order, then
    HostModuleCheckJoinMapTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm / EmitGraphScaffoldTerm /
    EmitComposeScaffoldTerm / EmitErasureScaffoldTerm /
    EmitExtractScaffoldTerm / EmitBannerScaffoldTerm /
    KernelSelfApplyTerm / ProductOutKernelTerm / CompilePathTerm
    order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckJoinMapTermCompileOrder. -/
def namedClosedHostModuleCheckJoinMapTermCompileOrder : List String :=
  namedClosedHostModuleCheckCompilePathTermCompileOrder ++
    ["SystemsLean.HostModuleCheckJoinMapTerm"]

/-- True when the barrel lists each HostModuleCheckJoinMapTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckJoinMapTermSubset. -/
def barrelListsNamedHostModuleCheckJoinMapTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckJoinMapTermSubsetNames

/-- Compile the named HostModuleCheckJoinMapTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the CompilePathTerm
    compile order, then HostModuleCheckJoinMapTerm last.
    Greppable: tryCompileNamedHostModuleCheckJoinMapTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckJoinMapTerm. -/
unsafe def tryCompileNamedHostModuleCheckJoinMapTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckJoinMapTermSubsetNames
    namedClosedHostModuleCheckJoinMapTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckJoinMapTermSubsetIO]
opaque tryCompileNamedHostModuleCheckJoinMapTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckJoinMapTerm subset.
    Greppable: tryCompileNamedHostModuleCheckJoinMapTermSubset. -/
def tryCompileNamedHostModuleCheckJoinMapTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckJoinMapTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the CompilePathTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckJoinMapTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckJoinMapTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckJoinMapTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckCompilePathTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckJoinMapTermDepsIO]
opaque tryCompileAfterHostModuleCheckJoinMapTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckJoinMapTerm deps.
    Greppable: tryCompileAfterHostModuleCheckJoinMapTermDeps. -/
def tryCompileAfterHostModuleCheckJoinMapTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckJoinMapTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
