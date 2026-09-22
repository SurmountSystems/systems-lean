/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathReadSsot.
  Short role: named driver for just slake-typecheck-productpathreadssot.
  Ready is HostFrontLiveProductPathReadSsot parse plus HostKernel.kernelCheck
  of live ProductPathReadSsot.lean, not a hardcoded true, not lake build
  SystemsLean.ProductPathReadSsot.
  liveRel is ProductPathReadSsot.lean.
  This wrap is ProductPathReadSsot.lean. It is not ProductPathReadSsotTheorems.lean.
  It is not ProductPathReadSsotMain.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PRODUCT-PATH-READ-SSOT,
  SLAKE_TYPECHECK_PRODUCT_PATH_READ_SSOT, slake-typecheck-productpathreadssot,
  slakeTypecheckProductPathReadSsotReady,
  kernelCheckLiveProductPathReadSsotSource,
  PARSE-LIVE-PRODUCT-PATH-READ-SSOT.
  Module: SystemsLean.SlakeTypecheckProductPathReadSsot
  Checkable writer: just slake-typecheck-productpathreadssot
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathReadSsot

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_READ_SSOT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-READ-SSOT"

/-- Named just recipe. Not lake build SystemsLean.ProductPathReadSsot. -/
def justRecipeSlakeTypecheckProductPathReadSsot : String :=
  "slake-typecheck-productpathreadssot"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathReadSsotRel : String :=
  SystemsLean.HostFrontLiveProductPathReadSsot.liveProductPathReadSsotRel

/-- Ready names HostFrontLiveProductPathReadSsot parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckProductPathReadSsotReady,
    kernelCheckLiveProductPathReadSsotSource. -/
def slakeTypecheckProductPathReadSsotReady : Bool :=
  SystemsLean.HostFrontLiveProductPathReadSsot.hostFrontLiveProductPathReadSsotReady

/-- Honesty: this command is not lake build of ProductPathReadSsot. -/
def slakeTypecheckProductPathReadSsotDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathReadSsotFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckProductPathReadSsotFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathReadSsotOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathReadSsot.lean.
    Ready is HostFrontLiveProductPathReadSsot.hostFrontLiveProductPathReadSsotReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProductPathReadSsot.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathReadSsot} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductPathReadSsot.liveRel}"
  IO.println s!"  host={hostId} file={liveProductPathReadSsotRel}"
  unless (!slakeTypecheckProductPathReadSsotFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathReadSsotFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckProductPathReadSsotOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathReadSsot.main args
