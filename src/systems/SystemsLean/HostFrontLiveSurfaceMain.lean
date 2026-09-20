/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SURFACE.
  Root for optional lean --run of live HostModuleCheckSurface.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSurface.
  Greppable: SystemsLean.HostFrontLiveSurfaceMain,
  HostFrontLiveSurfaceMain, HOST-FRONT-LIVE-SURFACE,
  SLAKE_HOST_FRONT_LIVE_SURFACE_V0, PARSE-LIVE-SURFACE,
  parseLiveSurfaceSource, kernelCheckLiveSurfaceSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSurfaceMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSurface

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSurface.main args
