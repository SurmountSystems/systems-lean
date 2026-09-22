/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-PROGRAM.
  Root for optional lean --run of live EmitProgram.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveEmitProgram.
  Unique needles (trailing newline so a longer name is not a prefix hit):
  HostFrontLiveEmitProgramMain
  PARSE-LIVE-EMIT-PROGRAM
  HOST-FRONT-LIVE-EMIT-PROGRAM
  SLAKE_HOST_FRONT_LIVE_EMIT_PROGRAM_V0
  Greppable: SystemsLean.HostFrontLiveEmitProgramMain,
  parseLiveEmitProgramSource,
  kernelCheckLiveEmitProgramSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitProgramMain
  Not mill 70. Not occupancy name 50. Occupancy stays 49. Mill stays 69 of 69.
  Not FullHost. slakeOwnsPackageTypecheck stays false. Not Lake-gone.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostFrontLiveEmitProgram

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitProgram.main args
