/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Graph subset freestanding
  emit (SKELETON). Root for lake exe slake-graph-subset-emit. Body lives in
  SystemsLean.GraphSubsetEmit (graphSubsetEmitReady / Graph unit package write).
  Greppable: SystemsLean.GraphSubsetEmitMain, slake-graph-subset-emit,
  GraphSubsetEmitMain, GRAPH-SUBSET-EMIT, SLAKE_GRAPH_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.GraphSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.GraphSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.GraphSubsetEmit.main args
