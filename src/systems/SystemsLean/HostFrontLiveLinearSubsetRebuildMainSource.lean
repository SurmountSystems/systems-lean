/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LinearSubsetRebuildMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLinearSubsetRebuildMainSource. Not occupancy name 50.
  Not mill 33 remill. Mill stays 69 of 69.
  This wrap parses LinearSubsetRebuildMain.lean only. Do not wrap LinearSubsetRebuild.lean.
  Do not invent HostFrontLiveLinearSubsetRebuild (library wrap).
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveLinearSubsetRebuildMain is not a
  prefix hit on HostFrontLiveLinearSubsetRebuildMainSource.
  Occupancy leftover HostModuleCheckLinearSubsetRebuildTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveLinearSubsetRebuildMain is not a prefix):
  HostFrontLiveLinearSubsetRebuildMainSource
  PARSE-LIVE-LINEAR-SUBSET-REBUILD-MAIN
  HOST-FRONT-LIVE-LINEAR-SUBSET-REBUILD-MAIN
  LINEAR-SUBSET-REBUILD-MAIN
  HOST-LINEAR-SUBSET-REBUILD-MAIN
  Live product needles:
  LinearSubsetRebuildMain
  slake-linear-subset-rebuild
  import SystemsLean.LinearSubsetRebuild
  LINEAR-SUBSET-REBUILD
  SLAKE_LINEAR_SUBSET_REBUILD
  Greppable: SYSTEMS_LEAN_HOST, liveLinearSubsetRebuildMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLinearSubsetRebuildMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLinearSubsetRebuildMain

/-- Dual-pinned live LinearSubsetRebuildMain.lean bytes (must match on-disk file).
    Greppable: liveLinearSubsetRebuildMainSource, PARSE-LIVE-LINEAR-SUBSET-REBUILD-MAIN. -/
def liveLinearSubsetRebuildMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Linear subset rebuild /
  self-application (SKELETON). Root for lake exe slake-linear-subset-rebuild.
  Body lives in SystemsLean.LinearSubsetRebuild (linearSubsetRebuildReady /
  Linear subset package re-emit). Greppable: SystemsLean.LinearSubsetRebuildMain,
  slake-linear-subset-rebuild, LinearSubsetRebuildMain, LINEAR-SUBSET-REBUILD,
  SLAKE_LINEAR_SUBSET_REBUILD, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LinearSubsetRebuildMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.LinearSubsetRebuild

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LinearSubsetRebuild.main args
"#

end SystemsLean.HostFrontLiveLinearSubsetRebuildMain
