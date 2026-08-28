# SPDX-License-Identifier: Unlicense
# LLVM Compose SSA lower partial: Lean module + Main + just recipe +
# generator-owned out/llvm-ir/slake_compose_ssa.ll. Local unlock pin false;
# living hold unlock true (hold.nix). Full backend claim stays false.
# Compose-band SSA-shaped IR only (block labels + phi + mint/consume defs).
# Greppable: HOST-LLVM-COMPOSE-SSA, SLAKE_LLVM_COMPOSE_SSA_V0, SSA-SHAPED.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmComposeSsa.lean"
    "src/systems/SystemsLean/LlvmComposeSsaMain.lean"
    "just/llvm-ssa.just"
    "out/llvm-ir/slake_compose_ssa.ll"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmComposeSsa.lean";
      all = [
        "llvmComposeSsaReady"
        "llvmComposeSsaFinishedClaimed"
        "llvmComposeSsaPackageOk"
        "llvmComposeSsaWroteExpected"
        "llvmComposeSsaKeepsLlvmLocked"
        "llvmComposeSsaDoesNotUnlockLlvm"
        "llvmComposeSsaLlvmUnlocked"
        "llvmComposeSsaLocalUnlockFalse"
        "llvmComposeSsaPartialClaimed"
        "llvmComposeSsaFullBackendClaimed"
        "justRecipeLlvmComposeSsa"
        "llvm-compose-ssa"
        "HOST-LLVM-COMPOSE-SSA"
        "SLAKE_LLVM_COMPOSE_SSA_V0"
        "HOST-HOST-LLVM-COMPOSE-SSA"
        "slake_compose_ssa.ll"
        "composeSsaPackage"
        "llvmComposeSsaWrite"
        "IO.FS.writeFile"
        "SSA-SHAPED"
        "HOST_COMPOSE_V0"
        "HOST-COMPOSE"
        "EMPTY-GRAPH-OK"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "SLAKE_IR_PROGRAM_CAP"
        "SLAKE_IR_EDGE_MAX"
        "HostCompose"
        "out/llvm-ir"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmComposeText"
        "LlvmGraphSsa"
        "def llvmComposeSsaFinishedClaimed : Bool := true"
        "def llvmComposeSsaLlvmUnlocked : Bool := false"
        "def llvmComposeSsaPartialClaimed : Bool := true"
        "def llvmComposeSsaFullBackendClaimed : Bool := false"
      ];
      forbidden = [
        "def llvmComposeSsaLlvmUnlocked : Bool := true"
        "def llvmComposeSsaFullBackendClaimed : Bool := true"
        "def llvmComposeSsaCfgProductionClaimed : Bool := true"
      ];
    }
    {
      rel = "out/llvm-ir/slake_compose_ssa.ll";
      all = [
        "SLAKE_LLVM_COMPOSE_SSA_V0"
        "HOST-LLVM-COMPOSE-SSA"
        "HOST_COMPOSE_V0"
        "HOST-COMPOSE"
        "EMPTY-GRAPH-OK"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "SLAKE_IR_PROGRAM_CAP"
        "SLAKE_IR_EDGE_MAX"
        "SSA-SHAPED"
        "phi i32"
        "slake_compose_ssa_mint_status"
        "slake_compose_ssa_consume_status"
        "slake_compose_ssa_kernel_band_ready"
        "slake_compose_ssa_check_fail_closed"
        "slake_compose_ssa_extract_ok_fs"
        "bb_ok"
        "bb_reject"
        "SystemsLean/HostCompose.lean"
        "llvmUnlocked"
        "Not production LLVM backend"
        "Not full CFG/dominance"
      ];
    }
    {
      rel = "just/llvm-ssa.just";
      all = [
        "llvm-compose-ssa:"
        "HOST-LLVM-COMPOSE-SSA"
        "SLAKE_LLVM_COMPOSE_SSA_V0"
      ];
    }
  ];
}
