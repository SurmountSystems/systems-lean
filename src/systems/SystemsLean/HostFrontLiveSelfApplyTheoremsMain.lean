/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SELF-APPLY-THEOREMS.
  Root for optional lean --run of live SelfApplyTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSelfApplyTheorems.
  Unique needles (own lines; THEOREMS suffix so they are not a prefix of a
  shorter name):
  HostFrontLiveSelfApplyTheoremsMain
  PARSE-LIVE-SELF-APPLY-THEOREMS
  HOST-FRONT-LIVE-SELF-APPLY-THEOREMS
  SLAKE_HOST_FRONT_LIVE_SELF_APPLY_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveSelfApplyTheoremsMain,
  HostFrontLiveSelfApplyTheoremsMain, HOST-FRONT-LIVE-SELF-APPLY-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_SELF_APPLY_THEOREMS_V0,
  PARSE-LIVE-SELF-APPLY-THEOREMS,
  parseLiveSelfApplyTheoremsSource,
  kernelCheckLiveSelfApplyTheoremsSource,
  liveRel,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSelfApplyTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Not HostFrontLiveSelfApplyFsCloseMain (that wrap parses SelfApplyFsClose.lean).
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSelfApplyTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSelfApplyTheorems.main args
