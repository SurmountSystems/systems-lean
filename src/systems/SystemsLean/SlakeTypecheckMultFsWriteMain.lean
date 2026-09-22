/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.MultFsWriteMain.
  Short role: named driver for just slake-typecheck-multfswritemain.
  Ready is HostFrontLiveMultFsWriteMain parse plus HostKernel.kernelCheck
  of live MultFsWriteMain.lean, not := true, not lake build
  SystemsLean.MultFsWriteMain.
  Not mill 68 remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckMultFsWriteMain is not a prefix):
  SlakeTypecheckMultFsWriteMain
  HOST-SLAKE-TYPECHECK-MULT-FS-WRITE-MAIN
  SLAKE_TYPECHECK_MULT_FS_WRITE_MAIN_V0
  slake-typecheck-multfswritemain
  PARSE-LIVE-MULT-FS-WRITE-MAIN
  MULT-FS-WRITE-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-multfswritemain,
  slakeTypecheckMultFsWriteMainReady,
  kernelCheckLiveMultFsWriteMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckMultFsWriteMain
  Checkable writer: just slake-typecheck-multfswritemain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveMultFsWriteMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_MULT_FS_WRITE_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-MULT-FS-WRITE-MAIN"

/-- Named just recipe. Not lake build SystemsLean.MultFsWriteMain. -/
def justRecipeSlakeTypecheckMultFsWriteMain : String :=
  "slake-typecheck-multfswritemain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultFsWriteMainRel : String :=
  SystemsLean.HostFrontLiveMultFsWriteMain.liveMultFsWriteMainRel

/-- Ready names HostFrontLiveMultFsWriteMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckMultFsWriteMainReady,
    kernelCheckLiveMultFsWriteMainSource. -/
def slakeTypecheckMultFsWriteMainReady : Bool :=
  SystemsLean.HostFrontLiveMultFsWriteMain.hostFrontLiveMultFsWriteMainReady

/-- Honesty: this command is not lake build of MultFsWriteMain. -/
def slakeTypecheckMultFsWriteMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckMultFsWriteMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckMultFsWriteMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live MultFsWriteMain.lean.
    Ready is HostFrontLiveMultFsWriteMain.hostFrontLiveMultFsWriteMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveMultFsWriteMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckMultFsWriteMain} =="
  IO.println s!"  host={hostId} file={liveMultFsWriteMainRel}"
  unless (!slakeTypecheckMultFsWriteMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckMultFsWriteMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveMultFsWriteMain.main args
