/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Types subset freestanding
  emit (SKELETON). Root for lake exe slake-types-subset-emit. Body lives in
  SystemsLean.TypesSubsetEmit (typesSubsetEmitReady / Types unit package write).
  Greppable: SystemsLean.TypesSubsetEmitMain, slake-types-subset-emit,
  TypesSubsetEmitMain, TYPES-SUBSET-EMIT, SLAKE_TYPES_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.TypesSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.TypesSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.TypesSubsetEmit.main args
