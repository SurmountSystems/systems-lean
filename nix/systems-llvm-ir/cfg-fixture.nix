# SPDX-License-Identifier: Unlicense
# Mult CFG + dominance fixture (A3): Lean host structural model only.
# Long-file split: honesty pins in LlvmCfgHonesty; production in role modules;
# join surface ready in LlvmCfgFixture. Option A-light: fullBackend tip true;
# production opt false; dominance pipeline claim false.
# Greppable: HOST-LLVM-CFG-FIXTURE, SLAKE_LLVM_CFG_FIXTURE_V0, MULT-CFG-FIXTURE.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmCfgFixture.lean"
    "src/systems/SystemsLean/LlvmCfgHonesty.lean"
    "src/systems/SystemsLean/LlvmCfgMultProduction.lean"
    "src/systems/SystemsLean/LlvmCfgMultDf.lean"
    "src/systems/SystemsLean/LlvmCfgUnitDf.lean"
    "src/systems/SystemsLean/LlvmCfgUnitProduction.lean"
    "src/systems/SystemsLean/LlvmCfgGeneral.lean"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmCfgHonesty.lean";
      all = [
        "llvmCfgFixtureFinishedClaimed"
        "llvmCfgFixturePartialClaimed"
        "llvmCfgFixtureFullBackendClaimed"
        "llvmCfgFixtureProductionOptClaimed"
        "llvmCfgFixtureDominanceClaimed"
        "dominancePipelineRequiredForFullBackend"
        "HOST-LLVM-CFG-FIXTURE"
        "SLAKE_LLVM_CFG_FIXTURE_V0"
        "MULT-CFG-FIXTURE"
        "ORDERED-IR-PROGRAM"
        "SSA-SHAPED"
        "def llvmCfgFixtureFinishedClaimed : Bool := true"
        "def llvmCfgFixtureLlvmUnlocked : Bool := false"
        "def llvmCfgFixturePartialClaimed : Bool := true"
        "def llvmCfgFixtureFullBackendClaimed : Bool := true"
        "def llvmCfgFixtureProductionOptClaimed : Bool := false"
        "def llvmCfgFixtureDominanceClaimed : Bool := false"
        "def dominancePipelineRequiredForFullBackend : Bool := false"
      ];
      forbidden = [
        "def llvmCfgFixtureLlvmUnlocked : Bool := true"
        "def llvmCfgFixtureFullBackendClaimed : Bool := false"
        "def llvmCfgFixtureProductionOptClaimed : Bool := true"
        "def llvmCfgFixtureDominanceClaimed : Bool := true"
        "def dominancePipelineRequiredForFullBackend : Bool := true"
      ];
    }
    {
      rel = "src/systems/SystemsLean/LlvmCfgFixture.lean";
      all = [
        "llvmCfgFixtureReady"
        "llvmCfgFixturePackageOk"
        "HOST-LLVM-CFG-FIXTURE"
        "SLAKE_LLVM_CFG_FIXTURE_V0"
        "entryDominatesAll"
        "mergePredsOnlyAcceptReject"
        "acceptRejectReachableFromEntry"
        "cfgDeepenPartial"
        "CFG-DEEPEN-PARTIAL"
        "CFG-MERGE-PREDS"
        "LlvmMultSsa"
        "LlvmCfgHonesty"
        "LlvmCfgMultProduction"
        "LlvmCfgMultDf"
        "LlvmCfgUnitDf"
        "LlvmCfgUnitProduction"
        "LlvmCfgGeneral"
        "multiUnitDominanceFrontierDeepen"
        "generalCfgConstructionPartial"
        "iterativeCfgConstructionPartial"
        "productionCfgUnitDiamondsOnlyHonesty"
        "fullLlvmBarEvidencePartial"
        "dominancePipelineRequiredForFullBackend"
        "&& llvmCfgFixtureFullBackendClaimed"
        "theorem fullLlvmBarEvidencePartial_true"
        "theorem iterativeCfgConstructionPartial_true"
        "theorem llvmCfgFixtureFullBackendClaimed_true"
        "theorem llvmCfgFixturePackageOk_true"
        "theorem llvmCfgFixtureDominanceClaimed_false"
        "theorem dominancePipelineRequiredForFullBackend_false"
      ];
      forbidden = [
        "def llvmCfgFixtureFullBackendClaimed : Bool := false"
        "def llvmCfgFixtureProductionOptClaimed : Bool := true"
        "def llvmCfgFixtureDominanceClaimed : Bool := true"
        "def dominancePipelineRequiredForFullBackend : Bool := true"
      ];
    }
  ];
}
