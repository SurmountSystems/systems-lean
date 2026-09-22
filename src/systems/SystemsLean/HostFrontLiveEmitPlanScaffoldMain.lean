/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-PLAN-SCAFFOLD.
  Root for optional lean --run of live EmitPlanScaffold.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveEmitPlanScaffold.
  Greppable: SystemsLean.HostFrontLiveEmitPlanScaffoldMain,
  HostFrontLiveEmitPlanScaffoldMain, HOST-FRONT-LIVE-EMIT-PLAN-SCAFFOLD,
  SLAKE_HOST_FRONT_LIVE_EMIT_PLAN_SCAFFOLD_V0,
  PARSE-LIVE-EMIT-PLAN-SCAFFOLD,
  parseLiveEmitPlanScaffoldSource,
  kernelCheckLiveEmitPlanScaffoldSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitPlanScaffoldMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveEmitPlanScaffold

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitPlanScaffold.main args
