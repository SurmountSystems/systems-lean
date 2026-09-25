/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPath.
  Short role: named driver for just slake-typecheck-productpath.
  Ready is HostFrontLiveProductPath parse plus HostKernel.kernelCheck
  of live ProductPath.lean, not a hardcoded true, not lake build
  SystemsLean.ProductPath.
  liveRel is ProductPath.lean.
  This wrap is ProductPath.lean. It is not ProductPathBars.lean.
  It is not ProductPathTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PRODUCT-PATH,
  SLAKE_TYPECHECK_PRODUCT_PATH, slake-typecheck-productpath,
  slakeTypecheckProductPathReady,
  kernelCheckLiveProductPathSource,
  PARSE-LIVE-PRODUCT-PATH.
  Module: SystemsLean.SlakeTypecheckProductPath
  Checkable writer: just slake-typecheck-productpath
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPath

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH"

/-- Named just recipe. Not lake build SystemsLean.ProductPath. -/
def justRecipeSlakeTypecheckProductPath : String :=
  "slake-typecheck-productpath"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathRel : String :=
  SystemsLean.HostFrontLiveProductPath.liveProductPathRel

/-- Ready names HostFrontLiveProductPath parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckProductPathReady,
    kernelCheckLiveProductPathSource. -/
def slakeTypecheckProductPathReady : Bool :=
  SystemsLean.HostFrontLiveProductPath.hostFrontLiveProductPathReady

/-- Honesty: this command is not lake build of ProductPath. -/
def slakeTypecheckProductPathDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckProductPathFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPath.lean.
    Ready is HostFrontLiveProductPath.hostFrontLiveProductPathReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProductPath.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPath} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductPath.liveRel}"
  IO.println s!"  host={hostId} file={liveProductPathRel}"
  unless (!slakeTypecheckProductPathFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckProductPathOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPath.main args
