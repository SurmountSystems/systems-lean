/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckPackageEnvFixturesS5.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckPackageEnvFixturesS5Source.
  Not occupancy name 50. Host tools stay 69 of 69. Not FullHost.
  Not an LLVM backend. Not Lake-gone. Not PROVABLY.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESS5,
  liveHostModuleCheckPackageEnvFixturesS5Source, liveRel,
  HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESS5, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5Source
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5SourceA
import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5SourceB

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5

/-- Bare basename. Not a path. -/
def liveRel : String := "HostModuleCheckPackageEnvFixturesS5.lean"

/-- Repo-relative path for the disk read. Not liveRel. -/
def liveHostModuleCheckPackageEnvFixturesS5Rel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Full live bytes. Concatenation of the two slices. -/
def liveHostModuleCheckPackageEnvFixturesS5Source : String :=
  liveHostModuleCheckPackageEnvFixturesS5SourceA
    ++ liveHostModuleCheckPackageEnvFixturesS5SourceB

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5
