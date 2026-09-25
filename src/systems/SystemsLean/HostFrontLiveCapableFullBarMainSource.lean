/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live CapableFullBarMain.lean bytes.
  Side: classic Lean elaborator under src/systems (not freestanding C).
  Short role: HostFrontLiveCapableFullBarMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses CapableFullBarMain.lean only. Do not wrap CapableFullBar.lean.
  Do not wrap CapableReadMain.lean. Do not wrap CapableMain.lean.
  CapableWrite.lean does not exist and is not invented.
  Unique needles use trailing newline so HostFrontLiveCapableFullBarMain is not a
  prefix hit on HostFrontLiveCapableFullBarMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveCapableFullBarMain is not a prefix):
  HostFrontLiveCapableFullBarMainSource
  PARSE-LIVE-CAPABLE-FULL-BAR-MAIN
  HOST-FRONT-LIVE-CAPABLE-FULL-BAR-MAIN
  CAPABLE-FULL-BAR-MAIN
  Greppable: SYSTEMS_LEAN_HOST, liveCapableFullBarMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveCapableFullBarMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveCapableFullBarMainSource

/-- Dual-pinned live CapableFullBarMain.lean bytes (must match on-disk file).
    Greppable: liveCapableFullBarMainSource, PARSE-LIVE-CAPABLE-FULL-BAR-MAIN. -/
def liveCapableFullBarMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding-capable Full
  bar / ownership-gap measure (SKELETON). Root for lake exe
  slake-freestanding-capable-full-bar. Body lives in
  SystemsLean.CapableFullBar
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the Full-bar
  bulk without top-level main clash (batch-14 SelfApplyFs split; same
  pattern as ProductPathOwnershipRegenerateMain /
  PerformEvidenceMain /
  OfficialPathMain /
  OfficialPathAlternateMain /
  DualEqWriteParityMain /
  DualEqWriteClosePathMain /
  DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-capable-full-bar,
  CapableFullBarMain,
  productPathFreestandingCapableFullBar,
  CapableFullBar,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.CapableFullBar

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.CapableFullBar.main args
"#

end SystemsLean.HostFrontLiveCapableFullBarMainSource

namespace SystemsLean.HostFrontLiveCapableFullBarMainParse

/-- Same bytes, visible in the parser namespace. Not a second copy. -/
def liveCapableFullBarMainSource : String :=
  SystemsLean.HostFrontLiveCapableFullBarMainSource.liveCapableFullBarMainSource

end SystemsLean.HostFrontLiveCapableFullBarMainParse
