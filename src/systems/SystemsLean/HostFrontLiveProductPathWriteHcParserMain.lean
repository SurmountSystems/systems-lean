/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-WRITE-HC.
  Root for optional lean --run of live ProductPathWriteHc.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathWriteHc.
  Unique needles (trailing newline so HostFrontLiveProductPathWriteHcParserMain
  is not a prefix of a mill-Main wrap name):
  HostFrontLiveProductPathWriteHcParserMain
  PARSE-LIVE-PRODUCT-PATH-WRITE-HC
  HOST-FRONT-LIVE-PRODUCT-PATH-WRITE-HC
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITE_HC_V0
  Greppable: SystemsLean.HostFrontLiveProductPathWriteHcParserMain,
  parseLiveProductPathWriteHcSource,
  kernelCheckLiveProductPathWriteHcSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathWriteHcParserMain
  Not mill 66 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathWriteHc

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathWriteHc.main args
