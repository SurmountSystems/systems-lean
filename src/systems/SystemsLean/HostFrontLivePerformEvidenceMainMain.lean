/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PERFORM-EVIDENCE-MAIN.
  Root for optional lean --run of live PerformEvidenceMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLivePerformEvidenceMain.
  Unique needles (trailing newline so HostFrontLivePerformEvidenceMain is not a prefix):
  HostFrontLivePerformEvidenceMainMain
  PARSE-LIVE-PERFORM-EVIDENCE-MAIN
  HOST-FRONT-LIVE-PERFORM-EVIDENCE-MAIN
  SLAKE_HOST_FRONT_LIVE_PERFORM_EVIDENCE_MAIN_V0
  PERFORM-EVIDENCE-MAIN
  HOST-PERFORM-EVIDENCE-MAIN
  Greppable: SystemsLean.HostFrontLivePerformEvidenceMainMain,
  parseLivePerformEvidenceMainSource,
  kernelCheckLivePerformEvidenceMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLivePerformEvidenceMainMain
  Not mill 11 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Short name is free because HostFrontLivePerformEvidence (library wrap) does not exist.
  Do not mint HostFrontLiveHostPerformEvidenceMain. Do not wrap PerformEvidence.lean.
  Do not steal HostFrontLivePerformClaimedMain. PerformEvidence is not PerformClaimed.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLivePerformEvidenceMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLivePerformEvidenceMain.main args
