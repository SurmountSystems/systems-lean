/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostGraphMain.
  Short role: named driver for just slake-typecheck-hostgraphmain.
  Ready is HostFrontLiveHostGraphMain parse plus HostKernel.kernelCheck
  of live HostGraphMain.lean, not := true, not lake build
  SystemsLean.HostGraphMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckHostGraphMain is not a prefix):
  SlakeTypecheckHostGraphMain
  HOST-SLAKE-TYPECHECK-HOST-GRAPH-MAIN
  SLAKE_TYPECHECK_HOST_GRAPH_MAIN_V0
  slake-typecheck-hostgraphmain
  PARSE-LIVE-HOST-GRAPH-MAIN
  HOST-GRAPH-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostgraphmain,
  slakeTypecheckHostGraphMainReady,
  kernelCheckLiveHostGraphMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostGraphMain
  Checkable writer: just slake-typecheck-hostgraphmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostGraphMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_GRAPH_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-GRAPH-MAIN"

/-- Named just recipe. Not lake build SystemsLean.HostGraphMain. -/
def justRecipeSlakeTypecheckHostGraphMain : String :=
  "slake-typecheck-hostgraphmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostGraphMainRel : String :=
  SystemsLean.HostFrontLiveHostGraphMain.liveHostGraphMainRel

/-- Ready names HostFrontLiveHostGraphMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostGraphMainReady,
    kernelCheckLiveHostGraphMainSource. -/
def slakeTypecheckHostGraphMainReady : Bool :=
  SystemsLean.HostFrontLiveHostGraphMain.hostFrontLiveHostGraphMainReady

/-- Honesty: this command is not lake build of HostGraphMain. -/
def slakeTypecheckHostGraphMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostGraphMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostGraphMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostGraphMain.lean.
    Ready is HostFrontLiveHostGraphMain.hostFrontLiveHostGraphMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostGraphMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostGraphMain} =="
  IO.println s!"  host={hostId} file={liveHostGraphMainRel}"
  unless (!slakeTypecheckHostGraphMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostGraphMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostGraphMain.main args
