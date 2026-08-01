/-
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
