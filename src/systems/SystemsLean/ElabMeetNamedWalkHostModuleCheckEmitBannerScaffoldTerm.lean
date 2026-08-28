/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckEmitBannerScaffoldTerm named-walk
  wrappers (CheckersLater-role walk; EmitExtractScaffoldTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, EmitMultScaffoldTerm
  walk, EmitLinearScaffoldTerm walk, EmitTypesScaffoldTerm walk,
  EmitProgramScaffoldTerm walk, EmitGraphScaffoldTerm walk,
  EmitComposeScaffoldTerm walk, EmitErasureScaffoldTerm walk, and
  EmitExtractScaffoldTerm walk stay as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior EmitExtractScaffoldTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckEmitExtractScaffoldTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, ParityMultTermProbe,
  ParityLinearTermProbe, ParityTypesTermProbe, ParityProgramTermProbe,
  ParityEmitTermProbe, EmitMultScaffoldTermProbe, EmitLinearScaffoldTermProbe,
  EmitTypesScaffoldTermProbe, EmitProgramScaffoldTermProbe,
  EmitGraphScaffoldTermProbe, EmitComposeScaffoldTermProbe,
  EmitErasureScaffoldTermProbe, or EmitExtractScaffoldTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckEmitBannerScaffoldTerm.lean.
  Do not skip to HostModuleCheckKernelSelfApplyTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckEmitBannerScaffoldTerm wrappers live here:
    findLiveHostModuleCheckEmitBannerScaffoldTermPath,
    namedClosedHostModuleCheckEmitBannerScaffoldTermSubsetNames,
    namedClosedHostModuleCheckEmitBannerScaffoldTermCompileOrder,
    barrelListsNamedHostModuleCheckEmitBannerScaffoldTermSubset,
    tryCompileNamedHostModuleCheckEmitBannerScaffoldTermSubset,
    tryCompileAfterHostModuleCheckEmitBannerScaffoldTermDeps.
    Named membership is the prior EmitExtractScaffoldTerm closed set plus
    HostModuleCheckEmitBannerScaffoldTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Do not open HostImportGraph as a plus-one.
    Compile order is the EmitExtractScaffoldTerm compile order, then
    HostModuleCheckEmitBannerScaffoldTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm / ParityTypesTerm / ParityProgramTerm /
    ParityEmitTerm / EmitMultScaffoldTerm / EmitLinearScaffoldTerm /
    EmitTypesScaffoldTerm / EmitProgramScaffoldTerm /
    EmitGraphScaffoldTerm / EmitComposeScaffoldTerm /
    EmitErasureScaffoldTerm / EmitExtractScaffoldTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the EmitExtractScaffoldTerm compile order.
    HostModuleCheckEmitBannerScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckEmitExtractScaffoldTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckEmitBannerScaffoldTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckEmitBannerScaffoldTermPath,
  namedClosedHostModuleCheckEmitBannerScaffoldTermSubsetNames,
  namedClosedHostModuleCheckEmitBannerScaffoldTermCompileOrder,
  barrelListsNamedHostModuleCheckEmitBannerScaffoldTermSubset,
  tryCompileNamedHostModuleCheckEmitBannerScaffoldTermSubset,
  tryCompileAfterHostModuleCheckEmitBannerScaffoldTermDeps,
  SystemsLean.HostModuleCheckEmitBannerScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitBannerScaffoldTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitBannerScaffoldTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitBannerScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitBannerScaffoldTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckEmitBannerScaffoldTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckEmitBannerScaffoldTermPath. -/
def findLiveHostModuleCheckEmitBannerScaffoldTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckEmitBannerScaffoldTerm"

/-- Named HostModuleCheckEmitBannerScaffoldTerm subset of the live SystemsLean library.
    Membership is the prior EmitExtractScaffoldTerm closed set plus
    HostModuleCheckEmitBannerScaffoldTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckEmitBannerScaffoldTermSubsetNames.
    SystemsLean.HostModuleCheckEmitBannerScaffoldTerm. -/
def namedClosedHostModuleCheckEmitBannerScaffoldTermSubsetNames : List String :=
  namedClosedHostModuleCheckEmitExtractScaffoldTermSubsetNames ++
    ["SystemsLean.HostModuleCheckEmitBannerScaffoldTerm"]

/-- Compile order honors imports: EmitExtractScaffoldTerm compile order, then
    HostModuleCheckEmitBannerScaffoldTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm / EmitGraphScaffoldTerm /
    EmitComposeScaffoldTerm / EmitErasureScaffoldTerm /
    EmitExtractScaffoldTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckEmitBannerScaffoldTermCompileOrder. -/
def namedClosedHostModuleCheckEmitBannerScaffoldTermCompileOrder : List String :=
  namedClosedHostModuleCheckEmitExtractScaffoldTermCompileOrder ++
    ["SystemsLean.HostModuleCheckEmitBannerScaffoldTerm"]

/-- True when the barrel lists each HostModuleCheckEmitBannerScaffoldTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckEmitBannerScaffoldTermSubset. -/
def barrelListsNamedHostModuleCheckEmitBannerScaffoldTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckEmitBannerScaffoldTermSubsetNames

/-- Compile the named HostModuleCheckEmitBannerScaffoldTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the EmitExtractScaffoldTerm
    compile order, then HostModuleCheckEmitBannerScaffoldTerm last.
    Greppable: tryCompileNamedHostModuleCheckEmitBannerScaffoldTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckEmitBannerScaffoldTerm. -/
unsafe def tryCompileNamedHostModuleCheckEmitBannerScaffoldTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckEmitBannerScaffoldTermSubsetNames
    namedClosedHostModuleCheckEmitBannerScaffoldTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckEmitBannerScaffoldTermSubsetIO]
opaque tryCompileNamedHostModuleCheckEmitBannerScaffoldTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckEmitBannerScaffoldTerm subset.
    Greppable: tryCompileNamedHostModuleCheckEmitBannerScaffoldTermSubset. -/
def tryCompileNamedHostModuleCheckEmitBannerScaffoldTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckEmitBannerScaffoldTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the EmitExtractScaffoldTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckEmitBannerScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckEmitBannerScaffoldTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckEmitBannerScaffoldTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckEmitExtractScaffoldTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckEmitBannerScaffoldTermDepsIO]
opaque tryCompileAfterHostModuleCheckEmitBannerScaffoldTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckEmitBannerScaffoldTerm deps.
    Greppable: tryCompileAfterHostModuleCheckEmitBannerScaffoldTermDeps. -/
def tryCompileAfterHostModuleCheckEmitBannerScaffoldTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckEmitBannerScaffoldTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
