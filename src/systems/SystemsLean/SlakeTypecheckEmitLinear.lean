/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitLinear.
  Short role: named driver for just slake-typecheck-emitlinear.
  Ready is HostFrontLiveEmitLinear parse plus HostKernel.kernelCheck
  of live EmitLinear.lean, not a hardcoded true, not lake build
  SystemsLean.EmitLinear.
  liveRel is EmitLinear.lean.
  Not mill. Not occupancy name 50. Not FullHost. Not a backend.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-LINEAR,
  SLAKE_TYPECHECK_EMIT_LINEAR_V0, slake-typecheck-emitlinear,
  slakeTypecheckEmitLinearReady,
  kernelCheckLiveEmitLinearSource,
  PARSE-LIVE-EMIT-LINEAR, SKELETON.
  Module: SystemsLean.SlakeTypecheckEmitLinear
  Checkable writer: just slake-typecheck-emitlinear
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitLinear

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_LINEAR_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-LINEAR"

/-- Named just recipe. Not lake build SystemsLean.EmitLinear. -/
def justRecipeSlakeTypecheckEmitLinear : String :=
  "slake-typecheck-emitlinear"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitLinearRel : String :=
  SystemsLean.HostFrontLiveEmitLinear.liveEmitLinearRel

/-- Ready names HostFrontLiveEmitLinear parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckEmitLinearReady,
    kernelCheckLiveEmitLinearSource. -/
def slakeTypecheckEmitLinearReady : Bool :=
  SystemsLean.HostFrontLiveEmitLinear.hostFrontLiveEmitLinearReady

/-- Honesty: this command is not lake build of EmitLinear. -/
def slakeTypecheckEmitLinearDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitLinearFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitLinearOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitLinear.lean.
    Ready is HostFrontLiveEmitLinear.hostFrontLiveEmitLinearReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveEmitLinear.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitLinear} =="
  IO.println s!"  host={hostId} file={liveEmitLinearRel}"
  unless (!slakeTypecheckEmitLinearFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitLinearOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitLinear.main args
