/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-COMPILE-PATH-PLAN.
  Root for optional lean --run of live CompilePathPlan.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCompilePathPlan.
  Unique needles (trailing newline so HostFrontLiveCompilePathPlan is not a prefix
  of Source or Main):
  HostFrontLiveCompilePathPlanMain
  PARSE-LIVE-COMPILE-PATH-PLAN
  HOST-FRONT-LIVE-COMPILE-PATH-PLAN
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_PLAN_V0
  Greppable: SystemsLean.HostFrontLiveCompilePathPlanMain,
  parseLiveCompilePathPlanSource,
  kernelCheckLiveCompilePathPlanSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCompilePathPlanMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCompilePathPlan

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCompilePathPlan.main args
