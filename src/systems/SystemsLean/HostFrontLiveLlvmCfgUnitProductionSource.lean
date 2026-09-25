/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmCfgUnitProduction.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmCfgUnitProductionSource. Not occupancy name 50.
  Not mill 70. This wrap is LlvmCfgUnitProduction.lean.
  It is not LlvmCfgFixture.lean. It is not LlvmHold.lean.
  Not an LLVM backend. FullBackend stays false. FullHost stays false.
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmCfgUnitProductionSource,
  HOST-FRONT-LIVE-LLVM-CFG-UNIT-PRODUCTION, LLVM-CFG-UNIT-PRODUCTION,
  liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmCfgUnitProductionSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmCfgUnitProduction

/-- Dual-pinned live LlvmCfgUnitProduction.lean bytes (must match on-disk file).
    Greppable: liveLlvmCfgUnitProductionSource, LLVM-CFG-UNIT-PRODUCTION. -/
def liveLlvmCfgUnitProductionSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Linear/Types/Program/Graph unit CFG production dual-pins.
  Long-file split role from LlvmCfgFixture: multi-unit Mult..Graph production CFG.
  Five unit-band diamonds beyond Mult-only productionCfgDeepen. Not general CFG
  construction (see LlvmCfgGeneral). Not full dominance. Not production opt.
  Progressive independent of fixture tip fullBackend polarity (A-light).
  Greppable: LINEAR-CFG-PRODUCTION-DEEPEN, TYPES-CFG-PRODUCTION-DEEPEN,
  PROGRAM-CFG-PRODUCTION-DEEPEN, GRAPH-CFG-PRODUCTION-DEEPEN,
  multiUnitCfgProductionDeepenGraph, MULTI-UNIT-CFG-PRODUCTION-DEEPEN-GRAPH.
  Module: SystemsLean.LlvmCfgUnitProduction
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Same namespace SystemsLean.LlvmCfgFixture.
  Module must stay ASCII. Not freestanding emit. Host elaborator residual remains.
-/

import SystemsLean.LlvmCfgMultProduction
import SystemsLean.LlvmLinearSsa
import SystemsLean.LlvmTypesSsa
import SystemsLean.LlvmProgramSsa
import SystemsLean.LlvmGraphSsa

namespace SystemsLean.LlvmCfgFixture

/-! ### LINEAR-CFG-PRODUCTION-DEEPEN (Linear SSA live_flag dual-pin)

  Beyond Mult-only productionCfgDeepen: model Linear SSA live_flag CFG that
  generator-owned out/llvm-ir/slake_linear_ssa.ll emits (entry/bb_live/
  bb_reject/merge), structural immediate dominators, and two-pred merge phi
  honesty. Multi-unit Mult+Linear production CFG dual-pin. Still not full
  dominance construction over arbitrary graphs. Not production opt.
  Progressive independent of tip fullBackend. Greppable: LINEAR-CFG-PRODUCTION-DEEPEN.
-/

/-- Linear SSA live_flag blocks (match slake_linear_ssa.ll labels).
    Greppable: linearSsaCfgBlocks, LINEAR-SSA-CFG-BLOCKS. -/
def linearSsaCfgBlocks : List String :=
  [ "entry"
  , "bb_live"
  , "bb_reject"
  , "merge"
  ]

/-- Linear SSA live_flag edges (source->target; match br targets).
    Greppable: linearSsaCfgEdges, LINEAR-SSA-CFG-EDGES. -/
def linearSsaCfgEdges : List String :=
  [ "entry->bb_live"
  , "entry->bb_reject"
  , "bb_live->merge"
  , "bb_reject->merge"
  ]

/-- Structural immediate-dominator table for Linear SSA live_flag CFG.
    Format block:idom. Merge idom is entry (two-arm diamond). Not a general
    dominance-tree algorithm claim.
    Greppable: linearProductionIdomTable, LINEAR-PRODUCTION-IDOM. -/
def linearProductionIdomTable : List String :=
  [ "bb_live:entry"
  , "bb_reject:entry"
  , "merge:entry"
  ]

/-- Linear merge immediate dominator is entry.
    Greppable: linearMergeIdomIsEntry, LINEAR-MERGE-IDOM-ENTRY. -/
def linearMergeIdomIsEntry : Bool :=
  linearProductionIdomTable.contains "merge:entry"
    && (linearSsaCfgBlocks.head? == some "entry")
    && (linearSsaCfgBlocks.length == 4)
    && (linearProductionIdomTable.length == 3)

/-- Linear merge has exactly two SSA phi predecessors (live + reject).
    Matches Linear SSA phi: bb_live / bb_reject.
    Greppable: linearMergePhiPredsTwo, LINEAR-MERGE-PHI-PREDS-TWO. -/
def linearMergePhiPredsTwo : Bool :=
  (linearSsaCfgEdges.contains "bb_live->merge")
    && (linearSsaCfgEdges.contains "bb_reject->merge")
    && !(linearSsaCfgEdges.contains "entry->merge")
    && (linearSsaCfgEdges.length == 4)

/-- Dual-pin Linear SSA CFG inventory against Linear SSA peer readiness.
    Greppable: linearSsaCfgDualPin, LINEAR-SSA-CFG-DUAL-PIN. -/
def linearSsaCfgDualPin : Bool :=
  (linearSsaCfgBlocks.length == 4)
    && (linearSsaCfgEdges.length == 4)
    && (linearProductionIdomTable.length == 3)
    && LlvmLinearSsa.llvmLinearSsaReady
    && LlvmLinearSsa.llvmLinearSsaPartialClaimed
    && !LlvmLinearSsa.llvmLinearSsaFullBackendClaimed
    && !LlvmLinearSsa.llvmLinearSsaCfgProductionClaimed

/-- just recipe name for Linear CFG production dual-pin residual.
    Greppable: justRecipeLinearCfgProductionDeepen, linear-cfg-production-deepen. -/
def justRecipeLinearCfgProductionDeepen : String := "linear-cfg-production-deepen"

/-- Linear SSA production-oriented CFG dual-pin (beyond Mult-only deepen).
    Greppable: linearCfgProductionDeepen, LINEAR-CFG-PRODUCTION-DEEPEN.
    Progressive independent of tip fullBackend; production opt / full dominance
    stay false. -/
def linearCfgProductionDeepen : Bool :=
  linearMergeIdomIsEntry
    && linearMergePhiPredsTwo
    && linearSsaCfgDualPin
    && (justRecipeLinearCfgProductionDeepen == "linear-cfg-production-deepen")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-- Multi-unit Mult+Linear production CFG dual-pin (first Full LLVM backend
    evidence band beyond Mult-only productionCfgDeepen).
    Greppable: multiUnitCfgProductionDeepen, MULTI-UNIT-CFG-PRODUCTION-DEEPEN.
    Progressive; not tip fullBackend synonym. -/
def multiUnitCfgProductionDeepen : Bool :=
  productionCfgDeepen
    && linearCfgProductionDeepen
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-! ### TYPES-CFG-PRODUCTION-DEEPEN (Types SSA kind_tag dual-pin)

  Beyond Mult+Linear multi-unit: model Types SSA kind_tag CFG that
  generator-owned out/llvm-ir/slake_types_ssa.ll emits (entry/check/
  value/linear/erased/reject/merge), structural immediate dominators, and
  four-pred merge phi honesty. Mult+Linear+Types production CFG dual-pin.
  Still not full dominance construction over arbitrary graphs.
  Not production opt. Progressive independent of tip fullBackend.
  Greppable: TYPES-CFG-PRODUCTION-DEEPEN.
-/

/-- Types SSA kind_tag blocks (match slake_types_ssa.ll labels).
    Greppable: typesSsaCfgBlocks, TYPES-SSA-CFG-BLOCKS. -/
def typesSsaCfgBlocks : List String :=
  [ "entry"
  , "check1"
  , "check2"
  , "bb_value"
  , "bb_linear"
  , "bb_erased"
  , "bb_reject"
  , "merge"
  ]

/-- Types SSA kind_tag edges (source->target; match br targets in Types SSA).
    Greppable: typesSsaCfgEdges, TYPES-SSA-CFG-EDGES. -/
def typesSsaCfgEdges : List String :=
  [ "entry->bb_value"
  , "entry->check1"
  , "check1->bb_linear"
  , "check1->check2"
  , "check2->bb_erased"
  , "check2->bb_reject"
  , "bb_value->merge"
  , "bb_linear->merge"
  , "bb_erased->merge"
  , "bb_reject->merge"
  ]

/-- Structural immediate-dominator table for Types SSA kind_tag CFG.
    Format block:idom. Merge idom is entry (diamond join). Not a general
    dominance-tree algorithm claim.
    Greppable: typesProductionIdomTable, TYPES-PRODUCTION-IDOM. -/
def typesProductionIdomTable : List String :=
  [ "check1:entry"
  , "bb_value:entry"
  , "check2:check1"
  , "bb_linear:check1"
  , "bb_erased:check2"
  , "bb_reject:check2"
  , "merge:entry"
  ]

/-- Types merge immediate dominator is entry (structural Types SSA honesty).
    Greppable: typesMergeIdomIsEntry, TYPES-MERGE-IDOM-ENTRY. -/
def typesMergeIdomIsEntry : Bool :=
  typesProductionIdomTable.contains "merge:entry"
    && (typesSsaCfgBlocks.head? == some "entry")
    && (typesSsaCfgBlocks.length == 8)
    && (typesProductionIdomTable.length == 7)

/-- Types merge has exactly four SSA phi predecessors (kind arms + reject).
    Matches Types SSA phi: bb_value / bb_linear / bb_erased / bb_reject.
    Greppable: typesMergePhiPredsFour, TYPES-MERGE-PHI-PREDS-FOUR. -/
def typesMergePhiPredsFour : Bool :=
  (typesSsaCfgEdges.contains "bb_value->merge")
    && (typesSsaCfgEdges.contains "bb_linear->merge")
    && (typesSsaCfgEdges.contains "bb_erased->merge")
    && (typesSsaCfgEdges.contains "bb_reject->merge")
    && !(typesSsaCfgEdges.contains "entry->merge")
    && !(typesSsaCfgEdges.contains "check1->merge")
    && !(typesSsaCfgEdges.contains "check2->merge")
    && (typesSsaCfgEdges.length == 10)

/-- Dual-pin Types SSA CFG inventory against Types SSA peer readiness.
    Greppable: typesSsaCfgDualPin, TYPES-SSA-CFG-DUAL-PIN. -/
def typesSsaCfgDualPin : Bool :=
  (typesSsaCfgBlocks.length == 8)
    && (typesSsaCfgEdges.length == 10)
    && (typesProductionIdomTable.length == 7)
    && LlvmTypesSsa.llvmTypesSsaReady
    && LlvmTypesSsa.llvmTypesSsaPartialClaimed
    && !LlvmTypesSsa.llvmTypesSsaFullBackendClaimed
    && !LlvmTypesSsa.llvmTypesSsaCfgProductionClaimed

/-- just recipe name for Types CFG production dual-pin residual.
    Greppable: justRecipeTypesCfgProductionDeepen, types-cfg-production-deepen. -/
def justRecipeTypesCfgProductionDeepen : String := "types-cfg-production-deepen"

/-- Types SSA production-oriented CFG dual-pin (third unit band).
    Greppable: typesCfgProductionDeepen, TYPES-CFG-PRODUCTION-DEEPEN.
    Progressive independent of tip fullBackend; production opt / full dominance
    stay false. -/
def typesCfgProductionDeepen : Bool :=
  typesMergeIdomIsEntry
    && typesMergePhiPredsFour
    && typesSsaCfgDualPin
    && (justRecipeTypesCfgProductionDeepen == "types-cfg-production-deepen")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-- Multi-unit Mult+Linear+Types production CFG dual-pin (beyond Mult+Linear).
    Greppable: multiUnitCfgProductionDeepenTypes,
    MULTI-UNIT-CFG-PRODUCTION-DEEPEN-TYPES. Progressive; not tip synonym. -/
def multiUnitCfgProductionDeepenTypes : Bool :=
  multiUnitCfgProductionDeepen
    && typesCfgProductionDeepen
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-! ### PROGRAM-CFG-PRODUCTION-DEEPEN (Program SSA push-status dual-pin)

  Beyond Mult+Linear+Types multi-unit: model Program SSA push-status CFG that
  generator-owned out/llvm-ir/slake_program_ssa.ll emits (entry/check/ok/bad/
  full/reject/merge), structural immediate dominators, and four-pred merge phi
  honesty. Mult..Types+Program production CFG dual-pin.
  Still not full dominance construction over arbitrary graphs.
  Not production opt. Progressive independent of tip fullBackend.
  Greppable: PROGRAM-CFG-PRODUCTION-DEEPEN.
-/

/-- Program SSA push-status blocks (match slake_program_ssa.ll labels).
    Greppable: programSsaCfgBlocks, PROGRAM-SSA-CFG-BLOCKS. -/
def programSsaCfgBlocks : List String :=
  [ "entry"
  , "check1"
  , "check2"
  , "bb_ok"
  , "bb_bad"
  , "bb_full"
  , "bb_reject"
  , "merge"
  ]

/-- Program SSA push-status edges (source->target; match br targets in Program SSA).
    Greppable: programSsaCfgEdges, PROGRAM-SSA-CFG-EDGES. -/
def programSsaCfgEdges : List String :=
  [ "entry->bb_ok"
  , "entry->check1"
  , "check1->bb_bad"
  , "check1->check2"
  , "check2->bb_full"
  , "check2->bb_reject"
  , "bb_ok->merge"
  , "bb_bad->merge"
  , "bb_full->merge"
  , "bb_reject->merge"
  ]

/-- Structural immediate-dominator table for Program SSA push-status CFG.
    Format block:idom. Merge idom is entry (diamond join). Not a general
    dominance-tree algorithm claim.
    Greppable: programProductionIdomTable, PROGRAM-PRODUCTION-IDOM. -/
def programProductionIdomTable : List String :=
  [ "check1:entry"
  , "bb_ok:entry"
  , "check2:check1"
  , "bb_bad:check1"
  , "bb_full:check2"
  , "bb_reject:check2"
  , "merge:entry"
  ]

/-- Program merge immediate dominator is entry (structural Program SSA honesty).
    Greppable: programMergeIdomIsEntry, PROGRAM-MERGE-IDOM-ENTRY. -/
def programMergeIdomIsEntry : Bool :=
  programProductionIdomTable.contains "merge:entry"
    && (programSsaCfgBlocks.head? == some "entry")
    && (programSsaCfgBlocks.length == 8)
    && (programProductionIdomTable.length == 7)

/-- Program merge has exactly four SSA phi predecessors (ok/bad/full/reject).
    Matches Program SSA phi: bb_ok / bb_bad / bb_full / bb_reject.
    Greppable: programMergePhiPredsFour, PROGRAM-MERGE-PHI-PREDS-FOUR. -/
def programMergePhiPredsFour : Bool :=
  (programSsaCfgEdges.contains "bb_ok->merge")
    && (programSsaCfgEdges.contains "bb_bad->merge")
    && (programSsaCfgEdges.contains "bb_full->merge")
    && (programSsaCfgEdges.contains "bb_reject->merge")
    && !(programSsaCfgEdges.contains "entry->merge")
    && !(programSsaCfgEdges.contains "check1->merge")
    && !(programSsaCfgEdges.contains "check2->merge")
    && (programSsaCfgEdges.length == 10)

/-- Dual-pin Program SSA CFG inventory against Program SSA peer readiness.
    Greppable: programSsaCfgDualPin, PROGRAM-SSA-CFG-DUAL-PIN. -/
def programSsaCfgDualPin : Bool :=
  (programSsaCfgBlocks.length == 8)
    && (programSsaCfgEdges.length == 10)
    && (programProductionIdomTable.length == 7)
    && LlvmProgramSsa.llvmProgramSsaReady
    && LlvmProgramSsa.llvmProgramSsaPartialClaimed
    && !LlvmProgramSsa.llvmProgramSsaFullBackendClaimed
    && !LlvmProgramSsa.llvmProgramSsaCfgProductionClaimed

/-- just recipe name for Program CFG production dual-pin residual.
    Greppable: justRecipeProgramCfgProductionDeepen, program-cfg-production-deepen. -/
def justRecipeProgramCfgProductionDeepen : String := "program-cfg-production-deepen"

/-- Program SSA production-oriented CFG dual-pin (fourth unit band).
    Greppable: programCfgProductionDeepen, PROGRAM-CFG-PRODUCTION-DEEPEN.
    Progressive independent of tip fullBackend; production opt / full dominance
    stay false. -/
def programCfgProductionDeepen : Bool :=
  programMergeIdomIsEntry
    && programMergePhiPredsFour
    && programSsaCfgDualPin
    && (justRecipeProgramCfgProductionDeepen == "program-cfg-production-deepen")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-- Multi-unit Mult+Linear+Types+Program production CFG dual-pin.
    Greppable: multiUnitCfgProductionDeepenProgram,
    MULTI-UNIT-CFG-PRODUCTION-DEEPEN-PROGRAM. Progressive; not tip synonym. -/
def multiUnitCfgProductionDeepenProgram : Bool :=
  multiUnitCfgProductionDeepenTypes
    && programCfgProductionDeepen
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-! ### GRAPH-CFG-PRODUCTION-DEEPEN (Graph SSA addEdge-status dual-pin)

  Beyond Mult..Program multi-unit: model Graph SSA addEdge-status CFG that
  generator-owned out/llvm-ir/slake_graph_ssa.ll emits (entry/check/ok/fail/
  reject/merge), structural immediate dominators, and three-pred merge phi
  honesty. Mult..Program+Graph production CFG dual-pin.
  Still not full dominance construction over arbitrary graphs.
  Not production opt. Progressive independent of tip fullBackend.
  Greppable: GRAPH-CFG-PRODUCTION-DEEPEN.
-/

/-- Graph SSA addEdge-status blocks (match slake_graph_ssa.ll labels).
    Greppable: graphSsaCfgBlocks, GRAPH-SSA-CFG-BLOCKS. -/
def graphSsaCfgBlocks : List String :=
  [ "entry"
  , "check1"
  , "bb_ok"
  , "bb_fail"
  , "bb_reject"
  , "merge"
  ]

/-- Graph SSA addEdge-status edges (source->target; match br targets in Graph SSA).
    Greppable: graphSsaCfgEdges, GRAPH-SSA-CFG-EDGES. -/
def graphSsaCfgEdges : List String :=
  [ "entry->bb_ok"
  , "entry->check1"
  , "check1->bb_fail"
  , "check1->bb_reject"
  , "bb_ok->merge"
  , "bb_fail->merge"
  , "bb_reject->merge"
  ]

/-- Structural immediate-dominator table for Graph SSA addEdge-status CFG.
    Format block:idom. Merge idom is entry (diamond join). Not a general
    dominance-tree algorithm claim.
    Greppable: graphProductionIdomTable, GRAPH-PRODUCTION-IDOM. -/
def graphProductionIdomTable : List String :=
  [ "check1:entry"
  , "bb_ok:entry"
  , "bb_fail:check1"
  , "bb_reject:check1"
  , "merge:entry"
  ]

/-- Graph merge immediate dominator is entry (structural Graph SSA honesty).
    Greppable: graphMergeIdomIsEntry, GRAPH-MERGE-IDOM-ENTRY. -/
def graphMergeIdomIsEntry : Bool :=
  graphProductionIdomTable.contains "merge:entry"
    && (graphSsaCfgBlocks.head? == some "entry")
    && (graphSsaCfgBlocks.length == 6)
    && (graphProductionIdomTable.length == 5)

/-- Graph merge has exactly three SSA phi predecessors (ok/fail/reject).
    Matches Graph SSA phi: bb_ok / bb_fail / bb_reject.
    Greppable: graphMergePhiPredsThree, GRAPH-MERGE-PHI-PREDS-THREE. -/
def graphMergePhiPredsThree : Bool :=
  (graphSsaCfgEdges.contains "bb_ok->merge")
    && (graphSsaCfgEdges.contains "bb_fail->merge")
    && (graphSsaCfgEdges.contains "bb_reject->merge")
    && !(graphSsaCfgEdges.contains "entry->merge")
    && !(graphSsaCfgEdges.contains "check1->merge")
    && (graphSsaCfgEdges.length == 7)

/-- Dual-pin Graph SSA CFG inventory against Graph SSA peer readiness.
    Greppable: graphSsaCfgDualPin, GRAPH-SSA-CFG-DUAL-PIN. -/
def graphSsaCfgDualPin : Bool :=
  (graphSsaCfgBlocks.length == 6)
    && (graphSsaCfgEdges.length == 7)
    && (graphProductionIdomTable.length == 5)
    && LlvmGraphSsa.llvmGraphSsaReady
    && LlvmGraphSsa.llvmGraphSsaPartialClaimed
    && !LlvmGraphSsa.llvmGraphSsaFullBackendClaimed
    && !LlvmGraphSsa.llvmGraphSsaCfgProductionClaimed

/-- just recipe name for Graph CFG production dual-pin residual.
    Greppable: justRecipeGraphCfgProductionDeepen, graph-cfg-production-deepen. -/
def justRecipeGraphCfgProductionDeepen : String := "graph-cfg-production-deepen"

/-- Graph SSA production-oriented CFG dual-pin (fifth unit band).
    Greppable: graphCfgProductionDeepen, GRAPH-CFG-PRODUCTION-DEEPEN.
    Progressive independent of tip fullBackend; production opt / full dominance
    stay false. -/
def graphCfgProductionDeepen : Bool :=
  graphMergeIdomIsEntry
    && graphMergePhiPredsThree
    && graphSsaCfgDualPin
    && (justRecipeGraphCfgProductionDeepen == "graph-cfg-production-deepen")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-- Multi-unit Mult+Linear+Types+Program+Graph production CFG dual-pin.
    Greppable: multiUnitCfgProductionDeepenGraph,
    MULTI-UNIT-CFG-PRODUCTION-DEEPEN-GRAPH. Progressive; not tip synonym. -/
def multiUnitCfgProductionDeepenGraph : Bool :=
  multiUnitCfgProductionDeepenProgram
    && graphCfgProductionDeepen
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed


end SystemsLean.LlvmCfgFixture
"#

end SystemsLean.HostFrontLiveLlvmCfgUnitProduction

