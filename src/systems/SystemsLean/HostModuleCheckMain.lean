/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for first real host module
  check without Lake on the measured step (SKELETON; plan A5). Root for
  lake exe slake-host-module-check. Body lives in SystemsLean.HostModuleCheck
  (hostModuleCheckReady / loadMultModuleCheck walk).
  Greppable: SystemsLean.HostModuleCheckMain, slake-host-module-check,
  HostModuleCheckMain, HOST-MODULE-CHECK, SLAKE_HOST_MODULE_CHECK,
  hostModuleCheckReady, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.HostModuleCheckMain
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheck

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostModuleCheck.main args
