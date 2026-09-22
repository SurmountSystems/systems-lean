/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitApplyScaffold.
  Short role: named driver for just slake-typecheck-emitapplyscaffold.
  Ready is HostFrontLiveEmitApplyScaffold parse plus HostKernel.kernelCheck
  of live EmitApplyScaffold.lean, not := true, not lake build
  SystemsLean.EmitApplyScaffold.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckEmitApply is not a prefix):
  SlakeTypecheckEmitApplyScaffold
  HOST-SLAKE-TYPECHECK-EMIT-APPLY-SCAFFOLD
  SLAKE_TYPECHECK_EMIT_APPLY_SCAFFOLD_V0
  PARSE-LIVE-EMIT-APPLY-SCAFFOLD
  slake-typecheck-emitapplyscaffold
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-emitapplyscaffold,
  slakeTypecheckEmitApplyScaffoldReady,
  kernelCheckLiveEmitApplyScaffoldSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckEmitApplyScaffold
  Checkable writer: just slake-typecheck-emitapplyscaffold
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveEmitApplyScaffold

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_APPLY_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-APPLY-SCAFFOLD"

/-- Named just recipe. Not lake build SystemsLean.EmitApplyScaffold. -/
def justRecipeSlakeTypecheckEmitApplyScaffold : String :=
  "slake-typecheck-emitapplyscaffold"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitApplyScaffoldRel : String :=
  SystemsLean.HostFrontLiveEmitApplyScaffold.liveEmitApplyScaffoldRel

/-- Ready names HostFrontLiveEmitApplyScaffold parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckEmitApplyScaffoldReady,
    kernelCheckLiveEmitApplyScaffoldSource. -/
def slakeTypecheckEmitApplyScaffoldReady : Bool :=
  SystemsLean.HostFrontLiveEmitApplyScaffold.hostFrontLiveEmitApplyScaffoldReady

/-- Honesty: this command is not lake build of EmitApplyScaffold. -/
def slakeTypecheckEmitApplyScaffoldDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitApplyScaffoldFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitApplyScaffoldOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitApplyScaffold.lean.
    Ready is HostFrontLiveEmitApplyScaffold.hostFrontLiveEmitApplyScaffoldReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveEmitApplyScaffold.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitApplyScaffold} =="
  IO.println s!"  host={hostId} file={liveEmitApplyScaffoldRel}"
  unless (!slakeTypecheckEmitApplyScaffoldFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitApplyScaffoldOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitApplyScaffold.main args
