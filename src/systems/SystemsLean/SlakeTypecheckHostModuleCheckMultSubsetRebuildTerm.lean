/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckMultSubsetRebuildTerm.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckMultSubsetRebuildTerm. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckMultSubsetRebuildTerm
-/

import SystemsLean.HostFrontLiveHostModuleCheckMultSubsetRebuildTermSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_MULT_SUBSET_REBUILD_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-MULT-SUBSET-REBUILD-TERM"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckMultSubsetRebuildTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckMultSubsetRebuildTermSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckMultSubsetRebuildTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckMultSubsetRebuildTermSource.hostFrontLiveHostModuleCheckMultSubsetRebuildTermSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckMultSubsetRebuildTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckMultSubsetRebuildTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckMultSubsetRebuildTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckMultSubsetRebuildTermRel}"
  unless (!slakeTypecheckHostModuleCheckMultSubsetRebuildTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckMultSubsetRebuildTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckMultSubsetRebuildTermSource.main args
