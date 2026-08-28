/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckEmitTypesScaffoldTerm named-walk
  wrappers (CheckersLater-role walk; EmitLinearScaffoldTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, EmitMultScaffoldTerm
  walk, and EmitLinearScaffoldTerm walk stay as compile deps. Do not dump
  onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior EmitLinearScaffoldTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckEmitLinearScaffoldTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, ParityMultTermProbe,
  ParityLinearTermProbe, ParityTypesTermProbe, ParityProgramTermProbe,
  ParityEmitTermProbe, EmitMultScaffoldTermProbe, or
  EmitLinearScaffoldTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckEmitTypesScaffoldTerm.lean.
  Do not skip to HostModuleCheckEmitProgramScaffoldTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckEmitTypesScaffoldTerm wrappers live here:
    findLiveHostModuleCheckEmitTypesScaffoldTermPath,
    namedClosedHostModuleCheckEmitTypesScaffoldTermSubsetNames,
    namedClosedHostModuleCheckEmitTypesScaffoldTermCompileOrder,
    barrelListsNamedHostModuleCheckEmitTypesScaffoldTermSubset,
    tryCompileNamedHostModuleCheckEmitTypesScaffoldTermSubset,
    tryCompileAfterHostModuleCheckEmitTypesScaffoldTermDeps.
    Named membership is the prior EmitLinearScaffoldTerm closed set plus
    HostModuleCheckEmitTypesScaffoldTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Do not open HostImportGraph as a plus-one.
    Compile order is the EmitLinearScaffoldTerm compile order, then
    HostModuleCheckEmitTypesScaffoldTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm / ParityTypesTerm / ParityProgramTerm /
    ParityEmitTerm / EmitMultScaffoldTerm / EmitLinearScaffoldTerm order),
    not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the EmitLinearScaffoldTerm compile order.
    HostModuleCheckEmitTypesScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckEmitLinearScaffoldTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckEmitTypesScaffoldTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47. Living tip stays 46 of about 206 until ParityMult fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckEmitTypesScaffoldTermPath,
  namedClosedHostModuleCheckEmitTypesScaffoldTermSubsetNames,
  namedClosedHostModuleCheckEmitTypesScaffoldTermCompileOrder,
  barrelListsNamedHostModuleCheckEmitTypesScaffoldTermSubset,
  tryCompileNamedHostModuleCheckEmitTypesScaffoldTermSubset,
  tryCompileAfterHostModuleCheckEmitTypesScaffoldTermDeps,
  SystemsLean.HostModuleCheckEmitTypesScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitTypesScaffoldTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitTypesScaffoldTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitTypesScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitTypesScaffoldTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckEmitTypesScaffoldTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckEmitTypesScaffoldTermPath. -/
def findLiveHostModuleCheckEmitTypesScaffoldTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckEmitTypesScaffoldTerm"

/-- Named HostModuleCheckEmitTypesScaffoldTerm subset of the live SystemsLean library.
    Membership is the prior EmitLinearScaffoldTerm closed set plus
    HostModuleCheckEmitTypesScaffoldTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckEmitTypesScaffoldTermSubsetNames.
    SystemsLean.HostModuleCheckEmitTypesScaffoldTerm. -/
def namedClosedHostModuleCheckEmitTypesScaffoldTermSubsetNames : List String :=
  namedClosedHostModuleCheckEmitLinearScaffoldTermSubsetNames ++
    ["SystemsLean.HostModuleCheckEmitTypesScaffoldTerm"]

/-- Compile order honors imports: EmitLinearScaffoldTerm compile order, then
    HostModuleCheckEmitTypesScaffoldTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckEmitTypesScaffoldTermCompileOrder. -/
def namedClosedHostModuleCheckEmitTypesScaffoldTermCompileOrder : List String :=
  namedClosedHostModuleCheckEmitLinearScaffoldTermCompileOrder ++
    ["SystemsLean.HostModuleCheckEmitTypesScaffoldTerm"]

/-- True when the barrel lists each HostModuleCheckEmitTypesScaffoldTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckEmitTypesScaffoldTermSubset. -/
def barrelListsNamedHostModuleCheckEmitTypesScaffoldTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckEmitTypesScaffoldTermSubsetNames

/-- Compile the named HostModuleCheckEmitTypesScaffoldTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the EmitLinearScaffoldTerm
    compile order, then HostModuleCheckEmitTypesScaffoldTerm last.
    Greppable: tryCompileNamedHostModuleCheckEmitTypesScaffoldTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckEmitTypesScaffoldTerm. -/
unsafe def tryCompileNamedHostModuleCheckEmitTypesScaffoldTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckEmitTypesScaffoldTermSubsetNames
    namedClosedHostModuleCheckEmitTypesScaffoldTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckEmitTypesScaffoldTermSubsetIO]
opaque tryCompileNamedHostModuleCheckEmitTypesScaffoldTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckEmitTypesScaffoldTerm subset.
    Greppable: tryCompileNamedHostModuleCheckEmitTypesScaffoldTermSubset. -/
def tryCompileNamedHostModuleCheckEmitTypesScaffoldTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckEmitTypesScaffoldTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the EmitLinearScaffoldTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckEmitTypesScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckEmitTypesScaffoldTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckEmitTypesScaffoldTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckEmitLinearScaffoldTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckEmitTypesScaffoldTermDepsIO]
opaque tryCompileAfterHostModuleCheckEmitTypesScaffoldTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckEmitTypesScaffoldTerm deps.
    Greppable: tryCompileAfterHostModuleCheckEmitTypesScaffoldTermDeps. -/
def tryCompileAfterHostModuleCheckEmitTypesScaffoldTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckEmitTypesScaffoldTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
