/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Compose subset rebuild /
  self-application (SKELETON). Root for lake exe slake-compose-subset-rebuild.
  Body lives in SystemsLean.ComposeSubsetRebuild (composeSubsetRebuildReady /
  Compose subset package re-emit). Greppable: SystemsLean.ComposeSubsetRebuildMain,
  slake-compose-subset-rebuild, ComposeSubsetRebuildMain, COMPOSE-SUBSET-REBUILD,
  SLAKE_COMPOSE_SUBSET_REBUILD, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ComposeSubsetRebuildMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ComposeSubsetRebuild

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ComposeSubsetRebuild.main args
