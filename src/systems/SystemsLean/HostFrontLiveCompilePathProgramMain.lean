/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-COMPILE-PATH-PROGRAM.
  Root for optional lean --run of live CompilePathProgram.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCompilePathProgram.
  Unique needles (trailing newline so HostFrontLiveCompilePathProgram is not a prefix
  of Source or Main):
  HostFrontLiveCompilePathProgramMain
  PARSE-LIVE-COMPILE-PATH-PROGRAM
  HOST-FRONT-LIVE-COMPILE-PATH-PROGRAM
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_PROGRAM_V0
  Greppable: SystemsLean.HostFrontLiveCompilePathProgramMain,
  parseLiveCompilePathProgramSource,
  kernelCheckLiveCompilePathProgramSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCompilePathProgramMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCompilePathProgram

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCompilePathProgram.main args
