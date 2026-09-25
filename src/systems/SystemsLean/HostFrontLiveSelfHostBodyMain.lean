/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SELFHOSTBODY.
  Root for optional lean --run of live SelfHostBody.lean parse +
  kernelCheck. Body lives in SystemsLean.HostFrontLiveSelfHostBody.
  Stage ids SLAKE_SELF_HOST_BODY_V0, HOST-SELF-HOST-BODY, and
  SELF-HOST-BODY are not changed.
  Greppable: SystemsLean.HostFrontLiveSelfHostBodyMain,
  HostFrontLiveSelfHostBodyMain,
  HOST-FRONT-LIVE-SELFHOSTBODY,
  SLAKE_HOST_FRONT_LIVE_SELFHOSTBODY_V0,
  PARSE-LIVE-SELFHOSTBODY, parseLiveSelfHostBodySource,
  kernelCheckLiveSelfHostBodySource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSelfHostBodyMain
  Not mill 70. Not occupancy name 50. Occupancy stays 49. Not FullHost.
  Host tools stay 69 of 69. Not Lake-gone.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSelfHostBody

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSelfHostBody.main args
