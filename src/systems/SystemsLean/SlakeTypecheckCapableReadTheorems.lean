/-
  SYSTEMS_LEAN_HOST. Slake typechecks live SystemsLean.CapableReadTheorems.
  Short role: named driver for just slake-typecheck-capablereadtheorems.
  Ready is HostFrontLiveCapableReadTheorems parse plus HostKernel.kernelCheck
  of live CapableReadTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.CapableReadTheorems.
  liveRel is CapableReadTheorems.lean.
  Not CapableRead.lean. Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CAPABLE-READ-THEOREMS,
  SLAKE_TYPECHECK_CAPABLE_READ_THEOREMS, slake-typecheck-capablereadtheorems,
  slakeTypecheckCapableReadTheoremsReady,
  kernelCheckLiveCapableReadTheoremsSource,
  PARSE-LIVE-CAPABLE-READ-THEOREMS.
  Module: SystemsLean.SlakeTypecheckCapableReadTheorems
  Checkable writer: just slake-typecheck-capablereadtheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCapableReadTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_READ_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-READ-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.CapableReadTheorems. -/
def justRecipeSlakeTypecheckCapableReadTheorems : String :=
  "slake-typecheck-capablereadtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableReadTheoremsRel : String :=
  SystemsLean.HostFrontLiveCapableReadTheorems.liveCapableReadTheoremsRel

/-- Ready names HostFrontLiveCapableReadTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCapableReadTheoremsReady,
    kernelCheckLiveCapableReadTheoremsSource. -/
def slakeTypecheckCapableReadTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveCapableReadTheorems.hostFrontLiveCapableReadTheoremsReady

/-- Honesty: this command is not lake build of CapableReadTheorems. -/
def slakeTypecheckCapableReadTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableReadTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckCapableReadTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableReadTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableReadTheorems.lean.
    Ready is HostFrontLiveCapableReadTheorems.hostFrontLiveCapableReadTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCapableReadTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableReadTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCapableReadTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveCapableReadTheoremsRel}"
  unless (!slakeTypecheckCapableReadTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableReadTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckCapableReadTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableReadTheorems.main args
