/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckPackageEnvFixturesU2.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckPackageEnvFixturesU2. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageEnvFixturesU2
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesU2Source

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_PACKAGE_ENV_FIXTURES_U2_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-PACKAGE-ENV-FIXTURES-U2"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckPackageEnvFixturesU2Rel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesU2Source.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesU2Ready : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesU2Source.hostFrontLiveHostModuleCheckPackageEnvFixturesU2SourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesU2FullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvFixturesU2OwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesU2Source.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageEnvFixturesU2Rel}"
  unless (!slakeTypecheckHostModuleCheckPackageEnvFixturesU2FullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvFixturesU2OwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesU2Source.main args
