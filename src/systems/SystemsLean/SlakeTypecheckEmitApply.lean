/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitApply.
  Short role: named driver for just slake-typecheck-emitapply.
  Ready is HostFrontLiveEmitApply parse plus HostKernel.kernelCheck
  of live EmitApply.lean, not a hardcoded true, not lake build
  SystemsLean.EmitApply.
  liveRel is EmitApply.lean.
  This wrap is EmitApply.lean. It is not EmitApplyScaffold.lean.
  It is not EmitPlan.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-APPLY,
  SLAKE_TYPECHECK_EMIT_APPLY, slake-typecheck-emitapply,
  slakeTypecheckEmitApplyReady,
  kernelCheckLiveEmitApplySource,
  PARSE-LIVE-EMIT-APPLY.
  Module: SystemsLean.SlakeTypecheckEmitApply
  Checkable writer: just slake-typecheck-emitapply
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitApply

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_APPLY"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-APPLY"

/-- Named just recipe. Not lake build SystemsLean.EmitApply. -/
def justRecipeSlakeTypecheckEmitApply : String :=
  "slake-typecheck-emitapply"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitApplyRel : String :=
  SystemsLean.HostFrontLiveEmitApply.liveEmitApplyRel

/-- Ready names HostFrontLiveEmitApply parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckEmitApplyReady,
    kernelCheckLiveEmitApplySource. -/
def slakeTypecheckEmitApplyReady : Bool :=
  SystemsLean.HostFrontLiveEmitApply.hostFrontLiveEmitApplyReady

/-- Honesty: this command is not lake build of EmitApply. -/
def slakeTypecheckEmitApplyDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitApplyFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckEmitApplyFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitApplyOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitApply.lean.
    Ready is HostFrontLiveEmitApply.hostFrontLiveEmitApplyReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveEmitApply.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitApply} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveEmitApply.liveRel}"
  IO.println s!"  host={hostId} file={liveEmitApplyRel}"
  unless (!slakeTypecheckEmitApplyFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitApplyFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckEmitApplyOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitApply.main args
