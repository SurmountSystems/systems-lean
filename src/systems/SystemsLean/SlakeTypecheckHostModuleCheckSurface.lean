/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live HostModuleCheckSurface.lean.
  Short role: driver. Three slices, each HostKernel.kernelCheck.
  Not a constant true. Not Lake. Not mill. FullHost stays false.
  Occupancy stays 49. Host tools stay 69 of 69.
  Build dir build/slake-typecheck-HostModuleCheckSurface.
-/

import SystemsLean.HostFrontLiveHostModuleCheckSurface

/-- Bare product basename. No slash. -/
def liveRel : String := "HostModuleCheckSurface.lean"

/-- lean --run entry. Prints liveRel inside the checker, then EXIT. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostModuleCheckSurface.main args
