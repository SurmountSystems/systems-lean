/-
  SYSTEMS_LEAN_HOST partial -- forty-second HostModuleCheckKernelMultTerm
  named-walk wrappers (CheckersLater walk is 617; adding about 166 would
  pass about 780).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior forty-one wrappers stay in
  ElabMeetNamedWalkHostModuleCheckCheckersLater. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, or EmitBodyTermProbe.
  Do not plant live HostModuleCheckKernelMultTerm.lean.
  Do not skip to HostModuleCheckKernelLinearTerm.

  Spec (readable):
  - Forty-second HostModuleCheckKernelMultTerm wrappers live here:
    findLiveHostModuleCheckKernelMultTermPath,
    namedClosedHostModuleCheckKernelMultTermSubsetNames,
    namedClosedHostModuleCheckKernelMultTermCompileOrder,
    barrelListsNamedHostModuleCheckKernelMultTermSubset,
    tryCompileNamedHostModuleCheckKernelMultTermSubset,
    tryCompileAfterHostModuleCheckKernelMultTermDeps.
    Named membership is the prior forty-one plus
    HostModuleCheckKernelMultTerm last. Barrel order among the
    forty-two; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the forty-first compile order, then
    HostModuleCheckKernelMultTerm last. EmitPlanTerm is a compile
    dependency only (already on the forty-first order), not a named
    plus-one. IrGraph and HostCompose are compile dependencies only.
    After-deps are the forty-first compile order.
    HostModuleCheckKernelMultTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. Do not plant live
    HostModuleCheckKernelMultTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckKernelMultTermPath,
  namedClosedHostModuleCheckKernelMultTermSubsetNames,
  namedClosedHostModuleCheckKernelMultTermCompileOrder,
  barrelListsNamedHostModuleCheckKernelMultTermSubset,
  tryCompileNamedHostModuleCheckKernelMultTermSubset,
  tryCompileAfterHostModuleCheckKernelMultTermDeps,
  SystemsLean.HostModuleCheckKernelMultTerm,
  ElabMeetNamedWalkHostModuleCheckKernelMultTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelMultTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelMultTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelMultTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckKernelMultTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckKernelMultTermPath. -/
def findLiveHostModuleCheckKernelMultTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckKernelMultTerm"

/-- Named HostModuleCheckKernelMultTerm subset of the live SystemsLean library.
    Membership is the prior forty-one plus HostModuleCheckKernelMultTerm last.
    Barrel order among the forty-two; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckKernelMultTermSubsetNames.
    SystemsLean.HostModuleCheckKernelMultTerm. -/
def namedClosedHostModuleCheckKernelMultTermSubsetNames : List String :=
  namedClosedHostModuleCheckEmitBodyTermSubsetNames ++
    ["SystemsLean.HostModuleCheckKernelMultTerm"]

/-- Compile order honors imports: forty-first compile order, then
    HostModuleCheckKernelMultTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    forty-first order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckKernelMultTermCompileOrder. -/
def namedClosedHostModuleCheckKernelMultTermCompileOrder : List String :=
  namedClosedHostModuleCheckEmitBodyTermCompileOrder ++
    ["SystemsLean.HostModuleCheckKernelMultTerm"]

/-- True when the barrel lists each HostModuleCheckKernelMultTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckKernelMultTermSubset. -/
def barrelListsNamedHostModuleCheckKernelMultTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckKernelMultTermSubsetNames

/-- Compile the named HostModuleCheckKernelMultTerm subset after reading
    the live lakefile. Forty-two-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the forty-first compile order, then
    HostModuleCheckKernelMultTerm last.
    Greppable: tryCompileNamedHostModuleCheckKernelMultTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckKernelMultTerm. -/
unsafe def tryCompileNamedHostModuleCheckKernelMultTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckKernelMultTermSubsetNames
    namedClosedHostModuleCheckKernelMultTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckKernelMultTermSubsetIO]
opaque tryCompileNamedHostModuleCheckKernelMultTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckKernelMultTerm subset.
    Greppable: tryCompileNamedHostModuleCheckKernelMultTermSubset. -/
def tryCompileNamedHostModuleCheckKernelMultTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckKernelMultTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the forty-first HostModuleCheckEmitBodyTerm
    compile order (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckKernelMultTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckKernelMultTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckKernelMultTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckEmitBodyTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckKernelMultTermDepsIO]
opaque tryCompileAfterHostModuleCheckKernelMultTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckKernelMultTerm deps.
    Greppable: tryCompileAfterHostModuleCheckKernelMultTermDeps. -/
def tryCompileAfterHostModuleCheckKernelMultTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckKernelMultTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
