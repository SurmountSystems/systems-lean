/-
  SYSTEMS_LEAN_HOST partial. Thin driver for PARSE-LIVE-RUNTIME-BENCH-STACK-TWIN.
  Root for optional lean --run of live RuntimeBenchStackTwin.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not a runtime benchmark claim.
  Not a new measurement C file.
  Body lives in SystemsLean.HostFrontLiveRuntimeBenchStackTwin.
  Greppable: SystemsLean.HostFrontLiveRuntimeBenchStackTwinMain,
  HostFrontLiveRuntimeBenchStackTwinMain, HOST-FRONT-LIVE-RUNTIME-BENCH-STACK-TWIN,
  SLAKE_HOST_FRONT_LIVE_RUNTIME_BENCH_STACK_TWIN_V0,
  PARSE-LIVE-RUNTIME-BENCH-STACK-TWIN, RUNTIME-BENCH-STACK-TWIN,
  parseLiveRuntimeBenchStackTwinSource,
  kernelCheckLiveRuntimeBenchStackTwinSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveRuntimeBenchStackTwinMain
  Not FullHost. Not Lake-gone. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveRuntimeBenchStackTwin

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveRuntimeBenchStackTwin.main args
