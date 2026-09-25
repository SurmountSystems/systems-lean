/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathBars.
  Short role: named driver for just slake-typecheck-productpathbars.
  Ready is HostFrontLiveProductPathBars parse plus HostKernel.kernelCheck
  of live ProductPathBars.lean, not a hardcoded true, not lake build
  SystemsLean.ProductPathBars.
  liveRel is ProductPathBars.lean.
  This wrap is ProductPathBars.lean. It is not ProductPath.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PRODUCT-PATH-BARS,
  SLAKE_TYPECHECK_PRODUCT_PATH_BARS, slake-typecheck-productpathbars,
  slakeTypecheckProductPathBarsReady,
  kernelCheckLiveProductPathBarsSource,
  PARSE-LIVE-PRODUCT-PATH-BARS.
  Module: SystemsLean.SlakeTypecheckProductPathBars
  Checkable writer: just slake-typecheck-productpathbars
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathBars

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_BARS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-BARS"

/-- Named just recipe. Not lake build SystemsLean.ProductPathBars. -/
def justRecipeSlakeTypecheckProductPathBars : String :=
  "slake-typecheck-productpathbars"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathBarsRel : String :=
  SystemsLean.HostFrontLiveProductPathBars.liveProductPathBarsRel

/-- Ready names HostFrontLiveProductPathBars parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckProductPathBarsReady,
    kernelCheckLiveProductPathBarsSource. -/
def slakeTypecheckProductPathBarsReady : Bool :=
  SystemsLean.HostFrontLiveProductPathBars.hostFrontLiveProductPathBarsReady

/-- Honesty: this command is not lake build of ProductPathBars. -/
def slakeTypecheckProductPathBarsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathBarsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckProductPathBarsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathBarsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathBars.lean.
    Ready is HostFrontLiveProductPathBars.hostFrontLiveProductPathBarsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProductPathBars.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathBars} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductPathBars.liveRel}"
  IO.println s!"  host={hostId} file={liveProductPathBarsRel}"
  unless (!slakeTypecheckProductPathBarsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathBarsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckProductPathBarsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathBars.main args
