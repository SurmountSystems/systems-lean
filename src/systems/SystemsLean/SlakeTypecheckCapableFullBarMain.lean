/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableFullBarMain.
  Short role: named driver for just slake-typecheck-capablefullbarmain.
  Ready is HostFrontLiveCapableFullBarMain parse plus HostKernel.kernelCheck
  of live CapableFullBarMain.lean, not := true, not lake build
  SystemsLean.CapableFullBarMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckCapableFullBarMain is not a prefix):
  SlakeTypecheckCapableFullBarMain
  HOST-SLAKE-TYPECHECK-CAPABLE-FULL-BAR-MAIN
  SLAKE_TYPECHECK_CAPABLE_FULL_BAR_MAIN_V0
  slake-typecheck-capablefullbarmain
  PARSE-LIVE-CAPABLE-FULL-BAR-MAIN
  CAPABLE-FULL-BAR-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-capablefullbarmain,
  slakeTypecheckCapableFullBarMainReady,
  kernelCheckLiveCapableFullBarMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCapableFullBarMain
  Checkable writer: just slake-typecheck-capablefullbarmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCapableFullBarMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_FULL_BAR_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-FULL-BAR-MAIN"

/-- Named just recipe. Not lake build SystemsLean.CapableFullBarMain. -/
def justRecipeSlakeTypecheckCapableFullBarMain : String :=
  "slake-typecheck-capablefullbarmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableFullBarMainRel : String :=
  SystemsLean.HostFrontLiveCapableFullBarMain.liveCapableFullBarMainRel

/-- Ready names HostFrontLiveCapableFullBarMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCapableFullBarMainReady,
    kernelCheckLiveCapableFullBarMainSource. -/
def slakeTypecheckCapableFullBarMainReady : Bool :=
  SystemsLean.HostFrontLiveCapableFullBarMain.hostFrontLiveCapableFullBarMainReady

/-- Honesty: this command is not lake build of CapableFullBarMain. -/
def slakeTypecheckCapableFullBarMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableFullBarMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableFullBarMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableFullBarMain.lean.
    Ready is HostFrontLiveCapableFullBarMain.hostFrontLiveCapableFullBarMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCapableFullBarMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableFullBarMain} =="
  IO.println s!"  host={hostId} file={liveCapableFullBarMainRel}"
  unless (!slakeTypecheckCapableFullBarMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableFullBarMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableFullBarMain.main args
