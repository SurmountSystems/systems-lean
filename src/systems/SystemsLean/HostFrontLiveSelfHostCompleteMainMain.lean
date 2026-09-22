/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SELF-HOST-COMPLETE-MAIN.
  Root for optional lean --run of live SelfHostCompleteMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSelfHostCompleteMain.
  Unique needles (trailing newline so HostFrontLiveSelfHostCompleteMain is not a prefix):
  HostFrontLiveSelfHostCompleteMainMain
  PARSE-LIVE-SELF-HOST-COMPLETE-MAIN
  HOST-FRONT-LIVE-SELF-HOST-COMPLETE-MAIN
  SLAKE_HOST_FRONT_LIVE_SELF_HOST_COMPLETE_MAIN_V0
  Greppable: SystemsLean.HostFrontLiveSelfHostCompleteMainMain,
  parseLiveSelfHostCompleteMainSource,
  kernelCheckLiveSelfHostCompleteMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSelfHostCompleteMainMain
  Not mill 69 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSelfHostCompleteMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSelfHostCompleteMain.main args
