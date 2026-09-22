/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-COMPILE-PATH-ERASURE.
  Root for optional lean --run of live CompilePathErasure.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCompilePathErasure.
  Unique needles (trailing newline so HostFrontLiveCompilePathErasure is not a prefix
  of Source or Main):
  HostFrontLiveCompilePathErasureMain
  PARSE-LIVE-COMPILE-PATH-ERASURE
  HOST-FRONT-LIVE-COMPILE-PATH-ERASURE
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_ERASURE_V0
  Greppable: SystemsLean.HostFrontLiveCompilePathErasureMain,
  parseLiveCompilePathErasureSource,
  kernelCheckLiveCompilePathErasureSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCompilePathErasureMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCompilePathErasure

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCompilePathErasure.main args
