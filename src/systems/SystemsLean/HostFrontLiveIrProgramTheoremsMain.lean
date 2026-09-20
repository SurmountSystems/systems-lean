/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-IR-PROGRAM-THEOREMS.
  Root for optional lean --run of live IrProgramTheorems.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveIrProgramTheorems.
  Greppable: SystemsLean.HostFrontLiveIrProgramTheoremsMain,
  HostFrontLiveIrProgramTheoremsMain,
  HOST-FRONT-LIVE-IR-PROGRAM-THEOREMS, SLAKE_HOST_FRONT_LIVE_IR_PROGRAM_THEOREMS_V0,
  PARSE-LIVE-IR-PROGRAM-THEOREMS, parseLiveIrProgramTheoremsSource,
  kernelCheckLiveIrProgramTheoremsSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveIrProgramTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveIrProgramTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveIrProgramTheorems.main args
