# SPDX-License-Identifier: Unlicense
# Living LlvmHold unlock SSoT pins (must stay true after unlock residual).
# Local text-module unlock pins stay false (checked in unit-text / emit-path).
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmHold.lean"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmHold.lean";
      all = [
        "HOST-LLVM-HOLD"
        "llvmUnlocked"
        "def llvmUnlocked : Bool := true"
      ];
      # Forge ban: living unlock must not flip back to false.
      forbidden = [
        "def llvmUnlocked : Bool := false"
      ];
    }
  ];
}
