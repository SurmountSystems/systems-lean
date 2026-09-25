/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathWriteHc.
  Short role: named driver for just slake-typecheck-productpathwritehc.
  Ready is HostFrontLiveProductPathWriteHc parse plus HostKernel.kernelCheck
  of live ProductPathWriteHc.lean, not := true, not lake build
  SystemsLean.ProductPathWriteHc.
  Not mill 66 remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so ProductPathWriteHc drivers are not prefix hits):
  SlakeTypecheckProductPathWriteHc
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITE-HC
  SLAKE_TYPECHECK_PRODUCT_PATH_WRITE_HC_V0
  PARSE-LIVE-PRODUCT-PATH-WRITE-HC
  PRODUCT-PATH-WRITE-HC
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-productpathwritehc,
  slakeTypecheckProductPathWriteHcReady,
  kernelCheckLiveProductPathWriteHcSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathWriteHc
  Checkable writer: just slake-typecheck-productpathwritehc
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathWriteHc

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_WRITE_HC_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITE-HC"

/-- Named just recipe. Not lake build SystemsLean.ProductPathWriteHc. -/
def justRecipeSlakeTypecheckProductPathWriteHc : String :=
  "slake-typecheck-productpathwritehc"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathWriteHcRel : String :=
  SystemsLean.HostFrontLiveProductPathWriteHc.liveProductPathWriteHcRel

/-- Ready names HostFrontLiveProductPathWriteHc parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathWriteHcReady,
    kernelCheckLiveProductPathWriteHcSource. -/
def slakeTypecheckProductPathWriteHcReady : Bool :=
  SystemsLean.HostFrontLiveProductPathWriteHc.hostFrontLiveProductPathWriteHcReady

/-- Honesty: this command is not lake build of ProductPathWriteHc. -/
def slakeTypecheckProductPathWriteHcDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathWriteHcFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathWriteHcOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathWriteHc.lean.
    Ready is HostFrontLiveProductPathWriteHc.hostFrontLiveProductPathWriteHcReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathWriteHc.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathWriteHc} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductPathWriteHc.liveRel}"
  IO.println s!"  host={hostId} file={liveProductPathWriteHcRel}"
  unless (!slakeTypecheckProductPathWriteHcFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathWriteHcOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathWriteHc.main args
