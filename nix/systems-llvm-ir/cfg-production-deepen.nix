# SPDX-License-Identifier: Unlicense
# Production CFG deepen (beyond Mult CFG fixture structural partial):
# dual-pin Mult SSA grade_tag CFG (blocks/edges/idom/four-pred merge phi)
# in host Lean LlvmCfgMultProduction against generator-owned Mult SSA IR.
# Not full dominance pipeline. Not production opt. Not full LLVM backend.
# Greppable: PRODUCTION-CFG-DEEPEN, productionCfgDeepen, production-cfg-deepen,
# MULT-SSA-CFG-DUAL-PIN, MERGE-PHI-PREDS-FOUR, MERGE-IDOM-ENTRY, PRODUCTION-IDOM.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmCfgMultProduction.lean"
    "src/systems/SystemsLean/LlvmCfgHonesty.lean"
    "out/llvm-ir/slake_mult_ssa.ll"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmCfgMultProduction.lean";
      all = [
        "productionCfgDeepen"
        "PRODUCTION-CFG-DEEPEN"
        "multSsaCfgBlocks"
        "multSsaCfgEdges"
        "productionIdomTable"
        "PRODUCTION-IDOM"
        "mergeIdomIsEntry"
        "MERGE-IDOM-ENTRY"
        "mergePhiPredsFour"
        "MERGE-PHI-PREDS-FOUR"
        "multSsaCfgDualPin"
        "MULT-SSA-CFG-DUAL-PIN"
        "justRecipeProductionCfgDeepen"
        "production-cfg-deepen"
        "cfgDeepenPartial"
        "bb_mult0"
        "bb_mult1"
        "bb_omega"
        "bb_reject"
        "def productionCfgDeepen : Bool :="
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
      rel = "out/llvm-ir/slake_mult_ssa.ll";
      all = [
        "slake_mult_ssa_grade_tag"
        "bb_mult0"
        "bb_mult1"
        "bb_omega"
        "bb_reject"
        "check1"
        "check2"
        "merge:"
        "phi i32 [ %t0, %bb_mult0 ], [ %t1, %bb_mult1 ], [ %t2, %bb_omega ], [ -1, %bb_reject ]"
        "Not production LLVM backend"
        "Not full CFG/dominance"
        "SSA-SHAPED"
        "FAIL-CLOSED-UNKNOWN-GRADE"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "production-cfg-deepen:"
        "PRODUCTION-CFG-DEEPEN"
        "not production opt"
        "not full dominance"
        "fixture tip fullBackend"
        "MERGE-PHI-PREDS-FOUR"
        "MULT-SSA-CFG-DUAL-PIN"
      ];
    }
  ];
}
