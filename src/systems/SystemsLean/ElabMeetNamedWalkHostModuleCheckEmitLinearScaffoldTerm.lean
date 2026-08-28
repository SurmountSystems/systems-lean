/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckEmitLinearScaffoldTerm named-walk
  wrappers (CheckersLater-role walk; EmitMultScaffoldTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, and EmitMultScaffoldTerm
  walk stay as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior EmitMultScaffoldTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckEmitMultScaffoldTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, ParityMultTermProbe,
  ParityLinearTermProbe, ParityTypesTermProbe, ParityProgramTermProbe,
  ParityEmitTermProbe, or EmitMultScaffoldTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckEmitLinearScaffoldTerm.lean.
  Do not skip to HostModuleCheckEmitTypesScaffoldTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckEmitLinearScaffoldTerm wrappers live here:
    findLiveHostModuleCheckEmitLinearScaffoldTermPath,
    namedClosedHostModuleCheckEmitLinearScaffoldTermSubsetNames,
    namedClosedHostModuleCheckEmitLinearScaffoldTermCompileOrder,
    barrelListsNamedHostModuleCheckEmitLinearScaffoldTermSubset,
    tryCompileNamedHostModuleCheckEmitLinearScaffoldTermSubset,
    tryCompileAfterHostModuleCheckEmitLinearScaffoldTermDeps.
    Named membership is the prior EmitMultScaffoldTerm closed set plus
    HostModuleCheckEmitLinearScaffoldTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose.
    Compile order is the EmitMultScaffoldTerm compile order, then
    HostModuleCheckEmitLinearScaffoldTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm / ParityTypesTerm / ParityProgramTerm /
    ParityEmitTerm / EmitMultScaffoldTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the EmitMultScaffoldTerm compile order.
    HostModuleCheckEmitLinearScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckEmitMultScaffoldTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckEmitLinearScaffoldTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47. Living tip stays 46 of about 206 until ParityMult fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckEmitLinearScaffoldTermPath,
  namedClosedHostModuleCheckEmitLinearScaffoldTermSubsetNames,
  namedClosedHostModuleCheckEmitLinearScaffoldTermCompileOrder,
  barrelListsNamedHostModuleCheckEmitLinearScaffoldTermSubset,
  tryCompileNamedHostModuleCheckEmitLinearScaffoldTermSubset,
  tryCompileAfterHostModuleCheckEmitLinearScaffoldTermDeps,
  SystemsLean.HostModuleCheckEmitLinearScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitLinearScaffoldTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitLinearScaffoldTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitLinearScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitLinearScaffoldTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckEmitLinearScaffoldTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckEmitLinearScaffoldTermPath. -/
def findLiveHostModuleCheckEmitLinearScaffoldTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckEmitLinearScaffoldTerm"

/-- Named HostModuleCheckEmitLinearScaffoldTerm subset of the live SystemsLean library.
    Membership is the prior EmitMultScaffoldTerm closed set plus
    HostModuleCheckEmitLinearScaffoldTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckEmitLinearScaffoldTermSubsetNames.
    SystemsLean.HostModuleCheckEmitLinearScaffoldTerm. -/
def namedClosedHostModuleCheckEmitLinearScaffoldTermSubsetNames : List String :=
  namedClosedHostModuleCheckEmitMultScaffoldTermSubsetNames ++
    ["SystemsLean.HostModuleCheckEmitLinearScaffoldTerm"]

/-- Compile order honors imports: EmitMultScaffoldTerm compile order, then
    HostModuleCheckEmitLinearScaffoldTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm order),
    not a named plus-one.
    Greppable: namedClosedHostModuleCheckEmitLinearScaffoldTermCompileOrder. -/
def namedClosedHostModuleCheckEmitLinearScaffoldTermCompileOrder : List String :=
  namedClosedHostModuleCheckEmitMultScaffoldTermCompileOrder ++
    ["SystemsLean.HostModuleCheckEmitLinearScaffoldTerm"]

/-- True when the barrel lists each HostModuleCheckEmitLinearScaffoldTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckEmitLinearScaffoldTermSubset. -/
def barrelListsNamedHostModuleCheckEmitLinearScaffoldTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckEmitLinearScaffoldTermSubsetNames

/-- Compile the named HostModuleCheckEmitLinearScaffoldTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the EmitMultScaffoldTerm
    compile order, then HostModuleCheckEmitLinearScaffoldTerm last.
    Greppable: tryCompileNamedHostModuleCheckEmitLinearScaffoldTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckEmitLinearScaffoldTerm. -/
unsafe def tryCompileNamedHostModuleCheckEmitLinearScaffoldTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckEmitLinearScaffoldTermSubsetNames
    namedClosedHostModuleCheckEmitLinearScaffoldTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckEmitLinearScaffoldTermSubsetIO]
opaque tryCompileNamedHostModuleCheckEmitLinearScaffoldTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckEmitLinearScaffoldTerm subset.
    Greppable: tryCompileNamedHostModuleCheckEmitLinearScaffoldTermSubset. -/
def tryCompileNamedHostModuleCheckEmitLinearScaffoldTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckEmitLinearScaffoldTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the EmitMultScaffoldTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckEmitLinearScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckEmitLinearScaffoldTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckEmitLinearScaffoldTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckEmitMultScaffoldTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckEmitLinearScaffoldTermDepsIO]
opaque tryCompileAfterHostModuleCheckEmitLinearScaffoldTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckEmitLinearScaffoldTerm deps.
    Greppable: tryCompileAfterHostModuleCheckEmitLinearScaffoldTermDeps. -/
def tryCompileAfterHostModuleCheckEmitLinearScaffoldTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckEmitLinearScaffoldTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
