/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-BANNER.
  Root for optional lean --run of live EmitBanner.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveEmitBanner.
  Unique needles (trailing newline so a longer name is not a prefix hit):
  HostFrontLiveEmitBannerMain
  PARSE-LIVE-EMIT-BANNER
  HOST-FRONT-LIVE-EMIT-BANNER
  SLAKE_HOST_FRONT_LIVE_EMIT_BANNER_V0
  Greppable: SystemsLean.HostFrontLiveEmitBannerMain,
  parseLiveEmitBannerSource,
  kernelCheckLiveEmitBannerSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitBannerMain
  Not mill 70. Not occupancy name 50. Occupancy stays 49. Mill stays 69 of 69.
  Not FullHost. slakeOwnsPackageTypecheck stays false. Not Lake-gone.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostFrontLiveEmitBanner

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitBanner.main args
