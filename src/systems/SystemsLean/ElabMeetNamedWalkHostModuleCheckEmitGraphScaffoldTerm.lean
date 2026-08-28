/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckEmitGraphScaffoldTerm named-walk
  wrappers (CheckersLater-role walk; EmitProgramScaffoldTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, EmitMultScaffoldTerm
  walk, EmitLinearScaffoldTerm walk, EmitTypesScaffoldTerm walk, and
  EmitProgramScaffoldTerm walk stay as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior EmitProgramScaffoldTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckEmitProgramScaffoldTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, ParityMultTermProbe,
  ParityLinearTermProbe, ParityTypesTermProbe, ParityProgramTermProbe,
  ParityEmitTermProbe, EmitMultScaffoldTermProbe, EmitLinearScaffoldTermProbe,
  EmitTypesScaffoldTermProbe, or EmitProgramScaffoldTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckEmitGraphScaffoldTerm.lean.
  Do not skip to HostModuleCheckEmitComposeScaffoldTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckEmitGraphScaffoldTerm wrappers live here:
    findLiveHostModuleCheckEmitGraphScaffoldTermPath,
    namedClosedHostModuleCheckEmitGraphScaffoldTermSubsetNames,
    namedClosedHostModuleCheckEmitGraphScaffoldTermCompileOrder,
    barrelListsNamedHostModuleCheckEmitGraphScaffoldTermSubset,
    tryCompileNamedHostModuleCheckEmitGraphScaffoldTermSubset,
    tryCompileAfterHostModuleCheckEmitGraphScaffoldTermDeps.
    Named membership is the prior EmitProgramScaffoldTerm closed set plus
    HostModuleCheckEmitGraphScaffoldTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Do not open HostImportGraph as a plus-one.
    Compile order is the EmitProgramScaffoldTerm compile order, then
    HostModuleCheckEmitGraphScaffoldTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm / ParityTypesTerm / ParityProgramTerm /
    ParityEmitTerm / EmitMultScaffoldTerm / EmitLinearScaffoldTerm /
    EmitTypesScaffoldTerm / EmitProgramScaffoldTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the EmitProgramScaffoldTerm compile order.
    HostModuleCheckEmitGraphScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckEmitProgramScaffoldTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckEmitGraphScaffoldTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckEmitGraphScaffoldTermPath,
  namedClosedHostModuleCheckEmitGraphScaffoldTermSubsetNames,
  namedClosedHostModuleCheckEmitGraphScaffoldTermCompileOrder,
  barrelListsNamedHostModuleCheckEmitGraphScaffoldTermSubset,
  tryCompileNamedHostModuleCheckEmitGraphScaffoldTermSubset,
  tryCompileAfterHostModuleCheckEmitGraphScaffoldTermDeps,
  SystemsLean.HostModuleCheckEmitGraphScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitGraphScaffoldTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitGraphScaffoldTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitGraphScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitGraphScaffoldTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckEmitGraphScaffoldTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckEmitGraphScaffoldTermPath. -/
def findLiveHostModuleCheckEmitGraphScaffoldTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckEmitGraphScaffoldTerm"

/-- Named HostModuleCheckEmitGraphScaffoldTerm subset of the live SystemsLean library.
    Membership is the prior EmitProgramScaffoldTerm closed set plus
    HostModuleCheckEmitGraphScaffoldTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckEmitGraphScaffoldTermSubsetNames.
    SystemsLean.HostModuleCheckEmitGraphScaffoldTerm. -/
def namedClosedHostModuleCheckEmitGraphScaffoldTermSubsetNames : List String :=
  namedClosedHostModuleCheckEmitProgramScaffoldTermSubsetNames ++
    ["SystemsLean.HostModuleCheckEmitGraphScaffoldTerm"]

/-- Compile order honors imports: EmitProgramScaffoldTerm compile order, then
    HostModuleCheckEmitGraphScaffoldTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckEmitGraphScaffoldTermCompileOrder. -/
def namedClosedHostModuleCheckEmitGraphScaffoldTermCompileOrder : List String :=
  namedClosedHostModuleCheckEmitProgramScaffoldTermCompileOrder ++
    ["SystemsLean.HostModuleCheckEmitGraphScaffoldTerm"]

/-- True when the barrel lists each HostModuleCheckEmitGraphScaffoldTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckEmitGraphScaffoldTermSubset. -/
def barrelListsNamedHostModuleCheckEmitGraphScaffoldTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckEmitGraphScaffoldTermSubsetNames

/-- Compile the named HostModuleCheckEmitGraphScaffoldTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the EmitProgramScaffoldTerm
    compile order, then HostModuleCheckEmitGraphScaffoldTerm last.
    Greppable: tryCompileNamedHostModuleCheckEmitGraphScaffoldTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckEmitGraphScaffoldTerm. -/
unsafe def tryCompileNamedHostModuleCheckEmitGraphScaffoldTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckEmitGraphScaffoldTermSubsetNames
    namedClosedHostModuleCheckEmitGraphScaffoldTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckEmitGraphScaffoldTermSubsetIO]
opaque tryCompileNamedHostModuleCheckEmitGraphScaffoldTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckEmitGraphScaffoldTerm subset.
    Greppable: tryCompileNamedHostModuleCheckEmitGraphScaffoldTermSubset. -/
def tryCompileNamedHostModuleCheckEmitGraphScaffoldTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckEmitGraphScaffoldTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the EmitProgramScaffoldTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckEmitGraphScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckEmitGraphScaffoldTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckEmitGraphScaffoldTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckEmitProgramScaffoldTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckEmitGraphScaffoldTermDepsIO]
opaque tryCompileAfterHostModuleCheckEmitGraphScaffoldTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckEmitGraphScaffoldTerm deps.
    Greppable: tryCompileAfterHostModuleCheckEmitGraphScaffoldTermDeps. -/
def tryCompileAfterHostModuleCheckEmitGraphScaffoldTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckEmitGraphScaffoldTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
