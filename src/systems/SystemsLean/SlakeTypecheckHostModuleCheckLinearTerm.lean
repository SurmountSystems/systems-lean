/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckLinearTerm.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckLinearTerm. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckLinearTerm
-/

import SystemsLean.HostFrontLiveHostModuleCheckLinearTermSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_LINEAR_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-LINEAR-TERM"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckLinearTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckLinearTermSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckLinearTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckLinearTermSource.hostFrontLiveHostModuleCheckLinearTermSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckLinearTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckLinearTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckLinearTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckLinearTermRel}"
  unless (!slakeTypecheckHostModuleCheckLinearTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLinearTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckLinearTermSource.main args
