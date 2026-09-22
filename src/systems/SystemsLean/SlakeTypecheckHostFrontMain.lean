/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostFrontMain.
  Short role: named driver for just slake-typecheck-hostfrontmain.
  Ready is HostFrontLiveHostFrontMain parse plus HostKernel.kernelCheck
  of live HostFrontMain.lean, not := true, not lake build
  SystemsLean.HostFrontMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckHostFrontMain is not a prefix):
  SlakeTypecheckHostFrontMain
  HOST-SLAKE-TYPECHECK-HOST-FRONT-MAIN
  SLAKE_TYPECHECK_HOST_FRONT_MAIN_V0
  slake-typecheck-hostfrontmain
  PARSE-LIVE-HOST-FRONT-MAIN
  HOST-FRONT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostfrontmain,
  slakeTypecheckHostFrontMainReady,
  kernelCheckLiveHostFrontMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostFrontMain
  Checkable writer: just slake-typecheck-hostfrontmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostFrontMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_FRONT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-FRONT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.HostFrontMain. -/
def justRecipeSlakeTypecheckHostFrontMain : String :=
  "slake-typecheck-hostfrontmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostFrontMainRel : String :=
  SystemsLean.HostFrontLiveHostFrontMain.liveHostFrontMainRel

/-- Ready names HostFrontLiveHostFrontMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostFrontMainReady,
    kernelCheckLiveHostFrontMainSource. -/
def slakeTypecheckHostFrontMainReady : Bool :=
  SystemsLean.HostFrontLiveHostFrontMain.hostFrontLiveHostFrontMainReady

/-- Honesty: this command is not lake build of HostFrontMain. -/
def slakeTypecheckHostFrontMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostFrontMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostFrontMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostFrontMain.lean.
    Ready is HostFrontLiveHostFrontMain.hostFrontLiveHostFrontMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostFrontMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostFrontMain} =="
  IO.println s!"  host={hostId} file={liveHostFrontMainRel}"
  unless (!slakeTypecheckHostFrontMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostFrontMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostFrontMain.main args
