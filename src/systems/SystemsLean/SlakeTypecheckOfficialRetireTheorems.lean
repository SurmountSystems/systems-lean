/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.OfficialRetireTheorems.
  Short role: named driver for just slake-typecheck-officialretiretheorems.
  Ready is HostFrontLiveOfficialRetireTheorems parse plus HostKernel.kernelCheck
  of live OfficialRetireTheorems.lean, not := true, not lake build
  SystemsLean.OfficialRetireTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  SlakeTypecheckOfficialRetireTheorems
  HOST-SLAKE-TYPECHECK-OFFICIAL-RETIRE-THEOREMS
  SLAKE_TYPECHECK_OFFICIAL_RETIRE_THEOREMS_V0
  slake-typecheck-officialretiretheorems
  Greppable: SYSTEMS_LEAN_HOST,
  slakeTypecheckOfficialRetireTheoremsReady,
  kernelCheckLiveOfficialRetireTheoremsSource,
  PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckOfficialRetireTheorems
  Checkable writer: just slake-typecheck-officialretiretheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveOfficialRetireTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_OFFICIAL_RETIRE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-OFFICIAL-RETIRE-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.OfficialRetireTheorems. -/
def justRecipeSlakeTypecheckOfficialRetireTheorems : String :=
  "slake-typecheck-officialretiretheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOfficialRetireTheoremsRel : String :=
  SystemsLean.HostFrontLiveOfficialRetireTheorems.liveOfficialRetireTheoremsRel

/-- Ready names HostFrontLiveOfficialRetireTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckOfficialRetireTheoremsReady,
    kernelCheckLiveOfficialRetireTheoremsSource. -/
def slakeTypecheckOfficialRetireTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveOfficialRetireTheorems.hostFrontLiveOfficialRetireTheoremsReady

/-- Honesty: this command is not lake build of OfficialRetireTheorems. -/
def slakeTypecheckOfficialRetireTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckOfficialRetireTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckOfficialRetireTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live OfficialRetireTheorems.lean.
    Ready is HostFrontLiveOfficialRetireTheorems.hostFrontLiveOfficialRetireTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveOfficialRetireTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckOfficialRetireTheorems} =="
  IO.println s!"  host={hostId} file={liveOfficialRetireTheoremsRel}"
  unless (!slakeTypecheckOfficialRetireTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckOfficialRetireTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveOfficialRetireTheorems.main args
