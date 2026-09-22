/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-PRODUCT-WIRE-WRITE-TOOL.
  Root for optional lean --run of live ProductWireWriteTool.lean
  parse plus HostKernel.kernelCheck. Not an emit driver.
  Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveProductWireWriteTool.
  Greppable: SystemsLean.HostFrontLiveProductWireWriteToolMain,
  HostFrontLiveProductWireWriteToolMain,
  HOST-FRONT-LIVE-PRODUCT-WIRE-WRITE-TOOL,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_WIRE_WRITE_TOOL_V0,
  PARSE-LIVE-PRODUCT-WIRE-WRITE-TOOL, PRODUCT-WIRE-FS-WRITE-TOOL,
  parseLiveProductWireWriteToolSource,
  kernelCheckLiveProductWireWriteToolSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductWireWriteToolMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveProductWireWriteTool

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductWireWriteTool.main args
