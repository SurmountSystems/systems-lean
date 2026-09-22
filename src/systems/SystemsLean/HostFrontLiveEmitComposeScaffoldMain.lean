/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-COMPOSE-SCAFFOLD.
  Root for optional lean --run of live EmitComposeScaffold.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not a backend.
  Body lives in SystemsLean.HostFrontLiveEmitComposeScaffold.
  Greppable: SystemsLean.HostFrontLiveEmitComposeScaffoldMain,
  HostFrontLiveEmitComposeScaffoldMain, HOST-FRONT-LIVE-EMIT-COMPOSE-SCAFFOLD,
  SLAKE_HOST_FRONT_LIVE_EMIT_COMPOSE_SCAFFOLD_V0,
  PARSE-LIVE-EMIT-COMPOSE-SCAFFOLD, EMIT-COMPOSE-SMOKE,
  parseLiveEmitComposeScaffoldSource,
  kernelCheckLiveEmitComposeScaffoldSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitComposeScaffoldMain
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveEmitComposeScaffold

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitComposeScaffold.main args
