/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckKernelProgramTerm named-walk
  wrappers (CheckersLater-role walk; KernelTypesTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  KernelTypesTerm walk stays as compile dep. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior KernelTypesTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckKernelTypesTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, or KernelTypesTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckKernelProgramTerm.lean.
  Do not skip to HostModuleCheckKernelEmitTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckKernelProgramTerm wrappers live here:
    findLiveHostModuleCheckKernelProgramTermPath,
    namedClosedHostModuleCheckKernelProgramTermSubsetNames,
    namedClosedHostModuleCheckKernelProgramTermCompileOrder,
    barrelListsNamedHostModuleCheckKernelProgramTermSubset,
    tryCompileNamedHostModuleCheckKernelProgramTermSubset,
    tryCompileAfterHostModuleCheckKernelProgramTermDeps.
    Named membership is the prior KernelTypesTerm closed set plus
    HostModuleCheckKernelProgramTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the KernelTypesTerm compile order, then
    HostModuleCheckKernelProgramTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelTypesTerm order), not a named
    plus-one. IrGraph and HostCompose are compile dependencies only.
    After-deps are the KernelTypesTerm compile order.
    HostModuleCheckKernelProgramTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. Do not plant live
    HostModuleCheckKernelProgramTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 42 or 43 or 44 or 45.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckKernelProgramTermPath,
  namedClosedHostModuleCheckKernelProgramTermSubsetNames,
  namedClosedHostModuleCheckKernelProgramTermCompileOrder,
  barrelListsNamedHostModuleCheckKernelProgramTermSubset,
  tryCompileNamedHostModuleCheckKernelProgramTermSubset,
  tryCompileAfterHostModuleCheckKernelProgramTermDeps,
  SystemsLean.HostModuleCheckKernelProgramTerm,
  ElabMeetNamedWalkHostModuleCheckKernelProgramTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelProgramTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelProgramTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelProgramTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckKernelProgramTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckKernelProgramTermPath. -/
def findLiveHostModuleCheckKernelProgramTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckKernelProgramTerm"

/-- Named HostModuleCheckKernelProgramTerm subset of the live SystemsLean library.
    Membership is the prior KernelTypesTerm closed set plus
    HostModuleCheckKernelProgramTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckKernelProgramTermSubsetNames.
    SystemsLean.HostModuleCheckKernelProgramTerm. -/
def namedClosedHostModuleCheckKernelProgramTermSubsetNames : List String :=
  namedClosedHostModuleCheckKernelTypesTermSubsetNames ++
    ["SystemsLean.HostModuleCheckKernelProgramTerm"]

/-- Compile order honors imports: KernelTypesTerm compile order, then
    HostModuleCheckKernelProgramTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelTypesTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckKernelProgramTermCompileOrder. -/
def namedClosedHostModuleCheckKernelProgramTermCompileOrder : List String :=
  namedClosedHostModuleCheckKernelTypesTermCompileOrder ++
    ["SystemsLean.HostModuleCheckKernelProgramTerm"]

/-- True when the barrel lists each HostModuleCheckKernelProgramTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckKernelProgramTermSubset. -/
def barrelListsNamedHostModuleCheckKernelProgramTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckKernelProgramTermSubsetNames

/-- Compile the named HostModuleCheckKernelProgramTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the KernelTypesTerm
    compile order, then HostModuleCheckKernelProgramTerm last.
    Greppable: tryCompileNamedHostModuleCheckKernelProgramTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckKernelProgramTerm. -/
unsafe def tryCompileNamedHostModuleCheckKernelProgramTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckKernelProgramTermSubsetNames
    namedClosedHostModuleCheckKernelProgramTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckKernelProgramTermSubsetIO]
opaque tryCompileNamedHostModuleCheckKernelProgramTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckKernelProgramTerm subset.
    Greppable: tryCompileNamedHostModuleCheckKernelProgramTermSubset. -/
def tryCompileNamedHostModuleCheckKernelProgramTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckKernelProgramTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the KernelTypesTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckKernelProgramTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckKernelProgramTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckKernelProgramTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckKernelTypesTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckKernelProgramTermDepsIO]
opaque tryCompileAfterHostModuleCheckKernelProgramTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckKernelProgramTerm deps.
    Greppable: tryCompileAfterHostModuleCheckKernelProgramTermDeps. -/
def tryCompileAfterHostModuleCheckKernelProgramTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckKernelProgramTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
