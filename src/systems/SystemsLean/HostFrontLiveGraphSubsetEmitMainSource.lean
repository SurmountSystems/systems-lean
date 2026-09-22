/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live GraphSubsetEmitMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveGraphSubsetEmitMainSource. Not occupancy name 50.
  Not mill 33 remill. Mill stays 69 of 69.
  This wrap parses GraphSubsetEmitMain.lean only. Do not wrap GraphSubsetEmit.lean.
  Do not invent HostFrontLiveGraphSubsetEmit (library wrap).
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveGraphSubsetEmitMain is not a
  prefix hit on HostFrontLiveGraphSubsetEmitMainSource.
  Occupancy leftover HostModuleCheckGraphSubsetEmitTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveGraphSubsetEmitMain is not a prefix):
  HostFrontLiveGraphSubsetEmitMainSource
  PARSE-LIVE-GRAPH-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-GRAPH-SUBSET-EMIT-MAIN
  GRAPH-SUBSET-EMIT-MAIN
  HOST-GRAPH-SUBSET-EMIT-MAIN
  Live product needles:
  GraphSubsetEmitMain
  slake-graph-subset-emit
  import SystemsLean.GraphSubsetEmit
  GRAPH-SUBSET-EMIT
  SLAKE_GRAPH_SUBSET_EMIT
  Greppable: SYSTEMS_LEAN_HOST, liveGraphSubsetEmitMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveGraphSubsetEmitMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveGraphSubsetEmitMain

/-- Dual-pinned live GraphSubsetEmitMain.lean bytes (must match on-disk file).
    Greppable: liveGraphSubsetEmitMainSource, PARSE-LIVE-GRAPH-SUBSET-EMIT-MAIN. -/
def liveGraphSubsetEmitMainSource : String := r#"/-
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
"#

end SystemsLean.HostFrontLiveGraphSubsetEmitMain
