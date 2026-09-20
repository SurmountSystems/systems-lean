/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-REQUIRED-DECLS.
  Root for optional lean --run of live HostModuleCheckRequiredDecls.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveRequiredDecls.
  Greppable: SystemsLean.HostFrontLiveRequiredDeclsMain,
  HostFrontLiveRequiredDeclsMain, HOST-FRONT-LIVE-REQUIRED-DECLS,
  SLAKE_HOST_FRONT_LIVE_REQUIRED_DECLS_V0, PARSE-LIVE-REQUIRED-DECLS,
  parseLiveRequiredDeclsSource, kernelCheckLiveRequiredDeclsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveRequiredDeclsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveRequiredDecls

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveRequiredDecls.main args
