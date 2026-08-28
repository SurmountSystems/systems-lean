/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM Program SSA lower
  (SKELETON). Root for lake exe slake-llvm-program-ssa. Body lives in
  SystemsLean.LlvmProgramSsa (llvmProgramSsaReady / Program SSA write under out/llvm-ir).
  Greppable: SystemsLean.LlvmProgramSsaMain, slake-llvm-program-ssa,
  LlvmProgramSsaMain, HOST-LLVM-PROGRAM-SSA, SLAKE_LLVM_PROGRAM_SSA,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmProgramSsaMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmProgramSsa

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmProgramSsa.main args
