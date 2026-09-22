/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-COMPILE-PATH-APPLY.
  Root for optional lean --run of live CompilePathApply.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCompilePathApply.
  Unique needles (trailing newline so HostFrontLiveCompilePathApply is not a prefix
  of Source):
  HostFrontLiveCompilePathApplyMain
  PARSE-LIVE-COMPILE-PATH-APPLY
  HOST-FRONT-LIVE-COMPILE-PATH-APPLY
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_APPLY_V0
  Greppable: SystemsLean.HostFrontLiveCompilePathApplyMain,
  parseLiveCompilePathApplySource,
  kernelCheckLiveCompilePathApplySource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCompilePathApplyMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Occupancy leftover HostModuleCheckCompilePathApplyTerm is not this wrap.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCompilePathApply

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCompilePathApply.main args
