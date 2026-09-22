/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitComposeScaffold.
  Short role: named driver for just slake-typecheck-emitcomposescaffold.
  Ready is HostFrontLiveEmitComposeScaffold parse plus HostKernel.kernelCheck
  of live EmitComposeScaffold.lean, not a hardcoded true, not lake build
  SystemsLean.EmitComposeScaffold.
  liveRel is EmitComposeScaffold.lean.
  This wrap is EmitComposeScaffold.lean. It is not a theorems file.
  The live namespace is SystemsLean.EmitCompose.
  Not a backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-COMPOSE-SCAFFOLD,
  SLAKE_TYPECHECK_EMIT_COMPOSE_SCAFFOLD, slake-typecheck-emitcomposescaffold,
  slakeTypecheckEmitComposeScaffoldReady,
  kernelCheckLiveEmitComposeScaffoldSource,
  PARSE-LIVE-EMIT-COMPOSE-SCAFFOLD.
  Module: SystemsLean.SlakeTypecheckEmitComposeScaffold
  Checkable writer: just slake-typecheck-emitcomposescaffold
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitComposeScaffold

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_COMPOSE_SCAFFOLD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-COMPOSE-SCAFFOLD"

/-- Named just recipe. Not lake build SystemsLean.EmitComposeScaffold. -/
def justRecipeSlakeTypecheckEmitComposeScaffold : String :=
  "slake-typecheck-emitcomposescaffold"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitComposeScaffoldRel : String :=
  SystemsLean.HostFrontLiveEmitComposeScaffold.liveEmitComposeScaffoldRel

/-- Ready names HostFrontLiveEmitComposeScaffold parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckEmitComposeScaffoldReady,
    kernelCheckLiveEmitComposeScaffoldSource. -/
def slakeTypecheckEmitComposeScaffoldReady : Bool :=
  SystemsLean.HostFrontLiveEmitComposeScaffold.hostFrontLiveEmitComposeScaffoldReady

/-- Honesty: this command is not lake build of EmitComposeScaffold. -/
def slakeTypecheckEmitComposeScaffoldDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitComposeScaffoldFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not a backend. -/
def slakeTypecheckEmitComposeScaffoldFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitComposeScaffoldOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitComposeScaffold.lean.
    Ready is HostFrontLiveEmitComposeScaffold.hostFrontLiveEmitComposeScaffoldReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveEmitComposeScaffold.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitComposeScaffold} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveEmitComposeScaffold.liveRel}"
  IO.println s!"  host={hostId} file={liveEmitComposeScaffoldRel}"
  unless (!slakeTypecheckEmitComposeScaffoldFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitComposeScaffoldFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckEmitComposeScaffoldOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveEmitComposeScaffold.main args
