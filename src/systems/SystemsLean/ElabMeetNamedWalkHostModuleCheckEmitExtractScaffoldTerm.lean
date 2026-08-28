/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckEmitExtractScaffoldTerm named-walk
  wrappers (CheckersLater-role walk; EmitErasureScaffoldTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, EmitMultScaffoldTerm
  walk, EmitLinearScaffoldTerm walk, EmitTypesScaffoldTerm walk,
  EmitProgramScaffoldTerm walk, EmitGraphScaffoldTerm walk,
  EmitComposeScaffoldTerm walk, and EmitErasureScaffoldTerm walk stay as
  compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior EmitErasureScaffoldTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckEmitErasureScaffoldTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, ParityMultTermProbe,
  ParityLinearTermProbe, ParityTypesTermProbe, ParityProgramTermProbe,
  ParityEmitTermProbe, EmitMultScaffoldTermProbe, EmitLinearScaffoldTermProbe,
  EmitTypesScaffoldTermProbe, EmitProgramScaffoldTermProbe,
  EmitGraphScaffoldTermProbe, EmitComposeScaffoldTermProbe, or
  EmitErasureScaffoldTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckEmitExtractScaffoldTerm.lean.
  Do not skip to HostModuleCheckEmitBannerScaffoldTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckEmitExtractScaffoldTerm wrappers live here:
    findLiveHostModuleCheckEmitExtractScaffoldTermPath,
    namedClosedHostModuleCheckEmitExtractScaffoldTermSubsetNames,
    namedClosedHostModuleCheckEmitExtractScaffoldTermCompileOrder,
    barrelListsNamedHostModuleCheckEmitExtractScaffoldTermSubset,
    tryCompileNamedHostModuleCheckEmitExtractScaffoldTermSubset,
    tryCompileAfterHostModuleCheckEmitExtractScaffoldTermDeps.
    Named membership is the prior EmitErasureScaffoldTerm closed set plus
    HostModuleCheckEmitExtractScaffoldTerm last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Do not open HostImportGraph as a plus-one.
    Compile order is the EmitErasureScaffoldTerm compile order, then
    HostModuleCheckEmitExtractScaffoldTerm last. EmitPlanTerm is a compile
    dependency only (already on the KernelEmitTerm / ParityMultTerm /
    ParityLinearTerm / ParityTypesTerm / ParityProgramTerm /
    ParityEmitTerm / EmitMultScaffoldTerm / EmitLinearScaffoldTerm /
    EmitTypesScaffoldTerm / EmitProgramScaffoldTerm /
    EmitGraphScaffoldTerm / EmitComposeScaffoldTerm /
    EmitErasureScaffoldTerm order), not a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the EmitErasureScaffoldTerm compile order.
    HostModuleCheckEmitExtractScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm (same dispatcher-split honesty as
    HostModuleCheckEmitErasureScaffoldTerm; EmitPlanTerm is compile-dep only).
    Do not plant live HostModuleCheckEmitExtractScaffoldTerm.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    Do not claim 48. Living tip stays 47 of about 206.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckEmitExtractScaffoldTermPath,
  namedClosedHostModuleCheckEmitExtractScaffoldTermSubsetNames,
  namedClosedHostModuleCheckEmitExtractScaffoldTermCompileOrder,
  barrelListsNamedHostModuleCheckEmitExtractScaffoldTermSubset,
  tryCompileNamedHostModuleCheckEmitExtractScaffoldTermSubset,
  tryCompileAfterHostModuleCheckEmitExtractScaffoldTermDeps,
  SystemsLean.HostModuleCheckEmitExtractScaffoldTerm,
  ElabMeetNamedWalkHostModuleCheckEmitExtractScaffoldTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitExtractScaffoldTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitExtractScaffoldTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitExtractScaffoldTerm;
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
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitErasureScaffoldTerm

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckEmitExtractScaffoldTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckEmitExtractScaffoldTermPath. -/
def findLiveHostModuleCheckEmitExtractScaffoldTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckEmitExtractScaffoldTerm"

/-- Named HostModuleCheckEmitExtractScaffoldTerm subset of the live SystemsLean library.
    Membership is the prior EmitErasureScaffoldTerm closed set plus
    HostModuleCheckEmitExtractScaffoldTerm last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckEmitExtractScaffoldTermSubsetNames.
    SystemsLean.HostModuleCheckEmitExtractScaffoldTerm. -/
def namedClosedHostModuleCheckEmitExtractScaffoldTermSubsetNames : List String :=
  namedClosedHostModuleCheckEmitErasureScaffoldTermSubsetNames ++
    ["SystemsLean.HostModuleCheckEmitExtractScaffoldTerm"]

/-- Compile order honors imports: EmitErasureScaffoldTerm compile order, then
    HostModuleCheckEmitExtractScaffoldTerm last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. EmitPlanTerm is a compile dependency only (already on the
    KernelEmitTerm / ParityMultTerm / ParityLinearTerm / ParityTypesTerm /
    ParityProgramTerm / ParityEmitTerm / EmitMultScaffoldTerm /
    EmitLinearScaffoldTerm / EmitTypesScaffoldTerm /
    EmitProgramScaffoldTerm / EmitGraphScaffoldTerm /
    EmitComposeScaffoldTerm / EmitErasureScaffoldTerm order), not a named plus-one.
    Greppable: namedClosedHostModuleCheckEmitExtractScaffoldTermCompileOrder. -/
def namedClosedHostModuleCheckEmitExtractScaffoldTermCompileOrder : List String :=
  namedClosedHostModuleCheckEmitErasureScaffoldTermCompileOrder ++
    ["SystemsLean.HostModuleCheckEmitExtractScaffoldTerm"]

/-- True when the barrel lists each HostModuleCheckEmitExtractScaffoldTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckEmitExtractScaffoldTermSubset. -/
def barrelListsNamedHostModuleCheckEmitExtractScaffoldTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckEmitExtractScaffoldTermSubsetNames

/-- Compile the named HostModuleCheckEmitExtractScaffoldTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the EmitErasureScaffoldTerm
    compile order, then HostModuleCheckEmitExtractScaffoldTerm last.
    Greppable: tryCompileNamedHostModuleCheckEmitExtractScaffoldTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckEmitExtractScaffoldTerm. -/
unsafe def tryCompileNamedHostModuleCheckEmitExtractScaffoldTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckEmitExtractScaffoldTermSubsetNames
    namedClosedHostModuleCheckEmitExtractScaffoldTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckEmitExtractScaffoldTermSubsetIO]
opaque tryCompileNamedHostModuleCheckEmitExtractScaffoldTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckEmitExtractScaffoldTerm subset.
    Greppable: tryCompileNamedHostModuleCheckEmitExtractScaffoldTermSubset. -/
def tryCompileNamedHostModuleCheckEmitExtractScaffoldTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckEmitExtractScaffoldTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the EmitErasureScaffoldTerm compile order
    (including EmitPlanTerm and MultTerm compile deps),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckEmitExtractScaffoldTerm imports HostModuleCheckSurface and
    HostModuleCheckEmitPlanTerm. EmitPlanTerm is not a named member
    this slice. IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckEmitExtractScaffoldTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckEmitExtractScaffoldTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckEmitErasureScaffoldTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckEmitExtractScaffoldTermDepsIO]
opaque tryCompileAfterHostModuleCheckEmitExtractScaffoldTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckEmitExtractScaffoldTerm deps.
    Greppable: tryCompileAfterHostModuleCheckEmitExtractScaffoldTermDeps. -/
def tryCompileAfterHostModuleCheckEmitExtractScaffoldTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckEmitExtractScaffoldTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
