# SPDX-License-Identifier: Unlicense
# Mult dominance frontier deepen (heavier-LLVM Mult DF algorithm slice):
# Cytron-style DF over Mult SSA edges + production idom table in host Lean
# LlvmCfgMultDf (multDominanceFrontierDeepen / multDfComputed / multDfAlgorithmOk)
# dual-pinned to structural multDfTable. Mult-band fixed diamond only.
# llvmCfgFixtureDominanceClaimed stays false (not multi-unit full DF pipeline).
# Not production opt. Not band FullBackend true.
# Greppable: MULT-DOMINANCE-FRONTIER-DEEPEN, multDominanceFrontierDeepen,
# mult-dominance-frontier-deepen, MULT-DF-COMPUTED, MULT-DF-ALGORITHM-OK,
# MULT-DF-CYTRON.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmCfgMultDf.lean"
    "src/systems/SystemsLean/LlvmCfgHonesty.lean"
    "src/systems/SystemsLean/LlvmCfgFixture.lean"
    "out/llvm-ir/slake_mult_ssa.ll"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmCfgMultDf.lean";
      all = [
        "multDominanceFrontierDeepen"
        "MULT-DOMINANCE-FRONTIER-DEEPEN"
        "multDfComputed"
        "MULT-DF-COMPUTED"
        "multDfAlgorithmOk"
        "MULT-DF-ALGORITHM-OK"
        "multDfCytronFromJoin"
        "MULT-DF-CYTRON"
        "multDfWalkRunner"
        "multDfPredsOf"
        "multDfIdomOf"
        "justRecipeMultDominanceFrontierDeepen"
        "mult-dominance-frontier-deepen"
        "def multDominanceFrontierDeepen : Bool :="
        "multDominanceFrontierPartial"
        "multDfAlgorithmOk"
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
        "theorem multDominanceFrontierDeepen_true"
        "theorem multDfAlgorithmOk_true"
        "theorem llvmCfgFixtureDominanceClaimed_false"
        "multDominanceFrontierDeepen"
      ];
      forbidden = [ ];
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
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "mult-dominance-frontier-deepen:"
        "MULT-DOMINANCE-FRONTIER-DEEPEN"
        "MULT-DF-COMPUTED"
        "MULT-DF-ALGORITHM-OK"
        "not production opt"
        "not full dominance"
        "fixture tip fullBackend"
      ];
    }
  ];
}
