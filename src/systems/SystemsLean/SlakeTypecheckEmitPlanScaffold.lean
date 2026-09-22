/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitPlanScaffold.
  Short role: named driver for just slake-typecheck-emitplanscaffold.
  Ready is HostFrontLiveEmitPlanScaffold parse plus HostKernel.kernelCheck
  of live EmitPlanScaffold.lean, not a hardcoded true, not lake build
  SystemsLean.EmitPlanScaffold.
  liveRel is EmitPlanScaffold.lean.
  This wrap is EmitPlanScaffold.lean. It is not EmitPlan.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-PLAN-SCAFFOLD,
  SLAKE_TYPECHECK_EMIT_PLAN_SCAFFOLD, slake-typecheck-emitplanscaffold,
  slakeTypecheckEmitPlanScaffoldReady,
  kernelCheckLiveEmitPlanScaffoldSource,
  PARSE-LIVE-EMIT-PLAN-SCAFFOLD.
  Module: SystemsLean.SlakeTypecheckEmitPlanScaffold
  Checkable writer: just slake-typecheck-emitplanscaffold
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitPlanScaffold
import SystemsLean.HostFrontLiveEmitPlanScaffoldSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_PLAN_SCAFFOLD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-PLAN-SCAFFOLD"

/-- Named just recipe. Not lake build SystemsLean.EmitPlanScaffold. -/
def justRecipeSlakeTypecheckEmitPlanScaffold : String :=
  "slake-typecheck-emitplanscaffold"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitPlanScaffoldRel : String :=
  SystemsLean.HostFrontLiveEmitPlanScaffold.liveEmitPlanScaffoldRel

/-- Ready names HostFrontLiveEmitPlanScaffold parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckEmitPlanScaffoldReady,
    kernelCheckLiveEmitPlanScaffoldSource. -/
def slakeTypecheckEmitPlanScaffoldReady : Bool :=
  SystemsLean.HostFrontLiveEmitPlanScaffold.hostFrontLiveEmitPlanScaffoldReady

/-- Honesty: this command is not lake build of EmitPlanScaffold. -/
def slakeTypecheckEmitPlanScaffoldDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitPlanScaffoldFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckEmitPlanScaffoldFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitPlanScaffoldOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitPlanScaffold.lean.
    Ready is HostFrontLiveEmitPlanScaffold.hostFrontLiveEmitPlanScaffoldReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveEmitPlanScaffold.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitPlanScaffold} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveEmitPlanScaffold.liveRel}"
  IO.println s!"  host={hostId} file={liveEmitPlanScaffoldRel}"
  unless (!slakeTypecheckEmitPlanScaffoldFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitPlanScaffoldFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckEmitPlanScaffoldOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitPlanScaffold.main args
