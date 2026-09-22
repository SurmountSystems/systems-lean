/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SELF-APPLY.
  Root for optional lean --run of live SelfApply.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveSelfApply.
  Greppable: SystemsLean.HostFrontLiveSelfApplyMain,
  HostFrontLiveSelfApplyMain, HOST-FRONT-LIVE-SELF-APPLY,
  SLAKE_HOST_FRONT_LIVE_SELF_APPLY_V0,
  PARSE-LIVE-SELF-APPLY, SELF-APPLY-THEOREM,
  parseLiveSelfApplySource,
  kernelCheckLiveSelfApplySource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSelfApplyMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveSelfApply

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSelfApply.main args
