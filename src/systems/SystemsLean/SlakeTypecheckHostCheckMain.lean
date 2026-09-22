/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostCheckMain.
  Short role: named driver for just slake-typecheck-hostcheckmain.
  Ready is HostFrontLiveHostCheckMain parse plus HostKernel.kernelCheck
  of live HostCheckMain.lean, not := true, not lake build
  SystemsLean.HostCheckMain.
  Not mill 33 remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckHostCheckMain is not a prefix):
  SlakeTypecheckHostCheckMain
  HOST-SLAKE-TYPECHECK-HOST-CHECK-MAIN
  SLAKE_TYPECHECK_HOST_CHECK_MAIN_V0
  slake-typecheck-hostcheckmain
  PARSE-LIVE-HOST-CHECK-MAIN
  HOST-CHECK-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostcheckmain,
  slakeTypecheckHostCheckMainReady,
  kernelCheckLiveHostCheckMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostCheckMain
  Checkable writer: just slake-typecheck-hostcheckmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostCheckMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_CHECK_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-CHECK-MAIN"

/-- Named just recipe. Not lake build SystemsLean.HostCheckMain. -/
def justRecipeSlakeTypecheckHostCheckMain : String :=
  "slake-typecheck-hostcheckmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostCheckMainRel : String :=
  SystemsLean.HostFrontLiveHostCheckMain.liveHostCheckMainRel

/-- Ready names HostFrontLiveHostCheckMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostCheckMainReady,
    kernelCheckLiveHostCheckMainSource. -/
def slakeTypecheckHostCheckMainReady : Bool :=
  SystemsLean.HostFrontLiveHostCheckMain.hostFrontLiveHostCheckMainReady

/-- Honesty: this command is not lake build of HostCheckMain. -/
def slakeTypecheckHostCheckMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostCheckMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostCheckMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostCheckMain.lean.
    Ready is HostFrontLiveHostCheckMain.hostFrontLiveHostCheckMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostCheckMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostCheckMain} =="
  IO.println s!"  host={hostId} file={liveHostCheckMainRel}"
  unless (!slakeTypecheckHostCheckMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostCheckMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostCheckMain.main args
