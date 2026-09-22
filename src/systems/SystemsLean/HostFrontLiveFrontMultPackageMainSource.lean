/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live FrontMultPackageMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveFrontMultPackageMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses FrontMultPackageMain.lean only. Do not wrap
  FrontMultPackage.lean. Do not invent FrontMultPackageTheorems.lean.
  Unique needles use trailing newline so HostFrontLiveFrontMultPackageMain
  is not a prefix hit on HostFrontLiveFrontMultPackageMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveFrontMultPackageMain
  is not a prefix):
  HostFrontLiveFrontMultPackageMainSource
  PARSE-LIVE-FRONT-MULT-PACKAGE-MAIN
  HOST-FRONT-LIVE-FRONT-MULT-PACKAGE-MAIN
  FRONT-MULT-PACKAGE-MAIN
  Greppable: SYSTEMS_LEAN_HOST, liveFrontMultPackageMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveFrontMultPackageMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveFrontMultPackageMain

/-- Dual-pinned live FrontMultPackageMain.lean bytes (must match on-disk file).
    Greppable: liveFrontMultPackageMainSource, PARSE-LIVE-FRONT-MULT-PACKAGE-MAIN. -/
def liveFrontMultPackageMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for M5 front-end Mult
  package path (SKELETON). Root for lake exe slake-front-mult-package. Body
  lives in SystemsLean.FrontMultPackage (frontMultPackageReady / G1 accept +
  Mult package write).
  Greppable: SystemsLean.FrontMultPackageMain, slake-front-mult-package,
  FrontMultPackageMain, FRONT-MULT-PACKAGE, SLAKE_FRONT_MULT_PACKAGE,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.FrontMultPackageMain
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.FrontMultPackage

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.FrontMultPackage.main args
"#

end SystemsLean.HostFrontLiveFrontMultPackageMain
