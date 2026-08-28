/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckEmitComposeScaffoldTerm named-walk
  wrappers (CheckersLater-role walk; EmitGraphScaffoldTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, EmitMultScaffoldTerm
  walk, EmitLinearScaffoldTerm walk, EmitTypesScaffoldTerm walk,
  EmitProgramScaffoldTerm walk, and EmitGraphScaffoldTerm walk stay as
  compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior EmitGraphScaffoldTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckEmitGraphScaffoldTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, ParityMultTermProbe,
  ParityLinearTermProbe, ParityTypesTermProbe, ParityProgramTermProbe,
  ParityEmitTermProbe, EmitMultScaffoldTermProbe, EmitLinearScaffoldTermProbe,
  EmitTypesScaffoldTermProbe, EmitProgramScaffoldTermProbe, or
  EmitGraphScaffoldTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckEmitComposeScaffoldTerm.lean.
  Do not skip to HostModuleCheckEmitErasureScaffoldTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckEmitComposeScaffoldTerm wrappers live here:
    findLiveHostModuleCheckEmitComposeScaffoldTermPath,
    namedClosedHostModuleCheckEmitComposeScaffoldTermSubsetNames,
    namedClosedHostModuleCheckEmitComposeScaffoldTermCompileOrder,
    barrelListsNamedHostModuleCheckEmitComposeScaffoldTermSubset,
    tryCompileNamedHostModuleCheckEmitComposeScaffoldTermSubset,
    tryCompileAfterHostModuleCheckEmitComposeScaffoldTermDeps.
    Named membership is the prior EmitGraphScaffoldTerm closed set plus
    HostModuleCheckEmitComposeScaffoldTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Do not open HostImportGraph as a plus-one.
    Compile order is the EmitGraphScaffoldTerm compile order, then
    HostModuleCheckEmitComposeScaffoldTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm / ParityTypesTerm / ParityProgramTerm /
    ParityEmitTerm / EmitMultScaffoldTerm / EmitLinearScaffoldTerm /
    EmitTypesScaffoldTerm / EmitProgramScaffoldTerm /
    EmitGraphScaffoldTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the EmitGraphScaffoldTerm compile order.
    HostModuleCheckEmitComposeScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckEmitGraphScaffoldTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckEmitComposeScaffoldTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckEmitComposeScaffoldTermPath,
  namedClosedHostModuleCheckEmitComposeScaffoldTermSubsetNames,
  namedClosedHostModuleCheckEmitComposeScaffoldTermCompileOrder,
  barrelListsNamedHostModuleCheckEmitComposeScaffoldTermSubset,
  tryCompileNamedHostModuleCheckEmitComposeScaffoldTermSubset,
  tryCompileAfterHostModuleCheckEmitComposeScaffoldTermDeps,
  SystemsLean.HostModuleCheckEmitComposeScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitComposeScaffoldTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitComposeScaffoldTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitComposeScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitComposeScaffoldTerm;
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
import SystemsLean.ElabMeetNamedWalkHostModuleCheckParityEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitMultScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitLinearScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitTypesScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitProgramScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitGraphScaffoldTerm

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckEmitComposeScaffoldTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckEmitComposeScaffoldTermPath. -/
def findLiveHostModuleCheckEmitComposeScaffoldTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckEmitComposeScaffoldTerm"

/-- Named HostModuleCheckEmitComposeScaffoldTerm subset of the live SystemsLean library.
    Membership is the prior EmitGraphScaffoldTerm closed set plus
    HostModuleCheckEmitComposeScaffoldTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckEmitComposeScaffoldTermSubsetNames.
    SystemsLean.HostModuleCheckEmitComposeScaffoldTerm. -/
def namedClosedHostModuleCheckEmitComposeScaffoldTermSubsetNames : List String :=
  namedClosedHostModuleCheckEmitGraphScaffoldTermSubsetNames ++
    ["SystemsLean.HostModuleCheckEmitComposeScaffoldTerm"]

/-- Compile order honors imports: EmitGraphScaffoldTerm compile order, then
    HostModuleCheckEmitComposeScaffoldTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm / EmitGraphScaffoldTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckEmitComposeScaffoldTermCompileOrder. -/
def namedClosedHostModuleCheckEmitComposeScaffoldTermCompileOrder : List String :=
  namedClosedHostModuleCheckEmitGraphScaffoldTermCompileOrder ++
    ["SystemsLean.HostModuleCheckEmitComposeScaffoldTerm"]

/-- True when the barrel lists each HostModuleCheckEmitComposeScaffoldTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckEmitComposeScaffoldTermSubset. -/
def barrelListsNamedHostModuleCheckEmitComposeScaffoldTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckEmitComposeScaffoldTermSubsetNames

/-- Compile the named HostModuleCheckEmitComposeScaffoldTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the EmitGraphScaffoldTerm
    compile order, then HostModuleCheckEmitComposeScaffoldTerm last.
    Greppable: tryCompileNamedHostModuleCheckEmitComposeScaffoldTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckEmitComposeScaffoldTerm. -/
unsafe def tryCompileNamedHostModuleCheckEmitComposeScaffoldTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckEmitComposeScaffoldTermSubsetNames
    namedClosedHostModuleCheckEmitComposeScaffoldTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckEmitComposeScaffoldTermSubsetIO]
opaque tryCompileNamedHostModuleCheckEmitComposeScaffoldTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckEmitComposeScaffoldTerm subset.
    Greppable: tryCompileNamedHostModuleCheckEmitComposeScaffoldTermSubset. -/
def tryCompileNamedHostModuleCheckEmitComposeScaffoldTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckEmitComposeScaffoldTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the EmitGraphScaffoldTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckEmitComposeScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckEmitComposeScaffoldTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckEmitComposeScaffoldTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckEmitGraphScaffoldTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckEmitComposeScaffoldTermDepsIO]
opaque tryCompileAfterHostModuleCheckEmitComposeScaffoldTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckEmitComposeScaffoldTerm deps.
    Greppable: tryCompileAfterHostModuleCheckEmitComposeScaffoldTermDeps. -/
def tryCompileAfterHostModuleCheckEmitComposeScaffoldTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckEmitComposeScaffoldTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
