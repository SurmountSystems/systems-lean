/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathOwnershipInputsTheorems.
  Short role: named driver for just slake-typecheck-productpathownershipinputstheorems.
  Ready is HostFrontLiveProductPathOwnershipInputsTheorems parse plus HostKernel.kernelCheck
  of live ProductPathOwnershipInputsTheorems.lean, not := true, not lake build
  SystemsLean.ProductPathOwnershipInputsTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of a
  shorter library wrap needle is not a prefix hit):
  SlakeTypecheckProductPathOwnershipInputsTheorems
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-INPUTS-THEOREMS
  SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_INPUTS_THEOREMS_V0
  slake-typecheck-productpathownershipinputstheorems
  Greppable: SYSTEMS_LEAN_HOST,
  slakeTypecheckProductPathOwnershipInputsTheoremsReady,
  kernelCheckLiveProductPathOwnershipInputsTheoremsSource,
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathOwnershipInputsTheorems
  Checkable writer: just slake-typecheck-productpathownershipinputstheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathOwnershipInputsTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_INPUTS_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-INPUTS-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ProductPathOwnershipInputsTheorems. -/
def justRecipeSlakeTypecheckProductPathOwnershipInputsTheorems : String :=
  "slake-typecheck-productpathownershipinputstheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathOwnershipInputsTheoremsRel : String :=
  SystemsLean.HostFrontLiveProductPathOwnershipInputsTheorems.liveProductPathOwnershipInputsTheoremsRel

/-- Ready names HostFrontLiveProductPathOwnershipInputsTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathOwnershipInputsTheoremsReady,
    kernelCheckLiveProductPathOwnershipInputsTheoremsSource. -/
def slakeTypecheckProductPathOwnershipInputsTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveProductPathOwnershipInputsTheorems.hostFrontLiveProductPathOwnershipInputsTheoremsReady

/-- Honesty: this command is not lake build of ProductPathOwnershipInputsTheorems. -/
def slakeTypecheckProductPathOwnershipInputsTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathOwnershipInputsTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathOwnershipInputsTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathOwnershipInputsTheorems.lean.
    Ready is HostFrontLiveProductPathOwnershipInputsTheorems.hostFrontLiveProductPathOwnershipInputsTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathOwnershipInputsTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathOwnershipInputsTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductPathOwnershipInputsTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveProductPathOwnershipInputsTheoremsRel}"
  unless (!slakeTypecheckProductPathOwnershipInputsTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathOwnershipInputsTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathOwnershipInputsTheorems.main args
