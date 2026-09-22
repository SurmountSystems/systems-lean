/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ProductPathWriteHcMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathWriteHcMainSource. Not occupancy name 50.
  Not mill 66 remill. Mill stays 69 of 69.
  This wrap parses ProductPathWriteHcMain.lean only. Do not wrap ProductPathWriteHc.lean.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveProductPathWriteHcMain is not a
  prefix hit on HostFrontLiveProductPathWriteHcMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveProductPathWriteHcMain is not a prefix):
  HostFrontLiveProductPathWriteHcMainSource
  PARSE-LIVE-PRODUCT-PATH-WRITE-HC-MAIN
  HOST-FRONT-LIVE-PRODUCT-PATH-WRITE-HC-MAIN
  PRODUCT-PATH-WRITE-HC-MAIN
  Live product needles:
  ProductPathWriteHcMain
  slake-write-freestanding-hc
  import SystemsLean.ProductPathWriteHc
  SelfApplyFs
  writeFreestandingHcAtRoot
  Greppable: SYSTEMS_LEAN_HOST, liveProductPathWriteHcMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveProductPathWriteHcMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveProductPathWriteHcMain

/-- Dual-pinned live ProductPathWriteHcMain.lean bytes (must match on-disk file).
    Greppable: liveProductPathWriteHcMainSource, PARSE-LIVE-PRODUCT-PATH-WRITE-HC-MAIN. -/
def liveProductPathWriteHcMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for B13 WRITE-HC perform
  substrate (SKELETON). Root for lake exe slake-write-freestanding-hc.
  Body lives in SystemsLean.ProductPathWriteHc
  (writeFreestandingHcAtRoot / Ok / PartialReady bulk). Thin main so SelfApplyFs
  may import the WRITE-HC API without top-level main clash.
  Greppable: slake-write-freestanding-hc,
  ProductPathWriteHcMain, writeFreestandingHcAtRoot,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.ProductPathWriteHc

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ProductPathWriteHc.main args
"#

end SystemsLean.HostFrontLiveProductPathWriteHcMain
