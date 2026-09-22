/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitLinearScaffold.
  Short role: named driver for just slake-typecheck-emitlinearscaffold.
  Ready is HostFrontLiveEmitLinearScaffold parse plus HostKernel.kernelCheck
  of live EmitLinearScaffold.lean, not a hardcoded true, not lake build
  SystemsLean.EmitLinearScaffold.
  liveRel is EmitLinearScaffold.lean.
  This wrap is EmitLinearScaffold.lean. It is not EmitLinear.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-LINEAR-SCAFFOLD,
  SLAKE_TYPECHECK_EMIT_LINEAR_SCAFFOLD, slake-typecheck-emitlinearscaffold,
  slakeTypecheckEmitLinearScaffoldReady,
  kernelCheckLiveEmitLinearScaffoldSource,
  PARSE-LIVE-EMIT-LINEAR-SCAFFOLD.
  Module: SystemsLean.SlakeTypecheckEmitLinearScaffold
  Checkable writer: just slake-typecheck-emitlinearscaffold
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitLinearScaffold

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_LINEAR_SCAFFOLD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-LINEAR-SCAFFOLD"

/-- Named just recipe. Not lake build SystemsLean.EmitLinearScaffold. -/
def justRecipeSlakeTypecheckEmitLinearScaffold : String :=
  "slake-typecheck-emitlinearscaffold"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitLinearScaffoldRel : String :=
  SystemsLean.HostFrontLiveEmitLinearScaffold.liveEmitLinearScaffoldRel

/-- Ready names HostFrontLiveEmitLinearScaffold parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckEmitLinearScaffoldReady,
    kernelCheckLiveEmitLinearScaffoldSource. -/
def slakeTypecheckEmitLinearScaffoldReady : Bool :=
  SystemsLean.HostFrontLiveEmitLinearScaffold.hostFrontLiveEmitLinearScaffoldReady

/-- Honesty: this command is not lake build of EmitLinearScaffold. -/
def slakeTypecheckEmitLinearScaffoldDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitLinearScaffoldFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckEmitLinearScaffoldFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitLinearScaffoldOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitLinearScaffold.lean.
    Ready is HostFrontLiveEmitLinearScaffold.hostFrontLiveEmitLinearScaffoldReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveEmitLinearScaffold.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitLinearScaffold} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveEmitLinearScaffold.liveRel}"
  IO.println s!"  host={hostId} file={liveEmitLinearScaffoldRel}"
  unless (!slakeTypecheckEmitLinearScaffoldFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitLinearScaffoldFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckEmitLinearScaffoldOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitLinearScaffold.main args
