/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-COMPILE-PATH-TYPES.
  Root for optional lean --run of live CompilePathTypes.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCompilePathTypes.
  Unique needles (trailing newline so HostFrontLiveCompilePathTypes is not a prefix
  of Source or Main):
  HostFrontLiveCompilePathTypesMain
  PARSE-LIVE-COMPILE-PATH-TYPES
  HOST-FRONT-LIVE-COMPILE-PATH-TYPES
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_TYPES_V0
  Greppable: SystemsLean.HostFrontLiveCompilePathTypesMain,
  parseLiveCompilePathTypesSource,
  kernelCheckLiveCompilePathTypesSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCompilePathTypesMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCompilePathTypes

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCompilePathTypes.main args
