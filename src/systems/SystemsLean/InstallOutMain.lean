/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding-capable Install Out
  (SKELETON). Root for lake exe slake-freestanding-capable-install-out. Body lives in
  SystemsLean.InstallOut
  (freestandingCapableInstallFreestandingOut). Thin main so
  CapableRegenerate may import the Install Out API without
  top-level main clash.
  Greppable: slake-freestanding-capable-install-out,
  InstallOutMain, freestandingCapableInstallFreestandingOut,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.InstallOut

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.InstallOut.main args
