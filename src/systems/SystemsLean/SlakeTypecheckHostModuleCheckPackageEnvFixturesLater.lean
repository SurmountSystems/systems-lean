/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckPackageEnvFixturesLater.
  Short role: named driver for the HostModuleCheckPackageEnvFixturesLater
  closed subset.
  Ready is HostFrontLiveHostModuleCheckPackageEnvFixturesLater parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckPackageEnvFixturesLater.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckPackageEnvFixturesLater.
  liveRel is HostModuleCheckPackageEnvFixturesLater.lean.
  This checker is HostModuleCheckPackageEnvFixturesLater.lean.
  Not HostModuleCheckPackageEnvEvidence.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEENVFIXTURESLATER,
  SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEENVFIXTURESLATER,
  slake-typecheck-hostmodulecheckpackageenvfixtureslater,
  slakeTypecheckHostModuleCheckPackageEnvFixturesLaterReady,
  kernelCheckLiveHostModuleCheckPackageEnvFixturesLaterSource,
  PARSE-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESLATER.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageEnvFixturesLater
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckPackageEnvFixturesLater.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesLaterSource
import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesLater

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEENVFIXTURESLATER"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEENVFIXTURESLATER"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckPackageEnvFixturesLater : String :=
  "slake-typecheck-hostmodulecheckpackageenvfixtureslater"

/-- Live file relative to repo root. -/
def liveHostModuleCheckPackageEnvFixturesLaterRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesLater.liveHostModuleCheckPackageEnvFixturesLaterRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckPackageEnvFixturesLaterReady. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesLaterReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesLater.hostFrontLiveHostModuleCheckPackageEnvFixturesLaterReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesLaterDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesLaterFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesLaterFullBackend : Bool :=
  false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesLaterOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckPackageEnvFixturesLater.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckPackageEnvFixturesLater} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesLater.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageEnvFixturesLaterRel}"
  unless (!slakeTypecheckHostModuleCheckPackageEnvFixturesLaterFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvFixturesLaterFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvFixturesLaterOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckPackageEnvFixturesLaterDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesLater.main args
