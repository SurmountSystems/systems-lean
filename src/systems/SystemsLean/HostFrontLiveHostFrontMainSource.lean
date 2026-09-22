/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostFrontMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostFrontMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses HostFrontMain.lean only. Do not wrap HostFront.lean.
  HostFrontLiveFront wraps HostFront.lean, not this mill Main.
  Do not steal HostFrontLiveFrontMain.lean.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveHostFrontMain is not a
  prefix hit on HostFrontLiveHostFrontMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveHostFrontMain is not a prefix):
  HostFrontLiveHostFrontMainSource
  PARSE-LIVE-HOST-FRONT-MAIN
  HOST-FRONT-LIVE-HOST-FRONT-MAIN
  HOST-FRONT-MAIN
  Live product needles:
  HostFrontMain
  slake-host-front
  import SystemsLean.HostFront
  HOST-FRONT
  SLAKE_HOST_FRONT
  Greppable: SYSTEMS_LEAN_HOST, liveHostFrontMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostFrontMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostFrontMain

/-- Dual-pinned live HostFrontMain.lean bytes (must match on-disk file).
    Greppable: liveHostFrontMainSource, PARSE-LIVE-HOST-FRONT-MAIN. -/
def liveHostFrontMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Mult-first host fragment
  front-end (SKELETON). Root for lake exe slake-host-front. Body lives in
  SystemsLean.HostFront (hostFrontReady / golden parse+check).
  Greppable: SystemsLean.HostFrontMain, slake-host-front, HostFrontMain,
  HOST-FRONT, SLAKE_HOST_FRONT, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.HostFrontMain
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostFront

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFront.main args
"#

end SystemsLean.HostFrontLiveHostFrontMain
