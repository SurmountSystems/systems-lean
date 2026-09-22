/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-READ-SSOT-MAIN.
  Root for optional lean --run of live ProductPathReadSsotMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathReadSsotMain.
  Unique needles (trailing newline so HostFrontLiveProductPathReadSsotMain is not a prefix):
  HostFrontLiveProductPathReadSsotMainMain
  PARSE-LIVE-PRODUCT-PATH-READ-SSOT-MAIN
  HOST-FRONT-LIVE-PRODUCT-PATH-READ-SSOT-MAIN
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_READ_SSOT_MAIN_V0
  PRODUCT-PATH-READ-SSOT-MAIN
  HOST-PRODUCT-PATH-READ-SSOT-MAIN
  Greppable: SystemsLean.HostFrontLiveProductPathReadSsotMainMain,
  parseLiveProductPathReadSsotMainSource,
  kernelCheckLiveProductPathReadSsotMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathReadSsotMainMain
  Not mill remill. Mill stays 69 of 69. Occupancy stays 49. Not FullHost.
  Do not invent HostFrontLiveProductPathReadSsot (library wrap).
  Do not wrap ProductPathReadSsot.lean. Do not wrap ProductPathReadSsotTheorems.lean.
  Do not steal HostFrontLiveProductPathWriteHcMain.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathReadSsotMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathReadSsotMain.main args
