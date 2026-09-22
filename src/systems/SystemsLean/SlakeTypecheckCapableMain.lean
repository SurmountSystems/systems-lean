/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableMain.
  Short role: named driver for just slake-typecheck-capablemain.
  Ready is HostFrontLiveCapableMain parse plus HostKernel.kernelCheck
  of live CapableMain.lean, not := true, not lake build
  SystemsLean.CapableMain.
  Not mill 5 remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckCapableMain is not a prefix):
  SlakeTypecheckCapableMain
  HOST-SLAKE-TYPECHECK-CAPABLE-MAIN
  SLAKE_TYPECHECK_CAPABLE_MAIN_V0
  slake-typecheck-capablemain
  PARSE-LIVE-CAPABLE-MAIN
  CAPABLE-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-capablemain,
  slakeTypecheckCapableMainReady,
  kernelCheckLiveCapableMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCapableMain
  Checkable writer: just slake-typecheck-capablemain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCapableMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-MAIN"

/-- Named just recipe. Not lake build SystemsLean.CapableMain. -/
def justRecipeSlakeTypecheckCapableMain : String :=
  "slake-typecheck-capablemain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableMainRel : String :=
  SystemsLean.HostFrontLiveCapableMain.liveCapableMainRel

/-- Ready names HostFrontLiveCapableMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCapableMainReady,
    kernelCheckLiveCapableMainSource. -/
def slakeTypecheckCapableMainReady : Bool :=
  SystemsLean.HostFrontLiveCapableMain.hostFrontLiveCapableMainReady

/-- Honesty: this command is not lake build of CapableMain. -/
def slakeTypecheckCapableMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableMain.lean.
    Ready is HostFrontLiveCapableMain.hostFrontLiveCapableMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCapableMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableMain} =="
  IO.println s!"  host={hostId} file={liveCapableMainRel}"
  unless (!slakeTypecheckCapableMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableMain.main args
