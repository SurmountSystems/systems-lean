/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckLoadOkCompilePathUnits named-walk
  wrappers (CheckersLater-role walk; SelfHostBodyTerm walk is the prior
  closed set). CheckersLater walk is 617; Tail is 863; Later is 785;
  SelfHostBodyTerm walk stays as compile dep. Do not dump onto that walk.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  stays 617 and under about 780. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior SelfHostBodyTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckSelfHostBodyTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, ParityMultTermProbe,
  ParityLinearTermProbe, ParityTypesTermProbe, ParityProgramTermProbe,
  ParityEmitTermProbe, ProbeWireTermProbe, SelfHostBodyTermProbe, or
  SelfHostBodyTerm walk. Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckLoadOkCompilePathUnits.lean.
  Do not skip to HostModuleCheckLoadOkLaterTerm.
  Rec-depth 8192 keep on later ElabMeet fold; this extract does not fold.

  Spec (readable):
  - HostModuleCheckLoadOkCompilePathUnits wrappers live here:
    findLiveHostModuleCheckLoadOkCompilePathUnitsPath,
    namedClosedHostModuleCheckLoadOkCompilePathUnitsSubsetNames,
    namedClosedHostModuleCheckLoadOkCompilePathUnitsCompileOrder,
    barrelListsNamedHostModuleCheckLoadOkCompilePathUnitsSubset,
    tryCompileNamedHostModuleCheckLoadOkCompilePathUnitsSubset,
    tryCompileAfterHostModuleCheckLoadOkCompilePathUnitsDeps.
    Named membership is the prior SelfHostBodyTerm closed set plus
    HostModuleCheckLoadOkCompilePathUnits last. Barrel order among that
    closed set; skip Linear, skip IrGraph, skip HostGraphMain,
    skip HostCompose. Compile order is the SelfHostBodyTerm compile
    order, then HostModuleCheckLoadOkCompilePathUnits last.
    First import of the product module is
    HostModuleCheckCompilePathMultTerm. CompilePath Linear / Types /
    Program / Graph / Compose / Erasure / Extract / Plan / Apply / Body
    TERM modules are already named members of the SelfHostBodyTerm
    closed set, not extra plus-ones. Linear skipped as a named plus-one.
    IrGraph and HostCompose are compile dependencies only. After-deps
    are the SelfHostBodyTerm compile order.
    Do not plant live HostModuleCheckLoadOkCompilePathUnits.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.
    This extract does not fold. Do not claim a new named-subset count.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckLoadOkCompilePathUnitsPath,
  namedClosedHostModuleCheckLoadOkCompilePathUnitsSubsetNames,
  namedClosedHostModuleCheckLoadOkCompilePathUnitsCompileOrder,
  barrelListsNamedHostModuleCheckLoadOkCompilePathUnitsSubset,
  tryCompileNamedHostModuleCheckLoadOkCompilePathUnitsSubset,
  tryCompileAfterHostModuleCheckLoadOkCompilePathUnitsDeps,
  SystemsLean.HostModuleCheckLoadOkCompilePathUnits,
  ElabMeetNamedWalkHostModuleCheckLoadOkCompilePathUnits,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckLoadOkCompilePathUnits,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckLoadOkCompilePathUnits
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckLoadOkCompilePathUnits;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHost. Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetLive
import SystemsLean.ElabMeetNamedWalk
import SystemsLean.ElabMeetNamedWalkHostModuleCheckSelfHostBodyTerm

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckLoadOkCompilePathUnits.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckLoadOkCompilePathUnitsPath. -/
def findLiveHostModuleCheckLoadOkCompilePathUnitsPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckLoadOkCompilePathUnits"

/-- Named HostModuleCheckLoadOkCompilePathUnits subset of the live SystemsLean library.
    Membership is the prior SelfHostBodyTerm closed set plus
    HostModuleCheckLoadOkCompilePathUnits last.
    Barrel order among that closed set; skip Linear, skip IrGraph,
    skip HostGraphMain, skip HostCompose. Compile order holds the
    subset-surface closure.
    Greppable: namedClosedHostModuleCheckLoadOkCompilePathUnitsSubsetNames.
    SystemsLean.HostModuleCheckLoadOkCompilePathUnits. -/
def namedClosedHostModuleCheckLoadOkCompilePathUnitsSubsetNames : List String :=
  namedClosedHostModuleCheckSelfHostBodyTermSubsetNames ++
    ["SystemsLean.HostModuleCheckLoadOkCompilePathUnits"]

/-- Compile order honors imports: SelfHostBodyTerm compile order, then
    HostModuleCheckLoadOkCompilePathUnits last. IrGraph and HostCompose are
    compile dependencies only. Mult first. Membership list vs compile
    order. First import is HostModuleCheckCompilePathMultTerm.
    CompilePath Linear / Types / Program / Graph / Compose / Erasure /
    Extract / Plan / Apply / Body TERM modules are already named members
    of the SelfHostBodyTerm closed set, not extra plus-ones.
    Greppable: namedClosedHostModuleCheckLoadOkCompilePathUnitsCompileOrder. -/
def namedClosedHostModuleCheckLoadOkCompilePathUnitsCompileOrder : List String :=
  namedClosedHostModuleCheckSelfHostBodyTermCompileOrder ++
    ["SystemsLean.HostModuleCheckLoadOkCompilePathUnits"]

/-- True when the barrel lists each HostModuleCheckLoadOkCompilePathUnits subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckLoadOkCompilePathUnitsSubset. -/
def barrelListsNamedHostModuleCheckLoadOkCompilePathUnitsSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckLoadOkCompilePathUnitsSubsetNames

/-- Compile the named HostModuleCheckLoadOkCompilePathUnits subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Compile order honors imports: Mult first, then the SelfHostBodyTerm
    compile order, then HostModuleCheckLoadOkCompilePathUnits last.
    Greppable: tryCompileNamedHostModuleCheckLoadOkCompilePathUnitsSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckLoadOkCompilePathUnits. -/
unsafe def tryCompileNamedHostModuleCheckLoadOkCompilePathUnitsSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckLoadOkCompilePathUnitsSubsetNames
    namedClosedHostModuleCheckLoadOkCompilePathUnitsCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckLoadOkCompilePathUnitsSubsetIO]
opaque tryCompileNamedHostModuleCheckLoadOkCompilePathUnitsSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckLoadOkCompilePathUnits subset.
    Greppable: tryCompileNamedHostModuleCheckLoadOkCompilePathUnitsSubset. -/
def tryCompileNamedHostModuleCheckLoadOkCompilePathUnitsSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckLoadOkCompilePathUnitsSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then the SelfHostBodyTerm compile order
    (including CompilePath TERM members already on that order),
    put those .olean files on the search path, then compile srcPath
    as thmMod.
    HostModuleCheckLoadOkCompilePathUnits first import is
    HostModuleCheckCompilePathMultTerm. CompilePath Linear / Types /
    Program / Graph / Compose / Erasure / Extract / Plan / Apply / Body
    TERM modules are already named members. IrGraph and HostCompose are
    compile dependencies only. Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckLoadOkCompilePathUnitsDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckLoadOkCompilePathUnitsDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckSelfHostBodyTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckLoadOkCompilePathUnitsDepsIO]
opaque tryCompileAfterHostModuleCheckLoadOkCompilePathUnitsDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckLoadOkCompilePathUnits deps.
    Greppable: tryCompileAfterHostModuleCheckLoadOkCompilePathUnitsDeps. -/
def tryCompileAfterHostModuleCheckLoadOkCompilePathUnitsDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckLoadOkCompilePathUnitsDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
