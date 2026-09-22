/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC-THEOREMS.
  Root for optional lean --run of live ProductPathWriterPathExecTheorems.lean
  parse plus HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveProductPathWriterPathExecTheorems.
  Greppable: SystemsLean.HostFrontLiveProductPathWriterPathExecTheoremsMain,
  HostFrontLiveProductPathWriterPathExecTheoremsMain,
  HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_PATH_EXEC_THEOREMS_V0,
  PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC-THEOREMS, WRITER-PATH-EXEC-THEOREM,
  parseLiveProductPathWriterPathExecTheoremsSource,
  kernelCheckLiveProductPathWriterPathExecTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathWriterPathExecTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveProductPathWriterPathExecTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathWriterPathExecTheorems.main args
