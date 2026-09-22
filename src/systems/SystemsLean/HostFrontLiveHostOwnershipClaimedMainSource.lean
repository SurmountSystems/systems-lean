/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live OwnershipClaimedMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostOwnershipClaimedMainSource. Occupancy stays 49.
  Not occupancy name 50. Not mill 19 remill (just nineteenth-host-tool).
  Mill stays 69 of 69.
  This wrap parses OwnershipClaimedMain.lean only. Do not wrap OwnershipClaimed.lean.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk. Do not steal HostFrontLiveOwnershipClaimedMain.lean.
  Unique needles use trailing newline so HostFrontLiveHostOwnershipClaimedMain is not a
  prefix hit on HostFrontLiveHostOwnershipClaimedMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveHostOwnershipClaimedMain is not a prefix):
  HostFrontLiveHostOwnershipClaimedMainSource
  PARSE-LIVE-HOST-OWNERSHIP-CLAIMED-MAIN
  HOST-FRONT-LIVE-HOST-OWNERSHIP-CLAIMED-MAIN
  OWNERSHIP-CLAIMED-MAIN
  HOST-OWNERSHIP-CLAIMED-MAIN
  Live product needles:
  OwnershipClaimedMain
  slake-freestanding-ownership-claimed
  import SystemsLean.OwnershipClaimed
  productPathFreestandingOwnershipClaimed
  Greppable: SYSTEMS_LEAN_HOST, liveHostOwnershipClaimedMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostOwnershipClaimedMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostOwnershipClaimedMain

/-- Dual-pinned live OwnershipClaimedMain.lean bytes (must match on-disk file).
    Greppable: liveHostOwnershipClaimedMainSource, PARSE-LIVE-HOST-OWNERSHIP-CLAIMED-MAIN. -/
def liveHostOwnershipClaimedMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for OWNERSHIP-CLAIMED
  (SKELETON). Root for lake exe slake-freestanding-ownership-claimed. Body lives in
  SystemsLean.OwnershipClaimed (Ok / PartialReady bulk). Thin main so
  SelfApplyFs may import the OWNERSHIP-CLAIMED API without top-level main clash
  (batch-3 SelfApplyFs split; same pattern as StepContractFullMain / InstallOutMain).
  Greppable: slake-freestanding-ownership-claimed,
  OwnershipClaimedMain, productPathFreestandingOwnershipClaimed, OwnershipClaimed,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.OwnershipClaimed

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.OwnershipClaimed.main args
"#

end SystemsLean.HostFrontLiveHostOwnershipClaimedMain
