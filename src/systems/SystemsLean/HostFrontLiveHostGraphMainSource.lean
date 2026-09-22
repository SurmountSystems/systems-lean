/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostGraphMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostGraphMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses HostGraphMain.lean only. Do not wrap HostGraph.lean.
  Do not steal HostFrontLiveGraphMain.lean (library wrap for HostGraph.lean).
  Do not wrap IrGraph.lean. Do not invent Compose parsers.
  Unique needles use trailing newline so HostFrontLiveHostGraphMain is not a
  prefix hit on HostFrontLiveHostGraphMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveHostGraphMain is not a prefix):
  HostFrontLiveHostGraphMainSource
  PARSE-LIVE-HOST-GRAPH-MAIN
  HOST-FRONT-LIVE-HOST-GRAPH-MAIN
  HOST-GRAPH-MAIN
  Live product needles:
  HostGraphMain
  slake-host-graph
  import SystemsLean.HostGraph
  HOST-GRAPH
  SLAKE_HOST_GRAPH
  Greppable: SYSTEMS_LEAN_HOST, liveHostGraphMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostGraphMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostGraphMain

/-- Dual-pinned live HostGraphMain.lean bytes (must match on-disk file).
    Greppable: liveHostGraphMainSource, PARSE-LIVE-HOST-GRAPH-MAIN. -/
def liveHostGraphMainSource : String := r#"/-
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
"#

end SystemsLean.HostFrontLiveHostGraphMain
