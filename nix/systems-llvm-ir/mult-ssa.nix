# SPDX-License-Identifier: Unlicense
# LLVM Mult SSA lower partial (Phase L): Lean module + Main + just recipe +
# generator-owned out/llvm-ir/slake_mult_ssa.ll. Local unlock pin false;
# living hold unlock true (hold.nix). Full backend claim stays false.
# Mult-band SSA-shaped IR only (block labels + phi + ordered kernel defs).
# Greppable: HOST-LLVM-MULT-SSA, SLAKE_LLVM_MULT_SSA_V0, SSA-SHAPED.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmMultSsa.lean"
    "src/systems/SystemsLean/LlvmMultSsaMain.lean"
    "out/llvm-ir/slake_mult_ssa.ll"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmMultSsa.lean";
      all = [
        "llvmMultSsaReady"
        "llvmMultSsaFinishedClaimed"
        "llvmMultSsaPackageOk"
        "llvmMultSsaWroteExpected"
        "llvmMultSsaKeepsLlvmLocked"
        "llvmMultSsaDoesNotUnlockLlvm"
        "llvmMultSsaLlvmUnlocked"
        "llvmMultSsaLocalUnlockFalse"
        "llvmMultSsaPartialClaimed"
        "llvmMultSsaFullBackendClaimed"
        "justRecipeLlvmMultSsa"
        "llvm-mult-ssa"
        "HOST-LLVM-MULT-SSA"
        "SLAKE_LLVM_MULT_SSA_V0"
        "HOST-HOST-LLVM-MULT-SSA"
        "slake_mult_ssa.ll"
        "multSsaPackage"
        "llvmMultSsaWrite"
        "IO.FS.writeFile"
        "SSA-SHAPED"
        "SELF-HOST-KERNEL-MULT"
        "ORDERED-IR-PROGRAM"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "KernelMult"
        "out/llvm-ir"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmMultText"
        "def llvmMultSsaFinishedClaimed : Bool := true"
        "def llvmMultSsaLlvmUnlocked : Bool := false"
        "def llvmMultSsaPartialClaimed : Bool := true"
        "def llvmMultSsaFullBackendClaimed : Bool := false"
      ];
      forbidden = [
        "def llvmMultSsaLlvmUnlocked : Bool := true"
        "def llvmMultSsaFullBackendClaimed : Bool := true"
        "def llvmMultSsaCfgProductionClaimed : Bool := true"
      ];
    }
    {
      rel = "out/llvm-ir/slake_mult_ssa.ll";
      all = [
        "SLAKE_LLVM_MULT_SSA_V0"
        "HOST-LLVM-MULT-SSA"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "SELF-HOST-KERNEL-MULT"
        "ORDERED-IR-PROGRAM"
        "SSA-SHAPED"
        "phi i32"
        "slake_mult_ssa_grade_tag"
        "slake_mult_ssa_kernel_band_ready"
        "slake_mult_ssa_is_valid_tag"
        "slake_mult_ssa_tag_0"
        "slake_mult_ssa_tag_1"
        "slake_mult_ssa_tag_omega"
        "bb_mult0"
        "bb_mult1"
        "bb_omega"
        "bb_reject"
        "SystemsLean/KernelMult.lean"
        "SystemsLean/Mult.lean"
        "llvmUnlocked"
        "Not production LLVM backend"
        "Not full CFG/dominance"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "llvm-mult-ssa:"
        "HOST-LLVM-MULT-SSA"
        "SLAKE_LLVM_MULT_SSA_V0"
      ];
    }
  ];
}
