/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for real Mult import graph
  without Lake on the measured step (SKELETON; plan A4). Root for
  lake exe slake-host-import-graph. Body lives in SystemsLean.HostImportGraph
  (hostImportGraphReady / loadMultImportGraph walk).
  Greppable: SystemsLean.HostImportGraphMain, slake-host-import-graph,
  HostImportGraphMain, HOST-IMPORT-GRAPH, SLAKE_HOST_IMPORT_GRAPH,
  hostImportGraphReady, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.HostImportGraphMain
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostImportGraph

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostImportGraph.main args
