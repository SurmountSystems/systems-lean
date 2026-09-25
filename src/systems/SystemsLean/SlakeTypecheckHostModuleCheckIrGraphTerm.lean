/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckIrGraphTerm.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckIrGraphTerm. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckIrGraphTerm
-/

import SystemsLean.HostFrontLiveHostModuleCheckIrGraphTermSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_IR_GRAPH_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IR-GRAPH-TERM"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckIrGraphTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckIrGraphTermSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckIrGraphTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckIrGraphTermSource.hostFrontLiveHostModuleCheckIrGraphTermSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckIrGraphTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckIrGraphTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckIrGraphTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckIrGraphTermRel}"
  unless (!slakeTypecheckHostModuleCheckIrGraphTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckIrGraphTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckIrGraphTermSource.main args
