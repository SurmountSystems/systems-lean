/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckFixtureTextsProduct.
  Short role: named driver for lean --run of
  HostModuleCheckFixtureTextsProduct.lean.
  Ready is HostFrontLiveHostModuleCheckFixtureTextsProduct parse plus
  HostKernel.kernelCheck of live HostModuleCheckFixtureTextsProduct.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckFixtureTextsProduct.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckFixtureTextsProduct
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFIXTURETEXTSPRODUCT
  SLAKE_TYPECHECK_HOSTMODULECHECKFIXTURETEXTSPRODUCT_V0
  PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTSPRODUCT
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckfixturetextsproduct,
  slakeTypecheckHostModuleCheckFixtureTextsProductReady,
  kernelCheckLiveHostModuleCheckFixtureTextsProductSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckFixtureTextsProduct
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsProduct

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKFIXTURETEXTSPRODUCT_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFIXTURETEXTSPRODUCT"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckFixtureTextsProduct.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckFixtureTextsProduct : String :=
  "slake-typecheck-hostmodulecheckfixturetextsproduct"

/-- Live file relative to repo root. Byte-match path. -/
def liveHostModuleCheckFixtureTextsProductRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsProduct.liveHostModuleCheckFixtureTextsProductRel

/-- Ready names HostFrontLiveHostModuleCheckFixtureTextsProduct parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckFixtureTextsProductReady,
    kernelCheckLiveHostModuleCheckFixtureTextsProductSource. -/
def slakeTypecheckHostModuleCheckFixtureTextsProductReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsProduct.hostFrontLiveHostModuleCheckFixtureTextsProductReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckFixtureTextsProductDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckFixtureTextsProductFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckFixtureTextsProductOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckFixtureTextsProduct.lean.
    Ready is hostFrontLiveHostModuleCheckFixtureTextsProductReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckFixtureTextsProduct.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckFixtureTextsProduct} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsProduct.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckFixtureTextsProductRel}"
  unless (!slakeTypecheckHostModuleCheckFixtureTextsProductFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFixtureTextsProductOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckFixtureTextsProductDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsProduct.main args
