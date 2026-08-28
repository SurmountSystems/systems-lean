/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckKernelLinearTerm named-walk
  wrappers (CheckersLater-role walk; KernelMultTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  KernelMultTerm walk stays as compile dep. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior KernelMultTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckKernelMultTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe, or
  KernelMultTermProbe. Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckKernelLinearTerm.lean.
  Do not skip to HostModuleCheckKernelTypesTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckKernelLinearTerm wrappers live here:
    findLiveHostModuleCheckKernelLinearTermPath,
    namedClosedHostModuleCheckKernelLinearTermSubsetNames,
    namedClosedHostModuleCheckKernelLinearTermCompileOrder,
    barrelListsNamedHostModuleCheckKernelLinearTermSubset,
    tryCompileNamedHostModuleCheckKernelLinearTermSubset,
    tryCompileAfterHostModuleCheckKernelLinearTermDeps.
    Named membership is the prior KernelMultTerm closed set plus
    HostModuleCheckKernelLinearTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the KernelMultTerm compile order, then
    HostModuleCheckKernelLinearTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelMultTerm order), not a named
    plus-one. IrGraph and HostCompose are compile dependencies only.
    After-deps are the KernelMultTerm compile order.
    HostModuleCheckKernelLinearTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. Do not plant live
    HostModuleCheckKernelLinearTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 42 or 43.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckKernelLinearTermPath,
  namedClosedHostModuleCheckKernelLinearTermSubsetNames,
  namedClosedHostModuleCheckKernelLinearTermCompileOrder,
  barrelListsNamedHostModuleCheckKernelLinearTermSubset,
  tryCompileNamedHostModuleCheckKernelLinearTermSubset,
  tryCompileAfterHostModuleCheckKernelLinearTermDeps,
  SystemsLean.HostModuleCheckKernelLinearTerm,
  ElabMeetNamedWalkHostModuleCheckKernelLinearTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelLinearTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelLinearTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelLinearTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckKernelLinearTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckKernelLinearTermPath. -/
def findLiveHostModuleCheckKernelLinearTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckKernelLinearTerm"

/-- Named HostModuleCheckKernelLinearTerm subset of the live SystemsLean library.
    Membership is the prior KernelMultTerm closed set plus
    HostModuleCheckKernelLinearTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckKernelLinearTermSubsetNames.
    SystemsLean.HostModuleCheckKernelLinearTerm. -/
def namedClosedHostModuleCheckKernelLinearTermSubsetNames : List String :=
  namedClosedHostModuleCheckKernelMultTermSubsetNames ++
    ["SystemsLean.HostModuleCheckKernelLinearTerm"]

/-- Compile order honors imports: KernelMultTerm compile order, then
    HostModuleCheckKernelLinearTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelMultTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckKernelLinearTermCompileOrder. -/
def namedClosedHostModuleCheckKernelLinearTermCompileOrder : List String :=
  namedClosedHostModuleCheckKernelMultTermCompileOrder ++
    ["SystemsLean.HostModuleCheckKernelLinearTerm"]

/-- True when the barrel lists each HostModuleCheckKernelLinearTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckKernelLinearTermSubset. -/
def barrelListsNamedHostModuleCheckKernelLinearTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckKernelLinearTermSubsetNames

/-- Compile the named HostModuleCheckKernelLinearTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the KernelMultTerm
    compile order, then HostModuleCheckKernelLinearTerm last.
    Greppable: tryCompileNamedHostModuleCheckKernelLinearTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckKernelLinearTerm. -/
unsafe def tryCompileNamedHostModuleCheckKernelLinearTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckKernelLinearTermSubsetNames
    namedClosedHostModuleCheckKernelLinearTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckKernelLinearTermSubsetIO]
opaque tryCompileNamedHostModuleCheckKernelLinearTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckKernelLinearTerm subset.
    Greppable: tryCompileNamedHostModuleCheckKernelLinearTermSubset. -/
def tryCompileNamedHostModuleCheckKernelLinearTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckKernelLinearTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the KernelMultTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckKernelLinearTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckKernelLinearTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckKernelLinearTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckKernelMultTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckKernelLinearTermDepsIO]
opaque tryCompileAfterHostModuleCheckKernelLinearTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckKernelLinearTerm deps.
    Greppable: tryCompileAfterHostModuleCheckKernelLinearTermDeps. -/
def tryCompileAfterHostModuleCheckKernelLinearTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckKernelLinearTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
