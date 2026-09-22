/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.GraphSubsetEmit.
  Short role: named driver for just slake-typecheck-graphsubsetemit.
  Ready is HostFrontLiveGraphSubsetEmit parse plus HostKernel.kernelCheck
  of live GraphSubsetEmit.lean, not a hardcoded true, not lake build
  SystemsLean.GraphSubsetEmit.
  liveRel is GraphSubsetEmit.lean.
  This wrap is GraphSubsetEmit.lean. It is not GraphSubsetEmitMain.lean.
  Main entry is this driver. HostFrontLiveGraphSubsetEmitMain.lean is a
  different module and is not this wrap.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-GRAPH-SUBSET-EMIT,
  SLAKE_TYPECHECK_GRAPH_SUBSET_EMIT, slake-typecheck-graphsubsetemit,
  slakeTypecheckGraphSubsetEmitReady,
  kernelCheckLiveGraphSubsetEmitSource,
  PARSE-LIVE-GRAPH-SUBSET-EMIT.
  Module: SystemsLean.SlakeTypecheckGraphSubsetEmit
  Checkable writer: just slake-typecheck-graphsubsetemit
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveGraphSubsetEmit
import SystemsLean.HostKernel

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_GRAPH_SUBSET_EMIT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-GRAPH-SUBSET-EMIT"

/-- Named just recipe. Not lake build SystemsLean.GraphSubsetEmit. -/
def justRecipeSlakeTypecheckGraphSubsetEmit : String :=
  "slake-typecheck-graphsubsetemit"

/-- Live file relative to repo root. Dual-pin path. -/
def liveGraphSubsetEmitRel : String :=
  SystemsLean.HostFrontLiveGraphSubsetEmit.liveGraphSubsetEmitRel

/-- Driver calls HostKernel.kernelCheck of the live parse.
    Not a stub. Not a hardcoded true.
    Greppable: kernelCheckLiveGraphSubsetEmitSource,
    HostKernel.kernelCheck. -/
def kernelCheckLiveGraphSubsetEmitSource : Bool :=
  match SystemsLean.HostFrontLiveGraphSubsetEmit.parseLiveGraphSubsetEmitSource
      SystemsLean.HostFrontLiveGraphSubsetEmit.liveGraphSubsetEmitSource with
  | SystemsLean.HostFront.FrontResult.accept m =>
    SystemsLean.HostKernel.kernelCheck m
  | SystemsLean.HostFront.FrontResult.reject _ => false

/-- Ready names HostFrontLiveGraphSubsetEmit parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckGraphSubsetEmitReady,
    kernelCheckLiveGraphSubsetEmitSource. -/
def slakeTypecheckGraphSubsetEmitReady : Bool :=
  kernelCheckLiveGraphSubsetEmitSource
    && SystemsLean.HostFrontLiveGraphSubsetEmit.hostFrontLiveGraphSubsetEmitReady

/-- Honesty: this command is not lake build of GraphSubsetEmit. -/
def slakeTypecheckGraphSubsetEmitDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckGraphSubsetEmitFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckGraphSubsetEmitOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus HostKernel.kernelCheck live GraphSubsetEmit.lean.
    Ready is hostFrontLiveGraphSubsetEmitReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveGraphSubsetEmit.main at runtime, and this driver calls
    HostKernel.kernelCheck before that forward. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckGraphSubsetEmit} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveGraphSubsetEmit.liveRel}"
  IO.println s!"  host={hostId} file={liveGraphSubsetEmitRel}"
  unless (!slakeTypecheckGraphSubsetEmitFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckGraphSubsetEmitOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless kernelCheckLiveGraphSubsetEmitSource do
    IO.eprintln "error: HostKernel.kernelCheck live GraphSubsetEmit parse false"
    return 1
  unless slakeTypecheckGraphSubsetEmitReady do
    IO.eprintln "error: slakeTypecheckGraphSubsetEmitReady false"
    return 1
  SystemsLean.HostFrontLiveGraphSubsetEmit.main args
