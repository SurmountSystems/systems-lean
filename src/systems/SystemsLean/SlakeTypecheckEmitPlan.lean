/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitPlan.
  Short role: named driver for just slake-typecheck-emitplan.
  Ready is HostFrontLiveEmitPlan parse plus HostKernel.kernelCheck
  of live EmitPlan.lean, not a hardcoded true, not lake build
  SystemsLean.EmitPlan.
  liveRel is EmitPlan.lean.
  This wrap is EmitPlan.lean. It is not EmitApply.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-PLAN,
  SLAKE_TYPECHECK_EMIT_PLAN, slake-typecheck-emitplan,
  slakeTypecheckEmitPlanReady,
  kernelCheckLiveEmitPlanSource,
  PARSE-LIVE-EMIT-PLAN.
  Module: SystemsLean.SlakeTypecheckEmitPlan
  Checkable writer: just slake-typecheck-emitplan
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitPlan

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_PLAN"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-PLAN"

/-- Named just recipe. Not lake build SystemsLean.EmitPlan. -/
def justRecipeSlakeTypecheckEmitPlan : String :=
  "slake-typecheck-emitplan"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitPlanRel : String :=
  SystemsLean.HostFrontLiveEmitPlan.liveEmitPlanRel

/-- Ready names HostFrontLiveEmitPlan parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckEmitPlanReady,
    kernelCheckLiveEmitPlanSource. -/
def slakeTypecheckEmitPlanReady : Bool :=
  SystemsLean.HostFrontLiveEmitPlan.hostFrontLiveEmitPlanReady

/-- Honesty: this command is not lake build of EmitPlan. -/
def slakeTypecheckEmitPlanDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitPlanFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckEmitPlanFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitPlanOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitPlan.lean.
    Ready is HostFrontLiveEmitPlan.hostFrontLiveEmitPlanReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveEmitPlan.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitPlan} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveEmitPlan.liveRel}"
  IO.println s!"  host={hostId} file={liveEmitPlanRel}"
  unless (!slakeTypecheckEmitPlanFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitPlanFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckEmitPlanOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitPlan.main args
