/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Extract subset freestanding
  emit (SKELETON). Root for lake exe slake-extract-subset-emit. Body lives in
  SystemsLean.ExtractSubsetEmit (extractSubsetEmitReady / Extract unit package write).
  Greppable: SystemsLean.ExtractSubsetEmitMain, slake-extract-subset-emit,
  ExtractSubsetEmitMain, EXTRACT-SUBSET-EMIT, SLAKE_EXTRACT_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ExtractSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ExtractSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ExtractSubsetEmit.main args
