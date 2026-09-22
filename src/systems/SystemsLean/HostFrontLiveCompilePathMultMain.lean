/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-COMPILE-PATH-MULT.
  Root for optional lean --run of live CompilePathMult.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveCompilePathMult.
  Greppable: SystemsLean.HostFrontLiveCompilePathMultMain,
  HostFrontLiveCompilePathMultMain, HOST-FRONT-LIVE-COMPILE-PATH-MULT,
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_MULT_V0,
  PARSE-LIVE-COMPILE-PATH-MULT, COMPILE-PATH-MULT,
  parseLiveCompilePathMultSource,
  kernelCheckLiveCompilePathMultSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCompilePathMultMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveCompilePathMult

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCompilePathMult.main args
