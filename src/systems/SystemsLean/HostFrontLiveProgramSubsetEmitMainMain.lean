/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PROGRAM-SUBSET-EMIT-MAIN.
  Root for optional lean --run of live ProgramSubsetEmitMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProgramSubsetEmitMain.
  Unique needles (trailing newline so HostFrontLiveProgramSubsetEmitMain is not a prefix):
  HostFrontLiveProgramSubsetEmitMainMain
  PARSE-LIVE-PROGRAM-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-PROGRAM-SUBSET-EMIT-MAIN
  SLAKE_HOST_FRONT_LIVE_PROGRAM_SUBSET_EMIT_MAIN_V0
  PROGRAM-SUBSET-EMIT-MAIN
  HOST-PROGRAM-SUBSET-EMIT-MAIN
  Greppable: SystemsLean.HostFrontLiveProgramSubsetEmitMainMain,
  parseLiveProgramSubsetEmitMainSource,
  kernelCheckLiveProgramSubsetEmitMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProgramSubsetEmitMainMain
  Not mill 36 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap is not ExtractSubsetEmitMain. Do not steal HostFrontLiveProgramMain.
  Do not steal HostFrontLiveProgramForeignLink.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProgramSubsetEmitMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProgramSubsetEmitMain.main args
