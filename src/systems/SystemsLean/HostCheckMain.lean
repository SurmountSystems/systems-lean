/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Mult-first host fragment
  check (SKELETON). Root for lake exe slake-host-fragment-check. Body lives in
  SystemsLean.HostCheck (hostFragmentCheckReady / corpus check).
  Greppable: SystemsLean.HostCheckMain, slake-host-fragment-check, HostCheckMain,
  HOST-FRAGMENT-CHECK, SLAKE_HOST_FRAGMENT_CHECK, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.HostCheckMain
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostCheck

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostCheck.main args
