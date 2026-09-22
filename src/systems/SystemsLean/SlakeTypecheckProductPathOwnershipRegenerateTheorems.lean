/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.ProductPathOwnershipRegenerateTheorems.
  Short role: named driver for
  just slake-typecheck-productpathownershipregeneratetheorems.
  Ready is HostFrontLiveProductPathOwnershipRegenerateTheorems parse plus
  HostKernel.kernelCheck of live ProductPathOwnershipRegenerateTheorems.lean,
  not := true, not lake build
  SystemsLean.ProductPathOwnershipRegenerateTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Not the ProductPathOwnershipRegenerateMain wrap.
  Not ProductPathOwnershipInputsTheorems. Not ProductPathPerformTheorems.
  Unique needles (trailing newline so
  SlakeTypecheckProductPathOwnershipRegenerateTheorems is not a prefix hit
  on the ProductPathOwnershipRegenerateMain wrap):
  SlakeTypecheckProductPathOwnershipRegenerateTheorems
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS
  SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_REGENERATE_THEOREMS_V0
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS
  slake-typecheck-productpathownershipregeneratetheorems
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS,
  SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_REGENERATE_THEOREMS_V0,
  slake-typecheck-productpathownershipregeneratetheorems,
  slakeTypecheckProductPathOwnershipRegenerateTheoremsReady,
  kernelCheckLiveProductPathOwnershipRegenerateTheoremsSource,
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS, liveRel, SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathOwnershipRegenerateTheorems
  Checkable writer: just slake-typecheck-productpathownershipregeneratetheorems
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveProductPathOwnershipRegenerateTheorems

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_REGENERATE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS"

/-- Named just recipe. Not lake build of this theorems module. -/
def justRecipeSlakeTypecheckProductPathOwnershipRegenerateTheorems : String :=
  "slake-typecheck-productpathownershipregeneratetheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathOwnershipRegenerateTheoremsRel : String :=
  SystemsLean.HostFrontLiveProductPathOwnershipRegenerateTheorems.liveProductPathOwnershipRegenerateTheoremsRel

/-- Live basename. Greppable: liveRel.
    Must be ProductPathOwnershipRegenerateTheorems.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveProductPathOwnershipRegenerateTheorems.liveRel

/-- Ready names HostFrontLiveProductPathOwnershipRegenerateTheorems parse
    plus kernelCheck, not := true.
    Greppable: slakeTypecheckProductPathOwnershipRegenerateTheoremsReady,
    kernelCheckLiveProductPathOwnershipRegenerateTheoremsSource. -/
def slakeTypecheckProductPathOwnershipRegenerateTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveProductPathOwnershipRegenerateTheorems.hostFrontLiveProductPathOwnershipRegenerateTheoremsReady

/-- Honesty: this command is not lake build of the theorems module. -/
def slakeTypecheckProductPathOwnershipRegenerateTheoremsDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathOwnershipRegenerateTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathOwnershipRegenerateTheoremsOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    ProductPathOwnershipRegenerateTheorems.lean.
    Ready is hostFrontLiveProductPathOwnershipRegenerateTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathOwnershipRegenerateTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathOwnershipRegenerateTheorems} =="
  IO.println s!"  host={hostId} file={liveProductPathOwnershipRegenerateTheoremsRel} liveRel={liveRel}"
  unless (!slakeTypecheckProductPathOwnershipRegenerateTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathOwnershipRegenerateTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathOwnershipRegenerateTheorems.main args
