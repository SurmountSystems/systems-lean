/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-COMPILE-PATH-COMPOSE.
  Root for optional lean --run of live CompilePathCompose.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCompilePathCompose.
  Unique needles (trailing newline so HostFrontLiveCompilePathCompose is not a prefix
  of Source or Main):
  HostFrontLiveCompilePathComposeMain
  PARSE-LIVE-COMPILE-PATH-COMPOSE
  HOST-FRONT-LIVE-COMPILE-PATH-COMPOSE
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_COMPOSE_V0
  Greppable: SystemsLean.HostFrontLiveCompilePathComposeMain,
  parseLiveCompilePathComposeSource,
  kernelCheckLiveCompilePathComposeSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCompilePathComposeMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCompilePathCompose

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCompilePathCompose.main args
