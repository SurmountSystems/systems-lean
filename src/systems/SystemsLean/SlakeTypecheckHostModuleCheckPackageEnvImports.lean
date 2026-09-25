/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckPackageEnvImports.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckPackageEnvImports. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageEnvImports
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvImportsSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_PACKAGE_ENV_IMPORTS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-PACKAGE-ENV-IMPORTS"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckPackageEnvImportsRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvImportsSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckPackageEnvImportsReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvImportsSource.hostFrontLiveHostModuleCheckPackageEnvImportsSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvImportsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvImportsOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageEnvImportsSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageEnvImportsRel}"
  unless (!slakeTypecheckHostModuleCheckPackageEnvImportsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvImportsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvImportsSource.main args
