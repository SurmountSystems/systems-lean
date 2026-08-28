# SPDX-License-Identifier: Unlicense
# Mult dominance frontier partial (Full LLVM production backend R1c):
# structural DF table dual-pin for Mult SSA grade_tag diamond in host Lean
# LlvmCfgMultDf (multDominanceFrontierPartial / multDfTable) against
# generator-owned slake_mult_ssa.ll. Not a general DF algorithm.
# llvmCfgFixtureDominanceClaimed stays false. Not production opt.
# Progressive DF partial; fixture tip fullBackend may be true (A-light).
# Greppable: MULT-DOMINANCE-FRONTIER-PARTIAL, multDominanceFrontierPartial,
# mult-dominance-frontier-partial, MULT-DF-TABLE, MULT-DF-MERGE-JOIN.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmCfgMultDf.lean"
    "src/systems/SystemsLean/LlvmCfgHonesty.lean"
    "out/llvm-ir/slake_mult_ssa.ll"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmCfgMultDf.lean";
      all = [
        "multDominanceFrontierPartial"
        "MULT-DOMINANCE-FRONTIER-PARTIAL"
        "multDfTable"
        "MULT-DF-TABLE"
        "multDfMergeIsJoin"
        "MULT-DF-MERGE-JOIN"
        "multDfTableDualPin"
        "MULT-DF-TABLE-DUAL-PIN"
        "justRecipeMultDominanceFrontierPartial"
        "mult-dominance-frontier-partial"
        "bb_mult0:merge"
        "bb_mult1:merge"
        "bb_omega:merge"
        "bb_reject:merge"
        "check1:merge"
        "check2:merge"
        "productionCfgDeepen"
        "def multDominanceFrontierPartial : Bool :="
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
        "theorem multDominanceFrontierPartial_true"
        "theorem llvmCfgFixtureDominanceClaimed_false"
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
        "SSA-SHAPED"
        "FAIL-CLOSED-UNKNOWN-GRADE"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "mult-dominance-frontier-partial:"
        "MULT-DOMINANCE-FRONTIER-PARTIAL"
        "not production opt"
        "not full dominance"
        "fixture tip fullBackend"
        "MULT-DF-TABLE"
        "MULT-DF-MERGE-JOIN"
      ];
    }
  ];
}
