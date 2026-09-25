/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.OfficialPathAlternateMain.
  Short role: named driver for just slake-typecheck-officialpathalternatemain.
  Ready is HostFrontLiveOfficialPathAlternateMainParse parse plus HostKernel.kernelCheck
  of live OfficialPathAlternateMain.lean, not a hardcoded true, not lake build
  SystemsLean.OfficialPathAlternateMain.
  liveRel is OfficialPathAlternateMain.lean.
  This wrap is OfficialPathAlternateMain.lean. It is not OfficialPathAlternate.lean.
  Not a package typecheck.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-OFFICIAL-PATH-ALTERNATE-MAIN,
  SLAKE_TYPECHECK_OFFICIAL_PATH_ALTERNATE_MAIN, slake-typecheck-officialpathalternatemain,
  slakeTypecheckOfficialPathAlternateMainReady,
  kernelCheckLiveOfficialPathAlternateMainSource,
  PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN.
  Module: SystemsLean.SlakeTypecheckOfficialPathAlternateMain
  Checkable writer: just slake-typecheck-officialpathalternatemain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveOfficialPathAlternateMainParse

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_OFFICIAL_PATH_ALTERNATE_MAIN"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-OFFICIAL-PATH-ALTERNATE-MAIN"

/-- Named just recipe. Not lake build SystemsLean.OfficialPathAlternateMain. -/
def justRecipeSlakeTypecheckOfficialPathAlternateMain : String :=
  "slake-typecheck-officialpathalternatemain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOfficialPathAlternateMainRel : String :=
  SystemsLean.HostFrontLiveOfficialPathAlternateMainParse.liveOfficialPathAlternateMainRel

/-- Ready names HostFrontLiveOfficialPathAlternateMainParse parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckOfficialPathAlternateMainReady,
    kernelCheckLiveOfficialPathAlternateMainSource. -/
def slakeTypecheckOfficialPathAlternateMainReady : Bool :=
  SystemsLean.HostFrontLiveOfficialPathAlternateMainParse.hostFrontLiveOfficialPathAlternateMainReady

/-- Honesty: this command is not lake build of OfficialPathAlternateMain. -/
def slakeTypecheckOfficialPathAlternateMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckOfficialPathAlternateMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckOfficialPathAlternateMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckOfficialPathAlternateMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live OfficialPathAlternateMain.lean.
    Ready is HostFrontLiveOfficialPathAlternateMainParse.hostFrontLiveOfficialPathAlternateMainReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveOfficialPathAlternateMainParse.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckOfficialPathAlternateMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveOfficialPathAlternateMainParse.liveRel}"
  IO.println s!"  host={hostId} file={liveOfficialPathAlternateMainRel}"
  unless (!slakeTypecheckOfficialPathAlternateMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckOfficialPathAlternateMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckOfficialPathAlternateMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveOfficialPathAlternateMainParse.main args
