/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SURFACE-MATRIX.
  Root for optional lean --run of live SurfaceMatrix.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSurfaceMatrix.
  Unique needles (trailing newline so HostFrontLiveSurface is not a prefix):
  HostFrontLiveSurfaceMatrixMain
  PARSE-LIVE-SURFACE-MATRIX
  HOST-FRONT-LIVE-SURFACE-MATRIX
  SLAKE_HOST_FRONT_LIVE_SURFACE_MATRIX_V0
  Greppable: SystemsLean.HostFrontLiveSurfaceMatrixMain,
  parseLiveSurfaceMatrixSource,
  kernelCheckLiveSurfaceMatrixSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSurfaceMatrixMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSurfaceMatrix

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSurfaceMatrix.main args
