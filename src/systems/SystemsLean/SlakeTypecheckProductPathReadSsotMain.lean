/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathReadSsotMain.
  Short role: named driver for just slake-typecheck-productpathreadssotmain.
  Ready is HostFrontLiveProductPathReadSsotMain parse plus HostKernel.kernelCheck
  of live ProductPathReadSsotMain.lean, not := true, not lake build
  SystemsLean.ProductPathReadSsotMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Do not invent HostFrontLiveProductPathReadSsot. Do not wrap ProductPathReadSsot.lean.
  Do not wrap ProductPathReadSsotTheorems.lean.
  Unique needles (trailing newline so SlakeTypecheckProductPathReadSsotMain is not a prefix):
  SlakeTypecheckProductPathReadSsotMain
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-READ-SSOT-MAIN
  SLAKE_TYPECHECK_PRODUCT_PATH_READ_SSOT_MAIN_V0
  slake-typecheck-productpathreadssotmain
  PARSE-LIVE-PRODUCT-PATH-READ-SSOT-MAIN
  PRODUCT-PATH-READ-SSOT-MAIN
  HOST-PRODUCT-PATH-READ-SSOT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-productpathreadssotmain,
  slakeTypecheckProductPathReadSsotMainReady,
  kernelCheckLiveProductPathReadSsotMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathReadSsotMain
  Checkable writer: just slake-typecheck-productpathreadssotmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveProductPathReadSsotMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_READ_SSOT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-READ-SSOT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.ProductPathReadSsotMain. -/
def justRecipeSlakeTypecheckProductPathReadSsotMain : String :=
  "slake-typecheck-productpathreadssotmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathReadSsotMainRel : String :=
  SystemsLean.HostFrontLiveProductPathReadSsotMain.liveProductPathReadSsotMainRel

/-- Ready names HostFrontLiveProductPathReadSsotMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathReadSsotMainReady,
    kernelCheckLiveProductPathReadSsotMainSource. -/
def slakeTypecheckProductPathReadSsotMainReady : Bool :=
  SystemsLean.HostFrontLiveProductPathReadSsotMain.hostFrontLiveProductPathReadSsotMainReady

/-- Honesty: this command is not lake build of ProductPathReadSsotMain. -/
def slakeTypecheckProductPathReadSsotMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathReadSsotMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathReadSsotMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathReadSsotMain.lean.
    Ready is HostFrontLiveProductPathReadSsotMain.hostFrontLiveProductPathReadSsotMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathReadSsotMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathReadSsotMain} =="
  IO.println s!"  host={hostId} file={liveProductPathReadSsotMainRel}"
  unless (!slakeTypecheckProductPathReadSsotMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathReadSsotMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathReadSsotMain.main args
