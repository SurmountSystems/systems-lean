/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckSmoke.
  Short role: named driver for lean --run of the
  HostModuleCheckSmoke.lean wrap.
  Ready is HostFrontLiveHostModuleCheckSmoke parse plus
  HostKernel.kernelCheck of live HostModuleCheckSmoke.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckSmoke.
  liveRel is HostModuleCheckSmoke.lean.
  This wrap is HostModuleCheckSmoke.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  It is not HostModuleCheckTheorems.lean.
  It is not HostModuleCheckRequiredDeclsProduct.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Host tools stay 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKSMOKE,
  SLAKE_TYPECHECK_HOSTMODULECHECKSMOKE,
  slake-typecheck-hostmodulechecksmoke,
  slakeTypecheckHostModuleCheckSmokeReady,
  kernelCheckLiveHostModuleCheckSmokeSource,
  PARSE-LIVE-HOSTMODULECHECKSMOKE.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckSmoke
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckSmoke.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckSmoke

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKSMOKE"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKSMOKE"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckSmoke : String :=
  "slake-typecheck-hostmodulechecksmoke"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckSmokeRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckSmoke.liveHostModuleCheckSmokeRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckSmokeReady,
    kernelCheckLiveHostModuleCheckSmokeSource. -/
def slakeTypecheckHostModuleCheckSmokeReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckSmoke.hostFrontLiveHostModuleCheckSmokeReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckSmokeDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckSmokeFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckSmokeFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckSmokeOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckSmoke.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckSmokeReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckSmoke.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckSmoke} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckSmoke.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckSmokeRel}"
  unless (!slakeTypecheckHostModuleCheckSmokeFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSmokeFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSmokeOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckSmokeDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckSmoke.main args
