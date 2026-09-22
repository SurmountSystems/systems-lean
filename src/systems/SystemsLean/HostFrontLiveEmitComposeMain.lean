/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-COMPOSE.
  Root for optional lean --run of live EmitCompose.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveEmitCompose.
  Greppable: SystemsLean.HostFrontLiveEmitComposeMain, HostFrontLiveEmitComposeMain,
  HOST-FRONT-LIVE-EMIT-COMPOSE, SLAKE_HOST_FRONT_LIVE_EMIT_COMPOSE_V0,
  PARSE-LIVE-EMIT-COMPOSE,
  parseLiveEmitComposeSource, kernelCheckLiveEmitComposeSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitComposeMain
  Not mill 70. Not occupancy name 50. Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveEmitCompose

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitCompose.main args
