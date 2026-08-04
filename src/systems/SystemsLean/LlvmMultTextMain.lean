/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM IR Mult text
  (SKELETON). Root for lake exe slake-llvm-mult-text. Body lives in
  SystemsLean.LlvmMultText (llvmMultTextReady / Mult IR write under out/llvm-ir).
  Greppable: SystemsLean.LlvmMultTextMain, slake-llvm-mult-text,
  LlvmMultTextMain, HOST-LLVM-MULT-TEXT, SLAKE_LLVM_MULT_TEXT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmMultTextMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmMultText

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmMultText.main args
