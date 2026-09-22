/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-ERASURE.
  Root for optional lean --run of live EmitErasure.lean parse plus
  HostKernel.kernelCheck. Not an emit driver.
  Body lives in SystemsLean.HostFrontLiveEmitErasure.
  Greppable: SystemsLean.HostFrontLiveEmitErasureMain,
  HostFrontLiveEmitErasureMain, HOST-FRONT-LIVE-EMIT-ERASURE,
  SLAKE_HOST_FRONT_LIVE_EMIT_ERASURE_V0,
  PARSE-LIVE-EMIT-ERASURE, EMIT-ERASURE,
  parseLiveEmitErasureSource,
  kernelCheckLiveEmitErasureSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitErasureMain
  Not FullHost. Not Lake-gone. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveEmitErasure

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitErasure.main args
