/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.OfficialRetireMain.
  Short role: named driver for just slake-typecheck-officialretiremain.
  Ready is HostFrontLiveHostOfficialRetireMain parse plus HostKernel.kernelCheck
  of live OfficialRetireMain.lean, not := true, not lake build
  SystemsLean.OfficialRetireMain.
  Not mill 17 remill (just seventeenth-host-tool / inventory row 21).
  Not occupancy name 50. Not FullHost.
  This wrap parses OfficialRetireMain.lean only. Do not wrap OfficialRetire.lean.
  Do not steal HostFrontLiveOfficialRetireMain (library companion).
  Do not wrap OfficialPathMain. Do not wrap OfficialPath.lean.
  Do not wrap Linear.lean. Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckOfficialRetireMain is not a prefix):
  SlakeTypecheckOfficialRetireMain
  HOST-SLAKE-TYPECHECK-OFFICIAL-RETIRE-MAIN
  SLAKE_TYPECHECK_OFFICIAL_RETIRE_MAIN_V0
  slake-typecheck-officialretiremain
  PARSE-LIVE-OFFICIAL-RETIRE-MAIN
  OFFICIAL-RETIRE-MAIN
  HOST-OFFICIAL-RETIRE-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-officialretiremain,
  slakeTypecheckOfficialRetireMainReady,
  kernelCheckLiveOfficialRetireMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckOfficialRetireMain
  Checkable writer: just slake-typecheck-officialretiremain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostOfficialRetireMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_OFFICIAL_RETIRE_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-OFFICIAL-RETIRE-MAIN"

/-- Named just recipe. Not lake build SystemsLean.OfficialRetireMain. -/
def justRecipeSlakeTypecheckOfficialRetireMain : String :=
  "slake-typecheck-officialretiremain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOfficialRetireMainRel : String :=
  SystemsLean.HostFrontLiveHostOfficialRetireMain.liveOfficialRetireMainRel

/-- Ready names HostFrontLiveHostOfficialRetireMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckOfficialRetireMainReady,
    kernelCheckLiveOfficialRetireMainSource. -/
def slakeTypecheckOfficialRetireMainReady : Bool :=
  SystemsLean.HostFrontLiveHostOfficialRetireMain.hostFrontLiveOfficialRetireMainReady

/-- Honesty: this command is not lake build of OfficialRetireMain. -/
def slakeTypecheckOfficialRetireMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckOfficialRetireMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckOfficialRetireMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live OfficialRetireMain.lean.
    Ready is HostFrontLiveHostOfficialRetireMain.hostFrontLiveOfficialRetireMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostOfficialRetireMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckOfficialRetireMain} =="
  IO.println s!"  host={hostId} file={liveOfficialRetireMainRel}"
  unless (!slakeTypecheckOfficialRetireMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckOfficialRetireMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostOfficialRetireMain.main args
