# SPDX-License-Identifier: Unlicense
# Graph SSA CFG production dual-pin (Full LLVM production backend R1d):
# multi-unit Mult+Linear+Types+Program+Graph production CFG beyond
# multiUnitCfgProductionDeepenProgram. Host Lean LlvmCfgUnitProduction
# graphCfgProductionDeepen / multiUnitCfgProductionDeepenGraph against
# generator-owned slake_graph_ssa.ll.
# Not full dominance pipeline. Not production opt. Not full LLVM backend claim true.
# Greppable: GRAPH-CFG-PRODUCTION-DEEPEN, MULTI-UNIT-CFG-PRODUCTION-DEEPEN-GRAPH,
# graph-cfg-production-deepen, GRAPH-SSA-CFG-DUAL-PIN, GRAPH-MERGE-PHI-PREDS-THREE.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmCfgUnitProduction.lean"
    "src/systems/SystemsLean/LlvmCfgHonesty.lean"
    "out/llvm-ir/slake_graph_ssa.ll"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmCfgUnitProduction.lean";
      all = [
        "graphCfgProductionDeepen"
        "GRAPH-CFG-PRODUCTION-DEEPEN"
        "multiUnitCfgProductionDeepenGraph"
        "MULTI-UNIT-CFG-PRODUCTION-DEEPEN-GRAPH"
        "graphSsaCfgBlocks"
        "graphSsaCfgEdges"
        "graphProductionIdomTable"
        "GRAPH-PRODUCTION-IDOM"
        "graphMergeIdomIsEntry"
        "GRAPH-MERGE-IDOM-ENTRY"
        "graphMergePhiPredsThree"
        "GRAPH-MERGE-PHI-PREDS-THREE"
        "graphSsaCfgDualPin"
        "GRAPH-SSA-CFG-DUAL-PIN"
        "justRecipeGraphCfgProductionDeepen"
        "graph-cfg-production-deepen"
        "bb_fail"
        "LlvmGraphSsa"
        "def graphCfgProductionDeepen : Bool :="
        "def multiUnitCfgProductionDeepenGraph : Bool :="
      ];
      forbidden = [ ];
    }
    {
      rel = "src/systems/SystemsLean/LlvmCfgHonesty.lean";
      all = [
        "def llvmCfgFixtureFullBackendClaimed : Bool := true"
        "def llvmCfgFixtureProductionOptClaimed : Bool := false"
        "def llvmCfgFixtureDominanceClaimed : Bool := false"
      ];
      forbidden = [
        "def llvmCfgFixtureFullBackendClaimed : Bool := false"
        "def llvmCfgFixtureProductionOptClaimed : Bool := true"
        "def llvmCfgFixtureDominanceClaimed : Bool := true"
      ];
    }
    {
      rel = "out/llvm-ir/slake_graph_ssa.ll";
      all = [
        "slake_graph_ssa_add_edge_status"
        "bb_ok"
        "bb_fail"
        "bb_reject"
        "check1"
        "merge:"
        "phi i32 [ %t0, %bb_ok ], [ %t1, %bb_fail ], [ -2, %bb_reject ]"
        "Not production LLVM backend"
        "Not full CFG/dominance"
        "SSA-SHAPED"
        "EMPTY-GRAPH-OK"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "graph-cfg-production-deepen:"
        "GRAPH-CFG-PRODUCTION-DEEPEN"
        "MULTI-UNIT-CFG-PRODUCTION-DEEPEN-GRAPH"
        "fixture tip fullBackend"
        "not production opt"
        "not full dominance"
        "GRAPH-MERGE-PHI-PREDS-THREE"
        "GRAPH-SSA-CFG-DUAL-PIN"
      ];
    }
  ];
}
