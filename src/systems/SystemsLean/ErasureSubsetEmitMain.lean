/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Erasure subset freestanding
  emit (SKELETON). Root for lake exe slake-erasure-subset-emit. Body lives in
  SystemsLean.ErasureSubsetEmit (erasureSubsetEmitReady / Erasure unit package write).
  Greppable: SystemsLean.ErasureSubsetEmitMain, slake-erasure-subset-emit,
  ErasureSubsetEmitMain, ERASURE-SUBSET-EMIT, SLAKE_ERASURE_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ErasureSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ErasureSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ErasureSubsetEmit.main args
