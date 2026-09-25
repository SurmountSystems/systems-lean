/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckAcceptsGoods.
  Short role: named driver for just slake-typecheck-hostmodulecheckacceptsgoods.
  Ready is HostFrontLiveHostModuleCheckAcceptsGoods parse plus HostKernel.kernelCheck
  of live HostModuleCheckAcceptsGoods.lean, not := true, not lake build
  SystemsLean.HostModuleCheckAcceptsGoods.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Do not retarget SlakeTypecheckHostModuleCheckAccepts. That driver runs the
  HostModuleCheckAccepts checker only.
  Do not wrap HostModuleCheckAcceptsGoodsTerm or any later file.
  Unique needles (trailing newline so SlakeTypecheckHostModuleCheckAcceptsGoods
  is not a prefix of a longer driver name):
  SlakeTypecheckHostModuleCheckAcceptsGoods
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-ACCEPTS-GOODS
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_ACCEPTS_GOODS_V0
  PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS-GOODS
  slake-typecheck-hostmodulecheckacceptsgoods
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostmodulecheckacceptsgoods,
  slakeTypecheckHostModuleCheckAcceptsGoodsReady,
  kernelCheckLiveHostModuleCheckAcceptsGoodsSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckAcceptsGoods
  Checkable writer: just slake-typecheck-hostmodulecheckacceptsgoods
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoods

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_ACCEPTS_GOODS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-ACCEPTS-GOODS"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckAcceptsGoods. -/
def justRecipeSlakeTypecheckHostModuleCheckAcceptsGoods : String :=
  "slake-typecheck-hostmodulecheckacceptsgoods"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckAcceptsGoodsRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoods.liveHostModuleCheckAcceptsGoodsRel

/-- Live basename. Greppable: liveRel. Must be HostModuleCheckAcceptsGoods.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoods.liveRel

/-- Ready names HostFrontLiveHostModuleCheckAcceptsGoods parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostModuleCheckAcceptsGoodsReady,
    kernelCheckLiveHostModuleCheckAcceptsGoodsSource. -/
def slakeTypecheckHostModuleCheckAcceptsGoodsReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoods.hostFrontLiveHostModuleCheckAcceptsGoodsReady

/-- Honesty: this command is not lake build of HostModuleCheckAcceptsGoods. -/
def slakeTypecheckHostModuleCheckAcceptsGoodsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckAcceptsGoodsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckAcceptsGoodsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckAcceptsGoods.lean.
    Ready is HostFrontLiveHostModuleCheckAcceptsGoods.hostFrontLiveHostModuleCheckAcceptsGoodsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckAcceptsGoods.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckAcceptsGoods} =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckAcceptsGoodsRel} liveRel={liveRel}"
  unless (!slakeTypecheckHostModuleCheckAcceptsGoodsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckAcceptsGoodsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckAcceptsGoods.main args
