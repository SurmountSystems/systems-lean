/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SURFACE-MATRIX-THEOREMS.
  Root for optional lean --run of live SurfaceMatrixTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSurfaceMatrixTheorems.
  Unique needles (trailing newline so SurfaceMatrix wrap is not a prefix):
  HostFrontLiveSurfaceMatrixTheoremsMain
  PARSE-LIVE-SURFACE-MATRIX-THEOREMS
  HOST-FRONT-LIVE-SURFACE-MATRIX-THEOREMS
  SLAKE_HOST_FRONT_LIVE_SURFACE_MATRIX_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveSurfaceMatrixTheoremsMain,
  parseLiveSurfaceMatrixTheoremsSource,
  kernelCheckLiveSurfaceMatrixTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSurfaceMatrixTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSurfaceMatrixTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSurfaceMatrixTheorems.main args
