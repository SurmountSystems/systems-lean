/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-FREESTANDING-EMIT-MAIN.
  Root for optional lean --run of live FreestandingEmitMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveFreestandingEmitMain.
  Unique needles (trailing newline so HostFrontLiveFreestandingEmitMain is not a prefix):
  HostFrontLiveFreestandingEmitMainMain
  PARSE-LIVE-FREESTANDING-EMIT-MAIN
  HOST-FRONT-LIVE-FREESTANDING-EMIT-MAIN
  SLAKE_HOST_FRONT_LIVE_FREESTANDING_EMIT_MAIN_V0
  FREESTANDING-EMIT-MAIN
  Greppable: SystemsLean.HostFrontLiveFreestandingEmitMainMain,
  parseLiveFreestandingEmitMainSource,
  kernelCheckLiveFreestandingEmitMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveFreestandingEmitMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveFreestandingEmitMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveFreestandingEmitMain.main args
