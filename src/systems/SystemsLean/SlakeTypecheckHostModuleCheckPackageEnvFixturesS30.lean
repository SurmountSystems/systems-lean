/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckPackageEnvFixturesS30.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckPackageEnvFixturesS30. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageEnvFixturesS30
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS30Source

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_PACKAGE_ENV_FIXTURES_S30_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-PACKAGE-ENV-FIXTURES-S30"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckPackageEnvFixturesS30Rel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS30Source.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesS30Ready : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS30Source.hostFrontLiveHostModuleCheckPackageEnvFixturesS30SourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesS30FullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesS30OwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS30Source.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageEnvFixturesS30Rel}"
  unless (!slakeTypecheckHostModuleCheckPackageEnvFixturesS30FullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvFixturesS30OwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS30Source.main args
