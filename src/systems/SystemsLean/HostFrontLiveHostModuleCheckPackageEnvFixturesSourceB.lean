/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckPackageEnvFixtures.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckPackageEnvFixturesSourceB.
  Not occupancy name 50. Host tools stay 69 of 69. Not FullHost.
  Not an LLVM backend. Not Lake-gone. Not PROVABLY.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURES,
  liveHostModuleCheckPackageEnvFixturesSource, liveRel,
  HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURES, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesSourceB
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixtures

/-- Dual-pinned slice of HostModuleCheckPackageEnvFixtures.lean. -/
def liveHostModuleCheckPackageEnvFixturesSourceB : String := r#"/-- Kernel Program..Emit + Parity Mult..Emit good (after Kernel Mult..Types).
    Greppable: packageEnvKernelProgramThroughEmitModulesGood. -/
def packageEnvKernelProgramThroughEmitModulesGood : String :=
  packageEnvKernelProgramModuleGood ++
  packageEnvKernelEmitModuleGood ++
  packageEnvEmitMultParityMultModulesGood

/-- Package env fixture header (band + bar + ready).
    Greppable: packageEnvHeaderReady,
    MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only. -/
def packageEnvHeaderReady : String :=
  "packageBand: MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrix-env\n" ++
  "packageElaborateBar: PACKAGE-ELABORATE\n" ++
  "packageEnvReady: true\n"

/-- E-good: Mult..EmitBody + Kernel Mult..Emit + Parity Mult..Emit multi-module package env.
    Greppable: hostModuleCheckGoodPackageEnvText, PACKAGE-ELABORATE,
    MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only. -/
def hostModuleCheckGoodPackageEnvText : String :=
  packageEnvHeaderReady
    ++ packageEnvMultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelModulesGood

/-- E-bad PE1: Mult body ill-typed; L0 package tokens accept.
    Greppable: hostModuleCheckBadPackageEnvIllTypedMultText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedMultText : String :=
  packageEnvHeaderReady ++
  packageEnvModuleSection "SystemsLean.Mult" hostModuleCheckBadMultNameReturnTypeText ++
  packageEnvLinearThroughKernelEmitModulesGood

/-- E-bad PE4: Types body ill-typed; L0 still accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedTypesText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedTypesText : String :=
  packageEnvHeaderReady ++
  packageEnvModuleSection "SystemsLean.Mult" hostModuleCheckGoodMultTermText ++
  packageEnvModuleSection "SystemsLean.Linear" packageEnvLinearBodyGood ++
  packageEnvModuleSection "SystemsLean.Types" hostModuleCheckBadTypesNameArmText ++
  packageEnvProgramThroughKernelEmitModulesGood

/-- E-bad PE5: IrProgram body ill-typed (wrong programCap); L0 still accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProgramText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedProgramText : String :=
  packageEnvHeaderReady ++
  packageEnvModuleSection "SystemsLean.Mult" hostModuleCheckGoodMultTermText ++
  packageEnvModuleSection "SystemsLean.Linear" packageEnvLinearBodyGood ++
  packageEnvModuleSection "SystemsLean.Types" packageEnvTypesBodyGood ++
  packageEnvModuleSection "SystemsLean.IrProgram" hostModuleCheckBadIrProgramCapText ++
  packageEnvGraphThroughKernelEmitModulesGood

/-- E-bad PE6: IrGraph body ill-typed (wrong edgeMax); L0 still accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedGraphText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedGraphText : String :=
  packageEnvHeaderReady ++
  packageEnvModuleSection "SystemsLean.Mult" hostModuleCheckGoodMultTermText ++
  packageEnvModuleSection "SystemsLean.Linear" packageEnvLinearBodyGood ++
  packageEnvModuleSection "SystemsLean.Types" packageEnvTypesBodyGood ++
  packageEnvModuleSection "SystemsLean.IrProgram" packageEnvProgramBodyGood ++
  packageEnvModuleSection "SystemsLean.IrGraph" hostModuleCheckBadIrGraphEdgeMaxText ++
  packageEnvComposeThroughKernelEmitModulesGood

/-- E-bad PE7: HostCompose body ill-typed (empty drops fields); L0 still accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedComposeText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedComposeText : String :=
  packageEnvHeaderReady ++
  packageEnvModuleSection "SystemsLean.Mult" hostModuleCheckGoodMultTermText ++
  packageEnvModuleSection "SystemsLean.Linear" packageEnvLinearBodyGood ++
  packageEnvModuleSection "SystemsLean.Types" packageEnvTypesBodyGood ++
  packageEnvModuleSection "SystemsLean.IrProgram" packageEnvProgramBodyGood ++
  packageEnvModuleSection "SystemsLean.IrGraph" packageEnvGraphBodyGood ++
  packageEnvModuleSection "SystemsLean.HostCompose" hostModuleCheckBadHostComposeEmptyText ++
  packageEnvErasureModuleGood ++
  packageEnvExtractModuleGood ++
  packageEnvEmitPlanModuleGood ++
  packageEnvEmitApplyModuleGood ++
  packageEnvEmitBodyModuleGood ++
  packageEnvKernelMultThroughEmitModulesGood

/-- E-bad PE8: Erasure body ill-typed; L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedErasureText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedErasureText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughComposeModulesGood ++
  packageEnvModuleSection "SystemsLean.Erasure" hostModuleCheckBadErasureCheckFailClosedText ++
  packageEnvExtractModuleGood ++
  packageEnvEmitPlanModuleGood ++
  packageEnvEmitApplyModuleGood ++
  packageEnvEmitBodyModuleGood ++
  packageEnvKernelMultThroughEmitModulesGood

/-- E-bad PE9: Extract body ill-typed; L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedExtractText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedExtractText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughErasureModulesGood ++
  packageEnvModuleSection "SystemsLean.Extract" hostModuleCheckBadExtractCheckFailClosedText ++
  packageEnvEmitPlanModuleGood ++
  packageEnvEmitApplyModuleGood ++
  packageEnvEmitBodyModuleGood ++
  packageEnvKernelMultThroughEmitModulesGood

/-- E-bad PE10: EmitPlan body ill-typed; L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitPlanText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedEmitPlanText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughExtractModulesGood ++
  packageEnvScaffoldSection "SystemsLean.EmitPlanScaffold" ++
  packageEnvModuleSection "SystemsLean.EmitPlan" hostModuleCheckBadEmitPlanFailClosedText ++
  packageEnvEmitApplyModuleGood ++
  packageEnvEmitBodyModuleGood ++
  packageEnvKernelMultThroughEmitModulesGood

/-- E-bad PE11: EmitApply body ill-typed; L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitApplyText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedEmitApplyText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitPlanModulesGood ++
  packageEnvScaffoldSection "SystemsLean.EmitApplyScaffold" ++
  packageEnvModuleSection "SystemsLean.EmitApply" hostModuleCheckBadEmitApplyFailClosedText ++
  packageEnvEmitBodyModuleGood ++
  packageEnvKernelMultThroughEmitModulesGood

/-- E-bad PE12: EmitBody body ill-typed; L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitBodyText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedEmitBodyText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitApplyModulesGood ++
  packageEnvScaffoldSection "SystemsLean.EmitBodyScaffold" ++
  packageEnvModuleSection "SystemsLean.EmitBody" hostModuleCheckBadEmitBodyFailClosedText ++
  packageEnvKernelMultThroughEmitModulesGood

/-- E-bad PE13: KernelMult body ill-typed (wrong stageId); L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelMultText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedKernelMultText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvModuleSection "SystemsLean.KernelMult" hostModuleCheckBadKernelMultStageIdText ++
  packageEnvKernelLinearThroughEmitModulesGood

/-- E-bad PE14: KernelLinear body ill-typed (wrong stageId); L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelLinearText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedKernelLinearText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvKernelMultModuleGood ++
  packageEnvModuleSection "SystemsLean.KernelLinear" hostModuleCheckBadKernelLinearStageIdText ++
  packageEnvKernelTypesThroughEmitModulesGood

/-- E-bad PE15: KernelTypes body ill-typed (wrong stageId); L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelTypesText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedKernelTypesText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvKernelMultModuleGood ++
  packageEnvKernelLinearModuleGood ++
  packageEnvModuleSection "SystemsLean.KernelTypes" hostModuleCheckBadKernelTypesStageIdText ++
  packageEnvKernelProgramThroughEmitModulesGood

/-- E-bad PE16: KernelProgram body ill-typed (wrong stageId); L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelProgramText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedKernelProgramText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvKernelMultModuleGood ++
  packageEnvKernelLinearModuleGood ++
  packageEnvKernelTypesModuleGood ++
  packageEnvModuleSection "SystemsLean.KernelProgram" hostModuleCheckBadKernelProgramStageIdText ++
  packageEnvKernelEmitModuleGood ++
  packageEnvEmitMultParityMultModulesGood

/-- E-bad PE17: KernelEmit body ill-typed (wrong stageId); L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedKernelEmitText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvKernelMultModuleGood ++
  packageEnvKernelLinearModuleGood ++
  packageEnvKernelTypesModuleGood ++
  packageEnvKernelProgramModuleGood ++
  packageEnvModuleSection "SystemsLean.KernelEmit" hostModuleCheckBadKernelEmitStageIdText ++
  packageEnvEmitMultParityMultModulesGood

/-- E-bad PE18: ParityMult body ill-typed (wrong stageId); L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityMultText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedParityMultText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvKernelMultModuleGood ++
  packageEnvKernelLinearModuleGood ++
  packageEnvKernelTypesModuleGood ++
  packageEnvKernelProgramModuleGood ++
  packageEnvKernelEmitModuleGood ++
  packageEnvEmitMultScaffold ++
  packageEnvModuleSection "SystemsLean.ParityMult"
    hostModuleCheckBadParityMultStageIdText ++
  packageEnvParityLinearModuleGood ++
  packageEnvParityTypesModuleGood ++
  packageEnvParityProgramModuleGood ++
  packageEnvParityEmitModuleGood

/-- E-bad PE19: ParityMult multParityReady always true; L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityMultReadyText,
    ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedParityMultReadyText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvKernelMultModuleGood ++
  packageEnvKernelLinearModuleGood ++
  packageEnvKernelTypesModuleGood ++
  packageEnvKernelProgramModuleGood ++
  packageEnvKernelEmitModuleGood ++
  packageEnvEmitMultScaffold ++
  packageEnvModuleSection "SystemsLean.ParityMult"
    hostModuleCheckBadParityMultReadyText ++
  packageEnvParityLinearModuleGood ++
  packageEnvParityTypesModuleGood ++
  packageEnvParityProgramModuleGood ++
  packageEnvParityEmitModuleGood

/-- E-bad PE20: ParityLinear body ill-typed (wrong stageId); L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityLinearText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedParityLinearText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvKernelMultModuleGood ++
  packageEnvKernelLinearModuleGood ++
  packageEnvKernelTypesModuleGood ++
  packageEnvKernelProgramModuleGood ++
  packageEnvKernelEmitModuleGood ++
  packageEnvEmitMultScaffold ++
  packageEnvParityMultModuleGood ++
  packageEnvModuleSection "SystemsLean.ParityLinear"
    hostModuleCheckBadParityLinearStageIdText ++
  packageEnvParityTypesModuleGood ++
  packageEnvParityProgramModuleGood ++
  packageEnvParityEmitModuleGood

/-- E-bad PE21: ParityLinear linearParityReady always true; L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityLinearReadyText,
    ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedParityLinearReadyText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvKernelMultModuleGood ++
  packageEnvKernelLinearModuleGood ++
  packageEnvKernelTypesModuleGood ++
  packageEnvKernelProgramModuleGood ++
  packageEnvKernelEmitModuleGood ++
  packageEnvEmitMultScaffold ++
  packageEnvParityMultModuleGood ++
  packageEnvModuleSection "SystemsLean.ParityLinear"
    hostModuleCheckBadParityLinearReadyText ++
  packageEnvParityTypesModuleGood ++
  packageEnvParityProgramModuleGood ++
  packageEnvParityEmitModuleGood

/-- E-bad PE22: ParityTypes body ill-typed (wrong stageId); L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityTypesText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedParityTypesText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvKernelMultModuleGood ++
  packageEnvKernelLinearModuleGood ++
  packageEnvKernelTypesModuleGood ++
  packageEnvKernelProgramModuleGood ++
  packageEnvKernelEmitModuleGood ++
  packageEnvEmitMultScaffold ++
  packageEnvParityMultModuleGood ++
  packageEnvParityLinearModuleGood ++
  packageEnvModuleSection "SystemsLean.ParityTypes"
    hostModuleCheckBadParityTypesStageIdText ++
  packageEnvParityProgramModuleGood ++
  packageEnvParityEmitModuleGood

/-- E-bad PE23: ParityTypes typesParityReady always true; L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityTypesReadyText,
    ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedParityTypesReadyText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvKernelMultModuleGood ++
  packageEnvKernelLinearModuleGood ++
  packageEnvKernelTypesModuleGood ++
  packageEnvKernelProgramModuleGood ++
  packageEnvKernelEmitModuleGood ++
  packageEnvEmitMultScaffold ++
  packageEnvParityMultModuleGood ++
  packageEnvParityLinearModuleGood ++
  packageEnvModuleSection "SystemsLean.ParityTypes"
    hostModuleCheckBadParityTypesReadyText ++
  packageEnvParityProgramModuleGood ++
  packageEnvParityEmitModuleGood

/-- E-bad PE24: ParityProgram body ill-typed (wrong stageId); L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityProgramText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedParityProgramText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvKernelMultModuleGood ++
  packageEnvKernelLinearModuleGood ++
  packageEnvKernelTypesModuleGood ++
  packageEnvKernelProgramModuleGood ++
  packageEnvKernelEmitModuleGood ++
  packageEnvEmitMultScaffold ++
  packageEnvParityMultModuleGood ++
  packageEnvParityLinearModuleGood ++
  packageEnvParityTypesModuleGood ++
  packageEnvModuleSection "SystemsLean.ParityProgram"
    hostModuleCheckBadParityProgramStageIdText ++
  packageEnvParityEmitModuleGood

/-- E-bad PE25: ParityProgram programParityReady always true; L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityProgramReadyText,
    ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedParityProgramReadyText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvKernelMultModuleGood ++
  packageEnvKernelLinearModuleGood ++
  packageEnvKernelTypesModuleGood ++
  packageEnvKernelProgramModuleGood ++
  packageEnvKernelEmitModuleGood ++
  packageEnvEmitMultScaffold ++
  packageEnvParityMultModuleGood ++
  packageEnvParityLinearModuleGood ++
  packageEnvParityTypesModuleGood ++
  packageEnvModuleSection "SystemsLean.ParityProgram"
    hostModuleCheckBadParityProgramReadyText ++
  packageEnvParityEmitModuleGood

/-- E-bad PE26: ParityEmit body ill-typed (wrong stageId); L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedParityEmitText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvKernelMultModuleGood ++
  packageEnvKernelLinearModuleGood ++
  packageEnvKernelTypesModuleGood ++
  packageEnvKernelProgramModuleGood ++
  packageEnvKernelEmitModuleGood ++
  packageEnvEmitMultScaffold ++
  packageEnvParityMultModuleGood ++
  packageEnvParityLinearModuleGood ++
  packageEnvParityTypesModuleGood ++
  packageEnvParityProgramModuleGood ++
  packageEnvModuleSection "SystemsLean.ParityEmit"
    hostModuleCheckBadParityEmitStageIdText

/-- E-bad PE27: ParityEmit emitParityReady always true; L0 accepts.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityEmitReadyText,
    ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedParityEmitReadyText : String :=
  packageEnvHeaderReady ++
  packageEnvMultThroughEmitBodyModulesGood ++
  packageEnvCompilePathScaffold ++
  packageEnvKernelMultModuleGood ++
  packageEnvKernelLinearModuleGood ++
  packageEnvKernelTypesModuleGood ++
  packageEnvKernelProgramModuleGood ++
  packageEnvKernelEmitModuleGood ++
  packageEnvEmitMultScaffold ++
  packageEnvParityMultModuleGood ++
  packageEnvParityLinearModuleGood ++
  packageEnvParityTypesModuleGood ++
  packageEnvParityProgramModuleGood ++
  packageEnvModuleSection "SystemsLean.ParityEmit"
    hostModuleCheckBadParityEmitReadyText

/-- E-bad PE2: Linear imports missing module; L0 package tokens accept.
    Greppable: hostModuleCheckBadPackageEnvUnresolvedImportText,
    PACKAGE-ENV-INCOMPLETE. -/
def hostModuleCheckBadPackageEnvUnresolvedImportText : String :=
  packageEnvHeaderReady ++
  packageEnvModuleSection "SystemsLean.Mult" hostModuleCheckGoodMultTermText ++
  packageEnvModuleSection "SystemsLean.Linear"
    ("import SystemsLean.Mult\n" ++
      "import SystemsLean.MissingMod\n" ++
      hostModuleCheckGoodLinearTermText) ++
  packageEnvModuleSection "SystemsLean.Types" packageEnvTypesBodyGood ++
  packageEnvProgramThroughKernelEmitModulesGood

/-- E-bad PE3: packageEnvReady false; L0 package tokens accept.
    Greppable: hostModuleCheckBadPackageEnvNotReadyText, PACKAGE-ENV-INCOMPLETE. -/
def hostModuleCheckBadPackageEnvNotReadyText : String :=
  "packageBand: MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrix-env\n" ++
  "packageElaborateBar: PACKAGE-ELABORATE\n" ++
  "packageEnvReady: false\n" ++
  packageEnvMultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelModulesGood

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixtures
