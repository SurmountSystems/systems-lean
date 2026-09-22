/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ProgramSubsetRebuildMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProgramSubsetRebuildMainSource. Not occupancy name 50.
  Not mill remill (just twenty-fifth-host-tool / inventory table row 37). Mill stays 69 of 69.
  This wrap parses ProgramSubsetRebuildMain.lean only. Do not wrap ProgramSubsetRebuild.lean.
  Do not invent HostFrontLiveProgramSubsetRebuild (library wrap).
  Do not steal HostFrontLiveProgramMain (library wrap of Program.lean; none existed).
  Do not invent HostFrontLiveProgram (library wrap of Program.lean).
  This wrap is not ProgramSubsetEmitMain. This wrap is not TypesSubsetRebuildMain.
  Not Linear. Not ComposeSubsetEmit. Not IrGraph.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveProgramSubsetRebuildMain is not a
  prefix hit on HostFrontLiveProgramSubsetRebuildMainSource.
  Occupancy leftover Term files are not this wrap.
  Unique needles (trailing newline so HostFrontLiveProgramSubsetRebuildMain is not a prefix):
  HostFrontLiveProgramSubsetRebuildMainSource
  PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN
  HOST-FRONT-LIVE-PROGRAM-SUBSET-REBUILD-MAIN
  PROGRAM-SUBSET-REBUILD-MAIN
  HOST-PROGRAM-SUBSET-REBUILD-MAIN
  Live product needles:
  ProgramSubsetRebuildMain
  slake-program-subset-rebuild
  import SystemsLean.ProgramSubsetRebuild
  PROGRAM-SUBSET-REBUILD
  SLAKE_PROGRAM_SUBSET_REBUILD
  Greppable: SYSTEMS_LEAN_HOST, liveProgramSubsetRebuildMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveProgramSubsetRebuildMainSource
  Not FullHost. Occupancy 49. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveProgramSubsetRebuildMain

/-- Dual-pinned live ProgramSubsetRebuildMain.lean bytes (must match on-disk file).
    Greppable: liveProgramSubsetRebuildMainSource, PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN. -/
def liveProgramSubsetRebuildMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Program subset rebuild /
  self-application (SKELETON). Root for lake exe slake-program-subset-rebuild.
  Body lives in SystemsLean.ProgramSubsetRebuild (programSubsetRebuildReady /
  Program subset package re-emit). Greppable: SystemsLean.ProgramSubsetRebuildMain,
  slake-program-subset-rebuild, ProgramSubsetRebuildMain, PROGRAM-SUBSET-REBUILD,
  SLAKE_PROGRAM_SUBSET_REBUILD, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ProgramSubsetRebuildMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ProgramSubsetRebuild

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ProgramSubsetRebuild.main args
"#

end SystemsLean.HostFrontLiveProgramSubsetRebuildMain
