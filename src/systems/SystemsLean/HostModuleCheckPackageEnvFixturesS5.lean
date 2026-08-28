/-
  SYSTEMS_LEAN_HOST partial -- Package elaborate L4 S5 env fixtures.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: E-good S5 map modules + E-bad PE39..PE42 texts for
  CompilePath + JoinMap + SelfHost + SurfaceMatrix (after Mult..ParityEmit + U2),
  plus S6 PE43/PE44 leftover SpecProof + DualResidual, plus S8 PE45..PE52 CompilePath
  unit TERM (CompilePathMult through CompilePathExtract), plus S9 PE53..PE55
  CompilePath Plan / Apply / Body unit TERM, plus S10 PE56 FirstSurface unit TERM,
  plus S11 PE57 LinearSubsetEmit unit TERM, plus S12 PE58 TypesSubsetEmit
  unit TERM, plus S13 PE59 ProgramSubsetEmit unit TERM, plus S14 PE60
  GraphSubsetEmit unit TERM, plus S15 PE61 ComposeSubsetEmit unit TERM,
  plus S16 PE62 ErasureSubsetEmit unit TERM. S17 PE63 ExtractSubsetEmit
  fixtures live in HostModuleCheckPackageEnvFixturesLater.
  Shared Mult..ParityEmit builders stay in HostModuleCheckPackageEnvFixtures;
  U2 Emit*Scaffold goods stay in HostModuleCheckPackageEnvFixturesU2.
  Same namespace SystemsLean.HostModuleCheck.

  Intentional non-claims:
  - Not package L4 complete. Not seed-wide J1-J12. Not FullHostElaborateRemains.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckPackageEnvFixturesS5, PACKAGE-ELABORATE,
  MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only,
  packageEnvS5MapsModulesGood,
  hostModuleCheckGoodPackageEnvS5Text,
  hostModuleCheckBadPackageEnvIllTypedCompilePathText,
  hostModuleCheckBadPackageEnvIllTypedJoinMapText,
  hostModuleCheckBadPackageEnvIllTypedSelfHostText,
  hostModuleCheckBadPackageEnvIllTypedSurfaceMatrixText,
  hostModuleCheckGoodPackageEnvS6Text,
  hostModuleCheckBadPackageEnvIllTypedSpecProofText,
  hostModuleCheckBadPackageEnvIllTypedSpecProofProofCompleteText,
  hostModuleCheckBadPackageEnvIllTypedDualResidualText,
  hostModuleCheckGoodPackageEnvS8Text,
  hostModuleCheckGoodPackageEnvS9Text,
  hostModuleCheckGoodPackageEnvS10Text,
  hostModuleCheckGoodPackageEnvS11Text,
  hostModuleCheckGoodPackageEnvS12Text,
  hostModuleCheckGoodPackageEnvS13Text,
  hostModuleCheckGoodPackageEnvS14Text,
  hostModuleCheckGoodPackageEnvS15Text,
  hostModuleCheckGoodPackageEnvS16Text,
  hostModuleCheckBadPackageEnvIllTypedCompilePathMultText,
  hostModuleCheckBadPackageEnvIllTypedCompilePathLinearText,
  hostModuleCheckBadPackageEnvIllTypedCompilePathTypesText,
  hostModuleCheckBadPackageEnvIllTypedCompilePathProgramText,
  hostModuleCheckBadPackageEnvIllTypedCompilePathGraphText,
  hostModuleCheckBadPackageEnvIllTypedCompilePathComposeText,
  hostModuleCheckBadPackageEnvIllTypedCompilePathErasureText,
  hostModuleCheckBadPackageEnvIllTypedCompilePathExtractText,
  hostModuleCheckBadPackageEnvIllTypedCompilePathPlanText,
  hostModuleCheckBadPackageEnvIllTypedCompilePathApplyText,
  hostModuleCheckBadPackageEnvIllTypedCompilePathBodyText,
  hostModuleCheckBadPackageEnvIllTypedFirstSurfaceText,
  hostModuleCheckBadPackageEnvIllTypedLinearSubsetEmitText,
  hostModuleCheckBadPackageEnvIllTypedTypesSubsetEmitText,
  hostModuleCheckBadPackageEnvIllTypedProgramSubsetEmitText,
  hostModuleCheckBadPackageEnvIllTypedGraphSubsetEmitText,
  hostModuleCheckBadPackageEnvIllTypedComposeSubsetEmitText,
  hostModuleCheckBadPackageEnvIllTypedErasureSubsetEmitText,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface,
  MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckPackageEnvFixturesS5
  Red/green: lake build SystemsLean.HostModuleCheckPackageEnvFixturesS5;
  lake build SystemsLean.HostModuleCheckPackageEnv;
  just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckPackageEnvFixturesU2
import SystemsLean.HostModuleCheckCompilePathTerm
import SystemsLean.HostModuleCheckJoinMapTerm
import SystemsLean.HostModuleCheckSelfHostTerm
import SystemsLean.HostModuleCheckSurfaceMatrixTerm
import SystemsLean.HostModuleCheckSpecProofTerm
import SystemsLean.HostModuleCheckDualResidualTerm
import SystemsLean.HostModuleCheckProductPathTerm
import SystemsLean.HostModuleCheckProbeWireTerm
import SystemsLean.HostModuleCheckCompilePathMultTerm
import SystemsLean.HostModuleCheckCompilePathLinearTerm
import SystemsLean.HostModuleCheckCompilePathTypesTerm
import SystemsLean.HostModuleCheckCompilePathProgramTerm
import SystemsLean.HostModuleCheckCompilePathGraphTerm
import SystemsLean.HostModuleCheckCompilePathComposeTerm
import SystemsLean.HostModuleCheckCompilePathErasureTerm
import SystemsLean.HostModuleCheckCompilePathExtractTerm
import SystemsLean.HostModuleCheckCompilePathPlanTerm
import SystemsLean.HostModuleCheckCompilePathApplyTerm
import SystemsLean.HostModuleCheckCompilePathBodyTerm
import SystemsLean.HostModuleCheckFirstSurfaceTerm
import SystemsLean.HostModuleCheckLinearSubsetEmitTerm
import SystemsLean.HostModuleCheckTypesSubsetEmitTerm
import SystemsLean.HostModuleCheckProgramSubsetEmitTerm
import SystemsLean.HostModuleCheckGraphSubsetEmitTerm
import SystemsLean.HostModuleCheckComposeSubsetEmitTerm
import SystemsLean.HostModuleCheckErasureSubsetEmitTerm

namespace SystemsLean.HostModuleCheck

/-! ### S5 package-env map modules (CompilePath TERM upgrade lives in Fixtures) -/

/-- JoinMap module good (TERM soft J5).
    Greppable: packageEnvJoinMapTermModuleGood. -/
def packageEnvJoinMapTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.JoinMap"
    hostModuleCheckGoodJoinMapTermText

/-- SelfHost module good.
    Greppable: packageEnvSelfHostTermModuleGood. -/
def packageEnvSelfHostTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.SelfHost"
    hostModuleCheckGoodSelfHostTermText

/-- SurfaceMatrix module good.
    Greppable: packageEnvSurfaceMatrixTermModuleGood. -/
def packageEnvSurfaceMatrixTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.SurfaceMatrix"
    hostModuleCheckGoodSurfaceMatrixTermText

/-- S5 map band after ProductOutKernel (JoinMap + SelfHost + SurfaceMatrix).
    CompilePath is upgraded in the Mult..Kernel chain (Fixtures).
    Greppable: packageEnvS5MapsModulesGood. -/
def packageEnvS5MapsModulesGood : String :=
  packageEnvJoinMapTermModuleGood ++
  packageEnvSelfHostTermModuleGood ++
  packageEnvSurfaceMatrixTermModuleGood

/-- SelfHost + SurfaceMatrix good (after JoinMap).
    Greppable: packageEnvSelfHostThroughSurfaceMatrixModulesGood. -/
def packageEnvSelfHostThroughSurfaceMatrixModulesGood : String :=
  packageEnvSelfHostTermModuleGood ++
  packageEnvSurfaceMatrixTermModuleGood

/-- SurfaceMatrix good alone (after JoinMap + SelfHost).
    Greppable: packageEnvSurfaceMatrixModuleGoodTail. -/
def packageEnvSurfaceMatrixModuleGoodTail : String :=
  packageEnvSurfaceMatrixTermModuleGood

/-- Canonical E-good Mult..ParityEmit + U2 + S5 maps (living tip).
    Greppable: hostModuleCheckGoodPackageEnvS5Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS5Text : String :=
  hostModuleCheckGoodPackageEnvU2Text ++ packageEnvS5MapsModulesGood

/-- Mult..EmitBody good prefix before CompilePath for PE39.
    Greppable: packageEnvMultThroughEmitBodyForS5. -/
def packageEnvMultThroughEmitBodyForS5 : String :=
  packageEnvMultThroughEmitBodyModulesGood

/-- Kernel Mult..Emit + Parity Mult..Emit + U2 after CompilePath (no CompilePath).
    Greppable: packageEnvKernelThroughU2AfterCompilePath. -/
def packageEnvKernelThroughU2AfterCompilePath : String :=
  packageEnvKernelMultModuleGood ++
  packageEnvKernelLinearModuleGood ++
  packageEnvKernelTypesModuleGood ++
  packageEnvKernelProgramModuleGood ++
  packageEnvKernelEmitModuleGood ++
  packageEnvEmitMultParityMultModulesGood ++
  packageEnvU2ModulesGood

/-! ### E-bad PE39..PE42 (one stageId twin per S5 unit; L0 accepts) -/

/-- E-bad PE39: CompilePath wrong stageId (middle-chain unit).
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyForS5 ++
  packageEnvModuleSection "SystemsLean.CompilePath"
    hostModuleCheckBadCompilePathStageIdText ++
  packageEnvKernelThroughU2AfterCompilePath ++
  packageEnvS5MapsModulesGood

/-- E-bad PE40: JoinMap wrong stageId.
    Greppable: hostModuleCheckBadPackageEnvIllTypedJoinMapText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedJoinMapText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughParityEmitForU2 ++
  packageEnvU2ModulesGood ++
  packageEnvModuleSection "SystemsLean.JoinMap"
    hostModuleCheckBadJoinMapStageIdText ++
  packageEnvSelfHostThroughSurfaceMatrixModulesGood

/-- E-bad PE41: SelfHost wrong stageId.
    Greppable: hostModuleCheckBadPackageEnvIllTypedSelfHostText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedSelfHostText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughParityEmitForU2 ++
  packageEnvU2ModulesGood ++
  packageEnvJoinMapTermModuleGood ++
  packageEnvModuleSection "SystemsLean.SelfHost"
    hostModuleCheckBadSelfHostStageIdText ++
  packageEnvSurfaceMatrixModuleGoodTail

/-- E-bad PE42: SurfaceMatrix wrong stageId.
    Greppable: hostModuleCheckBadPackageEnvIllTypedSurfaceMatrixText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedSurfaceMatrixText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughParityEmitForU2 ++
  packageEnvU2ModulesGood ++
  packageEnvJoinMapTermModuleGood ++
  packageEnvSelfHostTermModuleGood ++
  packageEnvModuleSection "SystemsLean.SurfaceMatrix"
    hostModuleCheckBadSurfaceMatrixStageIdText

/-! ### S6 package-env leftover SpecProof + DualResidual (PE43 / PE44) -/

/-- ProbeWire resolve for SpecProof leftover Soft J2 (S45 owns dialect).
    Greppable: packageEnvProbeWireResolveForSpecProof. -/
def packageEnvProbeWireResolveForSpecProof : String :=
  packageEnvModuleSection "SystemsLean.ProbeWire"
    hostModuleCheckGoodProbeWireTermText

/-- ProductPath resolve for DualResidual leftover Soft J2 (S44 owns dialect).
    Greppable: packageEnvProductPathResolveForDualResidual. -/
def packageEnvProductPathResolveForDualResidual : String :=
  packageEnvModuleSection "SystemsLean.ProductPath"
    hostModuleCheckGoodProductPathTermText

/-- SpecProof leftover good (first import ProbeWire).
    Greppable: packageEnvSpecProofTermModuleGood. -/
def packageEnvSpecProofTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.SpecProof"
    hostModuleCheckGoodSpecProofTermText

/-- DualResidual leftover good (first import ProductPath).
    Greppable: packageEnvDualResidualTermModuleGood. -/
def packageEnvDualResidualTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.DualResidual"
    hostModuleCheckGoodDualResidualTermText

/-- Canonical E-good Mult..S5 + S6 leftover SpecProof/DualResidual.
    Greppable: hostModuleCheckGoodPackageEnvS6Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS6Text : String :=
  hostModuleCheckGoodPackageEnvS5Text ++
  packageEnvProbeWireResolveForSpecProof ++
  packageEnvSpecProofTermModuleGood ++
  packageEnvProductPathResolveForDualResidual ++
  packageEnvDualResidualTermModuleGood

/-- Header through S5 maps for leftover S6 E-bads.
    Greppable: packageEnvMultThroughS5ForS6. -/
def packageEnvMultThroughS5ForS6 : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughParityEmitForU2 ++
  packageEnvU2ModulesGood ++
  packageEnvS5MapsModulesGood

/-- Prefix for DualResidual leftover E-bads.
    Greppable: packageEnvMultThroughProductPathForDualResidual. -/
def packageEnvMultThroughProductPathForDualResidual : String :=
  packageEnvMultThroughS5ForS6 ++
  packageEnvProbeWireResolveForSpecProof ++
  packageEnvSpecProofTermModuleGood ++
  packageEnvProductPathResolveForDualResidual

/-- E-bad PE43 leftover: SpecProof ready body true (ILL-TYPED-TERM).
    Greppable: hostModuleCheckBadPackageEnvIllTypedSpecProofText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedSpecProofText : String :=
  packageEnvMultThroughS5ForS6 ++
  packageEnvProbeWireResolveForSpecProof ++
  packageEnvModuleSection "SystemsLean.SpecProof"
    hostModuleCheckBadSpecProofReadyText ++
  packageEnvProductPathResolveForDualResidual ++
  packageEnvDualResidualTermModuleGood

/-- E-bad PE43 leftover: proofCompleteClaimed false (ILL-TYPED-TERM).
    Greppable: hostModuleCheckBadPackageEnvIllTypedSpecProofProofCompleteText. -/
def hostModuleCheckBadPackageEnvIllTypedSpecProofProofCompleteText : String :=
  packageEnvMultThroughS5ForS6 ++
  packageEnvProbeWireResolveForSpecProof ++
  packageEnvModuleSection "SystemsLean.SpecProof"
    hostModuleCheckBadSpecProofProofCompleteText ++
  packageEnvProductPathResolveForDualResidual ++
  packageEnvDualResidualTermModuleGood

/-- E-bad PE44 leftover: DualResidual ready body true (ILL-TYPED-TERM).
    Greppable: hostModuleCheckBadPackageEnvIllTypedDualResidualText. -/
def hostModuleCheckBadPackageEnvIllTypedDualResidualText : String :=
  packageEnvMultThroughProductPathForDualResidual ++
  packageEnvModuleSection "SystemsLean.DualResidual"
    hostModuleCheckBadDualResidualReadyText

/-- E-bad PE44 leftover: residual-free claimed false (ILL-TYPED-TERM).
    Greppable: hostModuleCheckBadPackageEnvIllTypedDualResidualResidualFreeText. -/
def hostModuleCheckBadPackageEnvIllTypedDualResidualResidualFreeText : String :=
  packageEnvMultThroughProductPathForDualResidual ++
  packageEnvModuleSection "SystemsLean.DualResidual"
    hostModuleCheckBadDualResidualResidualFreeText

/-- E-bad PE44 leftover: host-free claimed false (ILL-TYPED-TERM).
    Greppable: hostModuleCheckBadPackageEnvIllTypedDualResidualHostFreeText. -/
def hostModuleCheckBadPackageEnvIllTypedDualResidualHostFreeText : String :=
  packageEnvMultThroughProductPathForDualResidual ++
  packageEnvModuleSection "SystemsLean.DualResidual"
    hostModuleCheckBadDualResidualHostFreeText

/-! ### S8 package-env CompilePath unit TERM (PE45..PE52) -/

/-- CompilePathMult module good (TERM soft J5; import CompilePath).
    Greppable: packageEnvCompilePathMultTermModuleGood. -/
def packageEnvCompilePathMultTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.CompilePathMult"
    hostModuleCheckGoodCompilePathMultTermText

/-- CompilePathLinear module good.
    Greppable: packageEnvCompilePathLinearTermModuleGood. -/
def packageEnvCompilePathLinearTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.CompilePathLinear"
    hostModuleCheckGoodCompilePathLinearTermText

/-- CompilePathTypes module good.
    Greppable: packageEnvCompilePathTypesTermModuleGood. -/
def packageEnvCompilePathTypesTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.CompilePathTypes"
    hostModuleCheckGoodCompilePathTypesTermText

/-- CompilePathProgram module good.
    Greppable: packageEnvCompilePathProgramTermModuleGood. -/
def packageEnvCompilePathProgramTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.CompilePathProgram"
    hostModuleCheckGoodCompilePathProgramTermText

/-- CompilePathGraph module good.
    Greppable: packageEnvCompilePathGraphTermModuleGood. -/
def packageEnvCompilePathGraphTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.CompilePathGraph"
    hostModuleCheckGoodCompilePathGraphTermText

/-- CompilePathCompose module good.
    Greppable: packageEnvCompilePathComposeTermModuleGood. -/
def packageEnvCompilePathComposeTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.CompilePathCompose"
    hostModuleCheckGoodCompilePathComposeTermText

/-- CompilePathErasure module good.
    Greppable: packageEnvCompilePathErasureTermModuleGood. -/
def packageEnvCompilePathErasureTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.CompilePathErasure"
    hostModuleCheckGoodCompilePathErasureTermText

/-- CompilePathExtract module good (TERM soft J5; import CompilePathMult).
    Greppable: packageEnvCompilePathExtractTermModuleGood. -/
def packageEnvCompilePathExtractTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.CompilePathExtract"
    hostModuleCheckGoodCompilePathExtractTermText

/-- Linear through Extract after CompilePathMult.
    Greppable: packageEnvCompilePathLinearThroughExtractModulesGood. -/
def packageEnvCompilePathLinearThroughExtractModulesGood : String :=
  packageEnvCompilePathLinearTermModuleGood ++
  packageEnvCompilePathTypesTermModuleGood ++
  packageEnvCompilePathProgramTermModuleGood ++
  packageEnvCompilePathGraphTermModuleGood ++
  packageEnvCompilePathComposeTermModuleGood ++
  packageEnvCompilePathErasureTermModuleGood ++
  packageEnvCompilePathExtractTermModuleGood

/-- Types through Extract after Mult+Linear.
    Greppable: packageEnvCompilePathTypesThroughExtractModulesGood. -/
def packageEnvCompilePathTypesThroughExtractModulesGood : String :=
  packageEnvCompilePathTypesTermModuleGood ++
  packageEnvCompilePathProgramTermModuleGood ++
  packageEnvCompilePathGraphTermModuleGood ++
  packageEnvCompilePathComposeTermModuleGood ++
  packageEnvCompilePathErasureTermModuleGood ++
  packageEnvCompilePathExtractTermModuleGood

/-- Program through Extract after Mult..Types.
    Greppable: packageEnvCompilePathProgramThroughExtractModulesGood. -/
def packageEnvCompilePathProgramThroughExtractModulesGood : String :=
  packageEnvCompilePathProgramTermModuleGood ++
  packageEnvCompilePathGraphTermModuleGood ++
  packageEnvCompilePathComposeTermModuleGood ++
  packageEnvCompilePathErasureTermModuleGood ++
  packageEnvCompilePathExtractTermModuleGood

/-- Graph through Extract after Mult..Program.
    Greppable: packageEnvCompilePathGraphThroughExtractModulesGood. -/
def packageEnvCompilePathGraphThroughExtractModulesGood : String :=
  packageEnvCompilePathGraphTermModuleGood ++
  packageEnvCompilePathComposeTermModuleGood ++
  packageEnvCompilePathErasureTermModuleGood ++
  packageEnvCompilePathExtractTermModuleGood

/-- Compose through Extract after Mult..Graph.
    Greppable: packageEnvCompilePathComposeThroughExtractModulesGood. -/
def packageEnvCompilePathComposeThroughExtractModulesGood : String :=
  packageEnvCompilePathComposeTermModuleGood ++
  packageEnvCompilePathErasureTermModuleGood ++
  packageEnvCompilePathExtractTermModuleGood

/-- Erasure through Extract after Mult..Compose.
    Greppable: packageEnvCompilePathErasureThroughExtractModulesGood. -/
def packageEnvCompilePathErasureThroughExtractModulesGood : String :=
  packageEnvCompilePathErasureTermModuleGood ++
  packageEnvCompilePathExtractTermModuleGood

/-- Mult through Linear heads for later-unit E-bad twins.
    Greppable: packageEnvCompilePathMultThroughLinearModulesGood. -/
def packageEnvCompilePathMultThroughLinearModulesGood : String :=
  packageEnvCompilePathMultTermModuleGood ++
  packageEnvCompilePathLinearTermModuleGood

/-- Mult through Types heads.
    Greppable: packageEnvCompilePathMultThroughTypesModulesGood. -/
def packageEnvCompilePathMultThroughTypesModulesGood : String :=
  packageEnvCompilePathMultThroughLinearModulesGood ++
  packageEnvCompilePathTypesTermModuleGood

/-- Mult through Program heads.
    Greppable: packageEnvCompilePathMultThroughProgramModulesGood. -/
def packageEnvCompilePathMultThroughProgramModulesGood : String :=
  packageEnvCompilePathMultThroughTypesModulesGood ++
  packageEnvCompilePathProgramTermModuleGood

/-- Mult through Graph heads.
    Greppable: packageEnvCompilePathMultThroughGraphModulesGood. -/
def packageEnvCompilePathMultThroughGraphModulesGood : String :=
  packageEnvCompilePathMultThroughProgramModulesGood ++
  packageEnvCompilePathGraphTermModuleGood

/-- Mult through Compose heads.
    Greppable: packageEnvCompilePathMultThroughComposeModulesGood. -/
def packageEnvCompilePathMultThroughComposeModulesGood : String :=
  packageEnvCompilePathMultThroughGraphModulesGood ++
  packageEnvCompilePathComposeTermModuleGood

/-- Mult through Erasure heads (Extract last).
    Greppable: packageEnvCompilePathMultThroughErasureModulesGood. -/
def packageEnvCompilePathMultThroughErasureModulesGood : String :=
  packageEnvCompilePathMultThroughComposeModulesGood ++
  packageEnvCompilePathErasureTermModuleGood

/-- Canonical E-good Mult..S6 + S8 CompilePath unit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS8Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS8Text : String :=
  hostModuleCheckGoodPackageEnvS6Text ++
  packageEnvCompilePathMultTermModuleGood ++
  packageEnvCompilePathLinearThroughExtractModulesGood

/-- Prefix through S6 for S8 E-bad twins.
    Greppable: packageEnvMultThroughS6ForS8. -/
def packageEnvMultThroughS6ForS8 : String :=
  packageEnvMultThroughProductPathForDualResidual ++
  packageEnvDualResidualTermModuleGood

/-- E-bad PE45: CompilePathMult residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathMultText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathMultText : String :=
  packageEnvMultThroughS6ForS8 ++
  packageEnvModuleSection "SystemsLean.CompilePathMult"
    hostModuleCheckBadCompilePathMultResidualText ++
  packageEnvCompilePathLinearThroughExtractModulesGood

/-- E-bad PE46: CompilePathLinear residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathLinearText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathLinearText : String :=
  packageEnvMultThroughS6ForS8 ++
  packageEnvCompilePathMultTermModuleGood ++
  packageEnvModuleSection "SystemsLean.CompilePathLinear"
    hostModuleCheckBadCompilePathLinearResidualText ++
  packageEnvCompilePathTypesThroughExtractModulesGood

/-- E-bad PE47: CompilePathTypes residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathTypesText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathTypesText : String :=
  packageEnvMultThroughS6ForS8 ++
  packageEnvCompilePathMultThroughLinearModulesGood ++
  packageEnvModuleSection "SystemsLean.CompilePathTypes"
    hostModuleCheckBadCompilePathTypesResidualText ++
  packageEnvCompilePathProgramThroughExtractModulesGood

/-- E-bad PE48: CompilePathProgram residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathProgramText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathProgramText : String :=
  packageEnvMultThroughS6ForS8 ++
  packageEnvCompilePathMultThroughTypesModulesGood ++
  packageEnvModuleSection "SystemsLean.CompilePathProgram"
    hostModuleCheckBadCompilePathProgramResidualText ++
  packageEnvCompilePathGraphThroughExtractModulesGood

/-- E-bad PE49: CompilePathGraph residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathGraphText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathGraphText : String :=
  packageEnvMultThroughS6ForS8 ++
  packageEnvCompilePathMultThroughProgramModulesGood ++
  packageEnvModuleSection "SystemsLean.CompilePathGraph"
    hostModuleCheckBadCompilePathGraphResidualText ++
  packageEnvCompilePathComposeThroughExtractModulesGood

/-- E-bad PE50: CompilePathCompose residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathComposeText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathComposeText : String :=
  packageEnvMultThroughS6ForS8 ++
  packageEnvCompilePathMultThroughGraphModulesGood ++
  packageEnvModuleSection "SystemsLean.CompilePathCompose"
    hostModuleCheckBadCompilePathComposeResidualText ++
  packageEnvCompilePathErasureThroughExtractModulesGood

/-- E-bad PE51: CompilePathErasure residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathErasureText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathErasureText : String :=
  packageEnvMultThroughS6ForS8 ++
  packageEnvCompilePathMultThroughComposeModulesGood ++
  packageEnvModuleSection "SystemsLean.CompilePathErasure"
    hostModuleCheckBadCompilePathErasureResidualText ++
  packageEnvCompilePathExtractTermModuleGood

/-- E-bad PE52: CompilePathExtract residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathExtractText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathExtractText : String :=
  packageEnvMultThroughS6ForS8 ++
  packageEnvCompilePathMultThroughErasureModulesGood ++
  packageEnvModuleSection "SystemsLean.CompilePathExtract"
    hostModuleCheckBadCompilePathExtractResidualText

/-! ### S9 package-env CompilePath Plan / Apply / Body TERM (PE53..PE55) -/

/-- CompilePathPlan module good (TERM soft J5; import CompilePath).
    Greppable: packageEnvCompilePathPlanTermModuleGood. -/
def packageEnvCompilePathPlanTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.CompilePathPlan"
    hostModuleCheckGoodCompilePathPlanTermText

/-- CompilePathApply module good.
    Greppable: packageEnvCompilePathApplyTermModuleGood. -/
def packageEnvCompilePathApplyTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.CompilePathApply"
    hostModuleCheckGoodCompilePathApplyTermText

/-- CompilePathBody module good.
    Greppable: packageEnvCompilePathBodyTermModuleGood. -/
def packageEnvCompilePathBodyTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.CompilePathBody"
    hostModuleCheckGoodCompilePathBodyTermText

/-- Apply through Body after Plan.
    Greppable: packageEnvCompilePathApplyThroughBodyModulesGood. -/
def packageEnvCompilePathApplyThroughBodyModulesGood : String :=
  packageEnvCompilePathApplyTermModuleGood ++
  packageEnvCompilePathBodyTermModuleGood

/-- Plan through Apply heads (Body last).
    Greppable: packageEnvCompilePathPlanThroughApplyModulesGood. -/
def packageEnvCompilePathPlanThroughApplyModulesGood : String :=
  packageEnvCompilePathPlanTermModuleGood ++
  packageEnvCompilePathApplyTermModuleGood

/-- Canonical E-good Mult..S8 + S9 CompilePath Plan / Apply / Body TERM.
    Greppable: hostModuleCheckGoodPackageEnvS9Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS9Text : String :=
  hostModuleCheckGoodPackageEnvS8Text ++
  packageEnvCompilePathPlanTermModuleGood ++
  packageEnvCompilePathApplyThroughBodyModulesGood

/-- Prefix through S8 for S9 E-bad twins.
    Greppable: packageEnvMultThroughS8ForS9. -/
def packageEnvMultThroughS8ForS9 : String :=
  packageEnvMultThroughS6ForS8 ++
  packageEnvCompilePathMultTermModuleGood ++
  packageEnvCompilePathLinearThroughExtractModulesGood

/-- E-bad PE53: CompilePathPlan residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathPlanText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathPlanText : String :=
  packageEnvMultThroughS8ForS9 ++
  packageEnvModuleSection "SystemsLean.CompilePathPlan"
    hostModuleCheckBadCompilePathPlanResidualText ++
  packageEnvCompilePathApplyThroughBodyModulesGood

/-- E-bad PE54: CompilePathApply residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathApplyText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathApplyText : String :=
  packageEnvMultThroughS8ForS9 ++
  packageEnvCompilePathPlanTermModuleGood ++
  packageEnvModuleSection "SystemsLean.CompilePathApply"
    hostModuleCheckBadCompilePathApplyResidualText ++
  packageEnvCompilePathBodyTermModuleGood

/-- E-bad PE55: CompilePathBody residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathBodyText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathBodyText : String :=
  packageEnvMultThroughS8ForS9 ++
  packageEnvCompilePathPlanThroughApplyModulesGood ++
  packageEnvModuleSection "SystemsLean.CompilePathBody"
    hostModuleCheckBadCompilePathBodyResidualText

/-! ### S10 package-env FirstSurface TERM (PE56) -/

/-- FirstSurface env body: TERM goods + multi-line firstSurfaceReady (real module
    shape). Collapse must accept this, not only a same-line after `:=` body.
    Greppable: packageEnvFirstSurfaceTermBodyGood. -/
def packageEnvFirstSurfaceTermBodyGood : String :=
  hostModuleCheckFirstSurfaceTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_FIRST_SURFACE_V0\"\n" ++
  "def hostId : String := \"HOST-FIRST-SURFACE\"\n" ++
  "def surfaceId : String := \"FIRST-SURFACE\"\n" ++
  "def justRecipe : String := \"first-surface\"\n" ++
  "def firstSurfaceEmitMultOk : Bool := multFixtureEmitPathOk\n" ++
  hostModuleCheckGoodFirstSurfaceReadyMultilineText ++
  "def firstSurfaceResidualFreeClaimed : Bool := false\n" ++
  "def firstSurfaceProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckFirstSurfaceTermSkeletonSuffix

/-- FirstSurface module good (TERM soft J5; import CompilePathMult).
    Greppable: packageEnvFirstSurfaceTermModuleGood. -/
def packageEnvFirstSurfaceTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.FirstSurface"
    packageEnvFirstSurfaceTermBodyGood

/-- Canonical E-good Mult..S9 + S10 FirstSurface TERM.
    Greppable: hostModuleCheckGoodPackageEnvS10Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS10Text : String :=
  hostModuleCheckGoodPackageEnvS9Text ++
  packageEnvFirstSurfaceTermModuleGood

/-- Prefix through S9 for S10 E-bad twins.
    Greppable: packageEnvMultThroughS9ForS10. -/
def packageEnvMultThroughS9ForS10 : String :=
  packageEnvMultThroughS8ForS9 ++
  packageEnvCompilePathPlanTermModuleGood ++
  packageEnvCompilePathApplyThroughBodyModulesGood

/-- E-bad PE56: FirstSurface residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedFirstSurfaceText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedFirstSurfaceText : String :=
  packageEnvMultThroughS9ForS10 ++
  packageEnvModuleSection "SystemsLean.FirstSurface"
    hostModuleCheckBadFirstSurfaceResidualText

/-! ### S11 package-env LinearSubsetEmit TERM (PE57) -/

/-- LinearSubsetEmit env body: TERM goods + multi-line linearSubsetEmitReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathLinear (already in env).
    Greppable: packageEnvLinearSubsetEmitTermBodyGood. -/
def packageEnvLinearSubsetEmitTermBodyGood : String :=
  "import SystemsLean.CompilePathLinear\n" ++
  "namespace SystemsLean.LinearSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"linear-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetEmitLinearDialectOk : Bool := emitLinearReady\n" ++
  hostModuleCheckGoodLinearSubsetEmitReadyMultilineText ++
  "def linearSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def linearSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckLinearSubsetEmitTermSkeletonSuffix

/-- LinearSubsetEmit module good (TERM soft J5; import CompilePathLinear).
    Greppable: packageEnvLinearSubsetEmitTermModuleGood. -/
def packageEnvLinearSubsetEmitTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.LinearSubsetEmit"
    packageEnvLinearSubsetEmitTermBodyGood

/-- Canonical E-good Mult..S10 + S11 LinearSubsetEmit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS11Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS11Text : String :=
  hostModuleCheckGoodPackageEnvS10Text ++
  packageEnvLinearSubsetEmitTermModuleGood

/-- Prefix through S10 for S11 E-bad twins.
    Greppable: packageEnvMultThroughS10ForS11. -/
def packageEnvMultThroughS10ForS11 : String :=
  packageEnvMultThroughS9ForS10 ++
  packageEnvFirstSurfaceTermModuleGood

/-- LinearSubsetEmit env body with residual-free claimed true (PE57).
    CompilePathLinear only (already in env; no EmitLinear import farm).
    Greppable: packageEnvLinearSubsetEmitTermBodyBadResidual. -/
def packageEnvLinearSubsetEmitTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathLinear\n" ++
  "namespace SystemsLean.LinearSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"linear-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetEmitLinearDialectOk : Bool := emitLinearReady\n" ++
  "def linearSubsetEmitReady : Bool := " ++ linearSubsetEmitReadyTermBody ++ "\n" ++
  "def linearSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def linearSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckLinearSubsetEmitTermSkeletonSuffix

/-- E-bad PE57: LinearSubsetEmit residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLinearSubsetEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedLinearSubsetEmitText : String :=
  packageEnvMultThroughS10ForS11 ++
  packageEnvModuleSection "SystemsLean.LinearSubsetEmit"
    packageEnvLinearSubsetEmitTermBodyBadResidual

/-! ### S12 package-env TypesSubsetEmit TERM (PE58) -/

/-- TypesSubsetEmit env body: TERM goods + multi-line typesSubsetEmitReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathTypes (already in env).
    Greppable: packageEnvTypesSubsetEmitTermBodyGood. -/
def packageEnvTypesSubsetEmitTermBodyGood : String :=
  "import SystemsLean.CompilePathTypes\n" ++
  "namespace SystemsLean.TypesSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"types-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetEmitTypesDialectOk : Bool := emitTypesReady\n" ++
  hostModuleCheckGoodTypesSubsetEmitReadyMultilineText ++
  "def typesSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetEmitTermSkeletonSuffix

/-- TypesSubsetEmit module good (TERM soft J5; import CompilePathTypes).
    Greppable: packageEnvTypesSubsetEmitTermModuleGood. -/
def packageEnvTypesSubsetEmitTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.TypesSubsetEmit"
    packageEnvTypesSubsetEmitTermBodyGood

/-- Canonical E-good Mult..S11 + S12 TypesSubsetEmit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS12Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS12Text : String :=
  hostModuleCheckGoodPackageEnvS11Text ++
  packageEnvTypesSubsetEmitTermModuleGood

/-- Prefix through S11 for S12 E-bad twins.
    Greppable: packageEnvMultThroughS11ForS12. -/
def packageEnvMultThroughS11ForS12 : String :=
  packageEnvMultThroughS10ForS11 ++
  packageEnvLinearSubsetEmitTermModuleGood

/-- TypesSubsetEmit env body with residual-free claimed true (PE58).
    CompilePathTypes only (already in env; no EmitTypes import farm).
    Greppable: packageEnvTypesSubsetEmitTermBodyBadResidual. -/
def packageEnvTypesSubsetEmitTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathTypes\n" ++
  "namespace SystemsLean.TypesSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"types-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetEmitTypesDialectOk : Bool := emitTypesReady\n" ++
  "def typesSubsetEmitReady : Bool := " ++ typesSubsetEmitReadyTermBody ++ "\n" ++
  "def typesSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetEmitTermSkeletonSuffix

/-- E-bad PE58: TypesSubsetEmit residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedTypesSubsetEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedTypesSubsetEmitText : String :=
  packageEnvMultThroughS11ForS12 ++
  packageEnvModuleSection "SystemsLean.TypesSubsetEmit"
    packageEnvTypesSubsetEmitTermBodyBadResidual

/-! ### S13 package-env ProgramSubsetEmit TERM (PE59) -/

/-- ProgramSubsetEmit env body: TERM goods + multi-line programSubsetEmitReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathProgram (already in env).
    Greppable: packageEnvProgramSubsetEmitTermBodyGood. -/
def packageEnvProgramSubsetEmitTermBodyGood : String :=
  "import SystemsLean.CompilePathProgram\n" ++
  "namespace SystemsLean.ProgramSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"program-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetEmitProgramDialectOk : Bool := emitProgramReady\n" ++
  hostModuleCheckGoodProgramSubsetEmitReadyMultilineText ++
  "def programSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def programSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckProgramSubsetEmitTermSkeletonSuffix

/-- ProgramSubsetEmit module good (TERM soft J5; import CompilePathProgram).
    Greppable: packageEnvProgramSubsetEmitTermModuleGood. -/
def packageEnvProgramSubsetEmitTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.ProgramSubsetEmit"
    packageEnvProgramSubsetEmitTermBodyGood

/-- Canonical E-good Mult..S12 + S13 ProgramSubsetEmit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS13Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS13Text : String :=
  hostModuleCheckGoodPackageEnvS12Text ++
  packageEnvProgramSubsetEmitTermModuleGood

/-- Prefix through S12 for S13 E-bad twins.
    Greppable: packageEnvMultThroughS12ForS13. -/
def packageEnvMultThroughS12ForS13 : String :=
  packageEnvMultThroughS11ForS12 ++
  packageEnvTypesSubsetEmitTermModuleGood

/-- ProgramSubsetEmit env body with residual-free claimed true (PE59).
    CompilePathProgram only (already in env; no EmitProgram import farm).
    Greppable: packageEnvProgramSubsetEmitTermBodyBadResidual. -/
def packageEnvProgramSubsetEmitTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathProgram\n" ++
  "namespace SystemsLean.ProgramSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"program-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetEmitProgramDialectOk : Bool := emitProgramReady\n" ++
  "def programSubsetEmitReady : Bool := " ++ programSubsetEmitReadyTermBody ++ "\n" ++
  "def programSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def programSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckProgramSubsetEmitTermSkeletonSuffix

/-- E-bad PE59: ProgramSubsetEmit residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProgramSubsetEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedProgramSubsetEmitText : String :=
  packageEnvMultThroughS12ForS13 ++
  packageEnvModuleSection "SystemsLean.ProgramSubsetEmit"
    packageEnvProgramSubsetEmitTermBodyBadResidual

/-! ### S14 package-env GraphSubsetEmit TERM (PE60) -/

/-- GraphSubsetEmit env body: TERM goods + multi-line graphSubsetEmitReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathGraph (already in env).
    Greppable: packageEnvGraphSubsetEmitTermBodyGood. -/
def packageEnvGraphSubsetEmitTermBodyGood : String :=
  "import SystemsLean.CompilePathGraph\n" ++
  "namespace SystemsLean.GraphSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"graph-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetEmitGraphDialectOk : Bool := emitGraphReady\n" ++
  hostModuleCheckGoodGraphSubsetEmitReadyMultilineText ++
  "def graphSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetEmitTermSkeletonSuffix

/-- GraphSubsetEmit module good (TERM soft J5; import CompilePathGraph).
    Greppable: packageEnvGraphSubsetEmitTermModuleGood. -/
def packageEnvGraphSubsetEmitTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.GraphSubsetEmit"
    packageEnvGraphSubsetEmitTermBodyGood

/-- Canonical E-good Mult..S13 + S14 GraphSubsetEmit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS14Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS14Text : String :=
  hostModuleCheckGoodPackageEnvS13Text ++
  packageEnvGraphSubsetEmitTermModuleGood

/-- Prefix through S13 for S14 E-bad twins.
    Greppable: packageEnvMultThroughS13ForS14. -/
def packageEnvMultThroughS13ForS14 : String :=
  packageEnvMultThroughS12ForS13 ++
  packageEnvProgramSubsetEmitTermModuleGood

/-- GraphSubsetEmit env body with residual-free claimed true (PE60).
    CompilePathGraph only (already in env; no EmitGraph import farm).
    Greppable: packageEnvGraphSubsetEmitTermBodyBadResidual. -/
def packageEnvGraphSubsetEmitTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathGraph\n" ++
  "namespace SystemsLean.GraphSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"graph-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetEmitGraphDialectOk : Bool := emitGraphReady\n" ++
  "def graphSubsetEmitReady : Bool := " ++ graphSubsetEmitReadyTermBody ++ "\n" ++
  "def graphSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def graphSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetEmitTermSkeletonSuffix

/-- E-bad PE60: GraphSubsetEmit residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedGraphSubsetEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedGraphSubsetEmitText : String :=
  packageEnvMultThroughS13ForS14 ++
  packageEnvModuleSection "SystemsLean.GraphSubsetEmit"
    packageEnvGraphSubsetEmitTermBodyBadResidual

/-! ### S15 package-env ComposeSubsetEmit TERM (PE61) -/

/-- ComposeSubsetEmit env body: TERM goods + multi-line composeSubsetEmitReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathCompose (already in env).
    Greppable: packageEnvComposeSubsetEmitTermBodyGood. -/
def packageEnvComposeSubsetEmitTermBodyGood : String :=
  "import SystemsLean.CompilePathCompose\n" ++
  "namespace SystemsLean.ComposeSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"compose-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetEmitComposeDialectOk : Bool := emitComposeReady\n" ++
  hostModuleCheckGoodComposeSubsetEmitReadyMultilineText ++
  "def composeSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def composeSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckComposeSubsetEmitTermSkeletonSuffix

/-- ComposeSubsetEmit module good (TERM soft J5; import CompilePathCompose).
    Greppable: packageEnvComposeSubsetEmitTermModuleGood. -/
def packageEnvComposeSubsetEmitTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.ComposeSubsetEmit"
    packageEnvComposeSubsetEmitTermBodyGood

/-- Canonical E-good Mult..S14 + S15 ComposeSubsetEmit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS15Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS15Text : String :=
  hostModuleCheckGoodPackageEnvS14Text ++
  packageEnvComposeSubsetEmitTermModuleGood

/-- Prefix through S14 for S15 E-bad twins.
    Greppable: packageEnvMultThroughS14ForS15. -/
def packageEnvMultThroughS14ForS15 : String :=
  packageEnvMultThroughS13ForS14 ++
  packageEnvGraphSubsetEmitTermModuleGood

/-- ComposeSubsetEmit env body with residual-free claimed true (PE61).
    CompilePathCompose only (already in env; no EmitCompose import farm).
    Greppable: packageEnvComposeSubsetEmitTermBodyBadResidual. -/
def packageEnvComposeSubsetEmitTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathCompose\n" ++
  "namespace SystemsLean.ComposeSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"compose-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetEmitComposeDialectOk : Bool := emitComposeReady\n" ++
  "def composeSubsetEmitReady : Bool := " ++ composeSubsetEmitReadyTermBody ++ "\n" ++
  "def composeSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def composeSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckComposeSubsetEmitTermSkeletonSuffix

/-- E-bad PE61: ComposeSubsetEmit residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedComposeSubsetEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedComposeSubsetEmitText : String :=
  packageEnvMultThroughS14ForS15 ++
  packageEnvModuleSection "SystemsLean.ComposeSubsetEmit"
    packageEnvComposeSubsetEmitTermBodyBadResidual

/-! ### S16 package-env ErasureSubsetEmit TERM (PE62) -/

/-- ErasureSubsetEmit env body: TERM goods + multi-line erasureSubsetEmitReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathErasure (already in env).
    Greppable: packageEnvErasureSubsetEmitTermBodyGood. -/
def packageEnvErasureSubsetEmitTermBodyGood : String :=
  "import SystemsLean.CompilePathErasure\n" ++
  "namespace SystemsLean.ErasureSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"erasure-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetEmitErasureDialectOk : Bool := emitErasureReady\n" ++
  hostModuleCheckGoodErasureSubsetEmitReadyMultilineText ++
  "def erasureSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def erasureSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckErasureSubsetEmitTermSkeletonSuffix

/-- ErasureSubsetEmit module good (TERM soft J5; import CompilePathErasure).
    Greppable: packageEnvErasureSubsetEmitTermModuleGood. -/
def packageEnvErasureSubsetEmitTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.ErasureSubsetEmit"
    packageEnvErasureSubsetEmitTermBodyGood

/-- Canonical E-good Mult..S15 + S16 ErasureSubsetEmit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS16Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS16Text : String :=
  hostModuleCheckGoodPackageEnvS15Text ++
  packageEnvErasureSubsetEmitTermModuleGood

/-- Prefix through S15 for S16 E-bad twins.
    Greppable: packageEnvMultThroughS15ForS16. -/
def packageEnvMultThroughS15ForS16 : String :=
  packageEnvMultThroughS14ForS15 ++
  packageEnvComposeSubsetEmitTermModuleGood

/-- ErasureSubsetEmit env body with residual-free claimed true (PE62).
    CompilePathErasure only (already in env; no EmitErasure import farm).
    Greppable: packageEnvErasureSubsetEmitTermBodyBadResidual. -/
def packageEnvErasureSubsetEmitTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathErasure\n" ++
  "namespace SystemsLean.ErasureSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"erasure-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetEmitErasureDialectOk : Bool := emitErasureReady\n" ++
  "def erasureSubsetEmitReady : Bool := " ++ erasureSubsetEmitReadyTermBody ++ "\n" ++
  "def erasureSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def erasureSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckErasureSubsetEmitTermSkeletonSuffix

/-- E-bad PE62: ErasureSubsetEmit residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedErasureSubsetEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedErasureSubsetEmitText : String :=
  packageEnvMultThroughS15ForS16 ++
  packageEnvModuleSection "SystemsLean.ErasureSubsetEmit"
    packageEnvErasureSubsetEmitTermBodyBadResidual

end SystemsLean.HostModuleCheck
