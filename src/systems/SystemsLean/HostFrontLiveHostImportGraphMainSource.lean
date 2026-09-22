/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostImportGraphMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostImportGraphMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses HostImportGraphMain.lean only. Do not wrap HostImportGraph.lean.
  Do not steal HostFrontLiveImportGraphMain.lean (library wrap for
  HostImportGraph.lean). Do not wrap IrGraph.lean. Do not invent Compose parsers.
  Unique needles use trailing newline so HostFrontLiveHostImportGraphMain is not a
  prefix hit on HostFrontLiveHostImportGraphMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveHostImportGraphMain is not a prefix):
  HostFrontLiveHostImportGraphMainSource
  PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MAIN
  HOST-IMPORT-GRAPH-MAIN
  Live product needles:
  HostImportGraphMain
  slake-host-import-graph
  import SystemsLean.HostImportGraph
  HOST-IMPORT-GRAPH
  SLAKE_HOST_IMPORT_GRAPH
  hostImportGraphReady
  Greppable: SYSTEMS_LEAN_HOST, liveHostImportGraphMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostImportGraphMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostImportGraphMain

/-- Dual-pinned live HostImportGraphMain.lean bytes (must match on-disk file).
    Greppable: liveHostImportGraphMainSource, PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN. -/
def liveHostImportGraphMainSource : String := r#"/-
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
"#

end SystemsLean.HostFrontLiveHostImportGraphMain
