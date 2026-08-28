/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckParityProgramTerm named-walk
  wrappers (CheckersLater-role walk; ParityTypesTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, and ParityTypesTerm walk
  stay as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior ParityTypesTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckParityTypesTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, ParityMultTermProbe,
  ParityLinearTermProbe, or ParityTypesTermProbe. Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckParityProgramTerm.lean.
  Do not skip to HostModuleCheckParityEmitTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckParityProgramTerm wrappers live here:
    findLiveHostModuleCheckParityProgramTermPath,
    namedClosedHostModuleCheckParityProgramTermSubsetNames,
    namedClosedHostModuleCheckParityProgramTermCompileOrder,
    barrelListsNamedHostModuleCheckParityProgramTermSubset,
    tryCompileNamedHostModuleCheckParityProgramTermSubset,
    tryCompileAfterHostModuleCheckParityProgramTermDeps.
    Named membership is the prior ParityTypesTerm closed set plus
    HostModuleCheckParityProgramTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the ParityTypesTerm compile order, then
    HostModuleCheckParityProgramTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm / ParityTypesTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the ParityTypesTerm compile order.
    HostModuleCheckParityProgramTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckParityTypesTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckParityProgramTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47. Living tip stays 46 of about 206 until ParityMult fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckParityProgramTermPath,
  namedClosedHostModuleCheckParityProgramTermSubsetNames,
  namedClosedHostModuleCheckParityProgramTermCompileOrder,
  barrelListsNamedHostModuleCheckParityProgramTermSubset,
  tryCompileNamedHostModuleCheckParityProgramTermSubset,
  tryCompileAfterHostModuleCheckParityProgramTermDeps,
  SystemsLean.HostModuleCheckParityProgramTerm,
  ElabMeetNamedWalkHostModuleCheckParityProgramTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckParityProgramTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckParityProgramTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckParityProgramTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckParityProgramTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckParityProgramTermPath. -/
def findLiveHostModuleCheckParityProgramTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckParityProgramTerm"

/-- Named HostModuleCheckParityProgramTerm subset of the live SystemsLean library.
    Membership is the prior ParityTypesTerm closed set plus
    HostModuleCheckParityProgramTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckParityProgramTermSubsetNames.
    SystemsLean.HostModuleCheckParityProgramTerm. -/
def namedClosedHostModuleCheckParityProgramTermSubsetNames : List String :=
  namedClosedHostModuleCheckParityTypesTermSubsetNames ++
    ["SystemsLean.HostModuleCheckParityProgramTerm"]

/-- Compile order honors imports: ParityTypesTerm compile order, then
    HostModuleCheckParityProgramTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm
    order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckParityProgramTermCompileOrder. -/
def namedClosedHostModuleCheckParityProgramTermCompileOrder : List String :=
  namedClosedHostModuleCheckParityTypesTermCompileOrder ++
    ["SystemsLean.HostModuleCheckParityProgramTerm"]

/-- True when the barrel lists each HostModuleCheckParityProgramTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckParityProgramTermSubset. -/
def barrelListsNamedHostModuleCheckParityProgramTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckParityProgramTermSubsetNames

/-- Compile the named HostModuleCheckParityProgramTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the ParityTypesTerm
    compile order, then HostModuleCheckParityProgramTerm last.
    Greppable: tryCompileNamedHostModuleCheckParityProgramTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckParityProgramTerm. -/
unsafe def tryCompileNamedHostModuleCheckParityProgramTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckParityProgramTermSubsetNames
    namedClosedHostModuleCheckParityProgramTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckParityProgramTermSubsetIO]
opaque tryCompileNamedHostModuleCheckParityProgramTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckParityProgramTerm subset.
    Greppable: tryCompileNamedHostModuleCheckParityProgramTermSubset. -/
def tryCompileNamedHostModuleCheckParityProgramTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckParityProgramTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the ParityTypesTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckParityProgramTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckParityProgramTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckParityProgramTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckParityTypesTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckParityProgramTermDepsIO]
opaque tryCompileAfterHostModuleCheckParityProgramTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckParityProgramTerm deps.
    Greppable: tryCompileAfterHostModuleCheckParityProgramTermDeps. -/
def tryCompileAfterHostModuleCheckParityProgramTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckParityProgramTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
