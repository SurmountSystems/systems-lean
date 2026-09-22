/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live CapableWriteHcMain.lean bytes.
  Side: classic Lean elaborator under src/systems (not freestanding C).
  Short role: HostFrontLiveCapableWriteHcMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses CapableWriteHcMain.lean only. Do not wrap CapableWriteHc.lean.
  Do not wrap CapableReadMain.lean. Do not wrap CapableMain.lean.
  Do not wrap CapableFullBarMain.lean. Do not wrap CapableStepContractMain.lean.
  CapableWrite.lean does not exist and is not invented.
  Unique needles use trailing newline so HostFrontLiveCapableWriteHcMain is not a
  prefix hit on HostFrontLiveCapableWriteHcMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveCapableWriteHcMain is not a prefix):
  HostFrontLiveCapableWriteHcMainSource
  PARSE-LIVE-CAPABLE-WRITE-HC-MAIN
  HOST-FRONT-LIVE-CAPABLE-WRITE-HC-MAIN
  CAPABLE-WRITE-HC-MAIN
  Greppable: SYSTEMS_LEAN_HOST, liveCapableWriteHcMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveCapableWriteHcMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveCapableWriteHcMain

/-- Dual-pinned live CapableWriteHcMain.lean bytes (must match on-disk file).
    Greppable: liveCapableWriteHcMainSource, PARSE-LIVE-CAPABLE-WRITE-HC-MAIN. -/
def liveCapableWriteHcMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding-capable WRITE-HC (SKELETON).
  Root for lake exe slake-freestanding-capable-write-hc. Body lives in
  SystemsLean.CapableWriteHc
  (freestandingCapableWriteFreestandingHc). Thin main so
  CapableRegenerate may import the WRITE-HC API without
  top-level main clash.
  Greppable: slake-freestanding-capable-write-hc,
  CapableWriteHcMain, freestandingCapableWriteFreestandingHc,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.CapableWriteHc

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.CapableWriteHc.main args
"#

end SystemsLean.HostFrontLiveCapableWriteHcMain
