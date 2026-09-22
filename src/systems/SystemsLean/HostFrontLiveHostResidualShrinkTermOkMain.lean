/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-RESIDUAL-SHRINK-TERM-OK.
  Root for optional lean --run of live HostResidualShrinkTermOk.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostResidualShrinkTermOk.
  Unique needles (trailing newline so they are not a prefix of the library wrap):
  HostFrontLiveHostResidualShrinkTermOkMain
  HostFrontLiveHostResidualShrinkTermOk
  PARSE-LIVE-HOST-RESIDUAL-SHRINK-TERM-OK
  HOST-FRONT-LIVE-HOST-RESIDUAL-SHRINK-TERM-OK
  SLAKE_HOST_FRONT_LIVE_HOST_RESIDUAL_SHRINK_TERM_OK_V0
  Greppable: SystemsLean.HostFrontLiveHostResidualShrinkTermOkMain,
  parseLiveHostResidualShrinkTermOkSource,
  kernelCheckLiveHostResidualShrinkTermOkSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostResidualShrinkTermOkMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostResidualShrinkTermOk

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostResidualShrinkTermOk.main args
