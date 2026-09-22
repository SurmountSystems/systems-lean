/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live SelfHostCompleteMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSelfHostCompleteMainSource. Not occupancy name 50.
  Not mill 69 remill. Mill stays 69 of 69.
  This wrap parses SelfHostCompleteMain.lean only. Do not wrap SelfHostComplete.lean.
  HostFrontLiveSelfHostComplete wraps SelfHostComplete.lean, not this mill Main.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveSelfHostCompleteMain is not a
  prefix hit on HostFrontLiveSelfHostCompleteMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveSelfHostCompleteMain is not a prefix):
  HostFrontLiveSelfHostCompleteMainSource
  PARSE-LIVE-SELF-HOST-COMPLETE-MAIN
  HOST-FRONT-LIVE-SELF-HOST-COMPLETE-MAIN
  SELF-HOST-COMPLETE-MAIN
  Live product needles:
  SelfHostCompleteMain
  slake-freestanding-self-host-complete
  import SystemsLean.SelfHostComplete
  SELF-HOST-FREESTANDING-PRODUCT-COMPLETE
  printSelfHostCompleteMeasure
  Greppable: SYSTEMS_LEAN_HOST, liveSelfHostCompleteMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveSelfHostCompleteMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveSelfHostCompleteMain

/-- Dual-pinned live SelfHostCompleteMain.lean bytes (must match on-disk file).
    Greppable: liveSelfHostCompleteMainSource, PARSE-LIVE-SELF-HOST-COMPLETE-MAIN. -/
def liveSelfHostCompleteMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding product
  self-host complete (claim B). Root for lake exe
  slake-freestanding-self-host-complete (bootstrap / mill 69 helper). Body
  lives in SystemsLean.SelfHostComplete (CLI printSelfHostCompleteMeasure;
  fail-closed if Ok false). Not a second product CLI. Not an empty stub.
  Greppable: SystemsLean.SelfHostCompleteMain,
  slake-freestanding-self-host-complete, SelfHostCompleteMain,
  SELF-HOST-FREESTANDING-PRODUCT-COMPLETE, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.SelfHostCompleteMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not S4.
-/

import SystemsLean.SelfHostComplete

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.SelfHostComplete.main args
"#

end SystemsLean.HostFrontLiveSelfHostCompleteMain
