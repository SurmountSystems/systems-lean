/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckEmitErasureScaffoldTerm named-walk
  wrappers (CheckersLater-role walk; EmitComposeScaffoldTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, EmitMultScaffoldTerm
  walk, EmitLinearScaffoldTerm walk, EmitTypesScaffoldTerm walk,
  EmitProgramScaffoldTerm walk, EmitGraphScaffoldTerm walk, and
  EmitComposeScaffoldTerm walk stay as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior EmitComposeScaffoldTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckEmitComposeScaffoldTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, ParityMultTermProbe,
  ParityLinearTermProbe, ParityTypesTermProbe, ParityProgramTermProbe,
  ParityEmitTermProbe, EmitMultScaffoldTermProbe, EmitLinearScaffoldTermProbe,
  EmitTypesScaffoldTermProbe, EmitProgramScaffoldTermProbe,
  EmitGraphScaffoldTermProbe, or EmitComposeScaffoldTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckEmitErasureScaffoldTerm.lean.
  Do not skip to HostModuleCheckEmitExtractScaffoldTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckEmitErasureScaffoldTerm wrappers live here:
    findLiveHostModuleCheckEmitErasureScaffoldTermPath,
    namedClosedHostModuleCheckEmitErasureScaffoldTermSubsetNames,
    namedClosedHostModuleCheckEmitErasureScaffoldTermCompileOrder,
    barrelListsNamedHostModuleCheckEmitErasureScaffoldTermSubset,
    tryCompileNamedHostModuleCheckEmitErasureScaffoldTermSubset,
    tryCompileAfterHostModuleCheckEmitErasureScaffoldTermDeps.
    Named membership is the prior EmitComposeScaffoldTerm closed set plus
    HostModuleCheckEmitErasureScaffoldTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Do not open HostImportGraph as a plus-one.
    Compile order is the EmitComposeScaffoldTerm compile order, then
    HostModuleCheckEmitErasureScaffoldTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm / ParityTypesTerm / ParityProgramTerm /
    ParityEmitTerm / EmitMultScaffoldTerm / EmitLinearScaffoldTerm /
    EmitTypesScaffoldTerm / EmitProgramScaffoldTerm /
    EmitGraphScaffoldTerm / EmitComposeScaffoldTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the EmitComposeScaffoldTerm compile order.
    HostModuleCheckEmitErasureScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckEmitComposeScaffoldTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckEmitErasureScaffoldTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckEmitErasureScaffoldTermPath,
  namedClosedHostModuleCheckEmitErasureScaffoldTermSubsetNames,
  namedClosedHostModuleCheckEmitErasureScaffoldTermCompileOrder,
  barrelListsNamedHostModuleCheckEmitErasureScaffoldTermSubset,
  tryCompileNamedHostModuleCheckEmitErasureScaffoldTermSubset,
  tryCompileAfterHostModuleCheckEmitErasureScaffoldTermDeps,
  SystemsLean.HostModuleCheckEmitErasureScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitErasureScaffoldTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitErasureScaffoldTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitErasureScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitErasureScaffoldTerm;
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
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitComposeScaffoldTerm

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckEmitErasureScaffoldTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckEmitErasureScaffoldTermPath. -/
def findLiveHostModuleCheckEmitErasureScaffoldTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckEmitErasureScaffoldTerm"

/-- Named HostModuleCheckEmitErasureScaffoldTerm subset of the live SystemsLean library.
    Membership is the prior EmitComposeScaffoldTerm closed set plus
    HostModuleCheckEmitErasureScaffoldTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckEmitErasureScaffoldTermSubsetNames.
    SystemsLean.HostModuleCheckEmitErasureScaffoldTerm. -/
def namedClosedHostModuleCheckEmitErasureScaffoldTermSubsetNames : List String :=
  namedClosedHostModuleCheckEmitComposeScaffoldTermSubsetNames ++
    ["SystemsLean.HostModuleCheckEmitErasureScaffoldTerm"]

/-- Compile order honors imports: EmitComposeScaffoldTerm compile order, then
    HostModuleCheckEmitErasureScaffoldTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm / EmitGraphScaffoldTerm /
    EmitComposeScaffoldTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckEmitErasureScaffoldTermCompileOrder. -/
def namedClosedHostModuleCheckEmitErasureScaffoldTermCompileOrder : List String :=
  namedClosedHostModuleCheckEmitComposeScaffoldTermCompileOrder ++
    ["SystemsLean.HostModuleCheckEmitErasureScaffoldTerm"]

/-- True when the barrel lists each HostModuleCheckEmitErasureScaffoldTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckEmitErasureScaffoldTermSubset. -/
def barrelListsNamedHostModuleCheckEmitErasureScaffoldTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckEmitErasureScaffoldTermSubsetNames

/-- Compile the named HostModuleCheckEmitErasureScaffoldTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the EmitComposeScaffoldTerm
    compile order, then HostModuleCheckEmitErasureScaffoldTerm last.
    Greppable: tryCompileNamedHostModuleCheckEmitErasureScaffoldTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckEmitErasureScaffoldTerm. -/
unsafe def tryCompileNamedHostModuleCheckEmitErasureScaffoldTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckEmitErasureScaffoldTermSubsetNames
    namedClosedHostModuleCheckEmitErasureScaffoldTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckEmitErasureScaffoldTermSubsetIO]
opaque tryCompileNamedHostModuleCheckEmitErasureScaffoldTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckEmitErasureScaffoldTerm subset.
    Greppable: tryCompileNamedHostModuleCheckEmitErasureScaffoldTermSubset. -/
def tryCompileNamedHostModuleCheckEmitErasureScaffoldTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckEmitErasureScaffoldTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the EmitComposeScaffoldTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckEmitErasureScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckEmitErasureScaffoldTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckEmitErasureScaffoldTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckEmitComposeScaffoldTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckEmitErasureScaffoldTermDepsIO]
opaque tryCompileAfterHostModuleCheckEmitErasureScaffoldTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckEmitErasureScaffoldTerm deps.
    Greppable: tryCompileAfterHostModuleCheckEmitErasureScaffoldTermDeps. -/
def tryCompileAfterHostModuleCheckEmitErasureScaffoldTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckEmitErasureScaffoldTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
