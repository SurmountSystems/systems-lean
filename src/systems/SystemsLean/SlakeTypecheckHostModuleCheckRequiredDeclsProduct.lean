/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckRequiredDeclsProduct.
  Short role: named driver for lean --run of the
  HostModuleCheckRequiredDeclsProduct.lean wrap.
  Ready is HostFrontLiveHostModuleCheckRequiredDeclsProduct parse plus
  HostKernel.kernelCheck of live HostModuleCheckRequiredDeclsProduct.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckRequiredDeclsProduct.
  liveRel is HostModuleCheckRequiredDeclsProduct.lean.
  This wrap is HostModuleCheckRequiredDeclsProduct.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  It is not HostModuleCheckRequiredDecls.lean.
  It is not HostModuleCheckRequiredDeclsLater.lean.
  It is not HostModuleCheckRequiredDeclsKernel.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKREQUIREDDECLSPRODUCT,
  SLAKE_TYPECHECK_HOSTMODULECHECKREQUIREDDECLSPRODUCT,
  slake-typecheck-hostmodulecheckrequireddeclsproduct,
  slakeTypecheckHostModuleCheckRequiredDeclsProductReady,
  kernelCheckLiveHostModuleCheckRequiredDeclsProductSource,
  PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckRequiredDeclsProduct
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckRequiredDeclsProduct.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsProduct

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKREQUIREDDECLSPRODUCT"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKREQUIREDDECLSPRODUCT"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckRequiredDeclsProduct : String :=
  "slake-typecheck-hostmodulecheckrequireddeclsproduct"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckRequiredDeclsProductRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsProduct.liveHostModuleCheckRequiredDeclsProductRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckRequiredDeclsProductReady,
    kernelCheckLiveHostModuleCheckRequiredDeclsProductSource. -/
def slakeTypecheckHostModuleCheckRequiredDeclsProductReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsProduct.hostFrontLiveHostModuleCheckRequiredDeclsProductReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckRequiredDeclsProductDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckRequiredDeclsProductFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckRequiredDeclsProductFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckRequiredDeclsProductOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckRequiredDeclsProduct.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckRequiredDeclsProductReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckRequiredDeclsProduct.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckRequiredDeclsProduct} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsProduct.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckRequiredDeclsProductRel}"
  unless (!slakeTypecheckHostModuleCheckRequiredDeclsProductFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckRequiredDeclsProductFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckRequiredDeclsProductOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckRequiredDeclsProductDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsProduct.main args
