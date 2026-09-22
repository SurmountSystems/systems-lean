/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostPackageWriteMain.
  Short role: named driver for just slake-typecheck-hostpackagewritemain.
  Ready is HostFrontLiveHostPackageWriteMain parse plus HostKernel.kernelCheck
  of live HostPackageWriteMain.lean, not := true, not lake build
  SystemsLean.HostPackageWriteMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckHostPackageWriteMain is not a prefix):
  SlakeTypecheckHostPackageWriteMain
  HOST-SLAKE-TYPECHECK-HOST-PACKAGE-WRITE-MAIN
  SLAKE_TYPECHECK_HOST_PACKAGE_WRITE_MAIN_V0
  slake-typecheck-hostpackagewritemain
  PARSE-LIVE-HOST-PACKAGE-WRITE-MAIN
  HOST-PACKAGE-WRITE-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostpackagewritemain,
  slakeTypecheckHostPackageWriteMainReady,
  kernelCheckLiveHostPackageWriteMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostPackageWriteMain
  Checkable writer: just slake-typecheck-hostpackagewritemain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostPackageWriteMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_PACKAGE_WRITE_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-PACKAGE-WRITE-MAIN"

/-- Named just recipe. Not lake build SystemsLean.HostPackageWriteMain. -/
def justRecipeSlakeTypecheckHostPackageWriteMain : String :=
  "slake-typecheck-hostpackagewritemain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostPackageWriteMainRel : String :=
  SystemsLean.HostFrontLiveHostPackageWriteMain.liveHostPackageWriteMainRel

/-- Ready names HostFrontLiveHostPackageWriteMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostPackageWriteMainReady,
    kernelCheckLiveHostPackageWriteMainSource. -/
def slakeTypecheckHostPackageWriteMainReady : Bool :=
  SystemsLean.HostFrontLiveHostPackageWriteMain.hostFrontLiveHostPackageWriteMainReady

/-- Honesty: this command is not lake build of HostPackageWriteMain. -/
def slakeTypecheckHostPackageWriteMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostPackageWriteMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostPackageWriteMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostPackageWriteMain.lean.
    Ready is HostFrontLiveHostPackageWriteMain.hostFrontLiveHostPackageWriteMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostPackageWriteMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostPackageWriteMain} =="
  IO.println s!"  host={hostId} file={liveHostPackageWriteMainRel}"
  unless (!slakeTypecheckHostPackageWriteMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostPackageWriteMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostPackageWriteMain.main args
