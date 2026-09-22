/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-COMPILE-PATH-BODY.
  Root for optional lean --run of live CompilePathBody.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCompilePathBody.
  Unique needles (trailing newline so HostFrontLiveCompilePathBody is not a prefix
  of Source or Main):
  HostFrontLiveCompilePathBodyMain
  PARSE-LIVE-COMPILE-PATH-BODY
  HOST-FRONT-LIVE-COMPILE-PATH-BODY
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_BODY_V0
  Greppable: SystemsLean.HostFrontLiveCompilePathBodyMain,
  parseLiveCompilePathBodySource,
  kernelCheckLiveCompilePathBodySource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCompilePathBodyMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCompilePathBody

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCompilePathBody.main args
