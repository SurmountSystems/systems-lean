/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-IR-PROGRAM.
  Root for optional lean --run of live IrProgram.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveIrProgram.
  Greppable: SystemsLean.HostFrontLiveIrProgramMain, HostFrontLiveIrProgramMain,
  HOST-FRONT-LIVE-IR-PROGRAM, SLAKE_HOST_FRONT_LIVE_IR_PROGRAM_V0,
  PARSE-LIVE-IR-PROGRAM, parseLiveIrProgramSource, kernelCheckLiveIrProgramSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveIrProgramMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveIrProgram

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveIrProgram.main args
