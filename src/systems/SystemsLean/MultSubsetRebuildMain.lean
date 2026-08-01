/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Mult subset rebuild /
  self-application (SKELETON). Root for lake exe slake-mult-subset-rebuild.
  Body lives in SystemsLean.MultSubsetRebuild (multSubsetRebuildReady /
  Mult subset package re-emit). Greppable: SystemsLean.MultSubsetRebuildMain,
  slake-mult-subset-rebuild, MultSubsetRebuildMain, MULT-SUBSET-REBUILD,
  SLAKE_MULT_SUBSET_REBUILD, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.MultSubsetRebuildMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.MultSubsetRebuild

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.MultSubsetRebuild.main args
