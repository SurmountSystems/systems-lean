/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live OfficialPathMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostOfficialPathMainSource. Occupancy stays 49.
  Not occupancy name 50. Not mill 12 remill (just twelfth-host-tool).
  Mill stays 69 of 69.
  This wrap parses OfficialPathMain.lean only. Do not wrap OfficialPath.lean.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk. Do not steal HostFrontLiveOfficialPathMain.lean.
  Unique needles use trailing newline so HostFrontLiveHostOfficialPathMain is not a
  prefix hit on HostFrontLiveHostOfficialPathMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveHostOfficialPathMain is not a prefix):
  HostFrontLiveHostOfficialPathMainSource
  PARSE-LIVE-HOST-OFFICIAL-PATH-MAIN
  HOST-FRONT-LIVE-HOST-OFFICIAL-PATH-MAIN
  OFFICIAL-PATH-MAIN
  HOST-OFFICIAL-PATH-MAIN
  Live product needles:
  OfficialPathMain
  slake-freestanding-perform-official-path
  import SystemsLean.OfficialPath
  productPathFreestandingPerformOfficialPath
  Greppable: SYSTEMS_LEAN_HOST, liveHostOfficialPathMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostOfficialPathMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostOfficialPathMain

/-- Dual-pinned live OfficialPathMain.lean bytes (must match on-disk file).
    Greppable: liveHostOfficialPathMainSource, PARSE-LIVE-HOST-OFFICIAL-PATH-MAIN. -/
def liveHostOfficialPathMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for official-path gap
  (SKELETON). Root for lake exe
  slake-freestanding-perform-official-path. Body lives in
  SystemsLean.OfficialPath
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the official-path
  gap without top-level main clash (batch-11 SelfApplyFs split; same
  pattern as OfficialPathAlternateMain /
  DualEqWriteParityMain /
  DualEqWriteClosePathMain /
  DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-perform-official-path,
  OfficialPathMain,
  productPathFreestandingPerformOfficialPath,
  OfficialPath,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.OfficialPath

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.OfficialPath.main args
"#

end SystemsLean.HostFrontLiveHostOfficialPathMain
