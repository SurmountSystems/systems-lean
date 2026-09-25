/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckLinearSubsetRebuildTerm.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckLinearSubsetRebuildTerm. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckLinearSubsetRebuildTerm
-/

import SystemsLean.HostFrontLiveHostModuleCheckLinearSubsetRebuildTermSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_LINEAR_SUBSET_REBUILD_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-LINEAR-SUBSET-REBUILD-TERM"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckLinearSubsetRebuildTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckLinearSubsetRebuildTermSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckLinearSubsetRebuildTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckLinearSubsetRebuildTermSource.hostFrontLiveHostModuleCheckLinearSubsetRebuildTermSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckLinearSubsetRebuildTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckLinearSubsetRebuildTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckLinearSubsetRebuildTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckLinearSubsetRebuildTermRel}"
  unless (!slakeTypecheckHostModuleCheckLinearSubsetRebuildTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLinearSubsetRebuildTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckLinearSubsetRebuildTermSource.main args
