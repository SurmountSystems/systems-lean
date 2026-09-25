/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SELFAPPLYFSTHEOREMS.
  Root for optional lean --run of live SelfApplyFsTheorems.lean parse +
  kernelCheck. Body lives in SystemsLean.HostFrontLiveSelfApplyFsTheorems.
  Product ids SELF-APPLY-FS-THEOREM and SELF-APPLY-FS-SMOKE are not changed.
  Greppable: SystemsLean.HostFrontLiveSelfApplyFsTheoremsMain,
  HostFrontLiveSelfApplyFsTheoremsMain,
  HOST-FRONT-LIVE-SELFAPPLYFSTHEOREMS,
  SLAKE_HOST_FRONT_LIVE_SELFAPPLYFSTHEOREMS_V0,
  PARSE-LIVE-SELFAPPLYFSTHEOREMS, parseLiveSelfApplyFsTheoremsSource,
  kernelCheckLiveSelfApplyFsTheoremsSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSelfApplyFsTheoremsMain
  Not mill 70. Not occupancy name 50. Occupancy stays 49. Not FullHost.
  Host tools stay 69 of 69. Not Lake-gone.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSelfApplyFsTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSelfApplyFsTheorems.main args
