/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-IR-GRAPH-THEOREMS.
  Root for optional lean --run of live IrGraphTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveIrGraphTheorems.
  Greppable: SystemsLean.HostFrontLiveIrGraphTheoremsMain,
  HostFrontLiveIrGraphTheoremsMain, HOST-FRONT-LIVE-IR-GRAPH-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_IR_GRAPH_THEOREMS_V0,
  PARSE-LIVE-IR-GRAPH-THEOREMS, IR-GRAPH-THEOREM,
  parseLiveIrGraphTheoremsSource,
  kernelCheckLiveIrGraphTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveIrGraphTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveIrGraphTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveIrGraphTheorems.main args
