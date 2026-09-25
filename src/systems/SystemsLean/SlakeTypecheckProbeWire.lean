/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProbeWire.
  Short role: named driver for just slake-typecheck-probewire.
  Ready is HostFrontLiveProbeWire parse plus HostKernel.kernelCheck
  of live ProbeWire.lean, not a hardcoded true, not lake build
  SystemsLean.ProbeWire.
  liveRel is ProbeWire.lean.
  This wrap is ProbeWire.lean. It is not ProbeWireTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PROBE-WIRE,
  SLAKE_TYPECHECK_PROBE_WIRE, slake-typecheck-probewire,
  slakeTypecheckProbeWireReady,
  kernelCheckLiveProbeWireSource,
  PARSE-LIVE-PROBE-WIRE.
  Module: SystemsLean.SlakeTypecheckProbeWire
  Checkable writer: just slake-typecheck-probewire
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProbeWire

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PROBE_WIRE"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PROBE-WIRE"

/-- Named just recipe. Not lake build SystemsLean.ProbeWire. -/
def justRecipeSlakeTypecheckProbeWire : String :=
  "slake-typecheck-probewire"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProbeWireRel : String :=
  SystemsLean.HostFrontLiveProbeWire.liveProbeWireRel

/-- Ready names HostFrontLiveProbeWire parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckProbeWireReady,
    kernelCheckLiveProbeWireSource. -/
def slakeTypecheckProbeWireReady : Bool :=
  SystemsLean.HostFrontLiveProbeWire.hostFrontLiveProbeWireReady

/-- Honesty: this command is not lake build of ProbeWire. -/
def slakeTypecheckProbeWireDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProbeWireFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckProbeWireFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProbeWireOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProbeWire.lean.
    Ready is HostFrontLiveProbeWire.hostFrontLiveProbeWireReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProbeWire.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProbeWire} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProbeWire.liveRel}"
  IO.println s!"  host={hostId} file={liveProbeWireRel}"
  unless (!slakeTypecheckProbeWireFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProbeWireFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckProbeWireOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProbeWire.main args
