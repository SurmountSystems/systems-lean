/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ErasureSubsetRebuildMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveErasureSubsetRebuildMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses ErasureSubsetRebuildMain.lean only. Do not wrap ErasureSubsetRebuild.lean.
  Do not invent HostFrontLiveErasureSubsetRebuild (library wrap).
  HostFrontLiveErasure wraps Erasure.lean, not this mill Main.
  Do not steal HostFrontLiveErasure.lean, HostFrontLiveErasureMain.lean,
  or HostFrontLiveErasureSource.lean.
  This wrap is not ErasureSubsetEmitMain. This wrap is not TypesSubsetRebuildMain.
  This wrap is not HostFrontLiveErasure.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveErasureSubsetRebuildMain is not a
  prefix hit on HostFrontLiveErasureSubsetRebuildMainSource.
  Occupancy leftover HostModuleCheckErasureSubsetRebuildTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveErasureSubsetRebuildMain is not a prefix):
  HostFrontLiveErasureSubsetRebuildMainSource
  PARSE-LIVE-ERASURE-SUBSET-REBUILD-MAIN
  HOST-FRONT-LIVE-ERASURE-SUBSET-REBUILD-MAIN
  ERASURE-SUBSET-REBUILD-MAIN
  HOST-ERASURE-SUBSET-REBUILD-MAIN
  Live product needles:
  ErasureSubsetRebuildMain
  slake-erasure-subset-rebuild
  import SystemsLean.ErasureSubsetRebuild
  ERASURE-SUBSET-REBUILD
  SLAKE_ERASURE_SUBSET_REBUILD
  Greppable: SYSTEMS_LEAN_HOST, liveErasureSubsetRebuildMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveErasureSubsetRebuildMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveErasureSubsetRebuildMain

/-- Dual-pinned live ErasureSubsetRebuildMain.lean bytes (must match on-disk file).
    Greppable: liveErasureSubsetRebuildMainSource, PARSE-LIVE-ERASURE-SUBSET-REBUILD-MAIN. -/
def liveErasureSubsetRebuildMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Erasure subset rebuild /
  self-application (SKELETON). Root for lake exe slake-erasure-subset-rebuild.
  Body lives in SystemsLean.ErasureSubsetRebuild (erasureSubsetRebuildReady /
  Erasure subset package re-emit). Greppable: SystemsLean.ErasureSubsetRebuildMain,
  slake-erasure-subset-rebuild, ErasureSubsetRebuildMain, ERASURE-SUBSET-REBUILD,
  SLAKE_ERASURE_SUBSET_REBUILD, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ErasureSubsetRebuildMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ErasureSubsetRebuild

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ErasureSubsetRebuild.main args
"#

end SystemsLean.HostFrontLiveErasureSubsetRebuildMain
