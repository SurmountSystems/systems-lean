/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM Compose SSA lower
  (SKELETON). Root for lake exe slake-llvm-compose-ssa. Body lives in
  SystemsLean.LlvmComposeSsa (llvmComposeSsaReady / Compose SSA write under out/llvm-ir).
  Greppable: SystemsLean.LlvmComposeSsaMain, slake-llvm-compose-ssa,
  LlvmComposeSsaMain, HOST-LLVM-COMPOSE-SSA, SLAKE_LLVM_COMPOSE_SSA,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmComposeSsaMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmComposeSsa

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmComposeSsa.main args
