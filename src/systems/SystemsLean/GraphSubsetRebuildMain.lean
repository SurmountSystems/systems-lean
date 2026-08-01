/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Graph subset rebuild /
  self-application (SKELETON). Root for lake exe slake-graph-subset-rebuild.
  Body lives in SystemsLean.GraphSubsetRebuild (graphSubsetRebuildReady /
  Graph subset package re-emit). Greppable: SystemsLean.GraphSubsetRebuildMain,
  slake-graph-subset-rebuild, GraphSubsetRebuildMain, GRAPH-SUBSET-REBUILD,
  SLAKE_GRAPH_SUBSET_REBUILD, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.GraphSubsetRebuildMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.GraphSubsetRebuild

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.GraphSubsetRebuild.main args
