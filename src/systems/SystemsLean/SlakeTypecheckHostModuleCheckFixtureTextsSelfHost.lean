/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckFixtureTextsSelfHost.
  Short role: named driver for lean --run of
  HostModuleCheckFixtureTextsSelfHost.lean.
  Ready is HostFrontLiveHostModuleCheckFixtureTextsSelfHost parse plus
  HostKernel.kernelCheck of live HostModuleCheckFixtureTextsSelfHost.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckFixtureTextsSelfHost.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckFixtureTextsSelfHost
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFIXTURETEXTSSELFHOST
  SLAKE_TYPECHECK_HOSTMODULECHECKFIXTURETEXTSSELFHOST_V0
  PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTSSELFHOST
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckfixturetextsselfhost,
  slakeTypecheckHostModuleCheckFixtureTextsSelfHostReady,
  kernelCheckLiveHostModuleCheckFixtureTextsSelfHostSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckFixtureTextsSelfHost
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsSelfHost

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKFIXTURETEXTSSELFHOST_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFIXTURETEXTSSELFHOST"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckFixtureTextsSelfHost.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckFixtureTextsSelfHost : String :=
  "slake-typecheck-hostmodulecheckfixturetextsselfhost"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckFixtureTextsSelfHostRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsSelfHost.liveHostModuleCheckFixtureTextsSelfHostRel

/-- Ready names HostFrontLiveHostModuleCheckFixtureTextsSelfHost parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckFixtureTextsSelfHostReady,
    kernelCheckLiveHostModuleCheckFixtureTextsSelfHostSource. -/
def slakeTypecheckHostModuleCheckFixtureTextsSelfHostReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsSelfHost.hostFrontLiveHostModuleCheckFixtureTextsSelfHostReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckFixtureTextsSelfHostDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckFixtureTextsSelfHostFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckFixtureTextsSelfHostOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckFixtureTextsSelfHost.lean.
    Ready is hostFrontLiveHostModuleCheckFixtureTextsSelfHostReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckFixtureTextsSelfHost.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckFixtureTextsSelfHost} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsSelfHost.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckFixtureTextsSelfHostRel}"
  unless (!slakeTypecheckHostModuleCheckFixtureTextsSelfHostFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFixtureTextsSelfHostOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckFixtureTextsSelfHostDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsSelfHost.main args
