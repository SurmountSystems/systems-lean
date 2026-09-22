/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live CapableReadMain.lean bytes.
  Side: classic Lean elaborator under src/systems (not freestanding C).
  Short role: HostFrontLiveCapableReadMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses CapableReadMain.lean only. Do not wrap Capable.lean.
  Do not wrap CapableMain.lean. CapableWrite.lean does not exist and is
  not invented.
  Unique needles use trailing newline so HostFrontLiveCapableReadMain is not a
  prefix hit on HostFrontLiveCapableReadMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveCapableReadMain is not a prefix):
  HostFrontLiveCapableReadMainSource
  PARSE-LIVE-CAPABLE-READ-MAIN
  HOST-FRONT-LIVE-CAPABLE-READ-MAIN
  CAPABLE-READ-MAIN
  Greppable: SYSTEMS_LEAN_HOST, liveCapableReadMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveCapableReadMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveCapableReadMain

/-- Dual-pinned live CapableReadMain.lean bytes (must match on-disk file).
    Greppable: liveCapableReadMainSource, PARSE-LIVE-CAPABLE-READ-MAIN. -/
def liveCapableReadMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding-capable READ (SKELETON).
  Root for lake exe slake-freestanding-capable-read. Body lives in
  SystemsLean.CapableRead (freestandingCapableReadDualSsot).
  Thin main so CapableRegenerate may import the READ API
  without top-level main clash.
  Greppable: slake-freestanding-capable-read, CapableReadMain,
  freestandingCapableReadDualSsot, SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.CapableRead

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.CapableRead.main args
"#

end SystemsLean.HostFrontLiveCapableReadMain
