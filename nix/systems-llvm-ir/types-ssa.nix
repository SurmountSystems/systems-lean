# SPDX-License-Identifier: Unlicense
# LLVM Types SSA lower partial: Lean module + Main + just recipe +
# generator-owned out/llvm-ir/slake_types_ssa.ll. Local unlock pin false;
# living hold unlock true (hold.nix). Full backend claim stays false.
# Types-band SSA-shaped IR only (block labels + phi + ordered kernel defs).
# Greppable: HOST-LLVM-TYPES-SSA, SLAKE_LLVM_TYPES_SSA_V0, SSA-SHAPED.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmTypesSsa.lean"
    "src/systems/SystemsLean/LlvmTypesSsaMain.lean"
    "out/llvm-ir/slake_types_ssa.ll"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmTypesSsa.lean";
      all = [
        "llvmTypesSsaReady"
        "llvmTypesSsaFinishedClaimed"
        "llvmTypesSsaPackageOk"
        "llvmTypesSsaWroteExpected"
        "llvmTypesSsaKeepsLlvmLocked"
        "llvmTypesSsaDoesNotUnlockLlvm"
        "llvmTypesSsaLlvmUnlocked"
        "llvmTypesSsaLocalUnlockFalse"
        "llvmTypesSsaPartialClaimed"
        "llvmTypesSsaFullBackendClaimed"
        "justRecipeLlvmTypesSsa"
        "llvm-types-ssa"
        "HOST-LLVM-TYPES-SSA"
        "SLAKE_LLVM_TYPES_SSA_V0"
        "HOST-HOST-LLVM-TYPES-SSA"
        "slake_types_ssa.ll"
        "typesSsaPackage"
        "llvmTypesSsaWrite"
        "IO.FS.writeFile"
        "SSA-SHAPED"
        "SELF-HOST-KERNEL-TYPES"
        "ORDERED-IR-PROGRAM"
        "TYPED_IR_V0"
        "FAIL-CLOSED-UNKNOWN-KIND"
        "KernelTypes"
        "out/llvm-ir"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmTypesText"
        "LlvmLinearSsa"
        "LlvmMultSsa"
        "def llvmTypesSsaFinishedClaimed : Bool := true"
        "def llvmTypesSsaLlvmUnlocked : Bool := false"
        "def llvmTypesSsaPartialClaimed : Bool := true"
        "def llvmTypesSsaFullBackendClaimed : Bool := false"
      ];
      forbidden = [
        "def llvmTypesSsaLlvmUnlocked : Bool := true"
        "def llvmTypesSsaFullBackendClaimed : Bool := true"
        "def llvmTypesSsaCfgProductionClaimed : Bool := true"
      ];
    }
    {
      rel = "out/llvm-ir/slake_types_ssa.ll";
      all = [
        "SLAKE_LLVM_TYPES_SSA_V0"
        "HOST-LLVM-TYPES-SSA"
        "TYPED_IR_V0"
        "FAIL-CLOSED-UNKNOWN-KIND"
        "VALUE"
        "LINEAR"
        "ERASED"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "SELF-HOST-KERNEL-TYPES"
        "ORDERED-IR-PROGRAM"
        "SSA-SHAPED"
        "phi i32"
        "slake_types_ssa_kind_tag"
        "slake_types_ssa_kernel_band_ready"
        "slake_types_ssa_is_valid_kind"
        "slake_types_ssa_kind_value"
        "bb_value"
        "bb_linear"
        "bb_erased"
        "bb_reject"
        "SystemsLean/KernelTypes.lean"
        "SystemsLean/Types.lean"
        "llvmUnlocked"
        "Not production LLVM backend"
        "Not full CFG/dominance"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "llvm-types-ssa:"
        "HOST-LLVM-TYPES-SSA"
        "SLAKE_LLVM_TYPES_SSA_V0"
      ];
    }
  ];
}
