# SPDX-License-Identifier: Unlicense
# General program CFG construction posture beyond five unit diamonds:
# multi-unit compose chain + multi-merge inventory in LlvmCfgGeneral dual-pinned
# to Mult..Graph production CFG readiness. Not a full CFG builder over arbitrary IR.
# Progressive partial independent of tip fullBackend (A-light tip true).
# Production opt / DominanceClaimed stay false.
# Greppable: GENERAL-CFG-CONSTRUCTION-PARTIAL, generalCfgConstructionPartial,
# general-program-cfg-partial, productionCfgUnitDiamondsOnlyClaimed.
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
        "generalCfgConstructionPartial"
        "GENERAL-CFG-CONSTRUCTION-PARTIAL"
        "generalCfgUnitRoots"
        "GENERAL-CFG-UNIT-ROOTS"
        "generalCfgComposeEdges"
        "GENERAL-CFG-COMPOSE-EDGES"
        "generalCfgMultiMergeTable"
        "GENERAL-CFG-MULTI-MERGE"
        "generalCfgDualPin"
        "GENERAL-CFG-DUAL-PIN"
        "justRecipeGeneralProgramCfgPartial"
        "general-program-cfg-partial"
        "productionCfgUnitDiamondsOnlyClaimed"
        "UNIT-DIAMONDS-ONLY"
        "fullLlvmBarEvidencePartial"
        "FULL-LLVM-BAR-EVIDENCE-PARTIAL"
        "def generalCfgConstructionPartial : Bool :="
        "def productionCfgUnitDiamondsOnlyClaimed : Bool := false"
        "def fullLlvmBarEvidencePartial : Bool :="
        "!llvmCfgFixtureDominanceClaimed"
        "dominancePipelineRequiredForFullBackend"
        "compose:exit"
        "mult:grade_tag->linear:live_flag"
      ];
      forbidden = [
        "def productionCfgUnitDiamondsOnlyClaimed : Bool := true"
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
        "theorem generalCfgConstructionPartial_true"
        "theorem productionCfgUnitDiamondsOnlyClaimed_false"
        "theorem fullLlvmBarEvidencePartial_true"
        "theorem dominancePipelineRequiredForFullBackend_false"
        "generalCfgConstructionPartial"
        "fullLlvmBarEvidencePartial"
      ];
      forbidden = [ ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "general-program-cfg-partial:"
        "GENERAL-CFG-CONSTRUCTION-PARTIAL"
        "not production opt"
        "not full dominance"
        "fixture tip fullBackend"
        "UNIT-DIAMONDS-ONLY"
        "generalCfgConstructionPartial"
        "fullLlvmBarEvidencePartial"
        "FULL-LLVM-BAR-EVIDENCE-PARTIAL"
      ];
    }
  ];
}
