/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LinearSubsetEmit.
  Short role: named driver for just slake-typecheck-linearsubsetemit.
  Ready is HostFrontLiveLinearSubsetEmit parse plus HostKernel.kernelCheck
  of live LinearSubsetEmit.lean, not a hardcoded true, not lake build
  SystemsLean.LinearSubsetEmit.
  liveRel is LinearSubsetEmit.lean.
  This wrap is LinearSubsetEmit.lean. It is not LinearSubsetEmitMain.lean.
  Main entry is this driver. HostFrontLiveLinearSubsetEmitMain.lean is a
  different module and is not this wrap.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LINEAR-SUBSET-EMIT,
  SLAKE_TYPECHECK_LINEAR_SUBSET_EMIT, slake-typecheck-linearsubsetemit,
  slakeTypecheckLinearSubsetEmitReady,
  kernelCheckLiveLinearSubsetEmitSource,
  PARSE-LIVE-LINEAR-SUBSET-EMIT.
  Module: SystemsLean.SlakeTypecheckLinearSubsetEmit
  Checkable writer: just slake-typecheck-linearsubsetemit
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLinearSubsetEmit
import SystemsLean.HostKernel

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LINEAR_SUBSET_EMIT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LINEAR-SUBSET-EMIT"

/-- Named just recipe. Not lake build SystemsLean.LinearSubsetEmit. -/
def justRecipeSlakeTypecheckLinearSubsetEmit : String :=
  "slake-typecheck-linearsubsetemit"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearSubsetEmitRel : String :=
  SystemsLean.HostFrontLiveLinearSubsetEmit.liveLinearSubsetEmitRel

/-- Driver calls HostKernel.kernelCheck of the live parse.
    Not a stub. Not a hardcoded true.
    Greppable: kernelCheckLiveLinearSubsetEmitSource,
    HostKernel.kernelCheck. -/
def kernelCheckLiveLinearSubsetEmitSource : Bool :=
  match SystemsLean.HostFrontLiveLinearSubsetEmit.parseLiveLinearSubsetEmitSource
      SystemsLean.HostFrontLiveLinearSubsetEmit.liveLinearSubsetEmitSource with
  | SystemsLean.HostFront.FrontResult.accept m =>
    SystemsLean.HostKernel.kernelCheck m
  | SystemsLean.HostFront.FrontResult.reject _ => false

/-- Ready names HostFrontLiveLinearSubsetEmit parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLinearSubsetEmitReady,
    kernelCheckLiveLinearSubsetEmitSource. -/
def slakeTypecheckLinearSubsetEmitReady : Bool :=
  kernelCheckLiveLinearSubsetEmitSource
    && SystemsLean.HostFrontLiveLinearSubsetEmit.hostFrontLiveLinearSubsetEmitReady

/-- Honesty: this command is not lake build of LinearSubsetEmit. -/
def slakeTypecheckLinearSubsetEmitDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLinearSubsetEmitFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLinearSubsetEmitOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus HostKernel.kernelCheck live LinearSubsetEmit.lean.
    Ready is hostFrontLiveLinearSubsetEmitReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLinearSubsetEmit.main at runtime, and this driver calls
    HostKernel.kernelCheck before that forward. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLinearSubsetEmit} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLinearSubsetEmit.liveRel}"
  IO.println s!"  host={hostId} file={liveLinearSubsetEmitRel}"
  unless (!slakeTypecheckLinearSubsetEmitFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLinearSubsetEmitOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless kernelCheckLiveLinearSubsetEmitSource do
    IO.eprintln "error: HostKernel.kernelCheck live LinearSubsetEmit parse false"
    return 1
  unless slakeTypecheckLinearSubsetEmitReady do
    IO.eprintln "error: slakeTypecheckLinearSubsetEmitReady false"
    return 1
  SystemsLean.HostFrontLiveLinearSubsetEmit.main args
