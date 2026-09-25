/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathWriteHcTheorems.
  Short role: named driver for just slake-typecheck-productpathwritehctheorems.
  Ready is HostFrontLiveProductPathWriteHcTheorems parse plus HostKernel.kernelCheck
  of live ProductPathWriteHcTheorems.lean, not := true, not lake build
  SystemsLean.ProductPathWriteHcTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  SlakeTypecheckProductPathWriteHcTheorems
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITE-HC-THEOREMS
  SLAKE_TYPECHECK_PRODUCT_PATH_WRITE_HC_THEOREMS_V0
  slake-typecheck-productpathwritehctheorems
  Greppable: SYSTEMS_LEAN_HOST,
  slakeTypecheckProductPathWriteHcTheoremsReady,
  kernelCheckLiveProductPathWriteHcTheoremsSource,
  PARSE-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathWriteHcTheorems
  Checkable writer: just slake-typecheck-productpathwritehctheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathWriteHcTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_WRITE_HC_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITE-HC-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ProductPathWriteHcTheorems. -/
def justRecipeSlakeTypecheckProductPathWriteHcTheorems : String :=
  "slake-typecheck-productpathwritehctheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathWriteHcTheoremsRel : String :=
  SystemsLean.HostFrontLiveProductPathWriteHcTheorems.liveProductPathWriteHcTheoremsRel

/-- Ready names HostFrontLiveProductPathWriteHcTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathWriteHcTheoremsReady,
    kernelCheckLiveProductPathWriteHcTheoremsSource. -/
def slakeTypecheckProductPathWriteHcTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveProductPathWriteHcTheorems.hostFrontLiveProductPathWriteHcTheoremsReady

/-- Honesty: this command is not lake build of ProductPathWriteHcTheorems. -/
def slakeTypecheckProductPathWriteHcTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathWriteHcTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathWriteHcTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathWriteHcTheorems.lean.
    Ready is HostFrontLiveProductPathWriteHcTheorems.hostFrontLiveProductPathWriteHcTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathWriteHcTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathWriteHcTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductPathWriteHcTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveProductPathWriteHcTheoremsRel}"
  unless (!slakeTypecheckProductPathWriteHcTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathWriteHcTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathWriteHcTheorems.main args
