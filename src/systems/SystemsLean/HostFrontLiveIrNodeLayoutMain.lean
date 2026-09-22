/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-IR-NODE-LAYOUT.
  Root for optional lean --run of live IrNodeLayout.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveIrNodeLayout.
  Greppable: SystemsLean.HostFrontLiveIrNodeLayoutMain, HostFrontLiveIrNodeLayoutMain,
  HOST-FRONT-LIVE-IR-NODE-LAYOUT, SLAKE_HOST_FRONT_LIVE_IR_NODE_LAYOUT_V0,
  PARSE-LIVE-IR-NODE-LAYOUT,
  parseLiveIrNodeLayoutSource, kernelCheckLiveIrNodeLayoutSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveIrNodeLayoutMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveIrNodeLayout

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveIrNodeLayout.main args
