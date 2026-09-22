/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live InstallOutMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveInstallOutMainSource. Not occupancy name 50.
  Not mill 9 remill (just ninth-host-tool / inventory row 11). Mill stays 69 of 69.
  This wrap parses InstallOutMain.lean only. Do not wrap InstallOut.lean.
  Do not invent HostFrontLiveInstallOut (library wrap).
  Do not wrap ProductPathFreestandingCapableInstallOutMain.lean.
  Do not steal HostFrontLiveCapableRegenerateMain (liveRel is CapableRegenerateMain.lean).
  Do not wrap Linear.lean. Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveInstallOutMain is not a
  prefix hit on HostFrontLiveInstallOutMainSource.
  Occupancy leftover Term files are not this wrap.
  Unique needles (trailing newline so HostFrontLiveInstallOutMain is not a prefix):
  HostFrontLiveInstallOutMainSource
  PARSE-LIVE-INSTALL-OUT-MAIN
  HOST-FRONT-LIVE-INSTALL-OUT-MAIN
  INSTALL-OUT-MAIN
  HOST-INSTALL-OUT-MAIN
  Live product needles:
  InstallOutMain
  slake-freestanding-capable-install-out
  import SystemsLean.InstallOut
  freestandingCapableInstallFreestandingOut
  SKELETON
  Greppable: SYSTEMS_LEAN_HOST, liveInstallOutMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveInstallOutMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveInstallOutMain

/-- Dual-pinned live InstallOutMain.lean bytes (must match on-disk file).
    Greppable: liveInstallOutMainSource, PARSE-LIVE-INSTALL-OUT-MAIN. -/
def liveInstallOutMainSource : String := r#"/-
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
"#

end SystemsLean.HostFrontLiveInstallOutMain
