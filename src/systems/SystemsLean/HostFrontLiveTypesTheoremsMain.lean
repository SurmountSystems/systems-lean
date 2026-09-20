/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-TYPESTHEOREMS.
  Root for optional lean --run of live TypesTheorems.lean parse +
  kernelCheck. Body lives in SystemsLean.HostFrontLiveTypesTheorems.
  Greppable: SystemsLean.HostFrontLiveTypesTheoremsMain,
  HostFrontLiveTypesTheoremsMain,
  HOST-FRONT-LIVE-TYPESTHEOREMS,
  SLAKE_HOST_FRONT_LIVE_TYPESTHEOREMS_V0,
  PARSE-LIVE-TYPESTHEOREMS, parseLiveTypesTheoremsSource,
  kernelCheckLiveTypesTheoremsSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveTypesTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveTypesTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveTypesTheorems.main args
