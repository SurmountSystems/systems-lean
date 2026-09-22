/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-COMPILE-PATH-EXTRACT.
  Root for optional lean --run of live CompilePathExtract.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCompilePathExtract.
  Unique needles (trailing newline so HostFrontLiveCompilePathExtract is not a prefix
  of Source or Main):
  HostFrontLiveCompilePathExtractMain
  PARSE-LIVE-COMPILE-PATH-EXTRACT
  HOST-FRONT-LIVE-COMPILE-PATH-EXTRACT
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_EXTRACT_V0
  Greppable: SystemsLean.HostFrontLiveCompilePathExtractMain,
  parseLiveCompilePathExtractSource,
  kernelCheckLiveCompilePathExtractSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCompilePathExtractMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCompilePathExtract

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCompilePathExtract.main args
