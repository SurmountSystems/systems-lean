/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-COMPILEPATH.
  Root for optional lean --run of live CompilePath.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCompilePath.
  Greppable: SystemsLean.HostFrontLiveCompilePathMain, HostFrontLiveCompilePathMain,
  HOST-FRONT-LIVE-COMPILEPATH, SLAKE_HOST_FRONT_LIVE_COMPILEPATH_V0, PARSE-LIVE-COMPILEPATH,
  parseLiveCompilePathSource, kernelCheckLiveCompilePathSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCompilePathMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCompilePath

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCompilePath.main args
