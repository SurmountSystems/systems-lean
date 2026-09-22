/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathOwnershipRegenerateMain.
  Short role: named driver for just slake-typecheck-productpathownershipregeneratemain.
  Ready is HostFrontLiveProductPathOwnershipRegenerateMain parse plus HostKernel.kernelCheck
  of live ProductPathOwnershipRegenerateMain.lean, not := true, not lake build
  SystemsLean.ProductPathOwnershipRegenerateMain.
  Not mill 10 remill (just tenth-host-tool / inventory row 13).
  Not occupancy name 50. Not FullHost.
  This wrap parses ProductPathOwnershipRegenerateMain.lean only. Do not wrap ProductPathOwnershipRegenerate.lean.
  Short name is free because HostFrontLiveProductPathOwnershipRegenerate (library wrap) does not exist.
  Do not mint HostFrontLiveHostProductPathOwnershipRegenerateMain.
  Do not wrap Linear.lean. Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
  Not CapableComposeMain. Not ProductPathComposePlanMain. Not LlvmMultSsaMain.
  Not MultSubsetRebuildMain.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckProductPathOwnershipRegenerateMain is not a prefix):
  SlakeTypecheckProductPathOwnershipRegenerateMain
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-REGENERATE-MAIN
  SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_REGENERATE_MAIN_V0
  slake-typecheck-productpathownershipregeneratemain
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-MAIN
  PRODUCT-PATH-OWNERSHIP-REGENERATE-MAIN
  HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-productpathownershipregeneratemain,
  slakeTypecheckProductPathOwnershipRegenerateMainReady,
  kernelCheckLiveProductPathOwnershipRegenerateMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathOwnershipRegenerateMain
  Checkable writer: just slake-typecheck-productpathownershipregeneratemain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveProductPathOwnershipRegenerateMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_REGENERATE_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-REGENERATE-MAIN"

/-- Named just recipe. Not lake build SystemsLean.ProductPathOwnershipRegenerateMain. -/
def justRecipeSlakeTypecheckProductPathOwnershipRegenerateMain : String :=
  "slake-typecheck-productpathownershipregeneratemain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathOwnershipRegenerateMainRel : String :=
  SystemsLean.HostFrontLiveProductPathOwnershipRegenerateMain.liveProductPathOwnershipRegenerateMainRel

/-- Ready names HostFrontLiveProductPathOwnershipRegenerateMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathOwnershipRegenerateMainReady,
    kernelCheckLiveProductPathOwnershipRegenerateMainSource. -/
def slakeTypecheckProductPathOwnershipRegenerateMainReady : Bool :=
  SystemsLean.HostFrontLiveProductPathOwnershipRegenerateMain.hostFrontLiveProductPathOwnershipRegenerateMainReady

/-- Honesty: this command is not lake build of ProductPathOwnershipRegenerateMain. -/
def slakeTypecheckProductPathOwnershipRegenerateMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathOwnershipRegenerateMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathOwnershipRegenerateMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathOwnershipRegenerateMain.lean.
    Ready is HostFrontLiveProductPathOwnershipRegenerateMain.hostFrontLiveProductPathOwnershipRegenerateMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathOwnershipRegenerateMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathOwnershipRegenerateMain} =="
  IO.println s!"  host={hostId} file={liveProductPathOwnershipRegenerateMainRel}"
  unless (!slakeTypecheckProductPathOwnershipRegenerateMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathOwnershipRegenerateMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathOwnershipRegenerateMain.main args
