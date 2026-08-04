/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM IR Graph text
  (SKELETON). Root for lake exe slake-llvm-graph-text. Body lives in
  SystemsLean.LlvmGraphText (llvmGraphTextReady / Graph IR write under
  out/llvm-ir).
  Greppable: SystemsLean.LlvmGraphTextMain, slake-llvm-graph-text,
  LlvmGraphTextMain, HOST-LLVM-GRAPH-TEXT, SLAKE_LLVM_GRAPH_TEXT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmGraphTextMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmGraphText

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmGraphText.main args
