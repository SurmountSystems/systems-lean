/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SELF-HOST-COMPLETE.
  Root for optional lean --run of live SelfHostComplete.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSelfHostComplete.
  Unique needles (trailing newline so HostFrontLiveSelfHostCompleteParserMain
  is not a prefix of a mill-Main wrap name):
  HostFrontLiveSelfHostCompleteParserMain
  PARSE-LIVE-SELF-HOST-COMPLETE
  HOST-FRONT-LIVE-SELF-HOST-COMPLETE
  SLAKE_HOST_FRONT_LIVE_SELF_HOST_COMPLETE_V0
  Greppable: SystemsLean.HostFrontLiveSelfHostCompleteParserMain,
  parseLiveSelfHostCompleteSource,
  kernelCheckLiveSelfHostCompleteSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSelfHostCompleteParserMain
  Not mill 69 remill. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSelfHostComplete

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSelfHostComplete.main args
