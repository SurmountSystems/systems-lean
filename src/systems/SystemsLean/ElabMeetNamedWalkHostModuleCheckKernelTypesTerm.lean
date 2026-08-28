/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckKernelTypesTerm named-walk
  wrappers (CheckersLater-role walk; KernelLinearTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  KernelLinearTerm walk stays as compile dep. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior KernelLinearTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckKernelLinearTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, or KernelLinearTermProbe. Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckKernelTypesTerm.lean.
  Do not skip to HostModuleCheckKernelProgramTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckKernelTypesTerm wrappers live here:
    findLiveHostModuleCheckKernelTypesTermPath,
    namedClosedHostModuleCheckKernelTypesTermSubsetNames,
    namedClosedHostModuleCheckKernelTypesTermCompileOrder,
    barrelListsNamedHostModuleCheckKernelTypesTermSubset,
    tryCompileNamedHostModuleCheckKernelTypesTermSubset,
    tryCompileAfterHostModuleCheckKernelTypesTermDeps.
    Named membership is the prior KernelLinearTerm closed set plus
    HostModuleCheckKernelTypesTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the KernelLinearTerm compile order, then
    HostModuleCheckKernelTypesTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelLinearTerm order), not a named
    plus-one. IrGraph and HostCompose are compile dependencies only.
    After-deps are the KernelLinearTerm compile order.
    HostModuleCheckKernelTypesTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. Do not plant live
    HostModuleCheckKernelTypesTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 42 or 43 or 44.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckKernelTypesTermPath,
  namedClosedHostModuleCheckKernelTypesTermSubsetNames,
  namedClosedHostModuleCheckKernelTypesTermCompileOrder,
  barrelListsNamedHostModuleCheckKernelTypesTermSubset,
  tryCompileNamedHostModuleCheckKernelTypesTermSubset,
  tryCompileAfterHostModuleCheckKernelTypesTermDeps,
  SystemsLean.HostModuleCheckKernelTypesTerm,
  ElabMeetNamedWalkHostModuleCheckKernelTypesTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelTypesTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelTypesTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelTypesTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckKernelTypesTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckKernelTypesTermPath. -/
def findLiveHostModuleCheckKernelTypesTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckKernelTypesTerm"

/-- Named HostModuleCheckKernelTypesTerm subset of the live SystemsLean library.
    Membership is the prior KernelLinearTerm closed set plus
    HostModuleCheckKernelTypesTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckKernelTypesTermSubsetNames.
    SystemsLean.HostModuleCheckKernelTypesTerm. -/
def namedClosedHostModuleCheckKernelTypesTermSubsetNames : List String :=
  namedClosedHostModuleCheckKernelLinearTermSubsetNames ++
    ["SystemsLean.HostModuleCheckKernelTypesTerm"]

/-- Compile order honors imports: KernelLinearTerm compile order, then
    HostModuleCheckKernelTypesTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelLinearTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckKernelTypesTermCompileOrder. -/
def namedClosedHostModuleCheckKernelTypesTermCompileOrder : List String :=
  namedClosedHostModuleCheckKernelLinearTermCompileOrder ++
    ["SystemsLean.HostModuleCheckKernelTypesTerm"]

/-- True when the barrel lists each HostModuleCheckKernelTypesTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckKernelTypesTermSubset. -/
def barrelListsNamedHostModuleCheckKernelTypesTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckKernelTypesTermSubsetNames

/-- Compile the named HostModuleCheckKernelTypesTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the KernelLinearTerm
    compile order, then HostModuleCheckKernelTypesTerm last.
    Greppable: tryCompileNamedHostModuleCheckKernelTypesTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckKernelTypesTerm. -/
unsafe def tryCompileNamedHostModuleCheckKernelTypesTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckKernelTypesTermSubsetNames
    namedClosedHostModuleCheckKernelTypesTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckKernelTypesTermSubsetIO]
opaque tryCompileNamedHostModuleCheckKernelTypesTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckKernelTypesTerm subset.
    Greppable: tryCompileNamedHostModuleCheckKernelTypesTermSubset. -/
def tryCompileNamedHostModuleCheckKernelTypesTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckKernelTypesTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the KernelLinearTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckKernelTypesTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckKernelTypesTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckKernelTypesTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckKernelLinearTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckKernelTypesTermDepsIO]
opaque tryCompileAfterHostModuleCheckKernelTypesTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckKernelTypesTerm deps.
    Greppable: tryCompileAfterHostModuleCheckKernelTypesTermDeps. -/
def tryCompileAfterHostModuleCheckKernelTypesTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckKernelTypesTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
