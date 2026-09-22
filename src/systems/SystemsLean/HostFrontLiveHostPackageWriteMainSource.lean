/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostPackageWriteMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostPackageWriteMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses HostPackageWriteMain.lean only. Do not wrap HostPackageWrite.lean.
  Do not steal HostFrontLivePackageWriteMain.lean (library wrap for
  HostPackageWrite.lean). Do not wrap IrGraph.lean. Do not invent Compose parsers.
  Unique needles use trailing newline so HostFrontLiveHostPackageWriteMain is not a
  prefix hit on HostFrontLiveHostPackageWriteMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveHostPackageWriteMain is not a prefix):
  HostFrontLiveHostPackageWriteMainSource
  PARSE-LIVE-HOST-PACKAGE-WRITE-MAIN
  HOST-FRONT-LIVE-HOST-PACKAGE-WRITE-MAIN
  HOST-PACKAGE-WRITE-MAIN
  Live product needles:
  HostPackageWriteMain
  slake-host-package-write
  import SystemsLean.HostPackageWrite
  HOST-PACKAGE-WRITE
  SLAKE_HOST_PACKAGE_WRITE
  hostPackageWriteReady
  Greppable: SYSTEMS_LEAN_HOST, liveHostPackageWriteMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostPackageWriteMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostPackageWriteMain

/-- Dual-pinned live HostPackageWriteMain.lean bytes (must match on-disk file).
    Greppable: liveHostPackageWriteMainSource, PARSE-LIVE-HOST-PACKAGE-WRITE-MAIN. -/
def liveHostPackageWriteMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Mult-first elaborator
  Mult + Linear + Types + Program + Graph + Compose package write (SKELETON;
  Track 3b-9 Compose expand). Root for lake exe slake-host-package-write. Body
  lives in SystemsLean.HostPackageWrite (hostPackageWriteReady / HostFront G1 +
  HostGraph Mult set + Mult package write + HostGraph Linear expand + Linear
  package write + HostGraph Types expand + Types package write + HostGraph
  Program expand + Program package write + HostGraph Graph expand + Graph
  package write + HostGraph Compose expand + Compose package write).
  Greppable: SystemsLean.HostPackageWriteMain, slake-host-package-write,
  HostPackageWriteMain, HOST-PACKAGE-WRITE, SLAKE_HOST_PACKAGE_WRITE,
  hostPackageWriteLinearReady, hostPackageWriteTypesReady,
  hostPackageWriteProgramReady, hostPackageWriteGraphPackageReady,
  hostPackageWriteGraphExpandReady, hostPackageWriteComposePackageReady,
  hostPackageWriteComposeExpandReady, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.HostPackageWriteMain
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostPackageWrite

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostPackageWrite.main args
"#

end SystemsLean.HostFrontLiveHostPackageWriteMain
