/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live CapableRegenerateMain.lean bytes.
  Side: classic Lean elaborator under src/systems (not freestanding C).
  Short role: HostFrontLiveCapableRegenerateMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses CapableRegenerateMain.lean only. Do not wrap CapableRegenerate.lean.
  Do not wrap Capable.lean. Do not wrap CapableMain.lean. CapableWrite.lean does not exist and is
  not invented.
  Unique needles use trailing newline so HostFrontLiveCapableRegenerateMain is not a
  prefix hit on HostFrontLiveCapableRegenerateMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveCapableRegenerateMain is not a prefix):
  HostFrontLiveCapableRegenerateMainSource
  PARSE-LIVE-CAPABLE-REGENERATE-MAIN
  HOST-FRONT-LIVE-CAPABLE-REGENERATE-MAIN
  CAPABLE-REGENERATE-MAIN
  Greppable: SYSTEMS_LEAN_HOST, liveCapableRegenerateMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveCapableRegenerateMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveCapableRegenerateMain

/-- Dual-pinned live CapableRegenerateMain.lean bytes (must match on-disk file).
    Greppable: liveCapableRegenerateMainSource, PARSE-LIVE-CAPABLE-REGENERATE-MAIN. -/
def liveCapableRegenerateMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding-capable ordered
  regenerate pipeline (SKELETON). Root for lake exe
  slake-freestanding-capable-regenerate. Body lives in
  SystemsLean.CapableRegenerate
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the regenerate
  bulk without top-level main clash (batch-16 SelfApplyFs split; same
  pattern as CapableFullBarMain /
  InstallOutMain /
  ProductPathOwnershipRegenerateMain /
  PerformEvidenceMain /
  OfficialPathMain /
  OfficialPathAlternateMain /
  DualEqWriteParityMain /
  DualEqWriteClosePathMain /
  DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-capable-regenerate,
  CapableRegenerateMain,
  productPathFreestandingCapableRegenerate,
  CapableRegenerate,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.CapableRegenerate

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.CapableRegenerate.main args
"#

end SystemsLean.HostFrontLiveCapableRegenerateMain
