/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.OfficialPathAlternateTheorems.
  Short role: named driver for just slake-typecheck-officialpathalternatetheorems.
  Ready is HostFrontLiveOfficialPathAlternateTheorems parse plus
  HostKernel.kernelCheck of live OfficialPathAlternateTheorems.lean,
  not a hardcoded true, not lake build
  SystemsLean.OfficialPathAlternateTheorems.
  liveRel is OfficialPathAlternateTheorems.lean.
  This wrap is OfficialPathAlternateTheorems.lean.
  It is not OfficialPathAlternate.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-OFFICIAL-PATH-ALTERNATE-THEOREMS,
  SLAKE_TYPECHECK_OFFICIAL_PATH_ALTERNATE_THEOREMS,
  slake-typecheck-officialpathalternatetheorems,
  slakeTypecheckOfficialPathAlternateTheoremsReady,
  kernelCheckLiveOfficialPathAlternateTheoremsSource,
  PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS.
  Module: SystemsLean.SlakeTypecheckOfficialPathAlternateTheorems
  Checkable writer: just slake-typecheck-officialpathalternatetheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveOfficialPathAlternateTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_OFFICIAL_PATH_ALTERNATE_THEOREMS"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-OFFICIAL-PATH-ALTERNATE-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.OfficialPathAlternateTheorems. -/
def justRecipeSlakeTypecheckOfficialPathAlternateTheorems : String :=
  "slake-typecheck-officialpathalternatetheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOfficialPathAlternateTheoremsRel : String :=
  SystemsLean.HostFrontLiveOfficialPathAlternateTheorems.liveOfficialPathAlternateTheoremsRel

/-- Ready names HostFrontLiveOfficialPathAlternateTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckOfficialPathAlternateTheoremsReady,
    kernelCheckLiveOfficialPathAlternateTheoremsSource. -/
def slakeTypecheckOfficialPathAlternateTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveOfficialPathAlternateTheorems.hostFrontLiveOfficialPathAlternateTheoremsReady

/-- Honesty: this command is not lake build of OfficialPathAlternateTheorems. -/
def slakeTypecheckOfficialPathAlternateTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckOfficialPathAlternateTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckOfficialPathAlternateTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckOfficialPathAlternateTheoremsOwnsPackageTypecheck : Bool :=
  false

/-- lean --run entry: parse plus kernelCheck live OfficialPathAlternateTheorems.lean.
    Ready is
    HostFrontLiveOfficialPathAlternateTheorems.hostFrontLiveOfficialPathAlternateTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveOfficialPathAlternateTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckOfficialPathAlternateTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveOfficialPathAlternateTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveOfficialPathAlternateTheoremsRel}"
  unless (!slakeTypecheckOfficialPathAlternateTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckOfficialPathAlternateTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckOfficialPathAlternateTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveOfficialPathAlternateTheorems.main args
