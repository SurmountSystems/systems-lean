# SPDX-License-Identifier: Unlicense
# LLVM IR compose text (Track 2d): Lean module + Main + just recipe +
# generator-owned out/llvm-ir/slake_compose.ll. Local unlock pin false;
# living hold unlock true (hold.nix). Compose is next layer after Mult..Graph
# unit package (not a fifth unit of the same package).
# Greppable: HOST-LLVM-COMPOSE-TEXT, SLAKE_LLVM_COMPOSE_TEXT_V0.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmComposeText.lean"
    "src/systems/SystemsLean/LlvmComposeTextMain.lean"
    "out/llvm-ir/slake_compose.ll"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmComposeText.lean";
      all = [
        "llvmComposeTextReady"
        "llvmComposeTextFinishedClaimed"
        "llvmComposeTextPackageOk"
        "llvmComposeTextWroteExpected"
        "llvmComposeTextKeepsLlvmLocked"
        "llvmComposeTextDoesNotUnlockLlvm"
        "llvmComposeTextLlvmUnlocked"
        "llvmComposeTextLocalUnlockFalse"
        "justRecipeLlvmComposeText"
        "llvm-compose-text"
        "HOST-LLVM-COMPOSE-TEXT"
        "SLAKE_LLVM_COMPOSE_TEXT_V0"
        "HOST-HOST-LLVM-COMPOSE-TEXT"
        "slake_compose.ll"
        "composeIrPackage"
        "llvmComposeTextWrite"
        "IO.FS.writeFile"
        "HOST_COMPOSE_V0"
        "HOST-COMPOSE"
        "ORDERED-IR-PROGRAM"
        "EMPTY-GRAPH-OK"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "SLAKE_IR_PROGRAM_CAP"
        "SLAKE_IR_EDGE_MAX"
        "programCap"
        "edgeMax"
        "mint"
        "consume"
        "markErased"
        "checkFailClosed"
        "extractOkFs"
        "multPreScan"
        "out/llvm-ir"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmMultText"
        "LlvmLinearText"
        "LlvmTypesText"
        "LlvmProgramText"
        "LlvmGraphText"
        "HostCompose"
        "def llvmComposeTextFinishedClaimed : Bool := true"
        "def llvmComposeTextLlvmUnlocked : Bool := false"
      ];
      forbidden = [
        "def llvmComposeTextLlvmUnlocked : Bool := true"
      ];
    }
    {
      rel = "out/llvm-ir/slake_compose.ll";
      all = [
        "SLAKE_LLVM_COMPOSE_TEXT_V0"
        "HOST-LLVM-COMPOSE-TEXT"
        "HOST_COMPOSE_V0"
        "HOST-COMPOSE"
        "ORDERED-IR-PROGRAM"
        "EMPTY-GRAPH-OK"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "SLAKE_IR_PROGRAM_CAP"
        "SLAKE_IR_EDGE_MAX"
        "mint"
        "consume"
        "markErased"
        "checkFailClosed"
        "extractOkFs"
        "multPreScan"
        "slake_compose_program_cap"
        "slake_compose_edge_max"
        "slake_compose_is_well_typed_empty"
        "slake_compose_check_fail_closed_empty"
        "slake_compose_extract_ok_fs_empty"
        "slake_compose_mint_id"
        "slake_compose_consume_live"
        "slake_compose_check_fail_closed"
        "slake_compose_extract_ok_fs"
        "SystemsLean/HostCompose.lean"
        "SystemsLean/IrProgram.lean"
        "SystemsLean/IrGraph.lean"
        "llvmUnlocked"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "llvm-compose-text:"
      ];
    }
  ];
}
