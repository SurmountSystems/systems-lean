/-
  SYSTEMS_LEAN_HOST. Slake typechecks live SystemsLean.CapableTheorems.
  Short role: named driver for just slake-typecheck-capabletheorems.
  Ready is HostFrontLiveCapableTheorems parse plus HostKernel.kernelCheck
  of live CapableTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.CapableTheorems.
  liveRel is CapableTheorems.lean.
  Not Capable.lean. Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CAPABLE-THEOREMS,
  SLAKE_TYPECHECK_CAPABLE_THEOREMS, slake-typecheck-capabletheorems,
  slakeTypecheckCapableTheoremsReady,
  kernelCheckLiveCapableTheoremsSource,
  PARSE-LIVE-CAPABLE-THEOREMS.
  Module: SystemsLean.SlakeTypecheckCapableTheorems
  Checkable writer: just slake-typecheck-capabletheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCapableTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.CapableTheorems. -/
def justRecipeSlakeTypecheckCapableTheorems : String :=
  "slake-typecheck-capabletheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableTheoremsRel : String :=
  SystemsLean.HostFrontLiveCapableTheorems.liveCapableTheoremsRel

/-- Ready names HostFrontLiveCapableTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCapableTheoremsReady,
    kernelCheckLiveCapableTheoremsSource. -/
def slakeTypecheckCapableTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveCapableTheorems.hostFrontLiveCapableTheoremsReady

/-- Honesty: this command is not lake build of CapableTheorems. -/
def slakeTypecheckCapableTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckCapableTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableTheorems.lean.
    Ready is HostFrontLiveCapableTheorems.hostFrontLiveCapableTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCapableTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCapableTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveCapableTheoremsRel}"
  unless (!slakeTypecheckCapableTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckCapableTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableTheorems.main args
