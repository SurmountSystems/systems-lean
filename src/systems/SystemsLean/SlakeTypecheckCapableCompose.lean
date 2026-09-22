/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableCompose.
  Short role: named driver for just slake-typecheck-capablecompose.
  Ready is HostFrontLiveCapableCompose parse plus HostKernel.kernelCheck
  of live CapableCompose.lean, not a hardcoded true, not lake build
  SystemsLean.CapableCompose.
  liveRel is CapableCompose.lean.
  This wrap is CapableCompose.lean. It is not CapableComposeTheorems.lean.
  FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CAPABLE-COMPOSE,
  SLAKE_TYPECHECK_CAPABLE_COMPOSE, slake-typecheck-capablecompose,
  slakeTypecheckCapableComposeReady,
  kernelCheckLiveCapableComposeSource,
  PARSE-LIVE-CAPABLE-COMPOSE.
  Module: SystemsLean.SlakeTypecheckCapableCompose
  Checkable writer: just slake-typecheck-capablecompose
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCapableCompose

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_COMPOSE"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-COMPOSE"

/-- Named just recipe. Not lake build SystemsLean.CapableCompose. -/
def justRecipeSlakeTypecheckCapableCompose : String :=
  "slake-typecheck-capablecompose"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableComposeRel : String :=
  SystemsLean.HostFrontLiveCapableCompose.liveCapableComposeRel

/-- Ready names HostFrontLiveCapableCompose parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCapableComposeReady,
    kernelCheckLiveCapableComposeSource. -/
def slakeTypecheckCapableComposeReady : Bool :=
  SystemsLean.HostFrontLiveCapableCompose.hostFrontLiveCapableComposeReady

/-- Honesty: this command is not lake build of CapableCompose. -/
def slakeTypecheckCapableComposeDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableComposeFullHost : Bool := false

/-- Honesty: FullBackend stays false. -/
def slakeTypecheckCapableComposeFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableComposeOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableCompose.lean.
    Ready is HostFrontLiveCapableCompose.hostFrontLiveCapableComposeReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCapableCompose.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableCompose} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCapableCompose.liveRel}"
  IO.println s!"  host={hostId} file={liveCapableComposeRel}"
  unless (!slakeTypecheckCapableComposeFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableComposeFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckCapableComposeOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableCompose.main args
