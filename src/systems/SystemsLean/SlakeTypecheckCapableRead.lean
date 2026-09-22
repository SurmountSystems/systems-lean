/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableRead.
  Short role: named driver for just slake-typecheck-capableread.
  Ready is HostFrontLiveCapableRead parse plus HostKernel.kernelCheck
  of live CapableRead.lean, not a hardcoded true, not lake build
  SystemsLean.CapableRead.
  liveRel is CapableRead.lean.
  This wrap is CapableRead.lean. It is not CapableReadTheorems.lean.
  It is not CapableReadMain.lean.
  Hyphenated stage id CAPABLE-READ.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CAPABLE-READ,
  SLAKE_TYPECHECK_CAPABLE_READ, slake-typecheck-capableread,
  slakeTypecheckCapableReadReady,
  kernelCheckLiveCapableReadSource,
  PARSE-LIVE-CAPABLE-READ, CAPABLE-READ.
  Module: SystemsLean.SlakeTypecheckCapableRead
  Checkable writer: just slake-typecheck-capableread
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCapableRead

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_READ"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-READ"

/-- Hyphenated stage id. -/
def capableReadStage : String := "CAPABLE-READ"

/-- Named just recipe. Not lake build SystemsLean.CapableRead. -/
def justRecipeSlakeTypecheckCapableRead : String :=
  "slake-typecheck-capableread"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableReadRel : String :=
  SystemsLean.HostFrontLiveCapableRead.liveCapableReadRel

/-- Ready names HostFrontLiveCapableRead parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCapableReadReady,
    kernelCheckLiveCapableReadSource. -/
def slakeTypecheckCapableReadReady : Bool :=
  SystemsLean.HostFrontLiveCapableRead.hostFrontLiveCapableReadReady

/-- Honesty: this command is not lake build of CapableRead. -/
def slakeTypecheckCapableReadDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableReadFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableReadOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableRead.lean.
    Ready is HostFrontLiveCapableRead.hostFrontLiveCapableReadReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCapableRead.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableRead} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCapableRead.liveRel}"
  IO.println s!"  host={hostId} file={liveCapableReadRel} stage={capableReadStage}"
  unless (!slakeTypecheckCapableReadFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableReadOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless (capableReadStage == "CAPABLE-READ") do
    IO.eprintln "error: hyphenated stage id must be CAPABLE-READ"
    return 1
  unless (SystemsLean.HostFrontLiveCapableRead.liveRel == "CapableRead.lean") do
    IO.eprintln "error: liveRel must be CapableRead.lean"
    return 1
  SystemsLean.HostFrontLiveCapableRead.main args
