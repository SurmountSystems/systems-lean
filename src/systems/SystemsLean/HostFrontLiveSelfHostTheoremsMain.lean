/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SELF-HOST-THEOREMS.
  Root for optional lean --run of live SelfHostTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSelfHostTheorems.
  Unique needles (trailing newline so SelfHost wrap is not a prefix):
  HostFrontLiveSelfHostTheoremsMain
  PARSE-LIVE-SELF-HOST-THEOREMS
  HOST-FRONT-LIVE-SELF-HOST-THEOREMS
  SLAKE_HOST_FRONT_LIVE_SELF_HOST_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveSelfHostTheoremsMain,
  parseLiveSelfHostTheoremsSource,
  kernelCheckLiveSelfHostTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSelfHostTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSelfHostTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSelfHostTheorems.main args
