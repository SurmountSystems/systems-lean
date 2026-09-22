/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live PerformClaimedMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostPerformClaimedMainSource. Not occupancy name 50.
  Not mill 18 remill (just eighteenth-host-tool / inventory row 22). Mill stays 69 of 69.
  This wrap parses PerformClaimedMain.lean only. Do not wrap PerformClaimed.lean.
  Do not steal HostFrontLivePerformClaimedMain (library companion).
  Do not wrap OfficialPathMain. Do not wrap OfficialRetireMain.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveHostPerformClaimedMain is not a
  prefix hit on HostFrontLiveHostPerformClaimedMainSource.
  Occupancy leftover Term files are not this wrap.
  Unique needles (trailing newline so HostFrontLiveHostPerformClaimedMain is not a prefix):
  HostFrontLiveHostPerformClaimedMainSource
  PARSE-LIVE-PERFORM-CLAIMED-MAIN
  HOST-FRONT-LIVE-PERFORM-CLAIMED-MAIN
  PERFORM-CLAIMED-MAIN
  HOST-PERFORM-CLAIMED-MAIN
  Live product needles:
  PerformClaimedMain
  slake-freestanding-perform-claimed
  import SystemsLean.PerformClaimed
  productPathFreestandingPerformClaimed
  OwnershipClaimedMain
  SKELETON
  Greppable: SYSTEMS_LEAN_HOST, livePerformClaimedMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostPerformClaimedMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostPerformClaimedMain

/-- Dual-pinned live PerformClaimedMain.lean bytes (must match on-disk file).
    Greppable: livePerformClaimedMainSource, PARSE-LIVE-PERFORM-CLAIMED-MAIN. -/
def livePerformClaimedMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for PERFORM-CLAIMED
  (SKELETON). Root for lake exe slake-freestanding-perform-claimed. Body lives in
  SystemsLean.PerformClaimed (Ok / PartialReady bulk). Thin main so
  SelfApplyFs may import the PERFORM-CLAIMED API without top-level main clash
  (batch-4 SelfApplyFs split; same pattern as OwnershipClaimedMain /
  StepContractFullMain / InstallOutMain).
  Greppable: slake-freestanding-perform-claimed,
  PerformClaimedMain, productPathFreestandingPerformClaimed, PerformClaimed,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.PerformClaimed

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.PerformClaimed.main args
"#

end SystemsLean.HostFrontLiveHostPerformClaimedMain
