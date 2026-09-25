/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckPackageEnvFixtures.
  Short role: named driver for the HostModuleCheckPackageEnvFixtures
  closed subset.
  Ready is HostFrontLiveHostModuleCheckPackageEnvFixtures parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckPackageEnvFixtures.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckPackageEnvFixtures.
  liveRel is HostModuleCheckPackageEnvFixtures.lean.
  This checker is HostModuleCheckPackageEnvFixtures.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEENVFIXTURES,
  SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEENVFIXTURES,
  slake-typecheck-hostmodulecheckpackageenvfixtures,
  slakeTypecheckHostModuleCheckPackageEnvFixturesReady,
  kernelCheckLiveHostModuleCheckPackageEnvFixturesSource,
  PARSE-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURES.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageEnvFixtures
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckPackageEnvFixtures.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesSource
import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixtures

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTMODULECHECKPACKAGEENVFIXTURES"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPACKAGEENVFIXTURES"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckPackageEnvFixtures : String :=
  "slake-typecheck-hostmodulecheckpackageenvfixtures"

/-- Live file relative to repo root. -/
def liveHostModuleCheckPackageEnvFixturesRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixtures.liveHostModuleCheckPackageEnvFixturesRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckPackageEnvFixturesReady. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixtures.hostFrontLiveHostModuleCheckPackageEnvFixturesReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesFullBackend : Bool :=
  false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckPackageEnvFixtures.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckPackageEnvFixtures} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixtures.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageEnvFixturesRel}"
  unless (!slakeTypecheckHostModuleCheckPackageEnvFixturesFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvFixturesFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvFixturesOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckPackageEnvFixturesDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixtures.main args
