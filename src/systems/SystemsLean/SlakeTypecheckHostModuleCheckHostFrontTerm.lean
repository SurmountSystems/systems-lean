/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckHostFrontTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckHostFrontTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckHostFrontTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckHostFrontTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckHostFrontTerm.
  liveRel is HostModuleCheckHostFrontTerm.lean.
  This wrap is HostModuleCheckHostFrontTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKHOSTFRONTTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKHOSTFRONTTERM,
  slake-typecheck-hostmodulecheckhostfrontterm,
  slakeTypecheckHostModuleCheckHostFrontTermReady,
  kernelCheckLiveHostModuleCheckHostFrontTermSource,
  PARSE-LIVE-HOSTMODULECHECKHOSTFRONTTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckHostFrontTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckHostFrontTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckHostFrontTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKHOSTFRONTTERM"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKHOSTFRONTTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckHostFrontTerm : String :=
  "slake-typecheck-hostmodulecheckhostfrontterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckHostFrontTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckHostFrontTerm.liveHostModuleCheckHostFrontTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckHostFrontTermReady,
    kernelCheckLiveHostModuleCheckHostFrontTermSource. -/
def slakeTypecheckHostModuleCheckHostFrontTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckHostFrontTerm.hostFrontLiveHostModuleCheckHostFrontTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckHostFrontTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckHostFrontTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckHostFrontTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckHostFrontTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckHostFrontTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckHostFrontTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckHostFrontTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckHostFrontTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckHostFrontTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckHostFrontTermRel}"
  unless (!slakeTypecheckHostModuleCheckHostFrontTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostFrontTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostFrontTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckHostFrontTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckHostFrontTerm.main args
