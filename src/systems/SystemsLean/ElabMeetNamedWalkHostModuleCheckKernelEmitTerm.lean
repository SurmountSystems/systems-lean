/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckKernelEmitTerm named-walk
  wrappers (CheckersLater-role walk; KernelProgramTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  KernelProgramTerm walk stays as compile dep. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior KernelProgramTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckKernelProgramTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe, or
  KernelProgramTermProbe. Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckKernelEmitTerm.lean.
  Do not skip to HostModuleCheckParityMultTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckKernelEmitTerm wrappers live here:
    findLiveHostModuleCheckKernelEmitTermPath,
    namedClosedHostModuleCheckKernelEmitTermSubsetNames,
    namedClosedHostModuleCheckKernelEmitTermCompileOrder,
    barrelListsNamedHostModuleCheckKernelEmitTermSubset,
    tryCompileNamedHostModuleCheckKernelEmitTermSubset,
    tryCompileAfterHostModuleCheckKernelEmitTermDeps.
    Named membership is the prior KernelProgramTerm closed set plus
    HostModuleCheckKernelEmitTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the KernelProgramTerm compile order, then
    HostModuleCheckKernelEmitTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelProgramTerm order), not a named
    plus-one. IrGraph and HostCompose are compile dependencies only.
    After-deps are the KernelProgramTerm compile order.
    HostModuleCheckKernelEmitTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. Do not plant live
    HostModuleCheckKernelEmitTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 42 or 43 or 44 or 45 or 46.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckKernelEmitTermPath,
  namedClosedHostModuleCheckKernelEmitTermSubsetNames,
  namedClosedHostModuleCheckKernelEmitTermCompileOrder,
  barrelListsNamedHostModuleCheckKernelEmitTermSubset,
  tryCompileNamedHostModuleCheckKernelEmitTermSubset,
  tryCompileAfterHostModuleCheckKernelEmitTermDeps,
  SystemsLean.HostModuleCheckKernelEmitTerm,
  ElabMeetNamedWalkHostModuleCheckKernelEmitTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelEmitTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelEmitTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelEmitTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckKernelEmitTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckKernelEmitTermPath. -/
def findLiveHostModuleCheckKernelEmitTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckKernelEmitTerm"

/-- Named HostModuleCheckKernelEmitTerm subset of the live SystemsLean library.
    Membership is the prior KernelProgramTerm closed set plus
    HostModuleCheckKernelEmitTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckKernelEmitTermSubsetNames.
    SystemsLean.HostModuleCheckKernelEmitTerm. -/
def namedClosedHostModuleCheckKernelEmitTermSubsetNames : List String :=
  namedClosedHostModuleCheckKernelProgramTermSubsetNames ++
    ["SystemsLean.HostModuleCheckKernelEmitTerm"]

/-- Compile order honors imports: KernelProgramTerm compile order, then
    HostModuleCheckKernelEmitTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelProgramTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckKernelEmitTermCompileOrder. -/
def namedClosedHostModuleCheckKernelEmitTermCompileOrder : List String :=
  namedClosedHostModuleCheckKernelProgramTermCompileOrder ++
    ["SystemsLean.HostModuleCheckKernelEmitTerm"]

/-- True when the barrel lists each HostModuleCheckKernelEmitTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckKernelEmitTermSubset. -/
def barrelListsNamedHostModuleCheckKernelEmitTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckKernelEmitTermSubsetNames

/-- Compile the named HostModuleCheckKernelEmitTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the KernelProgramTerm
    compile order, then HostModuleCheckKernelEmitTerm last.
    Greppable: tryCompileNamedHostModuleCheckKernelEmitTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckKernelEmitTerm. -/
unsafe def tryCompileNamedHostModuleCheckKernelEmitTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckKernelEmitTermSubsetNames
    namedClosedHostModuleCheckKernelEmitTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckKernelEmitTermSubsetIO]
opaque tryCompileNamedHostModuleCheckKernelEmitTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckKernelEmitTerm subset.
    Greppable: tryCompileNamedHostModuleCheckKernelEmitTermSubset. -/
def tryCompileNamedHostModuleCheckKernelEmitTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckKernelEmitTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the KernelProgramTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckKernelEmitTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckKernelEmitTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckKernelEmitTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckKernelProgramTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckKernelEmitTermDepsIO]
opaque tryCompileAfterHostModuleCheckKernelEmitTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckKernelEmitTerm deps.
    Greppable: tryCompileAfterHostModuleCheckKernelEmitTermDeps. -/
def tryCompileAfterHostModuleCheckKernelEmitTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckKernelEmitTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
