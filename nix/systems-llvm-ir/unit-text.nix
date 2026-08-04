# SPDX-License-Identifier: Unlicense
# Mult..Graph unit IR text: Lean modules + Main + greppable stage tokens.
# Local text unlock pins stay false; living hold unlock is true (hold.nix).
# Artifact content when present is unit-package.nix (join requires artifacts).
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmMultText.lean"
    "src/systems/SystemsLean/LlvmMultTextMain.lean"
    "src/systems/SystemsLean/LlvmLinearText.lean"
    "src/systems/SystemsLean/LlvmLinearTextMain.lean"
    "src/systems/SystemsLean/LlvmTypesText.lean"
    "src/systems/SystemsLean/LlvmTypesTextMain.lean"
    "src/systems/SystemsLean/LlvmProgramText.lean"
    "src/systems/SystemsLean/LlvmProgramTextMain.lean"
    "src/systems/SystemsLean/LlvmGraphText.lean"
    "src/systems/SystemsLean/LlvmGraphTextMain.lean"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmMultText.lean";
      all = [
        "llvmMultTextReady"
        "llvmMultTextFinishedClaimed"
        "llvmMultTextPackageOk"
        "llvmMultTextWroteExpected"
        "llvmMultTextKeepsLlvmLocked"
        "llvmMultTextDoesNotUnlockLlvm"
        "llvmMultTextLlvmUnlocked"
        "llvmMultTextLocalUnlockFalse"
        "justRecipeLlvmMultText"
        "llvm-mult-text"
        "HOST-LLVM-MULT-TEXT"
        "SLAKE_LLVM_MULT_TEXT_V0"
        "HOST-HOST-LLVM-MULT-TEXT"
        "slake_mult.ll"
        "multIrPackage"
        "llvmMultTextWrite"
        "IO.FS.writeFile"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "out/llvm-ir"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "def llvmMultTextFinishedClaimed : Bool := true"
        "def llvmMultTextLlvmUnlocked : Bool := false"
      ];
      forbidden = [
        "def llvmMultTextLlvmUnlocked : Bool := true"
      ];
    }
    {
      rel = "src/systems/SystemsLean/LlvmLinearText.lean";
      all = [
        "llvmLinearTextReady"
        "llvmLinearTextFinishedClaimed"
        "llvmLinearTextPackageOk"
        "llvmLinearTextWroteExpected"
        "llvmLinearTextKeepsLlvmLocked"
        "llvmLinearTextDoesNotUnlockLlvm"
        "llvmLinearTextLlvmUnlocked"
        "llvmLinearTextLocalUnlockFalse"
        "justRecipeLlvmLinearText"
        "llvm-linear-text"
        "HOST-LLVM-LINEAR-TEXT"
        "SLAKE_LLVM_LINEAR_TEXT_V0"
        "HOST-HOST-LLVM-LINEAR-TEXT"
        "slake_linear.ll"
        "linearIrPackage"
        "llvmLinearTextWrite"
        "IO.FS.writeFile"
        "LINEAR-EXACT-ONCE"
        "LINEAR-AXIOMS-REMAIN"
        "shareNat"
        "polyId"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "out/llvm-ir"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmMultText"
        "def llvmLinearTextFinishedClaimed : Bool := true"
        "def llvmLinearTextLlvmUnlocked : Bool := false"
      ];
      forbidden = [
        "def llvmLinearTextLlvmUnlocked : Bool := true"
      ];
    }
    {
      rel = "src/systems/SystemsLean/LlvmTypesText.lean";
      all = [
        "llvmTypesTextReady"
        "llvmTypesTextFinishedClaimed"
        "llvmTypesTextPackageOk"
        "llvmTypesTextWroteExpected"
        "llvmTypesTextKeepsLlvmLocked"
        "llvmTypesTextDoesNotUnlockLlvm"
        "llvmTypesTextLlvmUnlocked"
        "llvmTypesTextLocalUnlockFalse"
        "justRecipeLlvmTypesText"
        "llvm-types-text"
        "HOST-LLVM-TYPES-TEXT"
        "SLAKE_LLVM_TYPES_TEXT_V0"
        "HOST-HOST-LLVM-TYPES-TEXT"
        "slake_types.ll"
        "typesIrPackage"
        "llvmTypesTextWrite"
        "IO.FS.writeFile"
        "TYPED_IR_V0"
        "FAIL-CLOSED-UNKNOWN-KIND"
        "VALUE"
        "LINEAR"
        "ERASED"
        "kindMultOk"
        "isValidKindTag"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "out/llvm-ir"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmMultText"
        "LlvmLinearText"
        "def llvmTypesTextFinishedClaimed : Bool := true"
        "def llvmTypesTextLlvmUnlocked : Bool := false"
      ];
      forbidden = [
        "def llvmTypesTextLlvmUnlocked : Bool := true"
      ];
    }
    {
      rel = "src/systems/SystemsLean/LlvmProgramText.lean";
      all = [
        "llvmProgramTextReady"
        "llvmProgramTextFinishedClaimed"
        "llvmProgramTextPackageOk"
        "llvmProgramTextWroteExpected"
        "llvmProgramTextKeepsLlvmLocked"
        "llvmProgramTextDoesNotUnlockLlvm"
        "llvmProgramTextLlvmUnlocked"
        "llvmProgramTextLocalUnlockFalse"
        "justRecipeLlvmProgramText"
        "llvm-program-text"
        "HOST-LLVM-PROGRAM-TEXT"
        "SLAKE_LLVM_PROGRAM_TEXT_V0"
        "HOST-HOST-LLVM-PROGRAM-TEXT"
        "slake_program.ll"
        "programIrPackage"
        "llvmProgramTextWrite"
        "IO.FS.writeFile"
        "ORDERED-IR-PROGRAM"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "SLAKE_IR_PROGRAM_CAP"
        "programCap"
        "push"
        "isWellTyped"
        "checkFailClosed"
        "out/llvm-ir"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmMultText"
        "LlvmLinearText"
        "LlvmTypesText"
        "def llvmProgramTextFinishedClaimed : Bool := true"
        "def llvmProgramTextLlvmUnlocked : Bool := false"
      ];
      forbidden = [
        "def llvmProgramTextLlvmUnlocked : Bool := true"
      ];
    }
    {
      rel = "src/systems/SystemsLean/LlvmGraphText.lean";
      all = [
        "llvmGraphTextReady"
        "llvmGraphTextFinishedClaimed"
        "llvmGraphTextPackageOk"
        "llvmGraphTextWroteExpected"
        "llvmGraphTextKeepsLlvmLocked"
        "llvmGraphTextDoesNotUnlockLlvm"
        "llvmGraphTextLlvmUnlocked"
        "llvmGraphTextLocalUnlockFalse"
        "justRecipeLlvmGraphText"
        "llvm-graph-text"
        "HOST-LLVM-GRAPH-TEXT"
        "SLAKE_LLVM_GRAPH_TEXT_V0"
        "HOST-HOST-LLVM-GRAPH-TEXT"
        "slake_graph.ll"
        "graphIrPackage"
        "llvmGraphTextWrite"
        "IO.FS.writeFile"
        "EMPTY-GRAPH-OK"
        "SLAKE_IR_EDGE_MAX"
        "edgeMax"
        "addEdge"
        "pushNode"
        "isWellTyped"
        "checkFailClosed"
        "out/llvm-ir"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmMultText"
        "LlvmLinearText"
        "LlvmTypesText"
        "LlvmProgramText"
        "def llvmGraphTextFinishedClaimed : Bool := true"
        "def llvmGraphTextLlvmUnlocked : Bool := false"
      ];
      forbidden = [
        "def llvmGraphTextLlvmUnlocked : Bool := true"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "llvm-mult-text:"
        "llvm-linear-text:"
        "llvm-types-text:"
        "llvm-program-text:"
        "llvm-graph-text:"
        "llvm-unit-package:"
      ];
    }
  ];
}
