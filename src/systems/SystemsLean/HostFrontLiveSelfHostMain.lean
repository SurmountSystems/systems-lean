/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SELF-HOST.
  Root for optional lean --run of live SelfHost.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSelfHost.
  Unique needles (trailing newline so SelfHostTheorems wrap is not a prefix):
  HostFrontLiveSelfHostMain
  PARSE-LIVE-SELF-HOST
  HOST-FRONT-LIVE-SELF-HOST
  SLAKE_HOST_FRONT_LIVE_SELF_HOST_V0
  Greppable: SystemsLean.HostFrontLiveSelfHostMain, HostFrontLiveSelfHostMain,
  HOST-FRONT-LIVE-SELF-HOST, SLAKE_HOST_FRONT_LIVE_SELF_HOST_V0,
  PARSE-LIVE-SELF-HOST,
  parseLiveSelfHostSource, kernelCheckLiveSelfHostSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSelfHostMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSelfHost

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSelfHost.main args
