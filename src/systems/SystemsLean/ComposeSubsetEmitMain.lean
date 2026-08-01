/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Compose subset freestanding
  emit (SKELETON). Root for lake exe slake-compose-subset-emit. Body lives in
  SystemsLean.ComposeSubsetEmit (composeSubsetEmitReady / Compose unit package write).
  Greppable: SystemsLean.ComposeSubsetEmitMain, slake-compose-subset-emit,
  ComposeSubsetEmitMain, COMPOSE-SUBSET-EMIT, SLAKE_COMPOSE_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ComposeSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ComposeSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ComposeSubsetEmit.main args
