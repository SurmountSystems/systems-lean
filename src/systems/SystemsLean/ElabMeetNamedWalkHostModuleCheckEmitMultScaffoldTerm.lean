/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckEmitMultScaffoldTerm named-walk
  wrappers (CheckersLater-role walk; ParityEmitTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, and ParityEmitTerm walk stay as compile deps.
  Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior ParityEmitTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckParityEmitTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, ParityMultTermProbe,
  ParityLinearTermProbe, ParityTypesTermProbe, ParityProgramTermProbe, or
  ParityEmitTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckEmitMultScaffoldTerm.lean.
  Do not skip to HostModuleCheckEmitLinearScaffoldTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckEmitMultScaffoldTerm wrappers live here:
    findLiveHostModuleCheckEmitMultScaffoldTermPath,
    namedClosedHostModuleCheckEmitMultScaffoldTermSubsetNames,
    namedClosedHostModuleCheckEmitMultScaffoldTermCompileOrder,
    barrelListsNamedHostModuleCheckEmitMultScaffoldTermSubset,
    tryCompileNamedHostModuleCheckEmitMultScaffoldTermSubset,
    tryCompileAfterHostModuleCheckEmitMultScaffoldTermDeps.
    Named membership is the prior ParityEmitTerm closed set plus
    HostModuleCheckEmitMultScaffoldTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the ParityEmitTerm compile order, then
    HostModuleCheckEmitMultScaffoldTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm / ParityTypesTerm / ParityProgramTerm /
    ParityEmitTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the ParityEmitTerm compile order.
    HostModuleCheckEmitMultScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckParityEmitTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckEmitMultScaffoldTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47. Living tip stays 46 of about 206 until ParityMult fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckEmitMultScaffoldTermPath,
  namedClosedHostModuleCheckEmitMultScaffoldTermSubsetNames,
  namedClosedHostModuleCheckEmitMultScaffoldTermCompileOrder,
  barrelListsNamedHostModuleCheckEmitMultScaffoldTermSubset,
  tryCompileNamedHostModuleCheckEmitMultScaffoldTermSubset,
  tryCompileAfterHostModuleCheckEmitMultScaffoldTermDeps,
  SystemsLean.HostModuleCheckEmitMultScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitMultScaffoldTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitMultScaffoldTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitMultScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitMultScaffoldTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckEmitMultScaffoldTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckEmitMultScaffoldTermPath. -/
def findLiveHostModuleCheckEmitMultScaffoldTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckEmitMultScaffoldTerm"

/-- Named HostModuleCheckEmitMultScaffoldTerm subset of the live SystemsLean library.
    Membership is the prior ParityEmitTerm closed set plus
    HostModuleCheckEmitMultScaffoldTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckEmitMultScaffoldTermSubsetNames.
    SystemsLean.HostModuleCheckEmitMultScaffoldTerm. -/
def namedClosedHostModuleCheckEmitMultScaffoldTermSubsetNames : List String :=
  namedClosedHostModuleCheckParityEmitTermSubsetNames ++
    ["SystemsLean.HostModuleCheckEmitMultScaffoldTerm"]

/-- Compile order honors imports: ParityEmitTerm compile order, then
    HostModuleCheckEmitMultScaffoldTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckEmitMultScaffoldTermCompileOrder. -/
def namedClosedHostModuleCheckEmitMultScaffoldTermCompileOrder : List String :=
  namedClosedHostModuleCheckParityEmitTermCompileOrder ++
    ["SystemsLean.HostModuleCheckEmitMultScaffoldTerm"]

/-- True when the barrel lists each HostModuleCheckEmitMultScaffoldTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckEmitMultScaffoldTermSubset. -/
def barrelListsNamedHostModuleCheckEmitMultScaffoldTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckEmitMultScaffoldTermSubsetNames

/-- Compile the named HostModuleCheckEmitMultScaffoldTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the ParityEmitTerm
    compile order, then HostModuleCheckEmitMultScaffoldTerm last.
    Greppable: tryCompileNamedHostModuleCheckEmitMultScaffoldTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckEmitMultScaffoldTerm. -/
unsafe def tryCompileNamedHostModuleCheckEmitMultScaffoldTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckEmitMultScaffoldTermSubsetNames
    namedClosedHostModuleCheckEmitMultScaffoldTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckEmitMultScaffoldTermSubsetIO]
opaque tryCompileNamedHostModuleCheckEmitMultScaffoldTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckEmitMultScaffoldTerm subset.
    Greppable: tryCompileNamedHostModuleCheckEmitMultScaffoldTermSubset. -/
def tryCompileNamedHostModuleCheckEmitMultScaffoldTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckEmitMultScaffoldTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the ParityEmitTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckEmitMultScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckEmitMultScaffoldTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckEmitMultScaffoldTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckParityEmitTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckEmitMultScaffoldTermDepsIO]
opaque tryCompileAfterHostModuleCheckEmitMultScaffoldTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckEmitMultScaffoldTerm deps.
    Greppable: tryCompileAfterHostModuleCheckEmitMultScaffoldTermDeps. -/
def tryCompileAfterHostModuleCheckEmitMultScaffoldTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckEmitMultScaffoldTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
