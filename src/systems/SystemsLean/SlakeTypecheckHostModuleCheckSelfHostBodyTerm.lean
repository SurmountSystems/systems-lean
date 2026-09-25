/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckSelfHostBodyTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckSelfHostBodyTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckSelfHostBodyTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckSelfHostBodyTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckSelfHostBodyTerm.
  liveRel is HostModuleCheckSelfHostBodyTerm.lean.
  This wrap is HostModuleCheckSelfHostBodyTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  It is not HostModuleCheckTheorems.lean.
  It is not HostModuleCheckRequiredDeclsProduct.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Host tools stay 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKSELFHOSTBODYTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKSELFHOSTBODYTERM,
  slake-typecheck-hostmodulecheckselfhostbodyterm,
  slakeTypecheckHostModuleCheckSelfHostBodyTermReady,
  kernelCheckLiveHostModuleCheckSelfHostBodyTermSource,
  PARSE-LIVE-HOSTMODULECHECKSELFHOSTBODYTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckSelfHostBodyTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckSelfHostBodyTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckSelfHostBodyTerm

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKSELFHOSTBODYTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKSELFHOSTBODYTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckSelfHostBodyTerm : String :=
  "slake-typecheck-hostmodulecheckselfhostbodyterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckSelfHostBodyTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckSelfHostBodyTerm.liveHostModuleCheckSelfHostBodyTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckSelfHostBodyTermReady,
    kernelCheckLiveHostModuleCheckSelfHostBodyTermSource. -/
def slakeTypecheckHostModuleCheckSelfHostBodyTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckSelfHostBodyTerm.hostFrontLiveHostModuleCheckSelfHostBodyTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckSelfHostBodyTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckSelfHostBodyTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckSelfHostBodyTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckSelfHostBodyTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckSelfHostBodyTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckSelfHostBodyTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckSelfHostBodyTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckSelfHostBodyTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckSelfHostBodyTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckSelfHostBodyTermRel}"
  unless (!slakeTypecheckHostModuleCheckSelfHostBodyTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSelfHostBodyTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSelfHostBodyTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckSelfHostBodyTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckSelfHostBodyTerm.main args
