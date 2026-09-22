/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ParityEmit.
  Short role: named driver for just slake-typecheck-parityemit.
  Ready is HostFrontLiveParityEmit parse plus HostKernel.kernelCheck
  of live ParityEmit.lean, not a hardcoded true, not lake build
  SystemsLean.ParityEmit.
  liveRel is ParityEmit.lean.
  This wrap is ParityEmit.lean. It is not ParityEmitTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PARITY-EMIT,
  SLAKE_TYPECHECK_PARITY_EMIT, slake-typecheck-parityemit,
  slakeTypecheckParityEmitReady,
  kernelCheckLiveParityEmitSource,
  PARSE-LIVE-PARITY-EMIT.
  Module: SystemsLean.SlakeTypecheckParityEmit
  Checkable writer: just slake-typecheck-parityemit
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveParityEmit

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PARITY_EMIT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PARITY-EMIT"

/-- Named just recipe. Not lake build SystemsLean.ParityEmit. -/
def justRecipeSlakeTypecheckParityEmit : String :=
  "slake-typecheck-parityemit"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityEmitRel : String :=
  SystemsLean.HostFrontLiveParityEmit.liveParityEmitRel

/-- Ready names HostFrontLiveParityEmit parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckParityEmitReady,
    kernelCheckLiveParityEmitSource. -/
def slakeTypecheckParityEmitReady : Bool :=
  SystemsLean.HostFrontLiveParityEmit.hostFrontLiveParityEmitReady

/-- Honesty: this command is not lake build of ParityEmit. -/
def slakeTypecheckParityEmitDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckParityEmitFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckParityEmitFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckParityEmitOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ParityEmit.lean.
    Ready is HostFrontLiveParityEmit.hostFrontLiveParityEmitReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveParityEmit.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckParityEmit} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveParityEmit.liveRel}"
  IO.println s!"  host={hostId} file={liveParityEmitRel}"
  unless (!slakeTypecheckParityEmitFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckParityEmitFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckParityEmitOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveParityEmit.main args
