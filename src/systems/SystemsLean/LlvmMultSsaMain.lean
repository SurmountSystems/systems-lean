/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM Mult SSA lower
  (SKELETON). Root for lake exe slake-llvm-mult-ssa. Body lives in
  SystemsLean.LlvmMultSsa (llvmMultSsaReady / Mult SSA write under out/llvm-ir).
  Greppable: SystemsLean.LlvmMultSsaMain, slake-llvm-mult-ssa,
  LlvmMultSsaMain, HOST-LLVM-MULT-SSA, SLAKE_LLVM_MULT_SSA,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmMultSsaMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmMultSsa

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmMultSsa.main args
