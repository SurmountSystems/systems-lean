/-
  SYSTEMS_LEAN_HOST partial -- LLVM Mult CFG + dominance fixture join.
  Long-file split: honesty pins (LlvmCfgHonesty), Mult production
  (LlvmCfgMultProduction), Mult DF (LlvmCfgMultDf), unit Linear..Graph
  production (LlvmCfgUnitProduction), general compose CFG (LlvmCfgGeneral).
  This module: band ok + surface ready + package + theorems + smoke.
  Production CFG deepen dual-pins Mult..Graph unit diamonds + Mult DF partial
  + general multi-unit compose posture. Option A-light: fixture tip fullBackend
  true with progressive bar evidence. Not production opt. Not full DF pipeline
  (DominanceClaimed false). Not Rust-native product under src/.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LLVM-CFG-FIXTURE, SLAKE_LLVM_CFG_FIXTURE,
  SLAKE_LLVM_CFG_FIXTURE_V0, llvmCfgFixtureReady, llvmCfgFixtureFinishedClaimed,
  llvmCfgFixturePackageOk, llvmCfgFixturePartialClaimed,
  llvmCfgFixtureFullBackendClaimed, llvmCfgFixtureProductionOptClaimed,
  llvmCfgFixtureDominanceClaimed, dominancePipelineRequiredForFullBackend,
  MULT-CFG-FIXTURE, ORDERED-IR-PROGRAM,
  SSA-SHAPED, dominance, mergePredsOnlyAcceptReject, acceptRejectReachableFromEntry,
  cfgDeepenPartial, CFG-DEEPEN-PARTIAL, CFG-MERGE-PREDS, productionCfgDeepen,
  PRODUCTION-CFG-DEEPEN, multSsaCfgBlocks, multSsaCfgEdges, productionIdomTable,
  PRODUCTION-IDOM, mergeIdomIsEntry, MERGE-IDOM-ENTRY, mergePhiPredsFour,
  MERGE-PHI-PREDS-FOUR, multSsaCfgDualPin, MULT-SSA-CFG-DUAL-PIN,
  multDfTable, MULT-DF-TABLE, multDfMergeIsJoin, MULT-DF-MERGE-JOIN,
  multDfTableDualPin, MULT-DF-TABLE-DUAL-PIN, multDominanceFrontierPartial,
  MULT-DOMINANCE-FRONTIER-PARTIAL, mult-dominance-frontier-partial,
  multDominanceFrontierDeepen, MULT-DOMINANCE-FRONTIER-DEEPEN,
  mult-dominance-frontier-deepen, multDfComputed, MULT-DF-COMPUTED,
  multDfAlgorithmOk, MULT-DF-ALGORITHM-OK, multDfCytronFromJoin, MULT-DF-CYTRON,
  linearDominanceFrontierDeepen, LINEAR-DOMINANCE-FRONTIER-DEEPEN,
  typesDominanceFrontierDeepen, TYPES-DOMINANCE-FRONTIER-DEEPEN,
  programDominanceFrontierDeepen, PROGRAM-DOMINANCE-FRONTIER-DEEPEN,
  graphDominanceFrontierDeepen, GRAPH-DOMINANCE-FRONTIER-DEEPEN,
  multiUnitDominanceFrontierDeepen, MULTI-UNIT-DOMINANCE-FRONTIER-DEEPEN,
  multi-unit-dominance-frontier-deepen, LlvmCfgUnitDf,
  linearSsaCfgBlocks, linearSsaCfgEdges, linearProductionIdomTable,
  LINEAR-PRODUCTION-IDOM, linearMergeIdomIsEntry, LINEAR-MERGE-IDOM-ENTRY,
  linearMergePhiPredsTwo, LINEAR-MERGE-PHI-PREDS-TWO, linearSsaCfgDualPin,
  LINEAR-SSA-CFG-DUAL-PIN, linearCfgProductionDeepen, LINEAR-CFG-PRODUCTION-DEEPEN,
  multiUnitCfgProductionDeepen, MULTI-UNIT-CFG-PRODUCTION-DEEPEN,
  typesSsaCfgBlocks, typesSsaCfgEdges, typesProductionIdomTable,
  TYPES-PRODUCTION-IDOM, typesMergeIdomIsEntry, TYPES-MERGE-IDOM-ENTRY,
  typesMergePhiPredsFour, TYPES-MERGE-PHI-PREDS-FOUR, typesSsaCfgDualPin,
  TYPES-SSA-CFG-DUAL-PIN, typesCfgProductionDeepen, TYPES-CFG-PRODUCTION-DEEPEN,
  multiUnitCfgProductionDeepenTypes, MULTI-UNIT-CFG-PRODUCTION-DEEPEN-TYPES,
  programSsaCfgBlocks, programSsaCfgEdges, programProductionIdomTable,
  PROGRAM-PRODUCTION-IDOM, programMergeIdomIsEntry, PROGRAM-MERGE-IDOM-ENTRY,
  programMergePhiPredsFour, PROGRAM-MERGE-PHI-PREDS-FOUR, programSsaCfgDualPin,
  PROGRAM-SSA-CFG-DUAL-PIN, programCfgProductionDeepen, PROGRAM-CFG-PRODUCTION-DEEPEN,
  multiUnitCfgProductionDeepenProgram, MULTI-UNIT-CFG-PRODUCTION-DEEPEN-PROGRAM,
  graphSsaCfgBlocks, graphSsaCfgEdges, graphProductionIdomTable,
  GRAPH-PRODUCTION-IDOM, graphMergeIdomIsEntry, GRAPH-MERGE-IDOM-ENTRY,
  graphMergePhiPredsThree, GRAPH-MERGE-PHI-PREDS-THREE, graphSsaCfgDualPin,
  GRAPH-SSA-CFG-DUAL-PIN, graphCfgProductionDeepen, GRAPH-CFG-PRODUCTION-DEEPEN,
  multiUnitCfgProductionDeepenGraph, MULTI-UNIT-CFG-PRODUCTION-DEEPEN-GRAPH,
  generalCfgConstructionPartial, GENERAL-CFG-CONSTRUCTION-PARTIAL,
  general-program-cfg-partial, productionCfgUnitDiamondsOnlyClaimed,
  fullLlvmBarEvidencePartial, FULL-LLVM-BAR-EVIDENCE-PARTIAL,
  iterativeCfgConstructionPartial, ITERATIVE-CFG-CONSTRUCTION-PARTIAL,
  ITERATIVE-CFG, iterative-cfg-construction-partial,
  just production-cfg-deepen, just linear-cfg-production-deepen,
  just types-cfg-production-deepen, just program-cfg-production-deepen,
  just graph-cfg-production-deepen, just mult-dominance-frontier-partial,
  just mult-dominance-frontier-deepen,
  just multi-unit-dominance-frontier-deepen,
  just general-program-cfg-partial, just iterative-cfg-construction-partial,
  LlvmHold, llvmUnlocked, LlvmMultSsa, LlvmLinearSsa, LlvmTypesSsa,
  LlvmProgramSsa, LlvmGraphSsa, LlvmCfgHonesty, LlvmCfgMultProduction,
  LlvmCfgMultDf, LlvmCfgUnitDf, LlvmCfgUnitProduction, LlvmCfgGeneral,
  HOST-LLVM-CFG-FIXTURE-SMOKE, HOST-LLVM-CFG-FIXTURE-THEOREM.
  Module: SystemsLean.LlvmCfgFixture
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Short role name. Red/green: lake build SystemsLean.LlvmCfgFixture;
  just production-cfg-deepen; just linear-cfg-production-deepen;
  just types-cfg-production-deepen; just program-cfg-production-deepen;
  just graph-cfg-production-deepen; just mult-dominance-frontier-partial;
  just mult-dominance-frontier-deepen; just multi-unit-dominance-frontier-deepen;
  just general-program-cfg-partial; just iterative-cfg-construction-partial;
  just systems-llvm-ir.
  Module must stay ASCII. Not freestanding emit. Host elaborator residual remains.
-/

import SystemsLean.KernelMult
import SystemsLean.LlvmHold
import SystemsLean.LlvmMultSsa
import SystemsLean.LlvmLinearSsa
import SystemsLean.LlvmTypesSsa
import SystemsLean.LlvmProgramSsa
import SystemsLean.LlvmGraphSsa
import SystemsLean.LlvmCfgHonesty
import SystemsLean.LlvmCfgMultProduction
import SystemsLean.LlvmCfgMultDf
import SystemsLean.LlvmCfgUnitDf
import SystemsLean.LlvmCfgUnitProduction
import SystemsLean.LlvmCfgGeneral

namespace SystemsLean.LlvmCfgFixture

open SystemsLean.KernelMult (multKernelReady kernelOk lowerMultKernel)

/-- Mult kernel band still ready (fixture attaches to Mult SSA peer). -/
def multBandOk : Bool :=
  multKernelReady
    && kernelOk
    && lowerMultKernel.isSome
    && LlvmMultSsa.llvmMultSsaReady
    && !LlvmMultSsa.llvmMultSsaFullBackendClaimed
    && !LlvmMultSsa.llvmMultSsaCfgProductionClaimed

/-- Linear SSA peer ready for multi-unit CFG dual-pin. -/
def linearBandOk : Bool :=
  LlvmLinearSsa.llvmLinearSsaReady
    && LlvmLinearSsa.llvmLinearSsaPartialClaimed
    && !LlvmLinearSsa.llvmLinearSsaFullBackendClaimed
    && !LlvmLinearSsa.llvmLinearSsaCfgProductionClaimed

/-- Types SSA peer ready for multi-unit CFG dual-pin. -/
def typesBandOk : Bool :=
  LlvmTypesSsa.llvmTypesSsaReady
    && LlvmTypesSsa.llvmTypesSsaPartialClaimed
    && !LlvmTypesSsa.llvmTypesSsaFullBackendClaimed
    && !LlvmTypesSsa.llvmTypesSsaCfgProductionClaimed

/-- Program SSA peer ready for multi-unit CFG dual-pin. -/
def programBandOk : Bool :=
  LlvmProgramSsa.llvmProgramSsaReady
    && LlvmProgramSsa.llvmProgramSsaPartialClaimed
    && !LlvmProgramSsa.llvmProgramSsaFullBackendClaimed
    && !LlvmProgramSsa.llvmProgramSsaCfgProductionClaimed

/-- Graph SSA peer ready for multi-unit CFG dual-pin. -/
def graphBandOk : Bool :=
  LlvmGraphSsa.llvmGraphSsaReady
    && LlvmGraphSsa.llvmGraphSsaPartialClaimed
    && !LlvmGraphSsa.llvmGraphSsaFullBackendClaimed
    && !LlvmGraphSsa.llvmGraphSsaCfgProductionClaimed

/-- Surface canary. -/
def llvmCfgFixtureSurfaceOk : Bool :=
  (stageId == "SLAKE_LLVM_CFG_FIXTURE_V0")
    && (hostId == "HOST-LLVM-CFG-FIXTURE")
    && (surfaceId == "HOST-LLVM-CFG-FIXTURE")
    && (multCfgFixtureName == "MULT-CFG-FIXTURE")
    && (orderedIrProgramId == "ORDERED-IR-PROGRAM")
    && (ssaShapedId == "SSA-SHAPED")
    && (kernelMultId == "SELF-HOST-KERNEL-MULT")
    && (multGrade0Name == "MULT-0")
    && (multGrade1Name == "MULT-1")
    && (multGradeOmegaName == "MULT-OMEGA")
    && entryDominatesAll
    && mergePredsOnlyAcceptReject
    && acceptRejectReachableFromEntry
    && cfgDeepenPartial
    && mergeIdomIsEntry
    && mergePhiPredsFour
    && multSsaCfgDualPin
    && productionCfgDeepen
    && multDfMergeIsJoin
    && multDfTableDualPin
    && multDominanceFrontierPartial
    && multDfAlgorithmOk
    && multDominanceFrontierDeepen
    && linearMergeIdomIsEntry
    && linearMergePhiPredsTwo
    && linearSsaCfgDualPin
    && linearCfgProductionDeepen
    && linearDominanceFrontierPartial
    && linearDfAlgorithmOk
    && linearDominanceFrontierDeepen
    && multiUnitCfgProductionDeepen
    && typesMergeIdomIsEntry
    && typesMergePhiPredsFour
    && typesSsaCfgDualPin
    && typesCfgProductionDeepen
    && typesDominanceFrontierPartial
    && typesDfAlgorithmOk
    && typesDominanceFrontierDeepen
    && multiUnitCfgProductionDeepenTypes
    && programMergeIdomIsEntry
    && programMergePhiPredsFour
    && programSsaCfgDualPin
    && programCfgProductionDeepen
    && programDominanceFrontierPartial
    && programDfAlgorithmOk
    && programDominanceFrontierDeepen
    && multiUnitCfgProductionDeepenProgram
    && graphMergeIdomIsEntry
    && graphMergePhiPredsThree
    && graphSsaCfgDualPin
    && graphCfgProductionDeepen
    && graphDominanceFrontierPartial
    && graphDfAlgorithmOk
    && graphDominanceFrontierDeepen
    && multiUnitCfgProductionDeepenGraph
    && multiUnitDominanceFrontierDeepen
    && generalCfgConstructionPartial
    && iterativeCfgConstructionPartial
    && productionCfgUnitDiamondsOnlyHonesty
    && fullLlvmBarEvidencePartial
    && multBandOk
    && linearBandOk
    && typesBandOk
    && programBandOk
    && graphBandOk

/-- Package ok (structural fixture + Mult..Graph production CFG dual-pin +
    Mult DF partial + general compose CFG posture + iterative multi-node IR
    CFG walk + progressive bar evidence partial + fixture tip fullBackend true
    under Option A-light; no IO write in this residual).
    Requires llvmCfgFixtureFullBackendClaimed and fullLlvmBarEvidencePartial.
    Not production opt; not DominanceClaimed; not band SSA FullBackend synonym.
    Greppable: llvmCfgFixturePackageOk. -/
def llvmCfgFixturePackageOk : Bool :=
  llvmCfgFixtureSurfaceOk
    && llvmCfgFixturePartialClaimed
    && productionCfgDeepen
    && multDominanceFrontierPartial
    && multDominanceFrontierDeepen
    && linearDominanceFrontierDeepen
    && typesDominanceFrontierDeepen
    && programDominanceFrontierDeepen
    && graphDominanceFrontierDeepen
    && multiUnitDominanceFrontierDeepen
    && multiUnitCfgProductionDeepen
    && multiUnitCfgProductionDeepenTypes
    && multiUnitCfgProductionDeepenProgram
    && multiUnitCfgProductionDeepenGraph
    && generalCfgConstructionPartial
    && iterativeCfgConstructionPartial
    && fullLlvmBarEvidencePartial
    && !productionCfgUnitDiamondsOnlyClaimed
    && (dominancePipelineRequiredForFullBackend == false)
    && llvmCfgFixtureFullBackendClaimed
    && !llvmCfgFixtureProductionOptClaimed
    && !llvmCfgFixtureDominanceClaimed

/-- Structural ready.
    Greppable: llvmCfgFixtureReady. -/
def llvmCfgFixtureReady : Bool :=
  llvmCfgFixtureFinishedClaimed
    && llvmCfgFixturePackageOk
    && llvmCfgFixtureKeepsLlvmLocked
    && llvmCfgFixtureDoesNotUnlockLlvm
    && llvmCfgFixtureLocalUnlockFalse
    && !llvmCfgFixtureLlvmUnlocked
    && !llvmCfgFixtureResidualFreeClaimed
    && !llvmCfgFixtureRustNativeLinkClaimed
    && !llvmCfgFixtureLlvmAsClaimed
    && LlvmHold.llvmHoldReady
    && LlvmMultSsa.llvmMultSsaReady
    && LlvmLinearSsa.llvmLinearSsaReady
    && LlvmTypesSsa.llvmTypesSsaReady
    && LlvmProgramSsa.llvmProgramSsaReady
    && LlvmGraphSsa.llvmGraphSsaReady

/-! ### HOST-LLVM-CFG-FIXTURE-THEOREM -/

theorem llvmCfgFixtureFinishedClaimed_true :
    llvmCfgFixtureFinishedClaimed = true :=
  rfl

theorem llvmCfgFixtureLlvmUnlocked_false :
    llvmCfgFixtureLlvmUnlocked = false :=
  rfl

theorem llvmCfgFixturePartialClaimed_true :
    llvmCfgFixturePartialClaimed = true :=
  rfl

theorem llvmCfgFixtureFullBackendClaimed_true :
    llvmCfgFixtureFullBackendClaimed = true :=
  rfl

theorem llvmCfgFixtureProductionOptClaimed_false :
    llvmCfgFixtureProductionOptClaimed = false :=
  rfl

theorem llvmCfgFixtureDominanceClaimed_false :
    llvmCfgFixtureDominanceClaimed = false :=
  rfl

theorem dominancePipelineRequiredForFullBackend_false :
    dominancePipelineRequiredForFullBackend = false :=
  rfl

theorem mergePredsOnlyAcceptReject_true :
    mergePredsOnlyAcceptReject = true := by
  native_decide

theorem acceptRejectReachableFromEntry_true :
    acceptRejectReachableFromEntry = true := by
  native_decide

theorem cfgDeepenPartial_true :
    cfgDeepenPartial = true := by
  native_decide

theorem mergeIdomIsEntry_true :
    mergeIdomIsEntry = true := by
  native_decide

theorem mergePhiPredsFour_true :
    mergePhiPredsFour = true := by
  native_decide

theorem multSsaCfgDualPin_true :
    multSsaCfgDualPin = true := by
  native_decide

theorem productionCfgDeepen_true :
    productionCfgDeepen = true := by
  native_decide

theorem multDfMergeIsJoin_true :
    multDfMergeIsJoin = true := by
  native_decide

theorem multDfTableDualPin_true :
    multDfTableDualPin = true := by
  native_decide

theorem multDominanceFrontierPartial_true :
    multDominanceFrontierPartial = true := by
  native_decide

theorem multDfAlgorithmOk_true :
    multDfAlgorithmOk = true := by
  native_decide

theorem multDominanceFrontierDeepen_true :
    multDominanceFrontierDeepen = true := by
  native_decide

theorem linearDominanceFrontierPartial_true :
    linearDominanceFrontierPartial = true := by
  native_decide

theorem linearDfAlgorithmOk_true :
    linearDfAlgorithmOk = true := by
  native_decide

theorem linearDominanceFrontierDeepen_true :
    linearDominanceFrontierDeepen = true := by
  native_decide

theorem typesDominanceFrontierPartial_true :
    typesDominanceFrontierPartial = true := by
  native_decide

theorem typesDfAlgorithmOk_true :
    typesDfAlgorithmOk = true := by
  native_decide

theorem typesDominanceFrontierDeepen_true :
    typesDominanceFrontierDeepen = true := by
  native_decide

theorem programDominanceFrontierPartial_true :
    programDominanceFrontierPartial = true := by
  native_decide

theorem programDfAlgorithmOk_true :
    programDfAlgorithmOk = true := by
  native_decide

theorem programDominanceFrontierDeepen_true :
    programDominanceFrontierDeepen = true := by
  native_decide

theorem graphDominanceFrontierPartial_true :
    graphDominanceFrontierPartial = true := by
  native_decide

theorem graphDfAlgorithmOk_true :
    graphDfAlgorithmOk = true := by
  native_decide

theorem graphDominanceFrontierDeepen_true :
    graphDominanceFrontierDeepen = true := by
  native_decide

theorem multiUnitDominanceFrontierDeepen_true :
    multiUnitDominanceFrontierDeepen = true := by
  native_decide

theorem linearMergeIdomIsEntry_true :
    linearMergeIdomIsEntry = true := by
  native_decide

theorem linearMergePhiPredsTwo_true :
    linearMergePhiPredsTwo = true := by
  native_decide

theorem linearSsaCfgDualPin_true :
    linearSsaCfgDualPin = true := by
  native_decide

theorem linearCfgProductionDeepen_true :
    linearCfgProductionDeepen = true := by
  native_decide

theorem multiUnitCfgProductionDeepen_true :
    multiUnitCfgProductionDeepen = true := by
  native_decide

theorem typesMergeIdomIsEntry_true :
    typesMergeIdomIsEntry = true := by
  native_decide

theorem typesMergePhiPredsFour_true :
    typesMergePhiPredsFour = true := by
  native_decide

theorem typesSsaCfgDualPin_true :
    typesSsaCfgDualPin = true := by
  native_decide

theorem typesCfgProductionDeepen_true :
    typesCfgProductionDeepen = true := by
  native_decide

theorem multiUnitCfgProductionDeepenTypes_true :
    multiUnitCfgProductionDeepenTypes = true := by
  native_decide

theorem programMergeIdomIsEntry_true :
    programMergeIdomIsEntry = true := by
  native_decide

theorem programMergePhiPredsFour_true :
    programMergePhiPredsFour = true := by
  native_decide

theorem programSsaCfgDualPin_true :
    programSsaCfgDualPin = true := by
  native_decide

theorem programCfgProductionDeepen_true :
    programCfgProductionDeepen = true := by
  native_decide

theorem multiUnitCfgProductionDeepenProgram_true :
    multiUnitCfgProductionDeepenProgram = true := by
  native_decide

theorem graphMergeIdomIsEntry_true :
    graphMergeIdomIsEntry = true := by
  native_decide

theorem graphMergePhiPredsThree_true :
    graphMergePhiPredsThree = true := by
  native_decide

theorem graphSsaCfgDualPin_true :
    graphSsaCfgDualPin = true := by
  native_decide

theorem graphCfgProductionDeepen_true :
    graphCfgProductionDeepen = true := by
  native_decide

theorem multiUnitCfgProductionDeepenGraph_true :
    multiUnitCfgProductionDeepenGraph = true := by
  native_decide

theorem generalCfgConstructionPartial_true :
    generalCfgConstructionPartial = true := by
  native_decide

theorem iterativeCfgConstructionPartial_true :
    iterativeCfgConstructionPartial = true := by
  native_decide

theorem iterativeCfgWalkOk_true :
    iterativeCfgWalkOk = true := by
  native_decide

theorem productionCfgUnitDiamondsOnlyClaimed_false :
    productionCfgUnitDiamondsOnlyClaimed = false :=
  rfl

theorem productionCfgUnitDiamondsOnlyHonesty_true :
    productionCfgUnitDiamondsOnlyHonesty = true := by
  native_decide

theorem fullLlvmBarEvidencePartial_true :
    fullLlvmBarEvidencePartial = true := by
  native_decide

theorem llvmCfgFixtureReady_true :
    llvmCfgFixtureReady = true := by
  native_decide

theorem llvmCfgFixturePackageOk_true :
    llvmCfgFixturePackageOk = true := by
  native_decide

theorem llvmCfgFixture_stageId_eq :
    stageId = "SLAKE_LLVM_CFG_FIXTURE_V0" :=
  rfl

theorem llvmCfgFixture_hostId_eq :
    hostId = "HOST-LLVM-CFG-FIXTURE" :=
  rfl

theorem justRecipeProductionCfgDeepen_eq :
    justRecipeProductionCfgDeepen = "production-cfg-deepen" :=
  rfl

theorem justRecipeMultDominanceFrontierPartial_eq :
    justRecipeMultDominanceFrontierPartial = "mult-dominance-frontier-partial" :=
  rfl

theorem justRecipeMultDominanceFrontierDeepen_eq :
    justRecipeMultDominanceFrontierDeepen = "mult-dominance-frontier-deepen" :=
  rfl

theorem justRecipeMultiUnitDominanceFrontierDeepen_eq :
    justRecipeMultiUnitDominanceFrontierDeepen
      = "multi-unit-dominance-frontier-deepen" :=
  rfl

theorem justRecipeLinearCfgProductionDeepen_eq :
    justRecipeLinearCfgProductionDeepen = "linear-cfg-production-deepen" :=
  rfl

theorem justRecipeTypesCfgProductionDeepen_eq :
    justRecipeTypesCfgProductionDeepen = "types-cfg-production-deepen" :=
  rfl

theorem justRecipeProgramCfgProductionDeepen_eq :
    justRecipeProgramCfgProductionDeepen = "program-cfg-production-deepen" :=
  rfl

theorem justRecipeGraphCfgProductionDeepen_eq :
    justRecipeGraphCfgProductionDeepen = "graph-cfg-production-deepen" :=
  rfl

theorem justRecipeGeneralProgramCfgPartial_eq :
    justRecipeGeneralProgramCfgPartial = "general-program-cfg-partial" :=
  rfl

theorem justRecipeIterativeCfgConstructionPartial_eq :
    justRecipeIterativeCfgConstructionPartial
      = "iterative-cfg-construction-partial" :=
  rfl

/-! ### HOST-LLVM-CFG-FIXTURE-SMOKE -/

example : llvmCfgFixtureFinishedClaimed = true := rfl
example : llvmCfgFixtureLlvmUnlocked = false := rfl
example : llvmCfgFixturePartialClaimed = true := rfl
example : llvmCfgFixtureFullBackendClaimed = true := rfl
example : llvmCfgFixtureProductionOptClaimed = false := rfl
example : llvmCfgFixtureDominanceClaimed = false := rfl
example : dominancePipelineRequiredForFullBackend = false := rfl
example : llvmCfgFixtureReady = true := by native_decide
example : multCfgFixtureName = "MULT-CFG-FIXTURE" := rfl
example : entryDominatesAll = true := by native_decide
example : mergePredsOnlyAcceptReject = true := by native_decide
example : acceptRejectReachableFromEntry = true := by native_decide
example : cfgDeepenPartial = true := by native_decide
example : mergeIdomIsEntry = true := by native_decide
example : mergePhiPredsFour = true := by native_decide
example : multSsaCfgDualPin = true := by native_decide
example : productionCfgDeepen = true := by native_decide
example : multDfMergeIsJoin = true := by native_decide
example : multDfTableDualPin = true := by native_decide
example : multDominanceFrontierPartial = true := by native_decide
example : multDfAlgorithmOk = true := by native_decide
example : multDominanceFrontierDeepen = true := by native_decide
example : linearDominanceFrontierDeepen = true := by native_decide
example : typesDominanceFrontierDeepen = true := by native_decide
example : programDominanceFrontierDeepen = true := by native_decide
example : graphDominanceFrontierDeepen = true := by native_decide
example : multiUnitDominanceFrontierDeepen = true := by native_decide
example : linearMergeIdomIsEntry = true := by native_decide
example : linearMergePhiPredsTwo = true := by native_decide
example : linearSsaCfgDualPin = true := by native_decide
example : linearCfgProductionDeepen = true := by native_decide
example : multiUnitCfgProductionDeepen = true := by native_decide
example : typesMergeIdomIsEntry = true := by native_decide
example : typesMergePhiPredsFour = true := by native_decide
example : typesSsaCfgDualPin = true := by native_decide
example : typesCfgProductionDeepen = true := by native_decide
example : multiUnitCfgProductionDeepenTypes = true := by native_decide
example : programMergeIdomIsEntry = true := by native_decide
example : programMergePhiPredsFour = true := by native_decide
example : programSsaCfgDualPin = true := by native_decide
example : programCfgProductionDeepen = true := by native_decide
example : multiUnitCfgProductionDeepenProgram = true := by native_decide
example : graphMergeIdomIsEntry = true := by native_decide
example : graphMergePhiPredsThree = true := by native_decide
example : graphSsaCfgDualPin = true := by native_decide
example : graphCfgProductionDeepen = true := by native_decide
example : multiUnitCfgProductionDeepenGraph = true := by native_decide
example : generalCfgConstructionPartial = true := by native_decide
example : iterativeCfgConstructionPartial = true := by native_decide
example : iterativeCfgWalkOk = true := by native_decide
example : productionCfgUnitDiamondsOnlyClaimed = false := rfl
example : fullLlvmBarEvidencePartial = true := by native_decide
example : justRecipeProductionCfgDeepen = "production-cfg-deepen" := rfl
example : justRecipeMultDominanceFrontierPartial = "mult-dominance-frontier-partial" := rfl
example : justRecipeMultiUnitDominanceFrontierDeepen
    = "multi-unit-dominance-frontier-deepen" := rfl
example : justRecipeLinearCfgProductionDeepen = "linear-cfg-production-deepen" := rfl
example : justRecipeTypesCfgProductionDeepen = "types-cfg-production-deepen" := rfl
example : justRecipeProgramCfgProductionDeepen = "program-cfg-production-deepen" := rfl
example : justRecipeGraphCfgProductionDeepen = "graph-cfg-production-deepen" := rfl
example : justRecipeGeneralProgramCfgPartial = "general-program-cfg-partial" := rfl
example : justRecipeIterativeCfgConstructionPartial
    = "iterative-cfg-construction-partial" := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : LlvmMultSsa.llvmMultSsaReady = true := by native_decide
example : LlvmLinearSsa.llvmLinearSsaReady = true := by native_decide
example : LlvmTypesSsa.llvmTypesSsaReady = true := by native_decide
example : LlvmProgramSsa.llvmProgramSsaReady = true := by native_decide
example : LlvmGraphSsa.llvmGraphSsaReady = true := by native_decide

end SystemsLean.LlvmCfgFixture
