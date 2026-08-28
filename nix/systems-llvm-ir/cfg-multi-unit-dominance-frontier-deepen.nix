# SPDX-License-Identifier: Unlicense
# Multi-unit Mult..Graph dominance frontier deepen (N4 / R5 base):
# Linear/Types/Program/Graph DF structural + Cytron dual-pin + multi-unit join
# in host Lean LlvmCfgUnitDf (linearDominanceFrontierDeepen /
# typesDominanceFrontierDeepen / programDominanceFrontierDeepen /
# graphDominanceFrontierDeepen / multiUnitDominanceFrontierDeepen).
# Mult deepen remains in LlvmCfgMultDf.
# llvmCfgFixtureDominanceClaimed stays false (structural idom; not proved
# general dominator-tree constructor; not arbitrary-graph DF pipeline).
# Not production opt. Not band FullBackend.
# Greppable: MULTI-UNIT-DOMINANCE-FRONTIER-DEEPEN, multiUnitDominanceFrontierDeepen,
# multi-unit-dominance-frontier-deepen, LINEAR-DOMINANCE-FRONTIER-DEEPEN,
# TYPES-DOMINANCE-FRONTIER-DEEPEN, PROGRAM-DOMINANCE-FRONTIER-DEEPEN,
# GRAPH-DOMINANCE-FRONTIER-DEEPEN, UNIT-DF-CYTRON.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmCfgUnitDf.lean"
    "src/systems/SystemsLean/LlvmCfgMultDf.lean"
    "src/systems/SystemsLean/LlvmCfgHonesty.lean"
    "src/systems/SystemsLean/LlvmCfgFixture.lean"
    "out/llvm-ir/slake_linear_ssa.ll"
    "out/llvm-ir/slake_types_ssa.ll"
    "out/llvm-ir/slake_program_ssa.ll"
    "out/llvm-ir/slake_graph_ssa.ll"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmCfgUnitDf.lean";
      all = [
        "multiUnitDominanceFrontierDeepen"
        "MULTI-UNIT-DOMINANCE-FRONTIER-DEEPEN"
        "linearDominanceFrontierDeepen"
        "LINEAR-DOMINANCE-FRONTIER-DEEPEN"
        "typesDominanceFrontierDeepen"
        "TYPES-DOMINANCE-FRONTIER-DEEPEN"
        "programDominanceFrontierDeepen"
        "PROGRAM-DOMINANCE-FRONTIER-DEEPEN"
        "graphDominanceFrontierDeepen"
        "GRAPH-DOMINANCE-FRONTIER-DEEPEN"
        "linearDfComputed"
        "typesDfComputed"
        "programDfComputed"
        "graphDfComputed"
        "linearDfAlgorithmOk"
        "typesDfAlgorithmOk"
        "programDfAlgorithmOk"
        "graphDfAlgorithmOk"
        "programDfTable"
        "graphDfTable"
        "unitDfCytronFromJoin"
        "UNIT-DF-CYTRON"
        "unitDfComputed"
        "justRecipeMultiUnitDominanceFrontierDeepen"
        "multi-unit-dominance-frontier-deepen"
        "def multiUnitDominanceFrontierDeepen : Bool :="
        "multDominanceFrontierDeepen"
        "programDominanceFrontierDeepen"
        "graphDominanceFrontierDeepen"
        "multiUnitCfgProductionDeepenGraph"
        "!llvmCfgFixtureDominanceClaimed"
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
      rel = "src/systems/SystemsLean/LlvmCfgFixture.lean";
      all = [
        "theorem multiUnitDominanceFrontierDeepen_true"
        "theorem linearDominanceFrontierDeepen_true"
        "theorem typesDominanceFrontierDeepen_true"
        "theorem programDominanceFrontierDeepen_true"
        "theorem graphDominanceFrontierDeepen_true"
        "theorem llvmCfgFixtureDominanceClaimed_false"
        "multiUnitDominanceFrontierDeepen"
        "LlvmCfgUnitDf"
      ];
      forbidden = [ ];
    }
    {
      rel = "out/llvm-ir/slake_linear_ssa.ll";
      all = [
        "bb_live"
        "bb_reject"
        "merge:"
        "Not production LLVM backend"
        "Not full CFG/dominance"
      ];
    }
    {
      rel = "out/llvm-ir/slake_types_ssa.ll";
      all = [
        "bb_value"
        "bb_linear"
        "bb_erased"
        "bb_reject"
        "check1"
        "check2"
        "merge:"
        "Not production LLVM backend"
        "Not full CFG/dominance"
      ];
    }
    {
      rel = "out/llvm-ir/slake_program_ssa.ll";
      all = [
        "bb_ok"
        "bb_bad"
        "bb_full"
        "bb_reject"
        "check1"
        "check2"
        "merge:"
        "Not production LLVM backend"
        "Not full CFG/dominance"
      ];
    }
    {
      rel = "out/llvm-ir/slake_graph_ssa.ll";
      all = [
        "bb_ok"
        "bb_fail"
        "bb_reject"
        "check1"
        "merge:"
        "Not production LLVM backend"
        "Not full CFG/dominance"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "multi-unit-dominance-frontier-deepen:"
        "linear-dominance-frontier-deepen:"
        "types-dominance-frontier-deepen:"
        "program-dominance-frontier-deepen:"
        "graph-dominance-frontier-deepen:"
        "MULTI-UNIT-DOMINANCE-FRONTIER-DEEPEN"
        "LINEAR-DOMINANCE-FRONTIER-DEEPEN"
        "TYPES-DOMINANCE-FRONTIER-DEEPEN"
        "PROGRAM-DOMINANCE-FRONTIER-DEEPEN"
        "GRAPH-DOMINANCE-FRONTIER-DEEPEN"
        "DominanceClaimed false"
      ];
    }
  ];
}
