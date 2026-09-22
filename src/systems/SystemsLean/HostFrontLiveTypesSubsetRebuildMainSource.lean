/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live TypesSubsetRebuildMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveTypesSubsetRebuildMainSource. Not occupancy name 50.
  Not mill 35 remill. Mill stays 69 of 69.
  This wrap parses TypesSubsetRebuildMain.lean only. Do not wrap TypesSubsetRebuild.lean.
  Do not invent HostFrontLiveTypesSubsetRebuild (library wrap).
  Do not steal HostFrontLiveTypesMain.
  This wrap is not TypesSubsetEmitMain.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveTypesSubsetRebuildMain is not a
  prefix hit on HostFrontLiveTypesSubsetRebuildMainSource.
  Occupancy leftover HostModuleCheckTypesSubsetRebuildTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveTypesSubsetRebuildMain is not a prefix):
  HostFrontLiveTypesSubsetRebuildMainSource
  PARSE-LIVE-TYPES-SUBSET-REBUILD-MAIN
  HOST-FRONT-LIVE-TYPES-SUBSET-REBUILD-MAIN
  TYPES-SUBSET-REBUILD-MAIN
  HOST-TYPES-SUBSET-REBUILD-MAIN
  Live product needles:
  TypesSubsetRebuildMain
  slake-types-subset-rebuild
  import SystemsLean.TypesSubsetRebuild
  TYPES-SUBSET-REBUILD
  SLAKE_TYPES_SUBSET_REBUILD
  Greppable: SYSTEMS_LEAN_HOST, liveTypesSubsetRebuildMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveTypesSubsetRebuildMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveTypesSubsetRebuildMain

/-- Dual-pinned live TypesSubsetRebuildMain.lean bytes (must match on-disk file).
    Greppable: liveTypesSubsetRebuildMainSource, PARSE-LIVE-TYPES-SUBSET-REBUILD-MAIN. -/
def liveTypesSubsetRebuildMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Types subset rebuild /
  self-application (SKELETON). Root for lake exe slake-types-subset-rebuild.
  Body lives in SystemsLean.TypesSubsetRebuild (typesSubsetRebuildReady /
  Types subset package re-emit). Greppable: SystemsLean.TypesSubsetRebuildMain,
  slake-types-subset-rebuild, TypesSubsetRebuildMain, TYPES-SUBSET-REBUILD,
  SLAKE_TYPES_SUBSET_REBUILD, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.TypesSubsetRebuildMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.TypesSubsetRebuild

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.TypesSubsetRebuild.main args
"#

end SystemsLean.HostFrontLiveTypesSubsetRebuildMain
