/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckParityMultTerm named-walk
  wrappers (CheckersLater-role walk; KernelEmitTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  KernelEmitTerm walk stays as compile dep. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior KernelEmitTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckKernelEmitTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, or KernelEmitTermProbe. Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckParityMultTerm.lean.
  Do not skip to HostModuleCheckParityLinearTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckParityMultTerm wrappers live here:
    findLiveHostModuleCheckParityMultTermPath,
    namedClosedHostModuleCheckParityMultTermSubsetNames,
    namedClosedHostModuleCheckParityMultTermCompileOrder,
    barrelListsNamedHostModuleCheckParityMultTermSubset,
    tryCompileNamedHostModuleCheckParityMultTermSubset,
    tryCompileAfterHostModuleCheckParityMultTermDeps.
    Named membership is the prior KernelEmitTerm closed set plus
    HostModuleCheckParityMultTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the KernelEmitTerm compile order, then
    HostModuleCheckParityMultTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm order), not a named
    plus-one. IrGraph and HostCompose are compile dependencies only.
    After-deps are the KernelEmitTerm compile order.
    HostModuleCheckParityMultTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckKernelEmitTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckParityMultTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 49. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckParityMultTermPath,
  namedClosedHostModuleCheckParityMultTermSubsetNames,
  namedClosedHostModuleCheckParityMultTermCompileOrder,
  barrelListsNamedHostModuleCheckParityMultTermSubset,
  tryCompileNamedHostModuleCheckParityMultTermSubset,
  tryCompileAfterHostModuleCheckParityMultTermDeps,
  SystemsLean.HostModuleCheckParityMultTerm,
  ElabMeetNamedWalkHostModuleCheckParityMultTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckParityMultTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckParityMultTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckParityMultTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckParityMultTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckParityMultTermPath. -/
def findLiveHostModuleCheckParityMultTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckParityMultTerm"

/-- Named HostModuleCheckParityMultTerm subset of the live SystemsLean library.
    Membership is the prior KernelEmitTerm closed set plus
    HostModuleCheckParityMultTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckParityMultTermSubsetNames.
    SystemsLean.HostModuleCheckParityMultTerm. -/
def namedClosedHostModuleCheckParityMultTermSubsetNames : List String :=
  namedClosedHostModuleCheckKernelEmitTermSubsetNames ++
    ["SystemsLean.HostModuleCheckParityMultTerm"]

/-- Compile order honors imports: KernelEmitTerm compile order, then
    HostModuleCheckParityMultTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckParityMultTermCompileOrder. -/
def namedClosedHostModuleCheckParityMultTermCompileOrder : List String :=
  namedClosedHostModuleCheckKernelEmitTermCompileOrder ++
    ["SystemsLean.HostModuleCheckParityMultTerm"]

/-- True when the barrel lists each HostModuleCheckParityMultTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckParityMultTermSubset. -/
def barrelListsNamedHostModuleCheckParityMultTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckParityMultTermSubsetNames

/-- Compile the named HostModuleCheckParityMultTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the KernelEmitTerm
    compile order, then HostModuleCheckParityMultTerm last.
    Greppable: tryCompileNamedHostModuleCheckParityMultTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckParityMultTerm. -/
unsafe def tryCompileNamedHostModuleCheckParityMultTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckParityMultTermSubsetNames
    namedClosedHostModuleCheckParityMultTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckParityMultTermSubsetIO]
opaque tryCompileNamedHostModuleCheckParityMultTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckParityMultTerm subset.
    Greppable: tryCompileNamedHostModuleCheckParityMultTermSubset. -/
def tryCompileNamedHostModuleCheckParityMultTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckParityMultTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the KernelEmitTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckParityMultTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckParityMultTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckParityMultTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckKernelEmitTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckParityMultTermDepsIO]
opaque tryCompileAfterHostModuleCheckParityMultTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckParityMultTerm deps.
    Greppable: tryCompileAfterHostModuleCheckParityMultTermDeps. -/
def tryCompileAfterHostModuleCheckParityMultTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckParityMultTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
