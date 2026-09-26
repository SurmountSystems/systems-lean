/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckPackageEnvCoreTerms.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckPackageEnvCoreTerms. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageEnvCoreTerms
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvCoreTermsSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_PACKAGE_ENV_CORE_TERMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-PACKAGE-ENV-CORE-TERMS"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckPackageEnvCoreTermsRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvCoreTermsSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckPackageEnvCoreTermsReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvCoreTermsSource.hostFrontLiveHostModuleCheckPackageEnvCoreTermsSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvCoreTermsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvCoreTermsOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageEnvCoreTermsSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageEnvCoreTermsRel}"
  unless (!slakeTypecheckHostModuleCheckPackageEnvCoreTermsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvCoreTermsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvCoreTermsSource.main args
