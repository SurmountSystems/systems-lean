/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.OfficialPathTheorems.
  Short role: named driver for just slake-typecheck-officialpaththeorems.
  Ready is HostFrontLiveOfficialPathTheorems parse plus HostKernel.kernelCheck
  of live OfficialPathTheorems.lean, not := true, not lake build
  SystemsLean.OfficialPathTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so HostFrontLiveOfficialPath is not a prefix):
  SlakeTypecheckOfficialPathTheorems
  HOST-SLAKE-TYPECHECK-OFFICIAL-PATH-THEOREMS
  SLAKE_TYPECHECK_OFFICIAL_PATH_THEOREMS_V0
  PARSE-LIVE-OFFICIAL-PATH-THEOREMS
  OFFICIAL-PATH-THEOREMS
  liveRel
  OfficialPathTheorems.lean
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-officialpaththeorems,
  slakeTypecheckOfficialPathTheoremsReady,
  kernelCheckLiveOfficialPathTheoremsSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckOfficialPathTheorems
  Checkable writer: just slake-typecheck-officialpaththeorems
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveOfficialPathTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_OFFICIAL_PATH_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-OFFICIAL-PATH-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.OfficialPathTheorems. -/
def justRecipeSlakeTypecheckOfficialPathTheorems : String :=
  "slake-typecheck-officialpaththeorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOfficialPathTheoremsRel : String :=
  SystemsLean.HostFrontLiveOfficialPathTheorems.liveOfficialPathTheoremsRel

/-- Live basename. Greppable: liveRel. Must be OfficialPathTheorems.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveOfficialPathTheorems.liveRel

/-- Ready names HostFrontLiveOfficialPathTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckOfficialPathTheoremsReady,
    kernelCheckLiveOfficialPathTheoremsSource. -/
def slakeTypecheckOfficialPathTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveOfficialPathTheorems.hostFrontLiveOfficialPathTheoremsReady

/-- Honesty: this command is not lake build of OfficialPathTheorems. -/
def slakeTypecheckOfficialPathTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckOfficialPathTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckOfficialPathTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live OfficialPathTheorems.lean.
    Ready is HostFrontLiveOfficialPathTheorems.hostFrontLiveOfficialPathTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveOfficialPathTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckOfficialPathTheorems} =="
  IO.println s!"  host={hostId} file={liveOfficialPathTheoremsRel} liveRel={liveRel}"
  unless (!slakeTypecheckOfficialPathTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckOfficialPathTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveOfficialPathTheorems.main args
