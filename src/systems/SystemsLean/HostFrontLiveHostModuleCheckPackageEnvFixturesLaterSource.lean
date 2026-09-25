/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckPackageEnvFixturesLater.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckPackageEnvFixturesLaterSource.
  Not occupancy name 50. Host tools stay 69 of 69. Not FullHost.
  Not an LLVM backend. Not Lake-gone. Not PROVABLY.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESLATER,
  liveHostModuleCheckPackageEnvFixturesLaterSource, liveRel,
  HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESLATER, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesLaterSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesLaterSourceA
import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesLaterSourceB

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesLater

/-- Bare basename. Not a path. -/
def liveRel : String := "HostModuleCheckPackageEnvFixturesLater.lean"

/-- Repo-relative path for the disk read. Not liveRel. -/
def liveHostModuleCheckPackageEnvFixturesLaterRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Full live bytes. Concatenation of the two slices. -/
def liveHostModuleCheckPackageEnvFixturesLaterSource : String :=
  liveHostModuleCheckPackageEnvFixturesLaterSourceA
    ++ liveHostModuleCheckPackageEnvFixturesLaterSourceB

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesLater
