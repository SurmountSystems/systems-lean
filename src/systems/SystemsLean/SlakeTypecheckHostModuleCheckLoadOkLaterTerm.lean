/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckLoadOkLaterTerm.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckLoadOkLaterTerm. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckLoadOkLaterTerm
-/

import SystemsLean.HostFrontLiveHostModuleCheckLoadOkLaterTermSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_LOAD_OK_LATER_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-LOAD-OK-LATER-TERM"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckLoadOkLaterTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckLoadOkLaterTermSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckLoadOkLaterTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckLoadOkLaterTermSource.hostFrontLiveHostModuleCheckLoadOkLaterTermSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckLoadOkLaterTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckLoadOkLaterTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckLoadOkLaterTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckLoadOkLaterTermRel}"
  unless (!slakeTypecheckHostModuleCheckLoadOkLaterTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLoadOkLaterTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckLoadOkLaterTermSource.main args
