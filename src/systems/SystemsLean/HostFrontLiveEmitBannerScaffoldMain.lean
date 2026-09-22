/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-BANNER-SCAFFOLD.
  Root for optional lean --run of live EmitBannerScaffold.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveEmitBannerScaffold.
  Unique needles (trailing newline so EmitBanner wrap is not a prefix):
  HostFrontLiveEmitBannerScaffoldMain
  PARSE-LIVE-EMIT-BANNER-SCAFFOLD
  HOST-FRONT-LIVE-EMIT-BANNER-SCAFFOLD
  SLAKE_HOST_FRONT_LIVE_EMIT_BANNER_SCAFFOLD_V0
  Greppable: SystemsLean.HostFrontLiveEmitBannerScaffoldMain,
  parseLiveEmitBannerScaffoldSource,
  kernelCheckLiveEmitBannerScaffoldSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitBannerScaffoldMain
  Not mill 70. Not occupancy name 50. Occupancy stays 49. Mill stays 69 of 69.
  Not FullHost. slakeOwnsPackageTypecheck stays false. Not Lake-gone.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveEmitBannerScaffold

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitBannerScaffold.main args
