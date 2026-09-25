/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostPackageRootsMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostPackageRootsMainSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostPackageRootsMain.lean. It is not HostPackageRoots.lean.
  liveRel is the bare basename HostPackageRootsMain.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveHostPackageRootsMainSource,
  HOST-FRONT-LIVE-HOST-PACKAGE-ROOTS-MAIN, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostPackageRootsMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostPackageRootsMain

/-- Dual-pinned live HostPackageRootsMain.lean bytes (must match on-disk file).
    Greppable: liveHostPackageRootsMainSource,
    HOST-FRONT-LIVE-HOST-PACKAGE-ROOTS-MAIN. -/
def liveHostPackageRootsMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin lean then leanc inventory executable main
  for package roots / library module list without Lake on the measured step
  (SKELETON; plan A3). Inventory name: slake-host-package-roots (lakefile
  lean_exe still exists; mill is just twenty-second-host-tool). Body lives in
  SystemsLean.HostPackageRoots
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
"#

end SystemsLean.HostFrontLiveHostPackageRootsMain
