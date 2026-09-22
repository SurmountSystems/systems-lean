/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SELF-APPLY-FS-CLOSE.
  Root for optional lean --run of live SelfApplyFsClose.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSelfApplyFsClose.
  Main is free (no HostFrontLiveSelfApplyFsCloseMain and no ParserMain
  on disk at land). This file is Main, not ParserMain. Do not create both.
  Unique needles (trailing newline so HostFrontLiveSelfApplyFsCloseMain is
  not a prefix hit on a shorter SelfApplyFsClose name):
  HostFrontLiveSelfApplyFsCloseMain
  PARSE-LIVE-SELF-APPLY-FS-CLOSE
  HOST-FRONT-LIVE-SELF-APPLY-FS-CLOSE
  SELF-APPLY-FS-CLOSE
  Greppable: SystemsLean.HostFrontLiveSelfApplyFsCloseMain,
  HostFrontLiveSelfApplyFsCloseMain, HOST-FRONT-LIVE-SELF-APPLY-FS-CLOSE,
  SELF-APPLY-FS-CLOSE, PARSE-LIVE-SELF-APPLY-FS-CLOSE,
  parseLiveSelfApplyFsCloseSource, kernelCheckLiveSelfApplyFsCloseSource,
  liveRel, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSelfApplyFsCloseMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSelfApplyFsClose

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSelfApplyFsClose.main args
