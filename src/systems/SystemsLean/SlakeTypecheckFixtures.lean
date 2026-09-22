/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckFixtures.
  Short role: named driver for just slake-typecheck-fixtures.
  Ready is HostFrontLiveFixtures parse plus HostKernel.kernelCheck of live
  HostModuleCheckFixtures.lean, not := true, not lake build
  SystemsLean.HostModuleCheckFixtures.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-FIXTURES,
  SLAKE_TYPECHECK_FIXTURES_V0, slake-typecheck-fixtures,
  slakeTypecheckFixturesReady, kernelCheckLiveFixturesSource,
  PARSE-LIVE-FIXTURES, SKELETON.
  Module: SystemsLean.SlakeTypecheckFixtures
  Checkable writer: just slake-typecheck-fixtures (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveFixtures

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_FIXTURES_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-FIXTURES"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckFixtures. -/
def justRecipeSlakeTypecheckFixtures : String :=
  "slake-typecheck-fixtures"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFixturesRel : String :=
  SystemsLean.HostFrontLiveFixtures.liveFixturesRel

/-- Ready names HostFrontLiveFixtures parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckFixturesReady,
    kernelCheckLiveFixturesSource. -/
def slakeTypecheckFixturesReady : Bool :=
  SystemsLean.HostFrontLiveFixtures.hostFrontLiveFixturesReady

/-- Honesty: this command is not lake build of HostModuleCheckFixtures. -/
def slakeTypecheckFixturesDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckFixturesFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckFixturesOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckFixtures.lean.
    Ready is HostFrontLiveFixtures.hostFrontLiveFixturesReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveFixtures.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckFixtures} =="
  IO.println s!"  host={hostId} file={liveFixturesRel}"
  unless (!slakeTypecheckFixturesFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckFixturesOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveFixtures.main args
