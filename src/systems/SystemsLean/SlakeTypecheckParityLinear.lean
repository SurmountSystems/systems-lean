/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ParityLinear.
  Short role: named driver for just slake-typecheck-paritylinear.
  Ready is HostFrontLiveParityLinear parse plus HostKernel.kernelCheck
  of live ParityLinear.lean, not a hardcoded true, not lake build
  SystemsLean.ParityLinear.
  liveRel is ParityLinear.lean.
  This wrap is ParityLinear.lean. It is not ParityLinearTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PARITY-LINEAR,
  SLAKE_TYPECHECK_PARITY_LINEAR, slake-typecheck-paritylinear,
  slakeTypecheckParityLinearReady,
  kernelCheckLiveParityLinearSource,
  PARSE-LIVE-PARITY-LINEAR.
  Module: SystemsLean.SlakeTypecheckParityLinear
  Checkable writer: just slake-typecheck-paritylinear
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveParityLinear

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PARITY_LINEAR"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PARITY-LINEAR"

/-- Named just recipe. Not lake build SystemsLean.ParityLinear. -/
def justRecipeSlakeTypecheckParityLinear : String :=
  "slake-typecheck-paritylinear"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityLinearRel : String :=
  SystemsLean.HostFrontLiveParityLinear.liveParityLinearRel

/-- Ready names HostFrontLiveParityLinear parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckParityLinearReady,
    kernelCheckLiveParityLinearSource. -/
def slakeTypecheckParityLinearReady : Bool :=
  SystemsLean.HostFrontLiveParityLinear.hostFrontLiveParityLinearReady

/-- Honesty: this command is not lake build of ParityLinear. -/
def slakeTypecheckParityLinearDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckParityLinearFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckParityLinearFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckParityLinearOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ParityLinear.lean.
    Ready is HostFrontLiveParityLinear.hostFrontLiveParityLinearReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveParityLinear.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckParityLinear} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveParityLinear.liveRel}"
  IO.println s!"  host={hostId} file={liveParityLinearRel}"
  unless (!slakeTypecheckParityLinearFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckParityLinearFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckParityLinearOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveParityLinear.main args
