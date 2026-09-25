/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckPackageEnvDialectTail.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckPackageEnvDialectTail. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageEnvDialectTail
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvDialectTailSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_PACKAGE_ENV_DIALECT_TAIL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-PACKAGE-ENV-DIALECT-TAIL"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckPackageEnvDialectTailRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvDialectTailSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckPackageEnvDialectTailReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvDialectTailSource.hostFrontLiveHostModuleCheckPackageEnvDialectTailSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvDialectTailFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvDialectTailOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageEnvDialectTailSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageEnvDialectTailRel}"
  unless (!slakeTypecheckHostModuleCheckPackageEnvDialectTailFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvDialectTailOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvDialectTailSource.main args
