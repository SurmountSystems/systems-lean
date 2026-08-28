/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM Types SSA lower
  (SKELETON). Root for lake exe slake-llvm-types-ssa. Body lives in
  SystemsLean.LlvmTypesSsa (llvmTypesSsaReady / Types SSA write under out/llvm-ir).
  Greppable: SystemsLean.LlvmTypesSsaMain, slake-llvm-types-ssa,
  LlvmTypesSsaMain, HOST-LLVM-TYPES-SSA, SLAKE_LLVM_TYPES_SSA,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmTypesSsaMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmTypesSsa

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmTypesSsa.main args
