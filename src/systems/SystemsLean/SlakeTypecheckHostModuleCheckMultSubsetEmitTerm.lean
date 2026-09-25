/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckMultSubsetEmitTerm.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckMultSubsetEmitTerm. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckMultSubsetEmitTerm
-/

import SystemsLean.HostFrontLiveHostModuleCheckMultSubsetEmitTermSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_MULT_SUBSET_EMIT_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-MULT-SUBSET-EMIT-TERM"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckMultSubsetEmitTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckMultSubsetEmitTermSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckMultSubsetEmitTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckMultSubsetEmitTermSource.hostFrontLiveHostModuleCheckMultSubsetEmitTermSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckMultSubsetEmitTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckMultSubsetEmitTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckMultSubsetEmitTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckMultSubsetEmitTermRel}"
  unless (!slakeTypecheckHostModuleCheckMultSubsetEmitTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckMultSubsetEmitTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckMultSubsetEmitTermSource.main args
