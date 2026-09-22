/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-LINEAR-SCAFFOLD.
  Root for optional lean --run of live EmitLinearScaffold.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not full product module emit.
  Body lives in SystemsLean.HostFrontLiveEmitLinearScaffold.
  Greppable: SystemsLean.HostFrontLiveEmitLinearScaffoldMain,
  HostFrontLiveEmitLinearScaffoldMain, HOST-FRONT-LIVE-EMIT-LINEAR-SCAFFOLD,
  SLAKE_HOST_FRONT_LIVE_EMIT_LINEAR_SCAFFOLD_V0,
  PARSE-LIVE-EMIT-LINEAR-SCAFFOLD, EMIT-LINEAR-SCAFFOLD,
  parseLiveEmitLinearScaffoldSource,
  kernelCheckLiveEmitLinearScaffoldSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitLinearScaffoldMain
  Not FullHost. FullBackend stays false. Not full product module emit.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveEmitLinearScaffold

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitLinearScaffold.main args
