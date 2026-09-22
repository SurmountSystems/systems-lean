/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableReadMain.
  Short role: named driver for just slake-typecheck-capablereadmain.
  Ready is HostFrontLiveCapableReadMain parse plus HostKernel.kernelCheck
  of live CapableReadMain.lean, not := true, not lake build
  SystemsLean.CapableReadMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckCapableReadMain is not a prefix):
  SlakeTypecheckCapableReadMain
  HOST-SLAKE-TYPECHECK-CAPABLE-READ-MAIN
  SLAKE_TYPECHECK_CAPABLE_READ_MAIN_V0
  slake-typecheck-capablereadmain
  PARSE-LIVE-CAPABLE-READ-MAIN
  CAPABLE-READ-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-capablereadmain,
  slakeTypecheckCapableReadMainReady,
  kernelCheckLiveCapableReadMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCapableReadMain
  Checkable writer: just slake-typecheck-capablereadmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCapableReadMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_READ_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-READ-MAIN"

/-- Named just recipe. Not lake build SystemsLean.CapableReadMain. -/
def justRecipeSlakeTypecheckCapableReadMain : String :=
  "slake-typecheck-capablereadmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableReadMainRel : String :=
  SystemsLean.HostFrontLiveCapableReadMain.liveCapableReadMainRel

/-- Ready names HostFrontLiveCapableReadMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCapableReadMainReady,
    kernelCheckLiveCapableReadMainSource. -/
def slakeTypecheckCapableReadMainReady : Bool :=
  SystemsLean.HostFrontLiveCapableReadMain.hostFrontLiveCapableReadMainReady

/-- Honesty: this command is not lake build of CapableReadMain. -/
def slakeTypecheckCapableReadMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableReadMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableReadMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableReadMain.lean.
    Ready is HostFrontLiveCapableReadMain.hostFrontLiveCapableReadMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCapableReadMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableReadMain} =="
  IO.println s!"  host={hostId} file={liveCapableReadMainRel}"
  unless (!slakeTypecheckCapableReadMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableReadMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableReadMain.main args
