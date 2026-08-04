/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM IR Linear text
  (SKELETON). Root for lake exe slake-llvm-linear-text. Body lives in
  SystemsLean.LlvmLinearText (llvmLinearTextReady / Linear IR write under out/llvm-ir).
  Greppable: SystemsLean.LlvmLinearTextMain, slake-llvm-linear-text,
  LlvmLinearTextMain, HOST-LLVM-LINEAR-TEXT, SLAKE_LLVM_LINEAR_TEXT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmLinearTextMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmLinearText

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmLinearText.main args
