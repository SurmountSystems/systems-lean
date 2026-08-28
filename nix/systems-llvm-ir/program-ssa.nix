# SPDX-License-Identifier: Unlicense
# LLVM Program SSA lower partial: Lean module + Main + just recipe +
# generator-owned out/llvm-ir/slake_program_ssa.ll. Local unlock pin false;
# living hold unlock true (hold.nix). Full backend claim stays false.
# Program-band SSA-shaped IR only (block labels + phi + ordered kernel defs).
# Greppable: HOST-LLVM-PROGRAM-SSA, SLAKE_LLVM_PROGRAM_SSA_V0, SSA-SHAPED.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmProgramSsa.lean"
    "src/systems/SystemsLean/LlvmProgramSsaMain.lean"
    "out/llvm-ir/slake_program_ssa.ll"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmProgramSsa.lean";
      all = [
        "llvmProgramSsaReady"
        "llvmProgramSsaFinishedClaimed"
        "llvmProgramSsaPackageOk"
        "llvmProgramSsaWroteExpected"
        "llvmProgramSsaKeepsLlvmLocked"
        "llvmProgramSsaDoesNotUnlockLlvm"
        "llvmProgramSsaLlvmUnlocked"
        "llvmProgramSsaLocalUnlockFalse"
        "llvmProgramSsaPartialClaimed"
        "llvmProgramSsaFullBackendClaimed"
        "justRecipeLlvmProgramSsa"
        "llvm-program-ssa"
        "HOST-LLVM-PROGRAM-SSA"
        "SLAKE_LLVM_PROGRAM_SSA_V0"
        "HOST-HOST-LLVM-PROGRAM-SSA"
        "slake_program_ssa.ll"
        "programSsaPackage"
        "llvmProgramSsaWrite"
        "IO.FS.writeFile"
        "SSA-SHAPED"
        "SELF-HOST-KERNEL-PROGRAM"
        "ORDERED-IR-PROGRAM"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "SLAKE_IR_PROGRAM_CAP"
        "KernelProgram"
        "out/llvm-ir"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmProgramText"
        "LlvmTypesSsa"
        "LlvmLinearSsa"
        "LlvmMultSsa"
        "def llvmProgramSsaFinishedClaimed : Bool := true"
        "def llvmProgramSsaLlvmUnlocked : Bool := false"
        "def llvmProgramSsaPartialClaimed : Bool := true"
        "def llvmProgramSsaFullBackendClaimed : Bool := false"
      ];
      forbidden = [
        "def llvmProgramSsaLlvmUnlocked : Bool := true"
        "def llvmProgramSsaFullBackendClaimed : Bool := true"
        "def llvmProgramSsaCfgProductionClaimed : Bool := true"
      ];
    }
    {
      rel = "out/llvm-ir/slake_program_ssa.ll";
      all = [
        "SLAKE_LLVM_PROGRAM_SSA_V0"
        "HOST-LLVM-PROGRAM-SSA"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "SLAKE_IR_PROGRAM_CAP"
        "VALUE"
        "LINEAR"
        "ERASED"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "SELF-HOST-KERNEL-PROGRAM"
        "ORDERED-IR-PROGRAM"
        "SSA-SHAPED"
        "phi i32"
        "slake_program_ssa_push_status"
        "slake_program_ssa_kernel_band_ready"
        "slake_program_ssa_is_well_typed"
        "slake_program_ssa_cap"
        "bb_ok"
        "bb_bad"
        "bb_full"
        "bb_reject"
        "SystemsLean/KernelProgram.lean"
        "SystemsLean/IrProgram.lean"
        "llvmUnlocked"
        "Not production LLVM backend"
        "Not full CFG/dominance"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "llvm-program-ssa:"
        "HOST-LLVM-PROGRAM-SSA"
        "SLAKE_LLVM_PROGRAM_SSA_V0"
      ];
    }
  ];
}
