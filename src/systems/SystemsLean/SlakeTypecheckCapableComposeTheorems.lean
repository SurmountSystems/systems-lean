/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableComposeTheorems.
  Short role: named driver for just slake-typecheck-capablecomposetheorems.
  Ready is HostFrontLiveCapableComposeTheorems parse plus HostKernel.kernelCheck
  of live CapableComposeTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.CapableComposeTheorems.
  liveRel is CapableComposeTheorems.lean.
  This wrap is CapableComposeTheorems.lean. It is not CapableCompose.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CAPABLE-COMPOSE-THEOREMS,
  SLAKE_TYPECHECK_CAPABLE_COMPOSE_THEOREMS, slake-typecheck-capablecomposetheorems,
  slakeTypecheckCapableComposeTheoremsReady,
  kernelCheckLiveCapableComposeTheoremsSource,
  PARSE-LIVE-CAPABLE-COMPOSE-THEOREMS.
  Module: SystemsLean.SlakeTypecheckCapableComposeTheorems
  Checkable writer: just slake-typecheck-capablecomposetheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCapableComposeTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_COMPOSE_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-COMPOSE-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.CapableComposeTheorems. -/
def justRecipeSlakeTypecheckCapableComposeTheorems : String :=
  "slake-typecheck-capablecomposetheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableComposeTheoremsRel : String :=
  SystemsLean.HostFrontLiveCapableComposeTheorems.liveCapableComposeTheoremsRel

/-- Ready names HostFrontLiveCapableComposeTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCapableComposeTheoremsReady,
    kernelCheckLiveCapableComposeTheoremsSource. -/
def slakeTypecheckCapableComposeTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveCapableComposeTheorems.hostFrontLiveCapableComposeTheoremsReady

/-- Honesty: this command is not lake build of CapableComposeTheorems. -/
def slakeTypecheckCapableComposeTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableComposeTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckCapableComposeTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableComposeTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableComposeTheorems.lean.
    Ready is HostFrontLiveCapableComposeTheorems.hostFrontLiveCapableComposeTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCapableComposeTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableComposeTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCapableComposeTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveCapableComposeTheoremsRel}"
  unless (!slakeTypecheckCapableComposeTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableComposeTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckCapableComposeTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableComposeTheorems.main args
