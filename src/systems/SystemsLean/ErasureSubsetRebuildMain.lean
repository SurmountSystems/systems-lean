/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Erasure subset rebuild /
  self-application (SKELETON). Root for lake exe slake-erasure-subset-rebuild.
  Body lives in SystemsLean.ErasureSubsetRebuild (erasureSubsetRebuildReady /
  Erasure subset package re-emit). Greppable: SystemsLean.ErasureSubsetRebuildMain,
  slake-erasure-subset-rebuild, ErasureSubsetRebuildMain, ERASURE-SUBSET-REBUILD,
  SLAKE_ERASURE_SUBSET_REBUILD, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ErasureSubsetRebuildMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ErasureSubsetRebuild

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ErasureSubsetRebuild.main args
