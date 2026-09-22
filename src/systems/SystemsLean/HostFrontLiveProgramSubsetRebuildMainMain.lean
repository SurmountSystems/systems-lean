/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN.
  Root for optional lean --run of live ProgramSubsetRebuildMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProgramSubsetRebuildMain.
  Unique needles (trailing newline so HostFrontLiveProgramSubsetRebuildMain is not a prefix):
  HostFrontLiveProgramSubsetRebuildMainMain
  PARSE-LIVE-PROGRAM-SUBSET-REBUILD-MAIN
  HOST-FRONT-LIVE-PROGRAM-SUBSET-REBUILD-MAIN
  SLAKE_HOST_FRONT_LIVE_PROGRAM_SUBSET_REBUILD_MAIN_V0
  PROGRAM-SUBSET-REBUILD-MAIN
  HOST-PROGRAM-SUBSET-REBUILD-MAIN
  Greppable: SystemsLean.HostFrontLiveProgramSubsetRebuildMainMain,
  parseLiveProgramSubsetRebuildMainSource,
  kernelCheckLiveProgramSubsetRebuildMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProgramSubsetRebuildMainMain
  Not mill remill (just twenty-fifth-host-tool / inventory table row 37).
  Mill stays 69 of 69. Occupancy 49. Not occupancy name 50. Not FullHost.
  This wrap parses ProgramSubsetRebuildMain.lean only. Do not wrap ProgramSubsetRebuild.lean.
  This wrap is not ProgramSubsetEmitMain. This wrap is not TypesSubsetRebuildMain.
  Do not steal HostFrontLiveProgramMain. Not Linear. Not ComposeSubsetEmit. Not IrGraph.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProgramSubsetRebuildMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProgramSubsetRebuildMain.main args
