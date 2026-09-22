/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitBannerScaffold.
  Short role: named driver for just slake-typecheck-emitbannerscaffold.
  Ready is HostFrontLiveEmitBannerScaffold parse plus HostKernel.kernelCheck
  of live EmitBannerScaffold.lean, not := true, not lake build
  SystemsLean.EmitBannerScaffold.
  liveRel is EmitBannerScaffold.lean.
  Not mill. Not occupancy name 50. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so EmitBanner wrap is not a prefix):
  SlakeTypecheckEmitBannerScaffold
  HOST-SLAKE-TYPECHECK-EMIT-BANNER-SCAFFOLD
  SLAKE_TYPECHECK_EMIT_BANNER_SCAFFOLD_V0
  PARSE-LIVE-EMIT-BANNER-SCAFFOLD
  src/systems/SystemsLean/EmitBannerScaffold.lean
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-emitbannerscaffold,
  slakeTypecheckEmitBannerScaffoldReady,
  kernelCheckLiveEmitBannerScaffoldSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckEmitBannerScaffold
  Checkable writer: just slake-typecheck-emitbannerscaffold
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitBannerScaffold

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_BANNER_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-BANNER-SCAFFOLD"

/-- Named just recipe. Not lake build SystemsLean.EmitBannerScaffold. -/
def justRecipeSlakeTypecheckEmitBannerScaffold : String :=
  "slake-typecheck-emitbannerscaffold"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitBannerScaffoldRel : String :=
  SystemsLean.HostFrontLiveEmitBannerScaffold.liveEmitBannerScaffoldRel

/-- Ready names HostFrontLiveEmitBannerScaffold parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckEmitBannerScaffoldReady,
    kernelCheckLiveEmitBannerScaffoldSource. -/
def slakeTypecheckEmitBannerScaffoldReady : Bool :=
  SystemsLean.HostFrontLiveEmitBannerScaffold.hostFrontLiveEmitBannerScaffoldReady

/-- Honesty: this command is not lake build of EmitBannerScaffold. -/
def slakeTypecheckEmitBannerScaffoldDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitBannerScaffoldFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitBannerScaffoldOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitBannerScaffold.lean.
    Ready is HostFrontLiveEmitBannerScaffold.hostFrontLiveEmitBannerScaffoldReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveEmitBannerScaffold.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitBannerScaffold} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveEmitBannerScaffold.liveRel}"
  IO.println s!"  host={hostId} file={liveEmitBannerScaffoldRel}"
  unless (!slakeTypecheckEmitBannerScaffoldFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitBannerScaffoldOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitBannerScaffold.main args
