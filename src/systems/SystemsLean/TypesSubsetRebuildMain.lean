/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Types subset rebuild /
  self-application (SKELETON). Root for lake exe slake-types-subset-rebuild.
  Body lives in SystemsLean.TypesSubsetRebuild (typesSubsetRebuildReady /
  Types subset package re-emit). Greppable: SystemsLean.TypesSubsetRebuildMain,
  slake-types-subset-rebuild, TypesSubsetRebuildMain, TYPES-SUBSET-REBUILD,
  SLAKE_TYPES_SUBSET_REBUILD, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.TypesSubsetRebuildMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.TypesSubsetRebuild

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.TypesSubsetRebuild.main args
