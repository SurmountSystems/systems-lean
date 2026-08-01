/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Linear subset rebuild /
  self-application (SKELETON). Root for lake exe slake-linear-subset-rebuild.
  Body lives in SystemsLean.LinearSubsetRebuild (linearSubsetRebuildReady /
  Linear subset package re-emit). Greppable: SystemsLean.LinearSubsetRebuildMain,
  slake-linear-subset-rebuild, LinearSubsetRebuildMain, LINEAR-SUBSET-REBUILD,
  SLAKE_LINEAR_SUBSET_REBUILD, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LinearSubsetRebuildMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.LinearSubsetRebuild

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LinearSubsetRebuild.main args
