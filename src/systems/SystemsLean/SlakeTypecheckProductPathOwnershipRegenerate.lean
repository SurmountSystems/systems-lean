/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.ProductPathOwnershipRegenerate.
  Short role: named driver for
  just slake-typecheck-productpathownershipregenerate.
  Ready is HostFrontLiveProductPathOwnershipRegenerate parse plus
  HostKernel.kernelCheck of live ProductPathOwnershipRegenerate.lean,
  not a hardcoded true, not lake build
  SystemsLean.ProductPathOwnershipRegenerate.
  liveRel is ProductPathOwnershipRegenerate.lean.
  This wrap is ProductPathOwnershipRegenerate.lean.
  It is not ProductPathOwnershipRegenerateTheorems.lean.
  Not a backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-REGENERATE,
  SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_REGENERATE,
  slake-typecheck-productpathownershipregenerate,
  slakeTypecheckProductPathOwnershipRegenerateReady,
  kernelCheckLiveProductPathOwnershipRegenerateSource,
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE,
  PRODUCT-PATH-OWNERSHIP-REGENERATE.
  Module: SystemsLean.SlakeTypecheckProductPathOwnershipRegenerate
  Checkable writer: just slake-typecheck-productpathownershipregenerate
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathOwnershipRegenerate

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_REGENERATE"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-REGENERATE"

/-- Named just recipe. Not lake build
    SystemsLean.ProductPathOwnershipRegenerate. -/
def justRecipeSlakeTypecheckProductPathOwnershipRegenerate : String :=
  "slake-typecheck-productpathownershipregenerate"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathOwnershipRegenerateRel : String :=
  SystemsLean.HostFrontLiveProductPathOwnershipRegenerate.liveProductPathOwnershipRegenerateRel

/-- Ready names HostFrontLiveProductPathOwnershipRegenerate parse plus
    kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckProductPathOwnershipRegenerateReady,
    kernelCheckLiveProductPathOwnershipRegenerateSource. -/
def slakeTypecheckProductPathOwnershipRegenerateReady : Bool :=
  SystemsLean.HostFrontLiveProductPathOwnershipRegenerate.hostFrontLiveProductPathOwnershipRegenerateReady

/-- Honesty: this command is not lake build of
    ProductPathOwnershipRegenerate. -/
def slakeTypecheckProductPathOwnershipRegenerateDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathOwnershipRegenerateFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not a backend. -/
def slakeTypecheckProductPathOwnershipRegenerateFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathOwnershipRegenerateOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    ProductPathOwnershipRegenerate.lean.
    Ready is hostFrontLiveProductPathOwnershipRegenerateReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProductPathOwnershipRegenerate.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathOwnershipRegenerate} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductPathOwnershipRegenerate.liveRel}"
  IO.println s!"  host={hostId} file={liveProductPathOwnershipRegenerateRel}"
  unless (!slakeTypecheckProductPathOwnershipRegenerateFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathOwnershipRegenerateFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckProductPathOwnershipRegenerateOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathOwnershipRegenerate.main args
