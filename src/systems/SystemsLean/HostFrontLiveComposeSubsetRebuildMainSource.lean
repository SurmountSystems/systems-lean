/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ComposeSubsetRebuildMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveComposeSubsetRebuildMainSource.
  Not occupancy name 50. Not mill 70.
  This wrap is ComposeSubsetRebuildMain.lean. It is not ComposeSubsetRebuild.lean.
  Not a speed claim.
  No new C.
  liveRel is the bare basename ComposeSubsetRebuildMain.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveComposeSubsetRebuildMainSource,
  HOST-FRONT-LIVE-COMPOSE-SUBSET-REBUILD-MAIN, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveComposeSubsetRebuildMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveComposeSubsetRebuildMainParse

/-- Dual-pinned live ComposeSubsetRebuildMain.lean bytes (must match on-disk file).
    Greppable: liveComposeSubsetRebuildMainSource,
    HOST-FRONT-LIVE-COMPOSE-SUBSET-REBUILD-MAIN. -/
def liveComposeSubsetRebuildMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Compose subset rebuild /
  self-application (SKELETON). Root for lake exe slake-compose-subset-rebuild.
  Body lives in SystemsLean.ComposeSubsetRebuild (composeSubsetRebuildReady /
  Compose subset package re-emit). Greppable: SystemsLean.ComposeSubsetRebuildMain,
  slake-compose-subset-rebuild, ComposeSubsetRebuildMain, COMPOSE-SUBSET-REBUILD,
  SLAKE_COMPOSE_SUBSET_REBUILD, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ComposeSubsetRebuildMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ComposeSubsetRebuild

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ComposeSubsetRebuild.main args
"#

end SystemsLean.HostFrontLiveComposeSubsetRebuildMainParse
