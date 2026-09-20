/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckRequiredDecls.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveRequiredDeclsSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-REQUIRED-DECLS, liveRequiredDeclsSource,
  HOST-FRONT-LIVE-REQUIRED-DECLS, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveRequiredDeclsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveRequiredDecls

/-- Dual-pinned live HostModuleCheckRequiredDecls.lean bytes (must match on-disk file).
    Greppable: liveRequiredDeclsSource, PARSE-LIVE-REQUIRED-DECLS. -/
def liveRequiredDeclsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck required key-decl lists (foundation Mult..Emit scaffolds).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.HostModuleCheckFixtures: required key-decl list defs for Mult through Emit scaffold/empty product shells.
  Same namespace SystemsLean.HostModuleCheck so names stay unqualified.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckRequiredDecls,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, Host library seed expand continue,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckRequiredDecls
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckRequiredDecls;
  lake build SystemsLean.HostModuleCheck.
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

/-- Required MultTheorems key decls (A56 Check depth deepen Mult..Types band;
    A7 base corpus + name/isValid honesty theorems from MultTheorems.lean).
    Greppable: multTheoremsRequiredDecls, Check depth deepen, FOUNDATION-KIND-SURFACE. -/
def multTheoremsRequiredDecls : List String :=
  ["theorem:ofNat?_zero",
   "theorem:ofNat?_one",
   "theorem:ofNat?_two",
   "theorem:ofNat?_fail_closed",
   "theorem:isValidTag_zero",
   "theorem:isValidTag_one",
   "theorem:isValidTag_two",
   "theorem:isValidTag_fail_closed",
   "theorem:isValid_true",
   "theorem:multIsValid_eq_isValid",
   "theorem:name_mult0",
   "theorem:name_mult1",
   "theorem:name_multOmega",
   "theorem:isValidTag_eq_ofNat?_isSome"]

/-- Required Linear key decls (A56 deepen: structure surface adds axiom Token
    family + honesty ids). Greppable: linearRequiredDecls, Check depth deepen,
    FOUNDATION-KIND-SURFACE. -/
def linearRequiredDecls : List String :=
  ["def:shareNat",
   "def:polyId",
   "def:mult0ClassId",
   "def:mult1ClassId",
   "def:multOmegaClassId",
   "def:linearExactOnceId",
   "def:linearAxiomInventoryOk",
   "def:linearAxiomsRemainId",
   "def:affineNotFirstClassId",
   "axiom:Token",
   "axiom:mkToken",
   "axiom:consume"]

/-- Required LinearTheorems key decls (A56 deepen Mult..Types band).
    Greppable: linearTheoremsRequiredDecls, Check depth deepen. -/
def linearTheoremsRequiredDecls : List String :=
  ["theorem:shareNat_eq",
   "theorem:shareNat_zero",
   "theorem:shareNat_succ",
   "theorem:polyId_id",
   "theorem:mult0ClassId_eq",
   "theorem:mult1ClassId_eq",
   "theorem:multOmegaClassId_eq",
   "theorem:linearAxiomInventoryOk_true",
   "theorem:shareNat_reuse",
   "theorem:linearExactOnceId_eq",
   "theorem:linearAxiomsRemainId_eq",
   "theorem:affineNotFirstClassId_eq"]

/-- Required Types key decls (A56 deepen: structure TypeTag/IrNode + kind table).
    Greppable: typesRequiredDecls, Check depth deepen, FOUNDATION-KIND-SURFACE. -/
def typesRequiredDecls : List String :=
  ["inductive:NodeKind",
   "structure:TypeTag",
   "structure:IrNode",
   "def:typeTagInit",
   "def:kindMultOk",
   "def:ofKindTag?",
   "def:isValidKindTag",
   "def:mkNode?",
   "def:NodeKind.name",
   "def:NodeKind.expectedMult",
   "def:IrNode.isWellTyped",
   "def:mkNodeFromTags?"]

/-- Required TypesTheorems key decls (A56 deepen Mult..Types band).
    Greppable: typesTheoremsRequiredDecls, Check depth deepen. -/
def typesTheoremsRequiredDecls : List String :=
  ["theorem:ofKindTag?_zero",
   "theorem:ofKindTag?_one",
   "theorem:ofKindTag?_two",
   "theorem:ofKindTag?_fail_closed",
   "theorem:isValidKindTag_zero",
   "theorem:isValidKindTag_one",
   "theorem:isValidKindTag_two",
   "theorem:isValidKindTag_fail_closed",
   "theorem:kindMultOk_value_omega",
   "theorem:kindMultOk_linear_one",
   "theorem:kindMultOk_erased_zero",
   "theorem:expectedMult_value",
   "theorem:expectedMult_linear",
   "theorem:expectedMult_erased"]

/-- Required IrProgram key decls (A57 Check depth deepen continue: structure
    Program + ordered-program surface on FOUNDATION-KIND-SURFACE).
    Greppable: irProgramRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def irProgramRequiredDecls : List String :=
  ["structure:Program",
   "inductive:PushResult",
   "def:programCap",
   "def:empty",
   "def:length",
   "def:isEmpty",
   "def:push",
   "def:isWellTyped",
   "def:foldWellTyped",
   "def:checkFailClosed"]

/-- Required IrProgramTheorems key decls (A57 deepen continue corpus expand).
    Greppable: irProgramTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def irProgramTheoremsRequiredDecls : List String :=
  ["theorem:empty_isEmpty",
   "theorem:empty_length_zero",
   "theorem:programCap_eq_eight",
   "theorem:isWellTyped_empty_false",
   "theorem:empty_not_well_typed",
   "theorem:checkFailClosed_eq_isWellTyped",
   "theorem:foldWellTyped_empty_none",
   "theorem:push_bad_node",
   "theorem:push_value_one_ok",
   "theorem:length_single_value",
   "theorem:isWellTyped_single_value",
   "theorem:foldWellTyped_single_value_some"]

/-- Required IrGraph key decls (A57 deepen continue: structure Edge/Graph +
    edge surface). Greppable: irGraphRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def irGraphRequiredDecls : List String :=
  ["structure:Edge",
   "structure:Graph",
   "def:edgeMax",
   "def:empty",
   "def:edgeCount",
   "def:nodeCount",
   "def:pushNode",
   "def:addEdge",
   "def:edgesSound",
   "def:isWellTyped",
   "def:checkFailClosed",
   "def:isEmpty"]

/-- Required IrGraphTheorems key decls (A57 deepen continue corpus expand).
    Greppable: irGraphTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def irGraphTheoremsRequiredDecls : List String :=
  ["theorem:isWellTyped_empty_true",
   "theorem:empty_well_typed",
   "theorem:empty_isEmpty",
   "theorem:edgeMax_eq_sixteen",
   "theorem:checkFailClosed_eq_isWellTyped",
   "theorem:edgesSound_empty",
   "theorem:pushNode_value_one_ok",
   "theorem:addEdge_empty_badEndpoints",
   "theorem:isWellTyped_one_node_empty_edges",
   "theorem:addEdge_one_node_self_ok",
   "theorem:edgesSound_one_edge",
   "theorem:isWellTyped_two_nodes_one_edge"]

/-- Required HostCompose key decls (A57 deepen continue: structure LinearHost/Host
    + mult pre-scan / extract surface). Greppable: hostComposeRequiredDecls,
    Check depth deepen continue, FOUNDATION-KIND-SURFACE. -/
def hostComposeRequiredDecls : List String :=
  ["structure:LinearHost",
   "structure:Host",
   "def:empty",
   "def:mint",
   "def:consume",
   "def:markErased",
   "def:pushHostNode",
   "def:addHostEdge",
   "def:multPreScan",
   "def:checkFailClosed",
   "def:extractOk",
   "def:extractOkFs"]

/-- Required HostComposeTheorems key decls (A57 deepen continue corpus expand).
    Greppable: hostComposeTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostComposeTheoremsRequiredDecls : List String :=
  ["theorem:multPreScan_empty_true",
   "theorem:checkFailClosed_empty_true",
   "theorem:extractOkFs_empty_true",
   "theorem:mint_zero_badId",
   "theorem:consume_empty_notLive",
   "theorem:extractOkFs_eq",
   "theorem:checkFailClosed_eq",
   "theorem:mint_empty_one_ok",
   "theorem:consume_minted_one",
   "theorem:mint_already_live_one",
   "theorem:double_consume_notLive",
   "theorem:nodeMultOk_omega",
   "theorem:multPreScan_mult1_unminted_false",
   "theorem:extractOkFs_mult1_minted_true"]
/-- Required Erasure key decls (A58 deepen continue: structure Erased +
    mark/runtime-absent surface). Greppable: erasureRequiredDecls,
    Check depth deepen continue, FOUNDATION-KIND-SURFACE. -/
def erasureRequiredDecls : List String :=
  ["structure:Erased",
   "def:unmarked",
   "def:mark",
   "def:isRuntimeAbsent",
   "def:erasureIsRuntimeAbsent",
   "def:isErasureGrade",
   "def:markForGrade?",
   "def:checkFailClosed"]

/-- Required ErasureTheorems key decls (A58 deepen continue corpus expand).
    Greppable: erasureTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def erasureTheoremsRequiredDecls : List String :=
  ["theorem:isRuntimeAbsent_unmarked_false",
   "theorem:isRuntimeAbsent_mark_true",
   "theorem:isErasureGrade_mult0",
   "theorem:isErasureGrade_mult1_false",
   "theorem:markForGrade?_mult0_some",
   "theorem:markForGrade?_mult1_none",
   "theorem:checkFailClosed_unmarked_false",
   "theorem:checkFailClosed_eq",
   "theorem:isRuntimeAbsent_eq_marked",
   "theorem:erasureIsRuntimeAbsent_eq",
   "theorem:mark_idempotent",
   "theorem:isErasureGrade_omega_false",
   "theorem:markForGrade?_omega_none",
   "theorem:checkFailClosed_marked_mult0_true"]

/-- Required Extract key decls (A58 deepen continue: inductive RuntimeClaim +
    name/tag/extract surface). Greppable: extractRequiredDecls,
    Check depth deepen continue, FOUNDATION-KIND-SURFACE. -/
def extractRequiredDecls : List String :=
  ["inductive:RuntimeClaim",
   "def:RuntimeClaim.name",
   "def:isFreestandingGoal",
   "def:ofRuntimeTag?",
   "def:isValidRuntimeTag",
   "def:checkFailClosed",
   "def:extractOk",
   "def:extractOkFromTags?"]

/-- Required ExtractTheorems key decls (A58 deepen continue corpus expand).
    Greppable: extractTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def extractTheoremsRequiredDecls : List String :=
  ["theorem:isFreestandingGoal_runtimeFs",
   "theorem:isFreestandingGoal_classic_false",
   "theorem:extractOk_classic_reject",
   "theorem:extractOk_mult0_unmarked_false",
   "theorem:ofRuntimeTag?_zero",
   "theorem:ofRuntimeTag?_fail_closed",
   "theorem:isValidRuntimeTag_zero",
   "theorem:isValidRuntimeTag_fail_closed",
   "theorem:isFreestandingGoal_edge_false",
   "theorem:extractOk_edge_reject",
   "theorem:extractOk_mult1_fs_false",
   "theorem:extractOk_mult0_marked_fs_true",
   "theorem:ofRuntimeTag?_one",
   "theorem:extractOk_eq_checkFailClosed"]

/-- Required CompilePath key decls (library seed expand continue).
    Greppable: compilePathRequiredDecls, Host library seed expand continue. -/
def compilePathRequiredDecls : List String :=
  ["def:stageId",
   "def:hostCompilePathId",
   "def:gradeSurfaceOk",
   "def:checkHost",
   "def:extractFsOk",
   "def:compileReady"]

/-- Required KernelMult key decls (Kind-surface band expand: readiness/path
    surface + lower kernel under FOUNDATION-KIND-SURFACE; no local structure).
    Greppable: kernelMultRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def kernelMultRequiredDecls : List String :=
  ["def:stageId",
   "def:kernelMultId",
   "def:mkGradeNode",
   "def:lowerMultKernel",
   "def:multKernelReady",
   "def:kernelOk",
   "def:unknownTagRejected",
   "def:multKernelProgram",
   "def:kernelSurfaceOk",
   "def:acceptancePath"]

/-- Required KernelLinear key decls (Kind-surface band expand).
    Greppable: kernelLinearRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def kernelLinearRequiredDecls : List String :=
  ["def:stageId",
   "def:kernelLinearId",
   "def:mkLinearNode",
   "def:lowerLinearKernel",
   "def:linearKernelReady",
   "def:linearKernelOk",
   "def:hostKernelLinearId",
   "def:linearHostPathReady",
   "def:linearMismatchRejected",
   "def:linearSurfaceOk"]

/-- Required KernelTypes key decls (Kind-surface band expand).
    Greppable: kernelTypesRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def kernelTypesRequiredDecls : List String :=
  ["def:stageId",
   "def:kernelTypesId",
   "def:mkTypedNode",
   "def:lowerTypesKernel",
   "def:typesKernelReady",
   "def:typesKernelOk",
   "def:hostKernelTypesId",
   "def:typesProgramPathReady",
   "def:unknownKindRejected",
   "def:typesSurfaceOk"]

/-- Required KernelProgram key decls (Kind-surface band expand).
    Greppable: kernelProgramRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def kernelProgramRequiredDecls : List String :=
  ["def:stageId",
   "def:kernelProgramId",
   "def:mkProgramNode",
   "def:lowerProgramKernel",
   "def:programKernelReady",
   "def:programKernelOk",
   "def:hostKernelProgramId",
   "def:programPathReady",
   "def:programGraphPathReady",
   "def:programComposePathReady"]

/-- Required KernelMultTheorems key decls (Kind-surface band expand corpus).
    Greppable: kernelMultTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def kernelMultTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:kernelMultId_eq",
   "theorem:multKernelReady_true",
   "theorem:kernelOk_true",
   "theorem:lowerMultKernel_isSome",
   "theorem:unknownTagRejected_true",
   "theorem:multKernelProgram_length_three",
   "theorem:multKernelProgram_isWellTyped",
   "theorem:programCompileReady_empty_false",
   "theorem:lowerMultKernel_length_three",
   "theorem:lowerMultKernel_isWellTyped"]

/-- Required KernelLinearTheorems key decls (Kind-surface band expand corpus).
    Greppable: kernelLinearTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def kernelLinearTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:kernelLinearId_eq",
   "theorem:linearKernelReady_true",
   "theorem:linearKernelOk_true",
   "theorem:lowerLinearKernel_isSome",
   "theorem:linearMismatchRejected_true",
   "theorem:linearKernelProgram_length_one",
   "theorem:linearKernelProgram_isWellTyped",
   "theorem:hostKernelLinearId_eq",
   "theorem:linearHostPathReady_true",
   "theorem:programCompileReady_empty_false",
   "theorem:lowerLinearKernel_length_one"]

/-- Required KernelTypesTheorems key decls (Kind-surface band expand corpus).
    Greppable: kernelTypesTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def kernelTypesTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:kernelTypesId_eq",
   "theorem:typesKernelReady_true",
   "theorem:typesKernelOk_true",
   "theorem:lowerTypesKernel_isSome",
   "theorem:unknownKindRejected_true",
   "theorem:typesKernelProgram_length_three",
   "theorem:typesKernelProgram_isWellTyped",
   "theorem:hostKernelTypesId_eq",
   "theorem:typesProgramPathReady_true",
   "theorem:kindMultMismatchRejected_true",
   "theorem:lowerTypesKernel_length_three"]

/-- Required KernelProgramTheorems key decls (Kind-surface band expand corpus).
    Greppable: kernelProgramTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def kernelProgramTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:kernelProgramId_eq",
   "theorem:programKernelReady_true",
   "theorem:programKernelOk_true",
   "theorem:lowerProgramKernel_isSome",
   "theorem:programPathReady_true",
   "theorem:programKernelProgram_length_three",
   "theorem:programKernelProgram_isWellTyped",
   "theorem:hostKernelProgramId_eq",
   "theorem:programGraphPathReady_true",
   "theorem:programComposePathReady_true",
   "theorem:lowerProgramKernel_length_three"]

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

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveRequiredDecls
