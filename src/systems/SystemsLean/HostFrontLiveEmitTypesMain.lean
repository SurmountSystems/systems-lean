/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-TYPES.
  Root for optional lean --run of live EmitTypes.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not a remill.
  Body lives in SystemsLean.HostFrontLiveEmitTypes.
  Greppable: SystemsLean.HostFrontLiveEmitTypesMain,
  HostFrontLiveEmitTypesMain, HOST-FRONT-LIVE-EMIT-TYPES,
  SLAKE_HOST_FRONT_LIVE_EMIT_TYPES_V0,
  PARSE-LIVE-EMIT-TYPES, EMIT-TYPES,
  parseLiveEmitTypesSource,
  kernelCheckLiveEmitTypesSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitTypesMain
  Not FullHost. Not Lake-gone. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveEmitTypes

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitTypes.main args
