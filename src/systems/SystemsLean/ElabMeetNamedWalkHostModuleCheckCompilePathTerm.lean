/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckCompilePathTerm named-walk
  wrappers (CheckersLater-role walk; ProductOutKernelTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, EmitMultScaffoldTerm
  walk, EmitLinearScaffoldTerm walk, EmitTypesScaffoldTerm walk,
  EmitProgramScaffoldTerm walk, EmitGraphScaffoldTerm walk,
  EmitComposeScaffoldTerm walk, EmitErasureScaffoldTerm walk,
  EmitExtractScaffoldTerm walk, EmitBannerScaffoldTerm walk,
  KernelSelfApplyTerm walk, and ProductOutKernelTerm walk stay as compile
  deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior ProductOutKernelTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckProductOutKernelTerm. Do not grow that walk.
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
  EmitBannerScaffoldTermProbe, KernelSelfApplyTermProbe, or
  ProductOutKernelTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckCompilePathTerm.lean.
  Do not skip to HostModuleCheckJoinMapTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckCompilePathTerm wrappers live here:
    findLiveHostModuleCheckCompilePathTermPath,
    namedClosedHostModuleCheckCompilePathTermSubsetNames,
    namedClosedHostModuleCheckCompilePathTermCompileOrder,
    barrelListsNamedHostModuleCheckCompilePathTermSubset,
    tryCompileNamedHostModuleCheckCompilePathTermSubset,
    tryCompileAfterHostModuleCheckCompilePathTermDeps.
    Named membership is the prior ProductOutKernelTerm closed set plus
    HostModuleCheckCompilePathTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Do not open HostImportGraph as a plus-one.
    Compile order is the ProductOutKernelTerm compile order, then
    HostModuleCheckCompilePathTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm / ParityTypesTerm / ParityProgramTerm /
    ParityEmitTerm / EmitMultScaffoldTerm / EmitLinearScaffoldTerm /
    EmitTypesScaffoldTerm / EmitProgramScaffoldTerm /
    EmitGraphScaffoldTerm / EmitComposeScaffoldTerm /
    EmitErasureScaffoldTerm / EmitExtractScaffoldTerm /
    EmitBannerScaffoldTerm / KernelSelfApplyTerm /
    ProductOutKernelTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the ProductOutKernelTerm compile order.
    HostModuleCheckCompilePathTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckProductOutKernelTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckCompilePathTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckCompilePathTermPath,
  namedClosedHostModuleCheckCompilePathTermSubsetNames,
  namedClosedHostModuleCheckCompilePathTermCompileOrder,
  barrelListsNamedHostModuleCheckCompilePathTermSubset,
  tryCompileNamedHostModuleCheckCompilePathTermSubset,
  tryCompileAfterHostModuleCheckCompilePathTermDeps,
  SystemsLean.HostModuleCheckCompilePathTerm,
  ElabMeetNamedWalkHostModuleCheckCompilePathTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckCompilePathTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckCompilePathTermPath. -/
def findLiveHostModuleCheckCompilePathTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckCompilePathTerm"

/-- Named HostModuleCheckCompilePathTerm subset of the live SystemsLean library.
    Membership is the prior ProductOutKernelTerm closed set plus
    HostModuleCheckCompilePathTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckCompilePathTermSubsetNames.
    SystemsLean.HostModuleCheckCompilePathTerm. -/
def namedClosedHostModuleCheckCompilePathTermSubsetNames : List String :=
  namedClosedHostModuleCheckProductOutKernelTermSubsetNames ++
    ["SystemsLean.HostModuleCheckCompilePathTerm"]

/-- Compile order honors imports: ProductOutKernelTerm compile order, then
    HostModuleCheckCompilePathTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm / EmitGraphScaffoldTerm /
    EmitComposeScaffoldTerm / EmitErasureScaffoldTerm /
    EmitExtractScaffoldTerm / EmitBannerScaffoldTerm /
    KernelSelfApplyTerm / ProductOutKernelTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckCompilePathTermCompileOrder. -/
def namedClosedHostModuleCheckCompilePathTermCompileOrder : List String :=
  namedClosedHostModuleCheckProductOutKernelTermCompileOrder ++
    ["SystemsLean.HostModuleCheckCompilePathTerm"]

/-- True when the barrel lists each HostModuleCheckCompilePathTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckCompilePathTermSubset. -/
def barrelListsNamedHostModuleCheckCompilePathTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckCompilePathTermSubsetNames

/-- Compile the named HostModuleCheckCompilePathTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the ProductOutKernelTerm
    compile order, then HostModuleCheckCompilePathTerm last.
    Greppable: tryCompileNamedHostModuleCheckCompilePathTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckCompilePathTerm. -/
unsafe def tryCompileNamedHostModuleCheckCompilePathTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckCompilePathTermSubsetNames
    namedClosedHostModuleCheckCompilePathTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckCompilePathTermSubsetIO]
opaque tryCompileNamedHostModuleCheckCompilePathTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckCompilePathTerm subset.
    Greppable: tryCompileNamedHostModuleCheckCompilePathTermSubset. -/
def tryCompileNamedHostModuleCheckCompilePathTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckCompilePathTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the ProductOutKernelTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckCompilePathTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckCompilePathTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckCompilePathTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckProductOutKernelTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckCompilePathTermDepsIO]
opaque tryCompileAfterHostModuleCheckCompilePathTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckCompilePathTerm deps.
    Greppable: tryCompileAfterHostModuleCheckCompilePathTermDeps. -/
def tryCompileAfterHostModuleCheckCompilePathTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckCompilePathTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
