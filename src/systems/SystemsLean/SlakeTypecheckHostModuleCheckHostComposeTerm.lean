/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckHostComposeTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckHostComposeTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckHostComposeTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckHostComposeTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckHostComposeTerm.
  liveRel is HostModuleCheckHostComposeTerm.lean.
  This wrap is HostModuleCheckHostComposeTerm.lean.
  It is not HostModuleCheck.lean and not HostCompose.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKHOSTCOMPOSETERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKHOSTCOMPOSETERM,
  slake-typecheck-hostmodulecheckhostcomposeterm,
  slakeTypecheckHostModuleCheckHostComposeTermReady,
  kernelCheckLiveHostModuleCheckHostComposeTermSource,
  PARSE-LIVE-HOSTMODULECHECKHOSTCOMPOSETERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckHostComposeTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckHostComposeTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckHostComposeTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKHOSTCOMPOSETERM"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKHOSTCOMPOSETERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckHostComposeTerm : String :=
  "slake-typecheck-hostmodulecheckhostcomposeterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckHostComposeTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckHostComposeTerm.liveHostModuleCheckHostComposeTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckHostComposeTermReady,
    kernelCheckLiveHostModuleCheckHostComposeTermSource. -/
def slakeTypecheckHostModuleCheckHostComposeTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckHostComposeTerm.hostFrontLiveHostModuleCheckHostComposeTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckHostComposeTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckHostComposeTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckHostComposeTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckHostComposeTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckHostComposeTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckHostComposeTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckHostComposeTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckHostComposeTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckHostComposeTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckHostComposeTermRel}"
  unless (!slakeTypecheckHostModuleCheckHostComposeTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostComposeTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostComposeTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckHostComposeTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckHostComposeTerm.main args
