/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC.
  Root for optional lean --run of live ProductPathWriterPathExec.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathWriterPathExec.
  Greppable: SystemsLean.HostFrontLiveProductPathWriterPathExecMain, HostFrontLiveProductPathWriterPathExecMain,
  HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC, SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_PATH_EXEC_V0,
  PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC,
  parseLiveProductPathWriterPathExecSource, kernelCheckLiveProductPathWriterPathExecSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathWriterPathExecMain
  Not mill 70. Not occupancy name 50. Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathWriterPathExec

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathWriterPathExec.main args
