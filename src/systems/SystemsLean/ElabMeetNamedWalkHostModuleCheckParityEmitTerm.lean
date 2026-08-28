/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckParityEmitTerm named-walk
  wrappers (CheckersLater-role walk; ParityProgramTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk, and
  ParityProgramTerm walk stay as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior ParityProgramTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckParityProgramTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, ParityMultTermProbe,
  ParityLinearTermProbe, ParityTypesTermProbe, or ParityProgramTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckParityEmitTerm.lean.
  Do not skip to HostModuleCheckEmitMultScaffoldTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckParityEmitTerm wrappers live here:
    findLiveHostModuleCheckParityEmitTermPath,
    namedClosedHostModuleCheckParityEmitTermSubsetNames,
    namedClosedHostModuleCheckParityEmitTermCompileOrder,
    barrelListsNamedHostModuleCheckParityEmitTermSubset,
    tryCompileNamedHostModuleCheckParityEmitTermSubset,
    tryCompileAfterHostModuleCheckParityEmitTermDeps.
    Named membership is the prior ParityProgramTerm closed set plus
    HostModuleCheckParityEmitTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain.
    Compile order is the ParityProgramTerm compile order, then
    HostModuleCheckParityEmitTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm / ParityTypesTerm / ParityProgramTerm order), not a
    named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the ParityProgramTerm compile order.
    HostModuleCheckParityEmitTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckParityProgramTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckParityEmitTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 47. Living tip stays 46 of about 206 until ParityMult fold.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckParityEmitTermPath,
  namedClosedHostModuleCheckParityEmitTermSubsetNames,
  namedClosedHostModuleCheckParityEmitTermCompileOrder,
  barrelListsNamedHostModuleCheckParityEmitTermSubset,
  tryCompileNamedHostModuleCheckParityEmitTermSubset,
  tryCompileAfterHostModuleCheckParityEmitTermDeps,
  SystemsLean.HostModuleCheckParityEmitTerm,
  ElabMeetNamedWalkHostModuleCheckParityEmitTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckParityEmitTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckParityEmitTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckParityEmitTerm;
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

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckParityEmitTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckParityEmitTermPath. -/
def findLiveHostModuleCheckParityEmitTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckParityEmitTerm"

/-- Named HostModuleCheckParityEmitTerm subset of the live SystemsLean library.
    Membership is the prior ParityProgramTerm closed set plus
    HostModuleCheckParityEmitTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain. Compile order holds the subset-surface closure.
    Greppable: namedClosedHostModuleCheckParityEmitTermSubsetNames.
    SystemsLean.HostModuleCheckParityEmitTerm. -/
def namedClosedHostModuleCheckParityEmitTermSubsetNames : List String :=
  namedClosedHostModuleCheckParityProgramTermSubsetNames ++
    ["SystemsLean.HostModuleCheckParityEmitTerm"]

/-- Compile order honors imports: ParityProgramTerm compile order, then
    HostModuleCheckParityEmitTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckParityEmitTermCompileOrder. -/
def namedClosedHostModuleCheckParityEmitTermCompileOrder : List String :=
  namedClosedHostModuleCheckParityProgramTermCompileOrder ++
    ["SystemsLean.HostModuleCheckParityEmitTerm"]

/-- True when the barrel lists each HostModuleCheckParityEmitTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckParityEmitTermSubset. -/
def barrelListsNamedHostModuleCheckParityEmitTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckParityEmitTermSubsetNames

/-- Compile the named HostModuleCheckParityEmitTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the ParityProgramTerm
    compile order, then HostModuleCheckParityEmitTerm last.
    Greppable: tryCompileNamedHostModuleCheckParityEmitTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckParityEmitTerm. -/
unsafe def tryCompileNamedHostModuleCheckParityEmitTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckParityEmitTermSubsetNames
    namedClosedHostModuleCheckParityEmitTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckParityEmitTermSubsetIO]
opaque tryCompileNamedHostModuleCheckParityEmitTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckParityEmitTerm subset.
    Greppable: tryCompileNamedHostModuleCheckParityEmitTermSubset. -/
def tryCompileNamedHostModuleCheckParityEmitTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckParityEmitTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the ParityProgramTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckParityEmitTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckParityEmitTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckParityEmitTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckParityProgramTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckParityEmitTermDepsIO]
opaque tryCompileAfterHostModuleCheckParityEmitTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckParityEmitTerm deps.
    Greppable: tryCompileAfterHostModuleCheckParityEmitTermDeps. -/
def tryCompileAfterHostModuleCheckParityEmitTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckParityEmitTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
