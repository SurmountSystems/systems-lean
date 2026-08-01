/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Extract subset rebuild /
  self-application (SKELETON). Root for lake exe slake-extract-subset-rebuild.
  Body lives in SystemsLean.ExtractSubsetRebuild (extractSubsetRebuildReady /
  Extract subset package re-emit). Greppable: SystemsLean.ExtractSubsetRebuildMain,
  slake-extract-subset-rebuild, ExtractSubsetRebuildMain, EXTRACT-SUBSET-REBUILD,
  SLAKE_EXTRACT_SUBSET_REBUILD, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ExtractSubsetRebuildMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ExtractSubsetRebuild

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ExtractSubsetRebuild.main args
