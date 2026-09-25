/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckEmitBannerScaffoldTerm.
  Short role: named driver for lean --run of
  HostModuleCheckEmitBannerScaffoldTerm.lean.
  Ready is HostFrontLiveHostModuleCheckEmitBannerScaffoldTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckEmitBannerScaffoldTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckEmitBannerScaffoldTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckEmitBannerScaffoldTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITBANNERSCAFFOLDTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKEMITBANNERSCAFFOLDTERM_V0
  PARSE-LIVE-HOSTMODULECHECKEMITBANNERSCAFFOLDTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckemitbannerscaffoldterm,
  slakeTypecheckHostModuleCheckEmitBannerScaffoldTermReady,
  kernelCheckLiveHostModuleCheckEmitBannerScaffoldTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckEmitBannerScaffoldTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckEmitBannerScaffoldTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKEMITBANNERSCAFFOLDTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITBANNERSCAFFOLDTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckEmitBannerScaffoldTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckEmitBannerScaffoldTerm : String :=
  "slake-typecheck-hostmodulecheckemitbannerscaffoldterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckEmitBannerScaffoldTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitBannerScaffoldTerm.liveHostModuleCheckEmitBannerScaffoldTermRel

/-- Ready names HostFrontLiveHostModuleCheckEmitBannerScaffoldTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckEmitBannerScaffoldTermReady,
    kernelCheckLiveHostModuleCheckEmitBannerScaffoldTermSource. -/
def slakeTypecheckHostModuleCheckEmitBannerScaffoldTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitBannerScaffoldTerm.hostFrontLiveHostModuleCheckEmitBannerScaffoldTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckEmitBannerScaffoldTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckEmitBannerScaffoldTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckEmitBannerScaffoldTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckEmitBannerScaffoldTerm.lean.
    Ready is hostFrontLiveHostModuleCheckEmitBannerScaffoldTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckEmitBannerScaffoldTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckEmitBannerScaffoldTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckEmitBannerScaffoldTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckEmitBannerScaffoldTermRel}"
  unless (!slakeTypecheckHostModuleCheckEmitBannerScaffoldTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckEmitBannerScaffoldTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckEmitBannerScaffoldTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckEmitBannerScaffoldTerm.main args
