/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-PERFORM-EVIDENCE-THEOREMS.
  Root for optional lean --run of live PerformEvidenceTheorems.lean
  parse plus HostKernel.kernelCheck. Not an emit driver. Not a backend.
  Body lives in SystemsLean.HostFrontLivePerformEvidenceTheorems.
  Greppable: SystemsLean.HostFrontLivePerformEvidenceTheoremsMain,
  HostFrontLivePerformEvidenceTheoremsMain,
  HOST-FRONT-LIVE-PERFORM-EVIDENCE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PERFORM_EVIDENCE_THEOREMS_V0,
  PARSE-LIVE-PERFORM-EVIDENCE-THEOREMS,
  PERFORM-EVIDENCE-THEOREMS-THEOREM,
  parseLivePerformEvidenceTheoremsSource,
  kernelCheckLivePerformEvidenceTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLivePerformEvidenceTheoremsMain
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLivePerformEvidenceTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLivePerformEvidenceTheorems.main args
