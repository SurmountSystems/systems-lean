/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckProductOutKernelTerm named-walk
  wrappers (CheckersLater-role walk; KernelSelfApplyTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, EmitMultScaffoldTerm
  walk, EmitLinearScaffoldTerm walk, EmitTypesScaffoldTerm walk,
  EmitProgramScaffoldTerm walk, EmitGraphScaffoldTerm walk,
  EmitComposeScaffoldTerm walk, EmitErasureScaffoldTerm walk,
  EmitExtractScaffoldTerm walk, EmitBannerScaffoldTerm walk,
  and KernelSelfApplyTerm walk stay as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior KernelSelfApplyTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckKernelSelfApplyTerm. Do not grow that walk.
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
  EmitBannerScaffoldTermProbe, or KernelSelfApplyTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckProductOutKernelTerm.lean.
  Do not skip to HostModuleCheckCompilePathTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckProductOutKernelTerm wrappers live here:
    findLiveHostModuleCheckProductOutKernelTermPath,
    namedClosedHostModuleCheckProductOutKernelTermSubsetNames,
    namedClosedHostModuleCheckProductOutKernelTermCompileOrder,
    barrelListsNamedHostModuleCheckProductOutKernelTermSubset,
    tryCompileNamedHostModuleCheckProductOutKernelTermSubset,
    tryCompileAfterHostModuleCheckProductOutKernelTermDeps.
    Named membership is the prior KernelSelfApplyTerm closed set plus
    HostModuleCheckProductOutKernelTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Do not open HostImportGraph as a plus-one.
    Compile order is the KernelSelfApplyTerm compile order, then
    HostModuleCheckProductOutKernelTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm / ParityTypesTerm / ParityProgramTerm /
    ParityEmitTerm / EmitMultScaffoldTerm / EmitLinearScaffoldTerm /
    EmitTypesScaffoldTerm / EmitProgramScaffoldTerm /
    EmitGraphScaffoldTerm / EmitComposeScaffoldTerm /
    EmitErasureScaffoldTerm / EmitExtractScaffoldTerm /
    EmitBannerScaffoldTerm / KernelSelfApplyTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the KernelSelfApplyTerm compile order.
    HostModuleCheckProductOutKernelTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckKernelSelfApplyTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckProductOutKernelTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckProductOutKernelTermPath,
  namedClosedHostModuleCheckProductOutKernelTermSubsetNames,
  namedClosedHostModuleCheckProductOutKernelTermCompileOrder,
  barrelListsNamedHostModuleCheckProductOutKernelTermSubset,
  tryCompileNamedHostModuleCheckProductOutKernelTermSubset,
  tryCompileAfterHostModuleCheckProductOutKernelTermDeps,
  SystemsLean.HostModuleCheckProductOutKernelTerm,
  ElabMeetNamedWalkHostModuleCheckProductOutKernelTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckProductOutKernelTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckProductOutKernelTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckProductOutKernelTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckProductOutKernelTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckProductOutKernelTermPath. -/
def findLiveHostModuleCheckProductOutKernelTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckProductOutKernelTerm"

/-- Named HostModuleCheckProductOutKernelTerm subset of the live SystemsLean library.
    Membership is the prior KernelSelfApplyTerm closed set plus
    HostModuleCheckProductOutKernelTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckProductOutKernelTermSubsetNames.
    SystemsLean.HostModuleCheckProductOutKernelTerm. -/
def namedClosedHostModuleCheckProductOutKernelTermSubsetNames : List String :=
  namedClosedHostModuleCheckKernelSelfApplyTermSubsetNames ++
    ["SystemsLean.HostModuleCheckProductOutKernelTerm"]

/-- Compile order honors imports: KernelSelfApplyTerm compile order, then
    HostModuleCheckProductOutKernelTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm / EmitGraphScaffoldTerm /
    EmitComposeScaffoldTerm / EmitErasureScaffoldTerm /
    EmitExtractScaffoldTerm / EmitBannerScaffoldTerm /
    KernelSelfApplyTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckProductOutKernelTermCompileOrder. -/
def namedClosedHostModuleCheckProductOutKernelTermCompileOrder : List String :=
  namedClosedHostModuleCheckKernelSelfApplyTermCompileOrder ++
    ["SystemsLean.HostModuleCheckProductOutKernelTerm"]

/-- True when the barrel lists each HostModuleCheckProductOutKernelTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckProductOutKernelTermSubset. -/
def barrelListsNamedHostModuleCheckProductOutKernelTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckProductOutKernelTermSubsetNames

/-- Compile the named HostModuleCheckProductOutKernelTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the KernelSelfApplyTerm
    compile order, then HostModuleCheckProductOutKernelTerm last.
    Greppable: tryCompileNamedHostModuleCheckProductOutKernelTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckProductOutKernelTerm. -/
unsafe def tryCompileNamedHostModuleCheckProductOutKernelTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckProductOutKernelTermSubsetNames
    namedClosedHostModuleCheckProductOutKernelTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckProductOutKernelTermSubsetIO]
opaque tryCompileNamedHostModuleCheckProductOutKernelTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckProductOutKernelTerm subset.
    Greppable: tryCompileNamedHostModuleCheckProductOutKernelTermSubset. -/
def tryCompileNamedHostModuleCheckProductOutKernelTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckProductOutKernelTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the KernelSelfApplyTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckProductOutKernelTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckProductOutKernelTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckProductOutKernelTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckKernelSelfApplyTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckProductOutKernelTermDepsIO]
opaque tryCompileAfterHostModuleCheckProductOutKernelTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckProductOutKernelTerm deps.
    Greppable: tryCompileAfterHostModuleCheckProductOutKernelTermDeps. -/
def tryCompileAfterHostModuleCheckProductOutKernelTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckProductOutKernelTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
