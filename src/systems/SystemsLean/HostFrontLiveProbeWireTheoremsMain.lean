/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PROBEWIRETHEOREMS.
  Root for optional lean --run of live ProbeWireTheorems.lean parse +
  kernelCheck. Body lives in SystemsLean.HostFrontLiveProbeWireTheorems.
  Product ids PROBE-WIRE-THEOREM and PROBE-WIRE-SMOKE are not changed.
  Greppable: SystemsLean.HostFrontLiveProbeWireTheoremsMain,
  HostFrontLiveProbeWireTheoremsMain,
  HOST-FRONT-LIVE-PROBEWIRETHEOREMS,
  SLAKE_HOST_FRONT_LIVE_PROBEWIRETHEOREMS_V0,
  PARSE-LIVE-PROBEWIRETHEOREMS, parseLiveProbeWireTheoremsSource,
  kernelCheckLiveProbeWireTheoremsSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProbeWireTheoremsMain
  Not mill 70. Not occupancy name 50. Occupancy stays 49. Not FullHost.
  Host tools stay 69 of 69. Not Lake-gone.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProbeWireTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProbeWireTheorems.main args
