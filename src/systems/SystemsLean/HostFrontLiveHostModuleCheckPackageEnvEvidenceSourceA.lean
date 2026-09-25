/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckPackageEnvEvidence.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckPackageEnvEvidenceSourceA.
  Not occupancy name 50. Host tools stay 69 of 69. Not FullHost.
  Not an LLVM backend. Not Lake-gone. Not PROVABLY.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCE,
  liveHostModuleCheckPackageEnvEvidenceSource, liveRel,
  HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceSourceA
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidence

/-- Dual-pinned slice of HostModuleCheckPackageEnvEvidence.lean. -/
def liveHostModuleCheckPackageEnvEvidenceSourceA : String := r#"/-
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
"#

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidence
