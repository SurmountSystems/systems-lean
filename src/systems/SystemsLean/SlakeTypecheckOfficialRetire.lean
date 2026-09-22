/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.OfficialRetire.
  Short role: named driver for just slake-typecheck-officialretire.
  Ready is HostFrontLiveOfficialRetire parse plus HostKernel.kernelCheck
  of live OfficialRetire.lean, not := true, not lake build
  SystemsLean.OfficialRetire.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so OfficialRetire drivers are not prefix hits):
  SlakeTypecheckOfficialRetire
  HOST-SLAKE-TYPECHECK-OFFICIAL-RETIRE
  SLAKE_TYPECHECK_OFFICIAL_RETIRE_V0
  PARSE-LIVE-OFFICIAL-RETIRE
  OFFICIAL-RETIRE
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-officialretire,
  slakeTypecheckOfficialRetireReady,
  kernelCheckLiveOfficialRetireSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckOfficialRetire
  Checkable writer: just slake-typecheck-officialretire
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveOfficialRetire

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_OFFICIAL_RETIRE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-OFFICIAL-RETIRE"

/-- Named just recipe. Not lake build SystemsLean.OfficialRetire. -/
def justRecipeSlakeTypecheckOfficialRetire : String :=
  "slake-typecheck-officialretire"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOfficialRetireRel : String :=
  SystemsLean.HostFrontLiveOfficialRetire.liveOfficialRetireRel

/-- Ready names HostFrontLiveOfficialRetire parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckOfficialRetireReady,
    kernelCheckLiveOfficialRetireSource. -/
def slakeTypecheckOfficialRetireReady : Bool :=
  SystemsLean.HostFrontLiveOfficialRetire.hostFrontLiveOfficialRetireReady

/-- Honesty: this command is not lake build of OfficialRetire. -/
def slakeTypecheckOfficialRetireDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckOfficialRetireFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckOfficialRetireOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live OfficialRetire.lean.
    Ready is HostFrontLiveOfficialRetire.hostFrontLiveOfficialRetireReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveOfficialRetire.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckOfficialRetire} =="
  IO.println s!"  host={hostId} file={liveOfficialRetireRel}"
  unless (!slakeTypecheckOfficialRetireFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckOfficialRetireOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveOfficialRetire.main args
