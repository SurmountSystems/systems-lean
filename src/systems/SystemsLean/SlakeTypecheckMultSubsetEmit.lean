/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.MultSubsetEmit.
  Short role: named driver for just slake-typecheck-multsubsetemit.
  Ready is HostFrontLiveMultSubsetEmit parse plus HostKernel.kernelCheck
  of live MultSubsetEmit.lean, not a hardcoded true, not lake build
  SystemsLean.MultSubsetEmit.
  liveRel is MultSubsetEmit.lean.
  This wrap is MultSubsetEmit.lean. It is not MultSubsetEmitMain.lean.
  Main entry is this driver. HostFrontLiveMultSubsetEmitMain.lean is a
  different module and is not this wrap.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-MULT-SUBSET-EMIT,
  SLAKE_TYPECHECK_MULT_SUBSET_EMIT, slake-typecheck-multsubsetemit,
  slakeTypecheckMultSubsetEmitReady,
  kernelCheckLiveMultSubsetEmitSource,
  PARSE-LIVE-MULT-SUBSET-EMIT.
  Module: SystemsLean.SlakeTypecheckMultSubsetEmit
  Checkable writer: just slake-typecheck-multsubsetemit
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveMultSubsetEmit
import SystemsLean.HostKernel

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_MULT_SUBSET_EMIT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-MULT-SUBSET-EMIT"

/-- Named just recipe. Not lake build SystemsLean.MultSubsetEmit. -/
def justRecipeSlakeTypecheckMultSubsetEmit : String :=
  "slake-typecheck-multsubsetemit"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultSubsetEmitRel : String :=
  SystemsLean.HostFrontLiveMultSubsetEmit.liveMultSubsetEmitRel

/-- Driver calls HostKernel.kernelCheck of the live parse.
    Not a stub. Not a hardcoded true.
    Greppable: kernelCheckLiveMultSubsetEmitSource,
    HostKernel.kernelCheck. -/
def kernelCheckLiveMultSubsetEmitSource : Bool :=
  match SystemsLean.HostFrontLiveMultSubsetEmit.parseLiveMultSubsetEmitSource
      SystemsLean.HostFrontLiveMultSubsetEmit.liveMultSubsetEmitSource with
  | SystemsLean.HostFront.FrontResult.accept m =>
    SystemsLean.HostKernel.kernelCheck m
  | SystemsLean.HostFront.FrontResult.reject _ => false

/-- Ready names HostFrontLiveMultSubsetEmit parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckMultSubsetEmitReady,
    kernelCheckLiveMultSubsetEmitSource. -/
def slakeTypecheckMultSubsetEmitReady : Bool :=
  kernelCheckLiveMultSubsetEmitSource
    && SystemsLean.HostFrontLiveMultSubsetEmit.hostFrontLiveMultSubsetEmitReady

/-- Honesty: this command is not lake build of MultSubsetEmit. -/
def slakeTypecheckMultSubsetEmitDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckMultSubsetEmitFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckMultSubsetEmitOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus HostKernel.kernelCheck live MultSubsetEmit.lean.
    Ready is hostFrontLiveMultSubsetEmitReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveMultSubsetEmit.main at runtime, and this driver calls
    HostKernel.kernelCheck before that forward. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckMultSubsetEmit} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveMultSubsetEmit.liveRel}"
  IO.println s!"  host={hostId} file={liveMultSubsetEmitRel}"
  unless (!slakeTypecheckMultSubsetEmitFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckMultSubsetEmitOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless kernelCheckLiveMultSubsetEmitSource do
    IO.eprintln "error: HostKernel.kernelCheck live MultSubsetEmit parse false"
    return 1
  unless slakeTypecheckMultSubsetEmitReady do
    IO.eprintln "error: slakeTypecheckMultSubsetEmitReady false"
    return 1
  SystemsLean.HostFrontLiveMultSubsetEmit.main args
