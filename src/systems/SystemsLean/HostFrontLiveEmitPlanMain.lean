/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-PLAN.
  Root for optional lean --run of live EmitPlan.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveEmitPlan.
  Greppable: SystemsLean.HostFrontLiveEmitPlanMain,
  HostFrontLiveEmitPlanMain, HOST-FRONT-LIVE-EMIT-PLAN,
  SLAKE_HOST_FRONT_LIVE_EMIT_PLAN_V0,
  PARSE-LIVE-EMIT-PLAN, EMIT-PLAN,
  parseLiveEmitPlanSource,
  kernelCheckLiveEmitPlanSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitPlanMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveEmitPlan

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitPlan.main args
