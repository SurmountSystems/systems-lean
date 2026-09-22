/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-MULT.
  Root for optional lean --run of live EmitMult.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not EmitBanner.
  Body lives in SystemsLean.HostFrontLiveEmitMult.
  Greppable: SystemsLean.HostFrontLiveEmitMultMain,
  HostFrontLiveEmitMultMain, HOST-FRONT-LIVE-EMIT-MULT,
  SLAKE_HOST_FRONT_LIVE_EMIT_MULT_V0,
  PARSE-LIVE-EMIT-MULT, EMIT-MULT,
  parseLiveEmitMultSource,
  kernelCheckLiveEmitMultSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitMultMain
  Not FullHost. Not Lake-gone. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveEmitMult

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitMult.main args
