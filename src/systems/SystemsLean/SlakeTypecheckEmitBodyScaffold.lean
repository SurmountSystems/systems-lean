/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitBody.
  Short role: named driver for just slake-typecheck-emitbodyscaffold.
  Ready is HostFrontLiveEmitBodyScaffold parse plus HostKernel.kernelCheck
  of live EmitBodyScaffold.lean, not a hardcoded true, not lake build
  SystemsLean.EmitBody.
  liveRel is EmitBodyScaffold.lean.
  This wrap is EmitBodyScaffold.lean. It is not EmitBody.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-BODY-SCAFFOLD,
  SLAKE_TYPECHECK_EMIT_BODY_SCAFFOLD, slake-typecheck-emitbodyscaffold,
  slakeTypecheckEmitBodyScaffoldReady,
  kernelCheckLiveEmitBodyScaffoldSource,
  PARSE-LIVE-EMIT-BODY-SCAFFOLD.
  Module: SystemsLean.SlakeTypecheckEmitBodyScaffold
  Checkable writer: just slake-typecheck-emitbodyscaffold
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitBodyScaffold

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_BODY_SCAFFOLD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-BODY-SCAFFOLD"

/-- Named just recipe. Not lake build SystemsLean.EmitBody. -/
def justRecipeSlakeTypecheckEmitBodyScaffold : String :=
  "slake-typecheck-emitbodyscaffold"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitBodyScaffoldRel : String :=
  SystemsLean.HostFrontLiveEmitBodyScaffold.liveEmitBodyScaffoldRel

/-- Ready names HostFrontLiveEmitBodyScaffold parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckEmitBodyScaffoldReady,
    kernelCheckLiveEmitBodyScaffoldSource. -/
def slakeTypecheckEmitBodyScaffoldReady : Bool :=
  SystemsLean.HostFrontLiveEmitBodyScaffold.hostFrontLiveEmitBodyScaffoldReady

/-- Honesty: this command is not lake build of EmitBodyScaffold. -/
def slakeTypecheckEmitBodyScaffoldDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitBodyScaffoldFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckEmitBodyScaffoldFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitBodyScaffoldOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitBodyScaffold.lean.
    Ready is HostFrontLiveEmitBodyScaffold.hostFrontLiveEmitBodyScaffoldReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveEmitBodyScaffold.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitBodyScaffold} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveEmitBodyScaffold.liveRel}"
  IO.println s!"  host={hostId} file={liveEmitBodyScaffoldRel}"
  unless (!slakeTypecheckEmitBodyScaffoldFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitBodyScaffoldFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckEmitBodyScaffoldOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitBodyScaffold.main args
