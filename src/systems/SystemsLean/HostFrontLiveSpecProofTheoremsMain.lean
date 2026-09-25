/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SPECPROOFTHEOREMS.
  Root for optional lean --run of live SpecProofTheorems.lean parse +
  kernelCheck. Body lives in SystemsLean.HostFrontLiveSpecProofTheorems.
  Product ids SPEC-PROOF-THEOREM and SPEC-PROOF-SMOKE are not changed.
  Greppable: SystemsLean.HostFrontLiveSpecProofTheoremsMain,
  HostFrontLiveSpecProofTheoremsMain,
  HOST-FRONT-LIVE-SPECPROOFTHEOREMS,
  SLAKE_HOST_FRONT_LIVE_SPECPROOFTHEOREMS_V0,
  PARSE-LIVE-SPECPROOFTHEOREMS, parseLiveSpecProofTheoremsSource,
  kernelCheckLiveSpecProofTheoremsSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSpecProofTheoremsMain
  Not mill 70. Not occupancy name 50. Occupancy stays 49. Not FullHost.
  Host tools stay 69 of 69. Not Lake-gone.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSpecProofTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSpecProofTheorems.main args
