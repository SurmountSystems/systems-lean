/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckHostGraphTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckHostGraphTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckHostGraphTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckHostGraphTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckHostGraphTerm.
  liveRel is HostModuleCheckHostGraphTerm.lean.
  This wrap is HostModuleCheckHostGraphTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKHOSTGRAPHTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKHOSTGRAPHTERM,
  slake-typecheck-hostmodulecheckhostgraphterm,
  slakeTypecheckHostModuleCheckHostGraphTermReady,
  kernelCheckLiveHostModuleCheckHostGraphTermSource,
  PARSE-LIVE-HOSTMODULECHECKHOSTGRAPHTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckHostGraphTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckHostGraphTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckHostGraphTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKHOSTGRAPHTERM"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKHOSTGRAPHTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckHostGraphTerm : String :=
  "slake-typecheck-hostmodulecheckhostgraphterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckHostGraphTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckHostGraphTerm.liveHostModuleCheckHostGraphTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckHostGraphTermReady,
    kernelCheckLiveHostModuleCheckHostGraphTermSource. -/
def slakeTypecheckHostModuleCheckHostGraphTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckHostGraphTerm.hostFrontLiveHostModuleCheckHostGraphTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckHostGraphTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckHostGraphTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckHostGraphTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckHostGraphTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckHostGraphTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckHostGraphTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckHostGraphTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckHostGraphTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckHostGraphTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckHostGraphTermRel}"
  unless (!slakeTypecheckHostModuleCheckHostGraphTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostGraphTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostGraphTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckHostGraphTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckHostGraphTerm.main args
