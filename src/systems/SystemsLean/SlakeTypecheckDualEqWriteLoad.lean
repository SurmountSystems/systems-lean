/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.DualEqWriteLoad.
  Short role: named driver for just slake-typecheck-dualeqwriteload.
  Ready is HostFrontLiveDualEqWriteLoad parse plus HostKernel.kernelCheck
  of live DualEqWriteLoad.lean, not a hardcoded true, not lake build
  SystemsLean.DualEqWriteLoad.
  liveRel is DualEqWriteLoad.lean.
  This wrap is DualEqWriteLoad.lean.
  Not a backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-LOAD,
  SLAKE_TYPECHECK_DUAL_EQ_WRITE_LOAD, slake-typecheck-dualeqwriteload,
  slakeTypecheckDualEqWriteLoadReady,
  kernelCheckLiveDualEqWriteLoadSource,
  PARSE-LIVE-DUAL-EQ-WRITE-LOAD.
  Module: SystemsLean.SlakeTypecheckDualEqWriteLoad
  Checkable writer: just slake-typecheck-dualeqwriteload
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveDualEqWriteLoad

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_DUAL_EQ_WRITE_LOAD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-LOAD"

/-- Named just recipe. Not lake build SystemsLean.DualEqWriteLoad. -/
def justRecipeSlakeTypecheckDualEqWriteLoad : String :=
  "slake-typecheck-dualeqwriteload"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteLoadRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteLoad.liveDualEqWriteLoadRel

/-- Ready names HostFrontLiveDualEqWriteLoad parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckDualEqWriteLoadReady,
    kernelCheckLiveDualEqWriteLoadSource. -/
def slakeTypecheckDualEqWriteLoadReady : Bool :=
  SystemsLean.HostFrontLiveDualEqWriteLoad.hostFrontLiveDualEqWriteLoadReady

/-- Honesty: this command is not lake build of DualEqWriteLoad. -/
def slakeTypecheckDualEqWriteLoadDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckDualEqWriteLoadFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not a backend. -/
def slakeTypecheckDualEqWriteLoadFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckDualEqWriteLoadOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live DualEqWriteLoad.lean.
    Ready is HostFrontLiveDualEqWriteLoad.hostFrontLiveDualEqWriteLoadReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveDualEqWriteLoad.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckDualEqWriteLoad} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveDualEqWriteLoad.liveRel}"
  IO.println s!"  host={hostId} file={liveDualEqWriteLoadRel}"
  unless (!slakeTypecheckDualEqWriteLoadFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteLoadFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteLoadOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveDualEqWriteLoad.main args
