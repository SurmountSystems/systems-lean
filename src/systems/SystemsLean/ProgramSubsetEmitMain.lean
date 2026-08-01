/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Program subset freestanding
  emit (SKELETON). Root for lake exe slake-program-subset-emit. Body lives in
  SystemsLean.ProgramSubsetEmit (programSubsetEmitReady / Program unit package write).
  Greppable: SystemsLean.ProgramSubsetEmitMain, slake-program-subset-emit,
  ProgramSubsetEmitMain, PROGRAM-SUBSET-EMIT, SLAKE_PROGRAM_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ProgramSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ProgramSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ProgramSubsetEmit.main args
