/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.IrGraph.
  Short role: named driver for lean --run of the IrGraph.lean wrap.
  Ready is HostFrontLiveIrGraph parse plus HostKernel.kernelCheck
  of live IrGraph.lean, not a hardcoded true, not lake build
  SystemsLean.IrGraph.
  liveRel is IrGraph.lean.
  This wrap is IrGraph.lean. It is not IrGraphTheorems.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-IRGRAPH,
  SLAKE_TYPECHECK_IRGRAPH, slake-typecheck-irgraph,
  slakeTypecheckIrGraphReady,
  kernelCheckLiveIrGraphSource,
  PARSE-LIVE-IRGRAPH.
  Module: SystemsLean.SlakeTypecheckIrGraph
  Checkable writer: lean --run SlakeTypecheckIrGraph.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveIrGraph

set_option maxRecDepth 32768
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_IRGRAPH"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-IRGRAPH"

/-- Named recipe string. Not lake build SystemsLean.IrGraph. -/
def justRecipeSlakeTypecheckIrGraph : String :=
  "slake-typecheck-irgraph"

/-- Live file relative to repo root. Dual-pin path. -/
def liveIrGraphRel : String :=
  SystemsLean.HostFrontLiveIrGraph.liveIrGraphRel

/-- Ready names HostFrontLiveIrGraph parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckIrGraphReady,
    kernelCheckLiveIrGraphSource. -/
def slakeTypecheckIrGraphReady : Bool :=
  SystemsLean.HostFrontLiveIrGraph.hostFrontLiveIrGraphReady

/-- Honesty: this command is not lake build of IrGraph. -/
def slakeTypecheckIrGraphDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckIrGraphFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckIrGraphFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckIrGraphOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live IrGraph.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is HostFrontLiveIrGraph.hostFrontLiveIrGraphReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveIrGraph.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckIrGraph} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveIrGraph.liveRel}"
  IO.println s!"  host={hostId} file={liveIrGraphRel}"
  unless (!slakeTypecheckIrGraphFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckIrGraphFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckIrGraphOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveIrGraph.main args
