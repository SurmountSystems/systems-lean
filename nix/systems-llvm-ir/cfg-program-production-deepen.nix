# SPDX-License-Identifier: Unlicense
# Program SSA CFG production dual-pin (Full LLVM production backend R1d):
# multi-unit Mult+Linear+Types+Program production CFG beyond
# multiUnitCfgProductionDeepenTypes. Host Lean LlvmCfgUnitProduction
# programCfgProductionDeepen / multiUnitCfgProductionDeepenProgram against
# generator-owned slake_program_ssa.ll.
# Not full dominance pipeline. Not production opt. Not full LLVM backend claim true.
# Greppable: PROGRAM-CFG-PRODUCTION-DEEPEN, MULTI-UNIT-CFG-PRODUCTION-DEEPEN-PROGRAM,
# program-cfg-production-deepen, PROGRAM-SSA-CFG-DUAL-PIN, PROGRAM-MERGE-PHI-PREDS-FOUR.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmCfgUnitProduction.lean"
    "src/systems/SystemsLean/LlvmCfgHonesty.lean"
    "out/llvm-ir/slake_program_ssa.ll"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmCfgUnitProduction.lean";
      all = [
        "programCfgProductionDeepen"
        "PROGRAM-CFG-PRODUCTION-DEEPEN"
        "multiUnitCfgProductionDeepenProgram"
        "MULTI-UNIT-CFG-PRODUCTION-DEEPEN-PROGRAM"
        "programSsaCfgBlocks"
        "programSsaCfgEdges"
        "programProductionIdomTable"
        "PROGRAM-PRODUCTION-IDOM"
        "programMergeIdomIsEntry"
        "PROGRAM-MERGE-IDOM-ENTRY"
        "programMergePhiPredsFour"
        "PROGRAM-MERGE-PHI-PREDS-FOUR"
        "programSsaCfgDualPin"
        "PROGRAM-SSA-CFG-DUAL-PIN"
        "justRecipeProgramCfgProductionDeepen"
        "program-cfg-production-deepen"
        "bb_ok"
        "bb_bad"
        "bb_full"
        "LlvmProgramSsa"
        "def programCfgProductionDeepen : Bool :="
        "def multiUnitCfgProductionDeepenProgram : Bool :="
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
      rel = "out/llvm-ir/slake_program_ssa.ll";
      all = [
        "slake_program_ssa_push_status"
        "bb_ok"
        "bb_bad"
        "bb_full"
        "bb_reject"
        "check1"
        "check2"
        "merge:"
        "phi i32 [ %t0, %bb_ok ], [ %t1, %bb_bad ], [ %t2, %bb_full ], [ -3, %bb_reject ]"
        "Not production LLVM backend"
        "Not full CFG/dominance"
        "SSA-SHAPED"
        "EMPTY-PROGRAM-FAIL-CLOSED"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "program-cfg-production-deepen:"
        "PROGRAM-CFG-PRODUCTION-DEEPEN"
        "MULTI-UNIT-CFG-PRODUCTION-DEEPEN-PROGRAM"
        "fixture tip fullBackend"
        "not production opt"
        "not full dominance"
        "PROGRAM-MERGE-PHI-PREDS-FOUR"
        "PROGRAM-SSA-CFG-DUAL-PIN"
      ];
    }
  ];
}
