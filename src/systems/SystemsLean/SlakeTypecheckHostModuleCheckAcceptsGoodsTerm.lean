/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckAcceptsGoodsTerm.
  Short role: named driver for lean --run of
  HostModuleCheckAcceptsGoodsTerm.lean.
  Ready is HostFrontLiveHostModuleCheckAcceptsGoodsTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckAcceptsGoodsTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckAcceptsGoodsTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckAcceptsGoodsTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKACCEPTSGOODSTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKACCEPTSGOODSTERM_V0
  PARSE-LIVE-HOSTMODULECHECKACCEPTSGOODSTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckacceptsgoodsterm,
  slakeTypecheckHostModuleCheckAcceptsGoodsTermReady,
  kernelCheckLiveHostModuleCheckAcceptsGoodsTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckAcceptsGoodsTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoodsTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKACCEPTSGOODSTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKACCEPTSGOODSTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckAcceptsGoodsTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckAcceptsGoodsTerm : String :=
  "slake-typecheck-hostmodulecheckacceptsgoodsterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckAcceptsGoodsTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoodsTerm.liveHostModuleCheckAcceptsGoodsTermRel

/-- Ready names HostFrontLiveHostModuleCheckAcceptsGoodsTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckAcceptsGoodsTermReady,
    kernelCheckLiveHostModuleCheckAcceptsGoodsTermSource. -/
def slakeTypecheckHostModuleCheckAcceptsGoodsTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoodsTerm.hostFrontLiveHostModuleCheckAcceptsGoodsTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckAcceptsGoodsTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckAcceptsGoodsTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckAcceptsGoodsTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckAcceptsGoodsTerm.lean.
    Ready is hostFrontLiveHostModuleCheckAcceptsGoodsTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckAcceptsGoodsTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckAcceptsGoodsTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoodsTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckAcceptsGoodsTermRel}"
  unless (!slakeTypecheckHostModuleCheckAcceptsGoodsTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckAcceptsGoodsTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckAcceptsGoodsTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoodsTerm.main args
