/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheckLlvmTypesTextTerm named-walk
  wrappers (CheckersLater-role walk; SubsetPackageJoinTerm walk is the prior
  closed set).
  ParityMultTerm walk, ParityLinearTerm walk, ParityTypesTerm walk,
  ParityProgramTerm walk, ParityEmitTerm walk, EmitMultScaffoldTerm
  walk, EmitLinearScaffoldTerm walk, EmitTypesScaffoldTerm walk,
  EmitProgramScaffoldTerm walk, EmitGraphScaffoldTerm walk,
  EmitComposeScaffoldTerm walk, EmitErasureScaffoldTerm walk,
  EmitExtractScaffoldTerm walk, EmitBannerScaffoldTerm walk,
  KernelSelfApplyTerm walk, ProductOutKernelTerm walk,
  CompilePathTerm walk, JoinMapTerm walk, SelfHostTerm walk,
  SurfaceMatrixTerm walk, SpecProofTerm walk, DualResidualTerm
  walk, CompilePathMultTerm walk, CompilePathLinearTerm walk,
  CompilePathTypesTerm walk, CompilePathProgramTerm walk,
  CompilePathGraphTerm walk, CompilePathComposeTerm walk,
  CompilePathErasureTerm walk, CompilePathExtractTerm walk,
  CompilePathPlanTerm walk, CompilePathApplyTerm walk,
  CompilePathBodyTerm walk, FirstSurfaceTerm walk,
  LinearSubsetEmitTerm walk, TypesSubsetEmitTerm walk,
  ProgramSubsetEmitTerm walk, GraphSubsetEmitTerm walk,
  ComposeSubsetEmitTerm walk, ErasureSubsetEmitTerm walk,
  ExtractSubsetEmitTerm walk, MultSubsetEmitTerm walk,
  MultSubsetRebuildTerm walk, LinearSubsetRebuildTerm walk,
  TypesSubsetRebuildTerm walk,
  GraphSubsetRebuildTerm walk, and SubsetPackageJoinTerm walk
  stay as compile deps. Do not dump onto those.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostModuleCheckCheckersLater
  does not gain these wrappers. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. Prior SubsetPackageJoinTerm wrappers stay in
  ElabMeetNamedWalkHostModuleCheckSubsetPackageJoinTerm. Do not grow that walk.
  Reuses tryCompileNamedMemberListIO (no cloned walker).
  Do not dump these wrappers onto CheckersLater, Tail, Later,
  HostTerm, Emit walk, RealModuleProbe, EmitBodyTermProbe,
  KernelMultTermProbe, KernelLinearTermProbe, KernelTypesTermProbe,
  KernelProgramTermProbe, KernelEmitTermProbe, ParityMultTermProbe,
  ParityLinearTermProbe, ParityTypesTermProbe, ParityProgramTermProbe,
  ParityEmitTermProbe, EmitMultScaffoldTermProbe, EmitLinearScaffoldTermProbe,
  EmitTypesScaffoldTermProbe, EmitProgramScaffoldTermProbe,
  EmitGraphScaffoldTermProbe, EmitComposeScaffoldTermProbe,
  EmitErasureScaffoldTermProbe, EmitExtractScaffoldTermProbe,
  EmitBannerScaffoldTermProbe, KernelSelfApplyTermProbe,
  ProductOutKernelTermProbe, CompilePathTermProbe, JoinMapTermProbe,
  SelfHostTermProbe, SurfaceMatrixTermProbe, SpecProofTermProbe,
  DualResidualTermProbe, CompilePathMultTermProbe,
  CompilePathLinearTermProbe, CompilePathTypesTermProbe,
  CompilePathProgramTermProbe, CompilePathGraphTermProbe,
  CompilePathComposeTermProbe, CompilePathErasureTermProbe,
  CompilePathExtractTermProbe, CompilePathPlanTermProbe,
  CompilePathApplyTermProbe, CompilePathBodyTermProbe,
  FirstSurfaceTermProbe, LinearSubsetEmitTermProbe,
  TypesSubsetEmitTermProbe, ProgramSubsetEmitTermProbe,
  GraphSubsetEmitTermProbe, ComposeSubsetEmitTermProbe,
  ErasureSubsetEmitTermProbe, ExtractSubsetEmitTermProbe,
  MultSubsetEmitTermProbe, MultSubsetRebuildTermProbe,
  LinearSubsetRebuildTermProbe, TypesSubsetRebuildTermProbe,
  ProgramSubsetRebuildTermProbe, GraphSubsetRebuildTermProbe, or
  SubsetPackageJoinTermProbe.
  Do not grow ElabMeetCompile.
  Do not plant live HostModuleCheckLlvmTypesTextTerm.lean.
  Do not skip to HostModuleCheckMultFsDeepenTerm.
  This extract does not fold.

  Spec (readable):
  - HostModuleCheckLlvmTypesTextTerm wrappers live here:
    findLiveHostModuleCheckLlvmTypesTextTermPath,
    namedClosedHostModuleCheckLlvmTypesTextTermSubsetNames,
    namedClosedHostModuleCheckLlvmTypesTextTermCompileOrder,
    barrelListsNamedHostModuleCheckLlvmTypesTextTermSubset,
    tryCompileNamedHostModuleCheckLlvmTypesTextTermSubset,
    tryCompileAfterHostModuleCheckLlvmTypesTextTermDeps.
    Named membership is the prior SubsetPackageJoinTerm closed set plus
    HostModuleCheckLlvmTypesTextTerm last. Compile order is the
    SubsetPackageJoinTerm compile order, then
    HostModuleCheckLlvmTypesTextTerm last.
    After-deps are the SubsetPackageJoinTerm compile order.
    Do not plant live HostModuleCheckLlvmTypesTextTerm.lean.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostModuleCheckLlvmTypesTextTermPath,
  namedClosedHostModuleCheckLlvmTypesTextTermSubsetNames,
  namedClosedHostModuleCheckLlvmTypesTextTermCompileOrder,
  barrelListsNamedHostModuleCheckLlvmTypesTextTermSubset,
  tryCompileNamedHostModuleCheckLlvmTypesTextTermSubset,
  tryCompileAfterHostModuleCheckLlvmTypesTextTermDeps,
  SystemsLean.HostModuleCheckLlvmTypesTextTerm,
  ElabMeetNamedWalkHostModuleCheckLlvmTypesTextTerm,
  SystemsLean.ElabMeetNamedWalkHostModuleCheckLlvmTypesTextTerm,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostModuleCheckLlvmTypesTextTerm
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostModuleCheckLlvmTypesTextTerm;
  just systems-host.
  Module must stay ASCII.
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
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitExtractScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckEmitBannerScaffoldTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckKernelSelfApplyTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckProductOutKernelTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckJoinMapTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckSelfHostTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckSurfaceMatrixTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckSpecProofTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckDualResidualTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathMultTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathLinearTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathTypesTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathProgramTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathGraphTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathComposeTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathErasureTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathExtractTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathPlanTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathApplyTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckCompilePathBodyTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckFirstSurfaceTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckLinearSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckTypesSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckProgramSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckGraphSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckComposeSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckErasureSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckExtractSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckMultSubsetEmitTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckMultSubsetRebuildTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckLinearSubsetRebuildTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckTypesSubsetRebuildTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckGraphSubsetRebuildTerm
import SystemsLean.ElabMeetNamedWalkHostModuleCheckSubsetPackageJoinTerm

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostModuleCheckLlvmTypesTextTerm.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostModuleCheckLlvmTypesTextTermPath. -/
def findLiveHostModuleCheckLlvmTypesTextTermPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostModuleCheckLlvmTypesTextTerm"

/-- Named HostModuleCheckLlvmTypesTextTerm subset of the live SystemsLean library.
    Membership is the prior SubsetPackageJoinTerm closed set plus
    HostModuleCheckLlvmTypesTextTerm last.
    Greppable: namedClosedHostModuleCheckLlvmTypesTextTermSubsetNames.
    SystemsLean.HostModuleCheckLlvmTypesTextTerm. -/
def namedClosedHostModuleCheckLlvmTypesTextTermSubsetNames : List String :=
  namedClosedHostModuleCheckSubsetPackageJoinTermSubsetNames ++
    ["SystemsLean.HostModuleCheckLlvmTypesTextTerm"]

/-- Compile order is the SubsetPackageJoinTerm compile order, then
    HostModuleCheckLlvmTypesTextTerm last.
    Greppable: namedClosedHostModuleCheckLlvmTypesTextTermCompileOrder. -/
def namedClosedHostModuleCheckLlvmTypesTextTermCompileOrder : List String :=
  namedClosedHostModuleCheckSubsetPackageJoinTermCompileOrder ++
    ["SystemsLean.HostModuleCheckLlvmTypesTextTerm"]

/-- True when the barrel lists each HostModuleCheckLlvmTypesTextTerm subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostModuleCheckLlvmTypesTextTermSubset. -/
def barrelListsNamedHostModuleCheckLlvmTypesTextTermSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostModuleCheckLlvmTypesTextTermSubsetNames

/-- Compile the named HostModuleCheckLlvmTypesTextTerm subset after reading
    the live lakefile. Wrapper over tryCompileNamedMemberListIO.
    Passes the subset names and the compile order: SubsetPackageJoinTerm
    compile order, then HostModuleCheckLlvmTypesTextTerm last.
    Greppable: tryCompileNamedHostModuleCheckLlvmTypesTextTermSubset.
    tryCompileOnDiskModule. SystemsLean.HostModuleCheckLlvmTypesTextTerm. -/
unsafe def tryCompileNamedHostModuleCheckLlvmTypesTextTermSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostModuleCheckLlvmTypesTextTermSubsetNames
    namedClosedHostModuleCheckLlvmTypesTextTermCompileOrder

@[implemented_by tryCompileNamedHostModuleCheckLlvmTypesTextTermSubsetIO]
opaque tryCompileNamedHostModuleCheckLlvmTypesTextTermSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostModuleCheckLlvmTypesTextTerm subset.
    Greppable: tryCompileNamedHostModuleCheckLlvmTypesTextTermSubset. -/
def tryCompileNamedHostModuleCheckLlvmTypesTextTermSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostModuleCheckLlvmTypesTextTermSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile srcPath as thmMod after namedClosedHostModuleCheckSubsetPackageJoinTermCompileOrder.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostModuleCheckLlvmTypesTextTermDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostModuleCheckLlvmTypesTextTermDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    namedClosedHostModuleCheckSubsetPackageJoinTermCompileOrder

@[implemented_by tryCompileAfterHostModuleCheckLlvmTypesTextTermDepsIO]
opaque tryCompileAfterHostModuleCheckLlvmTypesTextTermDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostModuleCheckLlvmTypesTextTerm deps.
    Greppable: tryCompileAfterHostModuleCheckLlvmTypesTextTermDeps. -/
def tryCompileAfterHostModuleCheckLlvmTypesTextTermDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostModuleCheckLlvmTypesTextTermDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
