/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-RUNTIME-BENCH-LEAN.
  Root for optional lean --run of live RuntimeBenchLean.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not a runtime benchmark claim.
  Body lives in SystemsLean.HostFrontLiveRuntimeBenchLean.
  Greppable: SystemsLean.HostFrontLiveRuntimeBenchLeanMain,
  HostFrontLiveRuntimeBenchLeanMain, HOST-FRONT-LIVE-RUNTIME-BENCH-LEAN,
  SLAKE_HOST_FRONT_LIVE_RUNTIME_BENCH_LEAN_V0,
  PARSE-LIVE-RUNTIME-BENCH-LEAN, RUNTIME-BENCH-LEAN,
  parseLiveRuntimeBenchLeanSource,
  kernelCheckLiveRuntimeBenchLeanSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveRuntimeBenchLeanMain
  Not FullHost. Not Lake-gone. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveRuntimeBenchLean

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveRuntimeBenchLean.main args
