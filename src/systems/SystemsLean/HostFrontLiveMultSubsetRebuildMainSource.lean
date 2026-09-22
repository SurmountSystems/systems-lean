/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live MultSubsetRebuildMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveMultSubsetRebuildMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses MultSubsetRebuildMain.lean only. Do not wrap MultSubsetRebuild.lean.
  Do not invent HostFrontLiveMultSubsetRebuild (library wrap).
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveMultSubsetRebuildMain is not a
  prefix hit on HostFrontLiveMultSubsetRebuildMainSource.
  Occupancy leftover HostModuleCheckMultSubsetRebuildTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveMultSubsetRebuildMain is not a prefix):
  HostFrontLiveMultSubsetRebuildMainSource
  PARSE-LIVE-MULT-SUBSET-REBUILD-MAIN
  HOST-FRONT-LIVE-MULT-SUBSET-REBUILD-MAIN
  MULT-SUBSET-REBUILD-MAIN
  HOST-MULT-SUBSET-REBUILD-MAIN
  Live product needles:
  MultSubsetRebuildMain
  slake-mult-subset-rebuild
  import SystemsLean.MultSubsetRebuild
  MULT-SUBSET-REBUILD
  SLAKE_MULT_SUBSET_REBUILD
  multSubsetRebuildReady
  Greppable: SYSTEMS_LEAN_HOST, liveMultSubsetRebuildMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveMultSubsetRebuildMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveMultSubsetRebuildMain

/-- Dual-pinned live MultSubsetRebuildMain.lean bytes (must match on-disk file).
    Greppable: liveMultSubsetRebuildMainSource, PARSE-LIVE-MULT-SUBSET-REBUILD-MAIN. -/
def liveMultSubsetRebuildMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Mult subset rebuild /
  self-application (SKELETON). Root for lake exe slake-mult-subset-rebuild.
  Body lives in SystemsLean.MultSubsetRebuild (multSubsetRebuildReady /
  Mult subset package re-emit). Greppable: SystemsLean.MultSubsetRebuildMain,
  slake-mult-subset-rebuild, MultSubsetRebuildMain, MULT-SUBSET-REBUILD,
  SLAKE_MULT_SUBSET_REBUILD, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.MultSubsetRebuildMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.MultSubsetRebuild

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.MultSubsetRebuild.main args
"#

end SystemsLean.HostFrontLiveMultSubsetRebuildMain
