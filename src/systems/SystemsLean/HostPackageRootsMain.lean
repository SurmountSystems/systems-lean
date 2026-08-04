/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for package roots / library
  module list without Lake on the measured step (SKELETON; plan A3). Root for
  lake exe slake-host-package-roots. Body lives in SystemsLean.HostPackageRoots
  (hostPackageRootsReady / loadPackageRoots walk).
  Greppable: SystemsLean.HostPackageRootsMain, slake-host-package-roots,
  HostPackageRootsMain, HOST-PACKAGE-ROOTS, SLAKE_HOST_PACKAGE_ROOTS,
  hostPackageRootsReady, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.HostPackageRootsMain
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostPackageRoots

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostPackageRoots.main args
