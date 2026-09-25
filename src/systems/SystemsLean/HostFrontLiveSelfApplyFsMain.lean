/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SELF-APPLY-FS.
  Root for optional lean --run of live SelfApplyFs.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSelfApplyFs.
  Main is free (no HostFrontLiveSelfApplyFsMain and no ParserMain
  on disk at land). This file is Main, not ParserMain. Do not create both.
  Unique needles (trailing newline so HostFrontLiveSelfApplyFsMain is
  not a prefix hit on a shorter SelfApplyFs name):
  HostFrontLiveSelfApplyFsMain
  PARSE-LIVE-SELF-APPLY-FS
  HOST-FRONT-LIVE-SELF-APPLY-FS
  SELF-APPLY-FS
  Greppable: SystemsLean.HostFrontLiveSelfApplyFsMain,
  HostFrontLiveSelfApplyFsMain, HOST-FRONT-LIVE-SELF-APPLY-FS,
  SELF-APPLY-FS, PARSE-LIVE-SELF-APPLY-FS,
  parseLiveSelfApplyFsSource, kernelCheckLiveSelfApplyFsSource,
  liveRel, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSelfApplyFsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSelfApplyFs

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSelfApplyFs.main args
