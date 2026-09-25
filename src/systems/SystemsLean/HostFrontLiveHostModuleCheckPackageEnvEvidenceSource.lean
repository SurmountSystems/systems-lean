/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckPackageEnvEvidence.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckPackageEnvEvidenceSource.
  Not occupancy name 50. Host tools stay 69 of 69. Not FullHost.
  Not an LLVM backend. Not Lake-gone. Not PROVABLY.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCE,
  liveHostModuleCheckPackageEnvEvidenceSource, liveRel,
  HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceSourceA
import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceSourceB

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidence

/-- Bare basename. Not a path. -/
def liveRel : String := "HostModuleCheckPackageEnvEvidence.lean"

/-- Repo-relative path for the disk read. Not liveRel. -/
def liveHostModuleCheckPackageEnvEvidenceRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Full live bytes. Concatenation of the two slices. -/
def liveHostModuleCheckPackageEnvEvidenceSource : String :=
  liveHostModuleCheckPackageEnvEvidenceSourceA
    ++ liveHostModuleCheckPackageEnvEvidenceSourceB

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidence
