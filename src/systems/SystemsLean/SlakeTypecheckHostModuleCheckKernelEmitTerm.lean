/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckKernelEmitTerm.
  Parses the text. Does not import or compile SystemsLean.OccupancyProbe.
  Not lake build SystemsLean.HostModuleCheckKernelEmitTerm. Not the package walk.
  Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckKernelEmitTerm
-/

import SystemsLean.HostFrontLiveHostModuleCheckKernelEmitTermSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_KERNEL_EMIT_TERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-KERNEL-EMIT-TERM"

/-- Live file basename. Not a path. -/
def liveHostModuleCheckKernelEmitTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelEmitTermSource.liveRel

/-- Ready is parse plus kernelCheck, not := true. -/
def slakeTypecheckHostModuleCheckKernelEmitTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelEmitTermSource.hostFrontLiveHostModuleCheckKernelEmitTermSourceReady

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckKernelEmitTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckKernelEmitTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckKernelEmitTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckKernelEmitTermRel}"
  unless (!slakeTypecheckHostModuleCheckKernelEmitTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelEmitTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckKernelEmitTermSource.main args
