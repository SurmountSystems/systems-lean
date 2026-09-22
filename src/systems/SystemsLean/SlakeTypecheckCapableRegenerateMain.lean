/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableRegenerateMain.
  Short role: named driver for just slake-typecheck-capableregeneratemain.
  Ready is HostFrontLiveCapableRegenerateMain parse plus HostKernel.kernelCheck
  of live CapableRegenerateMain.lean, not := true, not lake build
  SystemsLean.CapableRegenerateMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckCapableRegenerateMain is not a prefix):
  SlakeTypecheckCapableRegenerateMain
  HOST-SLAKE-TYPECHECK-CAPABLE-REGENERATE-MAIN
  SLAKE_TYPECHECK_CAPABLE_REGENERATE_MAIN_V0
  slake-typecheck-capableregeneratemain
  PARSE-LIVE-CAPABLE-REGENERATE-MAIN
  CAPABLE-REGENERATE-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-capableregeneratemain,
  slakeTypecheckCapableRegenerateMainReady,
  kernelCheckLiveCapableRegenerateMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCapableRegenerateMain
  Checkable writer: just slake-typecheck-capableregeneratemain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCapableRegenerateMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_REGENERATE_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-REGENERATE-MAIN"

/-- Named just recipe. Not lake build SystemsLean.CapableRegenerateMain. -/
def justRecipeSlakeTypecheckCapableRegenerateMain : String :=
  "slake-typecheck-capableregeneratemain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableRegenerateMainRel : String :=
  SystemsLean.HostFrontLiveCapableRegenerateMain.liveCapableRegenerateMainRel

/-- Ready names HostFrontLiveCapableRegenerateMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCapableRegenerateMainReady,
    kernelCheckLiveCapableRegenerateMainSource. -/
def slakeTypecheckCapableRegenerateMainReady : Bool :=
  SystemsLean.HostFrontLiveCapableRegenerateMain.hostFrontLiveCapableRegenerateMainReady

/-- Honesty: this command is not lake build of CapableRegenerateMain. -/
def slakeTypecheckCapableRegenerateMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableRegenerateMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableRegenerateMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableRegenerateMain.lean.
    Ready is HostFrontLiveCapableRegenerateMain.hostFrontLiveCapableRegenerateMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCapableRegenerateMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableRegenerateMain} =="
  IO.println s!"  host={hostId} file={liveCapableRegenerateMainRel}"
  unless (!slakeTypecheckCapableRegenerateMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableRegenerateMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableRegenerateMain.main args
