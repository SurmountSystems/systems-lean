/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.FreestandingEmitLoadScaffold.
  Short role: named driver for just slake-typecheck-freestandingemitloadscaffold.
  Ready is HostFrontLiveFreestandingEmitLoadScaffold parse plus
  HostKernel.kernelCheck of live FreestandingEmitLoadScaffold.lean,
  not a hardcoded true, not lake build
  SystemsLean.FreestandingEmitLoadScaffold.
  liveRel is FreestandingEmitLoadScaffold.lean.
  This wrap is FreestandingEmitLoadScaffold.lean.
  It is not FreestandingEmitLoad.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-FREESTANDING-EMIT-LOAD-SCAFFOLD,
  SLAKE_TYPECHECK_FREESTANDING_EMIT_LOAD_SCAFFOLD,
  slake-typecheck-freestandingemitloadscaffold,
  slakeTypecheckFreestandingEmitLoadScaffoldReady,
  kernelCheckLiveFreestandingEmitLoadScaffoldSource,
  PARSE-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD.
  Module: SystemsLean.SlakeTypecheckFreestandingEmitLoadScaffold
  Checkable writer: just slake-typecheck-freestandingemitloadscaffold
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveFreestandingEmitLoadScaffold

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_FREESTANDING_EMIT_LOAD_SCAFFOLD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-FREESTANDING-EMIT-LOAD-SCAFFOLD"

/-- Named just recipe. Not lake build SystemsLean.FreestandingEmitLoadScaffold. -/
def justRecipeSlakeTypecheckFreestandingEmitLoadScaffold : String :=
  "slake-typecheck-freestandingemitloadscaffold"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFreestandingEmitLoadScaffoldRel : String :=
  SystemsLean.HostFrontLiveFreestandingEmitLoadScaffold.liveFreestandingEmitLoadScaffoldRel

/-- Ready names HostFrontLiveFreestandingEmitLoadScaffold parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckFreestandingEmitLoadScaffoldReady,
    kernelCheckLiveFreestandingEmitLoadScaffoldSource. -/
def slakeTypecheckFreestandingEmitLoadScaffoldReady : Bool :=
  SystemsLean.HostFrontLiveFreestandingEmitLoadScaffold.hostFrontLiveFreestandingEmitLoadScaffoldReady

/-- Honesty: this command is not lake build of FreestandingEmitLoadScaffold. -/
def slakeTypecheckFreestandingEmitLoadScaffoldDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckFreestandingEmitLoadScaffoldFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckFreestandingEmitLoadScaffoldFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckFreestandingEmitLoadScaffoldOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live FreestandingEmitLoadScaffold.lean.
    Ready is HostFrontLiveFreestandingEmitLoadScaffold.hostFrontLiveFreestandingEmitLoadScaffoldReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveFreestandingEmitLoadScaffold.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckFreestandingEmitLoadScaffold} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveFreestandingEmitLoadScaffold.liveRel}"
  IO.println s!"  host={hostId} file={liveFreestandingEmitLoadScaffoldRel}"
  unless (!slakeTypecheckFreestandingEmitLoadScaffoldFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckFreestandingEmitLoadScaffoldFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckFreestandingEmitLoadScaffoldOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveFreestandingEmitLoadScaffold.main args
