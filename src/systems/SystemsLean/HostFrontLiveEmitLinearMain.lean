/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-LINEAR.
  Root for optional lean --run of live EmitLinear.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not a backend.
  Body lives in SystemsLean.HostFrontLiveEmitLinear.
  Greppable: SystemsLean.HostFrontLiveEmitLinearMain,
  HostFrontLiveEmitLinearMain, HOST-FRONT-LIVE-EMIT-LINEAR,
  SLAKE_HOST_FRONT_LIVE_EMIT_LINEAR_V0,
  PARSE-LIVE-EMIT-LINEAR, EMIT-LINEAR,
  parseLiveEmitLinearSource,
  kernelCheckLiveEmitLinearSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitLinearMain
  Not FullHost. Not Lake-gone. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveEmitLinear

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitLinear.main args
