/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckFixtureTextsLater.
  Short role: named driver for lean --run of
  HostModuleCheckFixtureTextsLater.lean.
  Ready is HostFrontLiveHostModuleCheckFixtureTextsLater parse plus
  HostKernel.kernelCheck of live HostModuleCheckFixtureTextsLater.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckFixtureTextsLater.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckFixtureTextsLater
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFIXTURETEXTSLATER
  SLAKE_TYPECHECK_HOSTMODULECHECKFIXTURETEXTSLATER_V0
  PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTSLATER
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckfixturetextslater,
  slakeTypecheckHostModuleCheckFixtureTextsLaterReady,
  kernelCheckLiveHostModuleCheckFixtureTextsLaterSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckFixtureTextsLater
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsLater

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKFIXTURETEXTSLATER_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFIXTURETEXTSLATER"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckFixtureTextsLater.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckFixtureTextsLater : String :=
  "slake-typecheck-hostmodulecheckfixturetextslater"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckFixtureTextsLaterRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsLater.liveHostModuleCheckFixtureTextsLaterRel

/-- Ready names HostFrontLiveHostModuleCheckFixtureTextsLater parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckFixtureTextsLaterReady,
    kernelCheckLiveHostModuleCheckFixtureTextsLaterSource. -/
def slakeTypecheckHostModuleCheckFixtureTextsLaterReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsLater.hostFrontLiveHostModuleCheckFixtureTextsLaterReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckFixtureTextsLaterDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckFixtureTextsLaterFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckFixtureTextsLaterOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckFixtureTextsLater.lean.
    Ready is hostFrontLiveHostModuleCheckFixtureTextsLaterReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckFixtureTextsLater.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckFixtureTextsLater} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsLater.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckFixtureTextsLaterRel}"
  unless (!slakeTypecheckHostModuleCheckFixtureTextsLaterFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFixtureTextsLaterOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckFixtureTextsLaterDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsLater.main args
