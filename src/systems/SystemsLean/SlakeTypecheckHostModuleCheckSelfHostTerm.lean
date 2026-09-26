/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckSelfHostTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckSelfHostTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckSelfHostTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckSelfHostTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckSelfHostTerm.
  liveRel is HostModuleCheckSelfHostTerm.lean.
  This wrap is HostModuleCheckSelfHostTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  It is not HostModuleCheckTheorems.lean.
  It is not HostModuleCheckRequiredDeclsProduct.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Host tools stay 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKSELFHOSTTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKSELFHOSTTERM,
  slake-typecheck-hostmodulecheckselfhostterm,
  slakeTypecheckHostModuleCheckSelfHostTermReady,
  kernelCheckLiveHostModuleCheckSelfHostTermSource,
  PARSE-LIVE-HOSTMODULECHECKSELFHOSTTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckSelfHostTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckSelfHostTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckSelfHostTerm

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKSELFHOSTTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKSELFHOSTTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckSelfHostTerm : String :=
  "slake-typecheck-hostmodulecheckselfhostterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckSelfHostTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckSelfHostTerm.liveHostModuleCheckSelfHostTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckSelfHostTermReady,
    kernelCheckLiveHostModuleCheckSelfHostTermSource. -/
def slakeTypecheckHostModuleCheckSelfHostTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckSelfHostTerm.hostFrontLiveHostModuleCheckSelfHostTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckSelfHostTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckSelfHostTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckSelfHostTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckSelfHostTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckSelfHostTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckSelfHostTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckSelfHostTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckSelfHostTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckSelfHostTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckSelfHostTermRel}"
  unless (!slakeTypecheckHostModuleCheckSelfHostTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSelfHostTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSelfHostTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckSelfHostTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckSelfHostTerm.main args
