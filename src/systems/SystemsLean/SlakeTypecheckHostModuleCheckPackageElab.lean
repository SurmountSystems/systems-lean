/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckPackageElab.
  Short role: named driver for lean --run of the
  HostModuleCheckPackageElab.lean wrap.
  Ready is HostFrontLiveHostModuleCheckPackageElab parse plus
  HostKernel.kernelCheck of live HostModuleCheckPackageElab.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckPackageElab.
  liveRel is HostModuleCheckPackageElab.lean.
  This wrap is HostModuleCheckPackageElab.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEELAB,
  SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEELAB,
  slake-typecheck-hostmodulecheckpackageelab,
  slakeTypecheckHostModuleCheckPackageElabReady,
  kernelCheckLiveHostModuleCheckPackageElabSource,
  PARSE-LIVE-HOSTMODULECHECKPACKAGEELAB.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageElab
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckPackageElab.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageElab

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEELAB"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEELAB"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckPackageElab : String :=
  "slake-typecheck-hostmodulecheckpackageelab"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckPackageElabRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageElab.liveHostModuleCheckPackageElabRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckPackageElabReady,
    kernelCheckLiveHostModuleCheckPackageElabSource. -/
def slakeTypecheckHostModuleCheckPackageElabReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageElab.hostFrontLiveHostModuleCheckPackageElabReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckPackageElabDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageElabFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckPackageElabFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageElabOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckPackageElab.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckPackageElabReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckPackageElab.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckPackageElab} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageElab.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageElabRel}"
  unless (!slakeTypecheckHostModuleCheckPackageElabFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageElabFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageElabOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckPackageElabDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageElab.main args
