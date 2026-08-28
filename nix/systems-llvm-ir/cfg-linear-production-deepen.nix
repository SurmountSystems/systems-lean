# SPDX-License-Identifier: Unlicense
# Linear SSA CFG production dual-pin (Full LLVM production backend first slice):
# multi-unit Mult+Linear production CFG beyond Mult-only productionCfgDeepen.
# Host Lean LlvmCfgUnitProduction linearCfgProductionDeepen /
# multiUnitCfgProductionDeepen against generator-owned slake_linear_ssa.ll.
# Not full dominance pipeline. Not production opt. Not full LLVM backend claim true.
# Greppable: LINEAR-CFG-PRODUCTION-DEEPEN, MULTI-UNIT-CFG-PRODUCTION-DEEPEN,
# linear-cfg-production-deepen, LINEAR-SSA-CFG-DUAL-PIN, LINEAR-MERGE-PHI-PREDS-TWO.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmCfgUnitProduction.lean"
    "src/systems/SystemsLean/LlvmCfgHonesty.lean"
    "out/llvm-ir/slake_linear_ssa.ll"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmCfgUnitProduction.lean";
      all = [
        "linearCfgProductionDeepen"
        "LINEAR-CFG-PRODUCTION-DEEPEN"
        "multiUnitCfgProductionDeepen"
        "MULTI-UNIT-CFG-PRODUCTION-DEEPEN"
        "linearSsaCfgBlocks"
        "linearSsaCfgEdges"
        "linearProductionIdomTable"
        "LINEAR-PRODUCTION-IDOM"
        "linearMergeIdomIsEntry"
        "LINEAR-MERGE-IDOM-ENTRY"
        "linearMergePhiPredsTwo"
        "LINEAR-MERGE-PHI-PREDS-TWO"
        "linearSsaCfgDualPin"
        "LINEAR-SSA-CFG-DUAL-PIN"
        "justRecipeLinearCfgProductionDeepen"
        "linear-cfg-production-deepen"
        "bb_live"
        "LlvmLinearSsa"
        "def linearCfgProductionDeepen : Bool :="
        "def multiUnitCfgProductionDeepen : Bool :="
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
      rel = "out/llvm-ir/slake_linear_ssa.ll";
      all = [
        "slake_linear_ssa_live_flag"
        "bb_live"
        "bb_reject"
        "merge:"
        "phi i32 [ %t1, %bb_live ], [ -1, %bb_reject ]"
        "Not production LLVM backend"
        "Not full CFG/dominance"
        "SSA-SHAPED"
        "LINEAR-EXACT-ONCE"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "linear-cfg-production-deepen:"
        "LINEAR-CFG-PRODUCTION-DEEPEN"
        "MULTI-UNIT-CFG-PRODUCTION-DEEPEN"
        "fixture tip fullBackend"
        "not production opt"
        "not full dominance"
        "LINEAR-MERGE-PHI-PREDS-TWO"
        "LINEAR-SSA-CFG-DUAL-PIN"
      ];
    }
  ];
}
