/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM IR Types text
  (SKELETON). Root for lake exe slake-llvm-types-text. Body lives in
  SystemsLean.LlvmTypesText (llvmTypesTextReady / Types IR write under out/llvm-ir).
  Greppable: SystemsLean.LlvmTypesTextMain, slake-llvm-types-text,
  LlvmTypesTextMain, HOST-LLVM-TYPES-TEXT, SLAKE_LLVM_TYPES_TEXT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmTypesTextMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmTypesText

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmTypesText.main args
