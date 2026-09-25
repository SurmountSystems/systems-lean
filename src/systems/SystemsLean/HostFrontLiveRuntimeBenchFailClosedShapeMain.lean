/-
  SYSTEMS_LEAN_HOST partial. Thin driver for PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE.
  Root for optional lean --run of live RuntimeBenchFailClosedShape.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not a runtime benchmark claim.
  Not a new measurement C file.
  Body lives in SystemsLean.HostFrontLiveRuntimeBenchFailClosedShape.
  Greppable: SystemsLean.HostFrontLiveRuntimeBenchFailClosedShapeMain,
  HostFrontLiveRuntimeBenchFailClosedShapeMain, HOST-FRONT-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE,
  SLAKE_HOST_FRONT_LIVE_RUNTIME_BENCH_FAIL_CLOSED_SHAPE_V0,
  PARSE-LIVE-RUNTIME-BENCH-FAIL-CLOSED-SHAPE, RUNTIME-BENCH-FAIL-CLOSED-SHAPE,
  parseLiveRuntimeBenchFailClosedShapeSource,
  kernelCheckLiveRuntimeBenchFailClosedShapeSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveRuntimeBenchFailClosedShapeMain
  Not FullHost. Not Lake-gone. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveRuntimeBenchFailClosedShape

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveRuntimeBenchFailClosedShape.main args
