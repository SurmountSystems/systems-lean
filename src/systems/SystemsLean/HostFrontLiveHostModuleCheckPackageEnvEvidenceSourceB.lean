/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckPackageEnvEvidence.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckPackageEnvEvidenceSourceB.
  Not occupancy name 50. Host tools stay 69 of 69. Not FullHost.
  Not an LLVM backend. Not Lake-gone. Not PROVABLY.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCE,
  liveHostModuleCheckPackageEnvEvidenceSource, liveRel,
  HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceSourceB
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidence

/-- Dual-pinned slice of HostModuleCheckPackageEnvEvidence.lean. -/
def liveHostModuleCheckPackageEnvEvidenceSourceB : String := r#"    Greppable: hostModuleCheckBadPackageEnvIllTypedEmitErasureScaffoldDialectReject. -/
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
"#

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidence
