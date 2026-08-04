/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Mult-first elaborator
  Mult + Linear + Types + Program + Graph + Compose package write (SKELETON;
  Track 3b-9 Compose expand). Root for lake exe slake-host-package-write. Body
  lives in SystemsLean.HostPackageWrite (hostPackageWriteReady / HostFront G1 +
  HostGraph Mult set + Mult package write + HostGraph Linear expand + Linear
  package write + HostGraph Types expand + Types package write + HostGraph
  Program expand + Program package write + HostGraph Graph expand + Graph
  package write + HostGraph Compose expand + Compose package write).
  Greppable: SystemsLean.HostPackageWriteMain, slake-host-package-write,
  HostPackageWriteMain, HOST-PACKAGE-WRITE, SLAKE_HOST_PACKAGE_WRITE,
  hostPackageWriteLinearReady, hostPackageWriteTypesReady,
  hostPackageWriteProgramReady, hostPackageWriteGraphPackageReady,
  hostPackageWriteGraphExpandReady, hostPackageWriteComposePackageReady,
  hostPackageWriteComposeExpandReady, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.HostPackageWriteMain
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostPackageWrite

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostPackageWrite.main args
