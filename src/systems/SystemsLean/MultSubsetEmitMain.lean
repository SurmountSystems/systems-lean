/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Mult subset freestanding
  emit (SKELETON). Root for lake exe slake-mult-subset-emit. Body lives in
  SystemsLean.MultSubsetEmit (multSubsetEmitReady / Mult unit package write).
  Greppable: SystemsLean.MultSubsetEmitMain, slake-mult-subset-emit,
  MultSubsetEmitMain, MULT-SUBSET-EMIT, SLAKE_MULT_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.MultSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.MultSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.MultSubsetEmit.main args
