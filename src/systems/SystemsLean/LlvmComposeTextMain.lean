/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM IR compose text
  (SKELETON). Root for lake exe slake-llvm-compose-text. Body lives in
  SystemsLean.LlvmComposeText (llvmComposeTextReady / compose IR write under
  out/llvm-ir).
  Greppable: SystemsLean.LlvmComposeTextMain, slake-llvm-compose-text,
  LlvmComposeTextMain, HOST-LLVM-COMPOSE-TEXT, SLAKE_LLVM_COMPOSE_TEXT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmComposeTextMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmComposeText

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmComposeText.main args
