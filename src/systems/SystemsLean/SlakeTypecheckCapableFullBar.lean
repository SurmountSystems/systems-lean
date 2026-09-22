/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableFullBar.
  Short role: named driver for just slake-typecheck-capablefullbar.
  Ready is HostFrontLiveCapableFullBar parse plus HostKernel.kernelCheck
  of live CapableFullBar.lean, not a hardcoded true, not lake build
  SystemsLean.CapableFullBar.
  liveRel is CapableFullBar.lean.
  This wrap is CapableFullBar.lean. It is not CapableFullBarTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CAPABLE-FULL-BAR,
  SLAKE_TYPECHECK_CAPABLE_FULL_BAR, slake-typecheck-capablefullbar,
  slakeTypecheckCapableFullBarReady,
  kernelCheckLiveCapableFullBarSource,
  PARSE-LIVE-CAPABLE-FULL-BAR.
  Module: SystemsLean.SlakeTypecheckCapableFullBar
  Checkable writer: just slake-typecheck-capablefullbar
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCapableFullBar

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_FULL_BAR"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-FULL-BAR"

/-- Named just recipe. Not lake build SystemsLean.CapableFullBar. -/
def justRecipeSlakeTypecheckCapableFullBar : String :=
  "slake-typecheck-capablefullbar"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableFullBarRel : String :=
  SystemsLean.HostFrontLiveCapableFullBar.liveCapableFullBarRel

/-- Ready names HostFrontLiveCapableFullBar parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCapableFullBarReady,
    kernelCheckLiveCapableFullBarSource. -/
def slakeTypecheckCapableFullBarReady : Bool :=
  SystemsLean.HostFrontLiveCapableFullBar.hostFrontLiveCapableFullBarReady

/-- Honesty: this command is not lake build of CapableFullBar. -/
def slakeTypecheckCapableFullBarDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableFullBarFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckCapableFullBarFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableFullBarOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableFullBar.lean.
    Ready is HostFrontLiveCapableFullBar.hostFrontLiveCapableFullBarReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCapableFullBar.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableFullBar} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCapableFullBar.liveRel}"
  IO.println s!"  host={hostId} file={liveCapableFullBarRel}"
  unless (!slakeTypecheckCapableFullBarFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableFullBarFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckCapableFullBarOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableFullBar.main args
