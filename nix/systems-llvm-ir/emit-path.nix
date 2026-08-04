# SPDX-License-Identifier: Unlicense
# LLVM IR emit-path first residual: design note + measured stub + Lean pins.
# Static only (no lake). Greppable: HOST-LLVM-EMIT-PATH, SLAKE_LLVM_EMIT_PATH_V0.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmEmitPath.lean"
    "out/llvm-ir/MEASURED-STUB.txt"
    "out/llvm-ir/README.md"
    "doc/dev/research/llvm-ir-emit-path-2026-08-02.md"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmEmitPath.lean";
      all = [
        "llvmEmitPathReady"
        "llvmEmitPathFinishedClaimed"
        "llvmEmitPathDesignLanded"
        "llvmEmitPathStubLanded"
        "llvmEmitPathKeepsLlvmLocked"
        "llvmEmitPathDoesNotUnlockLlvm"
        "llvmEmitPathLlvmUnlocked"
        "llvmEmitPathLocalUnlockFalse"
        "justRecipeLlvmEmitPath"
        "llvm-emit-path"
        "HOST-LLVM-EMIT-PATH"
        "SLAKE_LLVM_EMIT_PATH_V0"
        "HOST-HOST-LLVM-EMIT-PATH"
        "MEASURED-STUB"
        "out/llvm-ir"
        "LlvmHold"
        "llvmUnlocked"
        "def llvmEmitPathFinishedClaimed : Bool := true"
        "def llvmEmitPathDesignLanded : Bool := true"
        "def llvmEmitPathStubLanded : Bool := true"
        "def llvmEmitPathLlvmUnlocked : Bool := false"
      ];
      forbidden = [
        "def llvmEmitPathLlvmUnlocked : Bool := true"
      ];
    }
    {
      rel = "out/llvm-ir/MEASURED-STUB.txt";
      all = [
        "SLAKE_LLVM_EMIT_PATH_V0"
        "HOST-LLVM-EMIT-PATH"
        "llvmUnlocked"
        "MEASURED-STUB"
        "SystemsLean.LlvmEmitPath"
      ];
    }
    {
      rel = "out/llvm-ir/README.md";
      all = [
        "llvmUnlocked"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "llvm-emit-path:"
      ];
    }
  ];
}
