/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathComposePlanMain.
  Short role: named driver for just slake-typecheck-productpathcomposeplanmain.
  Ready is HostFrontLiveProductPathComposePlanMain parse plus HostKernel.kernelCheck
  of live ProductPathComposePlanMain.lean, not := true, not lake build
  SystemsLean.ProductPathComposePlanMain.
  Not mill 21 remill (just twenty-first-host-tool / inventory table row 3).
  Not occupancy name 50. Not FullHost.
  This wrap parses ProductPathComposePlanMain.lean only. Do not wrap ProductPathComposePlan.lean.
  Short name is free because HostFrontLiveProductPathComposePlan (library wrap) does not exist.
  Do not mint HostFrontLiveHostProductPathComposePlanMain.
  Do not wrap Linear.lean. Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
  Not CapableComposeMain. Not ComposeSubsetEmitMain. Not ComposeSubsetRebuildMain.
  Not ProductPathComposePlan.lean library wrap. Not LlvmMultSsaMain.
  Not MultSubsetRebuildMain.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckProductPathComposePlanMain is not a prefix):
  SlakeTypecheckProductPathComposePlanMain
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-COMPOSE-PLAN-MAIN
  SLAKE_TYPECHECK_PRODUCT_PATH_COMPOSE_PLAN_MAIN_V0
  slake-typecheck-productpathcomposeplanmain
  PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-MAIN
  PRODUCT-PATH-COMPOSE-PLAN-MAIN
  HOST-PRODUCT-PATH-COMPOSE-PLAN-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-productpathcomposeplanmain,
  slakeTypecheckProductPathComposePlanMainReady,
  kernelCheckLiveProductPathComposePlanMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathComposePlanMain
  Checkable writer: just slake-typecheck-productpathcomposeplanmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveProductPathComposePlanMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_COMPOSE_PLAN_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-COMPOSE-PLAN-MAIN"

/-- Named just recipe. Not lake build SystemsLean.ProductPathComposePlanMain. -/
def justRecipeSlakeTypecheckProductPathComposePlanMain : String :=
  "slake-typecheck-productpathcomposeplanmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathComposePlanMainRel : String :=
  SystemsLean.HostFrontLiveProductPathComposePlanMain.liveProductPathComposePlanMainRel

/-- Ready names HostFrontLiveProductPathComposePlanMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathComposePlanMainReady,
    kernelCheckLiveProductPathComposePlanMainSource. -/
def slakeTypecheckProductPathComposePlanMainReady : Bool :=
  SystemsLean.HostFrontLiveProductPathComposePlanMain.hostFrontLiveProductPathComposePlanMainReady

/-- Honesty: this command is not lake build of ProductPathComposePlanMain. -/
def slakeTypecheckProductPathComposePlanMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathComposePlanMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathComposePlanMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathComposePlanMain.lean.
    Ready is HostFrontLiveProductPathComposePlanMain.hostFrontLiveProductPathComposePlanMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathComposePlanMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathComposePlanMain} =="
  IO.println s!"  host={hostId} file={liveProductPathComposePlanMainRel}"
  unless (!slakeTypecheckProductPathComposePlanMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathComposePlanMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathComposePlanMain.main args
