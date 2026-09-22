/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableFullBarTheorems.
  Short role: named driver for the closed CapableFullBarTheorems check.
  Ready is HostFrontLiveCapableFullBarTheorems parse plus HostKernel.kernelCheck
  of live CapableFullBarTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.CapableFullBarTheorems.
  liveRel is CapableFullBarTheorems.lean.
  Not CapableFullBar.lean. Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Not wired into the root just index.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-CAPABLE-FULL-BAR-THEOREMS,
  SLAKE_TYPECHECK_CAPABLE_FULL_BAR_THEOREMS,
  slake-typecheck-capablefullbartheorems,
  slakeTypecheckCapableFullBarTheoremsReady,
  kernelCheckLiveCapableFullBarTheoremsSource,
  PARSE-LIVE-CAPABLE-FULL-BAR-THEOREMS.
  Module: SystemsLean.SlakeTypecheckCapableFullBarTheorems
  Checkable writer: lean --run on this file (no mill; no lake).
-/

import SystemsLean.HostFrontLiveCapableFullBarTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_FULL_BAR_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-FULL-BAR-THEOREMS"

/-- Named recipe id. Not added to the root just index.
    Not lake build SystemsLean.CapableFullBarTheorems. -/
def justRecipeSlakeTypecheckCapableFullBarTheorems : String :=
  "slake-typecheck-capablefullbartheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableFullBarTheoremsRel : String :=
  SystemsLean.HostFrontLiveCapableFullBarTheorems.liveCapableFullBarTheoremsRel

/-- Ready names HostFrontLiveCapableFullBarTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCapableFullBarTheoremsReady,
    kernelCheckLiveCapableFullBarTheoremsSource. -/
def slakeTypecheckCapableFullBarTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveCapableFullBarTheorems.hostFrontLiveCapableFullBarTheoremsReady

/-- Honesty: this command is not lake build of CapableFullBarTheorems. -/
def slakeTypecheckCapableFullBarTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableFullBarTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckCapableFullBarTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableFullBarTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableFullBarTheorems.lean.
    Ready is HostFrontLiveCapableFullBarTheorems.hostFrontLiveCapableFullBarTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCapableFullBarTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableFullBarTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCapableFullBarTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveCapableFullBarTheoremsRel}"
  unless (!slakeTypecheckCapableFullBarTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableFullBarTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckCapableFullBarTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableFullBarTheorems.main args
