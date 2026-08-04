/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck dual-pin fixture texts.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.HostModuleCheck: good/bad structural fixture
  strings live here; seed surfaces, structural checks, readiness pins, and
  driver IO stay in HostModuleCheck. Same namespace SystemsLean.HostModuleCheck.

  Spec (readable):
  - Minimal good Mult/Linear/Types/IrProgram/IrGraph/HostCompose/Erasure/Extract
    (+Theorems) fixture texts.
  - Fail-closed Mult-shaped bad fixture texts (missing inductive / namespace /
    empty / missing theorem).

  Intentional non-claims:
  - PARTIAL-STRUCTURAL fixture soup only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckFixtures,
  hostModuleCheckGoodMultText, hostModuleCheckGoodIrProgramText,
  hostModuleCheckGoodIrGraphText, hostModuleCheckGoodHostComposeText,
  hostModuleCheckGoodErasureText, hostModuleCheckGoodExtractText,
  hostModuleCheckBadMissingInductiveText,
  PARTIAL-STRUCTURAL, Host library seed expand continue, Host real module seed expand,
  Host theorem check expand,
  Host compose module expand, Host graph module expand, Host program module expand,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostModuleCheckFixtures
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheck.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

namespace SystemsLean.HostModuleCheck

/-! ### Required key-decl lists (long-file seam; used by HostModuleCheck) -/

/-- Required Mult key decls (structural). Greppable: multRequiredDecls. -/
def multRequiredDecls : List String :=
  ["inductive:Mult",
   "def:name",
   "def:isValid",
   "def:ofNat?",
   "def:isValidTag",
   "def:multIsValid"]

/-- Required MultTheorems key decls (A7 corpus expand; names from MultTheorems.lean).
    Greppable: multTheoremsRequiredDecls, Host theorem check expand. -/
def multTheoremsRequiredDecls : List String :=
  ["theorem:ofNat?_zero",
   "theorem:ofNat?_one",
   "theorem:ofNat?_two",
   "theorem:ofNat?_fail_closed",
   "theorem:isValidTag_zero",
   "theorem:isValidTag_one",
   "theorem:isValidTag_two",
   "theorem:isValidTag_fail_closed"]

/-- Required Linear key decls. Greppable: linearRequiredDecls. -/
def linearRequiredDecls : List String :=
  ["def:shareNat",
   "def:polyId",
   "def:mult0ClassId",
   "def:mult1ClassId",
   "def:multOmegaClassId",
   "def:linearExactOnceId",
   "def:linearAxiomInventoryOk"]

/-- Required LinearTheorems key decls (A7 corpus expand; names from LinearTheorems.lean).
    Greppable: linearTheoremsRequiredDecls, Host theorem check expand. -/
def linearTheoremsRequiredDecls : List String :=
  ["theorem:shareNat_eq",
   "theorem:shareNat_zero",
   "theorem:shareNat_succ",
   "theorem:polyId_id",
   "theorem:mult0ClassId_eq",
   "theorem:mult1ClassId_eq",
   "theorem:multOmegaClassId_eq",
   "theorem:linearAxiomInventoryOk_true"]

/-- Required Types key decls. Greppable: typesRequiredDecls. -/
def typesRequiredDecls : List String :=
  ["inductive:NodeKind",
   "def:typeTagInit",
   "def:kindMultOk",
   "def:ofKindTag?",
   "def:isValidKindTag",
   "def:mkNode?"]

/-- Required TypesTheorems key decls (A7 corpus expand; names from TypesTheorems.lean).
    Greppable: typesTheoremsRequiredDecls, Host theorem check expand. -/
def typesTheoremsRequiredDecls : List String :=
  ["theorem:ofKindTag?_zero",
   "theorem:ofKindTag?_one",
   "theorem:ofKindTag?_two",
   "theorem:ofKindTag?_fail_closed",
   "theorem:isValidKindTag_zero",
   "theorem:isValidKindTag_one",
   "theorem:isValidKindTag_two",
   "theorem:isValidKindTag_fail_closed"]

/-- Required IrProgram key decls. Greppable: irProgramRequiredDecls. -/
def irProgramRequiredDecls : List String :=
  ["def:programCap",
   "def:empty",
   "def:push",
   "def:isWellTyped",
   "def:foldWellTyped",
   "def:checkFailClosed"]

/-- Required IrProgramTheorems key decls (A7 corpus expand).
    Greppable: irProgramTheoremsRequiredDecls, Host theorem check expand. -/
def irProgramTheoremsRequiredDecls : List String :=
  ["theorem:empty_isEmpty",
   "theorem:empty_length_zero",
   "theorem:programCap_eq_eight",
   "theorem:isWellTyped_empty_false",
   "theorem:empty_not_well_typed",
   "theorem:checkFailClosed_eq_isWellTyped"]

/-- Required IrGraph key decls. Greppable: irGraphRequiredDecls. -/
def irGraphRequiredDecls : List String :=
  ["def:edgeMax",
   "def:empty",
   "def:pushNode",
   "def:addEdge",
   "def:isWellTyped",
   "def:checkFailClosed"]

/-- Required IrGraphTheorems key decls (A7 corpus expand).
    Greppable: irGraphTheoremsRequiredDecls, Host theorem check expand. -/
def irGraphTheoremsRequiredDecls : List String :=
  ["theorem:isWellTyped_empty_true",
   "theorem:empty_well_typed",
   "theorem:empty_isEmpty",
   "theorem:edgeMax_eq_sixteen",
   "theorem:checkFailClosed_eq_isWellTyped",
   "theorem:edgesSound_empty"]

/-- Required HostCompose key decls (Compose unit). Greppable: hostComposeRequiredDecls. -/
def hostComposeRequiredDecls : List String :=
  ["def:empty",
   "def:mint",
   "def:consume",
   "def:pushHostNode",
   "def:addHostEdge",
   "def:checkFailClosed"]

/-- Required HostComposeTheorems key decls (A7 corpus expand).
    Greppable: hostComposeTheoremsRequiredDecls, Host theorem check expand. -/
def hostComposeTheoremsRequiredDecls : List String :=
  ["theorem:multPreScan_empty_true",
   "theorem:checkFailClosed_empty_true",
   "theorem:extractOkFs_empty_true",
   "theorem:mint_zero_badId",
   "theorem:consume_empty_notLive",
   "theorem:extractOkFs_eq",
   "theorem:checkFailClosed_eq",
   "theorem:mint_empty_one_ok"]

/-- Required Erasure key decls (real module seed expand).
    Greppable: erasureRequiredDecls, Host real module seed expand. -/
def erasureRequiredDecls : List String :=
  ["def:unmarked",
   "def:mark",
   "def:isRuntimeAbsent",
   "def:isErasureGrade",
   "def:markForGrade?",
   "def:checkFailClosed"]

/-- Required ErasureTheorems key decls (real module seed expand).
    Greppable: erasureTheoremsRequiredDecls, Host real module seed expand. -/
def erasureTheoremsRequiredDecls : List String :=
  ["theorem:isRuntimeAbsent_unmarked_false",
   "theorem:isRuntimeAbsent_mark_true",
   "theorem:isErasureGrade_mult0",
   "theorem:isErasureGrade_mult1_false",
   "theorem:markForGrade?_mult0_some",
   "theorem:markForGrade?_mult1_none",
   "theorem:checkFailClosed_unmarked_false",
   "theorem:checkFailClosed_eq"]

/-- Required Extract key decls (real module seed expand).
    Greppable: extractRequiredDecls, Host real module seed expand. -/
def extractRequiredDecls : List String :=
  ["inductive:RuntimeClaim",
   "def:isFreestandingGoal",
   "def:ofRuntimeTag?",
   "def:isValidRuntimeTag",
   "def:checkFailClosed",
   "def:extractOk"]

/-- Required ExtractTheorems key decls (real module seed expand).
    Greppable: extractTheoremsRequiredDecls, Host real module seed expand. -/
def extractTheoremsRequiredDecls : List String :=
  ["theorem:isFreestandingGoal_runtimeFs",
   "theorem:isFreestandingGoal_classic_false",
   "theorem:extractOk_classic_reject",
   "theorem:extractOk_mult0_unmarked_false",
   "theorem:ofRuntimeTag?_zero",
   "theorem:ofRuntimeTag?_fail_closed",
   "theorem:isValidRuntimeTag_zero",
   "theorem:isValidRuntimeTag_fail_closed"]

/-- Required CompilePath key decls (library seed expand continue).
    Greppable: compilePathRequiredDecls, Host library seed expand continue. -/
def compilePathRequiredDecls : List String :=
  ["def:stageId",
   "def:hostCompilePathId",
   "def:gradeSurfaceOk",
   "def:checkHost",
   "def:extractFsOk",
   "def:compileReady"]

/-- Required KernelMult key decls (library seed expand continue).
    Greppable: kernelMultRequiredDecls, Host library seed expand continue. -/
def kernelMultRequiredDecls : List String :=
  ["def:stageId",
   "def:kernelMultId",
   "def:mkGradeNode",
   "def:lowerMultKernel",
   "def:multKernelReady",
   "def:kernelOk"]

/-- Required KernelLinear key decls (library seed expand continue).
    Greppable: kernelLinearRequiredDecls, Host library seed expand continue. -/
def kernelLinearRequiredDecls : List String :=
  ["def:stageId",
   "def:kernelLinearId",
   "def:mkLinearNode",
   "def:lowerLinearKernel",
   "def:linearKernelReady",
   "def:linearKernelOk"]

/-- Required KernelTypes key decls (library seed expand continue).
    Greppable: kernelTypesRequiredDecls, Host library seed expand continue. -/
def kernelTypesRequiredDecls : List String :=
  ["def:stageId",
   "def:kernelTypesId",
   "def:mkTypedNode",
   "def:lowerTypesKernel",
   "def:typesKernelReady",
   "def:typesKernelOk"]

/-- Required KernelProgram key decls (library seed expand continue).
    Greppable: kernelProgramRequiredDecls, Host library seed expand continue. -/
def kernelProgramRequiredDecls : List String :=
  ["def:stageId",
   "def:kernelProgramId",
   "def:mkProgramNode",
   "def:lowerProgramKernel",
   "def:programKernelReady",
   "def:programKernelOk"]

/-- Required KernelMultTheorems key decls (library seed expand continue).
    Greppable: kernelMultTheoremsRequiredDecls, Host library seed expand continue. -/
def kernelMultTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:kernelMultId_eq",
   "theorem:multKernelReady_true",
   "theorem:kernelOk_true",
   "theorem:lowerMultKernel_isSome",
   "theorem:unknownTagRejected_true",
   "theorem:multKernelProgram_length_three",
   "theorem:multKernelProgram_isWellTyped"]

/-- Required KernelLinearTheorems key decls (library seed expand continue).
    Greppable: kernelLinearTheoremsRequiredDecls, Host library seed expand continue. -/
def kernelLinearTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:kernelLinearId_eq",
   "theorem:linearKernelReady_true",
   "theorem:linearKernelOk_true",
   "theorem:lowerLinearKernel_isSome",
   "theorem:linearMismatchRejected_true",
   "theorem:linearKernelProgram_length_one",
   "theorem:linearKernelProgram_isWellTyped"]

/-- Required KernelTypesTheorems key decls (library seed expand continue).
    Greppable: kernelTypesTheoremsRequiredDecls, Host library seed expand continue. -/
def kernelTypesTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:kernelTypesId_eq",
   "theorem:typesKernelReady_true",
   "theorem:typesKernelOk_true",
   "theorem:lowerTypesKernel_isSome",
   "theorem:unknownKindRejected_true",
   "theorem:typesKernelProgram_length_three",
   "theorem:typesKernelProgram_isWellTyped"]

/-- Required KernelProgramTheorems key decls (library seed expand continue).
    Greppable: kernelProgramTheoremsRequiredDecls, Host library seed expand continue. -/
def kernelProgramTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:kernelProgramId_eq",
   "theorem:programKernelReady_true",
   "theorem:programKernelOk_true",
   "theorem:lowerProgramKernel_isSome",
   "theorem:programPathReady_true",
   "theorem:programKernelProgram_length_three",
   "theorem:programKernelProgram_isWellTyped"]

/-- Required JoinMap key decls (library seed expand continue).
    Greppable: joinMapRequiredDecls, Host library seed expand continue. -/
def joinMapRequiredDecls : List String :=
  ["def:stageId",
   "def:hostJoinMapId",
   "def:joinMapId",
   "def:joinAlgContractOk",
   "def:joinUnitCompileReady",
   "def:joinProgramCompileReady"]

/-- Required JoinMapTheorems key decls (library seed expand continue).
    Greppable: joinMapTheoremsRequiredDecls, Host library seed expand continue. -/
def joinMapTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostJoinMapId_eq",
   "theorem:joinAlgUseOk_true",
   "theorem:joinAlgContractOk_true",
   "theorem:joinCompileReady_eq_joinUnitCompileReady",
   "theorem:joinUnitCompileReady_empty_true",
   "theorem:joinProgramCompileReady_empty_false",
   "theorem:empty_host_ok_ne_empty_program_ok"]

/-- Required SelfHost key decls (library seed expand continue).
    Greppable: selfHostRequiredDecls, Host library seed expand continue. -/
def selfHostRequiredDecls : List String :=
  ["def:stageId",
   "def:hostSelfHostId",
   "def:selfHostId",
   "def:hostSurfaceOk",
   "def:selfHostUnitReady",
   "def:selfHostProgramReady"]

/-- Required SelfHostTheorems key decls (library seed expand continue).
    Greppable: selfHostTheoremsRequiredDecls, Host library seed expand continue. -/
def selfHostTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostSelfHostId_eq",
   "theorem:hostSurfaceOk_true",
   "theorem:selfHostReady_eq_selfHostUnitReady",
   "theorem:selfHostUnitReady_empty_true",
   "theorem:selfHostProgramReady_empty_false",
   "theorem:empty_host_ok_ne_empty_program_ok",
   "theorem:selfHostUnitReady_mult1_unminted_false"]

/-- Required SurfaceMatrix key decls (library seed expand continue).
    Greppable: surfaceMatrixRequiredDecls, Host library seed expand continue. -/
def surfaceMatrixRequiredDecls : List String :=
  ["def:stageId",
   "def:hostSurfaceMatrixId",
   "def:surfaceMatrixId",
   "def:matrixSurfaceOk",
   "def:matrixUnitReady",
   "def:matrixProgramReady"]

/-- Required SurfaceMatrixTheorems key decls (library seed expand continue).
    Greppable: surfaceMatrixTheoremsRequiredDecls, Host library seed expand continue. -/
def surfaceMatrixTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostSurfaceMatrixId_eq",
   "theorem:surfaceMatrixId_eq",
   "theorem:matrixSurfaceOk_true",
   "theorem:matrixUnitReady_empty_true",
   "theorem:matrixProgramReady_empty_false",
   "theorem:empty_host_ok_ne_empty_program_ok",
   "theorem:matrixUnitReady_mult1_unminted_false"]

/-- Required EmitMultScaffold key decls (library seed expand continue).
    Greppable: emitMultScaffoldRequiredDecls, Host library seed expand continue. -/
def emitMultScaffoldRequiredDecls : List String :=
  ["def:stageId",
   "def:hostEmitMultId",
   "def:selfHostEmitMultId",
   "def:acceptancePath",
   "def:hostModulePath",
   "def:ssotArtifactPath"]

/-- Required EmitLinearScaffold key decls (library seed expand continue).
    Greppable: emitLinearScaffoldRequiredDecls, Host library seed expand continue. -/
def emitLinearScaffoldRequiredDecls : List String :=
  ["def:stageId",
   "def:hostEmitLinearId",
   "def:selfHostEmitLinearId",
   "def:acceptancePath",
   "def:hostModulePath",
   "def:ssotArtifactPath"]

/-- Required EmitTypesScaffold key decls (library seed expand continue).
    Greppable: emitTypesScaffoldRequiredDecls, Host library seed expand continue. -/
def emitTypesScaffoldRequiredDecls : List String :=
  ["def:stageId",
   "def:hostEmitTypesId",
   "def:selfHostEmitTypesId",
   "def:acceptancePath",
   "def:hostModulePath",
   "def:ssotArtifactPath"]

/-- Required EmitProgramScaffold key decls (library seed expand continue).
    Greppable: emitProgramScaffoldRequiredDecls, Host library seed expand continue. -/
def emitProgramScaffoldRequiredDecls : List String :=
  ["def:stageId",
   "def:hostEmitProgramId",
   "def:selfHostEmitProgramId",
   "def:acceptancePath",
   "def:hostModulePath",
   "def:ssotArtifactPath"]

/-- Required EmitGraphScaffold key decls (library seed expand continue).
    Greppable: emitGraphScaffoldRequiredDecls, Host library seed expand continue. -/
def emitGraphScaffoldRequiredDecls : List String :=
  ["def:stageId",
   "def:hostEmitGraphId",
   "def:selfHostEmitGraphId",
   "def:acceptancePath",
   "def:hostModulePath",
   "def:ssotArtifactPath"]

/-- Required EmitComposeScaffold key decls (library seed expand continue).
    Greppable: emitComposeScaffoldRequiredDecls, Host library seed expand continue. -/
def emitComposeScaffoldRequiredDecls : List String :=
  ["def:stageId",
   "def:hostEmitComposeId",
   "def:selfHostEmitComposeId",
   "def:acceptancePath",
   "def:hostModulePath",
   "def:ssotArtifactPath"]

/-- Required EmitPlanScaffold key decls (library seed expand continue).
    On-disk uses productStageId / productAcceptancePath / productHostModulePath /
    planSsotArtifactPath (not Mult-scaffold stageId/acceptancePath pattern).
    Greppable: emitPlanScaffoldRequiredDecls, Host library seed expand continue. -/
def emitPlanScaffoldRequiredDecls : List String :=
  ["def:productStageId",
   "def:hostEmitPlanId",
   "def:selfHostEmitPlanId",
   "def:productAcceptancePath",
   "def:productHostModulePath",
   "def:planSsotArtifactPath"]

/-- Required EmitApplyScaffold key decls (library seed expand continue).
    Greppable: emitApplyScaffoldRequiredDecls, Host library seed expand continue. -/
def emitApplyScaffoldRequiredDecls : List String :=
  ["def:productStageId",
   "def:hostEmitApplyId",
   "def:selfHostEmitApplyId",
   "def:productAcceptancePath",
   "def:productHostModulePath",
   "def:applySsotArtifactPath"]

/-- Required EmitBodyScaffold key decls (library seed expand continue).
    Greppable: emitBodyScaffoldRequiredDecls, Host library seed expand continue. -/
def emitBodyScaffoldRequiredDecls : List String :=
  ["def:productStageId",
   "def:hostEmitBodyId",
   "def:selfHostEmitBodyId",
   "def:productAcceptancePath",
   "def:productHostModulePath",
   "def:bodySsotArtifactPath"]

/-- Required EmitErasureScaffold key decls (library seed expand continue).
    On-disk uses stageId / acceptancePath / hostModulePath / ssotArtifactPath
    (Mult-scaffold pattern, not productStageId Plan-band).
    Greppable: emitErasureScaffoldRequiredDecls, Host library seed expand continue. -/
def emitErasureScaffoldRequiredDecls : List String :=
  ["def:stageId",
   "def:hostEmitErasureId",
   "def:selfHostEmitErasureId",
   "def:acceptancePath",
   "def:hostModulePath",
   "def:ssotArtifactPath"]

/-- Required EmitExtractScaffold key decls (library seed expand continue).
    Greppable: emitExtractScaffoldRequiredDecls, Host library seed expand continue. -/
def emitExtractScaffoldRequiredDecls : List String :=
  ["def:stageId",
   "def:hostEmitExtractId",
   "def:selfHostEmitExtractId",
   "def:acceptancePath",
   "def:hostModulePath",
   "def:ssotArtifactPath"]

/-- Required EmitBannerScaffold key decls (library seed expand continue).
    Greppable: emitBannerScaffoldRequiredDecls, Host library seed expand continue. -/
def emitBannerScaffoldRequiredDecls : List String :=
  ["def:stageId",
   "def:hostEmitBannerId",
   "def:selfHostEmitBannerId",
   "def:acceptancePath",
   "def:hostModulePath",
   "def:ssotArtifactPath"]

/-- Required KernelSelfApply key decls (library seed expand continue).
    Greppable: kernelSelfApplyRequiredDecls, Host library seed expand continue. -/
def kernelSelfApplyRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productKernelSelfApplyModuleCite",
   "def:productKernelBarSurfaceOk",
   "def:productKernelSelfApplyPartialReady"]

/-- Required KernelSelfApplyTheorems key decls (library seed expand continue).
    Greppable: kernelSelfApplyTheoremsRequiredDecls, Host library seed expand continue. -/
def kernelSelfApplyTheoremsRequiredDecls : List String :=
  ["theorem:productKernelSelfApplyPartialReady_true"]

/-- Required EmitMult product key decls (library seed expand continue).
    On-disk EmitMult is a scaffold-import shell (defs live in EmitMultScaffold).
    Greppable: emitMultRequiredDecls, Host library seed expand continue. -/
def emitMultRequiredDecls : List String := []

/-- Required EmitLinear product key decls (scaffold-import shell).
    Greppable: emitLinearRequiredDecls, Host library seed expand continue. -/
def emitLinearRequiredDecls : List String := []

/-- Required EmitTypes product key decls (scaffold-import shell).
    Greppable: emitTypesRequiredDecls, Host library seed expand continue. -/
def emitTypesRequiredDecls : List String := []

/-- Required EmitProgram product key decls (scaffold-import shell).
    Greppable: emitProgramRequiredDecls, Host library seed expand continue. -/
def emitProgramRequiredDecls : List String := []

/-- Required EmitGraph product key decls (scaffold-import shell).
    Greppable: emitGraphRequiredDecls, Host library seed expand continue. -/
def emitGraphRequiredDecls : List String := []

/-- Required EmitCompose product key decls (scaffold-import shell).
    Greppable: emitComposeRequiredDecls, Host library seed expand continue. -/
def emitComposeRequiredDecls : List String := []

/-- Required EmitErasure product key decls (scaffold-import shell).
    Greppable: emitErasureRequiredDecls, Host library seed expand continue. -/
def emitErasureRequiredDecls : List String := []

/-- Required EmitExtract product key decls (scaffold-import shell).
    Greppable: emitExtractRequiredDecls, Host library seed expand continue. -/
def emitExtractRequiredDecls : List String := []

/-- Required EmitBanner product key decls (scaffold-import shell).
    Greppable: emitBannerRequiredDecls, Host library seed expand continue. -/
def emitBannerRequiredDecls : List String := []

/-- Required ProductOutKernel key decls (SelfApplyFs leaf foundation).
    Greppable: productOutKernelRequiredDecls, Host library seed expand continue. -/
def productOutKernelRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:productOutKernelModuleCite",
   "def:productOutKernelBarSurfaceOk",
   "def:productOutKernelEvidencePartialReady"]

/-- Required ProductOutKernelTheorems key decls.
    Greppable: productOutKernelTheoremsRequiredDecls, Host library seed expand continue. -/
def productOutKernelTheoremsRequiredDecls : List String :=
  ["theorem:productOutKernelEvidencePartialReady_true"]

/-- Required BootstrapHonesty key decls (SelfApplyFs leaf foundation).
    Greppable: bootstrapHonestyRequiredDecls, Host library seed expand continue. -/
def bootstrapHonestyRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:bootstrapHonestyModuleCite",
   "def:productPathBootstrapSurfaceOk",
   "def:productPathHostLakeBootstrapPartialReady"]

/-- Required BootstrapHonestyTheorems key decls.
    Greppable: bootstrapHonestyTheoremsRequiredDecls, Host library seed expand continue. -/
def bootstrapHonestyTheoremsRequiredDecls : List String :=
  ["theorem:productPathHostLakeBootstrapPartialReady_true",
   "theorem:productPathHostLakeBootstrapRemains_true"]

/-- Required ProductPathWriterSurface key decls (SelfApplyFs ProductPath writer pure leaf).
    Greppable: productPathWriterSurfaceRequiredDecls, Host library seed expand continue. -/
def productPathWriterSurfaceRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:writerSurfaceModuleCite",
   "def:productWriterSurfaceOk",
   "def:productWriterSurfacePartialReady"]

/-- Required ProductPathWriterSurfaceTheorems key decls.
    Greppable: productPathWriterSurfaceTheoremsRequiredDecls, Host library seed expand continue. -/
def productPathWriterSurfaceTheoremsRequiredDecls : List String :=
  ["theorem:productWriterSurfacePartialReady_true"]

/-- Required ProductPathWriterPathPlan key decls (SelfApplyFs ProductPath writer pure leaf).
    Greppable: productPathWriterPathPlanRequiredDecls, Host library seed expand continue. -/
def productPathWriterPathPlanRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:writerPathPlanModuleCite",
   "def:productWriterPathPlanOk",
   "def:productWriterPathPlanPartialReady"]

/-- Required ProductPathWriterPathPlanTheorems key decls.
    Greppable: productPathWriterPathPlanTheoremsRequiredDecls, Host library seed expand continue. -/
def productPathWriterPathPlanTheoremsRequiredDecls : List String :=
  ["theorem:productWriterPathPlanPartialReady_true"]

/-- Required ProductPathWriterPathExec key decls (SelfApplyFs ProductPath writer pure leaf).
    Greppable: productPathWriterPathExecRequiredDecls, Host library seed expand continue. -/
def productPathWriterPathExecRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:selfHostId",
   "def:writerPathExecModuleCite",
   "def:productWriterPathExecutionOk",
   "def:productWriterPathExecutionPartialReady"]

/-- Required ProductPathWriterPathExecTheorems key decls.
    Greppable: productPathWriterPathExecTheoremsRequiredDecls, Host library seed expand continue. -/
def productPathWriterPathExecTheoremsRequiredDecls : List String :=
  ["theorem:productWriterPathExecutionPartialReady_true"]

/-- Required EmitPlan product key decls (on-disk EmitPlan.lean defs).
    Greppable: emitPlanRequiredDecls, Host library seed expand continue. -/
def emitPlanRequiredDecls : List String :=
  ["def:planFromCompose",
   "def:fromCompose",
   "def:isReady",
   "def:planOk",
   "def:isRuntimeMult",
   "def:countRuntimeNodes"]

/-- Required EmitApply product key decls (on-disk EmitApply.lean defs).
    Greppable: emitApplyRequiredDecls, Host library seed expand continue. -/
def emitApplyRequiredDecls : List String :=
  ["def:applyCap",
   "def:applyFromCompose",
   "def:fromCompose",
   "def:applyIsValid",
   "def:applyOk",
   "def:packTag"]

/-- Required EmitBody product key decls (on-disk EmitBody.lean defs).
    Greppable: emitBodyRequiredDecls, Host library seed expand continue. -/
def emitBodyRequiredDecls : List String :=
  ["def:bodyCap",
   "def:bodyFromCompose",
   "def:fromCompose",
   "def:bodyIsValid",
   "def:bodyOk",
   "def:buildFragment"]

/-- Required KernelEmit product key decls (on-disk KernelEmit.lean defs).
    Greppable: kernelEmitRequiredDecls, Host library seed expand continue. -/
def kernelEmitRequiredDecls : List String :=
  ["def:stageId",
   "def:kernelEmitId",
   "def:hostKernelEmitId",
   "def:emitKernelReady",
   "def:emitKernelOk",
   "def:emitPlanPathReady",
   "def:emitApplyPathReady",
   "def:emitBodyPathReady"]

/-- Required KernelEmitTheorems key decls (library seed expand continue).
    Namespace SystemsLean.KernelEmit (same as parent).
    Greppable: kernelEmitTheoremsRequiredDecls, Host library seed expand continue. -/
def kernelEmitTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:kernelEmitId_eq",
   "theorem:hostKernelEmitId_eq",
   "theorem:emitKernelReady_true",
   "theorem:emitKernelOk_true",
   "theorem:emitPlanPathReady_true"]

/-- Required ParityMult key decls (on-disk ParityMult.lean defs).
    Greppable: parityMultRequiredDecls, Host library seed expand continue. -/
def parityMultRequiredDecls : List String :=
  ["def:stageId",
   "def:hostParityMultId",
   "def:selfHostParityMultId",
   "def:multParityReady",
   "def:multParityOk",
   "def:paritySurfaceOk",
   "def:acceptancePath",
   "def:hostModulePath"]

/-- Required ParityMultTheorems key decls (library seed expand continue).
    Namespace SystemsLean.ParityMult (same as parent).
    Greppable: parityMultTheoremsRequiredDecls, Host library seed expand continue. -/
def parityMultTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostParityMultId_eq",
   "theorem:selfHostParityMultId_eq",
   "theorem:multParityReady_true",
   "theorem:multParityOk_true"]

/-- Required ParityLinear key decls (on-disk ParityLinear.lean defs).
    Greppable: parityLinearRequiredDecls, Host library seed expand continue. -/
def parityLinearRequiredDecls : List String :=
  ["def:stageId",
   "def:hostParityLinearId",
   "def:selfHostParityLinearId",
   "def:linearParityReady",
   "def:linearParityOk",
   "def:paritySurfaceOk",
   "def:acceptancePath",
   "def:hostModulePath"]

/-- Required ParityLinearTheorems key decls (library seed expand continue).
    Namespace SystemsLean.ParityLinear (same as parent).
    Greppable: parityLinearTheoremsRequiredDecls, Host library seed expand continue. -/
def parityLinearTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostParityLinearId_eq",
   "theorem:selfHostParityLinearId_eq",
   "theorem:linearParityReady_true",
   "theorem:linearParityOk_true"]

/-- Required ParityTypes key decls (on-disk ParityTypes.lean defs).
    Greppable: parityTypesRequiredDecls, Host library seed expand continue. -/
def parityTypesRequiredDecls : List String :=
  ["def:stageId",
   "def:hostParityTypesId",
   "def:selfHostParityTypesId",
   "def:typesParityReady",
   "def:typesParityOk",
   "def:paritySurfaceOk",
   "def:acceptancePath",
   "def:hostModulePath"]

/-- Required ParityTypesTheorems key decls (library seed expand continue).
    Namespace SystemsLean.ParityTypes (same as parent).
    Greppable: parityTypesTheoremsRequiredDecls, Host library seed expand continue. -/
def parityTypesTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostParityTypesId_eq",
   "theorem:selfHostParityTypesId_eq",
   "theorem:typesParityReady_true",
   "theorem:typesParityOk_true"]

/-- Required ParityProgram key decls (on-disk ParityProgram.lean defs).
    Greppable: parityProgramRequiredDecls, Host library seed expand continue. -/
def parityProgramRequiredDecls : List String :=
  ["def:stageId",
   "def:hostParityProgramId",
   "def:selfHostParityProgramId",
   "def:programParityReady",
   "def:programParityOk",
   "def:paritySurfaceOk",
   "def:acceptancePath",
   "def:hostModulePath"]

/-- Required ParityProgramTheorems key decls (library seed expand continue).
    Namespace SystemsLean.ParityProgram (same as parent).
    Greppable: parityProgramTheoremsRequiredDecls, Host library seed expand continue. -/
def parityProgramTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostParityProgramId_eq",
   "theorem:selfHostParityProgramId_eq",
   "theorem:programParityReady_true",
   "theorem:programParityOk_true"]

/-- Required ParityEmit key decls (on-disk ParityEmit.lean defs).
    Greppable: parityEmitRequiredDecls, Host library seed expand continue. -/
def parityEmitRequiredDecls : List String :=
  ["def:stageId",
   "def:hostParityEmitId",
   "def:selfHostParityEmitId",
   "def:emitParityReady",
   "def:emitParityOk",
   "def:paritySurfaceOk",
   "def:acceptancePath",
   "def:hostModulePath"]

/-- Required ParityEmitTheorems key decls (library seed expand continue).
    Namespace SystemsLean.ParityEmit (same as parent).
    Greppable: parityEmitTheoremsRequiredDecls, Host library seed expand continue. -/
def parityEmitTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostParityEmitId_eq",
   "theorem:selfHostParityEmitId_eq",
   "theorem:emitParityReady_true",
   "theorem:emitParityOk_true"]

/-- Required SelfApply key decls (on-disk SelfApply.lean defs).
    Greppable: selfApplyRequiredDecls, Host library seed expand continue. -/
def selfApplyRequiredDecls : List String :=
  ["def:stageId",
   "def:hostSelfApplyId",
   "def:selfHostSelfApplyId",
   "def:selfApplySurfaceOk",
   "def:kernelRebuildsKernel",
   "def:selfApplyReady",
   "def:acceptancePath",
   "def:hostModulePath"]

/-- Required SelfApplyTheorems key decls (library seed expand continue).
    Namespace SystemsLean.SelfApply (same as parent).
    Greppable: selfApplyTheoremsRequiredDecls, Host library seed expand continue. -/
def selfApplyTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostSelfApplyId_eq",
   "theorem:selfApplySurfaceOk_true",
   "theorem:kernelRebuildsKernel_true",
   "theorem:selfApplyReady_true"]

/-- A7+ theorem corpus exact lists dual-pin (long-file seam from HostModuleCheck).
    Greppable: hostModuleCheckTheoremCorpusOk, Host library seed expand continue. -/
def hostModuleCheckTheoremCorpusOk : Bool :=
  (multTheoremsRequiredDecls
    == ["theorem:ofNat?_zero",
        "theorem:ofNat?_one",
        "theorem:ofNat?_two",
        "theorem:ofNat?_fail_closed",
        "theorem:isValidTag_zero",
        "theorem:isValidTag_one",
        "theorem:isValidTag_two",
        "theorem:isValidTag_fail_closed"])
    && (linearTheoremsRequiredDecls
      == ["theorem:shareNat_eq",
          "theorem:shareNat_zero",
          "theorem:shareNat_succ",
          "theorem:polyId_id",
          "theorem:mult0ClassId_eq",
          "theorem:mult1ClassId_eq",
          "theorem:multOmegaClassId_eq",
          "theorem:linearAxiomInventoryOk_true"])
    && (typesTheoremsRequiredDecls
      == ["theorem:ofKindTag?_zero",
          "theorem:ofKindTag?_one",
          "theorem:ofKindTag?_two",
          "theorem:ofKindTag?_fail_closed",
          "theorem:isValidKindTag_zero",
          "theorem:isValidKindTag_one",
          "theorem:isValidKindTag_two",
          "theorem:isValidKindTag_fail_closed"])
    && (irProgramTheoremsRequiredDecls
      == ["theorem:empty_isEmpty",
          "theorem:empty_length_zero",
          "theorem:programCap_eq_eight",
          "theorem:isWellTyped_empty_false",
          "theorem:empty_not_well_typed",
          "theorem:checkFailClosed_eq_isWellTyped"])
    && (irGraphTheoremsRequiredDecls
      == ["theorem:isWellTyped_empty_true",
          "theorem:empty_well_typed",
          "theorem:empty_isEmpty",
          "theorem:edgeMax_eq_sixteen",
          "theorem:checkFailClosed_eq_isWellTyped",
          "theorem:edgesSound_empty"])
    && (hostComposeTheoremsRequiredDecls
      == ["theorem:multPreScan_empty_true",
          "theorem:checkFailClosed_empty_true",
          "theorem:extractOkFs_empty_true",
          "theorem:mint_zero_badId",
          "theorem:consume_empty_notLive",
          "theorem:extractOkFs_eq",
          "theorem:checkFailClosed_eq",
          "theorem:mint_empty_one_ok"])
    && (erasureTheoremsRequiredDecls
      == ["theorem:isRuntimeAbsent_unmarked_false",
          "theorem:isRuntimeAbsent_mark_true",
          "theorem:isErasureGrade_mult0",
          "theorem:isErasureGrade_mult1_false",
          "theorem:markForGrade?_mult0_some",
          "theorem:markForGrade?_mult1_none",
          "theorem:checkFailClosed_unmarked_false",
          "theorem:checkFailClosed_eq"])
    && (extractTheoremsRequiredDecls
      == ["theorem:isFreestandingGoal_runtimeFs",
          "theorem:isFreestandingGoal_classic_false",
          "theorem:extractOk_classic_reject",
          "theorem:extractOk_mult0_unmarked_false",
          "theorem:ofRuntimeTag?_zero",
          "theorem:ofRuntimeTag?_fail_closed",
          "theorem:isValidRuntimeTag_zero",
          "theorem:isValidRuntimeTag_fail_closed"])
    && (multRequiredDecls
      == ["inductive:Mult",
          "def:name",
          "def:isValid",
          "def:ofNat?",
          "def:isValidTag",
          "def:multIsValid"])
    && (linearRequiredDecls
      == ["def:shareNat",
          "def:polyId",
          "def:mult0ClassId",
          "def:mult1ClassId",
          "def:multOmegaClassId",
          "def:linearExactOnceId",
          "def:linearAxiomInventoryOk"])
    && (typesRequiredDecls
      == ["inductive:NodeKind",
          "def:typeTagInit",
          "def:kindMultOk",
          "def:ofKindTag?",
          "def:isValidKindTag",
          "def:mkNode?"])
    && (irProgramRequiredDecls
      == ["def:programCap",
          "def:empty",
          "def:push",
          "def:isWellTyped",
          "def:foldWellTyped",
          "def:checkFailClosed"])
    && (irGraphRequiredDecls
      == ["def:edgeMax",
          "def:empty",
          "def:pushNode",
          "def:addEdge",
          "def:isWellTyped",
          "def:checkFailClosed"])
    && (hostComposeRequiredDecls
      == ["def:empty",
          "def:mint",
          "def:consume",
          "def:pushHostNode",
          "def:addHostEdge",
          "def:checkFailClosed"])
    && (erasureRequiredDecls
      == ["def:unmarked",
          "def:mark",
          "def:isRuntimeAbsent",
          "def:isErasureGrade",
          "def:markForGrade?",
          "def:checkFailClosed"])
    && (extractRequiredDecls
      == ["inductive:RuntimeClaim",
          "def:isFreestandingGoal",
          "def:ofRuntimeTag?",
          "def:isValidRuntimeTag",
          "def:checkFailClosed",
          "def:extractOk"])
    && (compilePathRequiredDecls
      == ["def:stageId",
          "def:hostCompilePathId",
          "def:gradeSurfaceOk",
          "def:checkHost",
          "def:extractFsOk",
          "def:compileReady"])
    && (kernelMultRequiredDecls
      == ["def:stageId",
          "def:kernelMultId",
          "def:mkGradeNode",
          "def:lowerMultKernel",
          "def:multKernelReady",
          "def:kernelOk"])
    && (kernelLinearRequiredDecls
      == ["def:stageId",
          "def:kernelLinearId",
          "def:mkLinearNode",
          "def:lowerLinearKernel",
          "def:linearKernelReady",
          "def:linearKernelOk"])
    && (kernelTypesRequiredDecls
      == ["def:stageId",
          "def:kernelTypesId",
          "def:mkTypedNode",
          "def:lowerTypesKernel",
          "def:typesKernelReady",
          "def:typesKernelOk"])
    && (kernelProgramRequiredDecls
      == ["def:stageId",
          "def:kernelProgramId",
          "def:mkProgramNode",
          "def:lowerProgramKernel",
          "def:programKernelReady",
          "def:programKernelOk"])
    && (kernelMultTheoremsRequiredDecls
      == ["theorem:stageId_eq",
          "theorem:kernelMultId_eq",
          "theorem:multKernelReady_true",
          "theorem:kernelOk_true",
          "theorem:lowerMultKernel_isSome",
          "theorem:unknownTagRejected_true",
          "theorem:multKernelProgram_length_three",
          "theorem:multKernelProgram_isWellTyped"])
    && (kernelLinearTheoremsRequiredDecls
      == ["theorem:stageId_eq",
          "theorem:kernelLinearId_eq",
          "theorem:linearKernelReady_true",
          "theorem:linearKernelOk_true",
          "theorem:lowerLinearKernel_isSome",
          "theorem:linearMismatchRejected_true",
          "theorem:linearKernelProgram_length_one",
          "theorem:linearKernelProgram_isWellTyped"])
    && (kernelTypesTheoremsRequiredDecls
      == ["theorem:stageId_eq",
          "theorem:kernelTypesId_eq",
          "theorem:typesKernelReady_true",
          "theorem:typesKernelOk_true",
          "theorem:lowerTypesKernel_isSome",
          "theorem:unknownKindRejected_true",
          "theorem:typesKernelProgram_length_three",
          "theorem:typesKernelProgram_isWellTyped"])
    && (kernelProgramTheoremsRequiredDecls
      == ["theorem:stageId_eq",
          "theorem:kernelProgramId_eq",
          "theorem:programKernelReady_true",
          "theorem:programKernelOk_true",
          "theorem:lowerProgramKernel_isSome",
          "theorem:programPathReady_true",
          "theorem:programKernelProgram_length_three",
          "theorem:programKernelProgram_isWellTyped"])
    && (joinMapRequiredDecls
      == ["def:stageId",
          "def:hostJoinMapId",
          "def:joinMapId",
          "def:joinAlgContractOk",
          "def:joinUnitCompileReady",
          "def:joinProgramCompileReady"])
    && (joinMapTheoremsRequiredDecls
      == ["theorem:stageId_eq",
          "theorem:hostJoinMapId_eq",
          "theorem:joinAlgUseOk_true",
          "theorem:joinAlgContractOk_true",
          "theorem:joinCompileReady_eq_joinUnitCompileReady",
          "theorem:joinUnitCompileReady_empty_true",
          "theorem:joinProgramCompileReady_empty_false",
          "theorem:empty_host_ok_ne_empty_program_ok"])
    && (selfHostRequiredDecls
      == ["def:stageId",
          "def:hostSelfHostId",
          "def:selfHostId",
          "def:hostSurfaceOk",
          "def:selfHostUnitReady",
          "def:selfHostProgramReady"])
    && (selfHostTheoremsRequiredDecls
      == ["theorem:stageId_eq",
          "theorem:hostSelfHostId_eq",
          "theorem:hostSurfaceOk_true",
          "theorem:selfHostReady_eq_selfHostUnitReady",
          "theorem:selfHostUnitReady_empty_true",
          "theorem:selfHostProgramReady_empty_false",
          "theorem:empty_host_ok_ne_empty_program_ok",
          "theorem:selfHostUnitReady_mult1_unminted_false"])
    && (surfaceMatrixRequiredDecls
      == ["def:stageId",
          "def:hostSurfaceMatrixId",
          "def:surfaceMatrixId",
          "def:matrixSurfaceOk",
          "def:matrixUnitReady",
          "def:matrixProgramReady"])
    && (surfaceMatrixTheoremsRequiredDecls
      == ["theorem:stageId_eq",
          "theorem:hostSurfaceMatrixId_eq",
          "theorem:surfaceMatrixId_eq",
          "theorem:matrixSurfaceOk_true",
          "theorem:matrixUnitReady_empty_true",
          "theorem:matrixProgramReady_empty_false",
          "theorem:empty_host_ok_ne_empty_program_ok",
          "theorem:matrixUnitReady_mult1_unminted_false"])
    && (emitMultScaffoldRequiredDecls
      == ["def:stageId",
          "def:hostEmitMultId",
          "def:selfHostEmitMultId",
          "def:acceptancePath",
          "def:hostModulePath",
          "def:ssotArtifactPath"])
    && (emitLinearScaffoldRequiredDecls
      == ["def:stageId",
          "def:hostEmitLinearId",
          "def:selfHostEmitLinearId",
          "def:acceptancePath",
          "def:hostModulePath",
          "def:ssotArtifactPath"])
    && (emitTypesScaffoldRequiredDecls
      == ["def:stageId",
          "def:hostEmitTypesId",
          "def:selfHostEmitTypesId",
          "def:acceptancePath",
          "def:hostModulePath",
          "def:ssotArtifactPath"])
    && (emitProgramScaffoldRequiredDecls
      == ["def:stageId",
          "def:hostEmitProgramId",
          "def:selfHostEmitProgramId",
          "def:acceptancePath",
          "def:hostModulePath",
          "def:ssotArtifactPath"])
    && (emitGraphScaffoldRequiredDecls
      == ["def:stageId",
          "def:hostEmitGraphId",
          "def:selfHostEmitGraphId",
          "def:acceptancePath",
          "def:hostModulePath",
          "def:ssotArtifactPath"])
    && (emitComposeScaffoldRequiredDecls
      == ["def:stageId",
          "def:hostEmitComposeId",
          "def:selfHostEmitComposeId",
          "def:acceptancePath",
          "def:hostModulePath",
          "def:ssotArtifactPath"])
    && (emitErasureScaffoldRequiredDecls
      == ["def:stageId",
          "def:hostEmitErasureId",
          "def:selfHostEmitErasureId",
          "def:acceptancePath",
          "def:hostModulePath",
          "def:ssotArtifactPath"])
    && (emitExtractScaffoldRequiredDecls
      == ["def:stageId",
          "def:hostEmitExtractId",
          "def:selfHostEmitExtractId",
          "def:acceptancePath",
          "def:hostModulePath",
          "def:ssotArtifactPath"])
    && (emitBannerScaffoldRequiredDecls
      == ["def:stageId",
          "def:hostEmitBannerId",
          "def:selfHostEmitBannerId",
          "def:acceptancePath",
          "def:hostModulePath",
          "def:ssotArtifactPath"])
    && (kernelSelfApplyRequiredDecls
      == ["def:stageId",
          "def:hostId",
          "def:selfHostId",
          "def:productKernelSelfApplyModuleCite",
          "def:productKernelBarSurfaceOk",
          "def:productKernelSelfApplyPartialReady"])
    && (kernelSelfApplyTheoremsRequiredDecls
      == ["theorem:productKernelSelfApplyPartialReady_true"])
    && (productOutKernelRequiredDecls
      == ["def:stageId",
          "def:hostId",
          "def:selfHostId",
          "def:productOutKernelModuleCite",
          "def:productOutKernelBarSurfaceOk",
          "def:productOutKernelEvidencePartialReady"])
    && (productOutKernelTheoremsRequiredDecls
      == ["theorem:productOutKernelEvidencePartialReady_true"])
    && (bootstrapHonestyRequiredDecls
      == ["def:stageId",
          "def:hostId",
          "def:selfHostId",
          "def:bootstrapHonestyModuleCite",
          "def:productPathBootstrapSurfaceOk",
          "def:productPathHostLakeBootstrapPartialReady"])
    && (bootstrapHonestyTheoremsRequiredDecls
      == ["theorem:productPathHostLakeBootstrapPartialReady_true",
          "theorem:productPathHostLakeBootstrapRemains_true"])

/-! ### Dual-pinned fixture texts (structural; mirror on-disk surfaces) -/

/-- Minimal good Mult text. Greppable: hostModuleCheckGoodMultText. -/
def hostModuleCheckGoodMultText : String :=
  "namespace SystemsLean.Mult\n" ++
  "inductive Mult where\n" ++
  "  | mult0\n" ++
  "  | mult1\n" ++
  "  | multOmega\n" ++
  "def name : Mult -> String\n" ++
  "  | Mult.mult0 => \"MULT-0\"\n" ++
  "def isValid : Mult -> Bool\n" ++
  "  | _ => true\n" ++
  "def ofNat? : Nat -> Option Mult\n" ++
  "  | 0 => some Mult.mult0\n" ++
  "  | _ => none\n" ++
  "def isValidTag (n : Nat) : Bool := (ofNat? n).isSome\n" ++
  "def multIsValid (m : Mult) : Bool := isValid m\n" ++
  "end SystemsLean.Mult\n"

/-- Minimal good MultTheorems text (A7 expanded corpus; structural names only).
    Greppable: hostModuleCheckGoodMultTheoremsText, Host theorem check expand. -/
def hostModuleCheckGoodMultTheoremsText : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.Mult\n" ++
  "theorem ofNat?_zero : ofNat? 0 = some Mult.mult0 := rfl\n" ++
  "theorem ofNat?_one : ofNat? 1 = some Mult.mult1 := rfl\n" ++
  "theorem ofNat?_two : ofNat? 2 = some Mult.multOmega := rfl\n" ++
  "theorem ofNat?_fail_closed (n : Nat) (h : 2 < n) : ofNat? n = none := by sorry\n" ++
  "theorem isValidTag_zero : isValidTag 0 = true := rfl\n" ++
  "theorem isValidTag_one : isValidTag 1 = true := rfl\n" ++
  "theorem isValidTag_two : isValidTag 2 = true := rfl\n" ++
  "theorem isValidTag_fail_closed (n : Nat) (h : 2 < n) : isValidTag n = false := by sorry\n" ++
  "end SystemsLean.Mult\n"

/-- Minimal good Linear text. Greppable: hostModuleCheckGoodLinearText. -/
def hostModuleCheckGoodLinearText : String :=
  "namespace SystemsLean.Linear\n" ++
  "def shareNat (n : Nat) : Nat := n + n\n" ++
  "def polyId {a : Type} (x : a) : a := x\n" ++
  "def mult0ClassId : String := \"MULT-0\"\n" ++
  "def mult1ClassId : String := \"MULT-1\"\n" ++
  "def multOmegaClassId : String := \"MULT-OMEGA\"\n" ++
  "def linearExactOnceId : String := \"LINEAR-EXACT-ONCE\"\n" ++
  "def linearAxiomInventoryOk : Bool := true\n" ++
  "end SystemsLean.Linear\n"

/-- Minimal good LinearTheorems text (A7 expanded corpus).
    Greppable: hostModuleCheckGoodLinearTheoremsText, Host theorem check expand. -/
def hostModuleCheckGoodLinearTheoremsText : String :=
  "import SystemsLean.Linear\n" ++
  "namespace SystemsLean.Linear\n" ++
  "theorem shareNat_eq (n : Nat) : shareNat n = n + n := rfl\n" ++
  "theorem shareNat_zero : shareNat 0 = 0 := rfl\n" ++
  "theorem shareNat_succ (n : Nat) : shareNat (n + 1) = (n + 1) + (n + 1) := rfl\n" ++
  "theorem polyId_id {a : Type} (x : a) : polyId x = x := rfl\n" ++
  "theorem mult0ClassId_eq : mult0ClassId = \"MULT-0\" := rfl\n" ++
  "theorem mult1ClassId_eq : mult1ClassId = \"MULT-1\" := rfl\n" ++
  "theorem multOmegaClassId_eq : multOmegaClassId = \"MULT-OMEGA\" := rfl\n" ++
  "theorem linearAxiomInventoryOk_true : linearAxiomInventoryOk = true := rfl\n" ++
  "end SystemsLean.Linear\n"

/-- Minimal good Types text. Greppable: hostModuleCheckGoodTypesText. -/
def hostModuleCheckGoodTypesText : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.Types\n" ++
  "inductive NodeKind where\n" ++
  "  | value\n" ++
  "def typeTagInit (tag : Nat) : Nat := tag\n" ++
  "def kindMultOk (k : NodeKind) (m : Nat) : Bool := true\n" ++
  "def ofKindTag? : Nat -> Option NodeKind\n" ++
  "  | 0 => some NodeKind.value\n" ++
  "  | _ => none\n" ++
  "def isValidKindTag (n : Nat) : Bool := (ofKindTag? n).isSome\n" ++
  "def mkNode? (tag : Nat) : Option Nat := some tag\n" ++
  "end SystemsLean.Types\n"

/-- Minimal good TypesTheorems text (A7 expanded corpus).
    Greppable: hostModuleCheckGoodTypesTheoremsText, Host theorem check expand. -/
def hostModuleCheckGoodTypesTheoremsText : String :=
  "import SystemsLean.Types\n" ++
  "namespace SystemsLean.Types\n" ++
  "theorem ofKindTag?_zero : ofKindTag? 0 = some NodeKind.value := rfl\n" ++
  "theorem ofKindTag?_one : ofKindTag? 1 = some NodeKind.linear := rfl\n" ++
  "theorem ofKindTag?_two : ofKindTag? 2 = some NodeKind.erased := rfl\n" ++
  "theorem ofKindTag?_fail_closed (n : Nat) (h : 2 < n) : ofKindTag? n = none := by sorry\n" ++
  "theorem isValidKindTag_zero : isValidKindTag 0 = true := rfl\n" ++
  "theorem isValidKindTag_one : isValidKindTag 1 = true := rfl\n" ++
  "theorem isValidKindTag_two : isValidKindTag 2 = true := rfl\n" ++
  "theorem isValidKindTag_fail_closed (n : Nat) (h : 2 < n) : isValidKindTag n = false := by sorry\n" ++
  "end SystemsLean.Types\n"

/-- Minimal good IrProgram text (Program unit).
    Greppable: hostModuleCheckGoodIrProgramText. -/
def hostModuleCheckGoodIrProgramText : String :=
  "import SystemsLean.Types\n" ++
  "namespace SystemsLean.IrProgram\n" ++
  "def programCap : Nat := 8\n" ++
  "def empty : Nat := 0\n" ++
  "def push (p : Nat) (n : Nat) : Nat := p\n" ++
  "def isWellTyped (p : Nat) : Bool := false\n" ++
  "def foldWellTyped (p : Nat) : Nat := p\n" ++
  "def checkFailClosed (p : Nat) : Bool := isWellTyped p\n" ++
  "end SystemsLean.IrProgram\n"

/-- Minimal good IrProgramTheorems text (A7 expanded corpus).
    Greppable: hostModuleCheckGoodIrProgramTheoremsText, Host theorem check expand. -/
def hostModuleCheckGoodIrProgramTheoremsText : String :=
  "import SystemsLean.IrProgram\n" ++
  "namespace SystemsLean.IrProgram\n" ++
  "theorem empty_isEmpty : empty = 0 := rfl\n" ++
  "theorem empty_length_zero : True := trivial\n" ++
  "theorem programCap_eq_eight : programCap = 8 := rfl\n" ++
  "theorem isWellTyped_empty_false : isWellTyped empty = false := rfl\n" ++
  "theorem empty_not_well_typed : isWellTyped empty = false := rfl\n" ++
  "theorem checkFailClosed_eq_isWellTyped (p : Nat) : True := trivial\n" ++
  "end SystemsLean.IrProgram\n"

/-- Minimal good IrGraph text (Graph unit).
    Greppable: hostModuleCheckGoodIrGraphText. -/
def hostModuleCheckGoodIrGraphText : String :=
  "import SystemsLean.IrProgram\n" ++
  "namespace SystemsLean.IrGraph\n" ++
  "def edgeMax : Nat := 16\n" ++
  "def empty : Nat := 0\n" ++
  "def pushNode (g : Nat) (n : Nat) : Nat := g\n" ++
  "def addEdge (g : Nat) (fromIdx toIdx : Nat) : Nat := g\n" ++
  "def isWellTyped (g : Nat) : Bool := true\n" ++
  "def checkFailClosed (g : Nat) : Bool := isWellTyped g\n" ++
  "end SystemsLean.IrGraph\n"

/-- Minimal good IrGraphTheorems text (A7 expanded corpus).
    Greppable: hostModuleCheckGoodIrGraphTheoremsText, Host theorem check expand. -/
def hostModuleCheckGoodIrGraphTheoremsText : String :=
  "import SystemsLean.IrGraph\n" ++
  "namespace SystemsLean.IrGraph\n" ++
  "theorem isWellTyped_empty_true : isWellTyped empty = true := rfl\n" ++
  "theorem empty_well_typed : isWellTyped empty = true := rfl\n" ++
  "theorem empty_isEmpty : empty = 0 := rfl\n" ++
  "theorem edgeMax_eq_sixteen : edgeMax = 16 := rfl\n" ++
  "theorem checkFailClosed_eq_isWellTyped (g : Nat) : True := trivial\n" ++
  "theorem edgesSound_empty : True := trivial\n" ++
  "end SystemsLean.IrGraph\n"

/-- Minimal good HostCompose text (Compose unit).
    Greppable: hostModuleCheckGoodHostComposeText. -/
def hostModuleCheckGoodHostComposeText : String :=
  "import SystemsLean.IrGraph\n" ++
  "namespace SystemsLean.HostCompose\n" ++
  "def empty : Nat := 0\n" ++
  "def mint (hc : Nat) (id : Nat) : Nat := hc\n" ++
  "def consume (hc : Nat) : Nat := hc\n" ++
  "def pushHostNode (hc : Nat) (n : Nat) : Nat := hc\n" ++
  "def addHostEdge (hc : Nat) (fromIdx toIdx : Nat) : Nat := hc\n" ++
  "def checkFailClosed (hc : Nat) : Bool := true\n" ++
  "end SystemsLean.HostCompose\n"

/-- Minimal good HostComposeTheorems text (A7 expanded corpus).
    Greppable: hostModuleCheckGoodHostComposeTheoremsText, Host theorem check expand. -/
def hostModuleCheckGoodHostComposeTheoremsText : String :=
  "import SystemsLean.HostCompose\n" ++
  "namespace SystemsLean.HostCompose\n" ++
  "theorem multPreScan_empty_true : True := trivial\n" ++
  "theorem checkFailClosed_empty_true : checkFailClosed empty = true := rfl\n" ++
  "theorem extractOkFs_empty_true : True := trivial\n" ++
  "theorem mint_zero_badId : True := trivial\n" ++
  "theorem consume_empty_notLive : True := trivial\n" ++
  "theorem extractOkFs_eq : True := trivial\n" ++
  "theorem checkFailClosed_eq : True := trivial\n" ++
  "theorem mint_empty_one_ok : True := trivial\n" ++
  "end SystemsLean.HostCompose\n"

/-- Minimal good Erasure text (real module seed expand).
    Greppable: hostModuleCheckGoodErasureText, Host real module seed expand. -/
def hostModuleCheckGoodErasureText : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.Erasure\n" ++
  "def unmarked : Nat := 0\n" ++
  "def mark (e : Nat) : Nat := 1\n" ++
  "def isRuntimeAbsent (e : Nat) : Bool := true\n" ++
  "def isErasureGrade (m : Nat) : Bool := true\n" ++
  "def markForGrade? (m : Nat) (e : Nat) : Option Nat := some e\n" ++
  "def checkFailClosed (m : Nat) (e : Nat) : Bool := true\n" ++
  "end SystemsLean.Erasure\n"

/-- Minimal good ErasureTheorems text (real module seed expand).
    Greppable: hostModuleCheckGoodErasureTheoremsText, Host real module seed expand. -/
def hostModuleCheckGoodErasureTheoremsText : String :=
  "import SystemsLean.Erasure\n" ++
  "namespace SystemsLean.Erasure\n" ++
  "theorem isRuntimeAbsent_unmarked_false : True := trivial\n" ++
  "theorem isRuntimeAbsent_mark_true : True := trivial\n" ++
  "theorem isErasureGrade_mult0 : True := trivial\n" ++
  "theorem isErasureGrade_mult1_false : True := trivial\n" ++
  "theorem markForGrade?_mult0_some : True := trivial\n" ++
  "theorem markForGrade?_mult1_none : True := trivial\n" ++
  "theorem checkFailClosed_unmarked_false : True := trivial\n" ++
  "theorem checkFailClosed_eq : True := trivial\n" ++
  "end SystemsLean.Erasure\n"

/-- Minimal good Extract text (real module seed expand).
    Greppable: hostModuleCheckGoodExtractText, Host real module seed expand. -/
def hostModuleCheckGoodExtractText : String :=
  "import SystemsLean.Erasure\n" ++
  "namespace SystemsLean.Extract\n" ++
  "inductive RuntimeClaim where\n" ++
  "  | runtimeFs\n" ++
  "def isFreestandingGoal (c : RuntimeClaim) : Bool := true\n" ++
  "def ofRuntimeTag? : Nat -> Option RuntimeClaim\n" ++
  "  | 0 => some RuntimeClaim.runtimeFs\n" ++
  "  | _ => none\n" ++
  "def isValidRuntimeTag (n : Nat) : Bool := (ofRuntimeTag? n).isSome\n" ++
  "def checkFailClosed (m : Nat) (e : Nat) (c : RuntimeClaim) : Bool := true\n" ++
  "def extractOk (m : Nat) (e : Nat) (c : RuntimeClaim) : Bool := true\n" ++
  "end SystemsLean.Extract\n"

/-- Minimal good ExtractTheorems text (real module seed expand).
    Greppable: hostModuleCheckGoodExtractTheoremsText, Host real module seed expand. -/
def hostModuleCheckGoodExtractTheoremsText : String :=
  "import SystemsLean.Extract\n" ++
  "namespace SystemsLean.Extract\n" ++
  "theorem isFreestandingGoal_runtimeFs : True := trivial\n" ++
  "theorem isFreestandingGoal_classic_false : True := trivial\n" ++
  "theorem extractOk_classic_reject : True := trivial\n" ++
  "theorem extractOk_mult0_unmarked_false : True := trivial\n" ++
  "theorem ofRuntimeTag?_zero : True := trivial\n" ++
  "theorem ofRuntimeTag?_fail_closed : True := trivial\n" ++
  "theorem isValidRuntimeTag_zero : True := trivial\n" ++
  "theorem isValidRuntimeTag_fail_closed : True := trivial\n" ++
  "end SystemsLean.Extract\n"

/-- Minimal good CompilePath text (library seed expand continue).
    Greppable: hostModuleCheckGoodCompilePathText, Host library seed expand continue. -/
def hostModuleCheckGoodCompilePathText : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.CompilePath\n" ++
  "def stageId : String := \"SLAKE_COMPILE_PATH_V1\"\n" ++
  "def hostCompilePathId : String := \"HOST-COMPILE-PATH\"\n" ++
  "def gradeSurfaceOk : Bool := true\n" ++
  "def checkHost (hc : Nat) : Bool := true\n" ++
  "def extractFsOk (hc : Nat) : Bool := true\n" ++
  "def compileReady (hc : Nat) : Bool := true\n" ++
  "end SystemsLean.CompilePath\n"

/-- Minimal good KernelMult text (library seed expand continue).
    Greppable: hostModuleCheckGoodKernelMultText, Host library seed expand continue. -/
def hostModuleCheckGoodKernelMultText : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.KernelMult\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_MULT_V0\"\n" ++
  "def kernelMultId : String := \"SELF-HOST-KERNEL-MULT\"\n" ++
  "def mkGradeNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerMultKernel : Option Nat := some 0\n" ++
  "def multKernelReady : Bool := true\n" ++
  "def kernelOk : Bool := true\n" ++
  "end SystemsLean.KernelMult\n"

/-- Minimal good KernelLinear text (library seed expand continue).
    Greppable: hostModuleCheckGoodKernelLinearText, Host library seed expand continue. -/
def hostModuleCheckGoodKernelLinearText : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.KernelLinear\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_LINEAR_V0\"\n" ++
  "def kernelLinearId : String := \"SELF-HOST-KERNEL-LINEAR\"\n" ++
  "def mkLinearNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerLinearKernel : Option Nat := some 0\n" ++
  "def linearKernelReady : Bool := true\n" ++
  "def linearKernelOk : Bool := true\n" ++
  "end SystemsLean.KernelLinear\n"

/-- Minimal good KernelTypes text (library seed expand continue).
    Greppable: hostModuleCheckGoodKernelTypesText, Host library seed expand continue. -/
def hostModuleCheckGoodKernelTypesText : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.KernelTypes\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_TYPES_V0\"\n" ++
  "def kernelTypesId : String := \"SELF-HOST-KERNEL-TYPES\"\n" ++
  "def mkTypedNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerTypesKernel : Option Nat := some 0\n" ++
  "def typesKernelReady : Bool := true\n" ++
  "def typesKernelOk : Bool := true\n" ++
  "end SystemsLean.KernelTypes\n"

/-- Minimal good KernelProgram text (library seed expand continue).
    Greppable: hostModuleCheckGoodKernelProgramText, Host library seed expand continue. -/
def hostModuleCheckGoodKernelProgramText : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.KernelProgram\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_PROGRAM_V0\"\n" ++
  "def kernelProgramId : String := \"SELF-HOST-KERNEL-PROGRAM\"\n" ++
  "def mkProgramNode (tag : Nat) : Option Nat := some tag\n" ++
  "def lowerProgramKernel : Option Nat := some 0\n" ++
  "def programKernelReady : Bool := true\n" ++
  "def programKernelOk : Bool := true\n" ++
  "end SystemsLean.KernelProgram\n"

/-- Minimal good KernelMultTheorems text (library seed expand continue).
    Greppable: hostModuleCheckGoodKernelMultTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodKernelMultTheoremsText : String :=
  "import SystemsLean.KernelMult\n" ++
  "namespace SystemsLean.KernelMult\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem kernelMultId_eq : True := trivial\n" ++
  "theorem multKernelReady_true : True := trivial\n" ++
  "theorem kernelOk_true : True := trivial\n" ++
  "theorem lowerMultKernel_isSome : True := trivial\n" ++
  "theorem unknownTagRejected_true : True := trivial\n" ++
  "theorem multKernelProgram_length_three : True := trivial\n" ++
  "theorem multKernelProgram_isWellTyped : True := trivial\n" ++
  "end SystemsLean.KernelMult\n"

/-- Minimal good KernelLinearTheorems text (library seed expand continue).
    Greppable: hostModuleCheckGoodKernelLinearTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodKernelLinearTheoremsText : String :=
  "import SystemsLean.KernelLinear\n" ++
  "namespace SystemsLean.KernelLinear\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem kernelLinearId_eq : True := trivial\n" ++
  "theorem linearKernelReady_true : True := trivial\n" ++
  "theorem linearKernelOk_true : True := trivial\n" ++
  "theorem lowerLinearKernel_isSome : True := trivial\n" ++
  "theorem linearMismatchRejected_true : True := trivial\n" ++
  "theorem linearKernelProgram_length_one : True := trivial\n" ++
  "theorem linearKernelProgram_isWellTyped : True := trivial\n" ++
  "end SystemsLean.KernelLinear\n"

/-- Minimal good KernelTypesTheorems text (library seed expand continue).
    Greppable: hostModuleCheckGoodKernelTypesTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodKernelTypesTheoremsText : String :=
  "import SystemsLean.KernelTypes\n" ++
  "namespace SystemsLean.KernelTypes\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem kernelTypesId_eq : True := trivial\n" ++
  "theorem typesKernelReady_true : True := trivial\n" ++
  "theorem typesKernelOk_true : True := trivial\n" ++
  "theorem lowerTypesKernel_isSome : True := trivial\n" ++
  "theorem unknownKindRejected_true : True := trivial\n" ++
  "theorem typesKernelProgram_length_three : True := trivial\n" ++
  "theorem typesKernelProgram_isWellTyped : True := trivial\n" ++
  "end SystemsLean.KernelTypes\n"

/-- Minimal good KernelProgramTheorems text (library seed expand continue).
    Greppable: hostModuleCheckGoodKernelProgramTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodKernelProgramTheoremsText : String :=
  "import SystemsLean.KernelProgram\n" ++
  "namespace SystemsLean.KernelProgram\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem kernelProgramId_eq : True := trivial\n" ++
  "theorem programKernelReady_true : True := trivial\n" ++
  "theorem programKernelOk_true : True := trivial\n" ++
  "theorem lowerProgramKernel_isSome : True := trivial\n" ++
  "theorem programPathReady_true : True := trivial\n" ++
  "theorem programKernelProgram_length_three : True := trivial\n" ++
  "theorem programKernelProgram_isWellTyped : True := trivial\n" ++
  "end SystemsLean.KernelProgram\n"

/-- Minimal good JoinMap text (library seed expand continue).
    Greppable: hostModuleCheckGoodJoinMapText, Host library seed expand continue. -/
def hostModuleCheckGoodJoinMapText : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.JoinMap\n" ++
  "def stageId : String := \"SLAKE_JOIN_MAP_V0\"\n" ++
  "def hostJoinMapId : String := \"HOST-JOIN-MAP\"\n" ++
  "def joinMapId : String := \"JOIN-MAP\"\n" ++
  "def joinAlgContractOk : Bool := true\n" ++
  "def joinUnitCompileReady (hc : Nat) : Bool := true\n" ++
  "def joinProgramCompileReady (p : Nat) : Bool := true\n" ++
  "end SystemsLean.JoinMap\n"

/-- Minimal good JoinMapTheorems text (library seed expand continue).
    Greppable: hostModuleCheckGoodJoinMapTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodJoinMapTheoremsText : String :=
  "import SystemsLean.JoinMap\n" ++
  "namespace SystemsLean.JoinMap\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem hostJoinMapId_eq : True := trivial\n" ++
  "theorem joinAlgUseOk_true : True := trivial\n" ++
  "theorem joinAlgContractOk_true : True := trivial\n" ++
  "theorem joinCompileReady_eq_joinUnitCompileReady : True := trivial\n" ++
  "theorem joinUnitCompileReady_empty_true : True := trivial\n" ++
  "theorem joinProgramCompileReady_empty_false : True := trivial\n" ++
  "theorem empty_host_ok_ne_empty_program_ok : True := trivial\n" ++
  "end SystemsLean.JoinMap\n"

/-- Minimal good SelfHost text (library seed expand continue).
    Greppable: hostModuleCheckGoodSelfHostText, Host library seed expand continue. -/
def hostModuleCheckGoodSelfHostText : String :=
  "import SystemsLean.JoinMap\n" ++
  "namespace SystemsLean.SelfHost\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_V0\"\n" ++
  "def hostSelfHostId : String := \"HOST-SELF-HOST\"\n" ++
  "def selfHostId : String := \"SELF-HOST\"\n" ++
  "def hostSurfaceOk : Bool := true\n" ++
  "def selfHostUnitReady (hc : Nat) : Bool := true\n" ++
  "def selfHostProgramReady (p : Nat) : Bool := true\n" ++
  "end SystemsLean.SelfHost\n"

/-- Minimal good SelfHostTheorems text (library seed expand continue).
    Greppable: hostModuleCheckGoodSelfHostTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodSelfHostTheoremsText : String :=
  "import SystemsLean.SelfHost\n" ++
  "namespace SystemsLean.SelfHost\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem hostSelfHostId_eq : True := trivial\n" ++
  "theorem hostSurfaceOk_true : True := trivial\n" ++
  "theorem selfHostReady_eq_selfHostUnitReady : True := trivial\n" ++
  "theorem selfHostUnitReady_empty_true : True := trivial\n" ++
  "theorem selfHostProgramReady_empty_false : True := trivial\n" ++
  "theorem empty_host_ok_ne_empty_program_ok : True := trivial\n" ++
  "theorem selfHostUnitReady_mult1_unminted_false : True := trivial\n" ++
  "end SystemsLean.SelfHost\n"

/-- Minimal good SurfaceMatrix text (library seed expand continue).
    Greppable: hostModuleCheckGoodSurfaceMatrixText, Host library seed expand continue. -/
def hostModuleCheckGoodSurfaceMatrixText : String :=
  "import SystemsLean.SelfHost\n" ++
  "namespace SystemsLean.SurfaceMatrix\n" ++
  "def stageId : String := \"SLAKE_SURFACE_MATRIX_V0\"\n" ++
  "def hostSurfaceMatrixId : String := \"HOST-SURFACE-MATRIX\"\n" ++
  "def surfaceMatrixId : String := \"SURFACE-MATRIX\"\n" ++
  "def matrixSurfaceOk : Bool := true\n" ++
  "def matrixUnitReady (hc : Nat) : Bool := true\n" ++
  "def matrixProgramReady (p : Nat) : Bool := true\n" ++
  "end SystemsLean.SurfaceMatrix\n"

/-- Minimal good SurfaceMatrixTheorems text (library seed expand continue).
    Greppable: hostModuleCheckGoodSurfaceMatrixTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodSurfaceMatrixTheoremsText : String :=
  "import SystemsLean.SurfaceMatrix\n" ++
  "namespace SystemsLean.SurfaceMatrix\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem hostSurfaceMatrixId_eq : True := trivial\n" ++
  "theorem surfaceMatrixId_eq : True := trivial\n" ++
  "theorem matrixSurfaceOk_true : True := trivial\n" ++
  "theorem matrixUnitReady_empty_true : True := trivial\n" ++
  "theorem matrixProgramReady_empty_false : True := trivial\n" ++
  "theorem empty_host_ok_ne_empty_program_ok : True := trivial\n" ++
  "theorem matrixUnitReady_mult1_unminted_false : True := trivial\n" ++
  "end SystemsLean.SurfaceMatrix\n"

/-- Minimal good EmitMultScaffold text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitMultScaffoldText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitMultScaffoldText : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.EmitMult\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_MULT_V0\"\n" ++
  "def hostEmitMultId : String := \"HOST-EMIT-MULT\"\n" ++
  "def selfHostEmitMultId : String := \"SELF-HOST-EMIT-MULT\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitMult.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_mult.ssot.txt\"\n" ++
  "end SystemsLean.EmitMult\n"

/-- Minimal good EmitLinearScaffold text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitLinearScaffoldText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitLinearScaffoldText : String :=
  "namespace SystemsLean.EmitLinear\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_LINEAR_V0\"\n" ++
  "def hostEmitLinearId : String := \"HOST-EMIT-LINEAR\"\n" ++
  "def selfHostEmitLinearId : String := \"SELF-HOST-EMIT-LINEAR\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitLinear.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_linear.ssot.txt\"\n" ++
  "end SystemsLean.EmitLinear\n"

/-- Minimal good EmitTypesScaffold text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitTypesScaffoldText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitTypesScaffoldText : String :=
  "namespace SystemsLean.EmitTypes\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_TYPES_V0\"\n" ++
  "def hostEmitTypesId : String := \"HOST-EMIT-TYPES\"\n" ++
  "def selfHostEmitTypesId : String := \"SELF-HOST-EMIT-TYPES\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitTypes.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_types.ssot.txt\"\n" ++
  "end SystemsLean.EmitTypes\n"

/-- Minimal good EmitProgramScaffold text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitProgramScaffoldText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitProgramScaffoldText : String :=
  "namespace SystemsLean.EmitProgram\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_PROGRAM_V0\"\n" ++
  "def hostEmitProgramId : String := \"HOST-EMIT-PROGRAM\"\n" ++
  "def selfHostEmitProgramId : String := \"SELF-HOST-EMIT-PROGRAM\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitProgram.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_program.ssot.txt\"\n" ++
  "end SystemsLean.EmitProgram\n"

/-- Minimal good EmitGraphScaffold text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitGraphScaffoldText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitGraphScaffoldText : String :=
  "namespace SystemsLean.EmitGraph\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_GRAPH_V0\"\n" ++
  "def hostEmitGraphId : String := \"HOST-EMIT-GRAPH\"\n" ++
  "def selfHostEmitGraphId : String := \"SELF-HOST-EMIT-GRAPH\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitGraph.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_graph.ssot.txt\"\n" ++
  "end SystemsLean.EmitGraph\n"

/-- Minimal good EmitComposeScaffold text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitComposeScaffoldText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitComposeScaffoldText : String :=
  "namespace SystemsLean.EmitCompose\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_COMPOSE_V0\"\n" ++
  "def hostEmitComposeId : String := \"HOST-EMIT-COMPOSE\"\n" ++
  "def selfHostEmitComposeId : String := \"SELF-HOST-EMIT-COMPOSE\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitCompose.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_compose.ssot.txt\"\n" ++
  "end SystemsLean.EmitCompose\n"

/-- Minimal good EmitPlanScaffold text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitPlanScaffoldText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitPlanScaffoldText : String :=
  "namespace SystemsLean.EmitPlan\n" ++
  "def productStageId : String := \"SLAKE_SELF_HOST_EMIT_PLAN_V0\"\n" ++
  "def hostEmitPlanId : String := \"HOST-EMIT-PLAN\"\n" ++
  "def selfHostEmitPlanId : String := \"SELF-HOST-EMIT-PLAN\"\n" ++
  "def productAcceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def productHostModulePath : String := \"src/systems/SystemsLean/EmitPlan.lean\"\n" ++
  "def planSsotArtifactPath : String := \"src/systems/emit/host_emit_plan.ssot.txt\"\n" ++
  "end SystemsLean.EmitPlan\n"

/-- Minimal good EmitApplyScaffold text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitApplyScaffoldText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitApplyScaffoldText : String :=
  "namespace SystemsLean.EmitApply\n" ++
  "def productStageId : String := \"SLAKE_SELF_HOST_EMIT_APPLY_V0\"\n" ++
  "def hostEmitApplyId : String := \"HOST-EMIT-APPLY\"\n" ++
  "def selfHostEmitApplyId : String := \"SELF-HOST-EMIT-APPLY\"\n" ++
  "def productAcceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def productHostModulePath : String := \"src/systems/SystemsLean/EmitApply.lean\"\n" ++
  "def applySsotArtifactPath : String := \"src/systems/emit/host_emit_apply.ssot.txt\"\n" ++
  "end SystemsLean.EmitApply\n"

/-- Minimal good EmitBodyScaffold text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitBodyScaffoldText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitBodyScaffoldText : String :=
  "namespace SystemsLean.EmitBody\n" ++
  "def productStageId : String := \"SLAKE_SELF_HOST_EMIT_BODY_V0\"\n" ++
  "def hostEmitBodyId : String := \"HOST-EMIT-BODY\"\n" ++
  "def selfHostEmitBodyId : String := \"SELF-HOST-EMIT-BODY\"\n" ++
  "def productAcceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def productHostModulePath : String := \"src/systems/SystemsLean/EmitBody.lean\"\n" ++
  "def bodySsotArtifactPath : String := \"src/systems/emit/host_emit_body_fragment.ssot.txt\"\n" ++
  "end SystemsLean.EmitBody\n"

/-- Minimal good EmitErasureScaffold text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitErasureScaffoldText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitErasureScaffoldText : String :=
  "namespace SystemsLean.EmitErasure\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_ERASURE_V0\"\n" ++
  "def hostEmitErasureId : String := \"HOST-EMIT-ERASURE\"\n" ++
  "def selfHostEmitErasureId : String := \"SELF-HOST-EMIT-ERASURE\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitErasure.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_erasure.ssot.txt\"\n" ++
  "end SystemsLean.EmitErasure\n"

/-- Minimal good EmitExtractScaffold text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitExtractScaffoldText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitExtractScaffoldText : String :=
  "namespace SystemsLean.EmitExtract\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_EXTRACT_V0\"\n" ++
  "def hostEmitExtractId : String := \"HOST-EMIT-EXTRACT\"\n" ++
  "def selfHostEmitExtractId : String := \"SELF-HOST-EMIT-EXTRACT\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitExtract.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_extract.ssot.txt\"\n" ++
  "end SystemsLean.EmitExtract\n"

/-- Minimal good EmitBannerScaffold text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitBannerScaffoldText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitBannerScaffoldText : String :=
  "namespace SystemsLean.EmitBanner\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_BANNER_V0\"\n" ++
  "def hostEmitBannerId : String := \"HOST-EMIT-BANNER\"\n" ++
  "def selfHostEmitBannerId : String := \"SELF-HOST-EMIT-BANNER\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitBanner.lean\"\n" ++
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_banner.ssot.txt\"\n" ++
  "end SystemsLean.EmitBanner\n"

/-- Minimal good KernelSelfApply text (library seed expand continue).
    Greppable: hostModuleCheckGoodKernelSelfApplyText, Host library seed expand continue. -/
def hostModuleCheckGoodKernelSelfApplyText : String :=
  "namespace SystemsLean.KernelSelfApply\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0\"\n" ++
  "def hostId : String := \"HOST-SELF-HOST-KERNEL-SELF-APPLY\"\n" ++
  "def selfHostId : String := \"SELF-HOST-KERNEL-SELF-APPLY\"\n" ++
  "def productKernelSelfApplyModuleCite : String := \"KernelSelfApply\"\n" ++
  "def productKernelBarSurfaceOk : Bool := true\n" ++
  "def productKernelSelfApplyPartialReady : Bool := true\n" ++
  "end SystemsLean.KernelSelfApply\n"

/-- Minimal good KernelSelfApplyTheorems text (library seed expand continue).
    Greppable: hostModuleCheckGoodKernelSelfApplyTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodKernelSelfApplyTheoremsText : String :=
  "import SystemsLean.KernelSelfApply\n" ++
  "namespace SystemsLean.KernelSelfApply\n" ++
  "theorem productKernelSelfApplyPartialReady_true :\n" ++
  "    productKernelSelfApplyPartialReady = true := by decide\n" ++
  "end SystemsLean.KernelSelfApply\n"

/-- Minimal good EmitMult product text (scaffold-import shell).
    Greppable: hostModuleCheckGoodEmitMultText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitMultText : String :=
  "import SystemsLean.EmitMultScaffold\n" ++
  "namespace SystemsLean.EmitMult\n" ++
  "end SystemsLean.EmitMult\n"

/-- Minimal good EmitLinear product text (scaffold-import shell).
    Greppable: hostModuleCheckGoodEmitLinearText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitLinearText : String :=
  "import SystemsLean.EmitLinearScaffold\n" ++
  "namespace SystemsLean.EmitLinear\n" ++
  "end SystemsLean.EmitLinear\n"

/-- Minimal good EmitTypes product text (scaffold-import shell).
    Greppable: hostModuleCheckGoodEmitTypesText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitTypesText : String :=
  "import SystemsLean.EmitTypesScaffold\n" ++
  "namespace SystemsLean.EmitTypes\n" ++
  "end SystemsLean.EmitTypes\n"

/-- Minimal good EmitProgram product text (scaffold-import shell).
    Greppable: hostModuleCheckGoodEmitProgramText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitProgramText : String :=
  "import SystemsLean.EmitProgramScaffold\n" ++
  "namespace SystemsLean.EmitProgram\n" ++
  "end SystemsLean.EmitProgram\n"

/-- Minimal good EmitGraph product text (scaffold-import shell).
    Greppable: hostModuleCheckGoodEmitGraphText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitGraphText : String :=
  "import SystemsLean.EmitGraphScaffold\n" ++
  "namespace SystemsLean.EmitGraph\n" ++
  "end SystemsLean.EmitGraph\n"

/-- Minimal good EmitCompose product text (scaffold-import shell).
    Greppable: hostModuleCheckGoodEmitComposeText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitComposeText : String :=
  "import SystemsLean.EmitComposeScaffold\n" ++
  "namespace SystemsLean.EmitCompose\n" ++
  "end SystemsLean.EmitCompose\n"

/-- Minimal good EmitErasure product text (scaffold-import shell).
    Greppable: hostModuleCheckGoodEmitErasureText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitErasureText : String :=
  "import SystemsLean.EmitErasureScaffold\n" ++
  "namespace SystemsLean.EmitErasure\n" ++
  "end SystemsLean.EmitErasure\n"

/-- Minimal good EmitExtract product text (scaffold-import shell).
    Greppable: hostModuleCheckGoodEmitExtractText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitExtractText : String :=
  "import SystemsLean.EmitExtractScaffold\n" ++
  "namespace SystemsLean.EmitExtract\n" ++
  "end SystemsLean.EmitExtract\n"

/-- Minimal good EmitBanner product text (scaffold-import shell).
    Greppable: hostModuleCheckGoodEmitBannerText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitBannerText : String :=
  "import SystemsLean.EmitBannerScaffold\n" ++
  "namespace SystemsLean.EmitBanner\n" ++
  "end SystemsLean.EmitBanner\n"

/-- Minimal good ProductOutKernel text (SelfApplyFs leaf foundation).
    Greppable: hostModuleCheckGoodProductOutKernelText, Host library seed expand continue. -/
def hostModuleCheckGoodProductOutKernelText : String :=
  "namespace SystemsLean.ProductOutKernel\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_OUT_V0\"\n" ++
  "def hostId : String := \"HOST-SELF-HOST-PRODUCT-OUT\"\n" ++
  "def selfHostId : String := \"SELF-HOST-PRODUCT-OUT\"\n" ++
  "def productOutKernelModuleCite : String := \"ProductOutKernel\"\n" ++
  "def productOutKernelBarSurfaceOk : Bool := true\n" ++
  "def productOutKernelEvidencePartialReady : Bool := true\n" ++
  "end SystemsLean.ProductOutKernel\n"

/-- Minimal good ProductOutKernelTheorems text.
    Greppable: hostModuleCheckGoodProductOutKernelTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodProductOutKernelTheoremsText : String :=
  "import SystemsLean.ProductOutKernel\n" ++
  "namespace SystemsLean.ProductOutKernel\n" ++
  "theorem productOutKernelEvidencePartialReady_true :\n" ++
  "    productOutKernelEvidencePartialReady = true := by native_decide\n" ++
  "end SystemsLean.ProductOutKernel\n"

/-- Minimal good BootstrapHonesty text (SelfApplyFs leaf foundation).
    Greppable: hostModuleCheckGoodBootstrapHonestyText, Host library seed expand continue. -/
def hostModuleCheckGoodBootstrapHonestyText : String :=
  "namespace SystemsLean.BootstrapHonesty\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_PATH_BOOTSTRAP_V0\"\n" ++
  "def hostId : String := \"HOST-SELF-HOST-PRODUCT-PATH-BOOTSTRAP\"\n" ++
  "def selfHostId : String := \"SELF-HOST-PRODUCT-PATH-BOOTSTRAP\"\n" ++
  "def bootstrapHonestyModuleCite : String := \"BootstrapHonesty\"\n" ++
  "def productPathBootstrapSurfaceOk : Bool := true\n" ++
  "def productPathHostLakeBootstrapPartialReady : Bool := true\n" ++
  "end SystemsLean.BootstrapHonesty\n"

/-- Minimal good BootstrapHonestyTheorems text.
    Greppable: hostModuleCheckGoodBootstrapHonestyTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodBootstrapHonestyTheoremsText : String :=
  "import SystemsLean.BootstrapHonesty\n" ++
  "namespace SystemsLean.BootstrapHonesty\n" ++
  "theorem productPathHostLakeBootstrapPartialReady_true :\n" ++
  "    productPathHostLakeBootstrapPartialReady = true := by native_decide\n" ++
  "theorem productPathHostLakeBootstrapRemains_true :\n" ++
  "    productPathHostLakeBootstrapRemains = true := by native_decide\n" ++
  "end SystemsLean.BootstrapHonesty\n"

/-- Minimal good ProductPathWriterSurface text (SelfApplyFs ProductPath writer pure leaf).
    Greppable: hostModuleCheckGoodProductPathWriterSurfaceText, Host library seed expand continue. -/
def hostModuleCheckGoodProductPathWriterSurfaceText : String :=
  "namespace SystemsLean.ProductPathWriterSurface\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_WRITER_SURFACE_V0\"\n" ++
  "def hostId : String := \"HOST-SELF-HOST-PRODUCT-WRITER-SURFACE\"\n" ++
  "def selfHostId : String := \"SELF-HOST-PRODUCT-WRITER-SURFACE\"\n" ++
  "def writerSurfaceModuleCite : String := \"ProductPathWriterSurface\"\n" ++
  "def productWriterSurfaceOk : Bool := true\n" ++
  "def productWriterSurfacePartialReady : Bool := true\n" ++
  "end SystemsLean.ProductPathWriterSurface\n"

/-- Minimal good ProductPathWriterSurfaceTheorems text.
    Greppable: hostModuleCheckGoodProductPathWriterSurfaceTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodProductPathWriterSurfaceTheoremsText : String :=
  "import SystemsLean.ProductPathWriterSurface\n" ++
  "namespace SystemsLean.ProductPathWriterSurface\n" ++
  "theorem productWriterSurfacePartialReady_true :\n" ++
  "    productWriterSurfacePartialReady = true := by native_decide\n" ++
  "end SystemsLean.ProductPathWriterSurface\n"

/-- Minimal good ProductPathWriterPathPlan text (SelfApplyFs ProductPath writer pure leaf).
    Greppable: hostModuleCheckGoodProductPathWriterPathPlanText, Host library seed expand continue. -/
def hostModuleCheckGoodProductPathWriterPathPlanText : String :=
  "namespace SystemsLean.ProductPathWriterPathPlan\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_WRITER_PATH_PLAN_V0\"\n" ++
  "def hostId : String := \"HOST-SELF-HOST-PRODUCT-WRITER-PATH-PLAN\"\n" ++
  "def selfHostId : String := \"SELF-HOST-PRODUCT-WRITER-PATH-PLAN\"\n" ++
  "def writerPathPlanModuleCite : String := \"ProductPathWriterPathPlan\"\n" ++
  "def productWriterPathPlanOk : Bool := true\n" ++
  "def productWriterPathPlanPartialReady : Bool := true\n" ++
  "end SystemsLean.ProductPathWriterPathPlan\n"

/-- Minimal good ProductPathWriterPathPlanTheorems text.
    Greppable: hostModuleCheckGoodProductPathWriterPathPlanTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodProductPathWriterPathPlanTheoremsText : String :=
  "import SystemsLean.ProductPathWriterPathPlan\n" ++
  "namespace SystemsLean.ProductPathWriterPathPlan\n" ++
  "theorem productWriterPathPlanPartialReady_true :\n" ++
  "    productWriterPathPlanPartialReady = true := by native_decide\n" ++
  "end SystemsLean.ProductPathWriterPathPlan\n"

/-- Minimal good ProductPathWriterPathExec text (SelfApplyFs ProductPath writer pure leaf).
    Greppable: hostModuleCheckGoodProductPathWriterPathExecText, Host library seed expand continue. -/
def hostModuleCheckGoodProductPathWriterPathExecText : String :=
  "namespace SystemsLean.ProductPathWriterPathExec\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_PRODUCT_WRITER_PATH_EXEC_V0\"\n" ++
  "def hostId : String := \"HOST-SELF-HOST-PRODUCT-WRITER-PATH-EXEC\"\n" ++
  "def selfHostId : String := \"SELF-HOST-PRODUCT-WRITER-PATH-EXEC\"\n" ++
  "def writerPathExecModuleCite : String := \"ProductPathWriterPathExec\"\n" ++
  "def productWriterPathExecutionOk : Bool := true\n" ++
  "def productWriterPathExecutionPartialReady : Bool := true\n" ++
  "end SystemsLean.ProductPathWriterPathExec\n"

/-- Minimal good ProductPathWriterPathExecTheorems text.
    Greppable: hostModuleCheckGoodProductPathWriterPathExecTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodProductPathWriterPathExecTheoremsText : String :=
  "import SystemsLean.ProductPathWriterPathExec\n" ++
  "namespace SystemsLean.ProductPathWriterPathExec\n" ++
  "theorem productWriterPathExecutionPartialReady_true :\n" ++
  "    productWriterPathExecutionPartialReady = true := by native_decide\n" ++
  "end SystemsLean.ProductPathWriterPathExec\n"

/-- Minimal good EmitPlan product text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitPlanText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitPlanText : String :=
  "import SystemsLean.Mult\n" ++
  "import SystemsLean.Types\n" ++
  "import SystemsLean.HostCompose\n" ++
  "import SystemsLean.EmitPlanScaffold\n" ++
  "namespace SystemsLean.EmitPlan\n" ++
  "def planFromCompose (hc : Nat) : Nat := hc\n" ++
  "def fromCompose (hc : Nat) : Nat := planFromCompose hc\n" ++
  "def isReady (p : Nat) : Bool := true\n" ++
  "def planOk (hc : Nat) : Bool := true\n" ++
  "def isRuntimeMult (m : Nat) : Bool := true\n" ++
  "def countRuntimeNodes (nodes : Nat) : Nat := 0\n" ++
  "end SystemsLean.EmitPlan\n"

/-- Minimal good EmitApply product text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitApplyText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitApplyText : String :=
  "import SystemsLean.Mult\n" ++
  "import SystemsLean.Types\n" ++
  "import SystemsLean.HostCompose\n" ++
  "import SystemsLean.EmitApplyScaffold\n" ++
  "namespace SystemsLean.EmitApply\n" ++
  "def applyCap : Nat := 32\n" ++
  "def applyFromCompose (hc : Nat) : Nat := hc\n" ++
  "def fromCompose (hc : Nat) : Nat := applyFromCompose hc\n" ++
  "def applyIsValid (a : Nat) : Bool := true\n" ++
  "def applyOk (hc : Nat) : Bool := true\n" ++
  "def packTag (n : Nat) : Nat := n\n" ++
  "end SystemsLean.EmitApply\n"

/-- Minimal good EmitBody product text (library seed expand continue).
    Greppable: hostModuleCheckGoodEmitBodyText, Host library seed expand continue. -/
def hostModuleCheckGoodEmitBodyText : String :=
  "import SystemsLean.Mult\n" ++
  "import SystemsLean.Types\n" ++
  "import SystemsLean.HostCompose\n" ++
  "import SystemsLean.EmitPlan\n" ++
  "import SystemsLean.EmitApply\n" ++
  "import SystemsLean.EmitBodyScaffold\n" ++
  "namespace SystemsLean.EmitBody\n" ++
  "def bodyCap : Nat := 256\n" ++
  "def bodyFromCompose (hc : Nat) : Nat := hc\n" ++
  "def fromCompose (hc : Nat) : Nat := bodyFromCompose hc\n" ++
  "def bodyIsValid (b : Nat) : Bool := true\n" ++
  "def bodyOk (hc : Nat) : Bool := true\n" ++
  "def buildFragment (p : Nat) (a : Nat) : String := \"\"\n" ++
  "end SystemsLean.EmitBody\n"

/-- Minimal good KernelEmit product text (library seed expand continue).
    Greppable: hostModuleCheckGoodKernelEmitText, Host library seed expand continue. -/
def hostModuleCheckGoodKernelEmitText : String :=
  "import SystemsLean.HostCompose\n" ++
  "import SystemsLean.EmitPlan\n" ++
  "import SystemsLean.EmitApply\n" ++
  "import SystemsLean.EmitBody\n" ++
  "import SystemsLean.EmitMult\n" ++
  "import SystemsLean.KernelProgram\n" ++
  "namespace SystemsLean.KernelEmit\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_EMIT_V0\"\n" ++
  "def kernelEmitId : String := \"SELF-HOST-KERNEL-EMIT\"\n" ++
  "def hostKernelEmitId : String := \"HOST-KERNEL-EMIT\"\n" ++
  "def emitKernelReady : Bool := true\n" ++
  "def emitKernelOk : Bool := true\n" ++
  "def emitPlanPathReady : Bool := true\n" ++
  "def emitApplyPathReady : Bool := true\n" ++
  "def emitBodyPathReady : Bool := true\n" ++
  "end SystemsLean.KernelEmit\n"

/-- Minimal good KernelEmitTheorems text (library seed expand continue).
    Same namespace SystemsLean.KernelEmit as on-disk theorems module.
    Greppable: hostModuleCheckGoodKernelEmitTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodKernelEmitTheoremsText : String :=
  "import SystemsLean.HostCompose\n" ++
  "import SystemsLean.EmitPlan\n" ++
  "import SystemsLean.EmitApply\n" ++
  "import SystemsLean.EmitBody\n" ++
  "import SystemsLean.EmitMult\n" ++
  "import SystemsLean.KernelProgram\n" ++
  "import SystemsLean.KernelEmit\n" ++
  "namespace SystemsLean.KernelEmit\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem kernelEmitId_eq : True := trivial\n" ++
  "theorem hostKernelEmitId_eq : True := trivial\n" ++
  "theorem emitKernelReady_true : True := trivial\n" ++
  "theorem emitKernelOk_true : True := trivial\n" ++
  "theorem emitPlanPathReady_true : True := trivial\n" ++
  "end SystemsLean.KernelEmit\n"

/-- Minimal good ParityMult text (library seed expand continue).
    Greppable: hostModuleCheckGoodParityMultText, Host library seed expand continue. -/
def hostModuleCheckGoodParityMultText : String :=
  "import SystemsLean.Mult\n" ++
  "import SystemsLean.KernelMult\n" ++
  "import SystemsLean.EmitMult\n" ++
  "namespace SystemsLean.ParityMult\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_MULT_V0\"\n" ++
  "def hostParityMultId : String := \"HOST-PARITY-MULT\"\n" ++
  "def selfHostParityMultId : String := \"SELF-HOST-PARITY-MULT\"\n" ++
  "def multParityReady : Bool := true\n" ++
  "def multParityOk : Bool := true\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityMult.lean\"\n" ++
  "end SystemsLean.ParityMult\n"

/-- Minimal good ParityMultTheorems text (library seed expand continue).
    Same namespace SystemsLean.ParityMult as on-disk theorems module.
    Greppable: hostModuleCheckGoodParityMultTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodParityMultTheoremsText : String :=
  "import SystemsLean.Mult\n" ++
  "import SystemsLean.KernelMult\n" ++
  "import SystemsLean.EmitMult\n" ++
  "import SystemsLean.ParityMult\n" ++
  "namespace SystemsLean.ParityMult\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem hostParityMultId_eq : True := trivial\n" ++
  "theorem selfHostParityMultId_eq : True := trivial\n" ++
  "theorem multParityReady_true : True := trivial\n" ++
  "theorem multParityOk_true : True := trivial\n" ++
  "end SystemsLean.ParityMult\n"

/-- Minimal good ParityLinear text (library seed expand continue).
    Greppable: hostModuleCheckGoodParityLinearText, Host library seed expand continue. -/
def hostModuleCheckGoodParityLinearText : String :=
  "import SystemsLean.KernelLinear\n" ++
  "import SystemsLean.ParityMult\n" ++
  "namespace SystemsLean.ParityLinear\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_LINEAR_V0\"\n" ++
  "def hostParityLinearId : String := \"HOST-PARITY-LINEAR\"\n" ++
  "def selfHostParityLinearId : String := \"SELF-HOST-PARITY-LINEAR\"\n" ++
  "def linearParityReady : Bool := true\n" ++
  "def linearParityOk : Bool := true\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityLinear.lean\"\n" ++
  "end SystemsLean.ParityLinear\n"

/-- Minimal good ParityLinearTheorems text (library seed expand continue).
    Same namespace SystemsLean.ParityLinear as on-disk theorems module.
    Greppable: hostModuleCheckGoodParityLinearTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodParityLinearTheoremsText : String :=
  "import SystemsLean.KernelLinear\n" ++
  "import SystemsLean.ParityMult\n" ++
  "import SystemsLean.ParityLinear\n" ++
  "namespace SystemsLean.ParityLinear\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem hostParityLinearId_eq : True := trivial\n" ++
  "theorem selfHostParityLinearId_eq : True := trivial\n" ++
  "theorem linearParityReady_true : True := trivial\n" ++
  "theorem linearParityOk_true : True := trivial\n" ++
  "end SystemsLean.ParityLinear\n"

/-- Minimal good ParityTypes text (library seed expand continue).
    Greppable: hostModuleCheckGoodParityTypesText, Host library seed expand continue. -/
def hostModuleCheckGoodParityTypesText : String :=
  "import SystemsLean.KernelTypes\n" ++
  "import SystemsLean.ParityLinear\n" ++
  "namespace SystemsLean.ParityTypes\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_TYPES_V0\"\n" ++
  "def hostParityTypesId : String := \"HOST-PARITY-TYPES\"\n" ++
  "def selfHostParityTypesId : String := \"SELF-HOST-PARITY-TYPES\"\n" ++
  "def typesParityReady : Bool := true\n" ++
  "def typesParityOk : Bool := true\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityTypes.lean\"\n" ++
  "end SystemsLean.ParityTypes\n"

/-- Minimal good ParityTypesTheorems text (library seed expand continue).
    Same namespace SystemsLean.ParityTypes as on-disk theorems module.
    Greppable: hostModuleCheckGoodParityTypesTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodParityTypesTheoremsText : String :=
  "import SystemsLean.KernelTypes\n" ++
  "import SystemsLean.ParityLinear\n" ++
  "import SystemsLean.ParityTypes\n" ++
  "namespace SystemsLean.ParityTypes\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem hostParityTypesId_eq : True := trivial\n" ++
  "theorem selfHostParityTypesId_eq : True := trivial\n" ++
  "theorem typesParityReady_true : True := trivial\n" ++
  "theorem typesParityOk_true : True := trivial\n" ++
  "end SystemsLean.ParityTypes\n"

/-- Minimal good ParityProgram text (library seed expand continue).
    Greppable: hostModuleCheckGoodParityProgramText, Host library seed expand continue. -/
def hostModuleCheckGoodParityProgramText : String :=
  "import SystemsLean.KernelProgram\n" ++
  "import SystemsLean.ParityTypes\n" ++
  "namespace SystemsLean.ParityProgram\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_PROGRAM_V0\"\n" ++
  "def hostParityProgramId : String := \"HOST-PARITY-PROGRAM\"\n" ++
  "def selfHostParityProgramId : String := \"SELF-HOST-PARITY-PROGRAM\"\n" ++
  "def programParityReady : Bool := true\n" ++
  "def programParityOk : Bool := true\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityProgram.lean\"\n" ++
  "end SystemsLean.ParityProgram\n"

/-- Minimal good ParityProgramTheorems text (library seed expand continue).
    Same namespace SystemsLean.ParityProgram as on-disk theorems module.
    Greppable: hostModuleCheckGoodParityProgramTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodParityProgramTheoremsText : String :=
  "import SystemsLean.KernelProgram\n" ++
  "import SystemsLean.ParityTypes\n" ++
  "import SystemsLean.ParityProgram\n" ++
  "namespace SystemsLean.ParityProgram\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem hostParityProgramId_eq : True := trivial\n" ++
  "theorem selfHostParityProgramId_eq : True := trivial\n" ++
  "theorem programParityReady_true : True := trivial\n" ++
  "theorem programParityOk_true : True := trivial\n" ++
  "end SystemsLean.ParityProgram\n"

/-- Minimal good ParityEmit text (library seed expand continue).
    Greppable: hostModuleCheckGoodParityEmitText, Host library seed expand continue. -/
def hostModuleCheckGoodParityEmitText : String :=
  "import SystemsLean.KernelEmit\n" ++
  "import SystemsLean.ParityProgram\n" ++
  "import SystemsLean.EmitMult\n" ++
  "namespace SystemsLean.ParityEmit\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_EMIT_V0\"\n" ++
  "def hostParityEmitId : String := \"HOST-PARITY-EMIT\"\n" ++
  "def selfHostParityEmitId : String := \"SELF-HOST-PARITY-EMIT\"\n" ++
  "def emitParityReady : Bool := true\n" ++
  "def emitParityOk : Bool := true\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityEmit.lean\"\n" ++
  "end SystemsLean.ParityEmit\n"

/-- Minimal good ParityEmitTheorems text (library seed expand continue).
    Same namespace SystemsLean.ParityEmit as on-disk theorems module.
    Greppable: hostModuleCheckGoodParityEmitTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodParityEmitTheoremsText : String :=
  "import SystemsLean.KernelEmit\n" ++
  "import SystemsLean.ParityProgram\n" ++
  "import SystemsLean.EmitMult\n" ++
  "import SystemsLean.ParityEmit\n" ++
  "namespace SystemsLean.ParityEmit\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem hostParityEmitId_eq : True := trivial\n" ++
  "theorem selfHostParityEmitId_eq : True := trivial\n" ++
  "theorem emitParityReady_true : True := trivial\n" ++
  "theorem emitParityOk_true : True := trivial\n" ++
  "end SystemsLean.ParityEmit\n"

/-- Minimal good SelfApply text (library seed expand continue).
    Greppable: hostModuleCheckGoodSelfApplyText, Host library seed expand continue. -/
def hostModuleCheckGoodSelfApplyText : String :=
  "import SystemsLean.ParityMult\n" ++
  "import SystemsLean.KernelLinear\n" ++
  "import SystemsLean.KernelTypes\n" ++
  "import SystemsLean.KernelProgram\n" ++
  "import SystemsLean.KernelEmit\n" ++
  "namespace SystemsLean.SelfApply\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_SELF_APPLY_V0\"\n" ++
  "def hostSelfApplyId : String := \"HOST-SELF-APPLY\"\n" ++
  "def selfHostSelfApplyId : String := \"SELF-HOST-SELF-APPLY\"\n" ++
  "def selfApplySurfaceOk : Bool := true\n" ++
  "def kernelRebuildsKernel : Bool := true\n" ++
  "def selfApplyReady : Bool := true\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/SelfApply.lean\"\n" ++
  "end SystemsLean.SelfApply\n"

/-- Minimal good SelfApplyTheorems text (library seed expand continue).
    Same namespace SystemsLean.SelfApply as on-disk theorems module.
    Greppable: hostModuleCheckGoodSelfApplyTheoremsText, Host library seed expand continue. -/
def hostModuleCheckGoodSelfApplyTheoremsText : String :=
  "import SystemsLean.ParityMult\n" ++
  "import SystemsLean.KernelLinear\n" ++
  "import SystemsLean.KernelTypes\n" ++
  "import SystemsLean.KernelProgram\n" ++
  "import SystemsLean.KernelEmit\n" ++
  "import SystemsLean.SelfApply\n" ++
  "namespace SystemsLean.SelfApply\n" ++
  "theorem stageId_eq : True := trivial\n" ++
  "theorem hostSelfApplyId_eq : True := trivial\n" ++
  "theorem selfApplySurfaceOk_true : True := trivial\n" ++
  "theorem kernelRebuildsKernel_true : True := trivial\n" ++
  "theorem selfApplyReady_true : True := trivial\n" ++
  "end SystemsLean.SelfApply\n"

/-- Bad: Mult without inductive.
    Greppable: hostModuleCheckBadMissingInductiveText. -/
def hostModuleCheckBadMissingInductiveText : String :=
  "namespace SystemsLean.Mult\n" ++
  "def name : Nat -> String\n" ++
  "  | _ => \"x\"\n" ++
  "def isValid : Nat -> Bool\n" ++
  "  | _ => true\n" ++
  "def ofNat? : Nat -> Option Nat\n" ++
  "  | _ => none\n" ++
  "def isValidTag (n : Nat) : Bool := false\n" ++
  "def multIsValid (m : Nat) : Bool := true\n" ++
  "end SystemsLean.Mult\n"

/-- Bad: Mult without namespace.
    Greppable: hostModuleCheckBadMissingNamespaceText. -/
def hostModuleCheckBadMissingNamespaceText : String :=
  "inductive Mult where\n" ++
  "  | mult0\n" ++
  "def name : Mult -> String\n" ++
  "  | _ => \"MULT-0\"\n" ++
  "def isValid : Mult -> Bool\n" ++
  "  | _ => true\n" ++
  "def ofNat? : Nat -> Option Mult\n" ++
  "  | _ => none\n" ++
  "def isValidTag (n : Nat) : Bool := false\n" ++
  "def multIsValid (m : Mult) : Bool := true\n"

/-- Bad: empty / comments only.
    Greppable: hostModuleCheckBadEmptyText. -/
def hostModuleCheckBadEmptyText : String :=
  "-- empty module\n/- block -/\n"

/-- Bad: MultTheorems missing ofNat?_fail_closed (fail-closed under A7 corpus).
    Greppable: hostModuleCheckBadMissingTheoremText. -/
def hostModuleCheckBadMissingTheoremText : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.Mult\n" ++
  "theorem ofNat?_zero : ofNat? 0 = some Mult.mult0 := rfl\n" ++
  "theorem ofNat?_one : ofNat? 1 = some Mult.mult1 := rfl\n" ++
  "theorem ofNat?_two : ofNat? 2 = some Mult.multOmega := rfl\n" ++
  "theorem isValidTag_zero : isValidTag 0 = true := rfl\n" ++
  "theorem isValidTag_one : isValidTag 1 = true := rfl\n" ++
  "theorem isValidTag_two : isValidTag 2 = true := rfl\n" ++
  "theorem isValidTag_fail_closed (n : Nat) (h : 2 < n) : isValidTag n = false := by sorry\n" ++
  "end SystemsLean.Mult\n"

end SystemsLean.HostModuleCheck
