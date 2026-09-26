/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckFixtures.
  Short role: named driver for lean --run of
  HostModuleCheckFixtures.lean.
  Ready is HostFrontLiveHostModuleCheckFixtures parse plus
  HostKernel.kernelCheck of live HostModuleCheckFixtures.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckFixtures.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckFixtures
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFIXTURES
  SLAKE_TYPECHECK_HOSTMODULECHECKFIXTURES_V0
  PARSE-LIVE-HOSTMODULECHECKFIXTURES
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckfixtures,
  slakeTypecheckHostModuleCheckFixturesReady,
  kernelCheckLiveHostModuleCheckFixturesSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckFixtures
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckFixtures

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKFIXTURES_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFIXTURES"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckFixtures.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckFixtures : String :=
  "slake-typecheck-hostmodulecheckfixtures"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckFixturesRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckFixtures.liveHostModuleCheckFixturesRel

/-- Ready names HostFrontLiveHostModuleCheckFixtures parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckFixturesReady,
    kernelCheckLiveHostModuleCheckFixturesSource. -/
def slakeTypecheckHostModuleCheckFixturesReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckFixtures.hostFrontLiveHostModuleCheckFixturesReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckFixturesDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckFixturesFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckFixturesOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckFixtures.lean.
    Ready is hostFrontLiveHostModuleCheckFixturesReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckFixtures.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckFixtures} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckFixtures.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckFixturesRel}"
  unless (!slakeTypecheckHostModuleCheckFixturesFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFixturesOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckFixturesDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckFixtures.main args
