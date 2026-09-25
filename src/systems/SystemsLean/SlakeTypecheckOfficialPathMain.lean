/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.OfficialPathMain.
  Short role: named driver for just slake-typecheck-officialpathmain.
  Ready is HostFrontLiveHostOfficialPathMain parse plus HostKernel.kernelCheck
  of live OfficialPathMain.lean, not := true, not lake build
  SystemsLean.OfficialPathMain.
  Not mill 12 remill (just twelfth-host-tool). Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckOfficialPath is not a prefix):
  SlakeTypecheckOfficialPathMain
  HOST-SLAKE-TYPECHECK-OFFICIAL-PATH-MAIN
  SLAKE_TYPECHECK_OFFICIAL_PATH_MAIN_V0
  slake-typecheck-officialpathmain
  PARSE-LIVE-HOST-OFFICIAL-PATH-MAIN
  OFFICIAL-PATH-MAIN
  HOST-OFFICIAL-PATH-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-officialpathmain,
  slakeTypecheckOfficialPathMainReady,
  kernelCheckLiveHostOfficialPathMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckOfficialPathMain
  Checkable writer: just slake-typecheck-officialpathmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostOfficialPathMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_OFFICIAL_PATH_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-OFFICIAL-PATH-MAIN"

/-- Named just recipe. Not lake build SystemsLean.OfficialPathMain. -/
def justRecipeSlakeTypecheckOfficialPathMain : String :=
  "slake-typecheck-officialpathmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostOfficialPathMainRel : String :=
  SystemsLean.HostFrontLiveHostOfficialPathMain.liveHostOfficialPathMainRel

/-- Ready names HostFrontLiveHostOfficialPathMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckOfficialPathMainReady,
    kernelCheckLiveHostOfficialPathMainSource. -/
def slakeTypecheckOfficialPathMainReady : Bool :=
  SystemsLean.HostFrontLiveHostOfficialPathMain.hostFrontLiveHostOfficialPathMainReady

/-- Honesty: this command is not lake build of OfficialPathMain. -/
def slakeTypecheckOfficialPathMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckOfficialPathMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckOfficialPathMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live OfficialPathMain.lean.
    Ready is HostFrontLiveHostOfficialPathMain.hostFrontLiveHostOfficialPathMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostOfficialPathMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckOfficialPathMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostOfficialPathMain.liveRel}"
  IO.println s!"  host={hostId} file={liveHostOfficialPathMainRel}"
  unless (!slakeTypecheckOfficialPathMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckOfficialPathMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostOfficialPathMain.main args
