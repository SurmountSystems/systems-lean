/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PERFORM-EVIDENCE.
  Root for optional lean --run of live PerformEvidence.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLivePerformEvidence.
  The Main suffix would collide with PerformEvidenceMain, so this
  forwarder is Run.
  Greppable: SystemsLean.HostFrontLivePerformEvidenceRun,
  HostFrontLivePerformEvidenceRun, HOST-FRONT-LIVE-PERFORM-EVIDENCE,
  SLAKE_HOST_FRONT_LIVE_PERFORM_EVIDENCE_V0,
  PARSE-LIVE-PERFORM-EVIDENCE, PERFORM-EVIDENCE-THEOREM,
  parseLivePerformEvidenceSource,
  kernelCheckLivePerformEvidenceSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLivePerformEvidenceRun
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLivePerformEvidence

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLivePerformEvidence.main args
