/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProbeWireTheorems.
  Short role: named driver for just slake-typecheck-probewiretheorems.
  Ready is HostFrontLiveProbeWireTheorems parse plus HostKernel.kernelCheck
  of live ProbeWireTheorems.lean, not := true, not lake build
  SystemsLean.ProbeWireTheorems.
  file= prints the bare liveRel ProbeWireTheorems.lean.
  Product ids PROBE-WIRE-THEOREM and PROBE-WIRE-SMOKE are not changed.
  Not mill. Not occupancy name 50. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PROBE-WIRE-THEOREMS,
  SLAKE_TYPECHECK_PROBE_WIRE_THEOREMS_V0, slake-typecheck-probewiretheorems,
  slakeTypecheckProbeWireTheoremsReady,
  kernelCheckLiveProbeWireTheoremsSource,
  PARSE-LIVE-PROBEWIRETHEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckProbeWireTheorems
  Checkable writer: just slake-typecheck-probewiretheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProbeWireTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PROBE_WIRE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PROBE-WIRE-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ProbeWireTheorems. -/
def justRecipeSlakeTypecheckProbeWireTheorems : String :=
  "slake-typecheck-probewiretheorems"

/-- Live file basename. Dual-pin name. Bare ProbeWireTheorems.lean. -/
def liveProbeWireTheoremsRel : String :=
  SystemsLean.HostFrontLiveProbeWireTheorems.liveRel

/-- Ready names HostFrontLiveProbeWireTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProbeWireTheoremsReady,
    kernelCheckLiveProbeWireTheoremsSource. -/
def slakeTypecheckProbeWireTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveProbeWireTheorems.hostFrontLiveProbeWireTheoremsReady

/-- Honesty: this command is not lake build of ProbeWireTheorems. -/
def slakeTypecheckProbeWireTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProbeWireTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProbeWireTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProbeWireTheorems.lean.
    Ready is HostFrontLiveProbeWireTheorems.hostFrontLiveProbeWireTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProbeWireTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProbeWireTheorems} =="
  IO.println s!"  host={hostId} file={liveProbeWireTheoremsRel}"
  unless (!slakeTypecheckProbeWireTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProbeWireTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless (liveProbeWireTheoremsRel == "ProbeWireTheorems.lean") do
    IO.eprintln "error: liveRel must be the bare name ProbeWireTheorems.lean"
    return 1
  SystemsLean.HostFrontLiveProbeWireTheorems.main args
