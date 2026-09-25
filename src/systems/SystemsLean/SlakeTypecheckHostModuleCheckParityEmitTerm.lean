/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckParityEmitTerm.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckParityEmitTerm. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckParityEmitTerm
-/

import SystemsLean.HostFrontLiveHostModuleCheckParityEmitTermSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_PARITY_EMIT_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-PARITY-EMIT-TERM"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckParityEmitTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckParityEmitTermSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckParityEmitTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckParityEmitTermSource.hostFrontLiveHostModuleCheckParityEmitTermSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckParityEmitTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckParityEmitTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckParityEmitTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckParityEmitTermRel}"
  unless (!slakeTypecheckHostModuleCheckParityEmitTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckParityEmitTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckParityEmitTermSource.main args
