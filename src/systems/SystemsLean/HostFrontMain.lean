/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Mult-first host fragment
  front-end (SKELETON). Root for lake exe slake-host-front. Body lives in
  SystemsLean.HostFront (hostFrontReady / golden parse+check).
  Greppable: SystemsLean.HostFrontMain, slake-host-front, HostFrontMain,
  HOST-FRONT, SLAKE_HOST_FRONT, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.HostFrontMain
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostFront

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFront.main args
