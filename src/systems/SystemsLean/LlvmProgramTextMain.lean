/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM IR Program text
  (SKELETON). Root for lake exe slake-llvm-program-text. Body lives in
  SystemsLean.LlvmProgramText (llvmProgramTextReady / Program IR write under
  out/llvm-ir).
  Greppable: SystemsLean.LlvmProgramTextMain, slake-llvm-program-text,
  LlvmProgramTextMain, HOST-LLVM-PROGRAM-TEXT, SLAKE_LLVM_PROGRAM_TEXT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmProgramTextMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmProgramText

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmProgramText.main args
