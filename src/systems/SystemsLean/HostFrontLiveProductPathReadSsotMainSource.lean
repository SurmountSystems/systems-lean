/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ProductPathReadSsotMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathReadSsotMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69. Occupancy stays 49.
  This wrap parses ProductPathReadSsotMain.lean only. Do not wrap ProductPathReadSsot.lean.
  Do not wrap ProductPathReadSsotTheorems.lean.
  Do not invent HostFrontLiveProductPathReadSsot (library wrap).
  Do not steal HostFrontLiveProductPathWriteHcMain (sibling WRITE-HC mill wrap).
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveProductPathReadSsotMain is not a
  prefix hit on HostFrontLiveProductPathReadSsotMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveProductPathReadSsotMain is not a prefix):
  HostFrontLiveProductPathReadSsotMainSource
  PARSE-LIVE-PRODUCT-PATH-READ-SSOT-MAIN
  HOST-FRONT-LIVE-PRODUCT-PATH-READ-SSOT-MAIN
  PRODUCT-PATH-READ-SSOT-MAIN
  HOST-PRODUCT-PATH-READ-SSOT-MAIN
  Live product needles:
  ProductPathReadSsotMain
  slake-read-product-ssot
  import SystemsLean.ProductPathReadSsot
  readDualSsotAtRoot
  SKELETON
  Greppable: SYSTEMS_LEAN_HOST, liveProductPathReadSsotMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveProductPathReadSsotMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveProductPathReadSsotMain

/-- Dual-pinned live ProductPathReadSsotMain.lean bytes (must match on-disk file).
    Greppable: liveProductPathReadSsotMainSource, PARSE-LIVE-PRODUCT-PATH-READ-SSOT-MAIN. -/
def liveProductPathReadSsotMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for B11 READ-SSOT perform
  substrate (SKELETON). Root for lake exe slake-read-product-ssot.
  Body lives in SystemsLean.ProductPathReadSsot
  (readDualSsotAtRoot / Ok / PartialReady bulk). Thin main so SelfApplyFs
  may import the READ API without top-level main clash.
  Greppable: slake-read-product-ssot,
  ProductPathReadSsotMain, readDualSsotAtRoot,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.ProductPathReadSsot

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ProductPathReadSsot.main args
"#

end SystemsLean.HostFrontLiveProductPathReadSsotMain
