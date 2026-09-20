/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckFixtures.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveFixturesSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-FIXTURES, liveFixturesSource,
  HOST-FRONT-LIVE-FIXTURES, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveFixturesSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveFixtures

/-- Dual-pinned live HostModuleCheckFixtures.lean bytes (must match on-disk file).
    Greppable: liveFixturesSource, PARSE-LIVE-FIXTURES. -/
def liveFixturesSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck dual-pin fixture corpus + bad texts.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split: required key-decl lists live in HostModuleCheckRequiredDecls
  (+ Product / Later companions); good fixture texts live in
  HostModuleCheckFixtureTexts (+ Product / Later / SelfHost / Emit companions). This tip keeps
  hostModuleCheckTheoremCorpusOk dual-pin and fail-closed bad fixture texts.
  Same namespace SystemsLean.HostModuleCheck.

  Spec (readable):
  - hostModuleCheckTheoremCorpusOk exact required-decl list dual-pin.
  - Fail-closed Mult-shaped bad fixture texts (missing inductive / namespace /
    empty / missing theorem / missing axiom / structure / program / erased).

  Intentional non-claims:
  - PARTIAL-STRUCTURAL fixture soup only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckFixtures,
  hostModuleCheckTheoremCorpusOk, hostModuleCheckBadMissingInductiveText,
  hostModuleCheckBadMissingAxiomText, hostModuleCheckBadMissingStructureText,
  hostModuleCheckBadMissingProgramStructureText,
  hostModuleCheckBadMissingErasedStructureText,
  hostModuleCheckBadMissingKernelReadyText,
  hostModuleCheckBadMissingPlanStructureText,
  hostModuleCheckBadMissingParityReadyText,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, Check depth deepen continue,
  Host library seed expand continue, Host real module seed expand,
  Host theorem check expand,
  Host compose module expand, Host graph module expand, Host program module expand,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostModuleCheckFixtures
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheck.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckRequiredDecls
import SystemsLean.HostModuleCheckRequiredDeclsProduct
import SystemsLean.HostModuleCheckRequiredDeclsLater
import SystemsLean.HostModuleCheckFixtureTexts
import SystemsLean.HostModuleCheckFixtureTextsProduct
import SystemsLean.HostModuleCheckFixtureTextsLater
import SystemsLean.HostModuleCheckFixtureTextsSelfHost
import SystemsLean.HostModuleCheckFixtureTextsEmit

namespace SystemsLean.HostModuleCheck

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
        "theorem:isValidTag_fail_closed",
        "theorem:isValid_true",
        "theorem:multIsValid_eq_isValid",
        "theorem:name_mult0",
        "theorem:name_mult1",
        "theorem:name_multOmega",
        "theorem:isValidTag_eq_ofNat?_isSome"])
    && (linearTheoremsRequiredDecls
      == ["theorem:shareNat_eq",
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
          "theorem:affineNotFirstClassId_eq"])
    && (typesTheoremsRequiredDecls
      == ["theorem:ofKindTag?_zero",
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
          "theorem:expectedMult_erased"])
    && (irProgramTheoremsRequiredDecls
      == ["theorem:empty_isEmpty",
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
          "theorem:foldWellTyped_single_value_some"])
    && (irGraphTheoremsRequiredDecls
      == ["theorem:isWellTyped_empty_true",
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
          "theorem:isWellTyped_two_nodes_one_edge"])
    && (hostComposeTheoremsRequiredDecls
      == ["theorem:multPreScan_empty_true",
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
          "theorem:extractOkFs_mult1_minted_true"])    && (erasureTheoremsRequiredDecls
      == ["theorem:isRuntimeAbsent_unmarked_false",
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
          "theorem:checkFailClosed_marked_mult0_true"])
    && (extractTheoremsRequiredDecls
      == ["theorem:isFreestandingGoal_runtimeFs",
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
          "theorem:extractOk_eq_checkFailClosed"])
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
          "def:linearAxiomInventoryOk",
          "def:linearAxiomsRemainId",
          "def:affineNotFirstClassId",
          "axiom:Token",
          "axiom:mkToken",
          "axiom:consume"])
    && (typesRequiredDecls
      == ["inductive:NodeKind",
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
          "def:mkNodeFromTags?"])
    && (irProgramRequiredDecls
      == ["structure:Program",
          "inductive:PushResult",
          "def:programCap",
          "def:empty",
          "def:length",
          "def:isEmpty",
          "def:push",
          "def:isWellTyped",
          "def:foldWellTyped",
          "def:checkFailClosed"])
    && (irGraphRequiredDecls
      == ["structure:Edge",
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
          "def:isEmpty"])
    && (hostComposeRequiredDecls
      == ["structure:LinearHost",
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
          "def:extractOkFs"])    && (erasureRequiredDecls
      == ["structure:Erased",
          "def:unmarked",
          "def:mark",
          "def:isRuntimeAbsent",
          "def:erasureIsRuntimeAbsent",
          "def:isErasureGrade",
          "def:markForGrade?",
          "def:checkFailClosed"])
    && (extractRequiredDecls
      == ["inductive:RuntimeClaim",
          "def:RuntimeClaim.name",
          "def:isFreestandingGoal",
          "def:ofRuntimeTag?",
          "def:isValidRuntimeTag",
          "def:checkFailClosed",
          "def:extractOk",
          "def:extractOkFromTags?"])
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
          "def:kernelOk",
          "def:unknownTagRejected",
          "def:multKernelProgram",
          "def:kernelSurfaceOk",
          "def:acceptancePath"])
    && (kernelLinearRequiredDecls
      == ["def:stageId",
          "def:kernelLinearId",
          "def:mkLinearNode",
          "def:lowerLinearKernel",
          "def:linearKernelReady",
          "def:linearKernelOk",
          "def:hostKernelLinearId",
          "def:linearHostPathReady",
          "def:linearMismatchRejected",
          "def:linearSurfaceOk"])
    && (kernelTypesRequiredDecls
      == ["def:stageId",
          "def:kernelTypesId",
          "def:mkTypedNode",
          "def:lowerTypesKernel",
          "def:typesKernelReady",
          "def:typesKernelOk",
          "def:hostKernelTypesId",
          "def:typesProgramPathReady",
          "def:unknownKindRejected",
          "def:typesSurfaceOk"])
    && (kernelProgramRequiredDecls
      == ["def:stageId",
          "def:kernelProgramId",
          "def:mkProgramNode",
          "def:lowerProgramKernel",
          "def:programKernelReady",
          "def:programKernelOk",
          "def:hostKernelProgramId",
          "def:programPathReady",
          "def:programGraphPathReady",
          "def:programComposePathReady"])
    && (kernelMultTheoremsRequiredDecls
      == ["theorem:stageId_eq",
          "theorem:kernelMultId_eq",
          "theorem:multKernelReady_true",
          "theorem:kernelOk_true",
          "theorem:lowerMultKernel_isSome",
          "theorem:unknownTagRejected_true",
          "theorem:multKernelProgram_length_three",
          "theorem:multKernelProgram_isWellTyped",
          "theorem:programCompileReady_empty_false",
          "theorem:lowerMultKernel_length_three",
          "theorem:lowerMultKernel_isWellTyped"])
    && (kernelLinearTheoremsRequiredDecls
      == ["theorem:stageId_eq",
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
          "theorem:lowerLinearKernel_length_one"])
    && (kernelTypesTheoremsRequiredDecls
      == ["theorem:stageId_eq",
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
          "theorem:lowerTypesKernel_length_three"])
    && (kernelProgramTheoremsRequiredDecls
      == ["theorem:stageId_eq",
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
          "theorem:lowerProgramKernel_length_three"])
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
  "theorem isValid_true (m : Mult) : isValid m = true := by sorry\n" ++
  "theorem multIsValid_eq_isValid (m : Mult) : multIsValid m = isValid m := rfl\n" ++
  "theorem name_mult0 : name Mult.mult0 = \"MULT-0\" := rfl\n" ++
  "theorem name_mult1 : name Mult.mult1 = \"MULT-1\" := rfl\n" ++
  "theorem name_multOmega : name Mult.multOmega = \"MULT-OMEGA\" := rfl\n" ++
  "theorem isValidTag_eq_ofNat?_isSome (n : Nat) : True := trivial\n" ++
  "end SystemsLean.Mult\n"

/-- Bad: Linear missing axiom Token family (A56 FOUNDATION-KIND-SURFACE reject).
    Greppable: hostModuleCheckBadMissingAxiomText, Check depth deepen. -/
def hostModuleCheckBadMissingAxiomText : String :=
  "namespace SystemsLean.Linear\n" ++
  "def shareNat (n : Nat) : Nat := n + n\n" ++
  "def polyId {a : Type} (x : a) : a := x\n" ++
  "def mult0ClassId : String := \"MULT-0\"\n" ++
  "def mult1ClassId : String := \"MULT-1\"\n" ++
  "def multOmegaClassId : String := \"MULT-OMEGA\"\n" ++
  "def linearExactOnceId : String := \"LINEAR-EXACT-ONCE\"\n" ++
  "def linearAxiomsRemainId : String := \"LINEAR-AXIOMS-REMAIN\"\n" ++
  "def affineNotFirstClassId : String := \"AFFINE-NOT-FIRST-CLASS\"\n" ++
  "def linearAxiomInventoryOk : Bool := true\n" ++
  "end SystemsLean.Linear\n"

/-- Bad: Types missing structure TypeTag/IrNode (A56 FOUNDATION-KIND-SURFACE reject).
    Greppable: hostModuleCheckBadMissingStructureText, Check depth deepen. -/
def hostModuleCheckBadMissingStructureText : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.Types\n" ++
  "inductive NodeKind where\n" ++
  "  | value\n" ++
  "def typeTagInit (tag : Nat) : Nat := tag\n" ++
  "def NodeKind.name (k : NodeKind) : String := \"VALUE\"\n" ++
  "def NodeKind.expectedMult (k : NodeKind) : Nat := 0\n" ++
  "def kindMultOk (k : NodeKind) (m : Nat) : Bool := true\n" ++
  "def ofKindTag? : Nat -> Option NodeKind\n" ++
  "  | 0 => some NodeKind.value\n" ++
  "  | _ => none\n" ++
  "def isValidKindTag (n : Nat) : Bool := (ofKindTag? n).isSome\n" ++
  "def IrNode.isWellTyped (n : Nat) : Bool := true\n" ++
  "def mkNode? (tag : Nat) : Option Nat := some tag\n" ++
  "def mkNodeFromTags? (a b c : Nat) : Option Nat := none\n" ++
  "end SystemsLean.Types\n"

/-- Bad: IrProgram missing structure Program (A57 FOUNDATION-KIND-SURFACE
    IrProgram..HostCompose reject). Greppable:
    hostModuleCheckBadMissingProgramStructureText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckBadMissingProgramStructureText : String :=
  "import SystemsLean.Types\n" ++
  "namespace SystemsLean.IrProgram\n" ++
  "inductive PushResult where\n" ++
  "  | ok\n" ++
  "def programCap : Nat := 8\n" ++
  "def empty : Nat := 0\n" ++
  "def length (p : Nat) : Nat := 0\n" ++
  "def isEmpty (p : Nat) : Bool := true\n" ++
  "def push (p : Nat) (n : Nat) : PushResult := PushResult.ok\n" ++
  "def isWellTyped (p : Nat) : Bool := false\n" ++
  "def foldWellTyped (p : Nat) : Nat := 0\n" ++
  "def checkFailClosed (p : Nat) : Bool := isWellTyped p\n" ++
  "end SystemsLean.IrProgram\n"

/-- Bad: Erasure missing structure Erased (A58 FOUNDATION-KIND-SURFACE
    Erasure..Extract reject). Greppable:
    hostModuleCheckBadMissingErasedStructureText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckBadMissingErasedStructureText : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.Erasure\n" ++
  "def unmarked : Nat := 0\n" ++
  "def mark (e : Nat) : Nat := 1\n" ++
  "def isRuntimeAbsent (e : Nat) : Bool := true\n" ++
  "def erasureIsRuntimeAbsent (e : Nat) : Bool := isRuntimeAbsent e\n" ++
  "def isErasureGrade (m : Nat) : Bool := true\n" ++
  "def markForGrade? (m : Nat) (e : Nat) : Option Nat := some e\n" ++
  "def checkFailClosed (m : Nat) (e : Nat) : Bool := true\n" ++
  "end SystemsLean.Erasure\n"

/-- Bad: KernelMult missing lowerMultKernel / readiness surface (Kind-surface
    band expand Kernel Mult..KernelEmit reject). Greppable:
    hostModuleCheckBadMissingKernelReadyText, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def hostModuleCheckBadMissingKernelReadyText : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.KernelMult\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_MULT_V0\"\n" ++
  "def kernelMultId : String := \"SELF-HOST-KERNEL-MULT\"\n" ++
  "def mkGradeNode (tag : Nat) : Option Nat := some tag\n" ++
  "def multKernelReady : Bool := true\n" ++
  "def kernelOk : Bool := true\n" ++
  "def unknownTagRejected : Bool := true\n" ++
  "def multKernelProgram : Nat := 0\n" ++
  "def kernelSurfaceOk : Bool := true\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "end SystemsLean.KernelMult\n"

/-- Bad: EmitPlan missing structure Plan (Kind-surface second band reject).
    Greppable: hostModuleCheckBadMissingPlanStructureText,
    Check depth deepen continue, FOUNDATION-KIND-SURFACE,
    Kind-surface second band. -/
def hostModuleCheckBadMissingPlanStructureText : String :=
  "import SystemsLean.Mult\n" ++
  "import SystemsLean.Types\n" ++
  "import SystemsLean.HostCompose\n" ++
  "import SystemsLean.EmitPlanScaffold\n" ++
  "namespace SystemsLean.EmitPlan\n" ++
  "def Plan.failClosed : Nat := 0\n" ++
  "def planFromCompose (hc : Nat) : Nat := 0\n" ++
  "def fromCompose (hc : Nat) : Nat := planFromCompose hc\n" ++
  "def isReady (p : Nat) : Bool := true\n" ++
  "def planOk (hc : Nat) : Bool := true\n" ++
  "def isRuntimeMult (m : Nat) : Bool := true\n" ++
  "def countRuntimeNodes (nodes : Nat) : Nat := 0\n" ++
  "def countErasedNodes (nodes : Nat) : Nat := 0\n" ++
  "end SystemsLean.EmitPlan\n"

/-- Bad: ParityMult missing multParityReady (Kind-surface third band reject).
    Greppable: hostModuleCheckBadMissingParityReadyText,
    Check depth deepen continue, FOUNDATION-KIND-SURFACE,
    Kind-surface third band. -/
def hostModuleCheckBadMissingParityReadyText : String :=
  "import SystemsLean.Mult\n" ++
  "import SystemsLean.KernelMult\n" ++
  "import SystemsLean.EmitMult\n" ++
  "namespace SystemsLean.ParityMult\n" ++
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_MULT_V0\"\n" ++
  "def hostParityMultId : String := \"HOST-PARITY-MULT\"\n" ++
  "def selfHostParityMultId : String := \"SELF-HOST-PARITY-MULT\"\n" ++
  "def multParityOk : Bool := true\n" ++
  "def gradeParityOk : Bool := true\n" ++
  "def paritySurfaceOk : Bool := true\n" ++
  "def ofNatRoundTripOk : Bool := true\n" ++
  "def nameParityOk : Bool := true\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/ParityMult.lean\"\n" ++
  "def productProbePath : String := \"src/systems/smoke/slake_behavioral_probe.c\"\n" ++
  "end SystemsLean.ParityMult\n"

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveFixtures
