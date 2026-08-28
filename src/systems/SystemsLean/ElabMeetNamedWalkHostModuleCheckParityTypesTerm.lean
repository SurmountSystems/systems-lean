/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckParityTypesTerm named-walk
  wrappers (CheckersLater-role walk; ParityLinearTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk and ParityLinearTerm walk stay as compile deps.
  Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior ParityLinearTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckParityLinearTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, ParityMultTermProbe,
  or ParityLinearTermProbe. Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckParityTypesTerm.lean.
  Do not skip to HostModuleCheckParityProgramTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckParityTypesTerm wrappers live here:
    findLiveHostModuleCheckParityTypesTermPath,
    namedClosedHostModuleCheckParityTypesTermSubsetNames,
    namedClosedHostModuleCheckParityTypesTermCompileOrder,
    barrelListsNamedHostModuleCheckParityTypesTermSubset,
    tryCompileNamedHostModuleCheckParityTypesTermSubset,
    tryCompileAfterHostModuleCheckParityTypesTermDeps.
    Named membership is the prior ParityLinearTerm closed set plus
    HostModuleCheckParityTypesTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the ParityLinearTerm compile order, then
    HostModuleCheckParityTypesTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm order), not a named plus-one. IrGraph and
    HostCompose are compile dependencies only. After-deps are the
    ParityLinearTerm compile order.
    HostModuleCheckParityTypesTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckParityLinearTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckParityTypesTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47. Living tip stays 46 of about 206 until ParityMult fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckParityTypesTermPath,
  namedClosedHostModuleCheckParityTypesTermSubsetNames,
  namedClosedHostModuleCheckParityTypesTermCompileOrder,
  barrelListsNamedHostModuleCheckParityTypesTermSubset,
  tryCompileNamedHostModuleCheckParityTypesTermSubset,
  tryCompileAfterHostModuleCheckParityTypesTermDeps,
  SystemsLean.HostModuleCheckParityTypesTerm,
  ElabMeetNamedWalkHostModuleCheckParityTypesTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckParityTypesTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckParityTypesTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckParityTypesTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckParityTypesTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckParityTypesTermPath. -/
def findLiveHostModuleCheckParityTypesTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckParityTypesTerm"

/-- Named HostModuleCheckParityTypesTerm subset of the live SystemsLean library.
    Membership is the prior ParityLinearTerm closed set plus
    HostModuleCheckParityTypesTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckParityTypesTermSubsetNames.
    SystemsLean.HostModuleCheckParityTypesTerm. -/
def namedClosedHostModuleCheckParityTypesTermSubsetNames : List String :=
  namedClosedHostModuleCheckParityLinearTermSubsetNames ++
    ["SystemsLean.HostModuleCheckParityTypesTerm"]

/-- Compile order honors imports: ParityLinearTerm compile order, then
    HostModuleCheckParityTypesTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm order), not a
    named plus-one.
    Greppable: namedClosedHostModuleCheckParityTypesTermCompileOrder. -/
def namedClosedHostModuleCheckParityTypesTermCompileOrder : List String :=
  namedClosedHostModuleCheckParityLinearTermCompileOrder ++
    ["SystemsLean.HostModuleCheckParityTypesTerm"]

/-- True when the barrel lists each HostModuleCheckParityTypesTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckParityTypesTermSubset. -/
def barrelListsNamedHostModuleCheckParityTypesTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckParityTypesTermSubsetNames

/-- Compile the named HostModuleCheckParityTypesTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the ParityLinearTerm
    compile order, then HostModuleCheckParityTypesTerm last.
    Greppable: tryCompileNamedHostModuleCheckParityTypesTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckParityTypesTerm. -/
unsafe def tryCompileNamedHostModuleCheckParityTypesTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckParityTypesTermSubsetNames
    namedClosedHostModuleCheckParityTypesTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckParityTypesTermSubsetIO]
opaque tryCompileNamedHostModuleCheckParityTypesTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckParityTypesTerm subset.
    Greppable: tryCompileNamedHostModuleCheckParityTypesTermSubset. -/
def tryCompileNamedHostModuleCheckParityTypesTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckParityTypesTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the ParityLinearTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckParityTypesTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckParityTypesTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckParityTypesTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckParityLinearTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckParityTypesTermDepsIO]
opaque tryCompileAfterHostModuleCheckParityTypesTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckParityTypesTerm deps.
    Greppable: tryCompileAfterHostModuleCheckParityTypesTermDeps. -/
def tryCompileAfterHostModuleCheckParityTypesTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckParityTypesTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
