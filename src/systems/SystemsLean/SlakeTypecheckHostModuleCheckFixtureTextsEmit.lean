/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckFixtureTextsEmit.
  Short role: named driver for lean --run of
  HostModuleCheckFixtureTextsEmit.lean.
  Ready is HostFrontLiveHostModuleCheckFixtureTextsEmit parse plus
  HostKernel.kernelCheck of live HostModuleCheckFixtureTextsEmit.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckFixtureTextsEmit.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckFixtureTextsEmit
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFIXTURETEXTSEMIT
  SLAKE_TYPECHECK_HOSTMODULECHECKFIXTURETEXTSEMIT_V0
  PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTSEMIT
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckfixturetextsemit,
  slakeTypecheckHostModuleCheckFixtureTextsEmitReady,
  kernelCheckLiveHostModuleCheckFixtureTextsEmitSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckFixtureTextsEmit
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsEmit

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKFIXTURETEXTSEMIT_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFIXTURETEXTSEMIT"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckFixtureTextsEmit.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckFixtureTextsEmit : String :=
  "slake-typecheck-hostmodulecheckfixturetextsemit"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckFixtureTextsEmitRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsEmit.liveHostModuleCheckFixtureTextsEmitRel

/-- Ready names HostFrontLiveHostModuleCheckFixtureTextsEmit parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckFixtureTextsEmitReady,
    kernelCheckLiveHostModuleCheckFixtureTextsEmitSource. -/
def slakeTypecheckHostModuleCheckFixtureTextsEmitReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsEmit.hostFrontLiveHostModuleCheckFixtureTextsEmitReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckFixtureTextsEmitDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckFixtureTextsEmitFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckFixtureTextsEmitOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckFixtureTextsEmit.lean.
    Ready is hostFrontLiveHostModuleCheckFixtureTextsEmitReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckFixtureTextsEmit.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckFixtureTextsEmit} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsEmit.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckFixtureTextsEmitRel}"
  unless (!slakeTypecheckHostModuleCheckFixtureTextsEmitFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFixtureTextsEmitOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckFixtureTextsEmitDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsEmit.main args
