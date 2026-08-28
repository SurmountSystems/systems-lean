/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckParityLinearTerm named-walk
  wrappers (CheckersLater-role walk; ParityMultTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk stays as compile dep. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior ParityMultTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckParityMultTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, or
  ParityMultTermProbe. Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckParityLinearTerm.lean.
  Do not skip to HostModuleCheckParityTypesTerm.
  Rec-depth 8192 keep on the ElabMeet fold.

  Spec (readable):
  - HostModuleCheckParityLinearTerm wrappers live here:
    findLiveHostModuleCheckParityLinearTermPath,
    namedClosedHostModuleCheckParityLinearTermSubsetNames,
    namedClosedHostModuleCheckParityLinearTermCompileOrder,
    barrelListsNamedHostModuleCheckParityLinearTermSubset,
    tryCompileNamedHostModuleCheckParityLinearTermSubset,
    tryCompileAfterHostModuleCheckParityLinearTermDeps.
    Named membership is the prior ParityMultTerm closed set plus
    HostModuleCheckParityLinearTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the ParityMultTerm compile order, then
    HostModuleCheckParityLinearTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm
    order), not a named plus-one. IrGraph and HostCompose are compile
    dependencies only. After-deps are the ParityMultTerm compile order.
    HostModuleCheckParityLinearTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckParityMultTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckParityLinearTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 49. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckParityLinearTermPath,
  namedClosedHostModuleCheckParityLinearTermSubsetNames,
  namedClosedHostModuleCheckParityLinearTermCompileOrder,
  barrelListsNamedHostModuleCheckParityLinearTermSubset,
  tryCompileNamedHostModuleCheckParityLinearTermSubset,
  tryCompileAfterHostModuleCheckParityLinearTermDeps,
  SystemsLean.HostModuleCheckParityLinearTerm,
  ElabMeetNamedWalkHostModuleCheckParityLinearTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckParityLinearTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckParityLinearTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckParityLinearTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckParityLinearTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckParityLinearTermPath. -/
def findLiveHostModuleCheckParityLinearTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckParityLinearTerm"

/-- Named HostModuleCheckParityLinearTerm subset of the live SystemsLean library.
    Membership is the prior ParityMultTerm closed set plus
    HostModuleCheckParityLinearTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckParityLinearTermSubsetNames.
    SystemsLean.HostModuleCheckParityLinearTerm. -/
def namedClosedHostModuleCheckParityLinearTermSubsetNames : List String :=
  namedClosedHostModuleCheckParityMultTermSubsetNames ++
    ["SystemsLean.HostModuleCheckParityLinearTerm"]

/-- Compile order honors imports: ParityMultTerm compile order, then
    HostModuleCheckParityLinearTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckParityLinearTermCompileOrder. -/
def namedClosedHostModuleCheckParityLinearTermCompileOrder : List String :=
  namedClosedHostModuleCheckParityMultTermCompileOrder ++
    ["SystemsLean.HostModuleCheckParityLinearTerm"]

/-- True when the barrel lists each HostModuleCheckParityLinearTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckParityLinearTermSubset. -/
def barrelListsNamedHostModuleCheckParityLinearTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckParityLinearTermSubsetNames

/-- Compile the named HostModuleCheckParityLinearTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the ParityMultTerm
    compile order, then HostModuleCheckParityLinearTerm last.
    Greppable: tryCompileNamedHostModuleCheckParityLinearTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckParityLinearTerm. -/
unsafe def tryCompileNamedHostModuleCheckParityLinearTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckParityLinearTermSubsetNames
    namedClosedHostModuleCheckParityLinearTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckParityLinearTermSubsetIO]
opaque tryCompileNamedHostModuleCheckParityLinearTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckParityLinearTerm subset.
    Greppable: tryCompileNamedHostModuleCheckParityLinearTermSubset. -/
def tryCompileNamedHostModuleCheckParityLinearTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckParityLinearTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the ParityMultTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckParityLinearTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckParityLinearTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckParityLinearTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckParityMultTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckParityLinearTermDepsIO]
opaque tryCompileAfterHostModuleCheckParityLinearTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckParityLinearTerm deps.
    Greppable: tryCompileAfterHostModuleCheckParityLinearTermDeps. -/
def tryCompileAfterHostModuleCheckParityLinearTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckParityLinearTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
