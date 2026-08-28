/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM Graph SSA lower
  (SKELETON). Root for lake exe slake-llvm-graph-ssa. Body lives in
  SystemsLean.LlvmGraphSsa (llvmGraphSsaReady / Graph SSA write under out/llvm-ir).
  Greppable: SystemsLean.LlvmGraphSsaMain, slake-llvm-graph-ssa,
  LlvmGraphSsaMain, HOST-LLVM-GRAPH-SSA, SLAKE_LLVM_GRAPH_SSA,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmGraphSsaMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmGraphSsa

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmGraphSsa.main args
