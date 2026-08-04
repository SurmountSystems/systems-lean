/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Mult-first host fragment
  module graph (SKELETON). Root for lake exe slake-host-graph. Body lives in
  SystemsLean.HostGraph (hostGraphReady / multi-file resolve).
  Greppable: SystemsLean.HostGraphMain, slake-host-graph, HostGraphMain,
  HOST-GRAPH, SLAKE_HOST_GRAPH, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.HostGraphMain
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostGraph

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostGraph.main args
