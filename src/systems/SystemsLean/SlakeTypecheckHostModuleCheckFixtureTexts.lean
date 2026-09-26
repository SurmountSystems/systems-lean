/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckFixtureTexts.
  Short role: named driver for lean --run of
  HostModuleCheckFixtureTexts.lean.
  Ready is HostFrontLiveHostModuleCheckFixtureTexts parse plus
  HostKernel.kernelCheck of live HostModuleCheckFixtureTexts.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckFixtureTexts.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckFixtureTexts
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFIXTURETEXTS
  SLAKE_TYPECHECK_HOSTMODULECHECKFIXTURETEXTS_V0
  PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTS
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckfixturetexts,
  slakeTypecheckHostModuleCheckFixtureTextsReady,
  kernelCheckLiveHostModuleCheckFixtureTextsSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckFixtureTexts
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckFixtureTexts

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKFIXTURETEXTS_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFIXTURETEXTS"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckFixtureTexts.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckFixtureTexts : String :=
  "slake-typecheck-hostmodulecheckfixturetexts"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckFixtureTextsRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTexts.liveHostModuleCheckFixtureTextsRel

/-- Ready names HostFrontLiveHostModuleCheckFixtureTexts parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckFixtureTextsReady,
    kernelCheckLiveHostModuleCheckFixtureTextsSource. -/
def slakeTypecheckHostModuleCheckFixtureTextsReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTexts.hostFrontLiveHostModuleCheckFixtureTextsReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckFixtureTextsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckFixtureTextsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckFixtureTextsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckFixtureTexts.lean.
    Ready is hostFrontLiveHostModuleCheckFixtureTextsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckFixtureTexts.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckFixtureTexts} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckFixtureTexts.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckFixtureTextsRel}"
  unless (!slakeTypecheckHostModuleCheckFixtureTextsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFixtureTextsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckFixtureTextsDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckFixtureTexts.main args
