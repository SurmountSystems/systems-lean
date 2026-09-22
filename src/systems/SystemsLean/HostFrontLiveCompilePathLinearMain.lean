/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-COMPILE-PATH-LINEAR.
  Root for optional lean --run of live CompilePathLinear.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCompilePathLinear.
  Unique needles (trailing newline so HostFrontLiveCompilePathLinear is not a prefix
  of Source or Main):
  HostFrontLiveCompilePathLinearMain
  PARSE-LIVE-COMPILE-PATH-LINEAR
  HOST-FRONT-LIVE-COMPILE-PATH-LINEAR
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_LINEAR_V0
  Greppable: SystemsLean.HostFrontLiveCompilePathLinearMain,
  parseLiveCompilePathLinearSource,
  kernelCheckLiveCompilePathLinearSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCompilePathLinearMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCompilePathLinear

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCompilePathLinear.main args
