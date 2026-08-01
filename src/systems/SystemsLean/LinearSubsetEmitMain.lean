/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Linear subset freestanding
  emit (SKELETON). Root for lake exe slake-linear-subset-emit. Body lives in
  SystemsLean.LinearSubsetEmit (linearSubsetEmitReady / Linear unit package write).
  Greppable: SystemsLean.LinearSubsetEmitMain, slake-linear-subset-emit,
  LinearSubsetEmitMain, LINEAR-SUBSET-EMIT, SLAKE_LINEAR_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LinearSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.LinearSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LinearSubsetEmit.main args
