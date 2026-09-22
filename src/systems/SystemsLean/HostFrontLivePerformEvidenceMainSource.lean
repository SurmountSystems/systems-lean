/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live PerformEvidenceMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLivePerformEvidenceMainSource. Not occupancy name 50.
  Not mill 11 remill (just eleventh-host-tool / inventory row 14). Mill stays 69 of 69.
  This wrap parses PerformEvidenceMain.lean only. Do not wrap PerformEvidence.lean.
  Short name is free because HostFrontLivePerformEvidence (library wrap) does not exist.
  Do not mint HostFrontLiveHostPerformEvidenceMain.
  Do not steal HostFrontLivePerformClaimedMain. PerformEvidence is not PerformClaimed.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLivePerformEvidenceMain is not a
  prefix hit on HostFrontLivePerformEvidenceMainSource.
  Occupancy leftover Term files are not this wrap.
  Unique needles (trailing newline so HostFrontLivePerformEvidenceMain is not a prefix):
  HostFrontLivePerformEvidenceMainSource
  PARSE-LIVE-PERFORM-EVIDENCE-MAIN
  HOST-FRONT-LIVE-PERFORM-EVIDENCE-MAIN
  PERFORM-EVIDENCE-MAIN
  HOST-PERFORM-EVIDENCE-MAIN
  Live product needles:
  PerformEvidenceMain
  slake-freestanding-perform-evidence
  import SystemsLean.PerformEvidence
  productPathFreestandingPerformEvidence
  PerformEvidence
  SKELETON
  Greppable: SYSTEMS_LEAN_HOST, livePerformEvidenceMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLivePerformEvidenceMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLivePerformEvidenceMain

/-- Dual-pinned live PerformEvidenceMain.lean bytes (must match on-disk file).
    Greppable: livePerformEvidenceMainSource, PARSE-LIVE-PERFORM-EVIDENCE-MAIN. -/
def livePerformEvidenceMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding perform
  evidence (SKELETON). Root for lake exe
  slake-freestanding-perform-evidence. Body lives in
  SystemsLean.PerformEvidence
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the perform
  evidence bulk without top-level main clash (batch-12 SelfApplyFs split; same
  pattern as OfficialPathMain /
  OfficialPathAlternateMain /
  DualEqWriteParityMain /
  DualEqWriteClosePathMain /
  DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-perform-evidence,
  PerformEvidenceMain,
  productPathFreestandingPerformEvidence,
  PerformEvidence,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.PerformEvidence

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.PerformEvidence.main args
"#

end SystemsLean.HostFrontLivePerformEvidenceMain
