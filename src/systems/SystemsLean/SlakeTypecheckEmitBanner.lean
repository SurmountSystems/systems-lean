/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitBanner.
  Short role: named driver for just slake-typecheck-emitbanner.
  Ready is HostFrontLiveEmitBanner parse plus HostKernel.kernelCheck
  of live EmitBanner.lean, not := true, not lake build
  SystemsLean.EmitBanner.
  Not mill. Not occupancy name 50. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so a longer name is not a prefix hit):
  SlakeTypecheckEmitBanner
  HOST-SLAKE-TYPECHECK-EMIT-BANNER
  SLAKE_TYPECHECK_EMIT_BANNER_V0
  PARSE-LIVE-EMIT-BANNER
  src/systems/SystemsLean/EmitBanner.lean
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-emitbanner,
  slakeTypecheckEmitBannerReady,
  kernelCheckLiveEmitBannerSource.
  Module: SystemsLean.SlakeTypecheckEmitBanner
  Checkable writer: just slake-typecheck-emitbanner
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitBanner

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_BANNER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-BANNER"

/-- Named just recipe. Not lake build SystemsLean.EmitBanner. -/
def justRecipeSlakeTypecheckEmitBanner : String := "slake-typecheck-emitbanner"

/-- Live basename. Exact equality. Not a directory prefix. -/
def liveRel : String := SystemsLean.HostFrontLiveEmitBanner.liveRel

/-- Ready names HostFrontLiveEmitBanner parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckEmitBannerReady,
    kernelCheckLiveEmitBannerSource. -/
def slakeTypecheckEmitBannerReady : Bool :=
  SystemsLean.HostFrontLiveEmitBanner.hostFrontLiveEmitBannerReady

/-- Honesty: this command is not lake build of EmitBanner. -/
def slakeTypecheckEmitBannerDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitBannerFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitBannerOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitBanner.lean.
    Ready is HostFrontLiveEmitBanner.hostFrontLiveEmitBannerReady
    (parse plus kernelCheck), not := true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitBanner} =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={SystemsLean.HostFrontLiveEmitBanner.liveEmitBannerRel}"
  unless (liveRel == "EmitBanner.lean") do
    IO.eprintln "error: liveRel must be EmitBanner.lean"
    return 1
  unless (!slakeTypecheckEmitBannerFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitBannerOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckEmitBannerDoesNotUseLake do
    IO.eprintln "error: doesNotUseLake must stay true"
    return 1
  unless slakeTypecheckEmitBannerReady do
    IO.eprintln "error: slakeTypecheckEmitBannerReady false"
    return 1
  SystemsLean.HostFrontLiveEmitBanner.main args
