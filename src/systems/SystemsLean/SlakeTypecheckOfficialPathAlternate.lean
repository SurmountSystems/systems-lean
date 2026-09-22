/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.OfficialPathAlternate.
  Short role: named driver for just slake-typecheck-officialpathalternate.
  Ready is HostFrontLiveOfficialPathAlternate parse plus HostKernel.kernelCheck
  of live OfficialPathAlternate.lean, not a hardcoded true, not lake build
  SystemsLean.OfficialPathAlternate.
  liveRel is OfficialPathAlternate.lean.
  This wrap is OfficialPathAlternate.lean. It is not OfficialPathAlternateTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-OFFICIAL-PATH-ALTERNATE,
  SLAKE_TYPECHECK_OFFICIAL_PATH_ALTERNATE, slake-typecheck-officialpathalternate,
  slakeTypecheckOfficialPathAlternateReady,
  kernelCheckLiveOfficialPathAlternateSource,
  PARSE-LIVE-OFFICIAL-PATH-ALTERNATE.
  Module: SystemsLean.SlakeTypecheckOfficialPathAlternate
  Checkable writer: just slake-typecheck-officialpathalternate
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveOfficialPathAlternate

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_OFFICIAL_PATH_ALTERNATE"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-OFFICIAL-PATH-ALTERNATE"

/-- Named just recipe. Not lake build SystemsLean.OfficialPathAlternate. -/
def justRecipeSlakeTypecheckOfficialPathAlternate : String :=
  "slake-typecheck-officialpathalternate"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOfficialPathAlternateRel : String :=
  SystemsLean.HostFrontLiveOfficialPathAlternate.liveOfficialPathAlternateRel

/-- Ready names HostFrontLiveOfficialPathAlternate parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckOfficialPathAlternateReady,
    kernelCheckLiveOfficialPathAlternateSource. -/
def slakeTypecheckOfficialPathAlternateReady : Bool :=
  SystemsLean.HostFrontLiveOfficialPathAlternate.hostFrontLiveOfficialPathAlternateReady

/-- Honesty: this command is not lake build of OfficialPathAlternate. -/
def slakeTypecheckOfficialPathAlternateDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckOfficialPathAlternateFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckOfficialPathAlternateFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckOfficialPathAlternateOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live OfficialPathAlternate.lean.
    Ready is HostFrontLiveOfficialPathAlternate.hostFrontLiveOfficialPathAlternateReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveOfficialPathAlternate.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckOfficialPathAlternate} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveOfficialPathAlternate.liveRel}"
  IO.println s!"  host={hostId} file={liveOfficialPathAlternateRel}"
  unless (!slakeTypecheckOfficialPathAlternateFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckOfficialPathAlternateFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckOfficialPathAlternateOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveOfficialPathAlternate.main args
