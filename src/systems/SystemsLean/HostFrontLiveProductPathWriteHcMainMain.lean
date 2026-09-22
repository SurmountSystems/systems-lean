/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-WRITE-HC-MAIN.
  Root for optional lean --run of live ProductPathWriteHcMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathWriteHcMain.
  Unique needles (trailing newline so HostFrontLiveProductPathWriteHcMain is not a prefix):
  HostFrontLiveProductPathWriteHcMainMain
  PARSE-LIVE-PRODUCT-PATH-WRITE-HC-MAIN
  HOST-FRONT-LIVE-PRODUCT-PATH-WRITE-HC-MAIN
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITE_HC_MAIN_V0
  Greppable: SystemsLean.HostFrontLiveProductPathWriteHcMainMain,
  parseLiveProductPathWriteHcMainSource,
  kernelCheckLiveProductPathWriteHcMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathWriteHcMainMain
  Not mill 66 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathWriteHcMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathWriteHcMain.main args
