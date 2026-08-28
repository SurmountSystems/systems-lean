# SPDX-License-Identifier: Unlicense
# LLVM Linear SSA lower partial: Lean module + Main + just recipe +
# generator-owned out/llvm-ir/slake_linear_ssa.ll. Local unlock pin false;
# living hold unlock true (hold.nix). Full backend claim stays false.
# Linear-band SSA-shaped IR only (block labels + phi + ordered kernel defs).
# Greppable: HOST-LLVM-LINEAR-SSA, SLAKE_LLVM_LINEAR_SSA_V0, SSA-SHAPED.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmLinearSsa.lean"
    "src/systems/SystemsLean/LlvmLinearSsaMain.lean"
    "out/llvm-ir/slake_linear_ssa.ll"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmLinearSsa.lean";
      all = [
        "llvmLinearSsaReady"
        "llvmLinearSsaFinishedClaimed"
        "llvmLinearSsaPackageOk"
        "llvmLinearSsaWroteExpected"
        "llvmLinearSsaKeepsLlvmLocked"
        "llvmLinearSsaDoesNotUnlockLlvm"
        "llvmLinearSsaLlvmUnlocked"
        "llvmLinearSsaLocalUnlockFalse"
        "llvmLinearSsaPartialClaimed"
        "llvmLinearSsaFullBackendClaimed"
        "justRecipeLlvmLinearSsa"
        "llvm-linear-ssa"
        "HOST-LLVM-LINEAR-SSA"
        "SLAKE_LLVM_LINEAR_SSA_V0"
        "HOST-HOST-LLVM-LINEAR-SSA"
        "slake_linear_ssa.ll"
        "linearSsaPackage"
        "llvmLinearSsaWrite"
        "IO.FS.writeFile"
        "SSA-SHAPED"
        "SELF-HOST-KERNEL-LINEAR"
        "ORDERED-IR-PROGRAM"
        "LINEAR-EXACT-ONCE"
        "MULT-1"
        "KernelLinear"
        "out/llvm-ir"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmLinearText"
        "LlvmMultSsa"
        "def llvmLinearSsaFinishedClaimed : Bool := true"
        "def llvmLinearSsaLlvmUnlocked : Bool := false"
        "def llvmLinearSsaPartialClaimed : Bool := true"
        "def llvmLinearSsaFullBackendClaimed : Bool := false"
      ];
      forbidden = [
        "def llvmLinearSsaLlvmUnlocked : Bool := true"
        "def llvmLinearSsaFullBackendClaimed : Bool := true"
        "def llvmLinearSsaCfgProductionClaimed : Bool := true"
      ];
    }
    {
      rel = "out/llvm-ir/slake_linear_ssa.ll";
      all = [
        "SLAKE_LLVM_LINEAR_SSA_V0"
        "HOST-LLVM-LINEAR-SSA"
        "MULT-1"
        "LINEAR-EXACT-ONCE"
        "SELF-HOST-KERNEL-LINEAR"
        "ORDERED-IR-PROGRAM"
        "SSA-SHAPED"
        "phi i32"
        "slake_linear_ssa_live_flag"
        "slake_linear_ssa_kernel_band_ready"
        "slake_linear_ssa_is_live"
        "slake_linear_ssa_tag_1"
        "bb_live"
        "bb_reject"
        "SystemsLean/KernelLinear.lean"
        "SystemsLean/Linear.lean"
        "llvmUnlocked"
        "Not production LLVM backend"
        "Not full CFG/dominance"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "llvm-linear-ssa:"
        "HOST-LLVM-LINEAR-SSA"
        "SLAKE_LLVM_LINEAR_SSA_V0"
      ];
    }
  ];
}
