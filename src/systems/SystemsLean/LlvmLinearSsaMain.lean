/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM Linear SSA lower
  (SKELETON). Root for lake exe slake-llvm-linear-ssa. Body lives in
  SystemsLean.LlvmLinearSsa (llvmLinearSsaReady / Linear SSA write under out/llvm-ir).
  Greppable: SystemsLean.LlvmLinearSsaMain, slake-llvm-linear-ssa,
  LlvmLinearSsaMain, HOST-LLVM-LINEAR-SSA, SLAKE_LLVM_LINEAR_SSA,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmLinearSsaMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmLinearSsa

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmLinearSsa.main args
