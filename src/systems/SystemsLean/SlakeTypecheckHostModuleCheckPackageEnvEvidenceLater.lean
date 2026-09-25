/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckPackageEnvEvidenceLater.
  Short role: named driver for lean --run of the
  HostModuleCheckPackageEnvEvidenceLater.lean wrap.
  Ready is HostFrontLiveHostModuleCheckPackageEnvEvidenceLater parse plus
  HostKernel.kernelCheck of live HostModuleCheckPackageEnvEvidenceLater.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckPackageEnvEvidenceLater.
  liveRel is HostModuleCheckPackageEnvEvidenceLater.lean.
  This wrap is HostModuleCheckPackageEnvEvidenceLater.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEENVEVIDENCELATER,
  SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEENVEVIDENCELATER,
  slake-typecheck-hostmodulecheckpackageenvevidencelater,
  slakeTypecheckHostModuleCheckPackageEnvEvidenceLaterReady,
  kernelCheckLiveHostModuleCheckPackageEnvEvidenceLaterSource,
  PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageEnvEvidenceLater
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckPackageEnvEvidenceLater.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceLater

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEENVEVIDENCELATER"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEENVEVIDENCELATER"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckPackageEnvEvidenceLater : String :=
  "slake-typecheck-hostmodulecheckpackageenvevidencelater"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckPackageEnvEvidenceLaterRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceLater.liveHostModuleCheckPackageEnvEvidenceLaterRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckPackageEnvEvidenceLaterReady,
    kernelCheckLiveHostModuleCheckPackageEnvEvidenceLaterSource. -/
def slakeTypecheckHostModuleCheckPackageEnvEvidenceLaterReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceLater.hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckPackageEnvEvidenceLaterDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvEvidenceLaterFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckPackageEnvEvidenceLaterFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvEvidenceLaterOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckPackageEnvEvidenceLater.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckPackageEnvEvidenceLater.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckPackageEnvEvidenceLater} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceLater.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageEnvEvidenceLaterRel}"
  unless (!slakeTypecheckHostModuleCheckPackageEnvEvidenceLaterFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvEvidenceLaterFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvEvidenceLaterOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckPackageEnvEvidenceLaterDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceLater.main args
