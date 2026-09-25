/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.MultFsWrite.
  Short role: named driver for just slake-typecheck-multfswrite.
  Ready is HostFrontLiveMultFsWrite parse plus HostKernel.kernelCheck
  of live MultFsWrite.lean, not := true, not lake build
  SystemsLean.MultFsWrite.
  Not mill 68 remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so MultFsWrite drivers are not prefix hits):
  SlakeTypecheckMultFsWrite
  HOST-SLAKE-TYPECHECK-MULT-FS-WRITE
  SLAKE_TYPECHECK_MULT_FS_WRITE_V0
  PARSE-LIVE-MULT-FS-WRITE
  MULT-FS-WRITE
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-multfswrite,
  slakeTypecheckMultFsWriteReady,
  kernelCheckLiveMultFsWriteSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckMultFsWrite
  Checkable writer: just slake-typecheck-multfswrite
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveMultFsWrite

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_MULT_FS_WRITE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-MULT-FS-WRITE"

/-- Named just recipe. Not lake build SystemsLean.MultFsWrite. -/
def justRecipeSlakeTypecheckMultFsWrite : String :=
  "slake-typecheck-multfswrite"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultFsWriteRel : String :=
  SystemsLean.HostFrontLiveMultFsWrite.liveMultFsWriteRel

/-- Ready names HostFrontLiveMultFsWrite parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckMultFsWriteReady,
    kernelCheckLiveMultFsWriteSource. -/
def slakeTypecheckMultFsWriteReady : Bool :=
  SystemsLean.HostFrontLiveMultFsWrite.hostFrontLiveMultFsWriteReady

/-- Honesty: this command is not lake build of MultFsWrite. -/
def slakeTypecheckMultFsWriteDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckMultFsWriteFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckMultFsWriteOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live MultFsWrite.lean.
    Ready is HostFrontLiveMultFsWrite.hostFrontLiveMultFsWriteReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveMultFsWrite.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckMultFsWrite} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveMultFsWrite.liveRel}"
  IO.println s!"  host={hostId} file={liveMultFsWriteRel}"
  unless (!slakeTypecheckMultFsWriteFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckMultFsWriteOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveMultFsWrite.main args
