/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live CapableMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCapableMainSource. Not occupancy name 50.
  Not mill 5 remill. Mill stays 69 of 69.
  This wrap parses CapableMain.lean only. Do not wrap Capable.lean.
  CapableWrite.lean does not exist and is not invented.
  Unique needles use trailing newline so HostFrontLiveCapableMain is not a
  prefix hit on HostFrontLiveCapableMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveCapableMain is not a prefix):
  HostFrontLiveCapableMainSource
  PARSE-LIVE-CAPABLE-MAIN
  HOST-FRONT-LIVE-CAPABLE-MAIN
  CAPABLE-MAIN
  Greppable: SYSTEMS_LEAN_HOST, liveCapableMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveCapableMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveCapableMain

/-- Dual-pinned live CapableMain.lean bytes (must match on-disk file).
    Greppable: liveCapableMainSource, PARSE-LIVE-CAPABLE-MAIN. -/
def liveCapableMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding-capable gap
  measure (SKELETON). Root for lake exe slake-freestanding-capable-gap.
  Body lives in SystemsLean.Capable
  (printGapMeasure / Ok / PartialReady bulk). Thin main so SelfApplyFs may
  import the capable-gap API without top-level main clash.
  Greppable: slake-freestanding-capable-gap,
  CapableMain, printGapMeasure,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.Capable

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.Capable.main args
"#

end SystemsLean.HostFrontLiveCapableMain
