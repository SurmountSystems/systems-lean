/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SELF-HOST-COMPLETE-THEOREMS.
  Root for optional lean --run of live SelfHostCompleteTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveSelfHostCompleteTheorems.
  Greppable: SystemsLean.HostFrontLiveSelfHostCompleteTheoremsMain,
  HostFrontLiveSelfHostCompleteTheoremsMain,
  HOST-FRONT-LIVE-SELF-HOST-COMPLETE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_SELF_HOST_COMPLETE_THEOREMS_V0,
  PARSE-LIVE-SELF-HOST-COMPLETE-THEOREMS, COMPLETE-THEOREM,
  parseLiveSelfHostCompleteTheoremsSource,
  kernelCheckLiveSelfHostCompleteTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSelfHostCompleteTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveSelfHostCompleteTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSelfHostCompleteTheorems.main args
