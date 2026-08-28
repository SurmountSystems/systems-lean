# SPDX-License-Identifier: Unlicense
# Iterative CFG construction partial: walk multi-node ordered IR program /
# IrGraph edges (KernelProgram three-node chain) to build CFG blocks/edges.
# Beyond fixed unit diamonds and fixed compose multi-merge inventory.
# Progressive partial independent of tip fullBackend (A-light tip true).
# Production opt / DominanceClaimed stay false.
# Greppable: ITERATIVE-CFG, iterativeCfgConstructionPartial,
# iterative-cfg-construction-partial, ITERATIVE-CFG-CONSTRUCTION-PARTIAL.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmCfgGeneral.lean"
    "src/systems/SystemsLean/LlvmCfgHonesty.lean"
    "src/systems/SystemsLean/LlvmCfgFixture.lean"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmCfgGeneral.lean";
      all = [
        "iterativeCfgConstructionPartial"
        "ITERATIVE-CFG-CONSTRUCTION-PARTIAL"
        "ITERATIVE-CFG"
        "iterativeCfgBlocksFromProgram"
        "ITERATIVE-CFG-BLOCKS-FROM-PROGRAM"
        "iterativeCfgEdgesFromGraph"
        "ITERATIVE-CFG-EDGES-FROM-GRAPH"
        "iterativeCfgFixtureGraph"
        "ITERATIVE-CFG-FIXTURE-GRAPH"
        "iterativeCfgWalkOk"
        "ITERATIVE-CFG-WALK-OK"
        "iterativeCfgDualPin"
        "ITERATIVE-CFG-DUAL-PIN"
        "iterativeCfgExpectedBlocks"
        "iterativeCfgExpectedEdges"
        "justRecipeIterativeCfgConstructionPartial"
        "iterative-cfg-construction-partial"
        "KernelProgram.lowerProgramGraph"
        "n0:ERASED"
        "n1:LINEAR"
        "n2:VALUE"
        "n0->n1"
        "n1->n2"
        "def iterativeCfgConstructionPartial : Bool :="
        "!llvmCfgFixtureDominanceClaimed"
        "iterativeCfgConstructionPartial"
        "fullLlvmBarEvidencePartial"
        "dominancePipelineRequiredForFullBackend"
      ];
      forbidden = [
        "def llvmCfgFixtureDominanceClaimed : Bool := true"
        "def llvmCfgFixtureProductionOptClaimed : Bool := true"
      ];
    }
    {
      rel = "src/systems/SystemsLean/LlvmCfgHonesty.lean";
      all = [
        "def llvmCfgFixtureFullBackendClaimed : Bool := true"
        "def llvmCfgFixtureProductionOptClaimed : Bool := false"
        "def llvmCfgFixtureDominanceClaimed : Bool := false"
        "def dominancePipelineRequiredForFullBackend : Bool := false"
      ];
      forbidden = [
        "def llvmCfgFixtureFullBackendClaimed : Bool := false"
        "def llvmCfgFixtureProductionOptClaimed : Bool := true"
        "def llvmCfgFixtureDominanceClaimed : Bool := true"
        "def dominancePipelineRequiredForFullBackend : Bool := true"
      ];
    }
    {
      rel = "src/systems/SystemsLean/LlvmCfgFixture.lean";
      all = [
        "theorem iterativeCfgConstructionPartial_true"
        "theorem iterativeCfgWalkOk_true"
        "theorem fullLlvmBarEvidencePartial_true"
        "theorem dominancePipelineRequiredForFullBackend_false"
        "iterativeCfgConstructionPartial"
        "fullLlvmBarEvidencePartial"
        "justRecipeIterativeCfgConstructionPartial"
      ];
      forbidden = [ ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "iterative-cfg-construction-partial:"
        "ITERATIVE-CFG-CONSTRUCTION-PARTIAL"
        "ITERATIVE-CFG"
        "iterativeCfgConstructionPartial"
        "not production opt"
        "not full dominance"
        "fixture tip fullBackend"
      ];
    }
  ];
}
