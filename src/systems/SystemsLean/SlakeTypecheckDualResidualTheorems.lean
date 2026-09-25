/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.DualResidualTheorems.
  Short role: named driver for just slake-typecheck-dualresidualtheorems.
  Ready is HostFrontLiveDualResidualTheorems parse plus HostKernel.kernelCheck
  of live DualResidualTheorems.lean, not a hardcoded true, not lake build
  SystemsLean.DualResidualTheorems.
  liveRel is DualResidualTheorems.lean.
  Not DualResidual.lean. Not a claim-bool flip. FullHost stays false.
  FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-DUAL-RESIDUAL-THEOREMS,
  SLAKE_TYPECHECK_DUAL_RESIDUAL_THEOREMS, slake-typecheck-dualresidualtheorems,
  slakeTypecheckDualResidualTheoremsReady,
  kernelCheckLiveDualResidualTheoremsSource,
  PARSE-LIVE-DUAL-RESIDUAL-THEOREMS.
  Module: SystemsLean.SlakeTypecheckDualResidualTheorems
  Checkable writer: just slake-typecheck-dualresidualtheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveDualResidualTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_DUAL_RESIDUAL_THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-DUAL-RESIDUAL-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.DualResidualTheorems. -/
def justRecipeSlakeTypecheckDualResidualTheorems : String :=
  "slake-typecheck-dualresidualtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualResidualTheoremsRel : String :=
  SystemsLean.HostFrontLiveDualResidualTheorems.liveDualResidualTheoremsRel

/-- Ready names HostFrontLiveDualResidualTheorems parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckDualResidualTheoremsReady,
    kernelCheckLiveDualResidualTheoremsSource. -/
def slakeTypecheckDualResidualTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveDualResidualTheorems.hostFrontLiveDualResidualTheoremsReady

/-- Honesty: this command is not lake build of DualResidualTheorems. -/
def slakeTypecheckDualResidualTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckDualResidualTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckDualResidualTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckDualResidualTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live DualResidualTheorems.lean.
    Ready is HostFrontLiveDualResidualTheorems.hostFrontLiveDualResidualTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveDualResidualTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckDualResidualTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveDualResidualTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveDualResidualTheoremsRel}"
  unless (!slakeTypecheckDualResidualTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckDualResidualTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckDualResidualTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveDualResidualTheorems.main args
