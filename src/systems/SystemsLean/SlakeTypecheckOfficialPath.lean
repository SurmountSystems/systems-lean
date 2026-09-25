/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.OfficialPath.
  Short role: named driver for just slake-typecheck-officialpath.
  Ready is HostFrontLiveOfficialPath parse plus HostKernel.kernelCheck
  of live OfficialPath.lean, not := true, not lake build
  SystemsLean.OfficialPath.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so OfficialPath drivers are not prefix hits):
  SlakeTypecheckOfficialPath
  HOST-SLAKE-TYPECHECK-OFFICIAL-PATH
  SLAKE_TYPECHECK_OFFICIAL_PATH_V0
  PARSE-LIVE-OFFICIAL-PATH
  OFFICIAL-PATH
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-officialpath,
  slakeTypecheckOfficialPathReady,
  kernelCheckLiveOfficialPathSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckOfficialPath
  Checkable writer: just slake-typecheck-officialpath
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveOfficialPath

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_OFFICIAL_PATH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-OFFICIAL-PATH"

/-- Named just recipe. Not lake build SystemsLean.OfficialPath. -/
def justRecipeSlakeTypecheckOfficialPath : String :=
  "slake-typecheck-officialpath"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOfficialPathRel : String :=
  SystemsLean.HostFrontLiveOfficialPath.liveOfficialPathRel

/-- Ready names HostFrontLiveOfficialPath parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckOfficialPathReady,
    kernelCheckLiveOfficialPathSource. -/
def slakeTypecheckOfficialPathReady : Bool :=
  SystemsLean.HostFrontLiveOfficialPath.hostFrontLiveOfficialPathReady

/-- Honesty: this command is not lake build of OfficialPath. -/
def slakeTypecheckOfficialPathDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckOfficialPathFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckOfficialPathOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live OfficialPath.lean.
    Ready is HostFrontLiveOfficialPath.hostFrontLiveOfficialPathReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveOfficialPath.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckOfficialPath} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveOfficialPath.liveRel}"
  IO.println s!"  host={hostId} file={liveOfficialPathRel}"
  unless (!slakeTypecheckOfficialPathFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckOfficialPathOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveOfficialPath.main args
