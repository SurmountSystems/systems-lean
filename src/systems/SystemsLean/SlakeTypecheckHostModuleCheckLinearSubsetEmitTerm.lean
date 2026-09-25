/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckLinearSubsetEmitTerm.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckLinearSubsetEmitTerm. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckLinearSubsetEmitTerm
-/

import SystemsLean.HostFrontLiveHostModuleCheckLinearSubsetEmitTermSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_LINEAR_SUBSET_EMIT_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-LINEAR-SUBSET-EMIT-TERM"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckLinearSubsetEmitTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckLinearSubsetEmitTermSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckLinearSubsetEmitTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckLinearSubsetEmitTermSource.hostFrontLiveHostModuleCheckLinearSubsetEmitTermSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckLinearSubsetEmitTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckLinearSubsetEmitTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckLinearSubsetEmitTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckLinearSubsetEmitTermRel}"
  unless (!slakeTypecheckHostModuleCheckLinearSubsetEmitTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLinearSubsetEmitTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckLinearSubsetEmitTermSource.main args
