/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathWriteHcMain.
  Short role: named driver for just slake-typecheck-productpathwritehcmain.
  Ready is HostFrontLiveProductPathWriteHcMain parse plus HostKernel.kernelCheck
  of live ProductPathWriteHcMain.lean, not := true, not lake build
  SystemsLean.ProductPathWriteHcMain.
  Not mill 66 remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckProductPathWriteHcMain is not a prefix):
  SlakeTypecheckProductPathWriteHcMain
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITE-HC-MAIN
  SLAKE_TYPECHECK_PRODUCT_PATH_WRITE_HC_MAIN_V0
  slake-typecheck-productpathwritehcmain
  PARSE-LIVE-PRODUCT-PATH-WRITE-HC-MAIN
  PRODUCT-PATH-WRITE-HC-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-productpathwritehcmain,
  slakeTypecheckProductPathWriteHcMainReady,
  kernelCheckLiveProductPathWriteHcMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathWriteHcMain
  Checkable writer: just slake-typecheck-productpathwritehcmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveProductPathWriteHcMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_WRITE_HC_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITE-HC-MAIN"

/-- Named just recipe. Not lake build SystemsLean.ProductPathWriteHcMain. -/
def justRecipeSlakeTypecheckProductPathWriteHcMain : String :=
  "slake-typecheck-productpathwritehcmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathWriteHcMainRel : String :=
  SystemsLean.HostFrontLiveProductPathWriteHcMain.liveProductPathWriteHcMainRel

/-- Ready names HostFrontLiveProductPathWriteHcMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathWriteHcMainReady,
    kernelCheckLiveProductPathWriteHcMainSource. -/
def slakeTypecheckProductPathWriteHcMainReady : Bool :=
  SystemsLean.HostFrontLiveProductPathWriteHcMain.hostFrontLiveProductPathWriteHcMainReady

/-- Honesty: this command is not lake build of ProductPathWriteHcMain. -/
def slakeTypecheckProductPathWriteHcMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathWriteHcMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathWriteHcMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathWriteHcMain.lean.
    Ready is HostFrontLiveProductPathWriteHcMain.hostFrontLiveProductPathWriteHcMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathWriteHcMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathWriteHcMain} =="
  IO.println s!"  host={hostId} file={liveProductPathWriteHcMainRel}"
  unless (!slakeTypecheckProductPathWriteHcMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathWriteHcMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathWriteHcMain.main args
