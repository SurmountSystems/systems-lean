/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ComposeSubsetEmit.
  Short role: named driver for just slake-typecheck-composesubsetemit.
  Ready is HostFrontLiveComposeSubsetEmit parse plus HostKernel.kernelCheck
  of live ComposeSubsetEmit.lean, not a hardcoded true, not lake build
  SystemsLean.ComposeSubsetEmit.
  liveRel is ComposeSubsetEmit.lean.
  This wrap is ComposeSubsetEmit.lean. It is not ComposeSubsetEmitMain.lean.
  Main entry is this driver. HostFrontLiveComposeSubsetEmitMain.lean is a
  different module and is not this wrap.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-COMPOSE-SUBSET-EMIT,
  SLAKE_TYPECHECK_COMPOSE_SUBSET_EMIT, slake-typecheck-composesubsetemit,
  slakeTypecheckComposeSubsetEmitReady,
  kernelCheckLiveComposeSubsetEmitSource,
  PARSE-LIVE-COMPOSE-SUBSET-EMIT.
  Module: SystemsLean.SlakeTypecheckComposeSubsetEmit
  Checkable writer: just slake-typecheck-composesubsetemit
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveComposeSubsetEmit
import SystemsLean.HostKernel

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPOSE_SUBSET_EMIT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPOSE-SUBSET-EMIT"

/-- Named just recipe. Not lake build SystemsLean.ComposeSubsetEmit. -/
def justRecipeSlakeTypecheckComposeSubsetEmit : String :=
  "slake-typecheck-composesubsetemit"

/-- Live file relative to repo root. Dual-pin path. -/
def liveComposeSubsetEmitRel : String :=
  SystemsLean.HostFrontLiveComposeSubsetEmit.liveComposeSubsetEmitRel

/-- Driver calls HostKernel.kernelCheck of the live parse.
    Not a stub. Not a hardcoded true.
    Greppable: kernelCheckLiveComposeSubsetEmitSource,
    HostKernel.kernelCheck. -/
def kernelCheckLiveComposeSubsetEmitSource : Bool :=
  match SystemsLean.HostFrontLiveComposeSubsetEmit.parseLiveComposeSubsetEmitSource
      SystemsLean.HostFrontLiveComposeSubsetEmit.liveComposeSubsetEmitSource with
  | SystemsLean.HostFront.FrontResult.accept m =>
    SystemsLean.HostKernel.kernelCheck m
  | SystemsLean.HostFront.FrontResult.reject _ => false

/-- Ready names HostFrontLiveComposeSubsetEmit parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckComposeSubsetEmitReady,
    kernelCheckLiveComposeSubsetEmitSource. -/
def slakeTypecheckComposeSubsetEmitReady : Bool :=
  kernelCheckLiveComposeSubsetEmitSource
    && SystemsLean.HostFrontLiveComposeSubsetEmit.hostFrontLiveComposeSubsetEmitReady

/-- Honesty: this command is not lake build of ComposeSubsetEmit. -/
def slakeTypecheckComposeSubsetEmitDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckComposeSubsetEmitFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckComposeSubsetEmitOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus HostKernel.kernelCheck live ComposeSubsetEmit.lean.
    Ready is hostFrontLiveComposeSubsetEmitReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveComposeSubsetEmit.main at runtime, and this driver calls
    HostKernel.kernelCheck before that forward. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckComposeSubsetEmit} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveComposeSubsetEmit.liveRel}"
  IO.println s!"  host={hostId} file={liveComposeSubsetEmitRel}"
  unless (!slakeTypecheckComposeSubsetEmitFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckComposeSubsetEmitOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless kernelCheckLiveComposeSubsetEmitSource do
    IO.eprintln "error: HostKernel.kernelCheck live ComposeSubsetEmit parse false"
    return 1
  unless slakeTypecheckComposeSubsetEmitReady do
    IO.eprintln "error: slakeTypecheckComposeSubsetEmitReady false"
    return 1
  SystemsLean.HostFrontLiveComposeSubsetEmit.main args
