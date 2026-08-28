# SPDX-License-Identifier: Unlicense
# Types SSA CFG production dual-pin (Full LLVM production backend R1b):
# multi-unit Mult+Linear+Types production CFG beyond Mult+Linear
# multiUnitCfgProductionDeepen. Host Lean LlvmCfgUnitProduction
# typesCfgProductionDeepen / multiUnitCfgProductionDeepenTypes against
# generator-owned slake_types_ssa.ll.
# Not full dominance pipeline. Not production opt. Not full LLVM backend claim true.
# Greppable: TYPES-CFG-PRODUCTION-DEEPEN, MULTI-UNIT-CFG-PRODUCTION-DEEPEN-TYPES,
# types-cfg-production-deepen, TYPES-SSA-CFG-DUAL-PIN, TYPES-MERGE-PHI-PREDS-FOUR.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmCfgUnitProduction.lean"
    "src/systems/SystemsLean/LlvmCfgHonesty.lean"
    "out/llvm-ir/slake_types_ssa.ll"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmCfgUnitProduction.lean";
      all = [
        "typesCfgProductionDeepen"
        "TYPES-CFG-PRODUCTION-DEEPEN"
        "multiUnitCfgProductionDeepenTypes"
        "MULTI-UNIT-CFG-PRODUCTION-DEEPEN-TYPES"
        "typesSsaCfgBlocks"
        "typesSsaCfgEdges"
        "typesProductionIdomTable"
        "TYPES-PRODUCTION-IDOM"
        "typesMergeIdomIsEntry"
        "TYPES-MERGE-IDOM-ENTRY"
        "typesMergePhiPredsFour"
        "TYPES-MERGE-PHI-PREDS-FOUR"
        "typesSsaCfgDualPin"
        "TYPES-SSA-CFG-DUAL-PIN"
        "justRecipeTypesCfgProductionDeepen"
        "types-cfg-production-deepen"
        "bb_value"
        "bb_erased"
        "LlvmTypesSsa"
        "def typesCfgProductionDeepen : Bool :="
        "def multiUnitCfgProductionDeepenTypes : Bool :="
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
      rel = "out/llvm-ir/slake_types_ssa.ll";
      all = [
        "slake_types_ssa_kind_tag"
        "bb_value"
        "bb_linear"
        "bb_erased"
        "bb_reject"
        "check1"
        "check2"
        "merge:"
        "phi i32 [ %t0, %bb_value ], [ %t1, %bb_linear ], [ %t2, %bb_erased ], [ -1, %bb_reject ]"
        "Not production LLVM backend"
        "Not full CFG/dominance"
        "SSA-SHAPED"
        "FAIL-CLOSED-UNKNOWN-KIND"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "types-cfg-production-deepen:"
        "TYPES-CFG-PRODUCTION-DEEPEN"
        "MULTI-UNIT-CFG-PRODUCTION-DEEPEN-TYPES"
        "fixture tip fullBackend"
        "not production opt"
        "not full dominance"
        "TYPES-MERGE-PHI-PREDS-FOUR"
        "TYPES-SSA-CFG-DUAL-PIN"
      ];
    }
  ];
}
