/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckPackageEnvLaterTerms.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckPackageEnvLaterTerms. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckPackageEnvLaterTerms
-/

import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvLaterTermsSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_PACKAGE_ENV_LATER_TERMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-PACKAGE-ENV-LATER-TERMS"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckPackageEnvLaterTermsRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvLaterTermsSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckPackageEnvLaterTermsReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvLaterTermsSource.hostFrontLiveHostModuleCheckPackageEnvLaterTermsSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvLaterTermsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckPackageEnvLaterTermsOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckPackageEnvLaterTermsSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageEnvLaterTermsRel}"
  unless (!slakeTypecheckHostModuleCheckPackageEnvLaterTermsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckPackageEnvLaterTermsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckPackageEnvLaterTermsSource.main args
