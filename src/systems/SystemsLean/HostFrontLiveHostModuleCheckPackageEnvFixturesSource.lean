/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckPackageEnvFixtures.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckPackageEnvFixturesSource.
  Not occupancy name 50. Host tools stay 69 of 69. Not FullHost.
  Not an LLVM backend. Not Lake-gone. Not PROVABLY.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURES,
  liveHostModuleCheckPackageEnvFixturesSource, liveRel,
  HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURES, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesSourceA
import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesSourceB

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixtures

/-- Bare basename. Not a path. -/
def liveRel : String := "HostModuleCheckPackageEnvFixtures.lean"

/-- Repo-relative path for the disk read. Not liveRel. -/
def liveHostModuleCheckPackageEnvFixturesRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Full live bytes. Concatenation of the two slices. -/
def liveHostModuleCheckPackageEnvFixturesSource : String :=
  liveHostModuleCheckPackageEnvFixturesSourceA
    ++ liveHostModuleCheckPackageEnvFixturesSourceB

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixtures
