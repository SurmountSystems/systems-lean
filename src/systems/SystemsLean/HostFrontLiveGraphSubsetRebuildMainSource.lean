/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live GraphSubsetRebuildMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveGraphSubsetRebuildMainSource. Not occupancy name 50.
  Not mill 33 remill. Mill stays 69 of 69.
  This wrap parses GraphSubsetRebuildMain.lean only. Do not wrap GraphSubsetRebuild.lean.
  Do not invent HostFrontLiveGraphSubsetRebuild (library wrap).
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveGraphSubsetRebuildMain is not a
  prefix hit on HostFrontLiveGraphSubsetRebuildMainSource.
  Occupancy leftover HostModuleCheckGraphSubsetRebuildTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveGraphSubsetRebuildMain is not a prefix):
  HostFrontLiveGraphSubsetRebuildMainSource
  PARSE-LIVE-GRAPH-SUBSET-REBUILD-MAIN
  HOST-FRONT-LIVE-GRAPH-SUBSET-REBUILD-MAIN
  GRAPH-SUBSET-REBUILD-MAIN
  HOST-GRAPH-SUBSET-REBUILD-MAIN
  Live product needles:
  GraphSubsetRebuildMain
  slake-graph-subset-rebuild
  import SystemsLean.GraphSubsetRebuild
  GRAPH-SUBSET-REBUILD
  SLAKE_GRAPH_SUBSET_REBUILD
  Greppable: SYSTEMS_LEAN_HOST, liveGraphSubsetRebuildMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveGraphSubsetRebuildMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveGraphSubsetRebuildMain

/-- Dual-pinned live GraphSubsetRebuildMain.lean bytes (must match on-disk file).
    Greppable: liveGraphSubsetRebuildMainSource, PARSE-LIVE-GRAPH-SUBSET-REBUILD-MAIN. -/
def liveGraphSubsetRebuildMainSource : String := r#"/-
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
"#

end SystemsLean.HostFrontLiveGraphSubsetRebuildMain
