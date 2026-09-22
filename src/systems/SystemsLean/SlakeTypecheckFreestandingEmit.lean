/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.FreestandingEmit.
  Short role: named driver for the FreestandingEmit closed check.
  Ready is HostFrontLiveFreestandingEmit parse plus HostKernel.kernelCheck
  of live FreestandingEmit.lean, not a hardcoded true, not lake build
  SystemsLean.FreestandingEmit.
  liveRel is FreestandingEmit.lean.
  This wrap is FreestandingEmit.lean. It is not FreestandingEmitLoad.lean.
  It is not FreestandingEmitLoadScaffold.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-EMIT-SSOT,
  DUAL-SSOT-EQUALITY, slakeTypecheckFreestandingEmitReady,
  kernelCheckLiveFreestandingEmitSource.
  Module: SystemsLean.SlakeTypecheckFreestandingEmit
  Checkable writer: lean --run of this driver (no mill; no lake).
-/

import SystemsLean.HostFrontLiveFreestandingEmit

/-- Greppable stage id. Real token in FreestandingEmit.lean. -/
def stageId : String := "HOST-EMIT-SSOT"

/-- Greppable host map id. Real token in FreestandingEmit.lean. -/
def hostId : String := "DUAL-SSOT-EQUALITY"

/-- Named closed-check label. Not lake build SystemsLean.FreestandingEmit. -/
def justRecipeSlakeTypecheckFreestandingEmit : String :=
  "slake-typecheck-freestandingemit"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFreestandingEmitRel : String :=
  SystemsLean.HostFrontLiveFreestandingEmit.liveFreestandingEmitRel

/-- Ready names HostFrontLiveFreestandingEmit parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckFreestandingEmitReady,
    kernelCheckLiveFreestandingEmitSource. -/
def slakeTypecheckFreestandingEmitReady : Bool :=
  SystemsLean.HostFrontLiveFreestandingEmit.hostFrontLiveFreestandingEmitReady

/-- Honesty: this command is not lake build of FreestandingEmit. -/
def slakeTypecheckFreestandingEmitDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckFreestandingEmitFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckFreestandingEmitFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckFreestandingEmitOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live FreestandingEmit.lean.
    Ready is HostFrontLiveFreestandingEmit.hostFrontLiveFreestandingEmitReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveFreestandingEmit.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckFreestandingEmit} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveFreestandingEmit.liveRel}"
  IO.println s!"  host={hostId} file={liveFreestandingEmitRel}"
  unless (!slakeTypecheckFreestandingEmitFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckFreestandingEmitFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckFreestandingEmitOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveFreestandingEmit.main args
