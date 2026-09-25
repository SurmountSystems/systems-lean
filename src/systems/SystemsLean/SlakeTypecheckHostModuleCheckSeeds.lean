/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckSeeds.
  Short role: named driver for lean --run of the
  HostModuleCheckSeeds.lean wrap.
  Ready is HostFrontLiveHostModuleCheckSeeds parse plus
  HostKernel.kernelCheck of live HostModuleCheckSeeds.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckSeeds.
  liveRel is HostModuleCheckSeeds.lean.
  This wrap is HostModuleCheckSeeds.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  It is not HostModuleCheckTheorems.lean.
  It is not HostModuleCheckRequiredDeclsProduct.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKSEEDS,
  SLAKE_TYPECHECK_HOSTMODULECHECKSEEDS,
  slake-typecheck-hostmodulecheckseeds,
  slakeTypecheckHostModuleCheckSeedsReady,
  kernelCheckLiveHostModuleCheckSeedsSource,
  PARSE-LIVE-HOSTMODULECHECKSEEDS.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckSeeds
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckSeeds.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckSeeds

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKSEEDS"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKSEEDS"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckSeeds : String :=
  "slake-typecheck-hostmodulecheckseeds"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckSeedsRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckSeeds.liveHostModuleCheckSeedsRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckSeedsReady,
    kernelCheckLiveHostModuleCheckSeedsSource. -/
def slakeTypecheckHostModuleCheckSeedsReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckSeeds.hostFrontLiveHostModuleCheckSeedsReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckSeedsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckSeedsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckSeedsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckSeedsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckSeeds.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckSeedsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckSeeds.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckSeeds} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckSeeds.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckSeedsRel}"
  unless (!slakeTypecheckHostModuleCheckSeedsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSeedsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSeedsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckSeedsDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckSeeds.main args
