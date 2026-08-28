/-
  SYSTEMS_LEAN_HOST partial -- Package elaborate L4 env dual-pin evidence.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: PE1..PE44 dialect reject / L0 accept folds + package
  elaborate env Ok gate + native_decide theorems. PE45..PE92 later-fold lives
  in HostModuleCheckPackageEnvEvidenceLater. Dialect + helpers live in
  HostModuleCheckPackageEnv. Same namespace SystemsLean.HostModuleCheck.

  Intentional non-claims:
  - Not package L4 complete. Not seed-wide J1-J12. Not FullHostElaborateRemains.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckPackageEnvEvidence, PACKAGE-ELABORATE,
  MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only,
  hostModuleCheckPackageElaborateEnvOk, packageEnvDialectRejectsOk,
  packageEnvL0AcceptsOk, PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckPackageEnvEvidence
  Red/green: lake build SystemsLean.HostModuleCheckPackageEnvEvidence;
  just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckPackageEnv
import SystemsLean.HostModuleCheckPackageEnvEvidenceLater

namespace SystemsLean.HostModuleCheck

/-! ### Dual-pin evidence folds (Mult..ParityEmit + U2 PE1..PE38) -/

/-- Dialect rejects PE1 ill-typed Mult body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedMultDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedMultDialectReject : Bool :=
  match checkPackageEnvDialect hostModuleCheckBadPackageEnvIllTypedMultText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE4 ill-typed Types body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedTypesDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedTypesDialectReject : Bool :=
  match checkPackageEnvDialect hostModuleCheckBadPackageEnvIllTypedTypesText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE5 ill-typed IrProgram body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProgramDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedProgramDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedProgramText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE6 ill-typed IrGraph body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedGraphDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedGraphDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedGraphText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE7 ill-typed HostCompose body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedComposeDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedComposeDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedComposeText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE8 ill-typed Erasure body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedErasureDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedErasureDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedErasureText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE9 ill-typed Extract body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedExtractDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedExtractDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedExtractText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE10 ill-typed EmitPlan body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitPlanDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedEmitPlanDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedEmitPlanText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE11 ill-typed EmitApply body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitApplyDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedEmitApplyDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedEmitApplyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE12 ill-typed EmitBody body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitBodyDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedEmitBodyDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedEmitBodyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE13 ill-typed KernelMult body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelMultDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedKernelMultDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedKernelMultText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE14 ill-typed KernelLinear body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelLinearDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedKernelLinearDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedKernelLinearText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE15 ill-typed KernelTypes body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelTypesDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedKernelTypesDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedKernelTypesText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE16 ill-typed KernelProgram body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelProgramDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedKernelProgramDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedKernelProgramText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE17 ill-typed KernelEmit body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelEmitDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedKernelEmitDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedKernelEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE18 ill-typed ParityMult body (wrong stageId).
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityMultDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedParityMultDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedParityMultText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE19 ill-typed ParityMult body (ready always true).
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityMultReadyDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedParityMultReadyDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedParityMultReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE20 ill-typed ParityLinear body (wrong stageId).
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityLinearDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedParityLinearDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedParityLinearText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE21 ill-typed ParityLinear body (ready always true).
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityLinearReadyDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedParityLinearReadyDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedParityLinearReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE22 ill-typed ParityTypes body (wrong stageId).
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityTypesDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedParityTypesDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedParityTypesText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE23 ill-typed ParityTypes body (ready always true).
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityTypesReadyDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedParityTypesReadyDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedParityTypesReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE24 ill-typed ParityProgram body (wrong stageId).
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityProgramDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedParityProgramDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedParityProgramText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE25 ill-typed ParityProgram body (ready always true).
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityProgramReadyDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedParityProgramReadyDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedParityProgramReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE26 ill-typed ParityEmit body (wrong stageId).
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityEmitDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedParityEmitDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedParityEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE27 ill-typed ParityEmit body (ready always true).
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityEmitReadyDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedParityEmitReadyDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedParityEmitReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE2 unresolved import.
    Greppable: hostModuleCheckBadPackageEnvUnresolvedImportDialectReject. -/
def hostModuleCheckBadPackageEnvUnresolvedImportDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvUnresolvedImportText with
  | some r => r == reasonPackageEnvIncomplete
  | none => false

/-- Dialect rejects PE3 not ready.
    Greppable: hostModuleCheckBadPackageEnvNotReadyDialectReject. -/
def hostModuleCheckBadPackageEnvNotReadyDialectReject : Bool :=
  match checkPackageEnvDialect hostModuleCheckBadPackageEnvNotReadyText with
  | some r => r == reasonPackageEnvIncomplete
  | none => false

/-- L0 still accepts PE1.
    Greppable: hostModuleCheckBadPackageEnvIllTypedMultL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedMultL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedMultText

/-- L0 still accepts PE4.
    Greppable: hostModuleCheckBadPackageEnvIllTypedTypesL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedTypesL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedTypesText

/-- L0 still accepts PE5.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProgramL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedProgramL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedProgramText

/-- L0 still accepts PE6.
    Greppable: hostModuleCheckBadPackageEnvIllTypedGraphL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedGraphL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedGraphText

/-- L0 still accepts PE7.
    Greppable: hostModuleCheckBadPackageEnvIllTypedComposeL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedComposeL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedComposeText

/-- L0 still accepts PE8.
    Greppable: hostModuleCheckBadPackageEnvIllTypedErasureL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedErasureL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedErasureText

/-- L0 still accepts PE9.
    Greppable: hostModuleCheckBadPackageEnvIllTypedExtractL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedExtractL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedExtractText

/-- L0 still accepts PE10.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitPlanL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedEmitPlanL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedEmitPlanText

/-- L0 still accepts PE11.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitApplyL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedEmitApplyL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedEmitApplyText

/-- L0 still accepts PE12.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitBodyL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedEmitBodyL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedEmitBodyText

/-- L0 still accepts PE13.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelMultL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedKernelMultL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedKernelMultText

/-- L0 still accepts PE14.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelLinearL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedKernelLinearL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedKernelLinearText

/-- L0 still accepts PE15.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelTypesL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedKernelTypesL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedKernelTypesText

/-- L0 still accepts PE16.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelProgramL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedKernelProgramL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedKernelProgramText

/-- L0 still accepts PE17.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelEmitL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedKernelEmitL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedKernelEmitText

/-- L0 still accepts PE18.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityMultL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedParityMultL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedParityMultText

/-- L0 still accepts PE19.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityMultReadyL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedParityMultReadyL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedParityMultReadyText

/-- L0 still accepts PE20.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityLinearL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedParityLinearL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedParityLinearText

/-- L0 still accepts PE21.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityLinearReadyL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedParityLinearReadyL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedParityLinearReadyText

/-- L0 still accepts PE22.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityTypesL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedParityTypesL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedParityTypesText

/-- L0 still accepts PE23.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityTypesReadyL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedParityTypesReadyL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedParityTypesReadyText

/-- L0 still accepts PE24.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityProgramL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedParityProgramL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedParityProgramText

/-- L0 still accepts PE25.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityProgramReadyL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedParityProgramReadyL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedParityProgramReadyText

/-- L0 still accepts PE26.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityEmitL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedParityEmitL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedParityEmitText

/-- L0 still accepts PE27.
    Greppable: hostModuleCheckBadPackageEnvIllTypedParityEmitReadyL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedParityEmitReadyL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedParityEmitReadyText

/-- L0 still accepts PE2.
    Greppable: hostModuleCheckBadPackageEnvUnresolvedImportL0Accept. -/
def hostModuleCheckBadPackageEnvUnresolvedImportL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvUnresolvedImportText

/-- L0 still accepts PE3.
    Greppable: hostModuleCheckBadPackageEnvNotReadyL0Accept. -/
def hostModuleCheckBadPackageEnvNotReadyL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvNotReadyText


/-- Dialect rejects PE28 ill-typed EmitMultScaffold body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitMultScaffoldDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedEmitMultScaffoldDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedEmitMultScaffoldText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE29 ill-typed EmitLinearScaffold body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitLinearScaffoldDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedEmitLinearScaffoldDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedEmitLinearScaffoldText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE30 ill-typed EmitTypesScaffold body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitTypesScaffoldDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedEmitTypesScaffoldDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedEmitTypesScaffoldText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE31 ill-typed EmitProgramScaffold body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitProgramScaffoldDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedEmitProgramScaffoldDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedEmitProgramScaffoldText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE32 ill-typed EmitGraphScaffold body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitGraphScaffoldDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedEmitGraphScaffoldDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedEmitGraphScaffoldText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE33 ill-typed EmitComposeScaffold body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitComposeScaffoldDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedEmitComposeScaffoldDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedEmitComposeScaffoldText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE34 ill-typed EmitErasureScaffold body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitErasureScaffoldDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedEmitErasureScaffoldDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedEmitErasureScaffoldText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE35 ill-typed EmitExtractScaffold body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitExtractScaffoldDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedEmitExtractScaffoldDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedEmitExtractScaffoldText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE36 ill-typed EmitBannerScaffold body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitBannerScaffoldDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedEmitBannerScaffoldDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedEmitBannerScaffoldText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE37 ill-typed KernelSelfApply body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelSelfApplyDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedKernelSelfApplyDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedKernelSelfApplyText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE38 ill-typed ProductOutKernel body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProductOutKernelDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedProductOutKernelDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedProductOutKernelText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE39 ill-typed CompilePath body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedCompilePathText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE40 ill-typed JoinMap body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedJoinMapDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedJoinMapDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedJoinMapText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE41 ill-typed SelfHost body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedSelfHostDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedSelfHostDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedSelfHostText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE42 ill-typed SurfaceMatrix body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedSurfaceMatrixDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedSurfaceMatrixDialectReject : Bool :=
  match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedSurfaceMatrixText with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE43 leftover SpecProof ILLs (ready body true,
    proofCompleteClaimed false).
    Greppable: hostModuleCheckBadPackageEnvIllTypedSpecProofDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedSpecProofDialectReject : Bool :=
  (match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedSpecProofText with
  | some r => r == reasonIllTypedTerm
  | none => false)
    && (match checkPackageEnvDialect
        hostModuleCheckBadPackageEnvIllTypedSpecProofProofCompleteText with
    | some r => r == reasonIllTypedTerm
    | none => false)

/-- Dialect rejects PE44 leftover DualResidual ILLs (ready body true,
    residual-free false, host-free false).
    Greppable: hostModuleCheckBadPackageEnvIllTypedDualResidualDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedDualResidualDialectReject : Bool :=
  (match checkPackageEnvDialect
      hostModuleCheckBadPackageEnvIllTypedDualResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false)
    && (match checkPackageEnvDialect
        hostModuleCheckBadPackageEnvIllTypedDualResidualResidualFreeText with
    | some r => r == reasonIllTypedTerm
    | none => false)
    && (match checkPackageEnvDialect
        hostModuleCheckBadPackageEnvIllTypedDualResidualHostFreeText with
    | some r => r == reasonIllTypedTerm
    | none => false)

/-- L0 still accepts PE28.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitMultScaffoldL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedEmitMultScaffoldL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedEmitMultScaffoldText

/-- L0 still accepts PE29.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitLinearScaffoldL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedEmitLinearScaffoldL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedEmitLinearScaffoldText

/-- L0 still accepts PE30.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitTypesScaffoldL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedEmitTypesScaffoldL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedEmitTypesScaffoldText

/-- L0 still accepts PE31.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitProgramScaffoldL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedEmitProgramScaffoldL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedEmitProgramScaffoldText

/-- L0 still accepts PE32.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitGraphScaffoldL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedEmitGraphScaffoldL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedEmitGraphScaffoldText

/-- L0 still accepts PE33.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitComposeScaffoldL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedEmitComposeScaffoldL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedEmitComposeScaffoldText

/-- L0 still accepts PE34.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitErasureScaffoldL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedEmitErasureScaffoldL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedEmitErasureScaffoldText

/-- L0 still accepts PE35.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitExtractScaffoldL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedEmitExtractScaffoldL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedEmitExtractScaffoldText

/-- L0 still accepts PE36.
    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitBannerScaffoldL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedEmitBannerScaffoldL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedEmitBannerScaffoldText

/-- L0 still accepts PE37.
    Greppable: hostModuleCheckBadPackageEnvIllTypedKernelSelfApplyL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedKernelSelfApplyL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedKernelSelfApplyText

/-- L0 still accepts PE38.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProductOutKernelL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedProductOutKernelL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedProductOutKernelText

/-- L0 still accepts PE39.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedCompilePathText

/-- L0 still accepts PE40.
    Greppable: hostModuleCheckBadPackageEnvIllTypedJoinMapL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedJoinMapL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedJoinMapText

/-- L0 still accepts PE41.
    Greppable: hostModuleCheckBadPackageEnvIllTypedSelfHostL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedSelfHostL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedSelfHostText

/-- L0 still accepts PE42.
    Greppable: hostModuleCheckBadPackageEnvIllTypedSurfaceMatrixL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedSurfaceMatrixL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedSurfaceMatrixText

/-- L0 still accepts PE43 leftover SpecProof ILLs.
    Greppable: hostModuleCheckBadPackageEnvIllTypedSpecProofL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedSpecProofL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedSpecProofText
    && checkPackageEnvL0
      hostModuleCheckBadPackageEnvIllTypedSpecProofProofCompleteText

/-- L0 still accepts PE44 leftover DualResidual ILLs.
    Greppable: hostModuleCheckBadPackageEnvIllTypedDualResidualL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedDualResidualL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedDualResidualText
    && checkPackageEnvL0
      hostModuleCheckBadPackageEnvIllTypedDualResidualResidualFreeText
    && checkPackageEnvL0
      hostModuleCheckBadPackageEnvIllTypedDualResidualHostFreeText

/-- E-bad dialect rejects fold (PE1..PE86 + PE2 + PE3).
    Greppable: packageEnvDialectRejectsOk. -/
def packageEnvDialectRejectsOk : Bool :=
  hostModuleCheckBadPackageEnvIllTypedMultDialectReject
    && hostModuleCheckBadPackageEnvIllTypedTypesDialectReject
    && hostModuleCheckBadPackageEnvIllTypedProgramDialectReject
    && hostModuleCheckBadPackageEnvIllTypedGraphDialectReject
    && hostModuleCheckBadPackageEnvIllTypedComposeDialectReject
    && hostModuleCheckBadPackageEnvIllTypedErasureDialectReject
    && hostModuleCheckBadPackageEnvIllTypedExtractDialectReject
    && hostModuleCheckBadPackageEnvIllTypedEmitPlanDialectReject
    && hostModuleCheckBadPackageEnvIllTypedEmitApplyDialectReject
    && hostModuleCheckBadPackageEnvIllTypedEmitBodyDialectReject
    && hostModuleCheckBadPackageEnvIllTypedKernelMultDialectReject
    && hostModuleCheckBadPackageEnvIllTypedKernelLinearDialectReject
    && hostModuleCheckBadPackageEnvIllTypedKernelTypesDialectReject
    && hostModuleCheckBadPackageEnvIllTypedKernelProgramDialectReject
    && hostModuleCheckBadPackageEnvIllTypedKernelEmitDialectReject
    && hostModuleCheckBadPackageEnvIllTypedParityMultDialectReject
    && hostModuleCheckBadPackageEnvIllTypedParityMultReadyDialectReject
    && hostModuleCheckBadPackageEnvIllTypedParityLinearDialectReject
    && hostModuleCheckBadPackageEnvIllTypedParityLinearReadyDialectReject
    && hostModuleCheckBadPackageEnvIllTypedParityTypesDialectReject
    && hostModuleCheckBadPackageEnvIllTypedParityTypesReadyDialectReject
    && hostModuleCheckBadPackageEnvIllTypedParityProgramDialectReject
    && hostModuleCheckBadPackageEnvIllTypedParityProgramReadyDialectReject
    && hostModuleCheckBadPackageEnvIllTypedParityEmitDialectReject
    && hostModuleCheckBadPackageEnvIllTypedParityEmitReadyDialectReject
    && hostModuleCheckBadPackageEnvIllTypedEmitMultScaffoldDialectReject
    && hostModuleCheckBadPackageEnvIllTypedEmitLinearScaffoldDialectReject
    && hostModuleCheckBadPackageEnvIllTypedEmitTypesScaffoldDialectReject
    && hostModuleCheckBadPackageEnvIllTypedEmitProgramScaffoldDialectReject
    && hostModuleCheckBadPackageEnvIllTypedEmitGraphScaffoldDialectReject
    && hostModuleCheckBadPackageEnvIllTypedEmitComposeScaffoldDialectReject
    && hostModuleCheckBadPackageEnvIllTypedEmitErasureScaffoldDialectReject
    && hostModuleCheckBadPackageEnvIllTypedEmitExtractScaffoldDialectReject
    && hostModuleCheckBadPackageEnvIllTypedEmitBannerScaffoldDialectReject
    && hostModuleCheckBadPackageEnvIllTypedKernelSelfApplyDialectReject
    && hostModuleCheckBadPackageEnvIllTypedProductOutKernelDialectReject
    && hostModuleCheckBadPackageEnvIllTypedCompilePathDialectReject
    && hostModuleCheckBadPackageEnvIllTypedJoinMapDialectReject
    && hostModuleCheckBadPackageEnvIllTypedSelfHostDialectReject
    && hostModuleCheckBadPackageEnvIllTypedSurfaceMatrixDialectReject
    && hostModuleCheckBadPackageEnvIllTypedSpecProofDialectReject
    && hostModuleCheckBadPackageEnvIllTypedDualResidualDialectReject
    && hostModuleCheckBadPackageEnvIllTypedCompilePathMultDialectReject
    && hostModuleCheckBadPackageEnvIllTypedCompilePathLinearDialectReject
    && hostModuleCheckBadPackageEnvIllTypedCompilePathTypesDialectReject
    && hostModuleCheckBadPackageEnvIllTypedCompilePathProgramDialectReject
    && hostModuleCheckBadPackageEnvIllTypedCompilePathGraphDialectReject
    && hostModuleCheckBadPackageEnvIllTypedCompilePathComposeDialectReject
    && hostModuleCheckBadPackageEnvIllTypedCompilePathErasureDialectReject
    && hostModuleCheckBadPackageEnvIllTypedCompilePathExtractDialectReject
    && hostModuleCheckBadPackageEnvIllTypedCompilePathPlanDialectReject
    && hostModuleCheckBadPackageEnvIllTypedCompilePathApplyDialectReject
    && hostModuleCheckBadPackageEnvIllTypedCompilePathBodyDialectReject
    && hostModuleCheckBadPackageEnvIllTypedFirstSurfaceDialectReject
    && hostModuleCheckBadPackageEnvIllTypedLinearSubsetEmitDialectReject
    && hostModuleCheckBadPackageEnvIllTypedTypesSubsetEmitDialectReject
    && hostModuleCheckBadPackageEnvIllTypedProgramSubsetEmitDialectReject
    && hostModuleCheckBadPackageEnvIllTypedGraphSubsetEmitDialectReject
    && hostModuleCheckBadPackageEnvIllTypedComposeSubsetEmitDialectReject
    && hostModuleCheckBadPackageEnvIllTypedErasureSubsetEmitDialectReject
    && hostModuleCheckBadPackageEnvIllTypedExtractSubsetEmitDialectReject
    && hostModuleCheckBadPackageEnvIllTypedMultSubsetEmitDialectReject
    && hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildDialectReject
    && hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildDialectReject
    && hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildDialectReject
    && hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildDialectReject
    && hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildDialectReject
    && hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildDialectReject
    && hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildDialectReject
    && hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildDialectReject
    && hostModuleCheckBadPackageEnvIllTypedHostFrontDialectReject
    && hostModuleCheckBadPackageEnvIllTypedLlvmMultTextDialectReject
    && hostModuleCheckBadPackageEnvIllTypedHostCheckDialectReject
    && hostModuleCheckBadPackageEnvIllTypedHostGraphDialectReject
    && hostModuleCheckBadPackageEnvIllTypedLlvmLinearTextDialectReject
    && hostModuleCheckBadPackageEnvIllTypedMultFsWriteToolDialectReject
    && hostModuleCheckBadPackageEnvIllTypedFrontMultPackageDialectReject
    && hostModuleCheckBadPackageEnvIllTypedSubsetPackageJoinDialectReject
    && hostModuleCheckBadPackageEnvIllTypedLlvmTypesTextDialectReject
    && hostModuleCheckBadPackageEnvIllTypedMultFsDeepenDialectReject
    && hostModuleCheckBadPackageEnvIllTypedHostPackageWriteDialectReject
    && hostModuleCheckBadPackageEnvIllTypedLlvmProgramTextDialectReject
    && hostModuleCheckBadPackageEnvIllTypedLlvmGraphTextDialectReject
    && hostModuleCheckBadPackageEnvIllTypedLlvmComposeTextDialectReject
    && hostModuleCheckBadPackageEnvIllTypedSelfApplyFsDialectReject
    && hostModuleCheckBadPackageEnvIllTypedInventoryCloseDialectReject
    && hostModuleCheckBadPackageEnvIllTypedProductPathBarsDialectReject
    && hostModuleCheckBadPackageEnvIllTypedProductPathDialectReject
    && hostModuleCheckBadPackageEnvIllTypedProbeWireDialectReject
    && hostModuleCheckBadPackageEnvIllTypedSelfHostBodyDialectReject
    && hostModuleCheckBadPackageEnvUnresolvedImportDialectReject
    && hostModuleCheckBadPackageEnvNotReadyDialectReject

/-- L0 accept fold for all PE twins.
    Greppable: packageEnvL0AcceptsOk. -/
def packageEnvL0AcceptsOk : Bool :=
  hostModuleCheckBadPackageEnvIllTypedMultL0Accept
    && hostModuleCheckBadPackageEnvIllTypedTypesL0Accept
    && hostModuleCheckBadPackageEnvIllTypedProgramL0Accept
    && hostModuleCheckBadPackageEnvIllTypedGraphL0Accept
    && hostModuleCheckBadPackageEnvIllTypedComposeL0Accept
    && hostModuleCheckBadPackageEnvIllTypedErasureL0Accept
    && hostModuleCheckBadPackageEnvIllTypedExtractL0Accept
    && hostModuleCheckBadPackageEnvIllTypedEmitPlanL0Accept
    && hostModuleCheckBadPackageEnvIllTypedEmitApplyL0Accept
    && hostModuleCheckBadPackageEnvIllTypedEmitBodyL0Accept
    && hostModuleCheckBadPackageEnvIllTypedKernelMultL0Accept
    && hostModuleCheckBadPackageEnvIllTypedKernelLinearL0Accept
    && hostModuleCheckBadPackageEnvIllTypedKernelTypesL0Accept
    && hostModuleCheckBadPackageEnvIllTypedKernelProgramL0Accept
    && hostModuleCheckBadPackageEnvIllTypedKernelEmitL0Accept
    && hostModuleCheckBadPackageEnvIllTypedParityMultL0Accept
    && hostModuleCheckBadPackageEnvIllTypedParityMultReadyL0Accept
    && hostModuleCheckBadPackageEnvIllTypedParityLinearL0Accept
    && hostModuleCheckBadPackageEnvIllTypedParityLinearReadyL0Accept
    && hostModuleCheckBadPackageEnvIllTypedParityTypesL0Accept
    && hostModuleCheckBadPackageEnvIllTypedParityTypesReadyL0Accept
    && hostModuleCheckBadPackageEnvIllTypedParityProgramL0Accept
    && hostModuleCheckBadPackageEnvIllTypedParityProgramReadyL0Accept
    && hostModuleCheckBadPackageEnvIllTypedParityEmitL0Accept
    && hostModuleCheckBadPackageEnvIllTypedParityEmitReadyL0Accept
    && hostModuleCheckBadPackageEnvIllTypedEmitMultScaffoldL0Accept
    && hostModuleCheckBadPackageEnvIllTypedEmitLinearScaffoldL0Accept
    && hostModuleCheckBadPackageEnvIllTypedEmitTypesScaffoldL0Accept
    && hostModuleCheckBadPackageEnvIllTypedEmitProgramScaffoldL0Accept
    && hostModuleCheckBadPackageEnvIllTypedEmitGraphScaffoldL0Accept
    && hostModuleCheckBadPackageEnvIllTypedEmitComposeScaffoldL0Accept
    && hostModuleCheckBadPackageEnvIllTypedEmitErasureScaffoldL0Accept
    && hostModuleCheckBadPackageEnvIllTypedEmitExtractScaffoldL0Accept
    && hostModuleCheckBadPackageEnvIllTypedEmitBannerScaffoldL0Accept
    && hostModuleCheckBadPackageEnvIllTypedKernelSelfApplyL0Accept
    && hostModuleCheckBadPackageEnvIllTypedProductOutKernelL0Accept
    && hostModuleCheckBadPackageEnvIllTypedCompilePathL0Accept
    && hostModuleCheckBadPackageEnvIllTypedJoinMapL0Accept
    && hostModuleCheckBadPackageEnvIllTypedSelfHostL0Accept
    && hostModuleCheckBadPackageEnvIllTypedSurfaceMatrixL0Accept
    && hostModuleCheckBadPackageEnvIllTypedSpecProofL0Accept
    && hostModuleCheckBadPackageEnvIllTypedDualResidualL0Accept
    && hostModuleCheckBadPackageEnvIllTypedCompilePathMultL0Accept
    && hostModuleCheckBadPackageEnvIllTypedCompilePathLinearL0Accept
    && hostModuleCheckBadPackageEnvIllTypedCompilePathTypesL0Accept
    && hostModuleCheckBadPackageEnvIllTypedCompilePathProgramL0Accept
    && hostModuleCheckBadPackageEnvIllTypedCompilePathGraphL0Accept
    && hostModuleCheckBadPackageEnvIllTypedCompilePathComposeL0Accept
    && hostModuleCheckBadPackageEnvIllTypedCompilePathErasureL0Accept
    && hostModuleCheckBadPackageEnvIllTypedCompilePathExtractL0Accept
    && hostModuleCheckBadPackageEnvIllTypedCompilePathPlanL0Accept
    && hostModuleCheckBadPackageEnvIllTypedCompilePathApplyL0Accept
    && hostModuleCheckBadPackageEnvIllTypedCompilePathBodyL0Accept
    && hostModuleCheckBadPackageEnvIllTypedFirstSurfaceL0Accept
    && hostModuleCheckBadPackageEnvIllTypedLinearSubsetEmitL0Accept
    && hostModuleCheckBadPackageEnvIllTypedTypesSubsetEmitL0Accept
    && hostModuleCheckBadPackageEnvIllTypedProgramSubsetEmitL0Accept
    && hostModuleCheckBadPackageEnvIllTypedGraphSubsetEmitL0Accept
    && hostModuleCheckBadPackageEnvIllTypedComposeSubsetEmitL0Accept
    && hostModuleCheckBadPackageEnvIllTypedErasureSubsetEmitL0Accept
    && hostModuleCheckBadPackageEnvIllTypedExtractSubsetEmitL0Accept
    && hostModuleCheckBadPackageEnvIllTypedMultSubsetEmitL0Accept
    && hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildL0Accept
    && hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildL0Accept
    && hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildL0Accept
    && hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildL0Accept
    && hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildL0Accept
    && hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildL0Accept
    && hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildL0Accept
    && hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildL0Accept
    && hostModuleCheckBadPackageEnvIllTypedHostFrontL0Accept
    && hostModuleCheckBadPackageEnvIllTypedLlvmMultTextL0Accept
    && hostModuleCheckBadPackageEnvIllTypedHostCheckL0Accept
    && hostModuleCheckBadPackageEnvIllTypedHostGraphL0Accept
    && hostModuleCheckBadPackageEnvIllTypedLlvmLinearTextL0Accept
    && hostModuleCheckBadPackageEnvIllTypedMultFsWriteToolL0Accept
    && hostModuleCheckBadPackageEnvIllTypedFrontMultPackageL0Accept
    && hostModuleCheckBadPackageEnvIllTypedSubsetPackageJoinL0Accept
    && hostModuleCheckBadPackageEnvIllTypedLlvmTypesTextL0Accept
    && hostModuleCheckBadPackageEnvIllTypedMultFsDeepenL0Accept
    && hostModuleCheckBadPackageEnvIllTypedHostPackageWriteL0Accept
    && hostModuleCheckBadPackageEnvIllTypedLlvmProgramTextL0Accept
    && hostModuleCheckBadPackageEnvIllTypedLlvmGraphTextL0Accept
    && hostModuleCheckBadPackageEnvIllTypedLlvmComposeTextL0Accept
    && hostModuleCheckBadPackageEnvIllTypedSelfApplyFsL0Accept
    && hostModuleCheckBadPackageEnvIllTypedInventoryCloseL0Accept
    && hostModuleCheckBadPackageEnvIllTypedProductPathBarsL0Accept
    && hostModuleCheckBadPackageEnvIllTypedProductPathL0Accept
    && hostModuleCheckBadPackageEnvIllTypedProbeWireL0Accept
    && hostModuleCheckBadPackageEnvIllTypedSelfHostBodyL0Accept
    && hostModuleCheckBadPackageEnvUnresolvedImportL0Accept
    && hostModuleCheckBadPackageEnvNotReadyL0Accept

/-- Combined package L4 Mult..ParityEmit + U2-env dual-pin gate (not bare dualOk).
    Greppable: hostModuleCheckPackageElaborateEnvOk, PACKAGE-ELABORATE,
    MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only,
    packageElaborateEnvBand. -/
def hostModuleCheckPackageElaborateEnvOk : Bool :=
  hostModuleCheckPackageElaborateEnvDualOk
    && (checkDepthPackageElaborateBar == "PACKAGE-ELABORATE")
    && (checkDepthPackageElaborateEnvScope ==
      "MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only")
    && packageEnvTermSurfaceOk
    && hostModuleCheckPackageEnvDialectOk
    && packageEnvDialectRejectsOk
    && packageEnvL0AcceptsOk

-- Chunked native_decide evidence (U2 package-env fixture size).
set_option maxRecDepth 32768

/-- Greppable: hostModuleCheckPackageEnvDialectOk_true, PACKAGE-ELABORATE. -/
theorem hostModuleCheckPackageEnvDialectOk_true :
    hostModuleCheckPackageEnvDialectOk = true := by native_decide

/-- Greppable: packageEnvDialectRejectsOk_true, PACKAGE-ELABORATE. -/
theorem packageEnvDialectRejectsOk_true :
    packageEnvDialectRejectsOk = true := by native_decide

/-- Greppable: packageEnvL0AcceptsOk_true, PACKAGE-ELABORATE. -/
theorem packageEnvL0AcceptsOk_true :
    packageEnvL0AcceptsOk = true := by native_decide

/-- Compact theorems for Mult..ParityEmit + U2 env band.
    Greppable: hostModuleCheckPackageElaborateEnvOk_true, PACKAGE-ELABORATE. -/
theorem hostModuleCheckPackageElaborateEnvOk_true :
    hostModuleCheckPackageElaborateEnvOk = true := by
  unfold hostModuleCheckPackageElaborateEnvOk
  rw [hostModuleCheckPackageEnvDialectOk_true, packageEnvDialectRejectsOk_true,
      packageEnvL0AcceptsOk_true]
  native_decide

theorem hostModuleCheck_package_elaborate_env_band_ids_eq :
    checkDepthPackageElaborateBar = "PACKAGE-ELABORATE"
      && checkDepthPackageElaborateEnvScope =
        "MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only"
      && hostModuleCheckPackageElaborateEnvDualOk = true := rfl

end SystemsLean.HostModuleCheck
