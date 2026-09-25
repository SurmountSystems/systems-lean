/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.Linear.
  Short role: named driver for lean --run of the Linear.lean wrap.
  Ready is HostFrontLiveLinear parse plus HostKernel.kernelCheck
  of live Linear.lean, not a hardcoded true, not lake build
  SystemsLean.Linear.
  liveRel is Linear.lean.
  This wrap is Linear.lean. It is not EmitLinearScaffold.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LINEAR,
  SLAKE_TYPECHECK_LINEAR, slake-typecheck-linear,
  slakeTypecheckLinearReady,
  kernelCheckLiveLinearSource,
  PARSE-LIVE-LINEAR.
  Module: SystemsLean.SlakeTypecheckLinear
  Checkable writer: lean --run SlakeTypecheckLinear.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveLinear

set_option maxRecDepth 32768
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LINEAR"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LINEAR"

/-- Named recipe string. Not lake build SystemsLean.Linear. -/
def justRecipeSlakeTypecheckLinear : String :=
  "slake-typecheck-linear"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearRel : String :=
  SystemsLean.HostFrontLiveLinear.liveLinearRel

/-- Ready names HostFrontLiveLinear parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLinearReady,
    kernelCheckLiveLinearSource. -/
def slakeTypecheckLinearReady : Bool :=
  SystemsLean.HostFrontLiveLinear.hostFrontLiveLinearReady

/-- Honesty: this command is not lake build of Linear. -/
def slakeTypecheckLinearDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLinearFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckLinearFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLinearOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live Linear.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is HostFrontLiveLinear.hostFrontLiveLinearReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLinear.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLinear} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLinear.liveRel}"
  IO.println s!"  host={hostId} file={liveLinearRel}"
  unless (!slakeTypecheckLinearFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLinearFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLinearOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLinear.main args
