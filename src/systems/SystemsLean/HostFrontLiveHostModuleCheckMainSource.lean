/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckMainSource. Not occupancy name 50.
  Not a remill. Mill stays 69 of 69.
  This wrap parses HostModuleCheckMain.lean only. Do not wrap HostModuleCheck.lean.
  Do not wrap HostModuleCheckTheorems.lean.
  liveRel is the bare name HostModuleCheckMain.lean. Do not redefine it
  in the parser.
  Greppable: SYSTEMS_LEAN_HOST, liveHostModuleCheckMainSource, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckMain

/-- Live file bare name. Not a path. Greppable: liveRel. -/
def liveRel : String := "HostModuleCheckMain.lean"

/-- Dual-pinned live HostModuleCheckMain.lean bytes (must match on-disk file).
    Greppable: liveHostModuleCheckMainSource, PARSE-LIVE-HOST-MODULE-CHECK-MAIN. -/
def liveHostModuleCheckMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for first real host module
  check without Lake on the measured step (SKELETON; plan A5). Root for
  lake exe slake-host-module-check. Body lives in SystemsLean.HostModuleCheck
  (hostModuleCheckReady / loadMultModuleCheck walk).
  Greppable: SystemsLean.HostModuleCheckMain, slake-host-module-check,
  HostModuleCheckMain, HOST-MODULE-CHECK, SLAKE_HOST_MODULE_CHECK,
  hostModuleCheckReady, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.HostModuleCheckMain
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheck

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostModuleCheck.main args
"#

end SystemsLean.HostFrontLiveHostModuleCheckMain
