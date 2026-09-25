/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitErasure.
  Short role: named driver for just slake-typecheck-emiterasure.
  Ready is HostFrontLiveEmitErasure parse plus HostKernel.kernelCheck
  of live EmitErasure.lean, not a hardcoded true, not lake build
  SystemsLean.EmitErasure.
  liveRel is EmitErasure.lean.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-ERASURE,
  SLAKE_TYPECHECK_EMIT_ERASURE_V0, slake-typecheck-emiterasure,
  slakeTypecheckEmitErasureReady,
  kernelCheckLiveEmitErasureSource,
  PARSE-LIVE-EMIT-ERASURE.
  Module: SystemsLean.SlakeTypecheckEmitErasure
  Checkable writer: just slake-typecheck-emiterasure
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitErasure

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_ERASURE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-ERASURE"

/-- Named just recipe. Not lake build SystemsLean.EmitErasure. -/
def justRecipeSlakeTypecheckEmitErasure : String :=
  "slake-typecheck-emiterasure"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitErasureRel : String :=
  SystemsLean.HostFrontLiveEmitErasure.liveEmitErasureRel

/-- Live basename. Exact equality. Not EmitErasureScaffold.lean. -/
def liveRel : String := SystemsLean.HostFrontLiveEmitErasure.liveRel

/-- Ready names HostFrontLiveEmitErasure parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckEmitErasureReady,
    kernelCheckLiveEmitErasureSource. -/
def slakeTypecheckEmitErasureReady : Bool :=
  SystemsLean.HostFrontLiveEmitErasure.hostFrontLiveEmitErasureReady

/-- Honesty: this command is not lake build of EmitErasure. -/
def slakeTypecheckEmitErasureDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitErasureFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitErasureOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitErasure.lean.
    Ready is HostFrontLiveEmitErasure.hostFrontLiveEmitErasureReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveEmitErasure.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitErasure} =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveEmitErasureRel}"
  unless (liveRel == "EmitErasure.lean") do
    IO.eprintln "error: liveRel must be EmitErasure.lean"
    return 1
  unless (!slakeTypecheckEmitErasureFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitErasureOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitErasure.main args
