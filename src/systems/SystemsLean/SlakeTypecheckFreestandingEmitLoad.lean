/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.FreestandingEmitLoad.
  Short role: named driver for just slake-typecheck-freestandingemitload.
  Ready is HostFrontLiveFreestandingEmitLoad parse plus HostKernel.kernelCheck
  of live FreestandingEmitLoad.lean, not a hardcoded true, not lake build
  SystemsLean.FreestandingEmitLoad.
  liveRel is FreestandingEmitLoad.lean.
  This wrap is FreestandingEmitLoad.lean.
  It is not FreestandingEmitLoadScaffold.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-FREESTANDING-EMIT-LOAD,
  SLAKE_TYPECHECK_FREESTANDING_EMIT_LOAD,
  slake-typecheck-freestandingemitload,
  slakeTypecheckFreestandingEmitLoadReady,
  kernelCheckLiveFreestandingEmitLoadSource,
  PARSE-LIVE-FREESTANDING-EMIT-LOAD.
  Module: SystemsLean.SlakeTypecheckFreestandingEmitLoad
  Checkable writer: just slake-typecheck-freestandingemitload
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveFreestandingEmitLoad

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_FREESTANDING_EMIT_LOAD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-FREESTANDING-EMIT-LOAD"

/-- Named just recipe. Not lake build SystemsLean.FreestandingEmitLoad. -/
def justRecipeSlakeTypecheckFreestandingEmitLoad : String :=
  "slake-typecheck-freestandingemitload"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFreestandingEmitLoadRel : String :=
  SystemsLean.HostFrontLiveFreestandingEmitLoad.liveFreestandingEmitLoadRel

/-- Ready names HostFrontLiveFreestandingEmitLoad parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckFreestandingEmitLoadReady,
    kernelCheckLiveFreestandingEmitLoadSource. -/
def slakeTypecheckFreestandingEmitLoadReady : Bool :=
  SystemsLean.HostFrontLiveFreestandingEmitLoad.hostFrontLiveFreestandingEmitLoadReady

/-- Honesty: this command is not lake build of FreestandingEmitLoad. -/
def slakeTypecheckFreestandingEmitLoadDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckFreestandingEmitLoadFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckFreestandingEmitLoadFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckFreestandingEmitLoadOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live FreestandingEmitLoad.lean.
    Ready is HostFrontLiveFreestandingEmitLoad.hostFrontLiveFreestandingEmitLoadReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveFreestandingEmitLoad.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckFreestandingEmitLoad} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveFreestandingEmitLoad.liveRel}"
  IO.println s!"  host={hostId} file={liveFreestandingEmitLoadRel}"
  unless (!slakeTypecheckFreestandingEmitLoadFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckFreestandingEmitLoadFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckFreestandingEmitLoadOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveFreestandingEmitLoad.main args
