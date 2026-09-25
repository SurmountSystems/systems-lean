/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathReadSsotTheorems.
  Short role: named driver for just slake-typecheck-productpathreadssottheorems.
  Ready is HostFrontLiveProductPathReadSsotTheorems parse plus HostKernel.kernelCheck
  of live ProductPathReadSsotTheorems.lean, not := true, not lake build
  SystemsLean.ProductPathReadSsotTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  SlakeTypecheckProductPathReadSsotTheorems
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-READ-SSOT-THEOREMS
  SLAKE_TYPECHECK_PRODUCT_PATH_READ_SSOT_THEOREMS_V0
  slake-typecheck-productpathreadssottheorems
  Greppable: SYSTEMS_LEAN_HOST,
  slakeTypecheckProductPathReadSsotTheoremsReady,
  kernelCheckLiveProductPathReadSsotTheoremsSource,
  PARSE-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathReadSsotTheorems
  Checkable writer: just slake-typecheck-productpathreadssottheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathReadSsotTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_READ_SSOT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-READ-SSOT-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ProductPathReadSsotTheorems. -/
def justRecipeSlakeTypecheckProductPathReadSsotTheorems : String :=
  "slake-typecheck-productpathreadssottheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathReadSsotTheoremsRel : String :=
  SystemsLean.HostFrontLiveProductPathReadSsotTheorems.liveProductPathReadSsotTheoremsRel

/-- Ready names HostFrontLiveProductPathReadSsotTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathReadSsotTheoremsReady,
    kernelCheckLiveProductPathReadSsotTheoremsSource. -/
def slakeTypecheckProductPathReadSsotTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveProductPathReadSsotTheorems.hostFrontLiveProductPathReadSsotTheoremsReady

/-- Honesty: this command is not lake build of ProductPathReadSsotTheorems. -/
def slakeTypecheckProductPathReadSsotTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathReadSsotTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathReadSsotTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathReadSsotTheorems.lean.
    Ready is HostFrontLiveProductPathReadSsotTheorems.hostFrontLiveProductPathReadSsotTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathReadSsotTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathReadSsotTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductPathReadSsotTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveProductPathReadSsotTheoremsRel}"
  unless (!slakeTypecheckProductPathReadSsotTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathReadSsotTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathReadSsotTheorems.main args
