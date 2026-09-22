/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostCheckMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostCheckMainSource. Not occupancy name 50.
  Not mill 33 remill. Mill stays 69 of 69.
  This wrap parses HostCheckMain.lean only. Do not wrap HostCheck.lean.
  HostFrontLiveCheck wraps HostCheck.lean, not this mill Main.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveHostCheckMain is not a
  prefix hit on HostFrontLiveHostCheckMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveHostCheckMain is not a prefix):
  HostFrontLiveHostCheckMainSource
  PARSE-LIVE-HOST-CHECK-MAIN
  HOST-FRONT-LIVE-HOST-CHECK-MAIN
  HOST-CHECK-MAIN
  Live product needles:
  HostCheckMain
  slake-host-fragment-check
  import SystemsLean.HostCheck
  HOST-FRAGMENT-CHECK
  SLAKE_HOST_FRAGMENT_CHECK
  hostFragmentCheckReady
  Greppable: SYSTEMS_LEAN_HOST, liveHostCheckMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostCheckMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostCheckMain

/-- Dual-pinned live HostCheckMain.lean bytes (must match on-disk file).
    Greppable: liveHostCheckMainSource, PARSE-LIVE-HOST-CHECK-MAIN. -/
def liveHostCheckMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Mult-first host fragment
  check (SKELETON). Root for lake exe slake-host-fragment-check. Body lives in
  SystemsLean.HostCheck (hostFragmentCheckReady / corpus check).
  Greppable: SystemsLean.HostCheckMain, slake-host-fragment-check, HostCheckMain,
  HOST-FRAGMENT-CHECK, SLAKE_HOST_FRAGMENT_CHECK, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.HostCheckMain
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostCheck

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostCheck.main args
"#

end SystemsLean.HostFrontLiveHostCheckMain
